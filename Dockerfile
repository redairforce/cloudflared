FROM ubuntu:latest

RUN apt update && apt install -y apt-transport-https ca-certificates curl gnupg lsb-release iproute2 dnsutils

RUN mkdir -p --mode=0755 /usr/share/keyrings

RUN curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

RUN echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared buster main" | tee /etc/apt/sources.list.d/cloudflare-main.list >/dev/null

RUN apt update && apt install -y cloudflared

RUN cloudflared --version

COPY startup-script.sh /usr/local/bin/startup-script.sh

RUN chmod +x /usr/local/bin/startup-script.sh

CMD ["sh", "/usr/local/bin/startup-script.sh"]

CMD ["cloudflared"]
