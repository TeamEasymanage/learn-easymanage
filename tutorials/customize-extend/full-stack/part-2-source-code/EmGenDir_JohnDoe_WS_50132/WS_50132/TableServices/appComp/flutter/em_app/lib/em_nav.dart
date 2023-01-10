import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart'; 
 
import 'package:em_app/em_lib/em_si_su/signout_page.dart'; 
import 'package:em_app/em_lib/em_si_su/signup_page.dart'; 
import 'package:em_app/em_notifications.dart'; 
import 'package:em_app/main.dart'; 
 
import 'package:em_app/pages/erpcustomer/erpcustomer_data_table.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_form.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_filter.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_dropdown.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_search.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_edit.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_graph.dart'; 
import 'package:em_app/pages/erpinventory/erpinventory_data_table.dart'; 
import 'package:em_app/pages/erpinventory/erpinventory_form.dart'; 
import 'package:em_app/pages/erpinventory/erpinventory_filter.dart'; 
import 'package:em_app/pages/erpinventory/erpinventory_dropdown.dart'; 
import 'package:em_app/pages/erpinventory/erpinventory_search.dart'; 
import 'package:em_app/pages/erpinventory/erpinventory_edit.dart'; 
import 'package:em_app/pages/erpinventory/erpinventory_graph.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_data_table.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_form.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_filter.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_dropdown.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_search.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_edit.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_graph.dart'; 
import 'package:em_app/pages/erpproductaddedtable/erpproductaddedtable_data_table.dart'; 
import 'package:em_app/pages/erpproductaddedtable/erpproductaddedtable_form.dart'; 
import 'package:em_app/pages/erpproductaddedtable/erpproductaddedtable_filter.dart'; 
import 'package:em_app/pages/erpproductaddedtable/erpproductaddedtable_dropdown.dart'; 
import 'package:em_app/pages/erpproductaddedtable/erpproductaddedtable_search.dart'; 
import 'package:em_app/pages/erpproductaddedtable/erpproductaddedtable_edit.dart'; 
import 'package:em_app/pages/erpproductaddedtable/erpproductaddedtable_graph.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_data_table.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_form.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_filter.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_dropdown.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_search.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_edit.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_graph.dart'; 
import 'package:em_app/pages/erpinventorysumvw/erpinventorysumvw_data_table.dart'; 
import 'package:em_app/pages/erpinventorysumvw/erpinventorysumvw_form.dart'; 
import 'package:em_app/pages/erpinventorysumvw/erpinventorysumvw_filter.dart'; 
import 'package:em_app/pages/erpinventorysumvw/erpinventorysumvw_dropdown.dart'; 
import 'package:em_app/pages/erpinventorysumvw/erpinventorysumvw_search.dart'; 
import 'package:em_app/pages/erpinventorysumvw/erpinventorysumvw_edit.dart'; 
import 'package:em_app/pages/erpinventorysumvw/erpinventorysumvw_graph.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_data_table.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_form.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_filter.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_dropdown.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_search.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_edit.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_graph.dart'; 
 
class NavBar extends StatelessWidget { 
  const NavBar({Key? key}) : super(key: key); 
 
