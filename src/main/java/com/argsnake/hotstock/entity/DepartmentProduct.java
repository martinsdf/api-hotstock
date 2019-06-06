package com.argsnake.hotstock.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
@JsonInclude(JsonInclude.Include.NON_NULL)
@Entity(name="department_product")
public class DepartmentProduct implements Serializable {

	private static final long serialVersionUID = 4576962134172918455L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    @OneToOne
    @JoinColumn(name = "product")
    private Product product;

    @NotEmpty
    @OneToOne
    @JoinColumn(name = "department")
    private Department department;

    @NotEmpty
    private BigDecimal quantity;

    public DepartmentProduct(Long id) {
        this.id = id;
    }
}
