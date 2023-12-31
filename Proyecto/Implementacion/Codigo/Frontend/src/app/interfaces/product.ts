export interface Product {
    id: number;
    code: string;
    name: string;
    description: string;
    quantity: number;
    price: number;
    pharmacy: {
      id: number;
      name: string;  
    };
    deleted: boolean;
  }

  export class ProductRequest {
    code: string;
    name: string;
    price: number;
    description: string;
    quantity: number;
    pharmacyName: string = "";
    deleted: boolean;

    constructor(code: string, name: string, price: number,  description: string, quantity: number,
      pharmacyName: string){
      this.code = code;
      this.name = name;
      this.quantity = quantity;
      this.description = description;
      this.price = price;
      this.pharmacyName = pharmacyName;
      this.deleted = false;
    }
    
  }

  export class ProductRequestUpdate {
    code: string;
    name: string;
    price: number;
    description: string;

    constructor(code: string, name: string, price: number,  description: string){
      this.code = code;
      this.name = name;
      this.description = description;
      this.price = price;
    }
    
  }
