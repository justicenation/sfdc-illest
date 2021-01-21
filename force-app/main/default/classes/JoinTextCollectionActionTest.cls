@IsTest
private without sharing class JoinTextCollectionActionTest {

    @IsTest
    private static void execute() {

        // Given
        JoinTextCollectionAction.Input input =
                new JoinTextCollectionAction.Input();
        
        input.valueList = new List<String> {
            'a',
            'b',
            'c'
        };

        List<JoinTextCollectionAction.Input> inputList =
                new List<JoinTextCollectionAction.Input> { input };

        // When
        Test.startTest();

        List<String> outputList = JoinTextCollectionAction.execute(inputList);

        // Then
        Test.stopTest();

        System.assertEquals('abc', outputList.get(0), JSON.serialize(input));
    }

    @IsTest
    private static void executeWithBlankValue() {

        // Given
        JoinTextCollectionAction.Input input =
                new JoinTextCollectionAction.Input();
        
        input.valueList = new List<String> {
            'a',
            'b',
            null,
            'c'
        };

        List<JoinTextCollectionAction.Input> inputList =
                new List<JoinTextCollectionAction.Input> { input };

        // When
        Test.startTest();

        List<String> outputList = JoinTextCollectionAction.execute(inputList);

        // Then
        Test.stopTest();

        System.assertEquals('abc', outputList.get(0), JSON.serialize(input));
    }

    @IsTest
    private static void executeWithDelimiter() {

        // Given
        JoinTextCollectionAction.Input input =
                new JoinTextCollectionAction.Input();
        
        input.valueList = new List<String> {
            'a',
            'b',
            null,
            'c'
        };

        input.delimiter = ',';

        List<JoinTextCollectionAction.Input> inputList =
                new List<JoinTextCollectionAction.Input> { input };

        // When
        Test.startTest();

        List<String> outputList = JoinTextCollectionAction.execute(inputList);

        // Then
        Test.stopTest();

        System.assertEquals('a,b,,c', outputList.get(0), JSON.serialize(input));
    }

    @IsTest
    private static void executeWithDelimiterAndEnclosure() {

        // Given
        JoinTextCollectionAction.Input input =
                new JoinTextCollectionAction.Input();
        
        input.valueList = new List<String> {
            'a',
            'b',
            null,
            'c'
        };

        input.delimiter = ',';

        input.enclosure = '\'';

        List<JoinTextCollectionAction.Input> inputList =
                new List<JoinTextCollectionAction.Input> { input };

        // When
        Test.startTest();

        List<String> outputList = JoinTextCollectionAction.execute(inputList);

        // Then
        Test.stopTest();

        System.assertEquals(
            '\'a\',\'b\',\'\',\'c\'',
            outputList.get(0),
            JSON.serialize(input)
        );
    }

    @IsTest
    private static void executeWithDelimiterAndEnclosureAndEscapeCharacter() {

        // Given
        JoinTextCollectionAction.Input input =
                new JoinTextCollectionAction.Input();
        
        input.valueList = new List<String> {
            '!',
            '$',
            '"',
            '\''
        };

        input.delimiter = ',';

        input.enclosure = '\'';

        input.escapeCharacter = '\\';

        List<JoinTextCollectionAction.Input> inputList =
                new List<JoinTextCollectionAction.Input> { input };

        // When
        Test.startTest();

        List<String> outputList = JoinTextCollectionAction.execute(inputList);

        // Then
        Test.stopTest();

        System.assertEquals(
            '\'!\',\'$\',\'"\',\'\\\'\'',
            outputList.get(0),
            JSON.serialize(input)
        );
    }
}
