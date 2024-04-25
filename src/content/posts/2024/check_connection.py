# #############################################################################
# Simple script to check a connection to url without any third-level packages.
# The script can be using as a standalone script or as a lambda function.
#
# Usage:
#   python check_connection.py <url1> <url2> ... <urlN>
#
# Usage as a lambda:
#   1. Runtime: python 3.8+
#   2. Memory: minimum
#   3. Copy this file to the lambda source directory
#   4. Use "check_connection.lambda_handler" method name as a lambda handler
#   5. You can use a payload with urls to run the lambda:
#       {"urls": ["url1", "url2", "url3",...]}
#
# #############################################################################
from __future__ import annotations
import json
import os
import sys
import logging as pylogging
import urllib.parse
import urllib.request
from typing import Optional, Union


def get_logger(name: Optional[str] = None, level: Union[str, None] = pylogging.INFO,
               message_format: Optional[str] = None):
    logger = pylogging.getLogger(name)
    logger.setLevel(pylogging.DEBUG)
    if os.environ.get("AWS_LAMBDA_FUNCTION_NAME"):
        message_format = message_format or "[%(asctime)s] {%(aws_request_id)s} %(levelname)s %(message)s\n"
        date_format = "%H:%M:%S"
        formatter = pylogging.Formatter(message_format, datefmt=date_format)
        logger.handlers[0].setFormatter(formatter)
    else:
        message_format = message_format or "%(message)s"
        date_format = None
    if not logger.handlers:
        stream_handler = pylogging.StreamHandler()
        formatter = pylogging.Formatter(message_format, datefmt=date_format)
        stream_handler.setFormatter(formatter)
        stream_handler.setLevel(level)
        logger.addHandler(stream_handler)
    return logger

def make_request(logger, method: str, url: str) -> dict:
    status_code = 0
    content = ""
    logger.info(f"Make request to {url}")
    try:
        req = urllib.request.Request(url, method=method)
        logger.info(f"Request: {req}")
        resp = urllib.request.urlopen(req, timeout=5)
        status_code = resp.getcode()
        logger.info(f"Response: [{status_code}]")
        content = resp.read() or ""
        if isinstance(content, (bytearray, bytes)):
            content = content.decode("utf-8")
        content = content.strip()
        logger.info("Content:")
        logger.info(content[:200])
    except urllib.error.HTTPError as ex:
        content = str(ex)
        status_code = int(ex.code)
        logger.error(f"Response exception [{ex}]")
    except urllib.error.URLError as ex:
        content = str(ex)
        status_code = 400
        logger.error(f"Response exception [{ex}]")
    return {
        "url": url,
        "response": {
            "status": status_code,
            "content": content[:200],
        },
    }

def lambda_handler(event: dict, _):
    event = event or {}
    logger = get_logger()
    logger.info(f"START lambda: event={event}")
    urls = event.get("urls") or event.get("url") or os.environ.get("URLS") \
        or os.environ.get("URL") or "https://github.com"
    if not isinstance(urls, list):
        urls = [s for s in [s.strip() for s in str(urls).split(",")] if s]
    result = []
    if urls:
        logger.info(f"Check connection to the urls: {urls}")
        logger.info("-" * 40)
        for url in urls:
            target_url = f"http://{url.lstrip('/')}" if not url.startswith("http") else url
            logger.debug(f"Connect to {target_url}")
            resp = make_request(logger, "GET", str(target_url))
            result.append(resp)
        logger.info("-" * 40)
    else:
        result.append({"response": {"status": 400, "content": "Urls list is empty"}})

    main_status = max([r["response"]["status"] for r in result]) or 500
    logger.info(f"Status={main_status}")
    logger.info(f"END lambda: event={event}")
    lambda_response = {
        "status": main_status,
        "message": "OK" if 200 <= main_status < 300 else "ERROR",
        "data": result,
    }
    logger.info(json.dumps(lambda_response, indent=2))
    return lambda_response

if __name__ == "__main__":
    lambda_handler({"urls": sys.argv[1:]}, {})
