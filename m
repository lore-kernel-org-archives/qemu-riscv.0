Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7YZw-00053b-73
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 03:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n7YZm-000527-Am; Wed, 12 Jan 2022 03:01:47 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n7YZi-0006S4-O7; Wed, 12 Jan 2022 03:01:45 -0500
Received: from canpemm100004.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JYg3h1dT1zbjsF;
 Wed, 12 Jan 2022 16:00:48 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 canpemm100004.china.huawei.com (7.192.105.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 16:01:27 +0800
Received: from kwepemm600017.china.huawei.com ([7.193.23.234]) by
 kwepemm600017.china.huawei.com ([7.193.23.234]) with mapi id 15.01.2308.020;
 Wed, 12 Jan 2022 16:01:27 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Alistair Francis <alistair23@gmail.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, "kvm-riscv@lists.infradead.org"
 <kvm-riscv@lists.infradead.org>, "open list:Overall" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, Anup Patel
 <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, "Fanliang
 (EulerOS)" <fanliang@huawei.com>, "Wubin (H)" <wu.wubin@huawei.com>,
 "Wanghaibin (D)" <wanghaibin.wang@huawei.com>, "wanbo (G)"
 <wanbo13@huawei.com>, "limingwang (A)" <limingwang@huawei.com>, Anup Patel
 <anup.patel@wdc.com>
Subject: RE: [PATCH v4 05/12] target/riscv: Implement kvm_arch_put_registers
Thread-Topic: [PATCH v4 05/12] target/riscv: Implement kvm_arch_put_registers
Thread-Index: AQHYBcLY5qBMkgvcJUyw1KKH9Z+yrqxcW9gAgAKtocA=
Date: Wed, 12 Jan 2022 08:01:27 +0000
Message-ID: <d5f384244df6442faae5e4812d9791ab@huawei.com>
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-6-jiangyifei@huawei.com>
 <CAKmqyKPsSidxir_1fncugsmLK33aSbHk63MP0JnS3OJLvy65EA@mail.gmail.com>
In-Reply-To: <CAKmqyKPsSidxir_1fncugsmLK33aSbHk63MP0JnS3OJLvy65EA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.236]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangyifei@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 12 Jan 2022 08:01:51 -0000

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsaXN0YWlyIEZyYW5jaXMg
W21haWx0bzphbGlzdGFpcjIzQGdtYWlsLmNvbV0NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAx
MSwgMjAyMiA3OjA3IEFNDQo+IFRvOiBKaWFuZ3lpZmVpIDxqaWFuZ3lpZmVpQGh1YXdlaS5jb20+
DQo+IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmcgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25n
bnUub3JnPjsgb3Blbg0KPiBsaXN0OlJJU0MtViA8cWVtdS1yaXNjdkBub25nbnUub3JnPjsga3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7IG9wZW4NCj4gbGlzdDpPdmVyYWxsIDxrdm1Admdl
ci5rZXJuZWwub3JnPjsgbGlidmlyLWxpc3RAcmVkaGF0LmNvbTsgQW51cCBQYXRlbA0KPiA8YW51
cEBicmFpbmZhdWx0Lm9yZz47IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+OyBB
bGlzdGFpcg0KPiBGcmFuY2lzIDxBbGlzdGFpci5GcmFuY2lzQHdkYy5jb20+OyBCaW4gTWVuZyA8
YmluLm1lbmdAd2luZHJpdmVyLmNvbT47DQo+IEZhbmxpYW5nIChFdWxlck9TKSA8ZmFubGlhbmdA
aHVhd2VpLmNvbT47IFd1YmluIChIKQ0KPiA8d3Uud3ViaW5AaHVhd2VpLmNvbT47IFdhbmdoYWli
aW4gKEQpIDx3YW5naGFpYmluLndhbmdAaHVhd2VpLmNvbT47DQo+IHdhbmJvIChHKSA8d2FuYm8x
M0BodWF3ZWkuY29tPjsgbGltaW5nd2FuZyAoQSkNCj4gPGxpbWluZ3dhbmdAaHVhd2VpLmNvbT47
IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAd2RjLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NCAwNS8xMl0gdGFyZ2V0L3Jpc2N2OiBJbXBsZW1lbnQga3ZtX2FyY2hfcHV0X3JlZ2lzdGVycw0K
PiANCj4gT24gTW9uLCBKYW4gMTAsIDIwMjIgYXQgMTE6NTcgQU0gWWlmZWkgSmlhbmcgdmlhIDxx
ZW11LWRldmVsQG5vbmdudS5vcmc+DQo+IHdyb3RlOg0KPiA+DQo+ID4gUHV0IEdQUiBDU1IgYW5k
IEZQIHJlZ2lzdGVycyB0byBrdm0gYnkgS1ZNX1NFVF9PTkVfUkVHIGlvY3RsDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBZaWZlaSBKaWFuZyA8amlhbmd5aWZlaUBodWF3ZWkuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IE1pbmd3YW5nIExpIDxsaW1pbmd3YW5nQGh1YXdlaS5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCj4g
PiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEB3ZGMuY29tPg0KPiA+IC0tLQ0K
PiA+ICB0YXJnZXQvcmlzY3Yva3ZtLmMgfCAxMDQNCj4gPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2
L2t2bS5jIGIvdGFyZ2V0L3Jpc2N2L2t2bS5jIGluZGV4DQo+ID4gNmQ0ZGYwZWY2ZC4uZTY5NWI5
MWRjNyAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvcmlzY3Yva3ZtLmMNCj4gPiArKysgYi90YXJn
ZXQvcmlzY3Yva3ZtLmMNCj4gPiBAQCAtNzMsNiArNzMsMTQgQEAgc3RhdGljIHVpbnQ2NF90IGt2
bV9yaXNjdl9yZWdfaWQoQ1BVUklTQ1ZTdGF0ZSAqZW52LA0KPiB1aW50NjRfdCB0eXBlLCB1aW50
NjRfdCBpZHgNCj4gPiAgICAgICAgICB9IFwNCj4gPiAgICAgIH0gd2hpbGUoMCkNCj4gPg0KPiA+
ICsjZGVmaW5lIEtWTV9SSVNDVl9TRVRfQ1NSKGNzLCBlbnYsIGNzciwgcmVnKSBcDQo+ID4gKyAg
ICBkbyB7IFwNCj4gPiArICAgICAgICBpbnQgcmV0ID0ga3ZtX3NldF9vbmVfcmVnKGNzLCBSSVND
Vl9DU1JfUkVHKGVudiwgY3NyKSwgJnJlZyk7IFwNCj4gPiArICAgICAgICBpZiAocmV0KSB7IFwN
Cj4gPiArICAgICAgICAgICAgcmV0dXJuIHJldDsgXA0KPiA+ICsgICAgICAgIH0gXA0KPiA+ICsg
ICAgfSB3aGlsZSgwKQ0KPiANCj4gVGhpcyBmYWlscyBjaGVja3BhdGNoLiBJIGtub3cgdGhlcmUg
aXMgbG90cyBvZiBRRU1VIGNvZGUgbGlrZSB0aGlzLCBidXQgaXQgcHJvYmFibHkNCj4gc2hvdWxk
IGJlIGB3aGlsZSAoMClgIHRvIGtlZXAgY2hlY2twYXRjaCBoYXBweS4NCj4gDQo+IFBsZWFzZSBy
dW4gY2hlY2twYXRjaCBvbiBhbGwgdGhlIHBhdGNoZXMuDQo+IA0KPiBBbGlzdGFpcg0KDQpPSywg
aXQgd2lsbCBiZSBtb2RpZmllZCBpbiB0aGUgbmV4dCBzZXJpZXMuDQoNCllpZmVpDQo=