  @override 
  Widget build(BuildContext context) { 
    return Drawer( 
      child: ListView( 
        // Remove padding 
        padding: EdgeInsets.zero, 
        children: [ 
          const UserAccountsDrawerHeader( 
            accountName: Text('Your App Name'), 
            accountEmail: Text('email@yourdomain.com'), 
            currentAccountPicture: CircleAvatar( 
              child: ClipOval(child: Icon(Icons.business) 
                //Image.network('', fit: BoxFit.cover, width: 90, height: 90, ), 
                  ), 
            ), 
            decoration: BoxDecoration( 
              color: Colors.blue, 
              //image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('')), 
            ), 
          ), 
 
          ListTile(  
            leading: const Icon(Icons.home_outlined),  
            title: const Text('Dashboard'),  
            onTap: () =>  
                            Navigator.pushAndRemoveUntil( 
                              context, 
                              MaterialPageRoute(  
                                      builder: (context) =>  const MyHomePage(), 
                                    ), 
                              (Route<dynamic> route) => false 
                              ) 
          ),  
          ListTile(  
            leading: const Icon(Icons.table_chart_outlined),  
            title: const Text('Table Menu List'),  
            onTap: () => Scaffold.of(context).openEndDrawer(),  
          ),  
          ListTile(  
            leading: const Icon(Icons.notification_add_outlined),  
            title: const Text('Notifications'),  
            onTap: () => MyNotificationSet().CheckAndNotify(),  
          ),  
          const Divider(),  
          ListTile(  
            leading: const Icon(Icons.settings),  
            title: const Text('Settings'),  
            onTap: () => null,  
          ),  
          const Divider(),  
          ListTile(  
            leading: const Icon(Icons.login_outlined),  
            title: const Text('Sign-Up'),  
            onTap: () => Navigator.of(context).push(MaterialPageRoute(  
    			  builder: (context) =>   const SignUpPage(),  
		      	)),  
          ),  
          ListTile(  
            leading: const Icon(Icons.logout_outlined),  
            title: const Text('Sign-Out'),  
            onTap: () => SignOutEmUser(context),  
          ),  
          const Divider(),  
          ListTile(  
            title: const Text('Exit'),  
            leading: const Icon(Icons.exit_to_app),  
            onTap: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'), 
          ),  
 
        ], 
      ), 
    ); 
  } 
} 
 
class NavBarEnd extends StatelessWidget { 
  const NavBarEnd({Key? key}) : super(key: key); 
 
