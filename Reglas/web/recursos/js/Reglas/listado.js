$(document).ready(function() {
    var table = $('#example').DataTable();
    var entid = document.getElementById("entid");
    var atrib = document.getElementById("atrib");
    var tip = document.getElementById("tip");
     
    // Event listener to the two range filtering inputs to redraw on input
/*    entid.change( function() {
        table.column(2).search(this.value).draw();
    } );
    atrib.change( function() {
        table.column(3).search(this.value).draw();
    } );
    tip.change( function() {
        table.column(4).search(this.value).draw();
    } );
     */
    $('#entid').change(function(){
       table.column(2).search(entid.value).draw();
    });
    $('#atrib').change(function(){
       table.column(3).search(atrib.value).draw();
    });
    $('#tip').change(function(){
       table.column(4).search(tip.value).draw();
    });
} );

/* Custom filtering function which will search data in column four between two values */
/*
$.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var atrib = $('#atrib').val();
        var entid = $('#entid').val();
        var tip = $('#tip').val();
        return true;
    }
);
*/