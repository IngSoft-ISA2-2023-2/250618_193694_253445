import { Component, OnInit } from "@angular/core";
import { AbstractControl, FormBuilder, FormControl, FormGroup } from "@angular/forms";
import { CommonService } from "src/app/services/CommonService";
import { ProductRequest, ProductRequestUpdate } from 'src/app/interfaces/product';
import { ProductService } from "src/app/services/product.service";
import { PharmacyService } from "src/app/services/pharmacy.service";
import { RoleService } from "src/app/services/role.service";
import { cilShortText, cilPencil, cilSync } from '@coreui/icons';
import { ActivatedRoute, Router } from "@angular/router";
import { Product } from "src/app/interfaces/product";

@Component({
    selector: 'app-update-product',
    templateUrl: './update-product.component.html',
    styleUrls: ['./update-product.component.css'],
})

export class UpdateProductComponent implements OnInit {
    form: FormGroup | any;
    product: Product | any;

    icons = { cilShortText, cilPencil, cilSync }

    constructor(
        private fb: FormBuilder,
        private productService: ProductService,
        private commonService: CommonService,
        private route: ActivatedRoute) {
            this.form = fb.group({
              productName: new FormControl(),
              productPrice:new FormControl(),
              productCode: new FormControl(),
              productDescription: new FormControl(),
            });
            this.product = null;
        };

    ngOnInit(): void {
        let id = this.route.snapshot.paramMap.get('id');
        this.getProductById(id);
    }

    getProductById(id: any): void {
        this.productService
        .getProductById(id)
        .subscribe((product) => {
            this.product = product;
            console.log(product);
            this.setDefaultProductName(product.name);
            this.setDefaultProductPrice(product.price);
            this.setDefaultProductCode(product.code);
            this.setDefaultProductDescription(product.description);
        })
    }

    setDefaultProductName(productName: string): void {
      this.form.controls.productName.setValue(productName);
    }
    setDefaultProductPrice(productPrice: number): void {
      this.form.controls.productPrice.setValue(productPrice);
    }
    setDefaultProductCode(productCode: string): void {
      this.form.controls.productCode.setValue(productCode);
    }
    setDefaultProductDescription(productDescription: string): void {
      this.form.controls.productDescription.setValue(productDescription);
    }

    get product_name(): AbstractControl {
        return this.form.controls.productName;
    }

    get product_price(): AbstractControl {
        return this.form.controls.productPrice;
    }

    get product_code(): AbstractControl {
        return this.form.controls.productCode;
    }

    get product_description(): AbstractControl {
      return this.form.controls.productDescription;
  }

    get product_id() {
        return Number(this.route.snapshot.paramMap.get('id'));;
    }

    updateProduct(): void {
        let name = this.product_name.value ? this.product_name.value : "";
        let price = this.product_price.value ? this.product_price.value : "";
        let description = this.product_description.value ? this.product_description.value : "";
        let code = this.product_code.value ? this.product_code.value : "";
        let id = this.product_id;

        let productRequest = new ProductRequestUpdate(code, name, price, description);
        this.productService.updateProduct(id, productRequest).subscribe((product) => {
            if (product){
                this.commonService.updateToastData("Success updating product", 'success', 'Product updated.');
            }
        });
    }
}