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


import com.gemstone.gemfire.cache.Region;
import com.gemstone.gemfire.cache.client.ClientCache;
import com.gemstone.gemfire.cache.client.ClientCacheFactory;

import java.util.Map;

public class Validator {
    public static void main(String[] args) {

        ClientCache cache = new ClientCacheFactory().create();
        Region<Integer, SampleData> testDataRegion = cache.getRegion("TestData");

        System.out.println("testDataRegion.keySetOnServer().size() = " + testDataRegion.keySetOnServer().size());
        System.out.println("Starting data validation.");
        for (int i = 0; i < 5000; i++) {
            SampleData sampleData = testDataRegion.get(i);
            if (sampleData == null || sampleData.getValue() != 2) {
                System.out.println("****************Validation failed*********************");
                System.out.println("sampleData = " + sampleData);
                System.exit(1);
            }

        }
        System.out.println("Half way through.");
        for (int i = 5000; i < 10000; i++) {
            SampleData sampleData = testDataRegion.get(i);
            if (sampleData == null || sampleData.getValue() != 1) {
                System.out.println("****************Validation failed*********************");
                System.out.println("sampleData = " + sampleData);
                System.exit(1);
            }
        }
        System.out.println("Passed validation.");
    }
}


