/*=========================================================================================
    File Name: app-user-list.js
    Description: User List page
    --------------------------------------------------------------------------------------
    Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent

==========================================================================================*/
$(function () {
  ('use strict');

  var dtUserTable = $('.players-list-table'),
    select = $('.select2');

  select.each(function () {
    var $this = $(this);
    $this.wrap('<div class="position-relative"></div>');
    $this.select2({
      // the following code is used to disable x-scrollbar when click in select input and
      // take 100% width in responsive also
      dropdownAutoWidth: true,
      width: '100%',
      dropdownParent: $this.parent()
    });
  });



    if (dtUserTable.length) {
      dtUserTable.DataTable({
      //"iDisplayLength": "25",
      order: [[2, 'desc']],
      dom: '<"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6 ps-1"l><"col-sm-12 col-md-6 pe-1"f>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6 ps-1"i><"col-sm-12 col-md-6 pe-1"p>>',
      displayLength: 7,
      lengthMenu: [7, 10, 25, 50, 75, 100],
      //"lengthMenu": [[25, 50, 100, -1], [25, 50, 100, "Todos"]],
      responsive: {
        details: {
          display: $.fn.dataTable.Responsive.display.modal({
            header: function (row) {
              var data = row.data();
              return 'Details of ' + data['full_name'];
            }
          }),
          type: 'column',
          renderer: function (api, rowIdx, columns) {
            var data = $.map(columns, function (col, i) {
              return col.title !== '' // ? Do not show row in modal popup if title is blank (for check box)
                ? '<tr data-dt-row="' +
                    col.rowIdx +
                    '" data-dt-column="' +
                    col.columnIndex +
                    '">' +
                    '<td>' +
                    col.title +
                    ':' +
                    '</td> ' +
                    '<td>' +
                    col.data +
                    '</td>' +
                    '</tr>'
                : '';
            }).join('');

            return data ? $('<table class="table"/>').append('<tbody>' + data + '</tbody>') : false;
          }
        }
      },
      language: {
        //url: '../resources/canary/custom/locales/table-pt.json',
        paginate: {
          // remove previous & next text from pagination
          previous: '&nbsp;',
          next: '&nbsp;'
        }
      }
      
    });
  };


});