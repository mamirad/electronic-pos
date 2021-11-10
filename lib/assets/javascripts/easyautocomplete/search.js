 $input_for_items = $("[data-behavior='autocomplete']")
  var options = {
   getValue: function (element) {
        // return element.id+'#'+element.name +'(Rs:'+element.price+')('+(element.stock_amount.to_i)+')'
    return element.id+'#'+element.brand+' '+element.name +'(Rs:'+element.price+') (QTY:'+element.stock_amount+')'
    },
    url: function(phrase) {
      return "/items/auto_search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "items", // list where json response  json.items do
        maxNumberOfElements: 10,
        header: "<strong>item(s)</strong>",
      }
    ],
    list: {
      onChooseEvent: function() {
        var id = $input_for_items.getSelectedItemData().id
          $.get('/sales/create_line_item?item_id='+id+'&quantity=1.js', function(data){
           
        });
        // $input.val("")
        // Turbolinks.visit(url)
      }
    }
  }


  $input_for_customers = $("[data-customer='autocomplete']")
  var options_for_customer = {
   getValue: function (element) {
    return element.full_name_with_phone_city
    },
    url: function(phrase) {
      return "/customers/auto_search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "customers", // list where json response  json.items do
        maxNumberOfElements: 10,
        header: "<strong>Customer(s)</strong>",
      }
    ],
    list: {
      onChooseEvent: function() {
        var id = $input_for_customers.getSelectedItemData().id
          $.get('/sales/create_customer_association?customer_id='+id+'.js', function(data){
        });
      }
    }
  }






  $input_for_customers.easyAutocomplete(options_for_customer)

  $input_for_items.easyAutocomplete(options)

  










