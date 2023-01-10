package emrest.spring; 
 
import com.querydsl.core.types.dsl.*; 
 
import emrest.spring.EmSearchCriteria;  
import emrest.spring.ErpinventoryTblRec;  
 
 
public final class ErpinventoryTblRecPredicate { 
 
    private EmSearchCriteria criteria; 
 
    public EmSearchCriteria getCriteria() { 
        return criteria; 
    } 
    public void setCriteria(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public ErpinventoryTblRecPredicate(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public BooleanExpression getPredicate() { 
 
        //Using Q classes is easier than PathBuilder 
        //final PathBuilder<ErpinventoryTblRec> entityPath = new PathBuilder<>(ErpinventoryTblRec.class, "erpinventoryTblRec"); 
 
        //key, value, operation 
        String colKey = criteria.getKey(); 
        String colOp = criteria.getOperation(); 
        Object colVal = criteria.getValue(); 
 
        //Q classes are generated at compile time by apt pom -> <classifier>jpa</classifier> 
        QErpinventoryTblRec erpinventoryTblRec = QErpinventoryTblRec.erpinventoryTblRec; 
        EmPredicatesHelper pHelper = new EmPredicatesHelper(); 
 
        switch (colKey) { 
            case "invId" : 
            //process long 
            NumberPath<Long> invIdPath = erpinventoryTblRec.invId; 
            return pHelper.emGetLongPathExpr(invIdPath, colOp, colVal); 
            case "productId" : 
            //process long 
            NumberPath<Long> productIdPath = erpinventoryTblRec.productId; 
            return pHelper.emGetLongPathExpr(productIdPath, colOp, colVal); 
            case "invDate" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> invDatePath = erpinventoryTblRec.invDate; 
            return pHelper.emGetDatePathExpr(invDatePath, colOp, colVal); 
            case "invQty" : 
            //process long 
            NumberPath<Long> invQtyPath = erpinventoryTblRec.invQty; 
            return pHelper.emGetLongPathExpr(invQtyPath, colOp, colVal); 
            case "invMinQty" : 
            //process long 
            NumberPath<Long> invMinQtyPath = erpinventoryTblRec.invMinQty; 
            return pHelper.emGetLongPathExpr(invMinQtyPath, colOp, colVal); 
            case "invCost" : 
            //process float 
            NumberPath<Float> invCostPath = erpinventoryTblRec.invCost; 
            return pHelper.emGetFloatPathExpr(invCostPath, colOp, colVal); 
            case "invLocation" : 
            //process String 
            StringPath invLocationPath = erpinventoryTblRec.invLocation; 
            return pHelper.emGetStringPathExpr(invLocationPath, colOp, colVal); 
        } 
 
        return null; 
    } 
 
} 
 
