Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3Phu-0007jg-ES
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 17:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=33486e341=wilfred.mallawa@wdc.com>)
 id 1p3Phs-0007j9-1r; Thu, 08 Dec 2022 17:49:32 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=33486e341=wilfred.mallawa@wdc.com>)
 id 1p3Php-0005dW-Jz; Thu, 08 Dec 2022 17:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1670539769; x=1702075769;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XFnpQgKEG8cI6zixh9utGD1FaolRgvTOKDWIzKZ9Avo=;
 b=d18+SOeJNYBC2fZOFzaJCSVA4vfJwBR6z/XTAcVgba0rOIyzPfCfUbr9
 TC/bnMFOadc33mazjsGSD5qNW9S/wYr/HsImF10GxPeEDM0VnkysfsEek
 jGjtvJJ1s+7Jkht8uupaEjKlAvZ79nEDY5Vh4GHV/jgaWqG+cFS+CcwNJ
 fQtw2/s+ULDDVmCmLY3fV6lNbZYZAdrQ8/3z8g0vkMWL3KGt3AijxsyZI
 WCM+uUq0Ge9myej73XK8a/GnnictV+ptzOXiiHahhSifJBUrriVpcKq3D
 BesJinFRVfLs1nTxKsP/KfH8b93Y1E7JNwvWA4iYbt6RE7Dj3UdB1rEhS w==;
X-IronPort-AV: E=Sophos;i="5.96,228,1665417600"; d="scan'208";a="330319320"
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2022 06:49:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdS6di47sHzp47vV6PntrBBYBC5xu48/EYH2CfHfEmy/ZB9n41iMMpm/GKycf7iXthNbjpugaU09utTXbI/SXw7jXmwk68sAIlTeKysNyeYprdnqw0pDzESARFMOTnTvn+6iM0WMa8tC5doLLgv9huMUyVNEUmDwre1mXN6+8QPLnXChZvmkDG5RZdbrwkqfsc6/irzy3kpVS3PoszlHZmJzz/cmXuWtz7clySXr6mWtE39uQCh/aYVJ0GBZ/sqNnCQY8UrkbbFRhcNCCXkTCD2o/aYkiNrFZlVXyFZk0tcrdVY4+Z7pMK9pJoB/VjIYvV8N1h6ykmWo9LqbouHfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFnpQgKEG8cI6zixh9utGD1FaolRgvTOKDWIzKZ9Avo=;
 b=NgcaAK8BtYU/E+WLFsgUhv9uBYVXHBih/hRZ7MA0QjcqwjI5dPd0XkPE6ialFcNSauROY3DmqYm9qZmKWrlZe77ALIJPvH6MncpXVo1bWpgdy7Qjen0j3Q37pYeYOWadHu4Z+Dv1RrguzpyXXPxmtHqj+I8A0Tl2UO/KXa4NngBce820lZ/a37LMsWvY2Z2Atl27KLvvYMkCkFcCCQ2Lz8gQrkdBwMBhRSAEjy2dOXCXdrrOm5sBdwRGvQqpdBjBmdtBu4c8MWgTJjjikFeKUMOd2NUEkdELr4Vmj07nq6wSX/ZB8Hy6bfg1wKIp9G6pzcTJ4nLKrAd0HjGcwEc31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFnpQgKEG8cI6zixh9utGD1FaolRgvTOKDWIzKZ9Avo=;
 b=tIie8ACqB5MRti5RtOhwggInDMEjjraFCU3Unddh62EBwbmnCOY8ZVKvPBMzhGoLZLooB/fQbECnbPAgODjR6SNlbbIqhZsPBlv2Yqm2WZXzZWAmpcnXpO/j5wcsNeYarsMQD4GjMrW1NLh4NuZY7D1kDixk0/3+4R1s8twzhaA=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by BN6PR04MB0835.namprd04.prod.outlook.com (2603:10b6:404:d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Thu, 8 Dec
 2022 22:49:24 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%6]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 22:49:24 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng@tinylab.org" <bmeng@tinylab.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "bin.meng@windriver.com" <bin.meng@windriver.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "vijai@behindbytes.com"
 <vijai@behindbytes.com>
