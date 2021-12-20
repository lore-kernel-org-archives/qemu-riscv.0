Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzKdV-0007Lb-FB
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 10:31:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mzKdR-0007HQ-Jw; Mon, 20 Dec 2021 10:31:35 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mzKdI-00045M-TO; Mon, 20 Dec 2021 10:31:32 -0500
Received: from canpemm100007.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JHfnH37hxz1DK9N;
 Mon, 20 Dec 2021 20:59:47 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 canpemm100007.china.huawei.com (7.192.105.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 21:02:53 +0800
Received: from kwepemm600017.china.huawei.com ([7.193.23.234]) by
 kwepemm600017.china.huawei.com ([7.193.23.234]) with mapi id 15.01.2308.020;
 Mon, 20 Dec 2021 21:02:53 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
CC: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "libvir-list@redhat.com"
 <libvir-list@redhat.com>, "anup.patel@wdc.com" <anup.patel@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "Alistair.Francis@wdc.com"
 <Alistair.Francis@wdc.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "Fanliang (EulerOS)" <fanliang@huawei.com>, "Wubin
 (H)" <wu.wubin@huawei.com>, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>,
 "wanbo (G)" <wanbo13@huawei.com>, "limingwang (A)" <limingwang@huawei.com>
Subject: RE: [PATCH v2 12/12] target/riscv: Support virtual time context
 synchronization
Thread-Topic: [PATCH v2 12/12] target/riscv: Support virtual time context
 synchronization
Thread-Index: AQHX7a3Q8Bse7NrOd02XaMfvJUw+zqwwCNIAgAtfe4A=
Date: Mon, 20 Dec 2021 13:02:53 +0000
Message-ID: <93bc5000c51042e5bb45053707109947@huawei.com>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-13-jiangyifei@huawei.com>
 <10d2d911-e975-64b3-8ab6-e950c5064b9e@linaro.org>
In-Reply-To: <10d2d911-e975-64b3-8ab6-e950c5064b9e@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.236]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangyifei@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 20 Dec 2021 15:31:35 -0000

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IFttYWlsdG86cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZ10NCj4gU2VudDogTW9uZGF5LCBE
ZWNlbWJlciAxMywgMjAyMSAxMToyMiBQTQ0KPiBUbzogSmlhbmd5aWZlaSA8amlhbmd5aWZlaUBo
dWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOw0KPiBxZW11LXJpc2N2QG5vbmdudS5v
cmcNCj4gQ2M6IGt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBrdm1Admdlci5rZXJuZWwu
b3JnOw0KPiBsaWJ2aXItbGlzdEByZWRoYXQuY29tOyBhbnVwLnBhdGVsQHdkYy5jb207IHBhbG1l
ckBkYWJiZWx0LmNvbTsNCj4gQWxpc3RhaXIuRnJhbmNpc0B3ZGMuY29tOyBiaW4ubWVuZ0B3aW5k
cml2ZXIuY29tOyBGYW5saWFuZyAoRXVsZXJPUykNCj4gPGZhbmxpYW5nQGh1YXdlaS5jb20+OyBX
dWJpbiAoSCkgPHd1Lnd1YmluQGh1YXdlaS5jb20+OyBXYW5naGFpYmluIChEKQ0KPiA8d2FuZ2hh
aWJpbi53YW5nQGh1YXdlaS5jb20+OyB3YW5ibyAoRykgPHdhbmJvMTNAaHVhd2VpLmNvbT47DQo+
IGxpbWluZ3dhbmcgKEEpIDxsaW1pbmd3YW5nQGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMTIvMTJdIHRhcmdldC9yaXNjdjogU3VwcG9ydCB2aXJ0dWFsIHRpbWUgY29udGV4
dA0KPiBzeW5jaHJvbml6YXRpb24NCj4gDQo+IE9uIDEyLzEwLzIxIDI6MDcgQU0sIFlpZmVpIEpp
YW5nIHZpYSB3cm90ZToNCj4gPiArc3RhdGljIGJvb2wga3ZtdGltZXJfbmVlZGVkKHZvaWQgKm9w
YXF1ZSkgew0KPiA+ICsgICAgcmV0dXJuIGt2bV9lbmFibGVkKCk7DQo+ID4gK30NCj4gPiArDQo+
ID4gKw0KPiA+ICtzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIHZtc3RhdGVfa3ZtdGlt
ZXIgPSB7DQo+ID4gKyAgICAubmFtZSA9ICJjcHUva3ZtdGltZXIiLA0KPiA+ICsgICAgLnZlcnNp
b25faWQgPSAxLA0KPiA+ICsgICAgLm1pbmltdW1fdmVyc2lvbl9pZCA9IDEsDQo+ID4gKyAgICAu
bmVlZGVkID0ga3ZtdGltZXJfbmVlZGVkLA0KPiA+ICsgICAgLmZpZWxkcyA9IChWTVN0YXRlRmll
bGRbXSkgew0KPiA+ICsgICAgICAgIFZNU1RBVEVfVUlOVDY0KGVudi5rdm1fdGltZXJfdGltZSwg
UklTQ1ZDUFUpLA0KPiA+ICsgICAgICAgIFZNU1RBVEVfVUlOVDY0KGVudi5rdm1fdGltZXJfY29t
cGFyZSwgUklTQ1ZDUFUpLA0KPiA+ICsgICAgICAgIFZNU1RBVEVfVUlOVDY0KGVudi5rdm1fdGlt
ZXJfc3RhdGUsIFJJU0NWQ1BVKSwNCj4gPiArDQo+ID4gKyAgICAgICAgVk1TVEFURV9FTkRfT0Zf
TElTVCgpDQo+ID4gKyAgICB9DQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGNwdV9w
b3N0X2xvYWQodm9pZCAqb3BhcXVlLCBpbnQgdmVyc2lvbl9pZCkgew0KPiA+ICsgICAgUklTQ1ZD
UFUgKmNwdSA9IG9wYXF1ZTsNCj4gPiArICAgIENQVVJJU0NWU3RhdGUgKmVudiA9ICZjcHUtPmVu
djsNCj4gPiArDQo+ID4gKyAgICBpZiAoa3ZtX2VuYWJsZWQoKSkgew0KPiA+ICsgICAgICAgIGVu
di0+a3ZtX3RpbWVyX2RpcnR5ID0gdHJ1ZTsNCj4gPiArICAgIH0NCj4gPiArICAgIHJldHVybiAw
Ow0KPiA+ICt9DQo+IA0KPiBUaGlzIHBvc3QtbG9hZCBiZWxvbmdzIG9uIHRoZSB2bXN0YXRlX2t2
bXRpbWVyIHN0cnVjdCwgc28gdGhhdCB5b3UgbmVlZCBub3QNCj4gcmUtY2hlY2sga3ZtX2VuYWJs
ZWQoKS4NCj4gDQo+ID4gICBjb25zdCBWTVN0YXRlRGVzY3JpcHRpb24gdm1zdGF0ZV9yaXNjdl9j
cHUgPSB7DQo+ID4gICAgICAgLm5hbWUgPSAiY3B1IiwNCj4gPiAtICAgIC52ZXJzaW9uX2lkID0g
MywNCj4gPiAtICAgIC5taW5pbXVtX3ZlcnNpb25faWQgPSAzLA0KPiA+ICsgICAgLnZlcnNpb25f
aWQgPSA0LA0KPiA+ICsgICAgLm1pbmltdW1fdmVyc2lvbl9pZCA9IDQsDQo+ID4gKyAgICAucG9z
dF9sb2FkID0gY3B1X3Bvc3RfbG9hZCwNCj4gDQo+IE5vIG5lZWQgZm9yIHZlcnNpb24gY2hhbmdl
Lg0KPiANCj4gDQo+IHJ+DQoNCk9rLCBpdCB3aWxsIGJlIG1vZGlmaWVkIGluIHRoZSBuZXh0IHNl
cmllcy4NCg0KWWlmZWkNCg==

