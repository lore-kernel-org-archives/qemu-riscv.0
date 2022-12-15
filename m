Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5prb-0003aC-5Z
	for mharc-qemu-riscv@gnu.org; Thu, 15 Dec 2022 10:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <503386372@qq.com>)
 id 1p5jtt-0005Rj-0W; Thu, 15 Dec 2022 03:47:33 -0500
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <503386372@qq.com>)
 id 1p5jtm-0006Fa-Dj; Thu, 15 Dec 2022 03:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1671094034; bh=SB0RW693wY9f+9WDRYYgFMh0If5yz2OHJNJxtJYm32A=;
 h=From:To:Cc:Subject:Date;
 b=VBPXuMdTUfHMifc49xfGdxTIcu5RCgiCzX+7uEOc7TmyJ21IJKKNQTLc1wIovN17m
 6vHPJxAFXXJjIB99wq6XhE6vKiTmPl91HeVYT779tnn4sscIEsezGIM9Hpaf3QIH0B
 Ay5+0UTIsV9V9VSl8jkw68ayaeqUJ/D/AItDnCdY=
X-QQ-FEAT: oHWrrGTW1dCni6VLWI7Xi3lwP5c1dnPf
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMAILINFO: OY1xLn4i1DCCVQWPUW4HfXtU6Ss1Tb/sZsstcMkVBrH/rijbnhTtgdMYwXD6Wj
 1eKo62cnq6WBRN1C7W8EM0ySxjHrJ0QQukw4w8Ajk7ICccJB8et0adRDn8ofdwv5nVjVyru1ABZGk
 kyo9WXbbYODEOxcrtJSY4SazuPFpfhjMxAGAQa+rocJa3+3mZxADfWbab2+TD/aUXiCuuw/gX+jGr
 zMAn4QNE8M6I8wlbfSeZN+2CfD+fnynqcsPI7N+33WaAaqiHiH2LhGOAeNXG0gWi636UpdS67kHtB
 0Y3wRLKtGpNLlz3EhTy3DvDiQNW4tj+ZUHkyaEYbi/TETJZnylAhilRUDQWt7ZLrLsCA6L4VJK0xw
 ml/6zZEz2Eg/slh6ZUKFQGw9OLGCsnAGDuHyQm7oAE+0Mmv6+ij8Ro0ik2If3S3o5gZXy9F76wn3q
 gk3ngV2Sa+z4RsfmHY7h44e5DKzCoQLVoTErWIJEqIzeVwOTdsz0g8VG+u7E9nBid8ougwiz5CFDx
 kYWwcbYD9Mh1n/NIJHYbs5eU+7stxs9d9qrHc9gAmi+MSnSTxBZ9rC+YxBqg1lvrINy1rZG6YwIu2
 BEuH5i4vLygYMYYCj/Yjr1nh3g1UzN4SV3WfUhTM7LHA3aar+bQYNutMu+H5GjchYAQhGRa1qUmwS
 hP9ZYYD8mMfGvr9HtDBSKHAtXjsH3x+3nIEnmX4sgXKZLvL6Pw9BfTlZRncnQbvJL9O9cnHOmN/ka
 YZ/zD6eMLo8alNwRU/9gtWxEq42779ds5dhm5umd/ZN0w9zq9E1GweAUxspJJlBUkWiyDaTv4U3Vu
 ObTKQMXw9Kqk/gYee0ETDCcGNdMgCxpk1+pMdpHqOTXkeslWx7WTW8sJYNtgrMMgY+P5OsxmSI519
 l5JhcXUw8MP128+VbiR0nU6ZLBT4S5T26XsJtQDDvSyQmdFnU8Tjw==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 111.201.238.26
X-QQ-STYLE: 
X-QQ-mid: webmail438t1671093964t209740
From: "=?ISO-8859-1?B?RWx0YQ==?=" <503386372@qq.com>
To: "=?ISO-8859-1?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>
Cc: "=?ISO-8859-1?B?cGFsbWVy?=" <palmer@dabbelt.com>,
 "=?ISO-8859-1?B?YWxpc3RhaXIuZnJhbmNpcw==?=" <alistair.francis@wdc.com>,
 "=?ISO-8859-1?B?YmluLm1lbmc=?=" <bin.meng@windriver.com>,
 "=?ISO-8859-1?B?cWVtdS1yaXNjdg==?=" <qemu-riscv@nongnu.org>
Subject: [PATCH] target/riscv/cpu.c: Fix elen check
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_639ADECC_0F8747B0_108EA812"
Content-Transfer-Encoding: 8Bit
Date: Thu, 15 Dec 2022 16:46:03 +0800
X-Priority: 3
Message-ID: <tencent_60E46E9E0EA5052F26E07A56520177BE0008@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Received-SPF: pass client-ip=162.62.57.137; envelope-from=503386372@qq.com;
 helo=out162-62-57-137.mail.qq.com
