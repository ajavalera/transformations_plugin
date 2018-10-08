com! -range TransformJsonToXml <line1>,<line2>call TransformJsonToXml()
fun! TransformJsonToXml() range
python3 << EOF

import vim
import json
from dicttoxml import dicttoxml

buf = vim.current.buffer
(lnum1, col1) = buf.mark("<")
(lnum2, col2) = buf.mark(">")

lines = vim.eval("getline({}, {})".format(lnum1, lnum2))

lines[0] = lines[0][col1:]
lines[-1] = lines[-1][:col2]

result = "".join(lines)

if len(result) < 1:
    pass

dict_from_json = json.loads(result.strip())

if len(dict_from_json) < 1:
    pass

xml_from_dict = dicttoxml(dict_from_json)

vim.command("normal gvx")

vim.command("normal i " + xml_from_dict.decode("utf-8"))

EOF
endfun

