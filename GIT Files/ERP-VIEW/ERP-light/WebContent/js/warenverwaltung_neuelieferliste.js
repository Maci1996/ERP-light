var modalErrorDriver = "<div id='modalErrorDriverAlert'> <div class='col-sm-5'> <div class='alert alert-danger custom-alert' style='text-align: left;'>Kein Fahrer angegeben!</div> </div>  </div>";
$("#newAlertFormDriver").append(modalErrorDriver);

//load page in specific mode
var global_id;
$(document).ready(function() {
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}
	
	var mode = $.urlParam('mode');
	global_id = $.urlParam('id');
	
	// show loading spinner
	showLoadingSpinner(true);
	
	if(mode == "new"){
		$("#tabtext").text("Neue Lieferliste");
		$("tbx_deliveryListId").val(0);
		loadAllOutgoingDeliveries();
	}
	else if(mode == "edit"){
		$("#tabtext").text("Bearbeite Lieferliste");
		$("#tbx_deliveryListId").val(global_id);
		loadAllOutgoingDeliveries();
		loadDeliveryList(global_id);
	}
});

//init popover
$(function () {
	$('[data-toggle="popover"]').popover()
});

//set comment popover on tbx_comment lost focus event
$("#tbx_comment").focusout(function() {
	$("#tbx_comment_popover").attr("data-content", $("#tbx_comment").val());
});

//init datepicker on load
$('.datepicker').datepicker({
				format: "dd.mm.yyyy",
				weekStart: 1,
				todayBtn: "linked",
				language: "de",
				todayHighlight: true,
				autoclose: true
			});

// Get all available outgoing delivery entries and load into table
// only outgoing deliveries, which are not booked
function loadAllOutgoingDeliveries(){
	
	// show loading spinner
	showLoadingSpinner(true);
	
//	// save organisations into list
//	var organisations;
//	$.ajax({
//		type : "POST",
//		async : false,
//		url : "../rest/secure/organisation/getAllOrganisations"
//	}).done(function(data) {
//		organisations = data;	// already JSON
//	});
	
	$.ajax({
		type : "POST",
		url : "../rest/secure/outgoingDelivery/getAllAvailables"
	}).done(function(data) {
				var out = data;	// already JSON

				for (var e in out) {
					
					//get organisation by id
					var orgId = out[e].organisationId;
					var org;
					
					$.ajax({
						type : "POST",
						async : false,
						url : "../rest/secure/organisation/getOrganisationById/"+orgId
					}).done(function(data) {
						org = data;	// already JSON
					});
					
					//get articles
					var articleString = "";
					var article = out[e].outgoingArticleDTOs;
					for(var i=0; i < out[e].outgoingArticleDTOs.length; i++){
						articleString = articleString + article[i].articleDTO.description;
						
						if(i < out[e].outgoingArticleDTOs.length - 1){
							articleString = articleString + ", ";
						}
					}
					
					var tableRow = "<tr id='"+ out[e].outgoingDeliveryId +"'>" +
						"<td class='hidden'>" + out[e].outgoingDeliveryId + "</td>" +
						"<td class='receiver'>" + org.name + "</td>" +
						"<td class='date'>" + out[e].date + "</td>" +
						"<td class='article'>" + articleString + "</td>" +
						"<td class='comment'>" + out[e].comment + "</td>" +
						"</tr>";

					$("#outgoingDeliveryTableBody").append(tableRow);
				}
				
			// hide loading spinner
			showLoadingSpinner(false);
	});
};

//Load delivery list with specific id
function loadDeliveryList(id){
	
	// show loading spinner
	showLoadingSpinner(true);
	
	$.ajax({
		type : "POST",
		url : "../rest/secure/deliveryList/getById/" + id
	}).done(function(data) {
			var list = data;	// already JSON
			var out = list.outgoingDeliveryDTOs;
	
			//load textboxes
			$("#tbx_driver_hidden").val(list.driver);
			$("#tbx_codriver_hidden").val(list.passenger);
			
			if($("#tbx_codriver_hidden").val() == ""){
				$('#tbx_driver').val("F: " + list.driver);
				$("#tbx_driver_popover").attr("data-content", "Fahrer: " + $("#tbx_driver_hidden").val());
			}
			else{
				$('#tbx_driver').val("F: " + list.driver + ", " + "B: " + list.passenger);
				$("#tbx_driver_popover").attr("data-content", "Fahrer: " + $("#tbx_driver_hidden").val() + "<br>" + "Beifahrer: " + $("#tbx_codriver_hidden").val());
			}
			
			$('#tbx_date').val(list.date);
			$('#tbx_comment').val(list.comment);
			
			//set comment popover
			$("#tbx_comment_popover").attr("data-content", $("#tbx_comment").val());
			
			// sort outgoingDeliveries
			out.sort(function(a, b){
				return a.deliveryNr - b.deliveryNr;
			});
			
			for (var e in out) {
				
				//get organisation by id
				var org;
				$.ajax({
					type : "POST",
					async : false,
					url : "../rest/secure/organisation/getOrganisationById/" + out[e].organisationId
				}).done(function(data) {
					
					org = data;	// already JSON
				});
				
				//get articles
				var articleString = "";
				var article = out[e].outgoingArticleDTOs;
				for(var i=0; i < out[e].outgoingArticleDTOs.length; i++){
					articleString = articleString + article[i].articleDTO.description;
					
					if(i < out[e].outgoingArticleDTOs.length - 1){
						articleString = articleString + ", ";
					}
				}
				
				var tableRow = "<tr id='"+ out[e].outgoingDeliveryId +"'>" +
					"<td class='hidden'>" + out[e].outgoingDeliveryId + "</td>" +
					"<td class='receiver'>" + org.name + "</td>" +
					"<td class='date'>" + out[e].date + "</td>" +
					"<td class='article'>" + articleString + "</td>" +
					"<td class='comment'>" + out[e].comment	+ "</td>" +
					"</tr>";

				$("#deliveryListTableBody").append(tableRow);
			}
			
			// hide loading spinner
			showLoadingSpinner(false);
			
	});
}

