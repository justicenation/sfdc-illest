global with sharing class JoinTextCollectionAction {

    private static String execute(Input input) {

        // Initialize the list of clean values to join.
        // At a minimum the clean values should replace null values
        // with empty strings.
        List<String> cleanList = new List<String>();
        
        // Clean all the input values, applying enclosures and escape
        // characters if applicable.
        for (String each : Input.valueList) {

            // Treat null values as empty strings
            if (each == null) {
                each = '';
            }

            // Enclose and escape values if appropriate
            if (input.enclosure != null) {
                each = input.enclosure +
                        each.replaceAll(
                            formatRegExp(input.enclosure),
                            formatRegExp(input.getEscapedEnclosure())
                        ) +
                        input.enclosure;
            }

            // Store the clean value
            cleanList.add(each);
        }

        // Return the joined values
        return String.join(cleanList, input.delimiter);
    }

    @InvocableMethod(
        label='Join Text Collection'
        description='Concatenate a list of text values with optional delimiters and enclosures.'
    )
    global static List<String> execute(
        List<Input> inputList
    ) {

        // Initialize the list of outputs to return.
        List<String> outputList = new List<String>();

        // Execute each action
        for (Input each : inputList) {
            outputList.add(execute(each));
        }

        // Return the list of outputs
        return outputList;
    }

    global static String formatRegExp(String naive) {
        return naive.replaceAll(
            '\\\\',
            '\\\\\\\\\\\\'
        );
    }
    
    global class Input {

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

        global Input() {
            this.delimiter = '';
            this.enclosure = '';
            this.escapeCharacter = '';
            this.valueList = null;
        }

        global String getEscapedEnclosure() {
            return this.escapeCharacter + this.enclosure;
        }
    }
}
