window.nativeFunctions = {
    handleLink: function(url, title, method) {
        window.webkit.messageHandlers.nativeFunctions.postMessage({ url: url, title: title, method: method });
    },
    handlePost: function(id, category) {
        window.webkit.messageHandlers.nativeFunctions.postMessage({ id: id, category: category });
    }
};
