package emrest.spring; 
 
import com.querydsl.core.types.dsl.*; 
 
import emrest.spring.EmSearchCriteria;  
import emrest.spring.ErpproductTblRec;  
 
 
public final class ErpproductTblRecPredicate { 
 
    private EmSearchCriteria criteria; 
 
    public EmSearchCriteria getCriteria() { 
        return criteria; 
    } 
    public void setCriteria(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public ErpproductTblRecPredicate(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public BooleanExpression getPredicate() { 
 
        //Using Q classes is easier than PathBuilder 
        //final PathBuilder<ErpproductTblRec> entityPath = new PathBuilder<>(ErpproductTblRec.class, "erpproductTblRec"); 
 
        //key, value, operation 
        String colKey = criteria.getKey(); 
        String colOp = criteria.getOperation(); 
        Object colVal = criteria.getValue(); 
 
        //Q classes are generated at compile time by apt pom -> <classifier>jpa</classifier> 
        QErpproductTblRec erpproductTblRec = QErpproductTblRec.erpproductTblRec; 
        EmPredicatesHelper pHelper = new EmPredicatesHelper(); 
 
        switch (colKey) { 
            case "productId" : 
            //process long 
            NumberPath<Long> productIdPath = erpproductTblRec.productId; 
            return pHelper.emGetLongPathExpr(productIdPath, colOp, colVal); 
            case "productName" : 
            //process String 
            StringPath productNamePath = erpproductTblRec.productName; 
            return pHelper.emGetStringPathExpr(productNamePath, colOp, colVal); 
            case "productCategory" : 
            //process String 
            StringPath productCategoryPath = erpproductTblRec.productCategory; 
            return pHelper.emGetStringPathExpr(productCategoryPath, colOp, colVal); 
            case "primarySupplier" : 
            //process String 
            StringPath primarySupplierPath = erpproductTblRec.primarySupplier; 
            return pHelper.emGetStringPathExpr(primarySupplierPath, colOp, colVal); 
            case "productDesc" : 
            //process String 
            StringPath productDescPath = erpproductTblRec.productDesc; 
            return pHelper.emGetStringPathExpr(productDescPath, colOp, colVal); 
        } 
 
        return null; 
    } 
 
} 
 
