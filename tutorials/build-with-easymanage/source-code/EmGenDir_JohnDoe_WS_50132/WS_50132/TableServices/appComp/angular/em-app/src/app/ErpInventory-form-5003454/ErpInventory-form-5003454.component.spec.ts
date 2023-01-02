import { waitForAsync, ComponentFixture, TestBed } from '@angular/core/testing'; 
import { ReactiveFormsModule } from '@angular/forms'; 
import { NoopAnimationsModule } from '@angular/platform-browser/animations'; 
import { MatButtonModule } from '@angular/material/button'; 
import { MatCardModule } from '@angular/material/card'; 
import { MatInputModule } from '@angular/material/input'; 
import { MatRadioModule } from '@angular/material/radio'; 
import { MatSelectModule } from '@angular/material/select'; 
 
import { ErpInventoryForm_5003454_C } from './ErpInventory-form-5003454.component'; 
 
describe('ErpInventoryForm_5003454_C', () => { 
  let component: ErpInventoryForm_5003454_C; 
  let fixture: ComponentFixture<ErpInventoryForm_5003454_C>; 
 
  beforeEach(waitForAsync(() => { 
    TestBed.configureTestingModule({ 
      declarations: [ ErpInventoryForm_5003454_C ], 
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
    fixture = TestBed.createComponent(ErpInventoryForm_5003454_C); 
    component = fixture.componentInstance; 
    fixture.detectChanges(); 
  }); 
 
  it('should compile', () => { 
    expect(component).toBeTruthy(); 
  }); 
}); 
  
