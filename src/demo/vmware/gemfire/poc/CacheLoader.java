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

import com.gemstone.gemfire.cache.client.ClientCache;
import com.gemstone.gemfire.cache.client.ClientCacheFactory;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;


public class CacheLoader {

    public static void main(String[] args) throws Exception {

        ClientCache cache = new ClientCacheFactory().create();

        Map<Integer, SampleData> testDataRegion = cache.getRegion("TestData");
        System.out.println("Start of Use Case.");
        Map<Integer, SampleData> bulk = new HashMap<Integer, SampleData>();
        for (int i = 0; i < 10000; i++) {
            bulk.put(i, new SampleData(1));
        }
        testDataRegion.putAll(bulk);
        bulk.clear();
        System.out.println("Done inserting 10,000 objects.");

        System.out.println("Please stop a cache server at this time.  Press enter to continue.");
        Scanner sc = new Scanner(System.in);
        sc.nextLine();

        System.out.println("Updating half of the regions data.");
        for (int i = 0; i < 5000; i++) {
            SampleData sampleData = testDataRegion.get(i);
            sampleData.setValue(2);
            bulk.put(i, sampleData);
        }
        testDataRegion.putAll(bulk);
        System.out.println("Done updating the first 5,000 values");

        cache.close();
    }
}
