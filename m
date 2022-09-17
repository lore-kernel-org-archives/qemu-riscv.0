Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZM5O-0008Us-FH
	for mharc-qemu-riscv@gnu.org; Fri, 16 Sep 2022 20:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=252df0604=wilfred.mallawa@wdc.com>)
 id 1oZM5N-0008Uf-1t; Fri, 16 Sep 2022 20:53:33 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:25621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=252df0604=wilfred.mallawa@wdc.com>)
 id 1oZM5J-00057w-Bk; Fri, 16 Sep 2022 20:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663376009; x=1694912009;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lqC2GAQzr3MPUfqLLgo/xiRN5bncTNV86Up/q/35DH0=;
 b=PhbvOA/HO7yOO1hCiE0oqry/WZOw2a8K7b4SN2BhttIqk1xGeDEf/KQ8
 scV7nwWRN0czC/SZxed/8XR90VBoKe3+FavXno6YIk5aFvVxc516eaE1b
 UIHfGBE+d7b4uUNjfkUmS5eZ/myuDFyjxSabro3k9OQXrtkAOOzDqe1rh
 b15TnOLm/Z6c/iwqTzscNQXyXyKgxYIpg5rplFG+I7o8qad/Ll1+oj2mm
 sVVn1Tg4dr/ftP13hqnDiMQ2q4QXeZtKRsncEfY8fuNyQiR+9keRfnAIP
 6/UEmGJI9JH7YDdGao9fJ0T94n3S8KcObSuWiaIDVxKNVWIKb3ooOAcxN w==;
X-IronPort-AV: E=Sophos;i="5.93,321,1654531200"; d="scan'208";a="211569348"
Received: from mail-bn1nam07lp2048.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.48])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2022 08:53:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjpPXPd7wRXx+f2ZZ46Osbxt92+5fyuAZNNossN7AsqFVSkMfTno7SVFcJFHb8cT8pcqzVeABxaG7MB5LivanNIkqEHIBH6r6Yx6s9UgptOsmJQjWN2N8fzvfGisdtjsmRutI6UxeqpvBQd9HmOMfxpwkdN6HNU4ZSft4wnKSHOrPksYIt2o2hbrJRk3sftbrpRGs0vbyKX8BNE9f2H5RGHv8yAMhUyi3Qutv5VjqBExGmFBzjngt36rdy0lQtYR7F8blyJwe+Pxc5i+MjijyUeaiwLxmygAe9UyuK6F4f1O82UbJKRpVR9BrJU0UCiiGzQtrUAft6/w3x10Ek2ooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqC2GAQzr3MPUfqLLgo/xiRN5bncTNV86Up/q/35DH0=;
 b=PBjL7uB5MzRdTDY8sr2HG+Oh1mXV+AWisKkjZ+dLQoRDqNepqDX5dvpHGoDWGluxQZDdyv/1qP9Yk91wp7WwoF8Q6fb/I4B+pePJa2RoY27MtGKemK2q963ufxRe/+fLFF2RWp2ieO8jXKAdIXuwKN8UMqe1j8P34nwF2mk3KT7tnFrmjSqf20onos7A+aQ74474j6XaiksfHjMvDmlpRpk1F0GB6fU9VD7dV+H0hL1fs5YyF+0pfbLGa/5fUyY5/fjO+ob/CLw/4FG/atYV5m+HNhfNyo/LDRz1QCrhjFDeeIq7dOxTpTK3GuQKtpKC3QjqFZ02X1D07TM+YLX+Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqC2GAQzr3MPUfqLLgo/xiRN5bncTNV86Up/q/35DH0=;
 b=Gh+m5simbGb+M9uDVYmOtfFqv0A9ZNd0qV0GXwj8j7LLRusVR12Am434WLxEe9+Q5HawztkdqMlSKKSzQrctb7G87zLPNFR98HY1s9C8o7FMh89NVWS4jmdUQXqtvaNWg7JL4VtqgFHRAsi7R1WDqlxY3cS4yOm+9PEYg85/M3w=
