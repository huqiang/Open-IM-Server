source ../.env
echo "your user is:$USER"
echo "your password is:$PASSWORD"
echo "your minio endPoint is:$MINIO_ENDPOINT"

echo "dbMysqlUserName"
sed -i '' -e "/^\([[:space:]]*dbMysqlUserName: *\).*/s//\1$USER/;0,/\([[:space:]]*dbUserName: *\).*/s//\1 $USER/;/\([[:space:]]*accessKeyID: *\).*/s//\1$USER/;/\([[:space:]]*endpoint: *\).*/s//\1\"abc\"/;" ../config/usualConfig.yaml

echo "dbMysqlPassword"
sed -i '' -e "/^\([[:space:]]*dbMysqlPassword: *\).*/s//\1$PASSWORD/;/\([[:space:]]*dbPassword: *\).*/s//\1$PASSWORD/;/\([[:space:]]*secret: *\).*/s//\1$PASSWORD/;/\([[:space:]]*secretAccessKey: *\).*/s//\1$PASSWORD/;" ../config/usualConfig.yaml

echo "endpoint"
sed -i '' -e "/\([[:space:]]*endpoint: *\).*/s##\1$MINIO_ENDPOINT#;" ../config/usualConfig.yaml

echo "dbPassWord"
sed -i '' -e "/\([[:space:]]*dbPassWord: *\).*/s//\1$PASSWORD/;" ../config/usualConfig.yaml

echo "secret"
sed -i '' -e "/\([[:space:]]*secret: *\).*/s//\1$PASSWORD/;" ../docker-compose_cfg/config.yaml
