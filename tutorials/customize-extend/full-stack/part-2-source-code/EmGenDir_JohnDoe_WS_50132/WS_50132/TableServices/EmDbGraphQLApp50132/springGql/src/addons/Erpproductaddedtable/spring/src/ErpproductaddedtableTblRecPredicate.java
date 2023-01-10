package emrest.spring; 
 
import com.querydsl.core.types.dsl.*; 
 
import emrest.spring.EmSearchCriteria;  
import emrest.spring.ErpproductaddedtableTblRec;  
 
 
public final class ErpproductaddedtableTblRecPredicate { 
 
    private EmSearchCriteria criteria; 
 
    public EmSearchCriteria getCriteria() { 
        return criteria; 
    } 
    public void setCriteria(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public ErpproductaddedtableTblRecPredicate(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public BooleanExpression getPredicate() { 
 
        //Using Q classes is easier than PathBuilder 
        //final PathBuilder<ErpproductaddedtableTblRec> entityPath = new PathBuilder<>(ErpproductaddedtableTblRec.class, "erpproductaddedtableTblRec"); 
 
        //key, value, operation 
        String colKey = criteria.getKey(); 
        String colOp = criteria.getOperation(); 
        Object colVal = criteria.getValue(); 
 
        //Q classes are generated at compile time by apt pom -> <classifier>jpa</classifier> 
        QErpproductaddedtableTblRec erpproductaddedtableTblRec = QErpproductaddedtableTblRec.erpproductaddedtableTblRec; 
        EmPredicatesHelper pHelper = new EmPredicatesHelper(); 
 
        switch (colKey) { 
            case "productId" : 
            //process long 
            NumberPath<Long> productIdPath = erpproductaddedtableTblRec.productId; 
            return pHelper.emGetLongPathExpr(productIdPath, colOp, colVal); 
            case "productName" : 
            //process String 
            StringPath productNamePath = erpproductaddedtableTblRec.productName; 
            return pHelper.emGetStringPathExpr(productNamePath, colOp, colVal); 
            case "productCategory" : 
            //process String 
            StringPath productCategoryPath = erpproductaddedtableTblRec.productCategory; 
            return pHelper.emGetStringPathExpr(productCategoryPath, colOp, colVal); 
            case "primarySupplier" : 
            //process String 
            StringPath primarySupplierPath = erpproductaddedtableTblRec.primarySupplier; 
            return pHelper.emGetStringPathExpr(primarySupplierPath, colOp, colVal); 
            case "productDesc" : 
            //process String 
            StringPath productDescPath = erpproductaddedtableTblRec.productDesc; 
            return pHelper.emGetStringPathExpr(productDescPath, colOp, colVal); 
            case "productAddedColumn" : 
            //process String 
            StringPath productAddedColumnPath = erpproductaddedtableTblRec.productAddedColumn; 
            return pHelper.emGetStringPathExpr(productAddedColumnPath, colOp, colVal); 
        } 
 
        return null; 
    } 
 
} 
 
