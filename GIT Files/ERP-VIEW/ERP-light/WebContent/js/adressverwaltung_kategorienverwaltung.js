//Load pageheader
$("#pageheader").load("../partials/header.html", function() {
	$("#adressverwaltung_nav").addClass("active");
});

//append alert message to modal
var pwdError = "<div id='pwdErrorAlert'> <div class='col-sm-5'> <div class='alert alert-danger custom-alert' style='text-align: left;'>Leere Felder vorhanden!</div> </div>  </div>";
	$("#newAlertForm").append(pwdError);

// Get all categories and load into table
function loadTableContent(){

	// show loading spinner
	showLoadingSpinner(true);
	
			$.ajax({
				type : "POST",
				url : "../rest/secure/category/getAllCategories"
			}).done(
					function(data) {
						var c = data;	// return data is already a JSON object

						for ( var e in c) {
							var tableRow = "<tr>" +
								"<td class='hidden'>" + c[e].categoryId + "</td>" +
								"<td>" + c[e].category + "</td>" +
								"<td>" + c[e].description + "</td>" + 
								"</tr>";

							$("#categoryTableBody").append(tableRow);
						}
						// hide loading spinner
						 showLoadingSpinner(false);
					});
};

//Get all organisations and load into table
$(document).ready(loadTableContent());

// Get one category and load it to modal
$("#btn_edit").click(function() {
	
	var rowData = getSelectedRow();
	if (rowData.length == 0)
	{
		showAlertElement(false, "Keine Kategorie auswählt!", 2500);
		return;
	}
	
	$("#modal_title_text").text("Bearbeite Kategorie");

	//hide alert messsage
	$("#newAlertForm").hide();
	
	// load data to modal
	$('#tbx_categoryId').val(rowData[0]);
	$('#tbx_category').val(rowData[1]);
	$('#tbx_description').val(rowData[2]);
	
	$('#new').modal('show');
});

$("#btn_savecategory").click(function() {
	if($("#tbx_category").val() == "")
	{
			$("#newAlertForm").show();
			return;
	}
	
	var newcategory = new Object();
	
	newcategory.categoryId = $("#tbx_categoryId").val();
	newcategory.category = $("#tbx_category").val();
	newcategory.description = $("#tbx_description").val();
	
	$.ajax({
		headers : {
			'Accept' : 'application/json',
			'Content-Type' : 'application/json'
		},
		type : "POST",
		url : "../rest/secure/category/setCategory",	
		contentType: "application/json; charset=utf-8",
	    dataType: "json",
		data : JSON.stringify(newcategory)
	}).done(function(data) {
		if (data) {
			$('#categoryTableBody').empty();
			$('#new').modal('hide');
			
			if (data.success == true)
			{
				showAlertElement(1, data.message, 5000);
			}
			else
			{
				showAlertElement(2, data.message, 5000);
			}
			
			loadTableContent();
		} else {
			alert("Verbindungsproblem mit dem Server");
		}
	});
	return false;
});

$("#btn_new").click(function() {
	$("#modal_title_text").text("Neue Kategorie");
	
	//hide alert messsage
	$("#newAlertForm").hide();
	
	//clear modal
	$('#tbx_categoryId').val("0");
	$('#tbx_category').val("");
	$('#tbx_description').val("");
});

// search filter
$(document).ready(function() {
	(function($) {
		$('#filter').keyup(function() {

			var rex = new RegExp($(this).val(), 'i');
			$('.searchable tr').hide();
			$('.searchable tr').filter(function() {
				return rex.test($(this).text());
			}).show();
		})
	}(jQuery));
});

// disable new, edit and delete buttons
$('#btn_new').hide();
$(".suchfilter").css("margin-left", "0px");
$('#btn_edit').hide();
$('#btn_deleteModal').hide();

// get current user rights
$(document).ready(function() {
	$.ajax({
		type : "POST",
		url : "../rest/secure/person/getCurrentUser"
	}).done(function(data) {
		currentUser = data;		// return data is already JSON
		currentUserRights = currentUser.permission;

		// only when user has admin rights
		if (currentUserRights == "Admin" && currentUserRights != "") {
			$("#btn_new").show();
			$(".suchfilter").css("margin-left", "5px");

			$('#btn_edit').show();
			$('#btn_deleteModal').show();

			$('#btn_edit').prop('disabled', true);
			$('#btn_deleteModal').prop('disabled', true);
		}
	});
});

// this function is used to get the selected row
// the function is called when a button is pressed and the selected entry has to be determined
function getSelectedRow(){
	
	// find selected tr in the table and map it to the variable
	var currentRow = $('#TableHead').find('tr.highlight').first().children("td").map(function() {
		return $(this).text();
	}).get();
	
	return currentRow;
}

$('#TableHead').on('click','tbody tr', function(event) {
//			tableData = $(this).children("td").map(function() {
//				return $(this).text();
//			}).get();

			$(this).addClass('highlight').siblings().removeClass('highlight');

			// only when user has admin rights
			if (currentUserRights == "Admin" && currentUserRights != "") {
				$('#btn_edit').prop('disabled', false);
				$('#btn_deleteModal').prop('disabled', false);
			} 
			else {
				$('#btn_edit').prop('disabled', true);
				$('#btn_deleteModal').prop('disabled', true);
			}
});

/**
 * call the delete modal for the selected category
 */
$("#btn_deleteModal").click(function() {
	
	var rowData = getSelectedRow();
	if (rowData.length == 0)
	{
		showAlertElement(false, "Keine Kategorie auswählt!", 2500);
		return;
	}
	
	var id = rowData[0];
	var name = rowData[1];
	var description = rowData[2];
	 
	$("#label_name_delete").text(name);
	$("#label_description_delete").text(description);
	
	$('#deleteModal').modal('show');
	
	// Get category with id "id"
	$.ajax({
		type : "POST",
		url : "../rest/secure/category/getOrganisationsByCategoryId/" + id
	}).done(function(data) {

		var organisations = data;	// return data is alreay JSON
	
		if (organisations.length>0)
		{
			var organisationString = "";
			
			for (i in organisations)
			{
				organisationString += organisations[i].name;
				if (i < organisations.length-1)
				organisationString += ", "
			}
		
			$("#label_organisations_delete").text(organisationString);
		}
		else
			$("#label_organisations_delete").text("-");
		
	});
});


/**
 * call the delete url for the category
 */
$("#btn_deleteCategory").click(function() {
	
	var rowData = getSelectedRow();
	if (rowData.length == 0)
	{
		showAlertElement(false, "Keine Kategorie auswählt!", 2500);
		return;
	}
	
	 var id = rowData[0];
	 
	 $.ajax({
		 type : "POST",
		 url : "../rest/secure/category/deleteCategoryById/" + id
	 }).done(function(data) {
		 $('#categoryTableBody').empty();
		 $('#deleteModal').modal('hide');
		 
		 if (data.success == true)
			{
				showAlertElement(1, data.message, 5000);
			}
		 else
			{
				showAlertElement(2, data.message, 5000);
			}
		 
		 loadTableContent();
	 });
});
