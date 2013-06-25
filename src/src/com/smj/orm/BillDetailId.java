package com.smj.orm;



/**
 * BillDetailId entity. @author MyEclipse Persistence Tools
 */

public class BillDetailId  implements java.io.Serializable {


    // Fields    

     private Integer storeId;
     private Integer billId;


    // Constructors

    /** default constructor */
    public BillDetailId() {
    }

    
    /** full constructor */
    public BillDetailId(Integer storeId, Integer billId) {
        this.storeId = storeId;
        this.billId = billId;
    }

   
    // Property accessors

    public Integer getStoreId() {
        return this.storeId;
    }
    
    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getBillId() {
        return this.billId;
    }
    
    public void setBillId(Integer billId) {
        this.billId = billId;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof BillDetailId) ) return false;
		 BillDetailId castOther = ( BillDetailId ) other; 
         
		 return ( (this.getStoreId()==castOther.getStoreId()) || ( this.getStoreId()!=null && castOther.getStoreId()!=null && this.getStoreId().equals(castOther.getStoreId()) ) )
 && ( (this.getBillId()==castOther.getBillId()) || ( this.getBillId()!=null && castOther.getBillId()!=null && this.getBillId().equals(castOther.getBillId()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getStoreId() == null ? 0 : this.getStoreId().hashCode() );
         result = 37 * result + ( getBillId() == null ? 0 : this.getBillId().hashCode() );
         return result;
   }   





}