global with sharing class StringFlow {
    
    /**
     * Given a value returned by a checkbox group or a multi-select picklist,
     * split the semicolon-delimited value into individual values held
     * within a collection, so that the resulting collection can be used
     * as input for a loop.
     * 
     * All values are trimmed, meaning that if for any reason extra whitespace
     * exists before or after a value in the list, that whitespace will be
     * removed in the returned collection.
     * 
     * @param value A list of `String` values to split.
     * 
     * @return a list of collections corresponding to each given input `String`
     *         value split into individual values.
     */
    @InvocableMethod(
        label='Split Multiple Values'
        description='Split multiple values from a checkbox group or a multi-select picklist into a collection.'
    )
    global static List<List<String>> splitMultipleValues(List<String> inputList) {
        
        // Initialize the list of outputs to return,
        // where each output is a list of the split values.
        List<List<String>> outputList = new List<List<String>>();

        if (inputList != null) {
            for (String eachInput : inputList) {

                // Initialize the output and add it to the list
                List<String> output = new List<String>();
                outputList.add(output);

                // If there's input to parse, parse it.
                if (eachInput != null) {
                    
                    // A single value is considered a special case that needs
                    // not be split.
                    if (eachInput.indexOf(';') < 0) {
                        output.add(eachInput.trim());
                    }
                    else {

                        // Iterate through the split parts to remove artificial
                        // boundaries, because native Salesforce `split` will
                        // take ';;' and return an empty array.
                        for (String eachValue : eachInput.trim().replaceAll(
                            '\\s*;\\s*',
                            '--boundary--; --boundary--'
                        ).split('; ')) {
                            output.add(eachValue.replaceAll('--boundary--', ''));
                        }
                    }
                }
            }
        }
        
        // Return the list of outputs
        return outputList;
    }
}
