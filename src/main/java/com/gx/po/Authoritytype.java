package com.gx.po;
// Generated 2017-11-3 14:43:34 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Authoritytype generated by hbm2java
 */
public class Authoritytype implements java.io.Serializable {

	private Integer authorityTypeId;
	private Authoritytype authoritytypeByClidId;
	private Authoritytype authoritytypeByAuthorityId;
	private String authorityName;
	private Byte ifCancel;
	private Set<Authoritytype> authoritytypesForAuthorityId = new HashSet<Authoritytype>(0);
	private Set<Authoritytype> authoritytypesForClidId = new HashSet<Authoritytype>(0);

	public Authoritytype() {
	}

	public Authoritytype(Authoritytype authoritytypeByClidId, Authoritytype authoritytypeByAuthorityId,
			String authorityName, Byte ifCancel, Set<Authoritytype> authoritytypesForAuthorityId,
			Set<Authoritytype> authoritytypesForClidId) {
		this.authoritytypeByClidId = authoritytypeByClidId;
		this.authoritytypeByAuthorityId = authoritytypeByAuthorityId;
		this.authorityName = authorityName;
		this.ifCancel = ifCancel;
		this.authoritytypesForAuthorityId = authoritytypesForAuthorityId;
		this.authoritytypesForClidId = authoritytypesForClidId;
	}

	public Integer getAuthorityTypeId() {
		return this.authorityTypeId;
	}

	public void setAuthorityTypeId(Integer authorityTypeId) {
		this.authorityTypeId = authorityTypeId;
	}

	public Authoritytype getAuthoritytypeByClidId() {
		return this.authoritytypeByClidId;
	}

	public void setAuthoritytypeByClidId(Authoritytype authoritytypeByClidId) {
		this.authoritytypeByClidId = authoritytypeByClidId;
	}

	public Authoritytype getAuthoritytypeByAuthorityId() {
		return this.authoritytypeByAuthorityId;
	}

	public void setAuthoritytypeByAuthorityId(Authoritytype authoritytypeByAuthorityId) {
		this.authoritytypeByAuthorityId = authoritytypeByAuthorityId;
	}

	public String getAuthorityName() {
		return this.authorityName;
	}

	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}

	public Byte getIfCancel() {
		return this.ifCancel;
	}

	public void setIfCancel(Byte ifCancel) {
		this.ifCancel = ifCancel;
	}

	public Set<Authoritytype> getAuthoritytypesForAuthorityId() {
		return this.authoritytypesForAuthorityId;
	}

	public void setAuthoritytypesForAuthorityId(Set<Authoritytype> authoritytypesForAuthorityId) {
		this.authoritytypesForAuthorityId = authoritytypesForAuthorityId;
	}

	public Set<Authoritytype> getAuthoritytypesForClidId() {
		return this.authoritytypesForClidId;
	}

	public void setAuthoritytypesForClidId(Set<Authoritytype> authoritytypesForClidId) {
		this.authoritytypesForClidId = authoritytypesForClidId;
	}

}
