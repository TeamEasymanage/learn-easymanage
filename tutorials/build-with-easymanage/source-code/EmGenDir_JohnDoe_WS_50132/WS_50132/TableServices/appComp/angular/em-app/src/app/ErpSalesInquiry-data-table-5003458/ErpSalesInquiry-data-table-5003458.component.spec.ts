import { waitForAsync, ComponentFixture, TestBed } from '@angular/core/testing'; 
import { NoopAnimationsModule } from '@angular/platform-browser/animations'; 
import { MatPaginatorModule } from '@angular/material/paginator'; 
import { MatSortModule } from '@angular/material/sort'; 
import { MatTableModule } from '@angular/material/table'; 
 
import { ErpSalesInquiryDataTable_5003458_C } from './ErpSalesInquiry-data-table-5003458.component'; 
 
describe('ErpSalesInquiryDataTable_5003458_C', () => { 
  let component: ErpSalesInquiryDataTable_5003458_C; 
  let fixture: ComponentFixture<ErpSalesInquiryDataTable_5003458_C>; 
 
  beforeEach(waitForAsync(() => { 
    TestBed.configureTestingModule({ 
      declarations: [ ErpSalesInquiryDataTable_5003458_C ], 
      imports: [ 
        NoopAnimationsModule, 
        MatPaginatorModule, 
        MatSortModule, 
        MatTableModule, 
      ] 
    }).compileComponents(); 
  })); 
 
  beforeEach(() => { 
    fixture = TestBed.createComponent(ErpSalesInquiryDataTable_5003458_C); 
    component = fixture.componentInstance; 
    fixture.detectChanges(); 
  }); 
 
  it('should compile', () => { 
    expect(component).toBeTruthy(); 
  }); 
}); 
 
