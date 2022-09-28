Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1odPWe-0002MJ-F7
	for mharc-qemu-riscv@gnu.org; Wed, 28 Sep 2022 01:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyang22@iscas.ac.cn>)
 id 1odPWZ-0002Jm-Us; Wed, 28 Sep 2022 01:22:24 -0400
Received: from smtp85.cstnet.cn ([159.226.251.85]:35060 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuyang22@iscas.ac.cn>)
 id 1odPWX-0007t2-B0; Wed, 28 Sep 2022 01:22:23 -0400
Received: from liuyang22$iscas.ac.cn ( [46.232.120.163] ) by
 ajax-webmail-APP-13 (Coremail) ; Wed, 28 Sep 2022 13:22:13 +0800
 (GMT+08:00)
X-Originating-IP: [46.232.120.163]
Date: Wed, 28 Sep 2022 13:22:13 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5YiY6Ziz?= <liuyang22@iscas.ac.cn>
To: "Alistair Francis" <alistair23@gmail.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
 "Alistair Francis" <alistair.francis@wdc.com>, 
 "Bin Meng" <bin.meng@windriver.com>, "Tommy Wu" <tommy.wu@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?Q?Wei_Wu_=28=E5=90=B4=E4=BC=9F=29?= <lazyparser@gmail.com>, 
 liweiwei <liweiwei@iscas.ac.cn>
Subject: Re: Re: [PATCH v2] disas/riscv.c: rvv: Add disas support for vector
 instructions
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220622(41e5976f)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
In-Reply-To: <CAKmqyKNNyyC0qcPam8iYTqreAF=jYuX0=qCSe6sr2xja0g9_oQ@mail.gmail.com>
References: <20220826032258.7289-1-liuyang22@iscas.ac.cn>
 <CAKmqyKO2p8DF-e0UujtZu8gJpH+=BE6w1KZo5fA0vkK+=mk03A@mail.gmail.com>
 <CAKmqyKNNyyC0qcPam8iYTqreAF=jYuX0=qCSe6sr2xja0g9_oQ@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <15ad96e6.24ec8.183828ba508.Coremail.liuyang22@iscas.ac.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: twCowACniZoG2jNjiWQDAA--.36875W
X-CM-SenderInfo: 5olx5tdqjsjq5lvft2wodfhubq/1tbiBwcDAGMznGvNzAAAsl
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=159.226.251.85;
 envelope-from=liuyang22@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 28 Sep 2022 05:22:25 -0000

CgoKJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KJmd0OyBGcm9tOiAiQWxpc3RhaXIg
RnJhbmNpcyIgPGFsaXN0YWlyMjNAZ21haWwuY29tPgomZ3Q7IFNlbnQgVGltZTogMjAyMi0wOS0y
NyAwOTo1NzozOSAoVHVlc2RheSkKJmd0OyBUbzogIllhbmcgTGl1IiA8bGl1eWFuZzIyQGlzY2Fz
LmFjLmNuPgomZ3Q7IENjOiAiUGFsbWVyIERhYmJlbHQiIDxwYWxtZXJAZGFiYmVsdC5jb20+LCAi
QWxpc3RhaXIgRnJhbmNpcyIgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4sICJCaW4gTWVuZyIg
PGJpbi5tZW5nQHdpbmRyaXZlci5jb20+LCAiVG9tbXkgV3UiIDx0b21teS53dUBzaWZpdmUuY29t
PiwgIm9wZW4gbGlzdDpSSVNDLVYiIDxxZW11LXJpc2N2QG5vbmdudS5vcmc+LCAicWVtdS1kZXZl
bEBub25nbnUub3JnIERldmVsb3BlcnMiIDxxZW11LWRldmVsQG5vbmdudS5vcmc+LCB3YW5nanVu
cWlhbmcgPHdhbmdqdW5xaWFuZ0Bpc2Nhcy5hYy5jbj4sICJXZWkgV3UgKOWQtOS8nykiIDxsYXp5
cGFyc2VyQGdtYWlsLmNvbT4sIGxpd2Vpd2VpIDxsaXdlaXdlaUBpc2Nhcy5hYy5jbj4KJmd0OyBT
dWJqZWN0OiBSZTogW1BBVENIIHYyXSBkaXNhcy9yaXNjdi5jOiBydnY6IEFkZCBkaXNhcyBzdXBw
b3J0IGZvciB2ZWN0b3IgaW5zdHJ1Y3Rpb25zCiZndDsgCiZndDsgT24gRnJpLCBTZXAgMjMsIDIw
MjIgYXQgMjoyNyBQTSBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpcjIzQGdtYWlsLmNvbT4gd3Jv
dGU6CiZndDsgJmd0OwomZ3Q7ICZndDsgT24gRnJpLCBBdWcgMjYsIDIwMjIgYXQgMToyNiBQTSBZ
YW5nIExpdSA8bGl1eWFuZzIyQGlzY2FzLmFjLmNuPiB3cm90ZToKJmd0OyAmZ3Q7ICZndDsKJmd0
OyAmZ3Q7ICZndDsgVGVzdGVkIHdpdGggaHR0cHM6Ly9naXRodWIuY29tL2tzY28vcnZ2LWRlY29k
ZXItdGVzdHMKJmd0OyAmZ3Q7ICZndDsKJmd0OyAmZ3Q7ICZndDsgRXhwZWN0ZWQgY2hlY2twYXRj
aCBlcnJvcnMgZm9yIGNvbnNpc3RlbmN5IGFuZCBicmV2aXR5IHJlYXNvbnM6CiZndDsgJmd0OyAm
Z3Q7CiZndDsgJmd0OyAmZ3Q7IEVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwomZ3Q7ICZn
dDsgJmd0OyBFUlJPUjogdHJhaWxpbmcgc3RhdGVtZW50cyBzaG91bGQgYmUgb24gbmV4dCBsaW5l
CiZndDsgJmd0OyAmZ3Q7IEVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFy
bXMgb2YgdGhpcyBzdGF0ZW1lbnQKJmd0OyAmZ3Q7ICZndDsKJmd0OyAmZ3Q7ICZndDsgU2lnbmVk
LW9mZi1ieTogWWFuZyBMaXUgPGxpdXlhbmcyMkBpc2Nhcy5hYy5jbj4KJmd0OyAmZ3Q7CiZndDsg
Jmd0OyBUaGFua3MhCiZndDsgJmd0OwomZ3Q7ICZndDsgQXBwbGllZCB0byByaXNjdi10by1hcHBs
eS5uZXh0CiZndDsgCiZndDsgVGhpcyBwYXRjaCBmYWlscyB0byBidWlsZCB3aXRoIHRoaXMgZXJy
b3I6CiZndDsgCiZndDsgLi4vZGlzYXMvcmlzY3YuYzogSW4gZnVuY3Rpb24gJ3ByaW50X2luc25f
cmlzY3YnOgomZ3Q7IC4uL2Rpc2FzL3Jpc2N2LmM6NDUxMzozMDogZXJyb3I6ICdfX2J1aWx0aW5f
X19zcHJpbnRmX2NoaycgbWF5IHdyaXRlIGEKJmd0OyB0ZXJtaW5hdGluZyBudWwgcGFzdCB0aGUg
ZW5kIG9mIHRoZSBkZXN0aW5hdGlvbgomZ3Q7IFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dCiZn
dDsgIDQ1MTMgfCAgICAgICAgICAgICBzcHJpbnRmKG5idWYsICIlZCIsIHNldyk7CiZndDsgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KJmd0OyBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gL3Vzci9pbmNsdWRlL3N0ZGlvLmg6OTA2LAomZ3Q7ICAgICAgICAgICAgICAgICAgZnJv
bQomZ3Q7IC9zY3JhdGNoL2plbmtpbnMtdG1wL3dvcmtzcGFjZS9RRU1VLU11bHRpLUNvbmZpZy1C
dWlsZC9CVUlMRF9PUFRJT05TL0dDQy9pbmNsdWRlL3FlbXUvb3NkZXAuaDo5NywKJmd0OyAgICAg
ICAgICAgICAgICAgIGZyb20gLi4vZGlzYXMvcmlzY3YuYzoyMDoKJmd0OyBJbiBmdW5jdGlvbiAn
c3ByaW50ZicsCiZndDsgICAgIGlubGluZWQgZnJvbSAnZm9ybWF0X2luc3QnIGF0IC4uL2Rpc2Fz
L3Jpc2N2LmM6NDUxMzoxMywKJmd0OyAgICAgaW5saW5lZCBmcm9tICdkaXNhc21faW5zdCcgYXQg
Li4vZGlzYXMvcmlzY3YuYzo0NjQwOjUsCiZndDsgICAgIGlubGluZWQgZnJvbSAncHJpbnRfaW5z
bl9yaXNjdicgYXQgLi4vZGlzYXMvcmlzY3YuYzo0NjkwOjU6CiZndDsgL3Vzci9pbmNsdWRlL2Jp
dHMvc3RkaW8yLmg6MzA6MTA6IG5vdGU6ICdfX2J1aWx0aW5fX19zcHJpbnRmX2NoaycKJmd0OyBv
dXRwdXQgYmV0d2VlbiAyIGFuZCA1IGJ5dGVzIGludG8gYSBkZXN0aW5hdGlvbiBvZiBzaXplIDQK
Jmd0OyAgICAzMCB8ICAgcmV0dXJuIF9fYnVpbHRpbl9fX3NwcmludGZfY2hrIChfX3MsIF9fVVNF
X0ZPUlRJRllfTEVWRUwgLSAxLAomZ3Q7ICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiZndDsgICAgMzEgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19nbGliY19vYmpzaXplIChfX3MpLCBfX2Zt
dCwKJmd0OyAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgomZ3Q7ICAgIDMyIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF9fdmFfYXJnX3BhY2sgKCkpOwomZ3Q7ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+CiZndDsgCiZndDsgCiZndDsg
QWxpc3RhaXIKJmd0OyAKClRoYW5rcyBmb3IgdGhlIHJldmlldywgSSd2ZSBzdWJtaXR0ZWQgYSB2
MyBwYXRjaC4KCllhbmcKCiZndDsgJmd0OyAmZ3Q7ICAgICAgZGVjb2RlX2luc3Rfb3BlcmFuZHMo
JmFtcDtkZWMpOwomZ3Q7ICZndDsgJmd0OyAgICAgIGRlY29kZV9pbnN0X2RlY29tcHJlc3MoJmFt
cDtkZWMsIGlzYSk7CiZndDsgJmd0OyAmZ3Q7ICAgICAgZGVjb2RlX2luc3RfbGlmdF9wc2V1ZG8o
JmFtcDtkZWMpOwomZ3Q7ICZndDsgJmd0OyAtICAgIGZvcm1hdF9pbnN0KGJ1ZiwgYnVmbGVuLCAx
NiwgJmFtcDtkZWMpOwomZ3Q7ICZndDsgJmd0OyArICAgIGZvcm1hdF9pbnN0KGJ1ZiwgYnVmbGVu
LCAyNCwgJmFtcDtkZWMpOwomZ3Q7ICZndDsgJmd0OyAgfQomZ3Q7ICZndDsgJmd0OwomZ3Q7ICZn
dDsgJmd0OyAgI2RlZmluZSBJTlNUX0ZNVF8yICIlMDQiIFBSSXg2NCAiICAgICAgICAgICAgICAi
CiZndDsgJmd0OyAmZ3Q7IC0tCiZndDsgJmd0OyAmZ3Q7IDIuMzAuMSAoQXBwbGUgR2l0LTEzMCkK
Jmd0OyAmZ3Q7ICZndDsKJmd0OyAmZ3Q7ICZndDsKPC9saXV5YW5nMjJAaXNjYXMuYWMuY24+PC9s
aXV5YW5nMjJAaXNjYXMuYWMuY24+PC9hbGlzdGFpcjIzQGdtYWlsLmNvbT48L2xpd2Vpd2VpQGlz
Y2FzLmFjLmNuPjwvbGF6eXBhcnNlckBnbWFpbC5jb20+PC93YW5nanVucWlhbmdAaXNjYXMuYWMu
Y24+PC9xZW11LWRldmVsQG5vbmdudS5vcmc+PC9xZW11LXJpc2N2QG5vbmdudS5vcmc+PC90b21t
eS53dUBzaWZpdmUuY29tPjwvYmluLm1lbmdAd2luZHJpdmVyLmNvbT48L2FsaXN0YWlyLmZyYW5j
aXNAd2RjLmNvbT48L3BhbG1lckBkYWJiZWx0LmNvbT48L2xpdXlhbmcyMkBpc2Nhcy5hYy5jbj48
L2FsaXN0YWlyMjNAZ21haWwuY29tPg==

