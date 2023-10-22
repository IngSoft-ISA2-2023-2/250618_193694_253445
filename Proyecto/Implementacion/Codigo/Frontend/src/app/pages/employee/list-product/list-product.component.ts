import { Component, OnInit } from '@angular/core';
import { cilCheckAlt, cilSync, cilX } from '@coreui/icons';
import { ProductService } from '../../../services/product.service';
import { Product } from '../../../interfaces/product';
import { CommonService } from '../../../services/CommonService';
import { Router } from "@angular/router";

@Component({
  selector: 'app-list-product',
  templateUrl: './list-product.component.html',
  styleUrls: ['./list-product.component.css'],
})
export class ListProductComponent implements OnInit {
  products: Product[] = [];

    icons = { cilSync };

  constructor(
    private commonService: CommonService,
    private productService: ProductService,
    private route: Router,
  ) {}

  ngOnInit(): void {
    this.getProductsByUser();
  }

  getProductsByUser() {
    this.productService.getProductsByUser().subscribe((p: any) => (this.products = p));
  }

  update(id: number): void {
    this.route.navigate(['employee/update-product', 
    { id: id }])
    }
}
