
package com.shell.repository;

import static org.springframework.data.querydsl.QueryDslUtils.QUERY_DSL_PRESENT;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.query.QueryExtractor;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.data.jpa.repository.support.QueryDslJpaRepository;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.core.RepositoryMetadata;
import org.springframework.util.Assert;
/**
 *
 * 日期:2017年1月2日
 *
 * @author Shell
 *
 * Copyright © 2016 Shell. All rights reserved
 */
public class DefaultRepositoryFactory extends JpaRepositoryFactory {

	  private final EntityManager entityManager;
	  private final QueryExtractor extractor;


	  public DefaultRepositoryFactory(EntityManager entityManager) {
	    super(entityManager);
	    Assert.notNull(entityManager);
	    this.entityManager = entityManager;
	    this.extractor = DefaultPersistenceProvider.fromEntityManager(entityManager);
	  }

	  @SuppressWarnings({"unchecked", "rawtypes"})
	  protected <T, ID extends Serializable> SimpleJpaRepository<?, ?> getTargetRepository(
	      RepositoryMetadata metadata, EntityManager entityManager) {

	    Class<?> repositoryInterface = metadata.getRepositoryInterface();

	    JpaEntityInformation<?, Serializable> entityInformation =
	        getEntityInformation(metadata.getDomainType());

	    if (isQueryDslExecutor(repositoryInterface)) {
	      return new QueryDslJpaRepository(entityInformation, entityManager);
	    } else {
	      return new GenericRepositoryImpl(entityInformation, entityManager, repositoryInterface); // custom
	                                                                                               // implementation
	    }
	  }

	  @Override
	  protected Class<?> getRepositoryBaseClass(RepositoryMetadata metadata) {

	    if (isQueryDslExecutor(metadata.getRepositoryInterface())) {
	      return QueryDslJpaRepository.class;
	    } else {
	      return GenericRepositoryImpl.class;
	    }
	  }

	  /**
	   * Returns whether the given repository interface requires a QueryDsl specific implementation to
	   * be chosen.
	   * 
	   * @param repositoryInterface
	   * @return
	   */
	  private boolean isQueryDslExecutor(Class<?> repositoryInterface) {

	    return QUERY_DSL_PRESENT
	        && QueryDslPredicateExecutor.class.isAssignableFrom(repositoryInterface);
	  }
}