Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h2ykj-0002z8-Gi
	for mharc-qemu-riscv@gnu.org; Sun, 10 Mar 2019 09:44:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h2ykg-0002yw-IF
	for qemu-riscv@nongnu.org; Sun, 10 Mar 2019 09:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h2ykf-0002DL-Gm
	for qemu-riscv@nongnu.org; Sun, 10 Mar 2019 09:44:30 -0400
Received: from mail-edgedd24.fraunhofer.de ([192.102.167.24]:37963)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lukas.auer@aisec.fraunhofer.de>)
	id 1h2ykf-00022z-78; Sun, 10 Mar 2019 09:44:29 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G8AABaE4Vc/xwBYJljHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBgg+BWRInCoN/iHmKT4INmiENhGwCF4QfIjcGDQEBAwEBBwE?=
	=?us-ascii?q?DAgICaR0LhUsBAQEDASMRRRACAQgYAgImAgICMBUQAgQOBYUQBwGuPYEviiS?=
	=?us-ascii?q?BCyQBiyyBWD6EI4RKN4MKglcDjCAql1cDBAICgSORZxmKfYg9iniSb4FdI4F?=
	=?us-ascii?q?WcYM7ghYXE44LPwEBMQGON4EugR8BAQ?=
X-IPAS-Result: =?us-ascii?q?A2G8AABaE4Vc/xwBYJljHAEBAQQBAQcEAQGBVAQBAQsBg?=
	=?us-ascii?q?g+BWRInCoN/iHmKT4INmiENhGwCF4QfIjcGDQEBAwEBBwEDAgICaR0LhUsBA?=
	=?us-ascii?q?QEDASMRRRACAQgYAgImAgICMBUQAgQOBYUQBwGuPYEviiSBCyQBiyyBWD6EI?=
	=?us-ascii?q?4RKN4MKglcDjCAql1cDBAICgSORZxmKfYg9iniSb4FdI4FWcYM7ghYXE44LP?=
	=?us-ascii?q?wEBMQGON4EugR8BAQ?=
X-IronPort-AV: E=Sophos;i="5.58,464,1544482800"; d="scan'208";a="23750843"
Received: from mail-mtaka28.fraunhofer.de ([153.96.1.28])
	by mail-edgeDD24.fraunhofer.de with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2019 14:44:15 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CtAAA3FIVcfRBhWMBjHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBg3onCoN/iHmMXJohDYRsAheEQDcGDQEBAwEBBwEDAhQBARY?=
	=?us-ascii?q?6JAuFSgEBAQMBIxFFEAIBCBgCAiYCAgIwFRACBA4FhRAIrj2BL4okgQskAY0?=
	=?us-ascii?q?EPoQjhEo3gwqCVwOMICqXVwMEAgKBI5FnGYp9iD2KeJJvgV0hgVdxgzuCFhc?=
	=?us-ascii?q?Tjgs/AQIwAY43gS6BHwEB?=
X-IronPort-AV: E=Sophos;i="5.58,464,1544482800"; d="scan'208";a="19547442"
Received: from fgdemucivp01ltm.xch.fraunhofer.de (HELO
	FGDEMUCIMP11EXC.ads.fraunhofer.de) ([192.88.97.16])
	by mail-mtaKA28.fraunhofer.de with ESMTP/TLS/AES256-SHA;
	10 Mar 2019 14:44:16 +0100
Received: from FGDEMUCIMP01EXC.ads.fraunhofer.de ([10.80.232.40]) by
	FGDEMUCIMP11EXC.ads.fraunhofer.de ([10.80.232.42]) with mapi id
	14.03.0435.000; Sun, 10 Mar 2019 14:44:14 +0100
From: "Auer, Lukas" <lukas.auer@aisec.fraunhofer.de>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
CC: "palmer@sifive.com" <palmer@sifive.com>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mjc@sifive.com" <mjc@sifive.com>, "sagark@eecs.berkeley.edu"
	<sagark@eecs.berkeley.edu>, "Alistair.Francis@wdc.com"
	<Alistair.Francis@wdc.com>
Thread-Topic: [Qemu-devel] [PATCH] hw/riscv/virt: re-add machine-specific
	compatible string to /soc/ node
Thread-Index: AQHUwX2/pwGZ00zQgE6v+yqcxIgIXaYEJ5sAgADTUQA=
Date: Sun, 10 Mar 2019 13:44:14 +0000
Message-ID: <c9f69861058412a1f71418a9c892daf0821a9e33.camel@aisec.fraunhofer.de>
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
	<CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
