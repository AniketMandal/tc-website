/**
 * Cache.java
 * August 17, 2000
 *
 * Copyright (C) 2000 CoolServlets.com. All rights reserved.
 *
 * ===================================================================
 * The Apache Software License, Version 1.1
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by
 *        CoolServlets.com (http://www.coolservlets.com)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Jive" and "CoolServlets.com" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please
 *    contact webmaster@coolservlets.com.
 *
 * 5. Products derived from this software may not be called "Jive",
 *    nor may "Jive" appear in their name, without prior written
 *    permission of CoolServlets.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL COOLSERVLETS.COM OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of CoolServlets.com. For more information
 * on CoolServlets.com, please see <http://www.coolservlets.com>.
 */

package com.coolservlets.util;

import com.topcoder.shared.distCache.CacheClientPool;

import java.io.*;
import java.rmi.RemoteException;

public class Cache {

    private com.topcoder.shared.distCache.CacheClient cache;
    private static final int MAX_SIZE = 10000;
    private int timeOut= 1000*24*60*60*1000;

    public Cache() {
        new Cache(MAX_SIZE, timeOut);
    }

    public Cache(int maxSize) {
        new Cache(maxSize, timeOut);
    }

    public Cache(int maxSize, int timeOut) {
        try {
            this.timeOut = timeOut;
            cache = new com.topcoder.shared.distCache.SimpleCacheClientImpl(maxSize);
        } catch (RemoteException e) {
            e.printStackTrace();  //To change body of catch statement use Options | File Templates.
        }
    }

    public Cache(boolean isDistributed) {
        if (isDistributed)
            cache = CacheClientPool.getPool().getClient();
        else {
            try {
                cache = new com.topcoder.shared.distCache.SimpleCacheClientImpl(MAX_SIZE);
            } catch (RemoteException e) {
                e.printStackTrace();  //To change body of catch statement use Options | File Templates.
            }
        }
    }

    public Object get(int uniqueID) {
        Object ret = null;
        try {
            ret = cache.get(String.valueOf(uniqueID));
        } catch (RemoteException e) {
            e.printStackTrace();  //To change body of catch statement use Options | File Templates.
        }
        return ret;
    }

	public void add(int uniqueID, Object object) {
        try {
            cache.set(String.valueOf(uniqueID), object, timeOut);
        } catch (RemoteException e) {
            e.printStackTrace();  //To change body of catch statement use Options | File Templates.
        }
    }

    public boolean containsKey(int key) {
        boolean ret = false;
        try {
            ret = cache.get(String.valueOf(key))!=null;
        } catch (RemoteException e) {
            e.printStackTrace();  //To change body of catch statement use Options | File Templates.
        }
        return ret;
    }

	public void remove(int uniqueID) {
        try {
            cache.remove(String.valueOf(uniqueID));
        } catch (RemoteException e) {
            e.printStackTrace();  //To change body of catch statement use Options | File Templates.
        }
    }

    public void clear() {
        try {
            cache.clearCache();
        } catch (RemoteException e) {
            e.printStackTrace();  //To change body of catch statement use Options | File Templates.
        }
    }

	private static int getSize(Object o) {
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(baos);
			oos.writeObject(o);
			oos.flush();
			int size = baos.size();
			oos.close();
			return size;
		} catch (IOException e) {

		}
		return -1;
	}
}
