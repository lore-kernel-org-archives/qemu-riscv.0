Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYjcx-0006xK-13
	for mharc-qemu-riscv@gnu.org; Fri, 08 Oct 2021 02:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1mYjcu-0006vz-JF; Fri, 08 Oct 2021 02:45:04 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1mYjcr-0007Yx-GP; Fri, 08 Oct 2021 02:45:04 -0400
Received: from dggeme708-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HQdqG1bBhzbn62;
 Fri,  8 Oct 2021 14:40:26 +0800 (CST)
Received: from dggeme703-chm.china.huawei.com (10.1.199.99) by
 dggeme708-chm.china.huawei.com (10.1.199.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 8 Oct 2021 14:44:49 +0800
Received: from dggeme703-chm.china.huawei.com ([10.9.48.230]) by
 dggeme703-chm.china.huawei.com ([10.9.48.230]) with mapi id 15.01.2308.008;
 Fri, 8 Oct 2021 14:44:49 +0800
From: "limingwang (A)" <limingwang@huawei.com>
To: Bin Meng <bmeng.cn@gmail.com>
CC: "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, "qemu-devel@nongnu.org Developers"
 <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>, "Wubin
 (H)" <wu.wubin@huawei.com>, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Fanliang (EulerOS)"
 <fanliang@huawei.com>, Jiangyifei <jiangyifei@huawei.com>
Subject: RE: [PATCH] hw/riscv: virt: bugfix the memory-backend-file command is
 invalid
Thread-Topic: [PATCH] hw/riscv: virt: bugfix the memory-backend-file command
 is invalid
Thread-Index: AQHXtRItniF9CN0Cd0WVMjzJGMnz8avH+XEAgAC2igA=
Date: Fri, 8 Oct 2021 06:44:49 +0000
Message-ID: <b30102c96b11490280b0fcc4bddbcdd1@huawei.com>
References: <20210929091244.75988-1-limingwang@huawei.com>
 <CAEUhbmV+UiASGY+qgTW7LjBf0sPRqB1g321qQML0w1RcSES6MQ@mail.gmail.com>
In-Reply-To: <CAEUhbmV+UiASGY+qgTW7LjBf0sPRqB1g321qQML0w1RcSES6MQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.17]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=limingwang@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Oct 2021 06:45:05 -0000

