#!/usr/bin/bash

#python program that gets our out of date packages and writes to requirements.txt
pythonProgram="H4sICMc+2GQCA3B5dGhvbnByb2dyYW0ucHkAbZAxb8JADIX3+xXudSBRIQxsSEzt2nZB6kBRdSQOOcidr2dHKf++F0gplbpZ79mfn31/N+84znfWz8NJGvILVUdyQAzWBYoCfGJBd1G524VIJfLVLRssjx/USehEjdqByStV2xbX9BatIKxAR/zsbESHXriQL9FKVVhDRY/PT1lJzhlf5UsFEaWL/g/3x54CN9i2q3XsML+M71FejEPOhp2vuwOWcgPZ2I32ydZbqCmCBevht3GrFJ0LTvkGuWjJVJxdIulgwwJaywKzWcpRGcEqlQnkjKyGfp3nKpjyaPZ4DpEw1zwjOcUM0XrJdEIApXsTBsYhXoLOR38Ck+JA1me3wMRXvZUGKKDPbh461b3OwTDU6di66Actm7z7/xljgj5S2i0E+uEGlatvwssy0AMCAAA="

pythonProgramFile="/tmp/pip-get-requirements.py"

pushd ~
echo $pythonProgram | base64 -d | gzip -dc > $pythonProgramFile
chmod +x $pythonProgramFile

python3 -m venv .venv
source .venv/bin/activate

cd /tmp/
$pythonProgramFile

python3 -m pip install -r requirements.txt

rm requirements.txt $pythonProgramFile
popd
