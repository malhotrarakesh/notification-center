package com.gl.notificationcenter.persistence;

import com.gl.notificationcenter.persistence.impl.NotificationDaoImpl;

public class NotificationDaoFactory {
	private static NotificationDao dao;

	// Making it non-instantiable
	private NotificationDaoFactory() {
	}

	// Factory method
	public static NotificationDao getDao() {

		if (dao == null) {
			synchronized (NotificationDaoImpl.class) {
				if (dao == null) {
					dao = new NotificationDaoImpl();
				}
			}
		}
		return dao;
	}
}