Subject: Re: [PATCH v2 14/16] hw/intc: sifive_plic: Change "priority-base" to
 start from interrupt source 0
Thread-Topic: [PATCH v2 14/16] hw/intc: sifive_plic: Change "priority-base" to
 start from interrupt source 0
Thread-Index: AQHZCiOG0I1KOTl0f0K4Rt3ADDeoHq5kmlkA
Date: Thu, 8 Dec 2022 22:49:23 +0000
Message-ID: <d1e3772c8e6617908af1469b97cbabffd6287112.camel@wdc.com>
References: <20221207100335.290481-1-bmeng@tinylab.org>
 <20221207100335.290481-14-bmeng@tinylab.org>
In-Reply-To: <20221207100335.290481-14-bmeng@tinylab.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|BN6PR04MB0835:EE_
x-ms-office365-filtering-correlation-id: bdef731c-25d0-4018-e91e-08dad96e73df
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IdFXG1aDf5b8E5caqmVwSh7M/IHQUGd5xr++C/OHXKvdGjjNR1Z6Nro5BDF6pcQg+qYPQM05pCo5QETVuT4tTONwzBIbW8lp44nU/j8QPUJNR6ihd3V5vhSK3AzyHsaCEUkGP527ZPYfkJgczLXjJDjMax0zftZ4XMM5545Xpbvhrp8tWpPr9D5uc42W8ipFJljUbao93RqYpr33kzOVyC11/scDabv4Ut3E/j0U5QYP/OQwwpsbMHnM7t5DsDtwG38KVnLlXXkl55R1KF/1o0yidATmJ6hd81i65hdrGmrU/bNlr2NP5MJznfU3DcPVIZGLxorfJIgSpAkN553xH/iJ6KSRBQDe0AlJKigdTAWSSZObGqrX3w3LeGZk2DIw+dZBwBPYdAqoa+FeeRlfyOtJOTZD8bgqwt5ZBnPjIog1H4TIYhUB01HPVc5N+ne7/TE4TXDUv8ZWzeV+4YTUW2XmA3ybaNAVvbyEmXcgKfIvHLTTlkzPpCwRurzTSRuXMWDIiV8ie01vnKBn8Aqhnq/lGxYE0YCZ2wqXiXxMs6O6UAkNnxtxKZnnnQx4hh0g6ROlwiRgQ4lUSp2jg45P3u8sSI8i3wR/zbUICYA9KMhZOaYeXKeslwTJKyD/Eyo8dXqtf2aE/vdZoS1C8BH6Skb3unGlY7Lz4voMjb7AN8eZ0coI+0IpASzlN9zz8iLz7SbBStIJoAcoXOZVJtMNag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199015)(186003)(2616005)(6506007)(71200400001)(2906002)(26005)(6512007)(6486002)(478600001)(38100700002)(82960400001)(122000001)(86362001)(38070700005)(83380400001)(8936002)(4326008)(36756003)(44832011)(91956017)(5660300002)(64756008)(66446008)(66556008)(66946007)(8676002)(41300700001)(76116006)(66476007)(110136005)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ditOeSt2RlVCUFFrMm5UWDdObXFLNFoxckRhc3h2WU5NdlRoaHJxV1UxWlJN?=
 =?utf-8?B?azlBN3pJa0p1YXZNcGJOWDluaE52V3psOEZPbG1hTm5FdGFyS0hBNjA5aVhD?=
 =?utf-8?B?T0tjMStlMGwwR1hycXNGUE40V24zMDF2UXFUN1ZYK1c4YTM4MERNb2MzL3I1?=
 =?utf-8?B?UXBhcmwvVUNvbEtBVDJFZ0VOYVNreWZ0dWRHZ2NJQTdaZ3c2RmRpN0pzdXdm?=
 =?utf-8?B?YTdIcEloalk0SXlZL3Fib0VIWEJhMG1VK3RNc2o2cmkxUGZwc095dmlydkl0?=
 =?utf-8?B?QUg4cGpyQitoRUJXN1FaYXc3c01rSHFXdkxiRHJzR3RKRXh1cXJsVGVQY2JY?=
 =?utf-8?B?MVpQalhCL2Q4bGh0bCt6MFZ0emw5eUZicWtuR1dobStValpCOFZEcFpOSzA5?=
 =?utf-8?B?eTVmZ0RjSkR4c3lwQkRjVXN3S0xJbjdudGhCTFBRaDlVcXM5djZQVk9lWk5W?=
 =?utf-8?B?Y2NndFo5Z2E0U2pESTgxTkZDSndsUXE2U3JobUlYZS9jUlVESWR0Y0M4OUg3?=
 =?utf-8?B?dnVXS040VWtiTjFBaVJqWllBWHNHVHdWS2tkanA2by9YRjNyeWdpNnFmTHVu?=
 =?utf-8?B?cVZEdVBaYk1NcjFlQUVpcWVmZW1NRFpoL3NSdHZnT05HdHV4L3BEcS9hc1V1?=
 =?utf-8?B?VWEzcTR1MzVHNlJoMnZCN1FPOVQyQVB3S2VnbTBOSWE0ZGU2Z01Udmdjb2xE?=
 =?utf-8?B?RzBCdHI4OXFHbkdEUnJqeEZEclNuVlpDbXJ1MmlmODE0SVR0ZXB0WW1SM1pE?=
 =?utf-8?B?dVBlbVJMVUNUZzJRR3BaN1NMZXIraTlhNW9XR29rVHlwcXVvSlg0ajJlcHZk?=
 =?utf-8?B?WklTa29oMTkzLy9GcUxtR2FQRk9nMVRwUWNHTVV1ZDZxNjJTMjBXajJHYTl6?=
 =?utf-8?B?U0FWWG5YbHVqWi9NVlQwYU1rWUhHS1ZTdmVFNVE1MnUxZkdycm92NlZFenpp?=
 =?utf-8?B?Y2R1cStmNTdhOWx1S2wrbmtRVitTWmUyUFBkV0hOY1NiVjZ6M01ZcURIMndQ?=
 =?utf-8?B?bVZ6akJ0dTZWaUFZcng3Z3draW5pZmNETVlNWElVWjR3S3lGekhYd3laVjNs?=
 =?utf-8?B?U0J3WkxsU2plTUllL2w1V3FTTzR2ZzQrMmZuU2JTQjhJVzdRUVQzc1oxMVNZ?=
 =?utf-8?B?MkF6bjdydEYrVVpabkwzYnEwViticWVRWGpsbXZXYzZGenRXelJlMlJzUHNB?=
 =?utf-8?B?ei96TGxURWtEQUNzRVIzRW43eE9iMzREWEpXc0VFbEhrSGFpRStoMUo5WVhl?=
 =?utf-8?B?MEtuVk9ib0RVR0dWMGk3ak1QZEQ0WVl2WDBaQjN4ZHRZWU94aVZHVGxFTC95?=
 =?utf-8?B?Zmw3RUNjV2t1WDRwREdJM0hnTEkxTkdyR0ZiT1QxUnE2N1VIVVlCclN0cWVr?=
 =?utf-8?B?Zkl5UzdUdGtYQXFhdDFmZUx6cERITyt2alFYcFVNZGNUREdESEQraTkvekFO?=
 =?utf-8?B?a0tFUHRPTXlUNmtLV3p0dmRELzBpdDJhSTkxbDROZlVFM2sxVGg5Wmd4YVR1?=
 =?utf-8?B?bFVHY0N5SGdxdEZSdTF4eTgxeHRUaWoxcnhuY1pPRFhuc2VES2txeVA1VUpl?=
 =?utf-8?B?NktOaVFFbkNSczRsREhOVVNsdGhCb3B2aUFlQlNQSHd5ZzB6ZFZyRzFLSy9h?=
 =?utf-8?B?M1hWaWVDd1VUcW5qb1RLMFZ6R0ZYY05ySEwzNlpHbUFhVGt3U1VXUWRhZElr?=
 =?utf-8?B?Z05hSGFQUUs5SktPc2hmUUtpT3Z3ampMZlJwQm8wVWlUY1RrdjhWYVE1MHR1?=
 =?utf-8?B?WTRja0JoUGplZmNUVDhRbDUyQTN4ZmdPTzBiR0lYeW9CRUJISFd0bDJDZjdx?=
 =?utf-8?B?UGFmYTJVSzgzREFWcWwrMGliS29naEJxNTRCbEtNTmM5bWNhR1lpamZObGdl?=
 =?utf-8?B?Tk1VWTVIU0pGRmdHUEZLTmx1OHU4bUxhaFJVSENEZXpGSU5wTG1vRXJjZVBq?=
 =?utf-8?B?d0FIWE9oZnFjRDFiZEEzMnpyeGl2alJhUG1PUGxVckw0MnFISTdQZzNveGth?=
 =?utf-8?B?Qmh5YURZNlRaYzBRN25waWR3RE1WRHdlaWxTY3BQN1BkQ3VwdVlrOG8wc2ZF?=
 =?utf-8?B?NVpJTjZWOGxUb2R6cVNPSWJmS2gxLytoMGhPSHZpRVN3aGk0dTUvYUR2ZWtk?=
 =?utf-8?B?MzJ2c2xEN2R6OElTMWVHSlQ1V0gzK0h6ZG5QT0tHVWYwb1h6VjFHYzdOYm90?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE38F9829C762B49B16E6017B1732910@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdef731c-25d0-4018-e91e-08dad96e73df
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 22:49:23.9405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9IO9vuXEdGwv6BAP5Aqhd6kIh/A9CBzbTf7gLRFIRt7AbdKKyP/B9sMKDZuZoPSIa6XgjQg16FmHpU6kaBhWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0835
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=33486e341=wilfred.mallawa@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Thu, 08 Dec 2022 22:49:32 -0000

