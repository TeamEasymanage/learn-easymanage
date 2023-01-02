 
import { Component } from '@angular/core'; 
import { FormBuilder, Validators } from '@angular/forms'; 
import { EmService } from '../em-service/em-service'; 
 
@Component({ 
  selector: 'app-ErpSalesInquiry-form-5003458', 
  templateUrl: './ErpSalesInquiry-form-5003458.html', 
  styleUrls: ['./ErpSalesInquiry-form-5003458.css'] 
}) 
export class ErpSalesInquiryForm_5003458_C { 
  ErpSalesInquiryForm_5003458_CForm = this.fb.group({ 
		dateofinquiry : [null, Validators.required], /* Calendar */ 
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
			JSON.stringify(this.ErpSalesInquiryForm_5003458_CForm.value), 
			"/erp_sales_inquiry/Create") 
		.subscribe(response => { 
				//console.log(response) 
		        console.log("api post call ok"); 
		  		alert('Added!');  
		}); 
 
  } 
} 
 
