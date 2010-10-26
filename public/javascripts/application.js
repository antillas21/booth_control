$(document).ready( function() {
	// convert .datatable elements to datatables
	$('.datatable').dataTable({
		"bJQueryUI": true,
		"oLanguage": {
			"sProcessing":   "Procesando...",
			"sLengthMenu":   "Mostrar _MENU_ registros",
			"sZeroRecords":  "No se encontraron resultados",
			"sInfo":         "Mostrando desde _START_ hasta _END_ de _TOTAL_ registros",
			"sInfoEmpty":    "Mostrando desde 0 hasta 0 de 0 registros",
			"sInfoFiltered": "(filtrado de _MAX_ registros en total)",
			"sInfoPostFix":  "",
			"sSearch":       "Buscar:",
			"sUrl":          "",
			"oPaginate": {
				"sFirst":    "Primero",
				"sPrevious": "Anterior",
				"sNext":     "Siguiente",
				"sLast":     "Último"
			}
		}
	});
	
	// UI elements ( buttons and standard forms)
	$('.as_button').button();
	$('form select, input:checkbox, input:radio, input:file').uniform();
	
	$('.field_with_errors').addClass('ui-state-error');
});