//load driver modal
$("#btn_addDriver,#tbx_driver_popover").click(function() {
	$("#tbx_driver_modal").val("");
	$("#tbx_codriver_modal").val("");
	
	$("#newAlertFormDriver").hide();
	$('#chooseDriverModal').modal('show');
});

//save driver to textbox
$("#btn_saveDriver").click(function() {
	var driver = $("#tbx_driver_modal").val();
	var codriver = $("#tbx_codriver_modal").val();
	
	if(driver == "" && codriver == ""){
		$("#newAlertFormDriver").show();
		return;
	}
	else{
		if(codriver == ""){
			$("#tbx_driver").val("F: " + driver);
			$("#tbx_driver_hidden").val(driver);
		}
		else if(driver == ""){
			$("#tbx_driver").val("B: " + codriver);
			$("#tbx_codriver_hidden").val(codriver);
		}
		else{
			$("#tbx_driver").val("F: " + driver + ", " + "B: " + codriver);
			$("#tbx_driver_hidden").val(driver);
			$("#tbx_codriver_hidden").val(codriver);
		}
	}
	
	if($("#tbx_codriver_hidden").val() == ""){
		$("#tbx_driver_popover").attr("data-content", "Fahrer: " + $("#tbx_driver_hidden").val());
	}
	else{
		$("#tbx_driver_popover").attr("data-content", "Fahrer: " + $("#tbx_driver_hidden").val() + "<br>" + "Beifahrer: " + $("#tbx_codriver_hidden").val());
	}
	
	$('#chooseDriverModal').modal('hide');
});

//add outgoing delivery to delivery list
$("#btn_addtodeliverylist").click(function() {
	var id = tableData[0];
	
	var thisRow = $("#" + id).closest('tr');
	$("#deliveryListTableBody").append(thisRow);
	$(thisRow).removeClass("highlight");
});

//remove outgoing delivery from delivery list
$("#btn_removefromdeliverylist").click(function() {
	var id = tableData[0];
	
	var thisRow = $("#" + id).closest('tr');
	$("#outgoingDeliveryTableBody").append(thisRow);
	$(thisRow).removeClass("highlight");
});

