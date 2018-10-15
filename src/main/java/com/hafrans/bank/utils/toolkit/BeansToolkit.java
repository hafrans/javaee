package com.hafrans.bank.utils.toolkit;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;


/*
 * Copyright 2018 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Hafrans BeansToolkit.
 * 
 * 
 * @author Plex
 *
 */
public final class BeansToolkit {

	public static <T> T populate(T obj,T objTarget) throws ReflectiveOperationException {
		@SuppressWarnings("unchecked")
		Class<T> clazz = (Class<T>) obj.getClass();
		try {
			if(objTarget == null)
				objTarget = clazz.newInstance();
			BeanInfo info = Introspector.getBeanInfo(clazz);
			PropertyDescriptor[] propertyDescriptors = info.getPropertyDescriptors();
			for (PropertyDescriptor propertyDescriptor : propertyDescriptors) {
				if("class".contentEquals(propertyDescriptor.getName()))
					continue;
				Object objtmp = propertyDescriptor.getReadMethod().invoke(obj);
				if(objtmp == null || objtmp.toString().isEmpty() )
					continue;
				propertyDescriptor.getWriteMethod().invoke(objTarget, propertyDescriptor.getReadMethod().invoke(obj));
			}

		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
			throw e;
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}

		return objTarget;
	}

}
