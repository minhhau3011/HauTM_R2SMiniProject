package com.test.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Component
public class Roles  implements Serializable{
	@Id
	private String Roleid;
	private String Name;
	@JsonIgnore
	@OneToMany(mappedBy = "role")
	List<Authorities> authorities;    
}