X-Spam_score_int: 21
X-Spam_score: 2.1
X-Spam_bar: ++
X-Spam_report: (2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1, FROM_EXCESS_BASE64=0.001,
 HELO_DYNAMIC_IPADDR=1.951, HTML_MESSAGE=0.001, NO_FM_NAME_IP_HOSTN=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Dec 2022 10:09:33 -0500
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2022 08:47:33 -0000

This is a multi-part message in MIME format.

------=_NextPart_639ADECC_0F8747B0_108EA812
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

U2hvdWxkIGJlIGNwdS0mZ3Q7Y2ZnLmVsZW4gaW4gcmFuZ2UgWzgsIDY0XS4NCg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBEb25neHVlIFpoYW5nIDxlbHRhLmVyYUBnbWFpbC5jb20mZ3Q7DQotLS0N
CiZuYnNwO3RhcmdldC9yaXNjdi9jcHUuYyB8IDIgKy0NCiZuYnNwOzEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQoNCmRpZmYgLS1naXQgYS90YXJn
ZXQvcmlzY3YvY3B1LmMgYi90YXJnZXQvcmlzY3YvY3B1LmMNCmluZGV4IGQxNGU5NWM5ZGMu
LjFlODAzMmM5NjkgMTAwNjQ0DQotLS0gYS90YXJnZXQvcmlzY3YvY3B1LmMNCisrKyBiL3Rh
cmdldC9yaXNjdi9jcHUuYw0KQEAgLTg3MCw3ICs4NzAsNyBAQCBzdGF0aWMgdm9pZCByaXNj
dl9jcHVfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQombmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsiVmVjdG9yIGV4dGVuc2lvbiBFTEVOIG11
c3QgYmUgcG93ZXIgb2YgMiIpOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtyZXR1cm47DQombmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt9DQotJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaWYgKGNwdS0mZ3Q7Y2ZnLmVsZW4gJmd0OyA2NCB8
fCBjcHUtJmd0O2NmZy52bGVuIDwgOCkgew0KKyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7IGlmIChjcHUtJmd0O2NmZy5lbGVuICZndDsgNjQgfHwgY3B1LSZn
dDtjZmcuZWxlbiA8IDgpIHsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ZXJyb3Jfc2V0ZyhlcnJwLA0KJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IlZlY3RvciBleHRlbnNpb24gaW1wbGVtZW50
YXRpb24gb25seSBzdXBwb3J0cyBFTEVOICINCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyJpbiB0aGUgcmFuZ2UgWzgsIDY0XSIpOw0KLS0mbmJzcDsNCjIuMTcuMQ==

------=_NextPart_639ADECC_0F8747B0_108EA812
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj48ZGl2PlNob3VsZCBiZSBjcHUtJmd0O2NmZy5lbGVuIGlu
IHJhbmdlIFs4LCA2NF0uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5TaWduZWQtb2ZmLWJ5
OiBEb25neHVlIFpoYW5nICZsdDtlbHRhLmVyYUBnbWFpbC5jb20mZ3Q7PC9kaXY+PGRpdj4t
LS08L2Rpdj48ZGl2PiZuYnNwO3RhcmdldC9yaXNjdi9jcHUuYyB8IDIgKy08L2Rpdj48ZGl2
PiZuYnNwOzEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKTwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+ZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9jcHUu
YyBiL3RhcmdldC9yaXNjdi9jcHUuYzwvZGl2PjxkaXY+aW5kZXggZDE0ZTk1YzlkYy4uMWU4
MDMyYzk2OSAxMDA2NDQ8L2Rpdj48ZGl2Pi0tLSBhL3RhcmdldC9yaXNjdi9jcHUuYzwvZGl2
PjxkaXY+KysrIGIvdGFyZ2V0L3Jpc2N2L2NwdS5jPC9kaXY+PGRpdj5AQCAtODcwLDcgKzg3
MCw3IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2NwdV9yZWFsaXplKERldmljZVN0YXRlICpkZXYs
IEVycm9yICoqZXJycCk8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyJWZWN0b3IgZXh0ZW5zaW9uIEVMRU4gbXVzdCBiZSBwb3dlciBvZiAyIik7PC9k
aXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwO3JldHVybjs8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO308L2Rpdj48ZGl2Pi0mbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBpZiAoY3B1LSZndDtjZmcuZWxlbiAmZ3Q7
IDY0IHx8IGNwdS0mZ3Q7Y2ZnLnZsZW4gJmx0OyA4KSB7PC9kaXY+PGRpdj4rJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaWYgKGNwdS0mZ3Q7Y2ZnLmVsZW4g
Jmd0OyA2NCB8fCBjcHUtJmd0O2NmZy5lbGVuICZsdDsgOCkgezwvZGl2PjxkaXY+Jm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDtlcnJvcl9zZXRnKGVycnAsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsiVmVjdG9yIGV4dGVuc2lvbiBpbXBsZW1lbnRhdGlvbiBvbmx5IHN1cHBv
cnRzIEVMRU4gIjwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ImluIHRoZSByYW5nZSBbOCwgNjRdIik7PC9kaXY+PGRpdj4tLSZuYnNwOzwvZGl2Pjxk
aXY+Mi4xNy4xPC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+

------=_NextPart_639ADECC_0F8747B0_108EA812--


