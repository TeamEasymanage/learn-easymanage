import { waitForAsync, ComponentFixture, TestBed } from '@angular/core/testing'; 
import { ReactiveFormsModule } from '@angular/forms'; 
import { NoopAnimationsModule } from '@angular/platform-browser/animations'; 
import { MatButtonModule } from '@angular/material/button'; 
import { MatCardModule } from '@angular/material/card'; 
import { MatInputModule } from '@angular/material/input'; 
import { MatRadioModule } from '@angular/material/radio'; 
import { MatSelectModule } from '@angular/material/select'; 
 
import { ErpSalesInquiryForm_5003458_C } from './ErpSalesInquiry-form-5003458.component'; 
 
describe('ErpSalesInquiryForm_5003458_C', () => { 
  let component: ErpSalesInquiryForm_5003458_C; 
  let fixture: ComponentFixture<ErpSalesInquiryForm_5003458_C>; 
 
  beforeEach(waitForAsync(() => { 
    TestBed.configureTestingModule({ 
      declarations: [ ErpSalesInquiryForm_5003458_C ], 
      imports: [ 
        NoopAnimationsModule, 
        ReactiveFormsModule, 
        MatButtonModule, 
        MatCardModule, 
        MatInputModule, 
        MatRadioModule, 
        MatSelectModule, 
      ] 
    }).compileComponents(); 
  })); 
 
  beforeEach(() => { 
    fixture = TestBed.createComponent(ErpSalesInquiryForm_5003458_C); 
    component = fixture.componentInstance; 
    fixture.detectChanges(); 
  }); 
 
  it('should compile', () => { 
    expect(component).toBeTruthy(); 
  }); 
}); 
  
