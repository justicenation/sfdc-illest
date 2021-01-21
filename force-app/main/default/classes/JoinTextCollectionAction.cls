global with sharing class JoinTextCollectionAction {

    @InvocableMethod(
        label='Join Text Collection'
        description='Concatenate a list of text values with optional delimiters and enclosures.'
    )
    global static List<String> execute(
        List<JoinTextCollectionInput> inputList
    ) {

        // Initialize the list of outputs to return.
        List<String> outputList = new List<String>();

        // TODO: Something useful

        // Return the list of outputs
        return outputList;
    }
    
    global class JoinTextCollectionInput {

        @InvocableVariable(label='Delimiter')
        global String delimiter;

        @InvocableVariable(
            label='Enclosure'
            description='Wrap this enclosure around each value.'
        )
        global String enclosure;

        @InvocableVariable(label='Escape Character')
        global String escapeCharacter;

        @InvocableVariable(label='Text Collection')
        global List<String> valueList;
    }
}
