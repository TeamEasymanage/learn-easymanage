import { waitForAsync, ComponentFixture, TestBed } from '@angular/core/testing'; 
import { NoopAnimationsModule } from '@angular/platform-browser/animations'; 
import { MatPaginatorModule } from '@angular/material/paginator'; 
import { MatSortModule } from '@angular/material/sort'; 
import { MatTableModule } from '@angular/material/table'; 
 
import { ErpProductDataTable_5003456_C } from './ErpProduct-data-table-5003456.component'; 
 
describe('ErpProductDataTable_5003456_C', () => { 
  let component: ErpProductDataTable_5003456_C; 
  let fixture: ComponentFixture<ErpProductDataTable_5003456_C>; 
 
  beforeEach(waitForAsync(() => { 
    TestBed.configureTestingModule({ 
      declarations: [ ErpProductDataTable_5003456_C ], 
      imports: [ 
        NoopAnimationsModule, 
        MatPaginatorModule, 
        MatSortModule, 
        MatTableModule, 
      ] 
    }).compileComponents(); 
  })); 
 
  beforeEach(() => { 
    fixture = TestBed.createComponent(ErpProductDataTable_5003456_C); 
    component = fixture.componentInstance; 
    fixture.detectChanges(); 
  }); 
 
  it('should compile', () => { 
    expect(component).toBeTruthy(); 
  }); 
}); 
 
