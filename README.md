# sslscan_docker
Simple docker wrapper around https://github.com/NFCRing/sslscan

## USAGE

Create a hosts.txt file with domains to check on separate lines

```
www.github.com
www.microsoft.com
```

Assuming your hosts.txt is in the current users home directory, and that you want the results available on port 8080 on the host, you can start the container like this:

`docker run -d --name sslscan -p 8080:80 \`

`-v ~/hosts.txt:/root/git/sslscan/hosts.txt \` 

`stubdal/sslscan`

It runs cron that will kick off a new scan every night at 01:00 AM which does a git pull on [#fuzzerman's ](https://twitter.com/fuzzerman) [sslscan script](https://github.com/NFCRing/sslscan) and then runs it.

To scan immediately, run:

`docker exec -it sslscan /root/runscan.sh`

When done, you should ger results similar to this:
![Example result](https://www.stubdal.net/official/docker/sslscan.png)


## Credits

Thanks to https://reglund.com for creating the Qualys sslscan wrapper, available at https://github.com/NFCRing/sslscan

Thanks to https://www.qualys.com for their excellent [ssl scanning system](https://www.ssllabs.com/ssltest/)
