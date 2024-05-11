import re

# 定义正则表达式模式，用于匹配十六进制指令
pattern = r'\b([0-9a-fA-F]{8})\b'

# 打开文件并读取内容
with open('./test_code_S.txt', 'r') as file:
    content = file.read()

# 使用正则表达式进行匹配
matches = re.findall(pattern, content)

# 输出匹配结果
out = []
if matches:
    for match in matches:
        out.append(match)
else:
    print("未找到匹配的十六进制指令")
print(",".join(out)+';')