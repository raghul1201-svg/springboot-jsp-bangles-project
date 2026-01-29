package com.example.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.demo.repository.ProductRepository;
import com.example.demo.entity.product;

import java.io.File;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public void deleteProduct(int id) {

        System.out.println("🔥 SERVICE CALLED : ID = " + id);

        product product = productRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Product not found with id " + id));

        productRepository.deleteById(id);

        System.out.println("🔥 PRODUCT DELETED FROM DATABASE");
    }

}
