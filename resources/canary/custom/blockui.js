$(function () {
    'use strict';

    var section = $('#section-block'),
        sectionBlock = $('.btn-section-block');

    // Section Blocking
    // --------------------------------------------------------------------

    // Default
    if (sectionBlock.length && section.length) {
        sectionBlock.on('load', function () {
            section.block({
                message: '<div class="spinner-border text-white" role="status"></div>',
                timeout: 1000,
                css: {
                    backgroundColor: 'transparent',
                    border: '0'
                },
                overlayCSS: {
                    opacity: 0.5
                }
            });
        });
    }
});