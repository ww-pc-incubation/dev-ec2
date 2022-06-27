 1118  ubectl -n webapp delete pod podinfo-86887b6cbc-
 1119  kubectl get pods -n webapp 
 1120  . ww-aws.sh
 1121  kubectl get pods -n webapp 
 1122  kubectl -n webapp delete pod podinfo-86887b6cbc-t4ss2 
 1123  kubectl get pods -n webapp 
 1124  kubectl -n webapp delete pod podinfo-86887b6cbc-vctlh 
 1125  kubectl get pods -n webapp 
 1126  kubectl -n webapp delete pod podinfo-86887b6cbc-vxb77 
 1127  kubectl get pods -n webapp 
 1128  kubectl -n webapp delete pod podinfo-86887b6cbc-v22nn 
 1129  kubectl get pods -n webapp 
 1130  kubectl -n webapp delete pod podinfo-86887b6cbc-5dqd2 
 1131  kubectl get pods -n webapp 
 1132  kubectl -n webapp delete pod podinfo-86887b6cbc-9c9n7 
 1133  kubectl get pods -n webapp 
 1134  kubectl -n webapp delete pod podinfo-86887b6cbc-9k4rk 
 1135  kubectl get pods -n webapp 
 1136  export KUBECONFIG=~/.kube/kubeconfig_tekton-builder.yaml
 1137  kubectl get pods -A
 1138  kubectl -n prometheus logs -f prometheus-server-68b5f9b4c8-gs6qm 
 1139  kubectl -n prometheus logs -f prometheus-server-68b5f9b4c8-gs6qm -c prometheus-server
 1140  kubectl get pods -A
 1141  kubectl -n prometheus delete pod prometheus-server-68b5f9b4c8-gs6qm 
 1142  kubectl get pods -A
 1143  kubectl -n prometheus logs -f prometheus-server-68b5f9b4c8-jqln9 -c prometheus-server
 1144  kubectl get pods -A
 1145  kubectl -n prometheus logs -f prometheus-server-68b5f9b4c8-jqln9 -c prometheus-server
 1146  kubectl -n prometheus logs -f prometheus-server-68b5f9b4c8-cmtfk -c prometheus-server
 1147  kubectl get pods -A
 1148  kubectl -n prometheus logs -f prometheus-server-68b5f9b4c8-cmtfk -c prometheus-server
 1149  kubectl -n prometheus describe pod prometheus-server-68b5f9b4c8-cmtfk
 1150  unset KUBECONFIG 
 1151  kubectl get pods -A
 1152  kubectl -n webapp delete pod podinfo-86887b6cbc-ggp82 
 1153  . ww-aws.sh
 1154  kubectl get pods -A
 1155  kubectl get pods -n webapp 
 1156  kubectl get pods -A
 1157  kubectl get pods -n webapp 
 1158  kubectl delete pods -n webapp podinfo-86887b6cbc-mfm56 
 1159  kubectl get pods -n webapp 
 1160  kubectl delete pods -n webapp podinfo-86887b6cbc-sfn67 
 1161  kubectl get pods -n webapp 
 1162  kubectl delete pods -n webapp podinfo-86887b6cbc-gkh26 
 1163  kubectl get pods -n webapp 
 1164  kubectl delete pods -n webapp podinfo-86887b6cbc-gkh26 
 1165  kubectl get pods -n webapp 
 1166  kubectl delete pods -n webapp podinfo-86887b6cbc-96p8c 
 1167  kubectl get pods -n webapp 
 1168  kubectl delete pods -n webapp podinfo-86887b6cbc-xq777 
 1169  kubectl get pods -n webapp 
 1170  git status
 1171  pwd
 1172  cd go/src/github.com/paulcarlton-ww/ww-core/
 1173  git status
 1174  git status | tail -1
 1175  git status | tail -
 1176  git status
 1177  git status | tail -
 1178  git status | tail -1
 1179  if [ "$(git status | tail -1)" == "nothing to commit, working tree clean" ] ; then echo "clean";fi
 1180  kubectl get pods -n webapp 
 1181  kubectl delete pods -n webapp podinfo-86887b6cbc-6njbl 
 1182  ls -l ~/info/paulcarlton-ww/
 1183  cat ~/info/paulcarlton-ww/id_rsa.pub 
 1184  ls -l ~/.ssh
 1185  vi ~/info/paul
 1186  cat ~/info/paul
 1187  kubectl get pods -n webapp 
 1188  mkdir ~/info/paul-carlton
 1189  ls -l ~/info/paul-carlton/
 1190  pwd
 1191  ls -l ~/info/paul-carlton/
 1192  cat ~/info/paul-carlton/id_rsa
 1193  cat ~/info/paul-carlton/id_rsa.pub 
 1194  kubectl get pods -n webapp 
 1195  ssh ec2-user@34.254.163.139
 1196  ssh ec2-user@3.249.85.104
 1197  history
 1198  ssh ec2-user@3.249.85.104
 1199  ssh ec2-user@34.242.192.134
 1200  find / -name buildx 2>/dev/null
 1201  find / -name *buildx 2>/dev/null
 1202  export $(echo $stack_name | sed s/-/_/)_LDAP_PASSWORD=NotActualy1
 1203  echo $stack_name
 1204  stack_name=sdp-github2
 1205  export $(echo $stack_name | sed s/-/_/)_LDAP_PASSWORD=NotActualy1
 1206  env | sort
 1207  export $(echo $stack_name | sed s/-/_/)_LDAP_PASSWORD=NotActualy1
 1208  aws-profile sdp-github
 1209  ldasp_password=NotActualy1
 1210  env | sort
 1211  ldap_password=NotActualy1
 1212  export $(echo $stack_name | sed s/-/_/)_LDAP_PASSWORD=NotActua
 1213  env | sort
 1214  export $(echo $stack_name | sed s/-/_/ | tr 'a-z' 'A-Z')_LDAP_PASSWORD=$ldap_password
 1215  env | sort
 1216  . aws-reset,
 1217  . aws-reset.sh
 1218  aws-profile dev-east
 1219  rubix update  cluster --file paul-carlton2/cluster.yaml
 1220  cd /Users/paulc/go/src/github.pie.apple.com/paul-carlton/clusters
 1221  rubix update  cluster --file paul-carlton2/cluster.yaml
 1222  rubix delete  cluster --file paul-carlton2/cluster.yaml
 1223  rubix describe cluster --cluster-name  paul-carlton --account-id 024901034627
 1224  rubix describe cluster --cluster-name  paul-carlton2 --account-id 024901034627
 1225  rubix describe cluster --cluster-name  paul-carlton --account-id 024901034627
 1226  rubix describe cluster --cluster-name  paul-carlton2 --account-id 024901034627
 1227  rubix create  cluster --file paul-carlton2/cluster.yaml
 1228  kubectl config get-contexts 
 1229  export KUBECONFIG=~/.kube/kubeconfig_rio-builder.yaml
 1230  kubectl config get-contexts 
 1231  kubectl get pods -n builders
 1232  flux reconcile source git -n flux-system flux-system 
 1233  flux reconcile kustomization -n flux-system flux-system 
 1234  kubectl get pods -n builders
 1235  kubectl describe pods -n builders
 1236  kubectl -n builders logs -f go 
 1237  kubectl get nodes -o yaml
 1238  kubectl describe pods -n builders
 1239  kubectl get nodes -o wide
 1240  flux reconcile kustomization -n flux-system flux-system 
 1241  kubectl describe pods -n builders
 1242  flux reconcile source git -n flux-system flux-system 
 1243  flux reconcile kustomization -n flux-system flux-system 
 1244  kubectl delete pod -n builders go
 1245  kubectl describe pods -n builders
 1246  flux reconcile kustomization -n flux-system flux-system 
 1247  kubectl describe pods -n builders
 1248  kubectl -n builders logs -f go 
 1249  kubectl -n builders exec -it go -- bash 
 1250  flux reconcile source git -n flux-system flux-system ; flux reconcile kustomization -n flux-system flux-system
 1251  kubectl delete pod -n builders go
 1252  flux reconcile source git -n flux-system flux-system ; flux reconcile kustomization -n flux-system flux-system
 1253  kubectl describe pods -n builders
 1254  kubectl -n builders exec -it go -- bash 
 1255  docker buildx create --name k8sbuilder             --node amd64builder             --platform linux/amd64             --driver kubernetes             --driver-opt image=docker.apple.com/base-images/ubi8/go1.18-builder:1.18.3-28,namespace=rio-builder,replicas=1,nodeselector=beta.kubernetes.io/arch=amd64,rootless=true
 1256  flux reconcile source git -n flux-system flux-system ; flux reconcile kustomization -n flux-system flux-system
 1257  kubectl -n builders exec -it go -- bash 
 1258  exit
 1259  /var/folders/t7/rz5dndgn0yxbf48q6g6ch8c80000gn/T/multipass-gui.tvYdSS.command ; exit;
 1260  export KUBECONFIG=~/.kube/kubeconfig_rio-builder.yaml
 1261  kubectl -n builders exec -it go -- bash 
 1262  kubectl describe pod -n builders go
 1263  flux reconcile source git -n flux-system flux-system ; flux reconcile kustomization -n flux-system flux-system
 1264  kubectl -n builders exec -it ubi -- bash 
 1265  docker buildx ls
 1266  docker buildx rm k8sbuilder
 1267  docker buildx ls
 1268  syscap info -arch
 1269  uname -m
 1270  unset KUBECONFIG 
 1271  kubectl get pods -A
 1272  flux reconcile source git -n flux-system flux-system ; flux reconcile kustomization -n flux-system flux-system
 1273  kubectl get pods -A
 1274  flux reconcile source git -n flux-system flux-system ; flux reconcile kustomization -n flux-system flux-system
 1275  kubectl delete pod builder 
 1276  flux reconcile source git -n flux-system flux-system ; flux reconcile kustomization -n flux-system flux-system
 1277  kubectl get pods -A
 1278  kubectl describe pod builder 
 1279  kubectl dlogs -f builder 
 1280  kubectl logs -f builder 
 1281  kubectl describe pod builder 
 1282  kubectl delete pod builder 
 1283  flux reconcile source git -n flux-system flux-system ; flux reconcile kustomization -n flux-system flux-system
 1284  kubectl describe pod builder 
 1285  kubectl exec -it  builder  -- bash
 1286  kubectl get pods -n builder 
 1287  ps ax
 1288  ps ax | grep docker
 1289  ps -o pid,pgid,cmd ax | grep docker
 1290  ps ax -o pid,pgid,cmd  | grep docker
 1291  ps ax -o pid,pgid  | grep docker
 1292  ps ax | grep docker
 1293  ps -o pid,pgid
 1294  ps -o pid,pgid,cnd
 1295  ps -o pid,pgid,
 1296  ps -O pid,pgid,cmd
 1297  ps -O pid,pgid,cmd ax
 1298  ps ax -O pid,pgid,cmd 
 1299  ps ax -O pid,pgid,cmd | grep docker
 1300  kill -9 x53183
 1301  kill -9 53183
 1302  eksctl delete nodegroup --cluster paulcarlton-master ng-2-amd
 1303  . aws-reset.sh
 1304  . ww-aws.sh
 1305  pwd
 1306  cp -rf go/src/github.com/paulcarlton-ww/kraan go/src/github.pie.apple.com/paul-carlton/
 1307  cd go/src/github.pie.apple.com/paul-carlton/kraan/
 1308  git-info.sh 
 1309  git remote -v
 1310  cat docker-bake.hcl 
 1311  rm docker-bake.hcl 
 1312  git-info.sh 
 1313  git remote -v
 1314  git remote remove origin 
 1315  git remote -v
 1316  git remote add origin git@github.pie.apple.com:paul-carlton/kraan.git
 1317  git branch -M main
 1318  git push -u origin main
 1319  cd ..
 1320  ls
 1321  cd ..
 1322  ls
 1323  mkdir sdp-github.g.apple.com
 1324  cd sdp-github.g.apple.com/
 1325  mkdir paul-carlton
 1326  cd paul-carlton/
 1327  cp -rf go/src/github.com/paulcarlton-ww/kraan .
 1328  cp -rf ~/go/src/github.com/paulcarlton-ww/kraan .
 1329  cd kraan/
 1330  git remote add origin git@sdp-github.g.apple.com:paul-carlton/kraan.git
 1331  git branch -M main
 1332  git push -u origin main
 1333  git remote -v
 1334  git remote remove origin 
 1335  git remote add origin git@sdp-github.g.apple.com:paul-carlton/kraan.git
 1336  git branch -M main
 1337  git push -u origin main
 1338  kubectl config get-contexts 
 1339  cd ../../..
 1340  cd github.com/paulcarlton-ww/kraan/
 1341  git-info.sh 
 1342  docker buildx ps
 1343  docker buildx ls
 1344  docker build .
 1345  docker buildx ls
 1346  docker buildx use default
 1347  docker build .
 1348  docker buildx use k8sbuilder
 1349  docker build .
 1350  docker buildx use k8sbuilder
 1351  docker build .
 1352  ps
 1353  kill -9 37717
 1354  ps
 1355  docker buildx use default
 1356  docker build .
 1357  ps
 1358  docker build .
 1359  go env
 1360  go env| sort
 1361  echo $GOOS
 1362  TARGETARCH=$(go env GOARCH)
 1363  echo $TARGETARCH 
 1364  TARGETOS=$(go env GOOS)
 1365  docker build .
 1366  export TARGETOS=$(go env GOOS)
 1367  docker build .
 1368  TARGETARCH=$(go env GOARCH)
 1369  docker build .
 1370  export TARGETOS=$(go env GOOS)
 1371  echo $TARGETOS
 1372  docker buildx use k8sbuilder
 1373  docker build .
 1374  ps
 1375  docker buildx rm k8sbuilder
 1376  kubectl get pods -n builder
 1377  kubectl get pods -A
 1378  kubectl get pods -n builder
 1379  kubectl describe pods -n builder
 1380  kubectl get pods -n builder
 1381  kubectl describe pods -n builder
 1382  kubectl describe nodes
 1383  kubectl get nodes -A
 1384  kubectl get nodes -o wide
 1385  kubectl describe node ip-192-168-67-125.eu-west-1.compute.internal 
 1386  kubectl get nodes -o wide
 1387  kubectl describe pods -n builder
 1388  kubectl get pods -n builder -o yaml
 1389  kubectl get deplyments -n builder -o yaml
 1390  kubectl get deployments -n builder -o yaml
 1391  docker build .
 1392  kubectl get nodes -o wide
 1393  kubectl get pods -n builder
 1394  kubectl describe pods -n builder
 1395  kubectl get deployments -n builder -o yaml
 1396  docker build .
 1397  ps
 1398  kill -9 46331
 1399  ps
 1400  docker build .
 1401  ps
 1402  kubectl get nodes -o wide
 1403  kubectl get pods -n builder
 1404  docker build .
 1405  ps
 1406  docker build . 
 1407  kubectl get pods -n builder
 1408  docker build . 
 1409  ps
 1410  kill -9 48041
 1411  ps
 1412  docker build . 
 1413  docker buildx du
 1414  . ww-aws.sh
 1415  docker buildx du
 1416  docker build . 
 1417  ps
 1418  kill -9 50138
 1419  ps
 1420  kill -9 50211
 1421  ps
 1422  docker build . 
 1423  docker buildx du
 1424  docker build . 
 1425  docker buildx prune
 1426  docker buildx du
 1427  docker build . 
 1428  docker buildx du
 1429  docker buildx prune --help
 1430  docker buildx prune help
 1431  docker buildx prune --force
 1432  docker build . 
 1433  docker build . --progress
 1434  docker build --progress plain .
 1435  ps
 1436  ps -O pid,pgid,cmd
 1437  docker build --progress plain .
 1438  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1439  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1440  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1441  docker buildx use k8sbuilder-arm64;docker build --progress plain . --push
 1442  docker buildx use k8sbuilder-arm64;docker build --progress plain . --push --help
 1443  docker buildx use k8sbuilder-arm64;docker build --progress plain . --push 
 1444  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1445  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1446  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1447  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1448  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1449  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1450  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1451  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1452  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1453  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1454  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1455  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1456  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1457  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1458  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1459  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1460  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1461  docker buildx use k8sbuilder-arm64;docker build --progress plain .
 1462  docker buildx use k8sbuilder-amd64;docker build --progress plain .
 1463  docker images
 1464  docker buildx use k8sbuilder-arm64;docker build --progress plain . --output=type=registry
 1465  docker buildx use k8sbuilder-arm64;docker build --progress plain . --output=type=registry --tag buildx-test
 1466  docker buildx use default;docker build --progress plain . --output=type=registry --tag buildx-test
 1467  docker login 
 1468  docker buildx use default;docker build --progress plain . --output=type=registry --tag buildx-test
 1469  docker buildx use default;docker build --progress plain . --output=type=registry --tag pcarlton/krann:3.0.0-buildx-test
 1470  docker buildx use k8sbuilder-arm64;docker build --progress plain . --output=type=registry --tag pcarlton/krann:3.0.0-arm64
 1471  nslookup www.google.com
 1472  wget 
 1473  wget  www.bbc.co.uk
 1474  . ww-aws.sh
 1475  kubectl get pods -n webapp 
 1476  kubectl get pods 
 1477  kubectl get pods -A
 1478  kubectl config get-contexts 
 1479  kubectl config use-context arn:aws:eks:eu-west-1:482649550366:cluster/paulcarlton-master     
 1480  kubectl get pods -A
 1481  eksctl utils set-public-access-cidrs --cluster=paulcarlton-master 31.54.142.17/32,17.0.0.0/8 --approve
 1482  kubectl get pods -A
 1483  kubectl exec -it builder -- bash
 1484  kubectl get pods -A
 1485  docker buildx ls
 1486  pwd
 1487  cd go/src/github.com/paulcarlton-ww/ww-master/
 1488  git-info.sh 
 1489  cd graviton-poc/
 1490  bin/build.sh
 1491  bin/build
 1492  docker images
 1493  kubectl get pods -A
 1494  kubectl -n 
 1495  kubectl -n builder describe pod amd64builder-5b95c48dc-j2bpg 
 1496  kubectl get pods -n builder
 1497  go env GOOS GOARCH
 1498  kubectl get pods -n builder
 1499  kubectl -n builder describe pod arm64builder-797f8df4f9-dbcjm 
 1500  kubectl get pods -n builder arm64builder-797f8df4f9-dbcjm -o yaml
 1501  bin/build
 1502  docker buildx rm k8sbuilder
 1503  kubectl get pods -n builder
 1504  bin/build
 1505  docker buildx rm k8sbuilder
 1506  eksctl 
 1507  eksctl create nodegroup --config ../cluster.yaml 
 1508  eksctl create nodegroup --file ../cluster.yaml 
 1509  eksctl create nodegroup 
 1510  eksctl create nodegroup --cluster paulcarlton-master --config ../cluster.yaml 
 1511  eksctl create nodegroup --cluster paulcarlton-master --file ../cluster.yaml 
 1512  eksctl create nodegroup --cluster paulcarlton-master --co
 1513  eksctl create nodegroup --cluster paulcarlton-master --help
 1514  eksctl create nodegroup --cluster paulcarlton-master --config-file ../cluster.yaml 
 1515  eksctl create nodegroup  --config-file ../cluster.yaml 
 1516  eksctl utils update-coredns --cluster paulcarlton-master
 1517  eksctl utils update-kube-proxy --cluster paulcarlton-master
 1518  eksctl utils update-kube-proxy --cluster paulcarlton-master --approve
 1519  eksctl utils update-aws-node --cluster paulcarlton-master --approve
 1520  curl ifconfig.me
 1521  history | grep eksctl
 1522  curl ifconfig.me
 1523  eksctl utils update-aws-node --cluster paulcarlton-master --approve
 1524  eksctl utils update-kube-proxy --cluster paulcarlton-master --approve
 1525  eksctl create nodegroup  --config-file ../cluster.yaml 
 1526  eksctl delete nodegroup --cluster paulcarlton-master ng-2-amd 
 1527  eksctl delete nodegroup --cluster paulcarlton-master ng-1-arm
 1528  eksctl delete nodegroup --cluster paulcarlton-master ng-3-arm
 1529  eksctl create nodegroup  --config-file ../cluster.yaml 
 1530  kubectl get nodes
 1531  aws eks list-nodegroups --cluster-name paulcarlton-master
 1532  aws eks describe-nodegroups --cluster-name paulcarlton-master --name ng-2-amd
 1533  aws eks describe-nodegroup --cluster-name paulcarlton-master --name ng-2-amd
 1534  aws eks describe-nodegroup --cluster-name paulcarlton-master --nodegroup name ng-2-amd
 1535  aws eks describe-nodegroup --cluster-name paulcarlton-master --nodegroup-name ng-2-amd
 1536  aws eks list-nodegroups --cluster-name paulcarlton-master
 1537  eksctl create nodegroup  --config-file ../cluster.yaml 
 1538  aws eks list-nodegroups --cluster-name paulcarlton-master
 1539  aws eks describe-nodegroup --cluster-name paulcarlton-master --nodegroup-name ng-2-amd
 1540  kubectl get nodes -o wide
 1541  kubectl get pods -A
 1542  kubectl get nodes -o wide
 1543  bin/build
 1544  docker buildx rm k8sbuilder
 1545  bin/build
 1546  kubectl get pods -A
 1547  docker buildx rm k8sbuilder;bin/build
 1548  kubectl get pods -A
 1549  docker buildx rm k8sbuilder
 1550  kubectl get pods -A
 1551  kubectl get pods -n builder
 1552  bin/build
 1553  kubectl get pods -n builder
 1554  docker buildx rm k8sbuilder
 1555  kubectl get pods -n builder
 1556  bin/build
 1557  docker buildx ls
 1558  bin/build hello
 1559  docker buildx rm k8sbuilder
 1560  kubectl get pods -n builder
 1561  bin/build hello
 1562  kubectl get pods -n builder
 1563  kubectl describe pods -n builder arm64builder-7d996c476f-z958t 
 1564  kubectl get pods -n builder
 1565  kubectl logs -n builder arm64builder-7d996c476f-z958t 
 1566  kubectl get pods -n builder
 1567  docker buildx rm k8sbuilder
 1568  kubectl get pods -n builder
 1569  bin/build hello
 1570  kubectl logs -n builder arm64builder-569d99486f-p6cr5 
 1571  kubectl get pods -n builder
 1572  kubectl logs -n builder arm64builder-569d99486f-5nk8s 
 1573  kubectl get pods -n builder
 1574  kubectl logs -n builder arm64builder-569d99486f-5nk8s 
 1575  kubectl get pods -n builder
 1576  kubectl logs -n builder arm64builder-569d99486f-5nk8s -f
 1577  kubectl get pods -n builder
 1578  kubectl logs -n builder arm64builder-569d99486f-5nk8s -f
 1579  kubectl logs -n builder arm64builder-569d99486f-6j8tj 
 1580  kubectl -n builder exec -it arm64builder-569d99486f-6j8tj -- bash
 1581  kubectl -n builder exec -it arm64builder-569d99486f-6j8tj -- sh
 1582  histiry
 1583  history
 1584  docker buildx rm k8sbuilder
 1585  bin/build hello
 1586  kubectl get pods -n builder
 1587  kubectl -n builder exec -it arm64builder-555757799f-b7gdf  -- sh
 1588  kubectl get pods -n builder -o yaml
 1589  docker buildx rm k8sbuilder
 1590  bin/build hello
 1591  kubectl get pods -A
 1592  kubectl describe pod builder 
 1593  kubectl logs -f builder 
 1594  kubectl get pods -n builder
 1595  kubectl -n builder exec -it arm64builder-569d99486f-2f7wc  -- sh
 1596  kubectl get pods -n builder
 1597  kubectl -n builder exec -it arm64builder-569d99486f-ntrb6  -- sh
 1598  kubectl get pods -n builder
 1599  kubectl logs -n builder arm64builder-569d99486f-
 1600  kubectl logs -n builder arm64builder-569d99486f-ntrb6 
 1601  kubectl get pods -n builder
 1602  kubectl logs -n builder arm64builder-569d99486f-ntrb6 
 1603  kubectl get pods -n builder
 1604  kubectl logs -n builder arm64builder-569d99486f-tqgnl 
 1605  kubectl -n builder exec -it arm64builder-569d99486f-tqgnl  -- sh
 1606  kubectl get pods -n builder
 1607  kubectl -n builder exec -it arm64builder-569d99486f-tqgnl  -- sh
 1608  kubectl get pods -n builder
 1609  docker buildx prune --force
 1610  docker buildx ls
 1611  kubectl get pods -n builder
 1612  kubectl -n builder exec -it arm64builder-569d99486f-l6hwv  -- sh
 1613  kubectl get pods -n builder
 1614  docker buildx ls
 1615  docker buildx du
 1616  kubectl get pods -n builder
 1617  docker buildx du
 1618  kubectl get pods -n builder
 1619  kubectl logs -n builder arm64builder-569d99486f-l6hwv 
 1620  docker buildx du
 1621  kubectl get pods -n builder
 1622  docker buildx du
 1623  kubectl get pods -n builder
 1624  docker buildx du
 1625  docker buildx rm k8sbuilder
 1626  bin/build hello
 1627  docker buildx du
 1628  docker buildx rm k8sbuilder
 1629  bin/build hello
 1630  kubectl get pods -n builder
 1631  docker buildx rm k8sbuilder
 1632  bin/build hello
 1633  kubectl get pods -n builder
 1634  docker buildx du
 1635  kubectl get pods -n builder
 1636  docker buildx du
 1637  kubectl get pods -n builder
 1638  docker buildx rm k8sbuilder
 1639  bin/build hello
 1640  kubectl get pods -n builder
 1641  kubectl logs -n builder amd64builder-569c9cb46f-
 1642  kubectl logs -n builder amd64builder-569c9cb46f-82ds9 
 1643  kubectl get pods -n builder
 1644  kubectl logs -n builder amd64builder-569c9cb46f-tjsz5 
 1645  kubectl get pods -n builder
 1646  docker buildx rm k8sbuilder
 1647  bin/build hello
 1648  kubectl get pods -n builder
 1649  docker buildx ls
 1650  kubectl get pods -n builder
 1651  history | grep eksctl
 1652  eksctl update nodegroup  --config-file ../cluster.yaml 
 1653  eksctl delete nodegroup --cluster paulcarlton-master ng-1-arm
 1654  eksctl delete nodegroup --cluster paulcarlton-master ng-3-arm
 1655  eksctl delete nodegroup --cluster paulcarlton-master ng-
 1656  eksctl delete nodegroup --cluster paulcarlton-master ng-2-amd
 1657  eksctl delete nodegroup --cluster paulcarlton-master ng-
 1658  eksctl create nodegroup  --config-file ../cluster.yaml
 1659  history | grep "aws eks"
 1660  aws eks list-nodegroups --cluster-name paulcarlton-master
 1661  eksctl create nodegroup  --config-file ../cluster.yaml
 1662  aws eks list-nodegroups --cluster-name paulcarlton-master
 1663  kubectl get pods -n builder
 1664  kubectl get nodes -o wide
 1665  kubectl get pods -n builder
 1666  kubectl get pods -A
 1667  kubectl get pods -n builder -o wide
 1668  docker buildx ls
 1669  kubectl get pods -n builder -o wide
 1670  kubectl get nodes -o wide
 1671  kubectl logs -n builder amd64builder-5749959fc-m9nbx 
 1672  kubectl logs -n builder -f amd64builder-5749959fc-m9nbx 
 1673  docker buildx rm k8sbuilder-amd;docker buildx rm k8sbuilder-arm
 1674  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64
 1675  bin/build
 1676  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64
 1677  bin/build
 1678  kubectl get nodes -o wide
 1679  kubectl describe node ip-192-168-3-225.eu-west-1.compute.internal
 1680  kubectl describe node ip-192-168-37-122.eu-west-1.compute.internal
 1681  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64
 1682  bin/build
 1683  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64;sleep 2;bin/build
 1684  bin/build
 1685  kubectl get pods -n builder -o wide
 1686  kubectl describe node ip-192-168-3-225.eu-west-1.compute.internal
 1687  kubectl get pods -n builder -o wide
 1688  history
 1689  eksctl delete nodegroup --cluster paulcarlton-master ng-3-arm
 1690  aws eks list-nodegroups --cluster-name paulcarlton-master
 1691  aws eks describe-nodegroup --cluster-name paulcarlton-master --nodegroup-name ng-3-arm
 1692  aws eks list-nodegroups --cluster-name paulcarlton-master
 1693  eksctl create nodegroup  --config-file ../cluster.yaml
 1694  kubectl get pods -n builder -o wide
 1695  eksctl delete nodegroup --cluster paulcarlton-master ng-3-arm
 1696  aws eks list-nodegroups --cluster-name paulcarlton-master
 1697  aws eks describe-nodegroup --cluster-name paulcarlton-master --nodegroup-name ng-3-arm
 1698  aws eks describe-nodegroup --cluster-name paulcarlton-master --nodegroup-name ng-3-arm | jq -r '.nodegroup.status'
 1699  eksctl create nodegroup  --config-file ../cluster.yaml
 1700  kubectl get pods -n builder -o wide
 1701  docker buildx ls
 1702  kubectl get pods -n builder -o wide
 1703  docker images
 1704  bin/build.sh
 1705  bin/build
 1706  dig 54.73.67.20
 1707  nslookup 54.73.67.20
 1708  export KUBECONFIG=~/.kube/kubeconfig_tekton-builder.yaml
 1709  kubectl config get-contexts
 1710  kubectl config use-context arn:aws:eks:us-west-2:024901034627:cluster/paul-carlton
 1711  cat ~/.aws/amp_tekton_builder_system_user-credentials 
 1712  vi ~/.aws/amp_rio_builder_system_user-credentials 
 1713  export KUBECONFIG=~/.kube/kubeconfig_rio-builder.yaml
 1714  kubectl config get-contexts
 1715  vi ~/.aws/amp_rio_builder_system_user-credentials
 1716  bin/build
 1717  kubectl create namespace builder
 1718  bin/build
 1719  docker login docker-upstream.apple.com
 1720  nslookup docker-upstream.apple.com
 1721  nslookup docke.apple.com
 1722  nslookup docker.apple.com
 1723  buildx ls
 1724  docker buildx ls
 1725  kubectl get pods -A
 1726  docker buildx 
 1727  docker buildx rm k8sbuilder
 1728  docker buildx ls
 1729  docker buildx rm k8s
 1730  docker buildx ls
 1731  kubectl g
 1732  kubectl get all -n rio-builder
 1733  kubectl delete deployments.apps  -n rio-builder  arm64builder 
 1734  kubectl get pods -A
 1735  kubectl get ns
 1736  kubectl delete ns rio-builder 
 1737  docker buildx ls
 1738  kubectl get pods -A
 1739  git remote -v
 1740  kubectl config get-contexts
 1741  . aws-reset.sh
 1742  aws-profile dev
 1743  aws eks list-clusters
 1744  aws eks 
 1745  aws eks help
 1746  aws eks update-kubeconfig --cluster-name paul-carlton
 1747  aws eks update-kubeconfig ---name paul-carlton
 1748  aws eks update-kubeconfig --name paul-carlton
 1749  kubectl config get-contexts
 1750  kubectl get pods -A
 1751  kubectl get nodes
 1752  kubectl get nodes -o wide
 1753  aws eks describe-cluster --name paul-carlton
 1754  aws eks list-nodegroups --cluster-name paul-carlton
 1755  aws-login 
 1756  docker logout docker.apple.com
 1757  docker login docker.apple.com
 1758  docker login docker.apple.com -?
 1759  docker login docker.apple.com -u paul_carlton
 1760  docker login docker.apple.com -u paul_carlton@apple.com
 1761  docker login docker.apple.com -u paul-carlton
 1762  docker login docker.apple.com -u paul_carlton
 1763  aws eks list-nodegroups --cluster-name paul-carlton
 1764  aws eks list-nodegroups --cluster-name paul-carlton2
 1765  rubix
 1766  rubix update 
 1767  rubix update  cluster 
 1768  rubix update  cluster paul-carlton/cluster.yaml
 1769  rubix
 1770  rubix describe
 1771  rubix describe cluster 
 1772  rubix describe cluster paul-carlton
 1773  rubix describe cluster --name  paul-carlton
 1774  rubix describe cluster --cluster-name  paul-carlton
 1775  rubix describe cluster --cluster-name  paul-carlton --account-id 024901034627
 1776  aws eks list-nodegroups --cluster-name paul-carlton
 1777  kubectl version
 1778  rubix describe cluster --cluster-name  paul-carlton --account-id 024901034627
 1779  aws eks list-nodegroups --cluster-name paul-carlton
 1780  rubix update  cluster paul-carlton/cluster.yaml
 1781  rubix update  cluster --help paul-carlton/cluster.yaml
 1782  rubix update  cluster --file paul-carlton/cluster.yaml
 1783  rubix describe cluster --cluster-name  paul-carlton --account-id 024901034627
 1784  rubix update  cluster --file paul-carlton/cluster.yaml
 1785  brew tap cloud-technologies/tools git@github.pie.apple.com:cloud-technologies/homebrew-tap.git
 1786  brew install cloud-technologies/tools/rubix
 1787  rubix version
 1788  rubix update  cluster --file paul-carlton/cluster.yaml
 1789  rubix describe cluster --cluster-name  paul-carlton --account-id 024901034627
 1790  pwd
 1791  aws eks list-nodegroups --cluster-name paul-carlton
 1792  kubectl get nodes -o wide
 1793  kubectl get pods -A -o wide
 1794  git-info.sh 
 1795  kubectl get ns
 1796  git add -A; git commit -a -m "add go builder; git push
 1797  git add -A; git commit -a -m "add go builder"; git push
 1798  git add -A; git commit -a -m "add docker builder"; git push
 1799  git remote -v
 1800  git-info.sh 
 1801  git-info.sh 
 1802  git add -A; git commit -a -m "remove stuff, add builder pod";git push
 1803  git add -A; git commit -a -m "remove tekton pod";git push
 1804  git add -A; git commit -a -m "builder pod node selector";git push
 1805  export mem=
 1806  cd graviton-poc/
 1807  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64;sleep 2;bin/build
 1808  export mem=8
 1809  export cpus=8
 1810  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64;sleep 2;bin/build
 1811  sed -i "" s/CPUS-MEM-RUN/$cpus-$mem-$run/ /Users/paulc/go/src/github.com/paulcarlton-ww/kraan/main/main.go
 1812  export run=1
 1813  export cpus=7
 1814  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64;sleep 2;bin/build
 1815  export cpus=4
 1816  export mem=8
 1817  sed -i "" s/8-8-1/$cpus-$mem-$run/ /Users/paulc/go/src/github.com/paulcarlton-ww/kraan/main/main.go
 1818  sed -i "" s/4-8-1/whaterver1/ /Users/paulc/go/src/github.com/paulcarlton-ww/kraan/main/main.go
 1819  export mem=16
 1820  export cpus=15
 1821  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64;sleep 2;bin/build
 1822  #sed -i "" s/whatever$last/whaterver$run/ /Users/paulc/go/src/github.com/paulcarlton-ww/kraan/main/main.go
 1823  last=$run;run=2
 1824  sed -i "" s/whatever$last/whaterver$run/ /Users/paulc/go/src/github.com/paulcarlton-ww/kraan/main/main.go
 1825  last=$run;run=3
 1826  export cpus=7
 1827  export mem=16
 1828  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64;sleep 2;bin/build
 1829  sed -i "" s/whatever$last/whaterver$run/ /Users/paulc/go/src/github.com/paulcarlton-ww/kraan/main/main.go
 1830  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64;sleep 2;bin/build
 1831  pwd
 1832  cd ~/go/src/github.pie.apple.com/sdp/aci-scm-ghe-aws-cluster1
 1833  aws-profile dev-east
 1834  export SDP_GITHUB2_LDAP_PASSWORD=ActuallyNot1
 1835  export SDP_GITHUB_LDAP_PASSWORD=ActuallyNot1
 1836  env | grep SDP
 1837  aws login
 1838  aws-profile dev-east
 1839  aws-login 
 1840  role=db
 1841  index=0
 1842  aws ssm start-session --region $(aws configure get region) --target   $(aws ec2 describe-instances --query \
 1843    'Reservations[*].Instances[*].[InstanceId]' \
 1844    --filters "Name=tag:Name,Values=${stack_name}-primary-${role}-${index}" \
 1845    "Name=instance-state-name,Values=running" --output text)
 1846  role=backup
 1847  aws ssm start-session --region $(aws configure get region) --target   $(aws ec2 describe-instances --query \
 1848    'Reservations[*].Instances[*].[InstanceId]' \
 1849    --filters "Name=tag:Name,Values=${stack_name}-primary-${role}-${index}" \
 1850    "Name=instance-state-name,Values=running" --output text)
 1851  stack_name=sdp-github2
 1852  role=db
 1853  aws ssm start-session --region $(aws configure get region) --target   $(aws ec2 describe-instances --query \
 1854    'Reservations[*].Instances[*].[InstanceId]' \
 1855    --filters "Name=tag:Name,Values=${stack_name}-primary-${role}-${index}" \
 1856    "Name=instance-state-name,Values=running" --output text)
 1857  role=backup
 1858  aws ssm start-session --region $(aws configure get region) --target   $(aws ec2 describe-instances --query \
 1859    'Reservations[*].Instances[*].[InstanceId]' \
 1860    --filters "Name=tag:Name,Values=${stack_name}-primary-${role}-${index}" \
 1861    "Name=instance-state-name,Values=running" --output text)
 1862  aws-lig
 1863  seaa
 1864  docker build
 1865  docker build .
 1866  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64
 1867  docker build .
 1868  docker buildx ls
 1869  ls -ltra ghes-cluster/infra/projects/ghe_aws/
 1870  mv  ghes-cluster/infra/projects/ghe_aws/6402623765336391781github-enterprise__1_.ghl ghes-cluster/infra/projects/ghe_aws/github-enterprise.ghl 
 1871  ls -ltra ghes-cluster/infra/projects/ghe_aws/
 1872  aws-profile dev-east
 1873  export SDP_GITHUB2_LDAP_PASSWORD=ActuallyNot1
 1874  export SDP_GITHUB_LDAP_PASSWORD=ActuallyNot1
 1875  role=backup
 1876  git-info.sh 
 1877  git commit -a --amend --no-edit ;git push -f
 1878  git checkout main
 1879  git pull 
 1880  git checkout -b dev-doc3
 1881  aws-login
 1882  stack_name=sdp-github
 1883  export $(echo $stack_name | sed s/-/_/ | tr 'a-z' 'A-Z')_LDAP_PASSWORD=$ldap_password
 1884  bin/infra.sh --hcs-org sdp-aws-github --stack $stack_name --op 
 1885  bin/infra.sh --hcs-org sdp-aws-github --stack $stack_name --help
 1886  bin/infra.sh --hcs-org sdp-aws-github --stack $stack_name --op preview-infra
 1887  git-info.sh 
 1888  git commit -a -m "updates from hand over meeting" ;git push
 1889  git commit -a -m --no-edit --amend ;git push -f
 1890  git add -A
 1891  git commit -a -m --no-edit --amend ;git push -f
 1892  git checkout main
 1893  git pull
 1894  stack_name=sdp-github2
 1895  bin/infra.sh --hcs-org sdp-aws-github --stack $stack_name --op preview-infra
 1896  ldap_password="JE6p?8FK7PbX8&zy"
 1897  export SDP_GITHUB2_LDAP_PASSWORD="$ldap_password"
 1898  export SDP_GITHUB2_GHE_TOKEN=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
 1899  bin/infra.sh --hcs-org sdp-aws-github --stack $stack_name --op create-infra
 1900  bin/infra.sh --hcs-org sdp-aws-github --stack $stack_name --op create-infra --project ghe_token
 1901  bin/infra.sh --hcs-org sdp-aws-github --stack $stack_name --op backup-config
 1902  aws ssm start-session --region $(aws configure get region) --target   $(aws ec2 describe-instances --query \
 1903    'Reservations[*].Instances[*].[InstanceId]' \
 1904    --filters "Name=tag:Name,Values=${stack_name}-primary-${role}-${index}" \
 1905    "Name=instance-state-name,Values=running" --output text)
 1906  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64
 1907  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64;sleep 2;bin/build
 1908  docker buildx rm k8sbuilder-amd64;docker buildx rm k8sbuilder-arm64
 1909  git add -A; git commit -a -m "buildx remote builder ";git push
 1910  git-info.sh 
 1911  rm .DS_Store 
 1912  rm docs/.DS_Store 
 1913  git-info.sh 
 1914  git add -A
 1915  git-info.sh 
 1916  git commit -a -m "documentation"; git push
 1917  git pull
 1918  git-info.sh 
 1919  git push
 1920  git-info.sh 
 1921  . ww-aws.sh
 1922  ls -l
 1923  git-info.sh 
 1924  ls -la
 1925  ls -l .gitignore 
 1926  cat .gitignore 
 1927  mkdir ../../ww-aws-fs/k8s-buildx
 1928  cp -rf * ../../ww-aws-fs/k8s-buildx
 1929  git-info.sh 
 1930  git commit -a -m "add links to project directories readme"
 1931  git push -f
 1932  export PATH=/Users/paulc/sdk/go1.18.2/bin:$PATH
 1933  clear
 1934  export DOCKER_BUILDKIT=1
 1935  docker build -t registry/imagename:tag --cache-from registry/imagename:tag --build-arg BUILDKIT_INLINE_CACHE=1 .
 1936  docker build -t registry/imagename:tag --cache-from registry/imagename:tag --build-arg BUILDKIT_INLINE_CACHE=1 . --push 
 1937  kubectl get pods -A
 1938  docker build -t $registry/$imagename:$new_tag --cache-from $registry/$imagename:$old_tag --build-arg BUILDKIT_INLINE_CACHE=1 . --push 
 1939  docker buildx ls
 1940  registry=pcarlton
 1941  imagename=kraan
 1942  old_tag=3.0.0-arm64
 1943  new_tag=3.0.1-arm64
 1944  docker buildx ls
 1945  docker build -t $registry/$imagename:$new_tag --cache-from $registry/$imagename:$old_tag --build-arg BUILDKIT_INLINE_CACHE=1 . --push 
 1946  docker login
 1947  docker build -t $registry/$imagename:$new_tag --cache-from $registry/$imagename:$old_tag --build-arg BUILDKIT_INLINE_CACHE=1 . --push 
 1948  docker build -t $registry/$imagename:$new_tag --cache-from $registry/$imagename:$old_tag --build-arg BUILDKIT_INLINE_CACHE=1 . --push --help
 1949  docker build -t $registry/$imagename:$new_tag --cache-from $registry/$imagename:$old_tag --build-arg BUILDKIT_INLINE_CACHE=1 . --push 
 1950  docker images
 1951  docker build -t $registry/$imagename:$new_tag --cache-from $registry/$imagename:$old_tag --build-arg BUILDKIT_INLINE_CACHE=1 . --push 
 1952  docker build -t $registry/$imagename:$new_tag  --build-arg BUILDKIT_INLINE_CACHE=1 . --push 
 1953  docker images 
 1954  docker build -t $registry/$imagename:$new_tag  --build-arg BUILDKIT_INLINE_CACHE=1 . --push 
 1955  old_tag=3.0.1-arm64
 1956  new_tag=3.0.2-arm64
 1957  docker build -t $registry/$imagename:$new_tag --cache-from $registry/$imagename:$old_tag --build-arg BUILDKIT_INLINE_CACHE=1 . --push 
 1958  git init
 1959  git add -A
 1960  git-info.sh 
 1961  git commit -m "first commit"
 1962  git branch -M main
 1963  git remote add origin https://github.com/ww-aws-fs/k8s-buildx.git
 1964  git push -u origin main
 1965  git commit -m "Documentation update and file tidy up"; git push
 1966  git add -A;git commit -m "Documentation update and file tidy up"; git push
 1967  git-info.sh 
 1968  curl ifconfig.me
 1969  eksctl create cluster --config-file resources/eks-cluster.yaml 
 1970  . ww-aws.sh
 1971  eksctl create cluster --config-file resources/eks-cluster.yaml 
 1972  git-info.sh 
 1973  git pull
 1974  eksctl delete cluster --config-file resources/eks-cluster.yaml --wait --force
 1975  git-info.sh 
 1976  git comit -a -m "Update eks-cluster.yaml";git push
 1977  git commit -a -m "Update eks-cluster.yaml";git push
 1978  git commit -a -m "Move test pod to keep";git push
 1979  eksctl create cluster --config-file resources/eks-cluster.yaml 
 1980  git pull
 1981  aws eks --region "$AWS_REGION" update-kubeconfig --name ww-aws-fs-eks-buildx
 1982  git-info.sh 
 1983  git add -A;git commit -a -m "option one - remote build linked to client";git push
 1984  git commit -a -m "documentation update"; git push
 1985  brew uninstall
 1986  brew list
 1987  brew uninstall awsappleconnect 
 1988  brew list
 1989  find . -name "*appleconnect*"
 1990  cd /
 1991  sudo su
 1992  cd /
 1993  sudo su
 1994  /Library/PrivilegedHelperTools/com.apple.ist.ds.appleconnect.appleconnectuninstall
 1995  sudo cat /Library/PrivilegedHelperTools/com.apple.ist.ds.appleconnect.appleconnectuninstall
 1996  sudo su
 1997  export PATH=/Users/paulc/sdk/go1.18.2/bin:$PATH
 1998  clear
 1999  terraform 
 2000  terrafrom -chdir remote-state init
 2001  terraform -chdir remote-state init
 2002  terraform -chdir=remote-state init
 2003  terraform -chdir=remote-state validate
 2004  terraform init
 2005  terraform  validate
 2006  terraform -chdir=remote-state validate
 2007  terraform init
 2008  terraform -chdir=remote-state init
 2009  terraform -chdir=remote-state validate
 2010  terraform -chdir=remote-state init
 2011  terraform -chdir=remote-state validate
 2012  terraform -chdir=remote-state init
 2013  terraform -chdir=remote-state validate
 2014  terraform -chdir=remote-state init
 2015  terraform -chdir=remote-state validate
 2016  terraform -chdir=remote-state plan
 2017  . ww-aws.sh
 2018  terraform -chdir=remote-state plan
 2019  terraform -chdir=remote-state plan -out 
 2020  terraform -chdir=remote-state plan -out --help
 2021  terraform -chdir=remote-state plan -out /tmp/plan-$$
 2022  ls -l /tmp/plan-69027 
 2023  terraform -chdir=remote-state apply "/tmp/plan-69027"
 2024  aws s3 ls
 2025  terraform -chdir=remote-state plan -out /tmp/plan-$$ -var
 2026  terraform -chdir=remote-state plan -out /tmp/plan-$$ -var bucket_name=paulcarlton-dev-terrafrom-state
 2027  terraform -chdir=remote-state apply "/tmp/plan-69027"
 2028  aws s3 ls
 2029  aws s3 
 2030  aws s3 help
 2031  aws s3api 
 2032  aws s3api --help
 2033  aws s3api help
 2034  aws s3api get-bucket-policy paulcarlton-dev-terraform-state
 2035  aws s3api get-bucket-policy --bucket paulcarlton-dev-terraform-state
 2036  terraform -chdir=remote-state destroy "/tmp/plan-69027"
 2037  terraform -chdir=remote-state apply "/tmp/plan-69027" -destroy
 2038  terraform -chdir=remote-state apply -destroy "/tmp/plan-69027" 
 2039  terraform -chdir=remote-state destroy
 2040  terraform -chdir=remote-state plan -out /tmp/plan-$$ -var bucket_name=paulcarlton-dev-terraform-state
 2041  terraform -chdir=remote-state apply "/tmp/plan-69027"
 2042  aws s3api get-bucket-policy --bucket paulcarlton-dev-terraform-state
 2043  aws s3 ls
 2044  aws s3api get-bucket-policy --bucket paulcarlton-dev-terraform-state
 2045  aws s3api get-bucket --bucket paulcarlton-dev-terraform-state
 2046  aws s3api get-bucket-acl --bucket paulcarlton-dev-terraform-state
 2047  terraform -chdir=remote-state plan -out /tmp/plan-$$ -var bucket_name=paulcarlton-dev-terraform-state
 2048  terraform -chdir=remote-state apply "/tmp/plan-69027"
 2049  terraform -chdir=remote-state plan -out /tmp/plan-$$ -var bucket_name=paulcarlton-dev-terraform-state
 2050  terraform -chdir=remote-state apply "/tmp/plan-69027"
 2051  terraform -chdir=remote-state plan -out /tmp/plan-$$ -var bucket_name=paulcarlton-dev-terraform-state
 2052  terraform -chdir=remote-state apply "/tmp/plan-69027"
 2053  terraform -chdir=remote-state move 
 2054  terraform -chdir=remote-state 
 2055  terraform -chdir=remote-state plan -out /tmp/plan-$$ -var bucket_name=paulcarlton-dev-terraform-state
 2056  terraform -chdir=remote-state init
 2057  terraform output 
 2058  terraform -chdir=remote-state output
 2059  terraform -chdir=remote-state init -backend-config="bucket=paulcarlton-dev-terraform-state" 
 2060  terraform -chdir=remote-state init 
 2061  terraform -chdir=remote-state plan -out /tmp/plan-$$ -var bucket_name=paulcarlton-dev-terraform-state
 2062  terraform -chdir=instance plan -out /tmp/instance-plan-$$ 
 2063  terraform -chdir=instance plan init
 2064  terraform -chdir=instance  init
 2065  terraform -chdir=vpc  init
 2066  terraform -chdir=vpc  init -migrate-state
 2067  aws s3api list-objects 
 2068  aws s3api list-objects --bucket paulcarlton-dev-terraform-state
 2069  terraform -chdir=vpc  init -migrate-state
 2070  terraform -chdir=vpc  init 
 2071  terraform -chdir=remote-state init 
 2072  terraform -chdir=instance plan -out /tmp/instance-plan-$$ 
 2073  terraform -chdir=remote-state plan -out /tmp/instance-plan-$$ 
 2074  terraform -chdir=remote-state destroy
 2075  env | grep REG
 2076  terraform -chdir=remote-state destroy
 2077  terraform -chdir=remote-state destroy 
 2078  terraform -chdir=remote-state plan -out /tmp/instance-plan-$$ 
 2079  terraform -chdir=remote-state apply /tmp/instance-plan-$$ 
 2080  terraform -chdir=remote-state plan -out /tmp/instance-plan-$$ 
 2081  terraform -chdir=remote-state apply /tmp/instance-plan-$$ 
 2082  terraform -chdir=remote-state plan -out /tmp/instance-plan-$$ 
 2083  terraform -chdir=remote-state apply /tmp/instance-plan-$$ 
 2084  terraform -chdir=remote-state plan -out /tmp/instance-plan-$$ 
 2085  terraform -chdir=remote-state apply /tmp/instance-plan-$$ 
 2086  mv aws-deploy ~/work
 2087  terraform -chdir=remote-state output
 2088  terraform -chdir=remote-state output --help
 2089  terraform -chdir=remote-state output -json
 2090  terraform -chdir=remote-state output -json bucket_id
 2091  terraform -chdir=remote-state output bucket_id
 2092  terraform -chdir=remote-state output --help
 2093  terraform -chdir=remote-state output bucket_id
 2094  terraform -chdir=remote-state output 
 2095  terraform -chdir=remote-state output outs
 2096  terraform -chdir=remote-state output -json 
 2097  terraform -chdir=remote-state output -json outs
 2098  terraform -chdir=remote-state output -json outs | jq -r '.bucket_id'
 2099  bucket_name=$(terraform -chdir=remote-state output -json outs | jq -r '.bucket_id')
 2100  terraform -chdir=vpc  init -backend-config="bucket=$bucket_name"
 2101  terraform -chdir=remote-state plan -out /tmp/vpc-plan-$$ 
 2102  terraform -chdir=vpc plan -out /tmp/vpc-plan-$$ 
 2103  terraform -chdir=vpc validate
 2104  terraform -chdir=vpc apply /tmp/vpc-plan-$$ 
 2105  git-info.sh 
 2106  git init
 2107  git-info.sh 
 2108  git add -A
 2109  git-info.sh 
 2110  git commit -a -m "Initial version, WIP";git push
 2111  git-info.sh 
 2112  git branch -M main
 2113  git remote add origin git@github.com:ww-pc-incubation/dev-ec2.git
 2114  git push -u origin main
 2115  aws s3api list-objects --bucket paulcarlton-dev-terraform-state
 2116  aws s3api list-objects --bucket paulcarlton-tf-state
 2117  history > notes.sh