  @override 
  Widget build(BuildContext context) { 
    return Drawer( 
      child: ListView( 
        // Remove padding 
        padding: EdgeInsets.zero, 
        children: [ 
          const UserAccountsDrawerHeader( 
            accountName: Text('Your App Name'), 
            accountEmail: Text('email@yourdomain.com'), 
            currentAccountPicture: CircleAvatar( 
              child: ClipOval(child: Icon(Icons.business) 
                //Image.network('', fit: BoxFit.cover, width: 90, height: 90, ), 
                  ), 
            ), 
            decoration: BoxDecoration( 
              color: Colors.blue, 
              //image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('')), 
            ), 
          ), 
    // ------------------ Main Screen ------------------ 
		  ListTile( 
			leading: const Icon(Icons.door_sliding_outlined), 
			title: const Text('ErpCustomer List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerDataTable(viewType: "ListView"), 
			)), 
		  ), 
    // ------------------ More Screens ----------------- 
		  ExpansionTile( 
            initiallyExpanded: true, 
            leading: const Icon(Icons.album_outlined), //door_sliding_outlined 
            title: const Text('ErpCustomer Screens', 
              ), 
            //onTap: () => {}, 
            children: [ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.list_alt), 
			title: const Text('ErpCustomer List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerDataTable(viewType: "ListView"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.credit_card), 
			title: const Text('ErpCustomer List Card'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerDataTable(viewType: "ListCard"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.table_view), 
			title: const Text('ErpCustomer Data Table'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerDataTable(), 
			)), 
		  ), 
		  //If Non-Paginated View REQ, if Premium 
		  /* 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_column), 
			title: const Text('ErpCustomer List View (Full Data)'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerDataTable(viewType: "ListView", pageNo: -1,), 
			)), 
		  ), 
		  */ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.manage_search_outlined), 
			title: const Text('ErpCustomer Filter'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerFilter(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.add_circle_rounded), 
			title: const Text('ErpCustomer Input Form'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerForm(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.arrow_drop_down_circle_outlined), 
			title: const Text('ErpCustomer DropDown Only'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerOnlyDd(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_agenda_outlined), 
			title: const Text('ErpCustomer DropDown and Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerEditDd( 
					customerIdSelected: "Select A Key Value", //Or Pass existing Value, to be shown selected 
					), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.search_sharp), 
			title: const Text('ErpCustomer Search'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerSearch(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.auto_graph), 
			title: const Text('ErpCustomer Graph'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerGraph(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.edit), 
			title: const Text('ErpCustomer Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpCustomerEdit( 
					customerIdSelected: "", //Pass Value of Record to be shown in edit mode 
					), 
			)), 
		  ), 
		  ], 
		  ), //ExpansionTile 
		  const Divider(), 
    // ------------------ Main Screen ------------------ 
		  ListTile( 
			leading: const Icon(Icons.door_sliding_outlined), 
			title: const Text('ErpInventory List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryDataTable(viewType: "ListView"), 
			)), 
		  ), 
    // ------------------ More Screens ----------------- 
		  ExpansionTile( 
            leading: const Icon(Icons.album_outlined), //door_sliding_outlined 
            title: const Text('ErpInventory Screens', 
              ), 
            //onTap: () => {}, 
            children: [ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.list_alt), 
			title: const Text('ErpInventory List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryDataTable(viewType: "ListView"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.credit_card), 
			title: const Text('ErpInventory List Card'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryDataTable(viewType: "ListCard"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.table_view), 
			title: const Text('ErpInventory Data Table'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryDataTable(), 
			)), 
		  ), 
		  //If Non-Paginated View REQ, if Premium 
		  /* 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_column), 
			title: const Text('ErpInventory List View (Full Data)'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryDataTable(viewType: "ListView", pageNo: -1,), 
			)), 
		  ), 
		  */ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.manage_search_outlined), 
			title: const Text('ErpInventory Filter'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryFilter(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.add_circle_rounded), 
			title: const Text('ErpInventory Input Form'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryForm(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.arrow_drop_down_circle_outlined), 
			title: const Text('ErpInventory DropDown Only'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryOnlyDd(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_agenda_outlined), 
			title: const Text('ErpInventory DropDown and Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryEditDd( 
					invIdSelected: 0, //Or Pass existing Value, to be shown selected 
					), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.search_sharp), 
			title: const Text('ErpInventory Search'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySearch(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.auto_graph), 
			title: const Text('ErpInventory Graph'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryGraph(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.edit), 
			title: const Text('ErpInventory Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryEdit( 
					invIdSelected: 0, //Pass Value of Record to be shown in edit mode 
					), 
			)), 
		  ), 
		  ], 
		  ), //ExpansionTile 
		  const Divider(), 
    // ------------------ Main Screen ------------------ 
		  ListTile( 
			leading: const Icon(Icons.door_sliding_outlined), 
			title: const Text('ErpProduct List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductDataTable(viewType: "ListView"), 
			)), 
		  ), 
    // ------------------ More Screens ----------------- 
		  ExpansionTile( 
            leading: const Icon(Icons.album_outlined), //door_sliding_outlined 
            title: const Text('ErpProduct Screens', 
              ), 
            //onTap: () => {}, 
            children: [ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.list_alt), 
			title: const Text('ErpProduct List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductDataTable(viewType: "ListView"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.credit_card), 
			title: const Text('ErpProduct List Card'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductDataTable(viewType: "ListCard"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.table_view), 
			title: const Text('ErpProduct Data Table'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductDataTable(), 
			)), 
		  ), 
		  //If Non-Paginated View REQ, if Premium 
		  /* 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_column), 
			title: const Text('ErpProduct List View (Full Data)'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductDataTable(viewType: "ListView", pageNo: -1,), 
			)), 
		  ), 
		  */ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.manage_search_outlined), 
			title: const Text('ErpProduct Filter'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductFilter(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.add_circle_rounded), 
			title: const Text('ErpProduct Input Form'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductForm(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.arrow_drop_down_circle_outlined), 
			title: const Text('ErpProduct DropDown Only'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductOnlyDd(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_agenda_outlined), 
			title: const Text('ErpProduct DropDown and Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductEditDd( 
					productIdSelected: 0, //Or Pass existing Value, to be shown selected 
					), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.search_sharp), 
			title: const Text('ErpProduct Search'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductSearch(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.auto_graph), 
			title: const Text('ErpProduct Graph'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductGraph(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.edit), 
			title: const Text('ErpProduct Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductEdit( 
					productIdSelected: 0, //Pass Value of Record to be shown in edit mode 
					), 
			)), 
		  ), 
		  ], 
		  ), //ExpansionTile 
		  const Divider(), 
    // ------------------ Main Screen ------------------ 
		  ListTile( 
			leading: const Icon(Icons.door_sliding_outlined), 
			title: const Text('ErpProductAddedTable List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableDataTable(viewType: "ListView"), 
			)), 
		  ), 
    // ------------------ More Screens ----------------- 
		  ExpansionTile( 
            leading: const Icon(Icons.album_outlined), //door_sliding_outlined 
            title: const Text('ErpProductAddedTable Screens', 
              ), 
            //onTap: () => {}, 
            children: [ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.list_alt), 
			title: const Text('ErpProductAddedTable List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableDataTable(viewType: "ListView"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.credit_card), 
			title: const Text('ErpProductAddedTable List Card'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableDataTable(viewType: "ListCard"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.table_view), 
			title: const Text('ErpProductAddedTable Data Table'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableDataTable(), 
			)), 
		  ), 
		  //If Non-Paginated View REQ, if Premium 
		  /* 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_column), 
			title: const Text('ErpProductAddedTable List View (Full Data)'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableDataTable(viewType: "ListView", pageNo: -1,), 
			)), 
		  ), 
		  */ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.manage_search_outlined), 
			title: const Text('ErpProductAddedTable Filter'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableFilter(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.add_circle_rounded), 
			title: const Text('ErpProductAddedTable Input Form'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableForm(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.arrow_drop_down_circle_outlined), 
			title: const Text('ErpProductAddedTable DropDown Only'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableOnlyDd(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_agenda_outlined), 
			title: const Text('ErpProductAddedTable DropDown and Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableEditDd( 
					productIdSelected: 0, //Or Pass existing Value, to be shown selected 
					), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.search_sharp), 
			title: const Text('ErpProductAddedTable Search'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableSearch(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.auto_graph), 
			title: const Text('ErpProductAddedTable Graph'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableGraph(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.edit), 
			title: const Text('ErpProductAddedTable Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpProductAddedTableEdit( 
					productIdSelected: 0, //Pass Value of Record to be shown in edit mode 
					), 
			)), 
		  ), 
		  ], 
		  ), //ExpansionTile 
		  const Divider(), 
    // ------------------ Main Screen ------------------ 
		  ListTile( 
			leading: const Icon(Icons.door_sliding_outlined), 
			title: const Text('ErpSalesInquiry List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryDataTable(viewType: "ListView"), 
			)), 
		  ), 
    // ------------------ More Screens ----------------- 
		  ExpansionTile( 
            leading: const Icon(Icons.album_outlined), //door_sliding_outlined 
            title: const Text('ErpSalesInquiry Screens', 
              ), 
            //onTap: () => {}, 
            children: [ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.list_alt), 
			title: const Text('ErpSalesInquiry List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryDataTable(viewType: "ListView"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.credit_card), 
			title: const Text('ErpSalesInquiry List Card'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryDataTable(viewType: "ListCard"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.table_view), 
			title: const Text('ErpSalesInquiry Data Table'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryDataTable(), 
			)), 
		  ), 
		  //If Non-Paginated View REQ, if Premium 
		  /* 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_column), 
			title: const Text('ErpSalesInquiry List View (Full Data)'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryDataTable(viewType: "ListView", pageNo: -1,), 
			)), 
		  ), 
		  */ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.manage_search_outlined), 
			title: const Text('ErpSalesInquiry Filter'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryFilter(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.add_circle_rounded), 
			title: const Text('ErpSalesInquiry Input Form'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryForm(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.arrow_drop_down_circle_outlined), 
			title: const Text('ErpSalesInquiry DropDown Only'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryOnlyDd(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_agenda_outlined), 
			title: const Text('ErpSalesInquiry DropDown and Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryEditDd( 
					dateofinquirySelected: "Select A Key Value", //Or Pass existing Value, to be shown selected 
					), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.search_sharp), 
			title: const Text('ErpSalesInquiry Search'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquirySearch(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.auto_graph), 
			title: const Text('ErpSalesInquiry Graph'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryGraph(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.edit), 
			title: const Text('ErpSalesInquiry Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpSalesInquiryEdit( 
					dateofinquirySelected: "", //Pass Value of Record to be shown in edit mode 
					), 
			)), 
		  ), 
		  ], 
		  ), //ExpansionTile 
		  const Divider(), 
    // ------------------ Main Screen ------------------ 
		  ListTile( 
			leading: const Icon(Icons.door_sliding_outlined), 
			title: const Text('ErpInventorySumVw List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwDataTable(viewType: "ListView"), 
			)), 
		  ), 
    // ------------------ More Screens ----------------- 
		  ExpansionTile( 
            leading: const Icon(Icons.album_outlined), //door_sliding_outlined 
            title: const Text('ErpInventorySumVw Screens', 
              ), 
            //onTap: () => {}, 
            children: [ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.list_alt), 
			title: const Text('ErpInventorySumVw List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwDataTable(viewType: "ListView"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.credit_card), 
			title: const Text('ErpInventorySumVw List Card'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwDataTable(viewType: "ListCard"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.table_view), 
			title: const Text('ErpInventorySumVw Data Table'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwDataTable(), 
			)), 
		  ), 
		  //If Non-Paginated View REQ, if Premium 
		  /* 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_column), 
			title: const Text('ErpInventorySumVw List View (Full Data)'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwDataTable(viewType: "ListView", pageNo: -1,), 
			)), 
		  ), 
		  */ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.manage_search_outlined), 
			title: const Text('ErpInventorySumVw Filter'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwFilter(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.add_circle_rounded), 
			title: const Text('ErpInventorySumVw Input Form'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwForm(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.arrow_drop_down_circle_outlined), 
			title: const Text('ErpInventorySumVw DropDown Only'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwOnlyDd(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_agenda_outlined), 
			title: const Text('ErpInventorySumVw DropDown and Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwEditDd( 
					yearSelected: 0, //Or Pass existing Value, to be shown selected 
					), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.search_sharp), 
			title: const Text('ErpInventorySumVw Search'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwSearch(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.auto_graph), 
			title: const Text('ErpInventorySumVw Graph'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwGraph(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.edit), 
			title: const Text('ErpInventorySumVw Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventorySumVwEdit( 
					yearSelected: 0, //Pass Value of Record to be shown in edit mode 
					), 
			)), 
		  ), 
		  ], 
		  ), //ExpansionTile 
		  const Divider(), 
    // ------------------ Main Screen ------------------ 
		  ListTile( 
			leading: const Icon(Icons.door_sliding_outlined), 
			title: const Text('ErpInventoryVw List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwDataTable(viewType: "ListView"), 
			)), 
		  ), 
    // ------------------ More Screens ----------------- 
		  ExpansionTile( 
            leading: const Icon(Icons.album_outlined), //door_sliding_outlined 
            title: const Text('ErpInventoryVw Screens', 
              ), 
            //onTap: () => {}, 
            children: [ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.list_alt), 
			title: const Text('ErpInventoryVw List View'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwDataTable(viewType: "ListView"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.credit_card), 
			title: const Text('ErpInventoryVw List Card'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwDataTable(viewType: "ListCard"), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.table_view), 
			title: const Text('ErpInventoryVw Data Table'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwDataTable(), 
			)), 
		  ), 
		  //If Non-Paginated View REQ, if Premium 
		  /* 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_column), 
			title: const Text('ErpInventoryVw List View (Full Data)'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwDataTable(viewType: "ListView", pageNo: -1,), 
			)), 
		  ), 
		  */ 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.manage_search_outlined), 
			title: const Text('ErpInventoryVw Filter'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwFilter(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.add_circle_rounded), 
			title: const Text('ErpInventoryVw Input Form'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwForm(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.arrow_drop_down_circle_outlined), 
			title: const Text('ErpInventoryVw DropDown Only'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwOnlyDd(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.view_agenda_outlined), 
			title: const Text('ErpInventoryVw DropDown and Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwEditDd( 
					invIdSelected: 0, //Or Pass existing Value, to be shown selected 
					), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.search_sharp), 
			title: const Text('ErpInventoryVw Search'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwSearch(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.auto_graph), 
			title: const Text('ErpInventoryVw Graph'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwGraph(), 
			)), 
		  ), 
		  ListTile( 
			horizontalTitleGap: 3, 
			contentPadding: const EdgeInsets.symmetric(horizontal: 40.0), 
			leading: const Icon(Icons.edit), 
			title: const Text('ErpInventoryVw Edit'), 
			onTap: () => Navigator.of(context).push(MaterialPageRoute( 
			  builder: (context) => const ErpInventoryVwEdit( 
					invIdSelected: 0, //Pass Value of Record to be shown in edit mode 
					), 
			)), 
		  ), 
		  ], 
		  ), //ExpansionTile 
		  const Divider(), 
        ], 
      ), 
    ); 
  } 
} 
 