Received: from BL0PR04MB6546.namprd04.prod.outlook.com (2603:10b6:208:1c2::14)
 by SN6PR04MB4909.namprd04.prod.outlook.com (2603:10b6:805:95::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Sat, 17 Sep
 2022 00:53:16 +0000
Received: from BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319]) by BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319%7]) with mapi id 15.20.5632.017; Sat, 17 Sep 2022
 00:53:16 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "palmer@dabbelt.com" <palmer@dabbelt.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "alistair23@gmail.com" <alistair23@gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Set the CPU resetvec directly
Thread-Topic: [PATCH 1/3] target/riscv: Set the CPU resetvec directly
Thread-Index: AQHYyCLoggWFmdYQN0WMWu6PiTEqy63iz3UA
Date: Sat, 17 Sep 2022 00:53:16 +0000
Message-ID: <3a34fa36981e7f45229d23e63b5393b2aca31b4e.camel@wdc.com>
References: <20220914101108.82571-1-alistair.francis@wdc.com>
 <20220914101108.82571-2-alistair.francis@wdc.com>
In-Reply-To: <20220914101108.82571-2-alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR04MB6546:EE_|SN6PR04MB4909:EE_
x-ms-office365-filtering-correlation-id: 2abd3d87-c381-40b6-b99b-08da984701e0
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fhpv+LbeHbML5dglqIps6Je9DX82JnDhIIKHZTuou5/Fri1wlKIVHx+18rSEXfZtjr3pHr1Boqs/+7vw4R00SYH3LvfiOe84RMSi70QpsWQ9U2qLQRCBHE9qyaBFjqp9fXqoGieYPnXDrG/Tr1cawM9PKi0c2slf3SU18jmSEXe4haSfjdpaimQaWrK6lLcxMRFgj92toRy4jjrGhRiy4ghlI+H3dZ1RvTiERmTzlS9l06YU/ICFwzywSGUu5eK3l+M5joOTTO1N+yYqUKtDLjleWFj+5QmSOrDdZlPKY3+xl+HugKbBcg9Uap1TLBXTQasBqQnSMtrFzGWp0BTwWcgBdS5eLsLpwMOtJQHXr9UO1vueIaCdcxJgkKxKCQsv6mqA/AFUVgEmFRf9mdnExurX9FcjLa6uIQjp/FGSc8BWFFfYdnimsWW/sCOvLvl/uVYVmEe2c+2bNrJ+k5sJg0O+WejRshKINf1Unm6irVWYTThSrjxsTSDi91zMmql7VPMX3XPerNVo5xyRBnh/GK3zTeX/DVDNqwBLHPWkBQcbxBCZCPTT32CazsMAqLs8e8GppZWyglDUXd0pEA9gWYOoZui32N5HQlJXw/PyaNzZJjCfVOvRzvO1rV2WRtzlTZQM2IpYAIkqhulyFFKK5fqi+htwsAyNcjSbeYZdC/yTFjJEoIPMovLzvbl5e7azta4Y20qhFjnGguTI7ObAZwAcQZcsUtFvEo8KcTwK62UtuCuyC+25wV0OL18qNoS2RyyYMVFlGKlX3y5NhMXFXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6546.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36756003)(2906002)(44832011)(122000001)(76116006)(66476007)(64756008)(66556008)(8676002)(4326008)(66946007)(66446008)(86362001)(5660300002)(82960400001)(38100700002)(54906003)(110136005)(316002)(8936002)(91956017)(186003)(478600001)(26005)(2616005)(38070700005)(6512007)(83380400001)(6486002)(71200400001)(41300700001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amplZ0pqeDNDcUJwaUppS0ZYaXZsalhNUjJNeGI4RjJZQ0dtSzU2SjlrcE93?=
 =?utf-8?B?YzZKeHcwRXB1cTFjTHMvYUpuSVc4N3JIbWJlRWs0SS9sUUVYNzR3ZXk0Z2F4?=
 =?utf-8?B?QnhMTGZOY1M4SWFtdW4wS0h5a0RkT2ZJZHFZdldHQnRiTTQzNEE1ZStjcmFJ?=
 =?utf-8?B?S3Zrb0VNQXpISzZ0Syt1dWFFdGRqeWY1amIvTGdBbXJiV2lwU2txSDJMS3p3?=
 =?utf-8?B?VysrRUVNMG13dG5ndk9kVTVjb0pJTWNDRVZXWHYvL1czczF4NEN2SlZmS2th?=
 =?utf-8?B?SEhBWVE5cGUyRkozZFJxQjI0bjlPQTY4bktrYm14ZGVNMHB3N3M2dEtpeDBh?=
 =?utf-8?B?WnRnblRmUUxOcjVuU1cyQTMxUit5M2dlWlZnZDYxSkZnWGgraWVkN2RkcjZq?=
 =?utf-8?B?c2Zia2Y3L2JSZmg2aktPVm40VitSZEdxblNSMlBtNXU2UThPaitJQ3I2TmpF?=
 =?utf-8?B?UUlBYnBVeHFnZ0dzN24rckpXcmw3bm5Xd3RwbXI0K2taUWwvQXlhc2RFUjEr?=
 =?utf-8?B?QU5RdXN2RlVrb0o5QlZlRU8rK09GbTFHMTcvQ0liZ1Nib05jc2tGUkpmeGdF?=
 =?utf-8?B?cTFNZnFBZ2ltOHpXeVJYUU12dTZnR08xOFIwNFpNbXdDdWNQTnhhVjEwTWpm?=
 =?utf-8?B?enUzZTZ1b1R0NzRRcW9HVU5wYU5hOUlxSnQvMk94dzBGVktUTU9HcUNWUUp5?=
 =?utf-8?B?K1ZpSzlxS0tWYmNiUEVhN05hZFYwbm1INERaVjY0VmxocGdOVWJzL2MvMkZ0?=
 =?utf-8?B?S1cweW93VzdHcnBST0FqWmhzNW1ISTZGNzc5SndnYXNFREpSWHZMbzBQQmhr?=
 =?utf-8?B?TGN6MVV4cEN0c1VuSWpKTEJ1NXRQQjVtQ3BuYjAxa2xqMzUwZGpkS0g0cHEy?=
 =?utf-8?B?aVVoTG9LRElGRFVaZmVHVm9KSTRGRXNpR3RmdXR0NUV1QXBjNU5GUmpkTlBj?=
 =?utf-8?B?QnUxdHJmZi9pTWZ3OEFtTS9VaFdWNmxQM0hXVTVES2tDblFEQ1N2cjQyWG8w?=
 =?utf-8?B?YzJUL21LTHR3Sk85NHY3bEpxUEIrWCs2WmZsSmlhQ25XL1p0SG5URTVHcXMw?=
 =?utf-8?B?Nk9HK1c1SUJFTGR4RmYwczFHeGRCV21pUlNibkhVWDlaRDEwRzFXbU93Q2Ni?=
 =?utf-8?B?TTBvSVJKL0NsRkEzbGZVYnoxNll3bmFEQW4xcTFYV1lEZkRUVE5JS1pkZklM?=
 =?utf-8?B?WnQ3QW5FUjNYOWZUN3d3aW1yMWlXMTZqK3cvcWxPb2NlbjhoYXJJbVRpUExo?=
 =?utf-8?B?WVF5U0RqZ0p0SzdlV3ZtRUk0VTdISWw4YXcwNmhRNkVxbVVTQTMyS0NqOW1T?=
 =?utf-8?B?cldiTXRSNzk2TTVFQnE3S3J1RENJdTN4OW1DZDlJL0x6aDlIUGhUdW40UkFS?=
 =?utf-8?B?NEFhUW5USnNNKzNiNXFoaW1YYWpmMkNBSU16U3BQcjNSM2tNWVM1VWJRSi9I?=
 =?utf-8?B?Ujc0bi9aUXlhc3dDa3NGREJLWE1iUnhGWmE3ZE52TEtXbWM2cWJFd1dZUTBp?=
 =?utf-8?B?QmZvTDY4eDV5cmtmWjRENGt1Wk40RlkvY0pvbjdhZ0wxK2JnQkhhZ25UZmJZ?=
 =?utf-8?B?VXc4UVlYTU9RUjA5Qm5LWXh1YVh1TGtHMkhmbVArUG1RNnY1YkxDY3lUaS9n?=
 =?utf-8?B?KzJQclVGV25vRW5URlRRQTdaQW0yanFJK0hmaU1xdzZZL21wVCt4WHVpMmt3?=
 =?utf-8?B?eUVsb1JUSnM5dFprc1ZSK0h1bDF3WEd4SDd5VnFmVit2R2p1anFlYWZ6TXZU?=
 =?utf-8?B?SUR0RGxReXZiSVpMWUVnbjZvNWlHVlp1TlJNZzh1MVYrNWpBOW5KN0lheEox?=
 =?utf-8?B?eUY2Unowc2FWVDZPZ2xTcDdUVjZIYTkrZTRrNzdqUWhSQ0NKd0F2djdtWjR6?=
 =?utf-8?B?cXoybU5rY2dRVlhDS0tDWUlrQVVrQTFRNTlaNWFOaldLRDFRcDIwa01BRTc4?=
 =?utf-8?B?ZG9lSTljVllGV1Jxdjc3OGZacVZzZXVKNTI5eTFRbENmRG1MVURwNStadjR1?=
 =?utf-8?B?YXMxbWJhVVFUY3FqYTQ3MGZPVmtjSXR2WXhaWmFTT1piM1pQOEVLdGw2Mm5n?=
 =?utf-8?B?bE9yN1d6MWZTMUdQM2xibGZPajRmaHlVR2pJRVVWb0FDenhJMWZqallYYWs5?=
 =?utf-8?B?RnRjZzd3NjlyT09IM1paU2N1Mnc5WHdHT3VMdVNKTTZLN0tRUE5JdlV1TU9L?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA83BB2076195E49AD1DCA257673AA4E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6546.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abd3d87-c381-40b6-b99b-08da984701e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2022 00:53:16.7170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ha5P7wIaxTfFYVxBoe7uqmkgn8hwu3F6sXYacWFRxrUM4gSmN0T7q831mUhefGj/jCcqOWdWV8WMmi5z9DshyA==
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
X-List-Received-Date: Sat, 17 Sep 2022 00:53:33 -0000

T24gV2VkLCAyMDIyLTA5LTE0IGF0IDEyOjExICswMjAwLCBBbGlzdGFpciBGcmFuY2lzIHZpYSB3
cm90ZToNCj4gSW5zdGVhZCBvZiB1c2luZyBvdXIgcHJvcGVydGllcyB0byBzZXQgYSBjb25maWcg
dmFsdWUgd2hpY2ggdGhlbg0KPiBtaWdodA0KPiBiZSB1c2VkIHRvIHNldCB0aGUgcmVzZXR2ZWMg
KGRlcGVuZGluZyBvbiB5b3VyIHRpbWluZyksIGxldCdzIGluc3RlYWQNCj4ganVzdCBzZXQgdGhl
IHJlc2V0dmVjIGRpcmVjdGx5IGluIHRoZSBlbnYgc3RydWN0Lg0KPiANCj4gVGhpcyBhbGxvd3Mg
dXMgdG8gc2V0IHRoZSByZXNldCB2ZWMgZnJvbSB0aGUgY29tbWFuZCBsaW5lIHdpdGg6DQo+IMKg
wqDCoCAtZ2xvYmFsDQo+IGRyaXZlcj1yaXNjdi5oYXJ0X2FycmF5LHByb3BlcnR5PXJlc2V0dmVj
LHZhbHVlPTB4MjAwMDA0MDANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMg
PGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCj4gLS0tDQo+IMKgdGFyZ2V0L3Jpc2N2L2NwdS5o
wqDCoMKgwqAgfMKgIDMgKy0tDQo+IMKgdGFyZ2V0L3Jpc2N2L2NwdS5jwqDCoMKgwqAgfCAxMyAr
KystLS0tLS0tLS0tDQo+IMKgdGFyZ2V0L3Jpc2N2L21hY2hpbmUuYyB8wqAgNiArKystLS0NCj4g
wqAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2NwdS5oIGIvdGFyZ2V0L3Jpc2N2L2NwdS5oDQo+
IGluZGV4IDA2NzUxZTFlM2UuLjIyMzQ0YTYyMGIgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9yaXNj
di9jcHUuaA0KPiArKysgYi90YXJnZXQvcmlzY3YvY3B1LmgNCj4gQEAgLTE5MCw3ICsxOTAsNyBA
QCBzdHJ1Y3QgQ1BVQXJjaFN0YXRlIHsNCj4gwqDCoMKgwqAgLyogVGhpcyBjb250YWlucyBRRU1V
IHNwZWNpZmljIGluZm9ybWF0aW9uIGFib3V0IHRoZSB2aXJ0IHN0YXRlLg0KPiAqLw0KPiDCoMKg
wqDCoCB0YXJnZXRfdWxvbmcgdmlydDsNCj4gwqDCoMKgwqAgdGFyZ2V0X3Vsb25nIGdlaWxlbjsN
Cj4gLcKgwqDCoCB0YXJnZXRfdWxvbmcgcmVzZXR2ZWM7DQo+ICvCoMKgwqAgdWludDY0X3QgcmVz
ZXR2ZWM7DQo+IMKgDQo+IMKgwqDCoMKgIHRhcmdldF91bG9uZyBtaGFydGlkOw0KPiDCoMKgwqDC
oCAvKg0KPiBAQCAtNDc0LDcgKzQ3NCw2IEBAIHN0cnVjdCBSSVNDVkNQVUNvbmZpZyB7DQo+IMKg
wqDCoMKgIGJvb2wgcG1wOw0KPiDCoMKgwqDCoCBib29sIGVwbXA7DQo+IMKgwqDCoMKgIGJvb2wg
ZGVidWc7DQo+IC3CoMKgwqAgdWludDY0X3QgcmVzZXR2ZWM7DQo+IMKgDQo+IMKgwqDCoMKgIGJv
b2wgc2hvcnRfaXNhX3N0cmluZzsNCj4gwqB9Ow0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2
L2NwdS5jIGIvdGFyZ2V0L3Jpc2N2L2NwdS5jDQo+IGluZGV4IGFlZTE0YTIzOWEuLmIyOWM4OGI5
ZjAgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9yaXNjdi9jcHUuYw0KPiArKysgYi90YXJnZXQvcmlz
Y3YvY3B1LmMNCj4gQEAgLTIyOCwxMyArMjI4LDYgQEAgc3RhdGljIHZvaWQgc2V0X3ZleHRfdmVy
c2lvbihDUFVSSVNDVlN0YXRlICplbnYsDQo+IGludCB2ZXh0X3ZlcikNCj4gwqDCoMKgwqAgZW52
LT52ZXh0X3ZlciA9IHZleHRfdmVyOw0KPiDCoH0NCj4gwqANCj4gLXN0YXRpYyB2b2lkIHNldF9y
ZXNldHZlYyhDUFVSSVNDVlN0YXRlICplbnYsIHRhcmdldF91bG9uZyByZXNldHZlYykNCj4gLXsN
Cj4gLSNpZm5kZWYgQ09ORklHX1VTRVJfT05MWQ0KPiAtwqDCoMKgIGVudi0+cmVzZXR2ZWMgPSBy
ZXNldHZlYzsNCj4gLSNlbmRpZg0KPiAtfQ0KPiAtDQo+IMKgc3RhdGljIHZvaWQgcmlzY3ZfYW55
X2NwdV9pbml0KE9iamVjdCAqb2JqKQ0KPiDCoHsNCj4gwqDCoMKgwqAgQ1BVUklTQ1ZTdGF0ZSAq
ZW52ID0gJlJJU0NWX0NQVShvYmopLT5lbnY7DQo+IEBAIC0zMzYsNyArMzI5LDYgQEAgc3RhdGlj
IHZvaWQgcnYzMl9pbWFmY3Vfbm9tbXVfY3B1X2luaXQoT2JqZWN0DQo+ICpvYmopDQo+IMKgDQo+
IMKgwqDCoMKgIHNldF9taXNhKGVudiwgTVhMX1JWMzIsIFJWSSB8IFJWTSB8IFJWQSB8IFJWRiB8
IFJWQyB8IFJWVSk7DQo+IMKgwqDCoMKgIHNldF9wcml2X3ZlcnNpb24oZW52LCBQUklWX1ZFUlNJ
T05fMV8xMF8wKTsNCj4gLcKgwqDCoCBzZXRfcmVzZXR2ZWMoZW52LCBERUZBVUxUX1JTVFZFQyk7
DQo+IMKgwqDCoMKgIGNwdS0+Y2ZnLm1tdSA9IGZhbHNlOw0KPiDCoH0NCj4gwqAjZW5kaWYNCj4g
QEAgLTY3Niw3ICs2NjgsNiBAQCBzdGF0aWMgdm9pZCByaXNjdl9jcHVfcmVhbGl6ZShEZXZpY2VT
dGF0ZSAqZGV2LA0KPiBFcnJvciAqKmVycnApDQo+IMKgwqDCoMKgwqDCoMKgwqAgcmlzY3Zfc2V0
X2ZlYXR1cmUoZW52LCBSSVNDVl9GRUFUVVJFX0RFQlVHKTsNCj4gwqDCoMKgwqAgfQ0KPiDCoA0K
PiAtwqDCoMKgIHNldF9yZXNldHZlYyhlbnYsIGNwdS0+Y2ZnLnJlc2V0dmVjKTsNCj4gwqANCj4g
wqAjaWZuZGVmIENPTkZJR19VU0VSX09OTFkNCj4gwqDCoMKgwqAgaWYgKGNwdS0+Y2ZnLmV4dF9z
c3RjKSB7DQo+IEBAIC0xMDc5LDcgKzEwNzAsOSBAQCBzdGF0aWMgUHJvcGVydHkgcmlzY3ZfY3B1
X3Byb3BlcnRpZXNbXSA9IHsNCj4gwqDCoMKgwqAgREVGSU5FX1BST1BfVUlOVDY0KCJtYXJjaGlk
IiwgUklTQ1ZDUFUsIGNmZy5tYXJjaGlkLA0KPiBSSVNDVl9DUFVfTUFSQ0hJRCksDQo+IMKgwqDC
oMKgIERFRklORV9QUk9QX1VJTlQ2NCgibWltcGlkIiwgUklTQ1ZDUFUsIGNmZy5taW1waWQsDQo+
IFJJU0NWX0NQVV9NSU1QSUQpLA0KPiDCoA0KPiAtwqDCoMKgIERFRklORV9QUk9QX1VJTlQ2NCgi
cmVzZXR2ZWMiLCBSSVNDVkNQVSwgY2ZnLnJlc2V0dmVjLA0KPiBERUZBVUxUX1JTVFZFQyksDQo+
ICsjaWZuZGVmIENPTkZJR19VU0VSX09OTFkNCj4gK8KgwqDCoCBERUZJTkVfUFJPUF9VSU5UNjQo
InJlc2V0dmVjIiwgUklTQ1ZDUFUsIGVudi5yZXNldHZlYywNCj4gREVGQVVMVF9SU1RWRUMpLA0K
PiArI2VuZGlmDQo+IMKgDQo+IMKgwqDCoMKgIERFRklORV9QUk9QX0JPT0woInNob3J0LWlzYS1z
dHJpbmciLCBSSVNDVkNQVSwNCj4gY2ZnLnNob3J0X2lzYV9zdHJpbmcsIGZhbHNlKSwNCj4gwqAN
Cj4gZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9tYWNoaW5lLmMgYi90YXJnZXQvcmlzY3YvbWFj
aGluZS5jDQo+IGluZGV4IDQxMDk4ZjZhZDAuLmM0ZTZiM2JiYTQgMTAwNjQ0DQo+IC0tLSBhL3Rh
cmdldC9yaXNjdi9tYWNoaW5lLmMNCj4gKysrIGIvdGFyZ2V0L3Jpc2N2L21hY2hpbmUuYw0KPiBA
QCAtMzA4LDggKzMwOCw4IEBAIHN0YXRpYyBjb25zdCBWTVN0YXRlRGVzY3JpcHRpb24NCj4gdm1z
dGF0ZV9wbXVfY3RyX3N0YXRlID0gew0KPiDCoA0KPiDCoGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlv
biB2bXN0YXRlX3Jpc2N2X2NwdSA9IHsNCj4gwqDCoMKgwqAgLm5hbWUgPSAiY3B1IiwNCj4gLcKg
wqDCoCAudmVyc2lvbl9pZCA9IDQsDQo+IC3CoMKgwqAgLm1pbmltdW1fdmVyc2lvbl9pZCA9IDQs
DQo+ICvCoMKgwqAgLnZlcnNpb25faWQgPSA1LA0KPiArwqDCoMKgIC5taW5pbXVtX3ZlcnNpb25f
aWQgPSA1LA0KPiDCoMKgwqDCoCAucG9zdF9sb2FkID0gcmlzY3ZfY3B1X3Bvc3RfbG9hZCwNCj4g
wqDCoMKgwqAgLmZpZWxkcyA9IChWTVN0YXRlRmllbGRbXSkgew0KPiDCoMKgwqDCoMKgwqDCoMKg
IFZNU1RBVEVfVUlOVFRMX0FSUkFZKGVudi5ncHIsIFJJU0NWQ1BVLCAzMiksDQo+IEBAIC0zMzEs
NyArMzMxLDcgQEAgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIHZtc3RhdGVfcmlzY3ZfY3B1ID0g
ew0KPiDCoMKgwqDCoMKgwqDCoMKgIFZNU1RBVEVfVUlOVDMyKGVudi5mZWF0dXJlcywgUklTQ1ZD
UFUpLA0KPiDCoMKgwqDCoMKgwqDCoMKgIFZNU1RBVEVfVUlOVFRMKGVudi5wcml2LCBSSVNDVkNQ
VSksDQo+IMKgwqDCoMKgwqDCoMKgwqAgVk1TVEFURV9VSU5UVEwoZW52LnZpcnQsIFJJU0NWQ1BV
KSwNCj4gLcKgwqDCoMKgwqDCoMKgIFZNU1RBVEVfVUlOVFRMKGVudi5yZXNldHZlYywgUklTQ1ZD
UFUpLA0KPiArwqDCoMKgwqDCoMKgwqAgVk1TVEFURV9VSU5UNjQoZW52LnJlc2V0dmVjLCBSSVND
VkNQVSksDQo+IMKgwqDCoMKgwqDCoMKgwqAgVk1TVEFURV9VSU5UVEwoZW52Lm1oYXJ0aWQsIFJJ
U0NWQ1BVKSwNCj4gwqDCoMKgwqDCoMKgwqDCoCBWTVNUQVRFX1VJTlQ2NChlbnYubXN0YXR1cywg
UklTQ1ZDUFUpLA0KPiDCoMKgwqDCoMKgwqDCoMKgIFZNU1RBVEVfVUlOVDY0KGVudi5taXAsIFJJ
U0NWQ1BVKSwNCg0KUmV2aWV3ZWQgYnk6IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdh
QHdkYy5jb20+DQo=

