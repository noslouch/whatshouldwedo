/*jshint asi:true*/
var WN = {}
WN.buttons = document.getElementById('buttons')

WN.enableLinks = function() {
    var links = this.buttons.querySelectorAll('a')

    Array.prototype.forEach.call(links, function(el) {
        el.classList.remove('disabled')
    })
}

WN.locate = function() {
        var ops = {
            timeout: 5000,
            maximumAge: 3000
        },
        ll

    function success(pos) {
        var links = this.buttons.querySelectorAll('a')
        ll = pos.coords.latitude + ',' + pos.coords.longitude

        Array.prototype.forEach.call(links, function(el) {
            el.href = el.origin + '/' + el.pathname.match(/[^/]+/) + '/?ll=' + ll
            el.classList.remove('disabled')
        })
    }

    function err(error) {
        if (error.code === 1) {
            alert("ERROR: Your GPS could not be activated. Please turn on your GPS or allow the site to use your current location.")
        } else {
            alert('ERROR(' + error.code + '): ' + error.message)
        }
    }

    navigator.geolocation.getCurrentPosition(success.bind(this), err, ops)
}

;(function() {
    document.addEventListener('click', function disabled(e) {
        if (e.target.classList.contains('disabled')) {
            e.preventDefault()
        }
    }, false)
})()

