import { waitForAsync, ComponentFixture, TestBed } from '@angular/core/testing'; 
import { NoopAnimationsModule } from '@angular/platform-browser/animations'; 
import { MatPaginatorModule } from '@angular/material/paginator'; 
import { MatSortModule } from '@angular/material/sort'; 
import { MatTableModule } from '@angular/material/table'; 
 
import { ErpInventoryVwDataTable_5003462_C } from './ErpInventoryVw-data-table-5003462.component'; 
 
describe('ErpInventoryVwDataTable_5003462_C', () => { 
  let component: ErpInventoryVwDataTable_5003462_C; 
  let fixture: ComponentFixture<ErpInventoryVwDataTable_5003462_C>; 
 
  beforeEach(waitForAsync(() => { 
    TestBed.configureTestingModule({ 
      declarations: [ ErpInventoryVwDataTable_5003462_C ], 
      imports: [ 
        NoopAnimationsModule, 
        MatPaginatorModule, 
        MatSortModule, 
        MatTableModule, 
      ] 
    }).compileComponents(); 
  })); 
 
  beforeEach(() => { 
    fixture = TestBed.createComponent(ErpInventoryVwDataTable_5003462_C); 
    component = fixture.componentInstance; 
    fixture.detectChanges(); 
  }); 
 
  it('should compile', () => { 
    expect(component).toBeTruthy(); 
  }); 
}); 
 
