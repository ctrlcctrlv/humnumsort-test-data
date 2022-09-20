(: Note: Two functions below are from https://en.wikibooks.org/wiki/XQuery/Filtering_Nodes#Removing_named_attributes :)

(: return a deep copy of the elements and attributes without ANY namespaces :)
declare function local:remove-namespaces($element as element()) as element() {
     element { local-name($element) } {
         for $att in $element/(@* except @lang)
         return
             attribute {local-name($att)} {$att},
         for $child in $element/node()
         return
             if ($child instance of element())
             then local:remove-namespaces($child)
             else $child
         }
};

declare function local:copy-and-filter($element as element(),
                                       $attribute-name as xs:string*) as element() {
    element
    {node-name($element)}
    {
        $element/@*[not(name()=$attribute-name)],
        for $child in $element/node()
        return if ($child instance of element()) then
            local:copy-and-filter($child, $attribute-name)
        else $child
    }
};

let $_root := (
    x:replace-nodes(
        /*, function($e) {
            local:copy-and-filter(local:remove-namespaces($e), "id")
        }
    )
)

let $_title := $_root//title

return x:replace-nodes(
    $_root//title, <title>Expensive tests for hns (human numeric sort)</title> 
)
