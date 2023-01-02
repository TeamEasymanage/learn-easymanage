 
import { Component } from '@angular/core'; 
import { FormBuilder, Validators } from '@angular/forms'; 
import { EmService } from '../em-service/em-service'; 
 
@Component({ 
  selector: 'app-ErpProduct-form-5003456', 
  templateUrl: './ErpProduct-form-5003456.html', 
  styleUrls: ['./ErpProduct-form-5003456.css'] 
}) 
export class ErpProductForm_5003456_C { 
  ErpProductForm_5003456_CForm = this.fb.group({ 
		productId : [null, Validators.required], /* long */ 
		productName : [null ], /* String */ 
		productCategory : [null ], /* String */ 
		primarySupplier : [null ], /* String */ 
		productDesc : [null ], /* String */ 
		productPicture : [null ], /* byte[] */ 
 
				/* [null, Validators.compose([ 
						Validators.required, 
						Validators.pattern('^[0-9]+$') 
						Validators.pattern('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$') 
							]) ]  */ 
 }); 
 
  constructor(private fb: FormBuilder, private emService : EmService) {} 
 
  onSubmit(): void { 
	this.emService.POSTRecord( 
			JSON.stringify(this.ErpProductForm_5003456_CForm.value), 
			"/erp_product/Create") 
		.subscribe(response => { 
				//console.log(response) 
		        console.log("api post call ok"); 
		  		alert('Added!');  
		}); 
 
  } 
} 
 
