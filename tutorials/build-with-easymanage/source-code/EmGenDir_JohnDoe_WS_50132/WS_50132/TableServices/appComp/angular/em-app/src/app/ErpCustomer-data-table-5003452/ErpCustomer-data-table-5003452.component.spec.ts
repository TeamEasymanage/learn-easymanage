import { waitForAsync, ComponentFixture, TestBed } from '@angular/core/testing'; 
import { NoopAnimationsModule } from '@angular/platform-browser/animations'; 
import { MatPaginatorModule } from '@angular/material/paginator'; 
import { MatSortModule } from '@angular/material/sort'; 
import { MatTableModule } from '@angular/material/table'; 
 
import { ErpCustomerDataTable_5003452_C } from './ErpCustomer-data-table-5003452.component'; 
 
describe('ErpCustomerDataTable_5003452_C', () => { 
  let component: ErpCustomerDataTable_5003452_C; 
  let fixture: ComponentFixture<ErpCustomerDataTable_5003452_C>; 
 
  beforeEach(waitForAsync(() => { 
    TestBed.configureTestingModule({ 
      declarations: [ ErpCustomerDataTable_5003452_C ], 
      imports: [ 
        NoopAnimationsModule, 
        MatPaginatorModule, 
        MatSortModule, 
        MatTableModule, 
      ] 
    }).compileComponents(); 
  })); 
 
  beforeEach(() => { 
    fixture = TestBed.createComponent(ErpCustomerDataTable_5003452_C); 
    component = fixture.componentInstance; 
    fixture.detectChanges(); 
  }); 
 
  it('should compile', () => { 
    expect(component).toBeTruthy(); 
  }); 
}); 
 