In-Reply-To: <CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.80.233.51]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.200.1013-24476.000
x-tm-as-result: No--12.014600-8.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD7B6325D19A284898681D2BD4DF516C@xch.fraunhofer.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.102.167.24
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] hw/riscv/virt: re-add
 machine-specific compatible string to /soc/ node
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Mar 2019 13:44:31 -0000

SGkgQmluLA0KDQpPbiBTdW4sIDIwMTktMDMtMTAgYXQgMDk6MDcgKzA4MDAsIEJpbiBNZW5nIHdy
b3RlOg0KPiBIaSBMdWthcywNCj4gDQo+IE9uIE1vbiwgRmViIDExLCAyMDE5IGF0IDY6MTMgQU0g
THVrYXMgQXVlcg0KPiA8bHVrYXMuYXVlckBhaXNlYy5mcmF1bmhvZmVyLmRlPiB3cm90ZToNCj4g
PiBSZS1hZGQgdGhlIHByZXZpb3VzIGNvbXBhdGlibGUgc3RyaW5nICJyaXNjdi12aXJ0aW8tc29j
IiB0byB0aGUgc29jDQo+ID4gZGV2aWNlIHRyZWUgbm9kZSB0byBhbGxvdyBVLUJvb3QgYW5kIExp
bnV4IHRvIGJpbmQgbWFjaGluZS1zcGVjaWZpYw0KPiA+IGRyaXZlcnMgdG8gaXQuIFRoZSBjdXJy
ZW50IGNvbXBhdGlibGUgc3RyaW5nICJzaW1wbGUtYnVzIiBpcw0KPiA+IHJldGFpbmVkLg0KPiA+
IA0KPiA+IFRoaXMgaXMgcmVxdWlyZWQgYnkgVS1Cb290IHRvIGJpbmQgZGV2aWNlcyBlYXJseSwg
YXMgcGFydCBvZiB0aGUNCj4gPiBwcmUtcmVsb2NhdGlvbiBkcml2ZXIgbW9kZWwuDQo+ID4gDQo+
IA0KPiBJIHNlZSBubyBwcm9ibGVtIHdpdGggVS1Cb290IHdvcmtpbmcgd2l0aCBjdXJyZW50IGNv
bXBhdGlibGUgc3RyaW5nDQo+ICJzaW1wbGUtYnVzIi4gSW4gZmFjdCBJIGhhZCBwbGFubmVkIHRv
IHJlbW92ZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcNCj4gInJpc2N2LXZpcnRpby1zb2MiIGluIFUt
Qm9vdCBidXQgZGlkIG5vdCBnZXQgdGltZSB0byB3b3JrIG9uIGl0Lg0KPiANCg0KSXQgaXMgb25s
eSByZXF1aXJlZCBpZiBVLUJvb3QgaXMgcnVubmluZyBpbiBtYWNoaW5lLW1vZGUuIEZvcg0KcmVs
b2NhdGlvbiBpdCBuZWVkcyB0byB1c2UgdGhlIENMSU5UIGRyaXZlciB0byBzZW5kIGFwcHJvcHJp
YXRlIElQSXMgdG8NCnRoZSBvdGhlciBoYXJ0cy4gVG8gYmUgYWJsZSB0byBwcm9iZSB0aGUgZHJp
dmVyLCB0aGUgZGV2aWNlIGFuZCBpdHMNCnBhcmVudCBkZXZpY2UgdHJlZSBub2RlIChzb2MpIG11
c3QgdGhlcmVmb3JlIGJlIGF2YWlsYWJsZSBpbiB0aGUgcHJlLQ0KcmVsb2NhdGlvbiBkZXZpY2Ug
bW9kZWwuDQpUaGlzIHBhdGNoIHdhcyB0aGUgZWFzaWVzdCB3YXkgSSBjb3VsZCB0aGluayBvZiBm
b3IgYWNoaWV2aW5nIHRoaXMuIEl0DQpjb3VsZCBiZSB0aGF0IHRoZXJlIGlzIGEgYmV0dGVyIHdh
eSBvZiBzb2x2aW5nIHRoaXMuDQoNClRoYW5rcywNCkx1a2FzDQoNCj4gPiBGaXhlczogNTNmNTQ1
MDhkYWU2KCJody9yaXNjdi92aXJ0aW86IFNldCB0aGUgc29jIGRldmljZSB0cmVlIG5vZGUNCj4g
PiBhcyBhDQo+ID4gc2ltcGxlLWJ1cyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogTHVrYXMgQXVlciA8
bHVrYXMuYXVlckBhaXNlYy5mcmF1bmhvZmVyLmRlPg0KPiA+IC0tLQ0KPiA+IA0KPiA+ICBody9y
aXNjdi92aXJ0LmMgfCAzICsrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+IA0KPiBSZWdhcmRzLA0KPiBCaW4NCg==

