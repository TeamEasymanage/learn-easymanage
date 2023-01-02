 
import { Component } from '@angular/core'; 
import { FormBuilder, Validators } from '@angular/forms'; 
import { EmService } from '../em-service/em-service'; 
 
@Component({ 
  selector: 'app-ErpCustomer-form-5003452', 
  templateUrl: './ErpCustomer-form-5003452.html', 
  styleUrls: ['./ErpCustomer-form-5003452.css'] 
}) 
export class ErpCustomerForm_5003452_C { 
  ErpCustomerForm_5003452_CForm = this.fb.group({ 
		customerId : [null, Validators.required], /* String */ 
		name : [null ], /* String */ 
		phone : [null ], /* String */ 
		mobilePhone : [null ], /* String */ 
		pict : [null ], /* byte[] */ 
		email : [null ], /* String */ 
		website : [null ], /* String */ 
		address : [null ], /* String */ 
		dateofinquiry : [null ], /* Calendar */ 
		requestedqty : [null ], /* long */ 
		reqquoteamt : [null ], /* float */ 
		meetingpreftime : [null ], /* Calendar */ 
		created : [null ], /* Calendar */ 
		updated : [null ], /* Calendar */ 
 
				/* [null, Validators.compose([ 
						Validators.required, 
						Validators.pattern('^[0-9]+$') 
						Validators.pattern('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$') 
							]) ]  */ 
 }); 
 
  constructor(private fb: FormBuilder, private emService : EmService) {} 
 
  onSubmit(): void { 
	this.emService.POSTRecord( 
			JSON.stringify(this.ErpCustomerForm_5003452_CForm.value), 
			"/erp_customer/Create") 
		.subscribe(response => { 
				//console.log(response) 
		        console.log("api post call ok"); 
		  		alert('Added!');  
		}); 
 
  } 
} 
 
