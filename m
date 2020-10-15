Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSsY6-0001vj-CR
	for mharc-qemu-riscv@gnu.org; Wed, 14 Oct 2020 21:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kSsY4-0001vT-6F; Wed, 14 Oct 2020 21:59:20 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2941 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kSsY1-0001C6-Ul; Wed, 14 Oct 2020 21:59:19 -0400
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 46B0638D758FBDA6EFA6;
 Thu, 15 Oct 2020 09:59:09 +0800 (CST)
Received: from dggemm752-chm.china.huawei.com (10.1.198.58) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 15 Oct 2020 09:59:09 +0800
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemm752-chm.china.huawei.com (10.1.198.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 15 Oct 2020 09:59:08 +0800
Received: from dggpemm000001.china.huawei.com ([7.185.36.245]) by
 dggpemm000001.china.huawei.com ([7.185.36.245]) with mapi id 15.01.1913.007;
 Thu, 15 Oct 2020 09:59:08 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
CC: "palmer@dabbelt.com" <palmer@dabbelt.com>, "Alistair.Francis@wdc.com"
 <Alistair.Francis@wdc.com>, "sagark@eecs.berkeley.edu"
 <sagark@eecs.berkeley.edu>, "kbastian@mail.uni-paderborn.de"
 <kbastian@mail.uni-paderborn.de>, "Zhangxiaofeng (F)"
 <victor.zhangxiaofeng@huawei.com>, "Wubin (H)" <wu.wubin@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, "dengkai (A)"
 <dengkai1@huawei.com>, yinyipeng <yinyipeng1@huawei.com>
Subject: RE: [PATCH V3] target/riscv: raise exception to HS-mode at
 get_physical_address
Thread-Topic: [PATCH V3] target/riscv: raise exception to HS-mode at
 get_physical_address
Thread-Index: AQHWohNE6JEoJnOKqEGoroIi+CF7z6mXBQMAgADinAA=
Date: Thu, 15 Oct 2020 01:59:08 +0000
Message-ID: <cd12acc6aa7b4f1d84859f14200cf75d@huawei.com>
References: <20201014101728.848-1-jiangyifei@huawei.com>
 <ee4b99ec-5842-6638-ecff-54096ec0b0e8@linaro.org>
In-Reply-To: <ee4b99ec-5842-6638-ecff-54096ec0b0e8@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.47]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangyifei@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 21:59:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 15 Oct 2020 01:59:20 -0000

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IFttYWlsdG86cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZ10NCj4gU2VudDogVGh1cnNkYXks
IE9jdG9iZXIgMTUsIDIwMjAgNDoyMiBBTQ0KPiBUbzogSmlhbmd5aWZlaSA8amlhbmd5aWZlaUBo
dWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOw0KPiBxZW11LXJpc2N2QG5vbmdudS5v
cmcNCj4gQ2M6IHBhbG1lckBkYWJiZWx0LmNvbTsgQWxpc3RhaXIuRnJhbmNpc0B3ZGMuY29tOw0K
PiBzYWdhcmtAZWVjcy5iZXJrZWxleS5lZHU7IGtiYXN0aWFuQG1haWwudW5pLXBhZGVyYm9ybi5k
ZTsgWmhhbmd4aWFvZmVuZw0KPiAoRikgPHZpY3Rvci56aGFuZ3hpYW9mZW5nQGh1YXdlaS5jb20+
OyBXdWJpbiAoSCkgPHd1Lnd1YmluQGh1YXdlaS5jb20+Ow0KPiBaaGFuZ2hhaWxpYW5nIDx6aGFu
Zy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBkZW5na2FpIChBKQ0KPiA8ZGVuZ2thaTFAaHVh
d2VpLmNvbT47IHlpbnlpcGVuZyA8eWlueWlwZW5nMUBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFYzXSB0YXJnZXQvcmlzY3Y6IHJhaXNlIGV4Y2VwdGlvbiB0byBIUy1tb2RlIGF0
DQo+IGdldF9waHlzaWNhbF9hZGRyZXNzDQo+IA0KPiBPbiAxMC8xNC8yMCAzOjE3IEFNLCBZaWZl
aSBKaWFuZyB3cm90ZToNCj4gPiArICAgICAgICAgICAgICAgIGlmIChmYXVsdF9wdGVfYWRkcikg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICpmYXVsdF9wdGVfYWRkciA9IChiYXNlICsgaWR4
ICogcHRlc2l6ZSkgPj4gMjsNCj4gDQo+IFRoZSBzaGlmdCBpcyB3cm9uZy4gIEl0IHNob3VsZCBi
ZSBleGFjdGx5IGxpa2UuLi4NCj4gDQoNCldlIGhhdmUgdGVzdGVkIGluIHRoZSBWTSBtaWdyYXRp
b24uDQoNCmZhdWx0X3B0ZV9hZGRyIHdpbGwgZXZlbnR1YWxseSBiZSBhc3NpZ25lZCB0byBodHZh
bCByZWdpc3Rlci4NCg0KRGVzY3JpcHRpb24gb2YgaHR2YWwgcmVnaXN0ZXIgYWNjb3JkaW5nIHRv
IHRoZSBzcGVjaWZpY2F0aW9uOg0KV2hlbiBhIGd1ZXN0LXBhZ2UtZmF1bHQgdHJhcCBpcyB0YWtl
biBpbnRvIEhTLW1vZGUsIGh0dmFsIGlzIHdyaXR0ZW4gd2l0aCBlaXRoZXIgemVybw0Kb3IgdGhl
IGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgdGhhdCBmYXVsdGVkLCBzaGlmdGVkIHJpZ2h0IGJ5IDIg
Yml0cy4NCg0KSW4gYWRkaXRpb24sIGZhdWx0X3B0ZV9hZGRyIGlzIG5hbWVkIGFmdGVyIGVudi0+
Z3Vlc3RfcGh5c19mYXVsdF9hZGRyLCB3aGljaCBtYWtlcw0Kc2Vuc2UgaW4gYSBzZW5zZS4NCg0K
WWlmZWkNCg0KPiA+ICsgICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAgICAgcmV0
dXJuIFRSQU5TTEFURV9HX1NUQUdFX0ZBSUw7DQo+ID4gICAgICAgICAgICAgIH0NCj4gPg0KPiA+
ICAgICAgICAgICAgICBwdGVfYWRkciA9IHZiYXNlICsgaWR4ICogcHRlc2l6ZTsNCj4gDQo+IC4u
LiB0aGlzLg0KPiANCj4gDQo+IHJ+DQo=

