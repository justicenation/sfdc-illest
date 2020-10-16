global with sharing class SplitMultipleValuesAction {
    
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
    global static List<List<String>> SplitMultipleValuesAction(List<String> valueList) {
        
        // Initialize the list of collections to return
        List<List<String>> collectionList = new List<List<String>>();

        if (valueList != null) {
            for (String each : valueList) {
                collectionList.add(
                    each == null ? new List<String>()
                                 : each.trim().split('\\s*;\\s*')
                );
            }
        }
        
        // Return the list of collections
        return collectionList;
    }
}
