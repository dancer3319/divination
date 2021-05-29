$(function() {
    if (window.PIE) {
        $('.roundedIE').each(function() {
            PIE.attach(this);
        });
    }
});