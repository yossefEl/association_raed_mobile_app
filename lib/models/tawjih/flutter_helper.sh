#! /bin/bash
read -p "Enter class name: " class_name
read -p "Enter class type: " class_type
filename="${class_name,,}_${class_type,,}.dart"
touch $filename

echo "class ${class_name^}${class_type^} {" >> $filename
varname=''
var_declaration=''
var_getter=''
var_setter=''
while [[ 1 == 1 ]] ; do
	read -p "Enter var name:" varname
    

    if [[ $varname == 'exit' ]]; then
    echo $var_declaration >> $filename
    echo $var_getter >> $filename
    echo $var_setter >> $filename
    echo "}" >> $filename
    exit
    fi

    read -p "Enter var type:" vartype
    var_declaration+="${vartype^} _${varname};"
    var_getter+="${vartype^} get get${varname^}=> _${varname};"
    var_setter+="set set${varname^}(${vartype^} ${varname,,}) {
    _${varname} = ${varname,,};}"

done

echo "finished"

