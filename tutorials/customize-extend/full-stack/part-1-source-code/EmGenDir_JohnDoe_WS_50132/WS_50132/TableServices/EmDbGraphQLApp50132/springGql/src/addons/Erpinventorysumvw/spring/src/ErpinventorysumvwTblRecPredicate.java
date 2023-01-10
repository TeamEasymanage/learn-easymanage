package emrest.spring; 
 
import com.querydsl.core.types.dsl.*; 
 
import emrest.spring.EmSearchCriteria;  
import emrest.spring.ErpinventorysumvwTblRec;  
 
 
public final class ErpinventorysumvwTblRecPredicate { 
 
    private EmSearchCriteria criteria; 
 
    public EmSearchCriteria getCriteria() { 
        return criteria; 
    } 
    public void setCriteria(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public ErpinventorysumvwTblRecPredicate(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public BooleanExpression getPredicate() { 
 
        //Using Q classes is easier than PathBuilder 
        //final PathBuilder<ErpinventorysumvwTblRec> entityPath = new PathBuilder<>(ErpinventorysumvwTblRec.class, "erpinventorysumvwTblRec"); 
 
        //key, value, operation 
        String colKey = criteria.getKey(); 
        String colOp = criteria.getOperation(); 
        Object colVal = criteria.getValue(); 
 
        //Q classes are generated at compile time by apt pom -> <classifier>jpa</classifier> 
        QErpinventorysumvwTblRec erpinventorysumvwTblRec = QErpinventorysumvwTblRec.erpinventorysumvwTblRec; 
        EmPredicatesHelper pHelper = new EmPredicatesHelper(); 
 
        switch (colKey) { 
            case "year" : 
            //process long 
            NumberPath<Long> yearPath = erpinventorysumvwTblRec.year; 
            return pHelper.emGetLongPathExpr(yearPath, colOp, colVal); 
            case "month" : 
            //process long 
            NumberPath<Long> monthPath = erpinventorysumvwTblRec.month; 
            return pHelper.emGetLongPathExpr(monthPath, colOp, colVal); 
            case "totalQty" : 
            //process float 
            NumberPath<Float> totalQtyPath = erpinventorysumvwTblRec.totalQty; 
            return pHelper.emGetFloatPathExpr(totalQtyPath, colOp, colVal); 
        } 
 
        return null; 
    } 
 
} 
 
