package emrest.spring; 
 
import javax.persistence.*; 
import java.util.*; 
import com.fasterxml.jackson.annotation.JsonFormat; 
 
@Entity 
@Table(name = "erp_product") 
public class ErpproductTblRec { 
 
	@Id 
	//@GeneratedValue(strategy = GenerationType.AUTO) // or GenerationType.IDENTITY | GenerationType.SEQUENCE | GenerationType.UUID (With UUID java type, char (36) )
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id") 
	private long productId; 
 
	@Column(name = "product_name") 
	private String productName; 
 
	@Column(name = "product_category") 
	private String productCategory; 
 
	@Column(name = "primary_supplier") 
	private String primarySupplier; 
 
	@Column(name = "product_desc") 
	private String productDesc; 
 
	@Column(name = "product_picture") 
	private byte[] productPicture; 
 
 
public ErpproductTblRec() { 
 
} 
 
public ErpproductTblRec(  
  long productId 
 , String productName 
 , String productCategory 
 , String primarySupplier 
 , String productDesc 
 , byte[] productPicture 
 ) { 
	this.productId = productId; 
	this.productName = productName; 
	this.productCategory = productCategory; 
	this.primarySupplier = primarySupplier; 
	this.productDesc = productDesc; 
	this.productPicture = productPicture; 
} 
 
public long getProductId() { return this.productId; } 
public String getProductName() { return this.productName; } 
public String getProductCategory() { return this.productCategory; } 
public String getPrimarySupplier() { return this.primarySupplier; } 
public String getProductDesc() { return this.productDesc; } 
public byte[] getProductPicture() { return this.productPicture; } 
 
public void setProductId(long productId ) { this.productId = productId; } 
public void setProductName(String productName ) { this.productName = productName; } 
public void setProductCategory(String productCategory ) { this.productCategory = productCategory; } 
public void setPrimarySupplier(String primarySupplier ) { this.primarySupplier = primarySupplier; } 
public void setProductDesc(String productDesc ) { this.productDesc = productDesc; } 
public void setProductPicture(byte[] productPicture ) { this.productPicture = productPicture; } 
 
 
@Override 
public String toString() { 
	return "ErpproductTblRec [ productId = "+this.productId+" ]"; 
} 
 
} 
 
