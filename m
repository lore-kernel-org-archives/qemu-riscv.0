Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oArzR-0005HH-O1
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 07:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oArzJ-0005Eb-MF; Mon, 11 Jul 2022 07:54:05 -0400
Received: from [200.168.210.66] (port=65327 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oArzH-00085k-IL; Mon, 11 Jul 2022 07:54:05 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 11 Jul 2022 08:53:57 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 4A32A800172;
 Mon, 11 Jul 2022 08:53:57 -0300 (-03)
Message-ID: <0b513cd3-1278-df6d-a2e2-6588ac0a45f3@eldorado.org.br>
Date: Mon, 11 Jul 2022 08:53:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
Subject: Re: [PATCH 1/2] util/log: Add vu to dump content of vector unit
To: Kito Cheng <kito.cheng@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn, richard.henderson@linaro.org
References: <20220708085736.94546-1-kito.cheng@sifive.com>
Content-Language: en-US
In-Reply-To: <20220708085736.94546-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 11 Jul 2022 11:53:57.0562 (UTC)
 FILETIME=[E70FB9A0:01D8951C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 11 Jul 2022 11:54:06 -0000

T24gMDgvMDcvMjAyMiAwNTo1NywgS2l0byBDaGVuZyB3cm90ZToNCj4gQWRkIG5ldyBvcHRp
b24gZm9yIC1kIHZ1IHRvIGR1bXAgdGhlIGNvbnRlbnQgb2YgdmVjdG9yIHVuaXQsIG1hbnkg
dGFyZ2V0DQo+IGhhcyB2ZWN0b3IgcmVnaXN0ZXIsIGJ1dCB0aGVyZSBpcyBubyBlYXN5IHdh
eSB0byBkdW1wIHRoZSBjb250ZW50LCB3ZQ0KPiB1c2UgdGhpcyBvbiBkb3duc3RyZWFtIGZv
ciBhIHdoaWxlIHRvIGhlbHAgZGVidWcsIGFuZCBJIGZlZWwgdGhhdCdzDQo+IHJlYWxseSB1
c2VmdWwsIHNvIEkgdGhpbmsgaXQgd291bGQgYmUgZ3JlYXQgdG8gdXBzdHJlYW0gdGhhdCB0
byBzYXZlIGRlYnVnIHRpbWUNCj4gZm9yIG90aGVyIHBlb3BsZSA6KQ0KPiANCj4gU2lnbmVk
LW9mZi1ieTogS2l0byBDaGVuZyA8a2l0by5jaGVuZ0BzaWZpdmUuY29tPg0KPiAtLS0NCj4g
ICBhY2NlbC90Y2cvY3B1LWV4ZWMuYyAgfCAzICsrKw0KPiAgIGluY2x1ZGUvaHcvY29yZS9j
cHUuaCB8IDIgKysNCj4gICBpbmNsdWRlL3FlbXUvbG9nLmggICAgfCAxICsNCj4gICB1dGls
L2xvZy5jICAgICAgICAgICAgfCAyICsrDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hY2NlbC90Y2cvY3B1LWV4ZWMuYyBiL2Fj
Y2VsL3RjZy9jcHUtZXhlYy5jDQo+IGluZGV4IGE1NjVhM2Y4ZWMuLjJjYmVjMGE2ZWQgMTAw
NjQ0DQo+IC0tLSBhL2FjY2VsL3RjZy9jcHUtZXhlYy5jDQo+ICsrKyBiL2FjY2VsL3RjZy9j
cHUtZXhlYy5jDQo+IEBAIC0yMjEsNiArMjIxLDkgQEAgc3RhdGljIGlubGluZSB2b2lkIGxv
Z19jcHVfZXhlYyh0YXJnZXRfdWxvbmcgcGMsIENQVVN0YXRlICpjcHUsDQo+ICAgICAgICAg
ICAgICAgICAgIGlmIChxZW11X2xvZ2xldmVsX21hc2soQ1BVX0xPR19UQl9GUFUpKSB7DQo+
ICAgICAgICAgICAgICAgICAgICAgICBmbGFncyB8PSBDUFVfRFVNUF9GUFU7DQo+ICAgICAg
ICAgICAgICAgICAgIH0NCj4gKyAgICAgICAgICAgICAgICBpZiAocWVtdV9sb2dsZXZlbF9t
YXNrKENQVV9MT0dfVEJfVlUpKSB7DQo+ICsgICAgICAgICAgICAgICAgICAgIGZsYWdzIHw9
IENQVV9EVU1QX1ZVOw0KPiArICAgICAgICAgICAgICAgIH0NCj4gICAjaWYgZGVmaW5lZChU
QVJHRVRfSTM4NikNCj4gICAgICAgICAgICAgICAgICAgZmxhZ3MgfD0gQ1BVX0RVTVBfQ0NP
UDsNCj4gICAjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvY29yZS9jcHUuaCBi
L2luY2x1ZGUvaHcvY29yZS9jcHUuaA0KPiBpbmRleCA5OTZmOTQwNTlmLi43YTc2N2UxN2Nk
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2h3L2NvcmUvY3B1LmgNCj4gKysrIGIvaW5jbHVk
ZS9ody9jb3JlL2NwdS5oDQo+IEBAIC01MzUsMTEgKzUzNSwxMyBAQCBHdWVzdFBhbmljSW5m
b3JtYXRpb24gKmNwdV9nZXRfY3Jhc2hfaW5mbyhDUFVTdGF0ZSAqY3B1KTsNCj4gICAgKiBA
Q1BVX0RVTVBfQ09ERToNCj4gICAgKiBAQ1BVX0RVTVBfRlBVOiBkdW1wIEZQVSByZWdpc3Rl
ciBzdGF0ZSwgbm90IGp1c3QgaW50ZWdlcg0KPiAgICAqIEBDUFVfRFVNUF9DQ09QOiBkdW1w
IGluZm8gYWJvdXQgVENHIFFFTVUncyBjb25kaXRpb24gY29kZSBvcHRpbWl6YXRpb24gc3Rh
dGUNCj4gKyAqIEBDUFVfRFVNUF9WVTogZHVtcCB2ZWN0b3IgcmVnaXN0ZXIgc3RhdGUNCj4g
ICAgKi8NCj4gICBlbnVtIENQVUR1bXBGbGFncyB7DQo+ICAgICAgIENQVV9EVU1QX0NPREUg
PSAweDAwMDEwMDAwLA0KPiAgICAgICBDUFVfRFVNUF9GUFUgID0gMHgwMDAyMDAwMCwNCj4g
ICAgICAgQ1BVX0RVTVBfQ0NPUCA9IDB4MDAwNDAwMDAsDQo+ICsgICAgQ1BVX0RVTVBfVlUg
ICA9IDB4MDAwODAwMDAsDQo+ICAgfTsNCj4gDQo+ICAgLyoqDQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3FlbXUvbG9nLmggYi9pbmNsdWRlL3FlbXUvbG9nLmgNCj4gaW5kZXggYzU2NDNk
OGRkNS4uNDliZDBiMGZiYyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9xZW11L2xvZy5oDQo+
ICsrKyBiL2luY2x1ZGUvcWVtdS9sb2cuaA0KPiBAQCAtMzUsNiArMzUsNyBAQCBib29sIHFl
bXVfbG9nX3NlcGFyYXRlKHZvaWQpOw0KPiAgIC8qIExPR19TVFJBQ0UgaXMgdXNlZCBmb3Ig
dXNlci1tb2RlIHN0cmFjZSBsb2dnaW5nLiAqLw0KPiAgICNkZWZpbmUgTE9HX1NUUkFDRSAg
ICAgICAgICgxIDw8IDE5KQ0KPiAgICNkZWZpbmUgTE9HX1BFUl9USFJFQUQgICAgICgxIDw8
IDIwKQ0KPiArI2RlZmluZSBDUFVfTE9HX1RCX1ZVICAgICAgKDEgPDwgMjEpDQo+IA0KPiAg
IC8qIExvY2svdW5sb2NrIG91dHB1dC4gKi8NCj4gDQo+IGRpZmYgLS1naXQgYS91dGlsL2xv
Zy5jIGIvdXRpbC9sb2cuYw0KPiBpbmRleCBkNmViMDM3OGMzLi43NzVkMTIyYzJlIDEwMDY0
NA0KPiAtLS0gYS91dGlsL2xvZy5jDQo+ICsrKyBiL3V0aWwvbG9nLmMNCj4gQEAgLTQ0MSw2
ICs0NDEsOCBAQCBjb25zdCBRRU1VTG9nSXRlbSBxZW11X2xvZ19pdGVtc1tdID0gew0KPiAg
ICNpZmRlZiBDT05GSUdfUExVR0lODQo+ICAgICAgIHsgQ1BVX0xPR19QTFVHSU4sICJwbHVn
aW4iLCAib3V0cHV0IGZyb20gVENHIHBsdWdpbnNcbiJ9LA0KPiAgICNlbmRpZg0KPiArICAg
IHsgQ1BVX0xPR19UQl9WVSwgInZ1IiwNCj4gKyAgICAgICJpbmNsdWRlIHZlY3RvciB1bml0
IHJlZ2lzdGVycyBpbiB0aGUgJ2NwdScgbG9nZ2luZyIgfSwNCj4gICAgICAgeyBMT0dfU1RS
QUNFLCAic3RyYWNlIiwNCj4gICAgICAgICAibG9nIGV2ZXJ5IHVzZXItbW9kZSBzeXNjYWxs
LCBpdHMgaW5wdXQsIGFuZCBpdHMgcmVzdWx0IiB9LA0KPiAgICAgICB7IExPR19QRVJfVEhS
RUFELCAidGlkIiwNCj4gLS0NCj4gMi4zNC4wDQo+IA0KPiANCg0KSSB0aGluayB0aGlzIGxv
b2tzIGxpa2UgYSBnb29kIGlkZWEsIGNhbiBzZWUgbXlzZWxmIHVzaW5nIGl0Lg0KSSBzZWUg
YSBsb3Qgb2YgcGxhY2VzIGluIHRoZSBjb2RlIHdoZXJlIGNwdV9kdW1wX3N0YXRlKCkgaXMN
CnVzZWQgd2l0aCBDUFVfRFVNUF9GUFUgZmxhZyBhcyBhIHBhcmFtZXRlci4gRG8geW91IHRo
aW5rIGl0DQppcyBhbHNvIHRoZSBjYXNlIHRvIGFkZCB0aGlzIG5ldyBmbGFnIENQVV9EVU1Q
X1ZVIHRoZXJlIHRvbz8NCg0KQmVzdCByZWdhcmRzLA0KDQotLSANClbDrWN0b3IgQ29yYSBD
b2xvbWJvDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAt
IERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0
bWw+DQo=

