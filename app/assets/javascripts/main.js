$(document).ready(function(){
	$(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
  $(document).on("change", '#account_no_js', function(){
  	sale_id = $("#payment_sale_id").val();
  	account_no = $.trim(this.value);
  	if(account_no=='' || this.value == undefined){
  		alert("Invalid Account No");
  	}
  	else{
  		 $.ajax({
	      type: "get",
	      url: "/sales/"+sale_id+"/update_account_no?account_no="+account_no, 
	      // data: {override_price: { price: price, line_item_id: line_item_id, sale_id: sale_id,item_id:item_id }},
	      dataType: "script",
	      success: function() {
	      	console.log('account no updated');
	      }
	    });
  	}
	});
	$(document).on("change", '#item_price_js', function(){
		item_id = this.getAttribute("data-item-id");
		quantity = $(".item_quantity_"+item_id).val();
		price = this.value
		total_price = parseInt(price)*parseInt(quantity);

		if(total_price>0)
		{

			pre_total = $("#item-"+item_id+"-total-price").html();
			diff = parseInt(pre_total)-total_price

			$("#item-"+item_id+"-total-price").html(total_price);
			
			total_amt = price_output2(diff);
			sale_id = $("#saleid").val();
			line_item_id = $("#lineitemid").val();

			$.ajax({
	      type: "POST",
	      url: '/sales/override_price', 
	      data: {override_price: { price: price, line_item_id: line_item_id, sale_id: sale_id,item_id:item_id }},
	      dataType: "script",
	      success: function() {
	      	console.log('price updated');
	      }
	    });
		}
		else{
			alert("Invalid Price");
			this.value=this.defaultValue;
		}
	});

	$(document).on("change", '#item_quantity', function(){
		item_id = this.getAttribute("data-item-id");
		quantity = this.value
			price = $(".item_price_"+item_id).val();
			total_price = parseInt(price)*parseInt(quantity);
		if(total_price>0){

			pre_total = $("#item-"+item_id+"-total-price").html();
			diff = parseInt(pre_total)-total_price

			$("#item-"+item_id+"-total-price").html(total_price);
			
			total_amt = price_output2(diff);
			sale_id = $("#saleid").val();
			// if(sale_id!=undefined && sale_id!=''){
			// 	$.get('/sales/'+sale_id+'/get_sale_obj.js', function(data){
			// 		balance = (parseInt(total_amt) - parseInt(data.total_amount) + parseInt(data.remaining_amount))
			// 			$(".balance").html(balance);
		 //    });
			// }
			$.ajax({
	      type: "POST",
	      url: '/sales/override_quantity',
	      data: {override_quantity: { quantity: quantity, sale_id: sale_id,item_id:item_id }},
	      dataType: "script",
	      success: function() {
	      	console.log('price updated');
	      }
	    });
    }
    else{
    	alert("Quantity invalid");
    	this.value=this.defaultValue;
    }
	});

	$(document).on("change", '#cart_quantity', function(){
		item_id = this.getAttribute("data-item-id");
		quantity = this.value
		$.ajax({
      type: "get",
      url: '/change_cart_qty?item_id='+item_id+'&quantity='+quantity,
      dataType: "script",
      success: function() {
      	console.log('quntity updated');
      }
    });
	});

	$(document).on("click", '#make_payment', function(){
		pay_amount = $("#price_output_paid").val();
		sale_id = $("#payment_sale_id").val();
		if (pay_amount=="" || pay_amount==undefined || parseInt(pay_amount)==0){
			alert('Invalid Amount');
		}
		else{
			$.ajax({
	      type: "POST",
	      url: '/payments/make_payment',
	      data: {payments: { amount: pay_amount, sale_id: sale_id }},
	      dataType: "script",
	      success: function() {
	      	console.log('make payment successfully');
	      }
	    });
		}
	  return false;

	});

	$(document).on("keypress", '.item_search_input', function(){
	  $('.item_search').click();

	});

	$(document).on("change", '.item_category_search_input', function(){
	  $('.item_search').click();
	});

	$(document).on("keypress", '.customer_search_input', function(){
	  $('.customer_search').click();
	});

	$(document).on("change", "#sale_comments_comments", function(){
		$('.sale_comments').click();
	});


	// $(document).on("change", "#line_item_price", function(){
	// 	$.ajax({
 //      type: "POST",
 //      url: '/sales/override_price', //sumbits it to the given url of the form
 //      data: {override_price: { price: $(this).val(), line_item_sku: $(this).parent().parent().find('.line_item_sku').val(), sale_id: $(document).find('.sale_id').html() }},
 //      dataType: "script",
 //      success: function() {
 //      	console.log('price updated');
 //      }
 //    });
 //  	// alert('price');
	// });
	
	$(document).on("change", "#line_item_quantity", function(){
	
		$.ajax({
      type: "POST",
      url: '/sales/override_quantity', //sumbits it to the given url of the form
      data: {override_quantity: { quantity: $(this).val(), line_item_sku: $(this).parent().parent().find('.line_item_sku').val(), sale_id: $(document).find('.sale_id').html() }},
      dataType: "script",
      success: function() {
      	console.log('price updated');
      }
    });
	});

	$(document).on("change", "#sale_discount", function(){
		$.ajax({
      type: "POST",
      url: '/sales/sale_discount', //sumbits it to the given url of the form
      data: {sale_discount: { discount: $(this).val(), sale_id: $(document).find('.sale_id').html() }},
      dataType: "script",
      success: function() {
      	console.log('sale discounted');
      }
    });
  	// alert('price');
	});


	// Jquery form validations
	$(".form_custom_item").validate({
		rules: {
			"custom_item[name]": {required: true },
			"custom_item[price]": {required: true, number: true},
			"custom_item[stock_amount]": {required: true, number: true}
		}
	});

	$(".edit_sale").validate({
		rules: {
			"line_item[price]": {required: true, number: true }
		}
	});

	$("#new_item").validate({
		rules: {
			"item[sku]": {required: true },
			"item[name]": {required: true },
			"item[price]": {required: true, number: true },
			"item[stock_amount]": {required: true, number: true },
			"item[cost_price]": {required: true, number: true }
		}
	});

	$("#new_user").validate({
		rules: {
			"user[email]": {required: true, email: true },
			"user[username]": {required: true },
			"user[password]": {required: true }
		}
	});

	$("#new_customer").validate({
		rules: {
			"customer[first_name]": {required: true },
			// "customer[last_name]": {required: true },
			// "customer[email_address]": {email: true }
		}
	});

	$("#create_custom_customer").validate({
		rules: {
			"custom_customer[first_name]": {required: true },
			"custom_customer[last_name]": {required: true },
			"custom_customer[email_address]": {email: true }
		}
	});

	// creates a line item for a sale
	var input = $('#search_item_name')[0];
	var sale_id = $('#search_sale_id')[0];
	  Awesomplete.$.bind(input, {
		  "awesomplete-selectcomplete": function(evt) {		  	
		   $.ajax({
		      type: "GET",
		      url: '/sales/create_line_item', //sumbits it to the given url of the form
		      data: { item_id: parseInt(input.value.split(".|")[0]), quantity: 1, sale_id: parseInt(sale_id.value)},
		      dataType: "script",
		      success: function() {
		      	// prepare the search box for the new entry
		      	input.value = "";
		      	// console.log('line item created');
		      }
		    });
		  }
		});


	 
	  
	$(document).ready(function(){
	  $(".filter_toggle").click(function(){
	    $(".filter_box").fadeToggle();
	  });
	});

});
function remove_lineitem(line_item) {
	// remove_able_price = $("#item-"+item_id+"-total-price").html(); //total_price of each item after price*quanty
	// console.log(remove_able_price);
	// price_output_pre = $(".price_output").val(); //
	// console.log(price_output_pre);
	// price_output_new = parseInt(price_output_pre)-parseInt(remove_able_price)
	// $(".price_output").val(price_output_new);


	

		sale_id = $("#saleid").val();
		if(sale_id!=undefined && sale_id!=''){
			$.get('/sales/'+sale_id+'/remove_item?line_item_id='+line_item+'.js', function(data){
				
	    });
		} 
		else{
			console.log("Sale id not found");
		}
 	return false;
}





function price_output2(diff) { //used in change price and qty
		price_output_pre = $(".price_output").val();
		if (price_output_pre==""){
		  price_output_pre=0
		}
		price_output_new = parseInt(price_output_pre)-(parseInt(diff))
		$(".price_output").val(price_output_new);
		return price_output_new;
}