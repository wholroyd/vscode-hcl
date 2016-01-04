# Single line with number-sign
// Single line with double-slash
/*
Multi line comment block
*/

construct {
    usingvar = "${var.test}"
    usingmodule = "${module.test}"
    interpolation = "test-${lookup(element(var.test0, "bar"))}-test"
    constant_decimal = 1024
    constant_hexidecimal = 0xDEADBEEF
    constant_size = 1024Kb
    constant_boolean = true
    string = "true"
    
    nested-construct {
        foo = 348743
        bar = "348743Gb"
    }
}
construct "arg0" { }
construct "arg0" "arg1" { }
construct "arg0" "arg1" "arg2" { }



