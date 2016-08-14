$('#post_content').each(function() {
    $(this).data('default', this.value);
}).focusin(function() {
    if ( this.value == $(this).data('default') ) {
        this.value = '';
    }
}).focusout(function() {
    if ( this.value == '' ) {
        this.value = $(this).data('default');
    }
});