//save delivery list
$(document).ready(function() {
$("#btn_savedeliverylist").click(function() {
	var deliveryListid = $('#tbx_deliveryListId').val();	// get deliveryListId from hidden text field
	var driver = $('#tbx_driver_hidden').val();
	var codriver = $("#tbx_codriver_hidden").val();
	var date = $('#tbx_date').val();
	var comment = $('#tbx_comment').val();
					
	// check if all Fields are filled
	if ( (driver=="") || (date=="") )
	{
		showAlertElement(2, "Fahrerteam und Datum sind Pflichtfelder!", 5000);
		return;
	}
	
	// check date for validity
	var regEx = /^(\d{1,2})\.(\d{1,2})\.(\d{4})$/;
	var dateArray = date.match(regEx);
	
	if (dateArray == null)
	{
		showAlertElement(2, "Falsches Datumsformat!", 5000);
		return;
	}
	
	//dispositions in delivery list table
	var dispositions = [];
	// get all articles in the new disposition
	$('#deliveryListTableBody tr').each(function(){
		var rowData = $(this).children('td').map(function(){return $(this).text();});
		dispositions.push(rowData);
	});
	
	if (dispositions.length == 0)
	{
		showAlertElement(2, "Keine Warenausgänge zugewiesen!", 5000);
		return;
	}
	
	var deliveryList = new Object();
	deliveryList.deliveryListId = deliveryListid;
	deliveryList.lastEditorId = 0;
	deliveryList.name = ""; //not used
	deliveryList.date = date;
	deliveryList.comment = comment;
	deliveryList.driver = driver;
	deliveryList.passenger = codriver;
	
	var outgoingDeliveryDTOs = [];
	for (e in dispositions)
	{
		// current article of the mapped article array from the disposition
		var disp = dispositions[e];
		
		var out;
		$.ajax({
			type : "POST",
			async : false,
			url : "../rest/secure/outgoingDelivery/getById/" + disp[0]
		}).done(function(data) {
					out = data;	// already JSON
		});
		
		// set deliveryNr for the delivery within the deliverList
		out.deliveryNr = e;
		outgoingDeliveryDTOs.push(out);
	}
	
	// insert outgoing deliveries array in the delivery list
	deliveryList.outgoingDeliveryDTOs = outgoingDeliveryDTOs;
	
	$.ajax({
		headers : {
			'Accept' : 'application/json',
			'Content-Type' : 'application/json'
		},
		type : "POST",
		url : "../rest/secure/deliveryList/set",
		contentType: "application/json; charset=utf-8",
	    dataType: "json",
		data : JSON.stringify(deliveryList)
	}).done(function(data) {
		if (data) {
			
			if (data.success == true)
			{
				showAlertElement(1, data.message, 5000);
				
				// return to delivery list overview
				location.href="warenverwaltung_lieferlisten.html";
			}
			else
			{
				showAlertElement(2, data.message, 5000);
			}
			
		} else {
			alert("Verbindungsproblem mit dem Server");
		}
		
	});
});
});

//move marked row one row upwards
$("#btn_up").click(function() {
	var id = tableData[0];
	
	var thisRow = $("#" + id).closest('tr');
    var prevRow = thisRow.prev();
    if (prevRow.length) {
        prevRow.before(thisRow);
    }
});

//move marked row one row downwards
$("#btn_down").click(function() {
	var id = tableData[0];
	
	var thisRow = $("#" + id).closest('tr');
    var nextRow = thisRow.next();
    if (nextRow.length) {
        nextRow.after(thisRow);
    }
});

//disable new, edit and delete buttons
$('#btn_addtodeliverylist').hide();
$('#btn_removefromdeliverylist').hide();

// get current user rights
$(document).ready(function() {
	$.ajax({
		type : "POST",
		url : "../rest/secure/person/getCurrentUser"
	}).done(function(data) {
		currentUser = data;	// already JSON
		currentUserRights = currentUser.permission;

		// only when user has admin rights
		if (currentUserRights != "Read" && currentUserRights != "") {
			$('#btn_addtodeliverylist').show();
			$('#btn_removefromdeliverylist').show();

			$('#btn_up').prop('disabled', true);
			$('#btn_down').prop('disabled', true);
			$('#btn_addtodeliverylist').prop('disabled', true);
			$('#btn_removefromdeliverylist').prop('disabled', true);
		}
	});
});

var tableData;
$('#TableHeadOutgoingDelivery').on('click','tbody tr', function(event) {
			tableData = $(this).children("td").map(function() {
				return $(this).text();
			}).get();

			$('tr.highlight').removeClass('highlight');
			$(this).addClass('highlight');
			
			$("*").removeClass("highlight");
			$(this).addClass('highlight').siblings().removeClass('highlight');
			
			$('#btn_up').prop('disabled', true);
			$('#btn_down').prop('disabled', true);

			// only when user has admin rights
			if (currentUserRights != "Read" && currentUserRights != "") {
				$('#btn_addtodeliverylist').prop('disabled', false);
				$('#btn_removefromdeliverylist').prop('disabled', true);
			} 
			else {
				$('#btn_addtodeliverylist').prop('disabled', true);
				$('#btn_removefromdeliverylist').prop('disabled', true);
			}
});

$('#TableHeadDeliveryList').on('click','tbody tr', function(event) {
	tableData = $(this).children("td").map(function() {
		return $(this).text();
	}).get();

	$('tr.highlight').removeClass('highlight');
	$(this).addClass('highlight');
	
	$("*").removeClass("highlight");
	$(this).addClass('highlight').siblings().removeClass('highlight');

	// only when user has admin rights
	if (currentUserRights != "Read" && currentUserRights != "") {
		$('#btn_up').prop('disabled', false);
		$('#btn_down').prop('disabled', false);
		$('#btn_addtodeliverylist').prop('disabled', true);
		$('#btn_removefromdeliverylist').prop('disabled', false);
	} 
	else {
		$('#btn_up').prop('disabled', true);
		$('#btn_down').prop('disabled', true);
		$('#btn_addtodeliverylist').prop('disabled', true);
		$('#btn_removefromdeliverylist').prop('disabled', true);
	}
});

