export interface Product {
    id: number;
    code: string;
    name: string;
    description: string;
    price: number;
    pharmacy: {
      id: number;
      name: string;  
    };
  }

  export class ProductRequest {
    code: string;
    name: string;
    price: number;
    description: string;
    pharmacyName: string = "";

    constructor(code: string, name: string, price: number,  description: string,
      pharmacyName: string){
      this.code = code;
      this.name = name;
      this.description = description;
      this.price = price;
      this.pharmacyName = pharmacyName;
    }
  }
