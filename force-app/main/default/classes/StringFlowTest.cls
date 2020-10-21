@IsTest
private without sharing class StringFlowTest {

    @IsTest
    private static void splitMultipleValues() {

        // Given
        Map<String, List<String>> expectedMap = new Map<String, List<String>> {
            null => new List<String>(),
            '' => new List<String> { '' },
            ' ' => new List<String> { '' },
            ' x ' => new List<String> { 'x' },
            'one ; two ; three' => new List<String> { 'one', 'two', 'three' },
            '001; 003; 006' => new List<String> { '001', '003', '006' },
            ' a;b;c ' => new List<String> { 'a', 'b', 'c' },
            ';;' => new List<String> { '', '', '' }
        };

        System.assertNotEquals(
            0,
            expectedMap.size(),
            'given expectedMap.size()'
        );

        Map<String, List<String>> actualMap = new Map<String, List<String>>();

        // When
        Test.startTest();

        for (String each : expectedMap.keySet()) {
            actualMap.put(
                each,
                StringFlow.splitMultipleValues(new List<String> { each }).get(0)
            );
        }

        // Then
        Test.stopTest();

        System.assertEquals(
            expectedMap.size(),
            actualMap.size(),
            'then actualMap.size()'
        );

        for (String each : actualMap.keySet()) {
            List<String> expectedList = expectedMap.get(each);
            List<String> actualList = actualMap.get(each);

            System.assertEquals(
                expectedList.size(),
                actualList.size(),
                'actualList.size() for ' + (each == null ? 'null' : each)
            );

            for (Integer i = 0; i < actualList.size(); i++) {
                String expectedValue = expectedList.get(i);
                String actualValue = actualList.get(i);

                System.assertEquals(
                    '\"' + expectedValue + '\"',
                    '\"' + actualValue + '\"',
                    'actualList.get(' + i + ') for ' + each
                );
            }
        }
    }
}