PiA+DQo+ID4gRnJvbTogTWluZ3dhbmcgTGkgPGxpbWluZ3dhbmdAaHVhd2VpLmNvbT4NCj4gPg0K
PiA+IElmIGRlZmF1bHQgbWFpbl9tZW0gaXMgdXNlZCB0byBiZSByZWdpc3RlcmVkIGFzIHRoZSBz
eXN0ZW0gbWVtb3J5LA0KPiA+IG90aGVyIG1lbW9yeSBjYW5ub3QgYmUgaW5pdGlhbGl6ZWQuIFRo
ZXJlZm9yZSwgdGhlIHN5c3RlbSBtZW1vcnkNCj4gPiBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgdG8g
dGhlIG1hY2hpbmUtPnJhbSwgd2hpY2ggY29uc2lzdHMgb2YgdGhlDQo+ID4gZGVmYXVsdCBtYWlu
X21lbSBhbmQgb3RoZXIgcG9zc2libGUgbWVtb3J5IHJlcXVpcmVkIGJ5IGFwcGxpY2F0aW9ucywN
Cj4gPiBzdWNoIGFzIHNoYXJlZCBodWdlcGFnZSBtZW1vcnkgaW4gRFBESy4NCj4gDQo+IFdoaWNo
IGNvbW1hbmQgZGlkIHlvdSB1c2UgdG8gZXhwb3NlIHRoZSBlcnJvcj8gSXQgbG9va3MgbGlrZSBu
b3QgZXZlcnkNCj4gbWFjaGluZSBpcyBkb25lIGxpa2UgdGhpcyBwYXRjaCBkb2VzLg0KPiANCg0K
VGhlIGNvbW1hbmQgd2UgdXNlZCB0byBleHBvc2UgdGhlIGVycm9yIGlzIGFzIGZvbGxvd3M6DQou
L3FlbXUtc3lzdGVtLXJpc2N2NjQgLU0gdmlydCxhY2NlbD1rdm0gLW0gNDA5Nk0gLWNwdSBob3N0
IC1ub2dyYXBoaWMgXA0KICAgIC1uYW1lIGd1ZXN0PXJpc2N2LWd1c2V0IFwNCgktc21wIDIgXA0K
CS1iaW9zIG5vbmUgXA0KCS1rZXJuZWwgLi9JbWFnZSBcDQoJLWRyaXZlIGZpbGU9Li9ndWVzdC5p
bWcsZm9ybWF0PXJhdyxpZD1oZDAgXA0KCS1kZXZpY2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9
aGQwIFwNCgktYXBwZW5kICJyb290PS9kZXYvdmRhIHJ3IGNvbnNvbGU9dHR5UzAgZWFybHljb249
c2JpIg0KICAgIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmlsZSxpZD1tZW0sc2l6ZT00MDk2TSxt
ZW0tcGF0aD0vZGV2L2h1Z2VwYWdlcyxzaGFyZT1vbiBcDQogICAgLW51bWEgbm9kZSxtZW1kZXY9
bWVtIC1tZW0tcHJlYWxsb2MgXA0KICAgIC1jaGFyZGV2IHNvY2tldCxpZD1jaGFyMCxwYXRoPS9t
bnQvdmhvc3QtbmV0MCBcDQogICAgLW5ldGRldiB0eXBlPXZob3N0LXVzZXIsaWQ9bXluZXQxLGNo
YXJkZXY9Y2hhcjAsdmhvc3Rmb3JjZSBcDQogICAgLWRldmljZSB2aXJ0aW8tbmV0LXBjaSxtYWM9
NTI6NTQ6MDA6MDA6MDA6MDEsbmV0ZGV2PW15bmV0MSxtcmdfcnhidWY9b24sY3N1bT1vbixndWVz
dF9jc3VtPW9uLGd1ZXN0X2Vjbj1vbg0KDQpOb3RlIHRoYXQsIGJlZm9yZSBzdGFydGluZyB0aGUg
a3ZtLWFjY2VsZWQgUUVNVSBWTSwgZm9sbG93aW5nIHRlbXBvcmFyaWx5IHVuYWNjZXB0ZWQgUUVN
VSBwYXRjaGVzIHNob3VsZCBiZSB1c2VkOg0KaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUv
aHRtbC9xZW11LWRldmVsLzIwMjEtMDgvbXNnMDI1MTYuaHRtbA0KDQpUaGVuLCBRRU1VIGRpc3Bs
YXlzIHRoZSBmb2xsb3dpbmcgZXJyb3IgaW5mb3JtYXRpb246DQpxZW11LXN5c3RlbS1yaXNjdjY0
OiBGYWlsZWQgaW5pdGlhbGl6aW5nIHZob3N0LXVzZXIgbWVtb3J5IG1hcCwgY29uc2lkZXIgdXNp
bmcgLW9iamVjdCBtZW1vcnktYmFja2VuZC1maWxlIHNoYXJlPW9uDQpxZW11LXN5c3RlbS1yaXNj
djY0OiB2aG9zdF9zZXRfbWVtX3RhYmxlIGZhaWxlZDogSW50ZXJydXB0ZWQgc3lzdGVtIGNhbGwg
KDQpDQpxZW11LXN5c3RlbS1yaXNjdjY0OiB1bmFibGUgdG8gc3RhcnQgdmhvc3QgbmV0OiA0OiBm
YWxsaW5nIGJhY2sgb24gdXNlcnNwYWNlIHZpcnRpbw0KDQpJZiBvdGhlciB0eXBlIG9mIG1hY2hp
bmUgaXMgY29uZmlndXJlZCB3aGVuIHN0YXJ0aW5nIGEgUUVNVSBWTSwgY29ycmVzcG9uZGluZyBj
b2RlcyBpbiB0aGUgbWFjaGluZSBtb2RlbCBzaG91bGQgYmUgbW9kaWZpZWQgYXMgd2VsbC4NCg0K
DQo+IFBsZWFzZSByZXdvcmQgdGhlIGNvbW1pdCBzdW1tYXJ5IGEgbGl0dGxlIGJpdCB0byBoZWxw
IHRoZSB1bmRlcnN0YW5kaW5nLg0KPiANCj4gPiBBbHNvLCB0aGUgbWMtPmRlZmF1bF9yYW1faWQg
c2hvdWxkIGJlIHNldCB0byB0aGUgZGVmYXVsdCBtYWluX21lbSwNCj4gPiB3aGljaCBpcyBuYW1l
ZCBhcyAicmlzY3ZfdmlydF9ib2FyZC5yYW0iLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWlu
Z3dhbmcgTGkgPGxpbWluZ3dhbmdAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZaWZl
aSBKaWFuZyA8amlhbmd5aWZlaUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0KPiA+ICBody9yaXNjdi92
aXJ0LmMgfCA2ICsrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L3Jpc2N2L3ZpcnQuYyBiL2h3
L3Jpc2N2L3ZpcnQuYyBpbmRleA0KPiA+IGVjMGNiNjliOGMuLmIzYjQzMWM4NDcgMTAwNjQ0DQo+
ID4gLS0tIGEvaHcvcmlzY3YvdmlydC5jDQo+ID4gKysrIGIvaHcvcmlzY3YvdmlydC5jDQo+ID4g
QEAgLTc3MSw3ICs3NzEsNiBAQCBzdGF0aWMgdm9pZCB2aXJ0X21hY2hpbmVfaW5pdChNYWNoaW5l
U3RhdGUNCj4gKm1hY2hpbmUpDQo+ID4gICAgICBjb25zdCBNZW1NYXBFbnRyeSAqbWVtbWFwID0g
dmlydF9tZW1tYXA7DQo+ID4gICAgICBSSVNDVlZpcnRTdGF0ZSAqcyA9IFJJU0NWX1ZJUlRfTUFD
SElORShtYWNoaW5lKTsNCj4gPiAgICAgIE1lbW9yeVJlZ2lvbiAqc3lzdGVtX21lbW9yeSA9IGdl
dF9zeXN0ZW1fbWVtb3J5KCk7DQo+ID4gLSAgICBNZW1vcnlSZWdpb24gKm1haW5fbWVtID0gZ19u
ZXcoTWVtb3J5UmVnaW9uLCAxKTsNCj4gPiAgICAgIE1lbW9yeVJlZ2lvbiAqbWFza19yb20gPSBn
X25ldyhNZW1vcnlSZWdpb24sIDEpOw0KPiA+ICAgICAgY2hhciAqcGxpY19oYXJ0X2NvbmZpZywg
KnNvY19uYW1lOw0KPiA+ICAgICAgdGFyZ2V0X3Vsb25nIHN0YXJ0X2FkZHIgPSBtZW1tYXBbVklS
VF9EUkFNXS5iYXNlOyBAQCAtODkwLDEwDQo+ID4gKzg4OSw4IEBAIHN0YXRpYyB2b2lkIHZpcnRf
bWFjaGluZV9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkNCj4gPiAgICAgIH0NCj4gPg0KPiA+
ICAgICAgLyogcmVnaXN0ZXIgc3lzdGVtIG1haW4gbWVtb3J5IChhY3R1YWwgUkFNKSAqLw0KPiA+
IC0gICAgbWVtb3J5X3JlZ2lvbl9pbml0X3JhbShtYWluX21lbSwgTlVMTCwgInJpc2N2X3ZpcnRf
Ym9hcmQucmFtIiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFjaGluZS0+cmFt
X3NpemUsICZlcnJvcl9mYXRhbCk7DQo+ID4gICAgICBtZW1vcnlfcmVnaW9uX2FkZF9zdWJyZWdp
b24oc3lzdGVtX21lbW9yeSwNCj4gbWVtbWFwW1ZJUlRfRFJBTV0uYmFzZSwNCj4gPiAtICAgICAg
ICBtYWluX21lbSk7DQo+ID4gKyAgICAgICAgbWFjaGluZS0+cmFtKTsNCj4gPg0KPiA+ICAgICAg
LyogY3JlYXRlIGRldmljZSB0cmVlICovDQo+ID4gICAgICBjcmVhdGVfZmR0KHMsIG1lbW1hcCwg
bWFjaGluZS0+cmFtX3NpemUsDQo+IG1hY2hpbmUtPmtlcm5lbF9jbWRsaW5lLA0KPiA+IEBAIC0x
MDMyLDYgKzEwMjksNyBAQCBzdGF0aWMgdm9pZCB2aXJ0X21hY2hpbmVfY2xhc3NfaW5pdChPYmpl
Y3RDbGFzcw0KPiAqb2MsIHZvaWQgKmRhdGEpDQo+ID4gICAgICBtYy0+Y3B1X2luZGV4X3RvX2lu
c3RhbmNlX3Byb3BzID0NCj4gcmlzY3ZfbnVtYV9jcHVfaW5kZXhfdG9fcHJvcHM7DQo+ID4gICAg
ICBtYy0+Z2V0X2RlZmF1bHRfY3B1X25vZGVfaWQgPQ0KPiByaXNjdl9udW1hX2dldF9kZWZhdWx0
X2NwdV9ub2RlX2lkOw0KPiA+ICAgICAgbWMtPm51bWFfbWVtX3N1cHBvcnRlZCA9IHRydWU7DQo+
ID4gKyAgICBtYy0+ZGVmYXVsdF9yYW1faWQgPSAicmlzY3ZfdmlydF9ib2FyZC5yYW0iOw0KPiA+
DQo+ID4gICAgICBtYWNoaW5lX2NsYXNzX2FsbG93X2R5bmFtaWNfc3lzYnVzX2RldihtYywNCj4g
VFlQRV9SQU1GQl9ERVZJQ0UpOw0KPiA+DQo+ID4gLS0NCj4gDQo+IFJlZ2FyZHMsDQo+IEJpbg0K
DQo=

