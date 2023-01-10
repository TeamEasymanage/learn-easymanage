package emrest.spring; 
 
import com.querydsl.core.types.dsl.*; 
 
import emrest.spring.EmSearchCriteria;  
import emrest.spring.ErpinventoryvwTblRec;  
 
 
public final class ErpinventoryvwTblRecPredicate { 
 
    private EmSearchCriteria criteria; 
 
    public EmSearchCriteria getCriteria() { 
        return criteria; 
    } 
    public void setCriteria(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public ErpinventoryvwTblRecPredicate(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public BooleanExpression getPredicate() { 
 
        //Using Q classes is easier than PathBuilder 
        //final PathBuilder<ErpinventoryvwTblRec> entityPath = new PathBuilder<>(ErpinventoryvwTblRec.class, "erpinventoryvwTblRec"); 
 
        //key, value, operation 
        String colKey = criteria.getKey(); 
        String colOp = criteria.getOperation(); 
        Object colVal = criteria.getValue(); 
 
        //Q classes are generated at compile time by apt pom -> <classifier>jpa</classifier> 
        QErpinventoryvwTblRec erpinventoryvwTblRec = QErpinventoryvwTblRec.erpinventoryvwTblRec; 
        EmPredicatesHelper pHelper = new EmPredicatesHelper(); 
 
        switch (colKey) { 
            case "invId" : 
            //process long 
            NumberPath<Long> invIdPath = erpinventoryvwTblRec.invId; 
            return pHelper.emGetLongPathExpr(invIdPath, colOp, colVal); 
            case "productId" : 
            //process long 
            NumberPath<Long> productIdPath = erpinventoryvwTblRec.productId; 
            return pHelper.emGetLongPathExpr(productIdPath, colOp, colVal); 
            case "productName" : 
            //process String 
            StringPath productNamePath = erpinventoryvwTblRec.productName; 
            return pHelper.emGetStringPathExpr(productNamePath, colOp, colVal); 
            case "invDate" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> invDatePath = erpinventoryvwTblRec.invDate; 
            return pHelper.emGetDatePathExpr(invDatePath, colOp, colVal); 
            case "invQty" : 
            //process long 
            NumberPath<Long> invQtyPath = erpinventoryvwTblRec.invQty; 
            return pHelper.emGetLongPathExpr(invQtyPath, colOp, colVal); 
            case "invMinQty" : 
            //process long 
            NumberPath<Long> invMinQtyPath = erpinventoryvwTblRec.invMinQty; 
            return pHelper.emGetLongPathExpr(invMinQtyPath, colOp, colVal); 
            case "invCost" : 
            //process float 
            NumberPath<Float> invCostPath = erpinventoryvwTblRec.invCost; 
            return pHelper.emGetFloatPathExpr(invCostPath, colOp, colVal); 
            case "invLocation" : 
            //process String 
            StringPath invLocationPath = erpinventoryvwTblRec.invLocation; 
            return pHelper.emGetStringPathExpr(invLocationPath, colOp, colVal); 
        } 
 
        return null; 
    } 
 
} 
 
