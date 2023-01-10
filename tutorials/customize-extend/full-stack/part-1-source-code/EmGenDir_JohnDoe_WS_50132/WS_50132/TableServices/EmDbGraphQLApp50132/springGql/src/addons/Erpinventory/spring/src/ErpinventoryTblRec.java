package emrest.spring; 
 
import javax.persistence.*; 
import java.util.*; 
import com.fasterxml.jackson.annotation.JsonFormat; 
 
@Entity 
@Table(name = "erp_inventory") 
public class ErpinventoryTblRec { 
 
	@Id 
	//@GeneratedValue(strategy = GenerationType.AUTO) // or GenerationType.IDENTITY | GenerationType.SEQUENCE | GenerationType.UUID (With UUID java type, char (36) ) 
	@Column(name = "inv_id") 
	private long invId; 
 
	@Column(name = "product_id") 
	private long productId; 
 
	@Column(name = "inv_date") 
	@JsonFormat(pattern="yyyy-MM-dd")
	private Calendar invDate; 
 
	@Column(name = "inv_qty") 
	private long invQty; 
 
	@Column(name = "inv_min_qty") 
	private long invMinQty; 
 
	@Column(name = "inv_cost") 
	private float invCost; 
 
	@Column(name = "inv_location") 
	private String invLocation; 
 
 
public ErpinventoryTblRec() { 
 
} 
 
public ErpinventoryTblRec(  
  long invId 
 , long productId 
 , Calendar invDate 
 , long invQty 
 , long invMinQty 
 , float invCost 
 , String invLocation 
 ) { 
	this.invId = invId; 
	this.productId = productId; 
	this.invDate = invDate; 
	this.invQty = invQty; 
	this.invMinQty = invMinQty; 
	this.invCost = invCost; 
	this.invLocation = invLocation; 
} 
 
public long getInvId() { return this.invId; } 
public long getProductId() { return this.productId; } 
public Calendar getInvDate() { return this.invDate; } 
public long getInvQty() { return this.invQty; } 
public long getInvMinQty() { return this.invMinQty; } 
public float getInvCost() { return this.invCost; } 
public String getInvLocation() { return this.invLocation; } 
 
public void setInvId(long invId ) { this.invId = invId; } 
public void setProductId(long productId ) { this.productId = productId; } 
public void setInvDate(Calendar invDate ) { this.invDate = invDate; } 
public void setInvQty(long invQty ) { this.invQty = invQty; } 
public void setInvMinQty(long invMinQty ) { this.invMinQty = invMinQty; } 
public void setInvCost(float invCost ) { this.invCost = invCost; } 
public void setInvLocation(String invLocation ) { this.invLocation = invLocation; } 
 
 
@Override 
public String toString() { 
	return "ErpinventoryTblRec [ invId = "+this.invId+" ]"; 
} 
 
} 
 
