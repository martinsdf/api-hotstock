package com.argsnake.hotstock.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Entity(name = "order_product")
public class OrderProduct implements Serializable {

	private static final long serialVersionUID = 145814927119506175L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	@ManyToOne
	@JoinColumn(name="order")
	private Order order;

	@NotEmpty
	@ManyToOne
	@JoinColumn(name="product")
	private Product product;

	@NotEmpty
	private BigDecimal quantity;

	public OrderProduct(Long id) {
		this.id = id;
	}
}
