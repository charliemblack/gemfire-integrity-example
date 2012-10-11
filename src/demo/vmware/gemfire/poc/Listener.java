/*
 * Copyright 2002-2011 the original author or authors.
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

package demo.vmware.gemfire.poc;

import com.gemstone.gemfire.cache.Cache;
import com.gemstone.gemfire.cache.CacheFactory;
import com.gemstone.gemfire.cache.Declarable;
import com.gemstone.gemfire.cache.EntryEvent;
import com.gemstone.gemfire.cache.query.*;
import com.gemstone.gemfire.cache.util.CacheListenerAdapter;

import java.util.Properties;

/**
 * User: Charlie Black
 */
public class Listener extends CacheListenerAdapter implements Declarable {


    private boolean firstTime = true;

    @Override
    public void afterCreate(EntryEvent entryEvent) {
        if (firstTime) {
            try {
                firstTime = false;
                Cache cache = CacheFactory.getAnyInstance();
                QueryService queryService = cache.getQueryService();
                CqAttributesFactory cqf = new CqAttributesFactory();
                CqListener tradeEventListener = new CqListener() {
                        public void onEvent(CqEvent aCqEvent) {
                            System.out.println("aCqEvent = " + aCqEvent);

                        }

                        public void onError(CqEvent aCqEvent) {
                            System.out.println("aCqEvent = " + aCqEvent);

                        }

                        public void close() {

                        }
                    };
                cqf.addCqListener(tradeEventListener);
                CqQuery cq = queryService.newCq("Select * from /TestData", cqf.create());
                cq.executeWithInitialResults();
                System.out.println("cq = " + cq);
            } catch (Throwable e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void afterUpdate(EntryEvent entryEvent) {
        afterCreate(entryEvent);
    }

    /**
     * Initializes a user-defined object using the given properties.
     * Note that any uncaught exception thrown by this method will cause
     * the <code>Cache</code> initialization to fail.
     *
     * @param props Contains the parameters declared in the declarative xml
     *              file.
     * @throws IllegalArgumentException If one of the configuration options in <code>props</code>
     *                                  is illegal or malformed.
     */
    public void init(Properties props) {

    }
}
