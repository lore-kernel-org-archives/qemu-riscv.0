Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZM5j-0000Ux-Kx
	for mharc-qemu-riscv@gnu.org; Fri, 16 Sep 2022 20:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=252df0604=wilfred.mallawa@wdc.com>)
 id 1oZM5i-0000Th-TO; Fri, 16 Sep 2022 20:53:54 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:25658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=252df0604=wilfred.mallawa@wdc.com>)
 id 1oZM5h-00059V-93; Fri, 16 Sep 2022 20:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663376031; x=1694912031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rCK85M0v6w42l2wlsPXjifv5OqwppXZTptKIQdJhgq0=;
 b=kPF3dk0HpVlhpRRXI5lov7Mk8/fxA0m8k/t96FHl90AWN9MBdBmv/uPg
 HNrfwowQhSLIrTEGcv1gdH1GNa1ABWJa3myimSJ7hztuin+iNYzUzn3tH
 fhUnUwHR92nLW53oy1D9/muJxuRj++akTJjtjl30hOub4LP28SmGSf1k4
 w8RoZsMBQFYbu465skPfJ4Pql1/5DfAMYi3Djxlc880jsdNejZ5O5HDzm
 IBKcWmBdBfe5lvfjh5T1jQzQQTg2ZRIeKXiirv7mhe+BN76FQmEZfujoz
 PyddZ3uD7vxvyHsXIxPVjNlYYEUOW6QtWvYGcK04ghs4xde52dp24WpLX w==;
X-IronPort-AV: E=Sophos;i="5.93,321,1654531200"; d="scan'208";a="211569373"
Received: from mail-bn1nam07lp2043.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.43])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2022 08:53:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6BGfrLH8fom/qj7TvNMTvlA9mTj/vyBg0v0ir67uHC1278ECeXuiRaLPah1S81/SD/UQRTQdZDZMAx9PA/roJCMGXyIJG4xqgDwkPhA4sicAcftICjUQ4VvB7NE0sMVYMmDlNjdxQk3/RoBTvXvax80R/Q0iYHFteuIoV73r4CDfAipl3JRC75rMPdsvy9KbfAsQwBYmu5O7Wiq9MccBX8eN6OAtk9fV1j/Lev3pF9bErH8uJuvR2ec6RP9Q44v3Z4u5Pr9oxAmvhaf++BARWRUiBkT13iGnU5OAlVLwhrp+t1b6dxdurMl8zhMeySdWffT/8iTDWmsuMpOOYBWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCK85M0v6w42l2wlsPXjifv5OqwppXZTptKIQdJhgq0=;
 b=Oda7vnsh5pLVlVvfg+mSEoHbdOHNladye2TLEOOYWPS1Jhs5JO+wiQBP8mpMtVeBqMRYjyzgxGX3XQoqr29C+YEgJ3Oz7uFVVQ/1kL4vok8hmIJroyBjNy6Bsmh1Ti63w0MHyCtQ88b8jaOFmnZG26t+yazL4P9gGbZG32oKTAiy6LELb7x14eny3BkuAQEC2yizzzu8N825XC+7vHgrd+qHDHrHbXogDDwc5po1G68+efD27UVFClb18YcuPDYdW1a+nRQl9HK2TroE0j+3jMBJ4SvkiFLzjCsVO8bPrqk7X95p8nT7wBoq65XPAfxPY3Is5WeZTLkDbaEgaXtqeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCK85M0v6w42l2wlsPXjifv5OqwppXZTptKIQdJhgq0=;
 b=hlLsm/wLLlY8bBNdxNL4PiGGEqITZJ3Szmj1AqWBulxAQrV+KVG/6sa9zPd3CNjp+1gtBeDHnOOgmCKpwGbYNOAODOZs0rPqqTR1CWcmSOXPOu1Aa/aSHYl0oRCD0npkvaC8tp2wHXwfbXPQyINDCk6F8gQCAERO2Kt1ZTdItf4=
Received: from BL0PR04MB6546.namprd04.prod.outlook.com (2603:10b6:208:1c2::14)
 by SN6PR04MB4909.namprd04.prod.outlook.com (2603:10b6:805:95::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Sat, 17 Sep
 2022 00:53:49 +0000
Received: from BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319]) by BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319%7]) with mapi id 15.20.5632.017; Sat, 17 Sep 2022
 00:53:49 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "palmer@dabbelt.com" <palmer@dabbelt.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "alistair23@gmail.com" <alistair23@gmail.com>
