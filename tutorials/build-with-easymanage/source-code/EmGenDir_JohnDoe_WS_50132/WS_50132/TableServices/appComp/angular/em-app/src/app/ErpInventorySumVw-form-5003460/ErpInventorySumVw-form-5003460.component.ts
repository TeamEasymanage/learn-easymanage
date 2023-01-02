 
import { Component } from '@angular/core'; 
import { FormBuilder, Validators } from '@angular/forms'; 
import { EmService } from '../em-service/em-service'; 
 
@Component({ 
  selector: 'app-ErpInventorySumVw-form-5003460', 
  templateUrl: './ErpInventorySumVw-form-5003460.html', 
  styleUrls: ['./ErpInventorySumVw-form-5003460.css'] 
}) 
export class ErpInventorySumVwForm_5003460_C { 
  ErpInventorySumVwForm_5003460_CForm = this.fb.group({ 
		year : [null, Validators.required], /* long */ 
		month : [null ], /* long */ 
		totalQty : [null ], /* float */ 
 
				/* [null, Validators.compose([ 
						Validators.required, 
						Validators.pattern('^[0-9]+$') 
						Validators.pattern('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$') 
							]) ]  */ 
 }); 
 
  constructor(private fb: FormBuilder, private emService : EmService) {} 
 
  onSubmit(): void { 
	this.emService.POSTRecord( 
			JSON.stringify(this.ErpInventorySumVwForm_5003460_CForm.value), 
			"/erp_inventory_sum_vw/Create") 
		.subscribe(response => { 
				//console.log(response) 
		        console.log("api post call ok"); 
		  		alert('Added!');  
		}); 
 
  } 
} 
 
