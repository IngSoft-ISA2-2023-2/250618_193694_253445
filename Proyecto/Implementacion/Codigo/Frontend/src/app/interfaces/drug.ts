export interface Drug {
    id: number;
    code: string;
    name: string;
    symptom: string;
    quantity: number;
    price: number;
    stock: number;
    prescription: boolean;
    unitMeasure: string;
    presentation: string;
    pharmacy: {
      id: number;
      name: string;  
    };
  }

  export class DrugRequest {
    code: string;
    name: string;
    symptom: string;
    quantity: number;
    price: number;
    prescription: boolean;
    unitMeasureId: number;
    presentationId: number;
    pharmacyName: string = "";

    constructor(code: string, name: string, symptom: string, quantity: number, price: number, 
      prescription: boolean, unitMeasureId: number, presentationId: number, pharmacyName: string){
      this.code = code;
      this.name = name;
      this.symptom = symptom;
      this.quantity = quantity;
      this.price = price;
      this.prescription = prescription;
      this.unitMeasureId = unitMeasureId;
      this.presentationId = presentationId;
      this.pharmacyName = pharmacyName;
    }
  }

export function instanceOfDrug(object: any){
  return 'id' in object && 'code' in object && 'name' in object && 'symptom' in object && 'quantity' in object
  && 'price' in object && 'stock' in object && 'prescription' in object && 'unitMeasure' in object && "presentation" in object
  && "pharmacy" in object;
}