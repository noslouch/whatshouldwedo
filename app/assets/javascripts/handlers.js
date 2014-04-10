/*jshint asi:true*/
(function() {
    var buttons = document.getElementById('buttons'),
        ops = {
            timeout: 5000,
            maximumAge: 3000
        },
        ll

    function success(pos) {
       ll = pos.coords.latitude + ',' + pos.coords.longitude
       $.ajax({
            type: 'POST',
            url: document.location.pathname, 
            beforeSend: function beforeSend(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            data: {ll : ll},
            dataType : 'string'
        })
    }

    function err(error) {
        alert('ERROR(' + error.code + '): ' + error.message)
    }

    navigator.geolocation.getCurrentPosition(success, err, ops)
    
    // if (buttons) {
    //  buttons.addEventListener('click', function(e){
    //     e.preventDefault()
    //     $.post(e.target.href, {ll : ll}, function render(d) {
    //         $('#venue').html($(d).html())
    //     })
    // }, false)        
    // }

})()
