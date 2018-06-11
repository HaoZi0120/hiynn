import os

s = os.sep
root = r"D:\pycharmprojects\test\Resources\tables"
new_root = r"D:\pycharmprojects\test\Resources\new_tables"
print root

for rt, dirs, files in os.walk(root):
    for f in files:
        m = 0
        n = 0
        str = ''
        path = os.path.join(root, f)
        print path
        tf = open(path, 'r')
        for line in tf.readlines():
            if 'comment on table' in line:
                n = 1
            if n == 1:
                if 'is' in line:
                    str += f.split('.')[0] + '\t' + line.split('\'')[1] + '\n'
                    n = 0
            if 'Add comments to the columns' in line:
                m = 1
            if m == 1:
                if f.upper().split('.')[0] in line and 'comment on column' in line:
                    en = line.split('.')[1][:-1]
                    str += en
                if 'is' in line:
                    cn = line.split('\'')[1]
                    str += '\t' + cn + '\n'
        new_path = os.path.join(new_root, f)
        nf = open(new_path, 'w')
        nf.write(str)
        nf.close()