T24gV2VkLCAyMDIyLTEyLTA3IGF0IDE4OjAzICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gQXQg
cHJlc2VudCB0aGUgU2lGaXZlIFBMSUMgbW9kZWwgInByaW9yaXR5LWJhc2UiIGV4cGVjdHMgaW50
ZXJydXB0DQo+IHByaW9yaXR5IHJlZ2lzdGVyIGJhc2Ugc3RhcnRpbmcgZnJvbSBzb3VyY2UgMSBp
bnN0ZWFkIHNvdXJjZSAwLA0KPiB0aGF0J3Mgd2h5IG9uIG1vc3QgcGxhdGZvcm1zICJwcmlvcml0
eS1iYXNlIiBpcyBzZXQgdG8gMHgwNCBleGNlcHQNCj4gJ29wZW50aXRhbicgbWFjaGluZS4gJ29w
ZW50aXRhbicgc2hvdWxkIGhhdmUgc2V0ICJwcmlvcml0eS1iYXNlIg0KPiB0byAweDA0IHRvby4N
Cj4gDQo+IE5vdGUgdGhlIGlycSBudW1iZXIgY2FsY3VsYXRpb24gaW4gc2lmaXZlX3BsaWNfe3Jl
YWQsd3JpdGV9IGlzDQo+IGNvcnJlY3QgYXMgdGhlIGNvZGVzIG1ha2UgdXAgZm9yIHRoZSBpcnEg
bnVtYmVyIGJ5IGFkZGluZyAxLg0KPiANCj4gTGV0J3Mgc2ltcGx5IHVwZGF0ZSAicHJpb3JpdHkt
YmFzZSIgdG8gc3RhcnQgZnJvbSBpbnRlcnJ1cHQgc291cmNlDQo+IDAgYW5kIGFkZCBhIGNvbW1l
bnQgdG8gbWFrZSBpdCBjcnlzdGFsIGNsZWFyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmluIE1l
bmcgPGJtZW5nQHRpbnlsYWIub3JnPg0KPiBSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJhbmNpcyA8
YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPg0KUmV2aWV3ZWQtYnk6IFdpbGZyZWQgTWFsbGF3YSA8
d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+DQoNCldpbGZyZWQNCj4gLS0tDQo+IA0KPiAobm8gY2hh
bmdlcyBzaW5jZSB2MSkNCj4gDQo+IMKgaW5jbHVkZS9ody9yaXNjdi9taWNyb2NoaXBfcGZzb2Mu
aCB8IDIgKy0NCj4gwqBpbmNsdWRlL2h3L3Jpc2N2L3NoYWt0aV9jLmjCoMKgwqDCoMKgwqDCoCB8
IDIgKy0NCj4gwqBpbmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV9lLmjCoMKgwqDCoMKgwqDCoCB8IDIg
Ky0NCj4gwqBpbmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV91LmjCoMKgwqDCoMKgwqDCoCB8IDIgKy0N
Cj4gwqBpbmNsdWRlL2h3L3Jpc2N2L3ZpcnQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICst
DQo+IMKgaHcvaW50Yy9zaWZpdmVfcGxpYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1
ICsrKy0tDQo+IMKgNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9yaXNjdi9taWNyb2NoaXBfcGZzb2Mu
aA0KPiBiL2luY2x1ZGUvaHcvcmlzY3YvbWljcm9jaGlwX3Bmc29jLmgNCj4gaW5kZXggNTc3ZWZh
ZDBjNC4uZTY1ZmZlYjAyZCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9ody9yaXNjdi9taWNyb2No
aXBfcGZzb2MuaA0KPiArKysgYi9pbmNsdWRlL2h3L3Jpc2N2L21pY3JvY2hpcF9wZnNvYy5oDQo+
IEBAIC0xNTUsNyArMTU1LDcgQEAgZW51bSB7DQo+IMKgDQo+IMKgI2RlZmluZSBNSUNST0NISVBf
UEZTT0NfUExJQ19OVU1fU09VUkNFU8KgwqDCoMKgwqDCoMKgIDE4Nw0KPiDCoCNkZWZpbmUgTUlD
Uk9DSElQX1BGU09DX1BMSUNfTlVNX1BSSU9SSVRJRVPCoMKgwqDCoCA3DQo+IC0jZGVmaW5lIE1J
Q1JPQ0hJUF9QRlNPQ19QTElDX1BSSU9SSVRZX0JBU0XCoMKgwqDCoMKgIDB4MDQNCj4gKyNkZWZp
bmUgTUlDUk9DSElQX1BGU09DX1BMSUNfUFJJT1JJVFlfQkFTRcKgwqDCoMKgwqAgMHgwMA0KPiDC
oCNkZWZpbmUgTUlDUk9DSElQX1BGU09DX1BMSUNfUEVORElOR19CQVNFwqDCoMKgwqDCoMKgIDB4
MTAwMA0KPiDCoCNkZWZpbmUgTUlDUk9DSElQX1BGU09DX1BMSUNfRU5BQkxFX0JBU0XCoMKgwqDC
oMKgwqDCoCAweDIwMDANCj4gwqAjZGVmaW5lIE1JQ1JPQ0hJUF9QRlNPQ19QTElDX0VOQUJMRV9T
VFJJREXCoMKgwqDCoMKgIDB4ODANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvcmlzY3Yvc2hh
a3RpX2MuaA0KPiBiL2luY2x1ZGUvaHcvcmlzY3Yvc2hha3RpX2MuaA0KPiBpbmRleCBkYWYwYWFl
MTNmLi41MzlmZTExNTZkIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2h3L3Jpc2N2L3NoYWt0aV9j
LmgNCj4gKysrIGIvaW5jbHVkZS9ody9yaXNjdi9zaGFrdGlfYy5oDQo+IEBAIC02NSw3ICs2NSw3
IEBAIGVudW0gew0KPiDCoCNkZWZpbmUgU0hBS1RJX0NfUExJQ19OVU1fU09VUkNFUyAyOA0KPiDC
oC8qIEV4Y2x1ZGluZyBQcmlvcml0eSAwICovDQo+IMKgI2RlZmluZSBTSEFLVElfQ19QTElDX05V
TV9QUklPUklUSUVTIDINCj4gLSNkZWZpbmUgU0hBS1RJX0NfUExJQ19QUklPUklUWV9CQVNFIDB4
MDQNCj4gKyNkZWZpbmUgU0hBS1RJX0NfUExJQ19QUklPUklUWV9CQVNFIDB4MDANCj4gwqAjZGVm
aW5lIFNIQUtUSV9DX1BMSUNfUEVORElOR19CQVNFIDB4MTAwMA0KPiDCoCNkZWZpbmUgU0hBS1RJ
X0NfUExJQ19FTkFCTEVfQkFTRSAweDIwMDANCj4gwqAjZGVmaW5lIFNIQUtUSV9DX1BMSUNfRU5B
QkxFX1NUUklERSAweDgwDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV9l
LmgNCj4gYi9pbmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV9lLmgNCj4gaW5kZXggOWU1ODI0N2ZkOC4u
YjgyNGE3OWUyZCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9ody9yaXNjdi9zaWZpdmVfZS5oDQo+
ICsrKyBiL2luY2x1ZGUvaHcvcmlzY3Yvc2lmaXZlX2UuaA0KPiBAQCAtODksNyArODksNyBAQCBl
bnVtIHsNCj4gwqAgKi8NCj4gwqAjZGVmaW5lIFNJRklWRV9FX1BMSUNfTlVNX1NPVVJDRVMgNTMN
Cj4gwqAjZGVmaW5lIFNJRklWRV9FX1BMSUNfTlVNX1BSSU9SSVRJRVMgNw0KPiAtI2RlZmluZSBT
SUZJVkVfRV9QTElDX1BSSU9SSVRZX0JBU0UgMHgwNA0KPiArI2RlZmluZSBTSUZJVkVfRV9QTElD
X1BSSU9SSVRZX0JBU0UgMHgwMA0KPiDCoCNkZWZpbmUgU0lGSVZFX0VfUExJQ19QRU5ESU5HX0JB
U0UgMHgxMDAwDQo+IMKgI2RlZmluZSBTSUZJVkVfRV9QTElDX0VOQUJMRV9CQVNFIDB4MjAwMA0K
PiDCoCNkZWZpbmUgU0lGSVZFX0VfUExJQ19FTkFCTEVfU1RSSURFIDB4ODANCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvaHcvcmlzY3Yvc2lmaXZlX3UuaA0KPiBiL2luY2x1ZGUvaHcvcmlzY3Yvc2lm
aXZlX3UuaA0KPiBpbmRleCA4ZjYzYTE4M2M0Li5lNjgwZDYxZWNlIDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV91LmgNCj4gKysrIGIvaW5jbHVkZS9ody9yaXNjdi9zaWZp
dmVfdS5oDQo+IEBAIC0xNTgsNyArMTU4LDcgQEAgZW51bSB7DQo+IMKgDQo+IMKgI2RlZmluZSBT
SUZJVkVfVV9QTElDX05VTV9TT1VSQ0VTIDU0DQo+IMKgI2RlZmluZSBTSUZJVkVfVV9QTElDX05V
TV9QUklPUklUSUVTIDcNCj4gLSNkZWZpbmUgU0lGSVZFX1VfUExJQ19QUklPUklUWV9CQVNFIDB4
MDQNCj4gKyNkZWZpbmUgU0lGSVZFX1VfUExJQ19QUklPUklUWV9CQVNFIDB4MDANCj4gwqAjZGVm
aW5lIFNJRklWRV9VX1BMSUNfUEVORElOR19CQVNFIDB4MTAwMA0KPiDCoCNkZWZpbmUgU0lGSVZF
X1VfUExJQ19FTkFCTEVfQkFTRSAweDIwMDANCj4gwqAjZGVmaW5lIFNJRklWRV9VX1BMSUNfRU5B
QkxFX1NUUklERSAweDgwDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3Jpc2N2L3ZpcnQuaCBi
L2luY2x1ZGUvaHcvcmlzY3YvdmlydC5oDQo+IGluZGV4IGUxY2UwMDQ4YWYuLjM0MDdjOWU4ZGQg
MTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvaHcvcmlzY3YvdmlydC5oDQo+ICsrKyBiL2luY2x1ZGUv
aHcvcmlzY3YvdmlydC5oDQo+IEBAIC05OCw3ICs5OCw3IEBAIGVudW0gew0KPiDCoCNkZWZpbmUg
VklSVF9JUlFDSElQX01BWF9HVUVTVFNfQklUUyAzDQo+IMKgI2RlZmluZSBWSVJUX0lSUUNISVBf
TUFYX0dVRVNUUyAoKDFVIDw8DQo+IFZJUlRfSVJRQ0hJUF9NQVhfR1VFU1RTX0JJVFMpIC0gMVUp
DQo+IMKgDQo+IC0jZGVmaW5lIFZJUlRfUExJQ19QUklPUklUWV9CQVNFIDB4MDQNCj4gKyNkZWZp
bmUgVklSVF9QTElDX1BSSU9SSVRZX0JBU0UgMHgwMA0KPiDCoCNkZWZpbmUgVklSVF9QTElDX1BF
TkRJTkdfQkFTRSAweDEwMDANCj4gwqAjZGVmaW5lIFZJUlRfUExJQ19FTkFCTEVfQkFTRSAweDIw
MDANCj4gwqAjZGVmaW5lIFZJUlRfUExJQ19FTkFCTEVfU1RSSURFIDB4ODANCj4gZGlmZiAtLWdp
dCBhL2h3L2ludGMvc2lmaXZlX3BsaWMuYyBiL2h3L2ludGMvc2lmaXZlX3BsaWMuYw0KPiBpbmRl
eCAxZWRlYjFlMWVkLi4xYTc5MmNjM2Y1IDEwMDY0NA0KPiAtLS0gYS9ody9pbnRjL3NpZml2ZV9w
bGljLmMNCj4gKysrIGIvaHcvaW50Yy9zaWZpdmVfcGxpYy5jDQo+IEBAIC0xNDAsNyArMTQwLDcg
QEAgc3RhdGljIHVpbnQ2NF90IHNpZml2ZV9wbGljX3JlYWQodm9pZCAqb3BhcXVlLA0KPiBod2Fk
ZHIgYWRkciwgdW5zaWduZWQgc2l6ZSkNCj4gwqDCoMKgwqAgU2lGaXZlUExJQ1N0YXRlICpwbGlj
ID0gb3BhcXVlOw0KPiDCoA0KPiDCoMKgwqDCoCBpZiAoYWRkcl9iZXR3ZWVuKGFkZHIsIHBsaWMt
PnByaW9yaXR5X2Jhc2UsIHBsaWMtPm51bV9zb3VyY2VzIDw8DQo+IDIpKSB7DQo+IC3CoMKgwqDC
oMKgwqDCoCB1aW50MzJfdCBpcnEgPSAoKGFkZHIgLSBwbGljLT5wcmlvcml0eV9iYXNlKSA+PiAy
KSArIDE7DQo+ICvCoMKgwqDCoMKgwqDCoCB1aW50MzJfdCBpcnEgPSAoYWRkciAtIHBsaWMtPnBy
aW9yaXR5X2Jhc2UpID4+IDI7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHBsaWMt
PnNvdXJjZV9wcmlvcml0eVtpcnFdOw0KPiDCoMKgwqDCoCB9IGVsc2UgaWYgKGFkZHJfYmV0d2Vl
bihhZGRyLCBwbGljLT5wZW5kaW5nX2Jhc2UsIHBsaWMtDQo+ID5udW1fc291cmNlcyA+PiAzKSkg
ew0KPiBAQCAtMTg3LDcgKzE4Nyw3IEBAIHN0YXRpYyB2b2lkIHNpZml2ZV9wbGljX3dyaXRlKHZv
aWQgKm9wYXF1ZSwNCj4gaHdhZGRyIGFkZHIsIHVpbnQ2NF90IHZhbHVlLA0KPiDCoMKgwqDCoCBT
aUZpdmVQTElDU3RhdGUgKnBsaWMgPSBvcGFxdWU7DQo+IMKgDQo+IMKgwqDCoMKgIGlmIChhZGRy
X2JldHdlZW4oYWRkciwgcGxpYy0+cHJpb3JpdHlfYmFzZSwgcGxpYy0+bnVtX3NvdXJjZXMgPDwN
Cj4gMikpIHsNCj4gLcKgwqDCoMKgwqDCoMKgIHVpbnQzMl90IGlycSA9ICgoYWRkciAtIHBsaWMt
PnByaW9yaXR5X2Jhc2UpID4+IDIpICsgMTsNCj4gK8KgwqDCoMKgwqDCoMKgIHVpbnQzMl90IGly
cSA9IChhZGRyIC0gcGxpYy0+cHJpb3JpdHlfYmFzZSkgPj4gMjsNCj4gwqANCj4gwqDCoMKgwqDC
oMKgwqDCoCBpZiAoKChwbGljLT5udW1fcHJpb3JpdGllcyArIDEpICYgcGxpYy0+bnVtX3ByaW9y
aXRpZXMpID09DQo+IDApIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+IEBAIC00
MjgsNiArNDI4LDcgQEAgc3RhdGljIFByb3BlcnR5IHNpZml2ZV9wbGljX3Byb3BlcnRpZXNbXSA9
IHsNCj4gwqDCoMKgwqAgLyogbnVtYmVyIG9mIGludGVycnVwdCBzb3VyY2VzIGluY2x1ZGluZyBp
bnRlcnJ1cHQgc291cmNlIDAgKi8NCj4gwqDCoMKgwqAgREVGSU5FX1BST1BfVUlOVDMyKCJudW0t
c291cmNlcyIsIFNpRml2ZVBMSUNTdGF0ZSwgbnVtX3NvdXJjZXMsDQo+IDEpLA0KPiDCoMKgwqDC
oCBERUZJTkVfUFJPUF9VSU5UMzIoIm51bS1wcmlvcml0aWVzIiwgU2lGaXZlUExJQ1N0YXRlLA0K
PiBudW1fcHJpb3JpdGllcywgMCksDQo+ICvCoMKgwqAgLyogaW50ZXJydXB0IHByaW9yaXR5IHJl
Z2lzdGVyIGJhc2Ugc3RhcnRpbmcgZnJvbSBzb3VyY2UgMCAqLw0KPiDCoMKgwqDCoCBERUZJTkVf
UFJPUF9VSU5UMzIoInByaW9yaXR5LWJhc2UiLCBTaUZpdmVQTElDU3RhdGUsDQo+IHByaW9yaXR5
X2Jhc2UsIDApLA0KPiDCoMKgwqDCoCBERUZJTkVfUFJPUF9VSU5UMzIoInBlbmRpbmctYmFzZSIs
IFNpRml2ZVBMSUNTdGF0ZSwNCj4gcGVuZGluZ19iYXNlLCAwKSwNCj4gwqDCoMKgwqAgREVGSU5F
X1BST1BfVUlOVDMyKCJlbmFibGUtYmFzZSIsIFNpRml2ZVBMSUNTdGF0ZSwgZW5hYmxlX2Jhc2Us
DQo+IDApLA0KDQo=

