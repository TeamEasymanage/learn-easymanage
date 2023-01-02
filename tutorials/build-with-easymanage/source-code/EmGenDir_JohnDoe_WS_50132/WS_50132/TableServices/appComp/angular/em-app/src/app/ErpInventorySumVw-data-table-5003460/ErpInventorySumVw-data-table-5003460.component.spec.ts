import { waitForAsync, ComponentFixture, TestBed } from '@angular/core/testing'; 
import { NoopAnimationsModule } from '@angular/platform-browser/animations'; 
import { MatPaginatorModule } from '@angular/material/paginator'; 
import { MatSortModule } from '@angular/material/sort'; 
import { MatTableModule } from '@angular/material/table'; 
 
import { ErpInventorySumVwDataTable_5003460_C } from './ErpInventorySumVw-data-table-5003460.component'; 
 
describe('ErpInventorySumVwDataTable_5003460_C', () => { 
  let component: ErpInventorySumVwDataTable_5003460_C; 
  let fixture: ComponentFixture<ErpInventorySumVwDataTable_5003460_C>; 
 
  beforeEach(waitForAsync(() => { 
    TestBed.configureTestingModule({ 
      declarations: [ ErpInventorySumVwDataTable_5003460_C ], 
      imports: [ 
        NoopAnimationsModule, 
        MatPaginatorModule, 
        MatSortModule, 
        MatTableModule, 
      ] 
    }).compileComponents(); 
  })); 
 
  beforeEach(() => { 
    fixture = TestBed.createComponent(ErpInventorySumVwDataTable_5003460_C); 
    component = fixture.componentInstance; 
    fixture.detectChanges(); 
  }); 
 
  it('should compile', () => { 
    expect(component).toBeTruthy(); 
  }); 
}); 
 
