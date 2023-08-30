/*  
	如何获取参数  请看教程
	https://blog.csdn.net/weixin_41939688/article/details/105752126
	https://github.com/XIU2/CloudflareSpeedTest/issues/40
	下面是json解析  用的是Python
	https://blog.csdn.net/sinat_33718563/article/details/123210906
*/
gmail=wwwce3620@gmail.com
key=d1de97f38eff107b86ae3616f13651fbe5484
domainID=a81fe9795838a65e8982aa73978b13a7
//这个是具体解析域名的ID 获取 方式请看教程 ce.2wr.life
dnsID=3e8e36f7ffb823a97fd99b2d60c2f79f

curl -X PUT "https://api.cloudflare.com/client/v4/zones/$domainID/dns_records/$dnsID" \
-H "X-Auth-Email: $gmail" \
-H "X-Auth-Key: $key" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"ce.2wr.life","content":"172.67.109.48","ttl":1,"proxied":true}'