var ordersApp = new Vue({
  el: '#orders',

  data: {
    test: 'testik',
    orders: [],
    opened: {},
    orderStatusOptions: [{"status":"new","title":"Nová", "icon":"ti-star"},
                         {"status":"accepted","title":"Zpracována", "icon":"ti-eye"},
                         {"status":"waiting_for_goods","title":"Čeká na zboží", "icon":"ti-timer"},
                         {"status":"waiting_for_payment","title":"Čeká na platbu", "icon":"ti-money"},
                         {"status":"sent","title":"Odeslána", "icon":"ti-truck"},
                         {"status":"done","title":"Uzavřena", "icon":"ti-check"},
                         {"status":"storno","title":"Stornována", "icon":"ti-close"}],

  },

  mounted: function() {
    this.loadData();
  },

  computed: {
    orderedOrders: function () {
      return _.orderBy(this.orders, 'mgnl:created', 'desc')
    }
  },

  methods: {


    loadData: function(){
      var url = "${cmsfn.link(content)?replace('.html','.json')}";

      this.$http.get(url, {headers: { 'Accept': 'application/json', "Content-Type": "application/json"},responseType: "json"}).then( function(response) {
        if (response.status == 200) {

          var orders = response.body;
          orders.forEach( function(element,index){
            orders[index].orderedItems = [];
            orders[index].dataToUpdate = [];
            for(var i = 0; i < 20; i++){
              if ( element['cart_'+i+'_name'] != null ) {
                orders[index].orderedItems.push({"id": element['cart_'+i+'_id'],
                                        "name": element['cart_'+i+'_name'],
                                        "pcs": element['cart_'+i+'_pcs'],
                                        "price": element['cart_'+i+'_price'],
                                        "variant": element['cart_'+i+'_variant']});
              }
            }
          });

          this.orders = orders;
          console.log("scope",this.orders);
        }

      }, function (response) {
        console.log("error:",response);
      });
    },


    dateOfOrder: function (order){

      var timestamp = order['mgnl:created'];
      var time = moment(timestamp).format("DD-MM-YYYY HH:mm");

      var fromNow =  moment(timestamp).startOf('hour').fromNow();

      return "<span class='fromNow'>" +  fromNow + "</span> - " +  time;
    },


    isotopeOptions: function () {
			var _this = this;
			return {
				layoutMode: 'fitRows',
      	fitRows: {
        	gutter: 10,
          columnWidth: 310
      	},
				// layoutMode: 'masonry',
      	// masonry: {
        // 	gutter: 10,
        //   columnWidth: 300
      	// },
      }
		},
    isotopeArrange: function(){
      this.$refs.cpt.arrange();
    },

    orderStatusIcon: function(order) {
      var _order = order;
      var res = "ti-star";
      var background = "";

      this.orderStatusOptions.forEach( function(element){
        if(element['status'] == _order.status) {
          res = element['icon'];
          status = element['status'];
        }
      });
      order.status = status;
      return res;
    },

    openOrder: function(order) {
      this.opened = order;
      var _this = this;
      setTimeout(function(){
          _this.isotopeArrange();
      }, 210);
    },

    closeOrder: function() {
      this.opened = {};
      var _this = this;
      setTimeout(function(){
          _this.isotopeArrange();
          console.log('arraged');
      }, 210);
    },

    changeOrderStatus: function(order,newStatus){

      if( order['@path'] && newStatus ) {

          var url = "${ctx.contextPath}/.rest/nodes/v1/orders"+order['@path'];

          var allDataTogether = {status: newStatus};

          var mgnl_friendly_json = mgnl_rest_friendly_flatten_only_properties(allDataTogether);

          this.$http.post(url, mgnl_friendly_json, {headers: { 'Accept': 'application/json', "Content-Type": "application/json"},responseType: "json"}).then( function(response) {
                  if (response.status == 200) {
                      console.log("DONE zmena stavu", order, newStatus);
                      this.loadData();
                      this.closeOrder();
                  }
              }, function(response) {
                  console.log("error status",response.status);
              }
          );

      } else {
          console.log("CHYBA zmeny stavu", order,newStatus);
      }
    },

    inputChanged: function(order,prop,event){
      var newValue = event.target.value;
      console.log(newValue);
      // var updated = false;
      // //if(!order.dataToUpdate) order.dataToUpdate = [];
      // //order.dataToUpdate.push({prop:prop,val:newValue});
      //
      // order.dataToUpdate.forEach( function(element,index){
      //     if(element.prop == prop) {
      //       element.val = newValue;
      //       updated = true;
      //     }
      // });
      //
      // if(!updated){
      //   order.dataToUpdate.push({prop:prop,val:newValue});
      // }
      //
      // console.log(this.orders);
    },






  },
  filters: {
    moment: function (date) {
      return moment(date).format('d.M.YY, HH:mm');
    }
  }
});


moment.locale('cs');
