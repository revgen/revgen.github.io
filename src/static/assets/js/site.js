function setTitle(element, text) {
    console.debug(`New title: ${text}`);
    element.innerHTML = text;
};

function pageOnLoad(elementTitleId, defTitleValue) {
    console.debug(`Page loaded: titleElement=${elementTitleId}, titleValue=${defTitleValue}`);
    element = document.getElementById(elementTitleId);
    setTitle(element, defTitleValue);
};
