import { waitForAsync, ComponentFixture, TestBed } from '@angular/core/testing'; 
import { ReactiveFormsModule } from '@angular/forms'; 
import { NoopAnimationsModule } from '@angular/platform-browser/animations'; 
import { MatButtonModule } from '@angular/material/button'; 
import { MatCardModule } from '@angular/material/card'; 
import { MatInputModule } from '@angular/material/input'; 
import { MatRadioModule } from '@angular/material/radio'; 
import { MatSelectModule } from '@angular/material/select'; 
 
import { ErpCustomerForm_5003452_C } from './ErpCustomer-form-5003452.component'; 
 
describe('ErpCustomerForm_5003452_C', () => { 
  let component: ErpCustomerForm_5003452_C; 
  let fixture: ComponentFixture<ErpCustomerForm_5003452_C>; 
 
  beforeEach(waitForAsync(() => { 
    TestBed.configureTestingModule({ 
      declarations: [ ErpCustomerForm_5003452_C ], 
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
    fixture = TestBed.createComponent(ErpCustomerForm_5003452_C); 
    component = fixture.componentInstance; 
    fixture.detectChanges(); 
  }); 
 
  it('should compile', () => { 
    expect(component).toBeTruthy(); 
  }); 
}); 
  