Subject: Re: [PATCH 2/3] hw/riscv: opentitan: Fixup resetvec
Thread-Topic: [PATCH 2/3] hw/riscv: opentitan: Fixup resetvec
Thread-Index: AQHYyCLpA7yZWy1r402gQAmze1TmWq3iz54A
Date: Sat, 17 Sep 2022 00:53:48 +0000
Message-ID: <6dd0cc964e663b0c1561ec397755c3878ada3945.camel@wdc.com>
References: <20220914101108.82571-1-alistair.francis@wdc.com>
 <20220914101108.82571-3-alistair.francis@wdc.com>
In-Reply-To: <20220914101108.82571-3-alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR04MB6546:EE_|SN6PR04MB4909:EE_
x-ms-office365-filtering-correlation-id: f606144a-58b1-4995-e00e-08da98471513
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K8sf6SWajW0Wv882pAuph8X2Vdh9SEC63wBZTw04sCmZHwVLYXf/nfV6LDFAb5GVmXvypUOmu7Lbwh/EQsfmcwZrMZ9ZspnzaCIAkKcDHGHr7XXRVZ6ZO+eTojaDTth/QwvNdLGMdoHONzp9v2lsBggZCAcm+P8yEePfilei5jyrZadlV8043FfEQVkzluX2/bi5uk1NAu68j01KYzkytihsO8xeMRboeTMujxtOKqXZEEJydLlS7hMrHsClmna00hWUREncpGoBPiURq7IFwoKqmq++MZdaAZClhYuS14U2902BdcxkrDO2LTYIhMcjYe6WtQxBFRDoGlbZfJ0sEwVI39ZWdtHa6UAqyEaoEs2TvXD6rP8dd7QjgQSQCkhtiG0uEog6/E53kNwXSm1Z+zSkcCDB4FF6d0JlKA1h/b9ivNSY8AcBwGA0Zb5s1DFzCHSOE1Ew9ZP4gF82WFkNxNBS3tkX1rW74ASa2o9F1BnQe/Hgi8QzRQHEiw8aDcPMj9J5WPgpxzyG8pTgGs98W+CcHxMUzCyQ1vvqSP95BkBKC6/VwoRFNgbacJ8FgZBswMKeMGdrFVonmv6AUh7GX13bz9PEshVesflscTWRInjMsKqxOdRQFcba5ZHODGUSSoP6DXykaEWHqy5mYlLyZFUre7RLuVusasl3igA4ZnvZiLTp8VmfB0ZlvHV8rn8JANY81ATixqkeJNKZWtD1f5V37QP/fo0qnYDs4OIrcxTwEUsNBhfJTZiahQVOfceCKI6Ek6zxGzznt+TGcfEKuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6546.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36756003)(2906002)(44832011)(122000001)(76116006)(66476007)(64756008)(66556008)(8676002)(4326008)(66946007)(66446008)(86362001)(5660300002)(82960400001)(38100700002)(54906003)(110136005)(316002)(8936002)(91956017)(186003)(478600001)(26005)(2616005)(38070700005)(6512007)(83380400001)(6486002)(71200400001)(41300700001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3RONER4dkpLYjZEbnEwQ2RlSkpWZU5iSmpCRENVVGhHYWkrcGNncWNTK0cw?=
 =?utf-8?B?S3dwdm4xQU1rV1QvZHl2d3M5MFpqaGpXeFA1M2dTclVtc3I4NEFpdTd6SFNG?=
 =?utf-8?B?UElVaVBORGJHRFhKM3dFakZSNkhaWVJTd1dRQmVKSS9CV0pCWVROa3R1S25m?=
 =?utf-8?B?bkhhbkZZdlR3RUtPemYvRFhTLzJQVnRVbmRPaldtWXA0M3pjekFHMVZGK24v?=
 =?utf-8?B?dEErT1Z1Z1JSMzAyWFRqSjkyb0JMelREMW15Z0pDVHBuMHA4YlFYUXBoUkJy?=
 =?utf-8?B?cFFoOXd3UEtuSlFRZmZZaUtiWXUyaHdxYlRnNlI2QWM4bWxCNmovdkQ2Rjkz?=
 =?utf-8?B?VXEwMFBPd2c5cGc0bE12bXlkcytoZEE3RTIrT0ljMGpKV3p4NEZ0QzU5b29m?=
 =?utf-8?B?NFhkMVlHeFB2Y0IzKzFta3ZqZEJ4L3c3ekVWaElPc1VaaFZ3Vnh5dEovaHZ0?=
 =?utf-8?B?aWs1RytGdlU3TUd3bWhtS0lDYkZza0pEaG9PbzgvRFFEblk3cm9CRjdZZzFL?=
 =?utf-8?B?amw4YmpoZTNjUVRua2lvblBnbm00ZW9yU3V6MVFMdUlqNDQ4Q3Z0aVZFc2VF?=
 =?utf-8?B?TldVQ1FLTzF5RFI2VUNHbEU0eDBlaC9xa0x6T29PblIwUmVHRHRVZzQ5R3JR?=
 =?utf-8?B?VVgvTkw2SEc2N3N2V2MwR292NkNITms5RHpGL3k4VmhJMTFsY3VhSzVUbVIw?=
 =?utf-8?B?aks0UFdhR2YvemhwUTVJanE3Z0w4cWVQd0NKM1Y4elBNNDBmWkQvNUwxN3V1?=
 =?utf-8?B?dGJNV2pVeStnWWJ6c0ZuK0huakVkMkNyV1lNeEh4VmpWbVRnTE0xdlN5YU5D?=
 =?utf-8?B?SjJwZ2huQjVWRDlxcE84c3U2SS9HZ3pNdHJEL1dOYm42Wmc1SVpNUmJlV2p6?=
 =?utf-8?B?WWpqcEplbEZLQndIQm1PSG5OQlA5YUJTdGZkaUFVclZjSTErTWZkOC9PYXFC?=
 =?utf-8?B?dklKMWJsakw3U25vUG45MHlHME9XVE5NeDI0WVRQZzhtcEFVQWkzVUJMTnVz?=
 =?utf-8?B?REZXbkJuV0Z0S1pKcVpNckFLS3laK0VWTzBsRFpoa2VUM2x5L1RwU0xONU9R?=
 =?utf-8?B?RjdyaFJ5OS81SjYrdmhZNUVvY0grMmczdFBxS3l0WklOM3ZFcndiNXRwNitS?=
 =?utf-8?B?MlpYVlBQNzBxdmREb1lJektJakhCZzFrVENqTFlnKzRaMFVXZm9SelNHVEdp?=
 =?utf-8?B?WFIrZURMOE5jUnhndWNhWXhFb0VEU2o5Q0ZFTmhzQWo3WmhrbGRKRWRnZlBN?=
 =?utf-8?B?ekJCSnRKRVdtMFBrNitEamNQYW9SLzBJdFJRSllpL08yTkU0aFVvcE9ZYXM4?=
 =?utf-8?B?K3JtZ0RhcHI2OVREYlVCdG5QWmxYT09PVmhkakVjMFBCU1FWT21CTEVLeEJx?=
 =?utf-8?B?VGpFa3M1OERkSzIyaUF3Z3hzRU9MQ0kzaGVNVk1UaXVVOGhFNjNJNWJHU3ZF?=
 =?utf-8?B?S2ltUUhnbXlQbFhFMWthS2ZmcFlmbTdOaE5kZUg1cFZZZmFGYnd5RTMxY1lq?=
 =?utf-8?B?UlBWbUIwdzF4cWNVRG56VXk0UGNYQitjMGV5SzdMaHJUOW43SlREOExOTUxQ?=
 =?utf-8?B?RXpyYUpwYU82clBEQ2NWR2xGWWlNMEhPeE0wSkRxWWVsZHFuVVBPNG1QTzBI?=
 =?utf-8?B?akRyZmVFcHRTd21CQk10RFVweVdySzhjZ0R1UDdmdkQxNjk4azRKZThTeDQw?=
 =?utf-8?B?NlZDbXdzZzNlV1ZhaGYyRHNZWTFtOGNIZGJka0o5NlVNWWJQUHNRaHdXMHJO?=
 =?utf-8?B?WndncXZCQTRFVVNtMzcyT2ZtYUJad2piYUZzeCtPVDZrT1F2alhxbXVndW5s?=
 =?utf-8?B?blVvUUhOL1F4T3FxbFQ2VmVaeVlGbzA4Zk9XVm5ZRUxEd1Z4R1BTclpqa0gr?=
 =?utf-8?B?WmV3Y3VrSEZlaGFyN0JnTnU5eG1xQnAzS1c1d2VlWlA3KzJ3QUE1QkRjZkg5?=
 =?utf-8?B?cmg4a0xwSUxSUmIrbUFVWndka3NLbCs4TDc1anh0VDN0RkEzcVI1L2NhVUNu?=
 =?utf-8?B?UFhKaXdYZzJPelgwL3puakJjZWs2VFBINjZBdGxrUGNBeTVEVi8xWktMekNE?=
 =?utf-8?B?M1p0TzNRaTVoSC9Ld1NYMlh3cnpSNTNIazdDbUhqY2JWdEdYZytTYzRVOHRQ?=
 =?utf-8?B?NnNGcDlKeG85RE9LZDYvM1lVc2FtODBGdUNGUFFXanpzcXJiQ0JFTXROSHlP?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7BC47AD74DB7644A2EFA85EA38D1005@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6546.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f606144a-58b1-4995-e00e-08da98471513
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2022 00:53:48.9758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gI1RwSfiTXGCkBGlaSjreBrQRxnztkhHxBJZ7Bzj/1UNgzlZiHSLixkp++Phs6KKNm1wcL7Pq5jbtAp3jHSs9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4909
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=252df0604=wilfred.mallawa@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 17 Sep 2022 00:53:55 -0000

T24gV2VkLCAyMDIyLTA5LTE0IGF0IDEyOjExICswMjAwLCBBbGlzdGFpciBGcmFuY2lzIHZpYSB3
cm90ZToNCj4gVGhlIHJlc2V0dmVjIGZvciB0aGUgT3BlblRpdGFuIG1hY2hpbmUgZW5kZWQgdXAg
YmVpbmcgc2V0IHRvIGFuIG91dA0KPiBvZg0KPiBkYXRlIHZhbHVlLCBzbyBsZXQncyBmaXggdGhh
dCBhbmQgYnVtcCBpdCB0byB0aGUgY29ycmVjdCBzdGFydA0KPiBhZGRyZXNzDQo+IChhZnRlciB0
aGUgYm9vdCBST00pDQo+IA0KPiBGaXhlczogYmY4ODAzYzY0ZDc1ICJody9yaXNjdjogb3BlbnRp
dGFuOiBidW1wIG9wZW50aXRhbiB2ZXJzaW9uIg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBG
cmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+DQo+IC0tLQ0KPiDCoGh3L3Jpc2N2L29w
ZW50aXRhbi5jIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3Jpc2N2L29wZW50aXRhbi5jIGIvaHcv
cmlzY3Yvb3BlbnRpdGFuLmMNCj4gaW5kZXggYWYxM2RiZTNiMS4uNDVjOTJjOWJiYyAxMDA2NDQN
Cj4gLS0tIGEvaHcvcmlzY3Yvb3BlbnRpdGFuLmMNCj4gKysrIGIvaHcvcmlzY3Yvb3BlbnRpdGFu
LmMNCj4gQEAgLTE0Miw3ICsxNDIsNyBAQCBzdGF0aWMgdm9pZCBsb3dyaXNjX2liZXhfc29jX3Jl
YWxpemUoRGV2aWNlU3RhdGUNCj4gKmRldl9zb2MsIEVycm9yICoqZXJycCkNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmVycm9yX2Fi
b3J0KTsNCj4gwqDCoMKgwqAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZzLT5jcHVz
KSwgIm51bS1oYXJ0cyIsIG1zLQ0KPiA+c21wLmNwdXMsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZlcnJvcl9hYm9ydCk7DQo+IC3C
oMKgwqAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZzLT5jcHVzKSwgInJlc2V0dmVj
IiwNCj4gMHgyMDAwMDQ5MCwNCj4gK8KgwqDCoCBvYmplY3RfcHJvcGVydHlfc2V0X2ludChPQkpF
Q1QoJnMtPmNwdXMpLCAicmVzZXR2ZWMiLA0KPiAweDIwMDAwNDAwLA0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmZXJyb3JfYWJvcnQp
Ow0KPiDCoMKgwqDCoCBzeXNidXNfcmVhbGl6ZShTWVNfQlVTX0RFVklDRSgmcy0+Y3B1cyksICZl
cnJvcl9mYXRhbCk7DQo+IMKgDQpSZXZpZXdlZCBieTogV2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVk
Lm1hbGxhd2FAd2RjLmNvbT4NCg0K

