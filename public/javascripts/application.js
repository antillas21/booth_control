TableToolsInit.sSwfPath = "/media/swf/ZeroClipboard.swf";

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
	
	$('#expositores').dataTable({
		"bJQueryUI": true,
		"sDom": '<"H"lTfr>t<"F"ip>',
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
	
	$('#exportable-local').dataTable({
		"bJQueryUI": true,
		"sDom": '<"H"lTfr>t<"F"ip>',
		"sScrollX": "100%",
		"sPaginationType": "full_numbers",
		"aLengthMenu": [[5, 10, 25, 50, 100, 200], [5, 10, 25, 50, 100, 200]],
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
	
	var oTable = $('#exportable').dataTable({
			"bProcessing": true,
			"bServerSide": true,
			"sAjaxSource": "export.json",
			"sScrollX": "100%",
			"bFilter": true,
			"bSort": true,
			"bJQueryUI": true,
			"sPaginationType": "full_numbers",
			"sDom": '<"H"lTfr>t<"F"ip>',
			"aLengthMenu": [[5, 10, 25, 50, 100, 200], [5, 10, 25, 50, 100, 200]],
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
	

	$("#company_profile").counter({
	count: 'down', 
	goal: 420
	});
		
});


$(function() {
		
		$.ajax({
			url: "/booths.xml",
			dataType: "xml",
			success: function( xmlResponse ) {
				var data = $( "booth", xmlResponse ).map(function() {
					return {
						value: $( "booth-number", this ).text(),
						id: $( "id", this ).text()
					};
				}).get();
				$( "#reservation_booth_number" ).autocomplete({
					source: data,
					minLength: 0,
					select: function( event, ui ) {
						
					}
				});
			}
		});
	});


$(function() {
		
		$.ajax({
			url: "/states.xml",
			dataType: "xml",
			success: function( xmlResponse ) {
				var data = $( "state", xmlResponse ).map(function() {
					return {
						value: $( "name", this ).text(),
						id: $( "id", this ).text()
					};
				}).get();
				$( "#office_state_name" ).autocomplete({
					source: data,
					minLength: 0,
					select: function( event, ui ) {
						
					}
				});
			}
		});
	});
	
$(function() {

		$.ajax({
			url: "/countries.xml",
			dataType: "xml",
			success: function( xmlResponse ) {
				var data = $( "country", xmlResponse ).map(function() {
					return {
						value: $( "name", this ).text(),
						id: $( "id", this ).text()
					};
				}).get();
				$( "#office_country_name" ).autocomplete({
					source: data,
					minLength: 0,
					select: function( event, ui ) {

					}
				});
			}
		});
	});
	
