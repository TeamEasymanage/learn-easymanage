import { waitForAsync, ComponentFixture, TestBed } from '@angular/core/testing'; 
import { ReactiveFormsModule } from '@angular/forms'; 
import { NoopAnimationsModule } from '@angular/platform-browser/animations'; 
import { MatButtonModule } from '@angular/material/button'; 
import { MatCardModule } from '@angular/material/card'; 
import { MatInputModule } from '@angular/material/input'; 
import { MatRadioModule } from '@angular/material/radio'; 
import { MatSelectModule } from '@angular/material/select'; 
 
import { ErpInventoryVwForm_5003462_C } from './ErpInventoryVw-form-5003462.component'; 
 
describe('ErpInventoryVwForm_5003462_C', () => { 
  let component: ErpInventoryVwForm_5003462_C; 
  let fixture: ComponentFixture<ErpInventoryVwForm_5003462_C>; 
 
  beforeEach(waitForAsync(() => { 
    TestBed.configureTestingModule({ 
      declarations: [ ErpInventoryVwForm_5003462_C ], 
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
    fixture = TestBed.createComponent(ErpInventoryVwForm_5003462_C); 
    component = fixture.componentInstance; 
    fixture.detectChanges(); 
  }); 
 
  it('should compile', () => { 
    expect(component).toBeTruthy(); 
  }); 
}); 
  
