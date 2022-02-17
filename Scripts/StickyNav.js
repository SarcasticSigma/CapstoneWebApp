
window.onscroll = function () {
    if (document.readyState === 'complete') {
        myFunction()
    }

    
};

    function myFunction() {

        var navbar = document.getElementById("navbar");
        var sticky = navbar.offsetTop;

        if (window.pageYOffset >= sticky) {
            navbar.classList.add("sticky")
        } else {
            navbar.classList.remove("sticky");
        }

    }
    console.info("Ran")


