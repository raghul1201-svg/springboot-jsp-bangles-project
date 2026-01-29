package com.example.demo.controller;

import com.example.demo.service.ProductService; // 🔥 THIS IMPORT
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;

@RestController
@RequestMapping("/api/products")
@CrossOrigin(origins = "*")
public class ProductController {

    @Autowired
    private ProductService productService;

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteProduct(@PathVariable int id) {

        System.out.println("🔥 DELETE API HIT : ID = " + id);

        productService.deleteProduct(id);

        return ResponseEntity.ok("Deleted successfully");
    }

}
