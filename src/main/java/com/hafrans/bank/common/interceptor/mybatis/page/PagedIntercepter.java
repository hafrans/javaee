package com.hafrans.bank.common.interceptor.mybatis.page;

import java.sql.Connection;
import java.util.Properties;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;


@Intercepts(
		@Signature(
				type=StatementHandler.class,
				method="prepare",
				args={Connection.class,Integer.class}
				)
		)
public class PagedIntercepter implements Interceptor {
		
	
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		
		return invocation.proceed();
	}

	@Override
	public Object plugin(Object target) {
		System.out.println("plugin called , target is "+target.getClass().toString());
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {

	}

}
