 
import { DataSource } from '@angular/cdk/collections'; 
import { MatPaginator } from '@angular/material/paginator'; 
import { MatSort } from '@angular/material/sort'; 
import { map } from 'rxjs/operators'; 
import { Observable, of as observableOf, merge } from 'rxjs'; 
 
// Data model type 
export interface ErpInventorySumVwItem { 
  
	year: number; 
	month: number; 
	totalQty: string; 
 
} 
 
// Tip: Replace this with static example data and assign in class, if not calling api  
//const EXAMPLE_DATA: ErpInventorySumVwItem[] = []; 
 
/** 
 * Data source for the ErpInventorySumVw view. This class should 
 * encapsulate all logic for fetching and manipulating the displayed data 
 * (including sorting, pagination, and filtering). 
 */ 
export class ErpInventorySumVwDataSource extends DataSource<ErpInventorySumVwItem> { 
  //data: ErpInventorySumVwItem[] = EXAMPLE_DATA; 
  data: Array<any> = []; 
  paginator: MatPaginator | undefined; 
  sort: MatSort | undefined; 
 
  constructor(data: Array<any>) { 
    super(); 
  	 this.data = data; 
  } 
 
  /** 
   * Connect this data source to the table. The table will only update when 
   * the returned stream emits new items. 
   * @returns A stream of the items to be rendered. 
   */ 
  connect(): Observable<ErpInventorySumVwItem[]> { 
    if (this.paginator && this.sort) { 
      // Combine everything that affects the rendered data into one update 
      // stream for the data-table to consume. 
      return merge(observableOf(this.data), this.paginator.page, this.sort.sortChange) 
        .pipe(map(() => { 
          return this.getPagedData(this.getSortedData([...this.data ])); 
        })); 
    } else { 
      throw Error('Please set the paginator and sort on the data source before connecting.'); 
    } 
  } 
 
  /** 
   *  Called when the table is being destroyed. Use this function, to clean up 
   * any open connections or free any held resources that were set up during connect. 
   */ 
  disconnect(): void {} 
 
  /** 
   * Paginate the data (client-side). If you're using server-side pagination, 
   * this would be replaced by requesting the appropriate data from the server. 
   */ 
  private getPagedData(data: ErpInventorySumVwItem[]): ErpInventorySumVwItem[] { 
    if (this.paginator) { 
      const startIndex = this.paginator.pageIndex * this.paginator.pageSize; 
      return data.splice(startIndex, this.paginator.pageSize); 
    } else { 
      return data; 
    } 
  } 
 
  /** 
   * Sort the data (client-side). If you're using server-side sorting, 
   * this would be replaced by requesting the appropriate data from the server. 
   */ 
  private getSortedData(data: ErpInventorySumVwItem[]): ErpInventorySumVwItem[] { 
    if (!this.sort || !this.sort.active || this.sort.direction === '') { 
      return data; 
    } 
 
    return data.sort((a, b) => { 
      const isAsc = this.sort?.direction === 'asc'; 
		//Fine tune this block with your data model columns  
      switch (this.sort?.active) { 
		case 'year': return compare(+a.year, +b.year,isAsc); 
		case 'month': return compare(+a.month, +b.month,isAsc); 
		case 'totalQty': return compare(a.totalQty, b.totalQty,isAsc); 
      /*  
        case 'strCol': return compare(a.strCol, b.strCol, isAsc); 
        case 'numCol': return compare(+a.numCol, +b.numCol, isAsc); 
      */ 
        default: return 0; 
      } 
      return 0; 
    }); 
  } 
} 
 
/** Simple sort comparator for example ID/Name columns (for client-side sorting). */ 
function compare(a: string | number, b: string | number, isAsc: boolean): number { 
  return (a < b ? -1 : 1) * (isAsc ? 1 : -1); 
} 
  
