Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvccq-00059u-Cn
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 04:55:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mvcce-00051p-Kw; Fri, 10 Dec 2021 04:55:30 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mvccb-0001FF-NA; Fri, 10 Dec 2021 04:55:24 -0500
Received: from canpemm100003.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J9R5X0Z20zZcDQ;
 Fri, 10 Dec 2021 17:52:16 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 canpemm100003.china.huawei.com (7.192.104.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:55:09 +0800
Received: from kwepemm600017.china.huawei.com ([7.193.23.234]) by
 kwepemm600017.china.huawei.com ([7.193.23.234]) with mapi id 15.01.2308.020;
 Fri, 10 Dec 2021 17:55:08 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
CC: "bin.meng@windriver.com" <bin.meng@windriver.com>, "limingwang (A)"
 <limingwang@huawei.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, "anup.patel@wdc.com"
 <anup.patel@wdc.com>, "wanbo (G)" <wanbo13@huawei.com>, Alistair Francis
 <alistair.francis@wdc.com>, "kvm-riscv@lists.infradead.org"
 <kvm-riscv@lists.infradead.org>, "Wanghaibin (D)"
 <wanghaibin.wang@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Fanliang (EulerOS)" <fanliang@huawei.com>, "Wubin (H)" <wu.wubin@huawei.com>
Subject: RE: [PATCH v1 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
Thread-Topic: [PATCH v1 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
Thread-Index: AQHX3eLJwQnXP9IbnEK93wh1nF4bZawMd2KAgB8ks/A=
Date: Fri, 10 Dec 2021 09:55:08 +0000
Message-ID: <8e09fe10ba1a4062831b934a836ff861@huawei.com>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-4-jiangyifei@huawei.com>
 <d3f974e1-6278-8c11-898a-a1cc55965786@linaro.org>
In-Reply-To: <d3f974e1-6278-8c11-898a-a1cc55965786@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.236]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangyifei@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 09:55:33 -0000

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IFttYWlsdG86cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZ10NCj4gU2VudDogU3VuZGF5LCBO
b3ZlbWJlciAyMSwgMjAyMSA2OjE5IEFNDQo+IFRvOiBKaWFuZ3lpZmVpIDxqaWFuZ3lpZmVpQGh1
YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7DQo+IHFlbXUtcmlzY3ZAbm9uZ251Lm9y
Zw0KPiBDYzogYmluLm1lbmdAd2luZHJpdmVyLmNvbTsgbGltaW5nd2FuZyAoQSkgPGxpbWluZ3dh
bmdAaHVhd2VpLmNvbT47DQo+IGt2bUB2Z2VyLmtlcm5lbC5vcmc7IGxpYnZpci1saXN0QHJlZGhh
dC5jb207IGFudXAucGF0ZWxAd2RjLmNvbTsgd2FuYm8gKEcpDQo+IDx3YW5ibzEzQGh1YXdlaS5j
b20+OyBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+Ow0KPiBrdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgV2FuZ2hhaWJpbiAoRCkNCj4gPHdhbmdoYWliaW4u
d2FuZ0BodWF3ZWkuY29tPjsgcGFsbWVyQGRhYmJlbHQuY29tOyBGYW5saWFuZyAoRXVsZXJPUykN
Cj4gPGZhbmxpYW5nQGh1YXdlaS5jb20+OyBXdWJpbiAoSCkgPHd1Lnd1YmluQGh1YXdlaS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMDMvMTJdIHRhcmdldC9yaXNjdjogSW1wbGVtZW50
IGZ1bmN0aW9uDQo+IGt2bV9hcmNoX2luaXRfdmNwdQ0KPiANCj4gT24gMTEvMjAvMjEgODo0NiBB
TSwgWWlmZWkgSmlhbmcgd3JvdGU6DQo+ID4gKyAgICBpZCA9IGt2bV9yaXNjdl9yZWdfaWQoZW52
LCBLVk1fUkVHX1JJU0NWX0NPTkZJRywNCj4gS1ZNX1JFR19SSVNDVl9DT05GSUdfUkVHKGlzYSkp
Ow0KPiA+ICsgICAgcmV0ID0ga3ZtX2dldF9vbmVfcmVnKGNzLCBpZCwgJmlzYSk7DQo+ID4gKyAg
ICBpZiAocmV0KSB7DQo+ID4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgIH0NCj4gPiAr
ICAgIGVudi0+bWlzYV9teGwgfD0gaXNhOw0KPiANCj4gVGhpcyBkb2Vzbid0IGxvb2sgcmlnaHQu
DQo+IEknbSBzdXJlIHlvdSBtZWFudA0KPiANCj4gICAgICBlbnYtPm1pc2FfZXh0ID0gaXNhOw0K
PiANCj4gDQo+IHJ+DQoNClRoYW5rcywgaXQgd2lsbCBiZSBtb2RpZmllZCBpbiB0aGUgbmV4dCBz
ZXJpZXMuDQoNCllpZmVpDQo=

