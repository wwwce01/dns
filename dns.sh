/*  
	如何获取参数  请看教程
	https://blog.csdn.net/weixin_41939688/article/details/105752126
	https://github.com/XIU2/CloudflareSpeedTest/issues/40
	下面是json解析  用的是Python
	https://blog.csdn.net/sinat_33718563/article/details/123210906
 	定时任务设置教程 https://ednovas.xyz/2022/02/09/cfddns/#%E9%85%8D%E7%BD%AE%E4%BF%A1%E6%81%AF
  	"'"$dnsIP"'" 这个地方  引号不对导致提交数据一直不对  提示教程 https://blog.csdn.net/zh17673640696/article/details/125410881
*/
gmail=wwwce3620@gmail.com
key=d1de97f38eff107b86ae3616f13651fbe5484
domainID=a81fe9795838a65e8982aa73978b13a7
//这个是具体解析域名的ID 获取 方式请看教程 ce.2wr.life
dnsID=3e8e36f7ffb823a97fd99b2d60c2f79f


//获取服务器随机IP
resultIP=$(curl -X POST "https://api.hostmonit.com/get_optimization_ip" \
-H "Referer: https://stock.hostmonit.com/" \
-H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36" \
-H "Content-Type: application/json" \
--data '{"key":"iDetkOys"}')
//echo $resultIP
dnsIP=$(echo $resultIP | python -c "import sys, json,random; print json.load(sys.stdin)['info'][random.randint(0,14)]['ip']")
echo $dnsIP
curl -X PUT "https://api.cloudflare.com/client/v4/zones/$domainID/dns_records/$dnsID" \
-H "X-Auth-Email: $gmail" \
-H "X-Auth-Key: $key" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"ce.2wr.life","content":"'"$dnsIP"'","ttl":1,"proxied":true}'
