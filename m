Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNt5Y-0005Sz-4b
	for mharc-qemu-riscv@gnu.org; Tue, 16 Aug 2022 05:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oNt5W-0005Rn-1i; Tue, 16 Aug 2022 05:42:18 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:35471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oNt5S-0006FQ-0m; Tue, 16 Aug 2022 05:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1660642933; x=1692178933;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+/1fa5k++r+tIoIak6RurgGSoJd6MBP2j1ITe6NlEUw=;
 b=WrNXPgim8AWISQ+r0jRoyXDceijNE5LnORVr73FINzMLDk2zl6Op8wiW
 ebL/MIrllEA3PlretMAGReK3nEwuAeb4TrUQZTKclykLQj+/Yu8HZDOKV
 Xjs17imO0II2HnpOBwMcBjKww1BH8wx8mzOSgBZ1LHc+fbAzIwsWXlAYe
 0GEMGc2jglmNTtOuH62rkObvmybrEm2eW/vLJpdFO8lkUgMTrh9NLOAuY
 SRB93+6GbccFL0gExOHG/9/7l+uyVNDrzX09eJWmC0VEFmHayKM51avtl
 TbqKO1WTaI+BJiIUF1QHZurd3WLXPzVHaq2LB9s2MpujgKIHANJw65hKH Q==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="176556982"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2022 02:42:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 02:42:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 16 Aug 2022 02:42:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh82G5zeSkRL3GRct7885IbHxJAPG6fJaaP+F/WQrAiuZ5eHNTkLpKoVyiNwRy3Z7Tmj7hKKO8H78k8eb3io9Rz80dB8E3ePrRI/9ft/1oYCDQeE4ARGOXZnUkMkb3aM4+LCyV0Asr5wJy5X2mowyZ0CA1+//4VTEvwyGId3ZqEn0l8+/HaELZu/FK7ycJs4IT663UQdv6z9b3WV6Ql5MspAC7R04eW+4E+oOFe+HsCMsgsgqc0Q28LCmspPgG2BR+3EJ7lI1jkEB1J4g4Db5f+19vrd8Zjr9H60dStnLeqPorgcxRaPzrPjdsLn4Zg8URbe/U2XbKWDPlgvq/9V+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/1fa5k++r+tIoIak6RurgGSoJd6MBP2j1ITe6NlEUw=;
 b=dxZ+vxXQZKUSP/FkYctm7rVlrx72NCFJUYtu+v6dZ5sS38SfmnU28w8+ZyllfvvXb3mrV1iMiPSktEyWth6yRzbgLFEHyzZYDUFBTFV/ixetC4IZCHXXD7JZ6jOgGe2R9ccR8+BsmGMGaFCzaeK/ZGIBkRRCGEIEUuu32Y6EnvN1XJCAPO8EJsa/jqbab+B55PbYRnP0zrShNlf0DOGsLqWn5U9IS1zZIFxarm0aI4bTscdDR5Z65zOz8lWw9Z2ZNsjjZeuxX4UbxuWPKWFxWLKJmwFsUTjjNzjuTe7w7z+vkycmI7cQJaKxHJD+NglT7AqJqJ8UHalpO0/BHY2rBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/1fa5k++r+tIoIak6RurgGSoJd6MBP2j1ITe6NlEUw=;
 b=bJgl780XMpZZndQoUp54myx/35p0+7Sx2IRj7cqJfO4PTvDwvTQQovuPPfxhRmJSbnMmAaeUWXhKo2SdmSOGBJkieDsVzGe+5CpDRDYon5IEWrcQ7viKr/mQfs9fiiqZCTp+D0Y05RU3+g9lg5Uav7JXMRrtO7ViwJJEqOmcL+I=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 09:41:59 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 09:41:59 +0000
From: <Conor.Dooley@microchip.com>
To: <f4bug@amsat.org>, <clg@kaod.org>
CC: <bin.meng@windriver.com>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, 
 <alistair23@gmail.com>, <mail@conchuod.ie>
Subject: Re: [PATCH] hw/riscv: microchip_pfsoc: fix kernel panics due to
 missing peripherals
Thread-Topic: [PATCH] hw/riscv: microchip_pfsoc: fix kernel panics due to
 missing peripherals
Thread-Index: AQHYrxvqqD58nEZEZU25F4G2+c7Jcq2u9nSAgAALRgCAAbGxAIAAlyaA
Date: Tue, 16 Aug 2022 09:41:59 +0000
Message-ID: <1f437bd6-1fe7-a68a-c00f-a5c2178d7785@microchip.com>
References: <20220813135127.2971754-1-mail@conchuod.ie>
 <CAKmqyKMoQgpEcKSLuLrTT-bbeiwzySNSaeHt12Ou+wuHf7xzpQ@mail.gmail.com>
 <2dd018bb-3026-49a9-3938-3bff62a31179@microchip.com>
 <d87035e7-2ed5-317e-2c35-daaa5f0a0cc4@amsat.org>
In-Reply-To: <d87035e7-2ed5-317e-2c35-daaa5f0a0cc4@amsat.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de97e643-736c-4cbf-759d-08da7f6b90b1
x-ms-traffictypediagnostic: CO1PR11MB4819:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H00FVxc6Xneq6/CUU+rMv7+Duuiru+Ri1f4j8vlMhXb7KGRwEEXY6GNjabkcRA21hEBwN/ivsWIujG7h8O6ch3Pl8waDbWEmtSuz1VZJ6jK8MyXvEtpsYyJgQCukTewNCCFxtXz9fcGQnO4zjEFadN/Wbt4iU8RIwqCGEs96fXRrKY8KzqJo0H6SnOEZRgkSpY/9Lrne9fXvWnyHViiOJJXN52fLXyKVYDGs8/7xETrYgDSNS1jO5HEi67JJMbVfG1rVsbNMB54LUl/s+p2h3AlZjMx6svhAh1nnAPwl4eCUZ37dptrj92+NRk8jvX2gA7LCHMh1MSwmCeNorlLCRzAvjXqCkgMRkhEfor2HHUbdU/2BZvhlYuZkG5KdtNoeGEe1xqwIZzLacoUSSIj+7UY9q7NvcMOWr9knyqcTDytpaz/kLscpjbEHW4UtFXm2op8sK2byC5Uu5LPkBGAWlOxrvEE9SP635CfVnzV5ASdRnIxS75Ex0V3e7BWRv6rLkS2afmZyrYUEUaV9EhkMIo3I8VNFCnCtQxrvLeG57qWOYFAG4k+hiX6CMeRaO9BOlIGEVNs/1UuSQZjX6+/Sr6Al8thUV9EBttgoQFTHW2+OWg+kjK/fd71XhM5kJzqshfxRvvV5yV1GEG1xHLH7BzTRbiZfnjtTWbDnK3bhMXrgEqtrIuPFcbwMlbGo8JVOY/f6aLBWsp8afWALZZ3OGeRAjdpBxrPUuNiOzZsrBARhaCeKwggNGnFIcJl+ymP4BqvwF/8OGalF51ZQmDIjHRErnXWi9X+O7Iwam2vvEW5yz46HwXShsucXjfYLWjpwUH62WoHUvlckaw3uVK+8Xip+U7y4qMunpOX5eBMu47XTIp7cE2HwASX6pOFbUMzA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(366004)(136003)(346002)(376002)(86362001)(186003)(38070700005)(53546011)(31696002)(31686004)(122000001)(36756003)(2616005)(6512007)(83380400001)(66574015)(6506007)(91956017)(54906003)(478600001)(316002)(966005)(71200400001)(41300700001)(66446008)(8936002)(64756008)(110136005)(66946007)(8676002)(66476007)(5660300002)(26005)(2906002)(76116006)(66556008)(38100700002)(6486002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OG9DODdqYWFJRFQ2YmVtTFJsOEswODdDSUN5bEk1dG03ZXUrVU9jWlNDdTRQ?=
 =?utf-8?B?SkZtY1pmYTY0ajkxbnc5UXVSQ3VFMEJVb3AwYUdqZmh4SG56UnhPTHRRQzVM?=
 =?utf-8?B?NWhiYmlsUEx3TGVzRXdYVEtadHgwdjlpL252SG9WZHJQaTJFL3lUellpQ2p2?=
 =?utf-8?B?a1NZU2hpL1FzT3UwNWY2OUE2eWV3SFlEaStIMmdDSDlWamFsS0hjM0pDb1Bj?=
 =?utf-8?B?aSt1RGpvZC8zZDBsdDlNSGJkQnNFcmJ3Z1d6ZERHVjZqblEzZjBBRDJ4S0tW?=
 =?utf-8?B?ajR2RmZlVTZIZzZrQnJwN2UwVmNWUzdsV28wNkZuN0RCdXFvMkRwS2VETERl?=
 =?utf-8?B?cHpPamFnc0xCdlA3ZXU5emJON0FzYkMyNjZqUXlFVDd5K08yQksrQ1g3QU5u?=
 =?utf-8?B?RzJDODE3R3Y1Mkt1bFhyZGtVdVNrZjVJUjc2U3R5akx6UEM2MnIram5oRTVN?=
 =?utf-8?B?SExtQU1zMEtiQ1dNeHJzRWpRektVUEltQjRJU3QzZ0lwZUNTTWpYSlZoU2d4?=
 =?utf-8?B?NmlUZEFlYytYd053YW5NZzJ5Nll5cDBmdWRGaTR4bDBtdCsyemNTQmhSTTVQ?=
 =?utf-8?B?UkpUaGxTRHUydUdaUlZLc0pYd3J1RW9HemNnYWI5TW9YZmN5LzJUNUUvYml2?=
 =?utf-8?B?aks4SzdhUDV2Mk9UaWJrNVVBeno3M1VJUjdLek9RK0U2OXFYc3U5azY3ZzNn?=
 =?utf-8?B?QnZ6Q1ZqWGVLT1FlU3lETzdWNjloZld2Zm45OHdPWGUzU1cxWlJLdFJsZWVT?=
 =?utf-8?B?UkpxZGU2ZmRWVlFhZXUzWGJKZVJTNVNESHgySFUwSS9iQzNqMmVYL1AyNGdL?=
 =?utf-8?B?RWg5c2krYm1TbFNmczVTWUFyd0lleTREUW1HRS9Ca0tEc2Z4a1VJYmR4RzlB?=
 =?utf-8?B?WDdmdjhiV0hTWUhYVlZ3ZURPeTFCOGV4MFJ3Q1QxRVQ5NWlHV3NIbGhnY2Y4?=
 =?utf-8?B?eEg0KzB2MzBiSkNiY3d5L1pOUmEwdVN4bUpTS1g0VXRoT0ZJMkxDYlFFTzVs?=
 =?utf-8?B?aGV1QU9Ec3Byb0R4elp6SzJsRUdvRElwSTM4MUxaTDhVaDMwTVdUQkRFdnpj?=
 =?utf-8?B?QUF6eDJuVnRTRmR6RWFManlkLzRocDNROGE5Y0RlSXNybnU4dmxnUlVhTDN1?=
 =?utf-8?B?NzZUTHNSN0l6SUNidFA4QXZ5bEp0bFRQSjBhbkhRWXU5TXVRVnl6UzlmaXVH?=
 =?utf-8?B?a2JCeld6eFRVZnR4ODBHY0x6bWh2NGwzS1Q3enkyMmMzVGV5RkgzbmdGcHRM?=
 =?utf-8?B?bjd2QlFXNUV6VzI1cGovcWswblM5S2ZtN3VIMDBQRnliSUdtNDRlZTM3b1do?=
 =?utf-8?B?VE9aOUNLamVvcmNXaDJxVnFVZFpuTkpEUkRVeHVhTHhkcXhwbzUyek9TU0ZY?=
 =?utf-8?B?c3ovbVJhMUkxdklDMVFZWHI0dXdzWm5EdzZpTGRyTkJ4ZW5uNjZZeWZkQjRX?=
 =?utf-8?B?YkpCeWttSDE0SmVObmZoTjBKWXpOeVMxVFN6T0NSRDVPbk1OeHVtWURzekZ4?=
 =?utf-8?B?VXFzc20waEF3RXMwNmpXMCt0dTdOdWphQnIwWXkzKzd4cnRRQ3JyV09jUmU2?=
 =?utf-8?B?L1F0cXVNR0VtWTFObWxuK2NJaHI0bGF1R2l6ZXJwa2oweFVmZjk4elh0YTIr?=
 =?utf-8?B?Ui9QbGhkbVJJYWZxMXV5TDZQUmlhMDFoTE9JcjIreFpjQ2hQUy9nLzRvZFFD?=
 =?utf-8?B?L2UyRm9lUWUwcjk4cGlkS0l6VyswL2hrMGUyaUdtV0JCbGFPWWR1cm5vam9Q?=
 =?utf-8?B?T2QzeVdPSnpGeGNrZjVGRXc3UGRRTFE4OGNNUEdKS0J1ZUNYOUlwY3NLaEds?=
 =?utf-8?B?ZHNxZld0ekJUOTRielNoVXRUZXJHZzMxaTZmVU5tTmFtNE95dDZndFh5dFNn?=
 =?utf-8?B?OWZWSnFvSDdLQjJHc0lUUXh1d3hGL0JGdjNBaFpkdmwxNGcxNGhQbk5aQndX?=
 =?utf-8?B?WVEwSW0wTWxyMGk3eHhRK1JnWitFZGlQUDBaamFHWjkxWXJSRHR0K09FMTVa?=
 =?utf-8?B?QnNXa2VFa0tRSFdXL3MrK2F0RmxrQUhMQlFTNDRJOTZVWmpiaXNzdTdvSDM2?=
 =?utf-8?B?Y2w0Nllrejg1VHhHaDZ0NDJqcTF5dXJvRzhDRlQ1RW9xRVRsOGJ3TkRKeGY0?=
 =?utf-8?Q?wFMVbQeGrhtT+RMuJsWGaSkbU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5E1601CF5B17A4288AFD75074601F0E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de97e643-736c-4cbf-759d-08da7f6b90b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 09:41:59.1967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eAwv9RatbyXtGOdyWjK6bIWURn3c1Lc6cjNFQjAij0r/NjN3Hnh51G8mp93/n9piRQDdRhaR8INWgnIZL6MpqhrlwYHCIPAtGx5KkDx8MBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
Received-SPF: pass client-ip=68.232.153.233;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 16 Aug 2022 09:42:18 -0000

T24gMTYvMDgvMjAyMiAwMTo0MCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFtZ
b3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gZjRidWdAYW1zYXQub3JnLiBMZWFybiB3aHkg
dGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50
aWZpY2F0aW9uIF0NCj4gDQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiAN
Cj4gSGkgQ29ub3IsDQo+IA0KPiBPbiAxNS84LzIyIDAwOjQ4LCBDb25vci5Eb29sZXlAbWljcm9j
aGlwLmNvbSB3cm90ZToNCj4+IE9uIDE0LzA4LzIwMjIgMjM6MDgsIEFsaXN0YWlyIEZyYW5jaXMg
d3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBP
biBTYXQsIEF1ZyAxMywgMjAyMiBhdCAxMTo1MSBQTSBDb25vciBEb29sZXkgPG1haWxAY29uY2h1
b2QuaWU+IHdyb3RlOg0KPj4+PiBRRU1VIHN1cHBvcnQgZm9yIFBvbGFyRmlyZSBTb0Mgc2VlbXMg
dG8gYmUgZmFpcmx5IG91dCBvZiBkYXRlIGF0IHRoaXMNCj4+Pj4gcG9pbnQuIFJ1bm5pbmcgd2l0
aCBhIHJlY2VudCBIU1MsIFUtQm9vdCBldGMgZG9lc24ndCB3b3JrLCBwYXJ0bHkgZHVlDQo+Pj4+
IHRvIHRoZSB1bmltcGxlbWVudGVkIGNhY2hlIGNvbnRyb2xsZXIgdGhhdCB0aGUgSFNTIHRyaWVz
IHRvIHJlYWQgZnJvbQ0KPj4+PiAoaXQgbmVlZHMgdG8ga25vdyB0aGUgd2F5cyBjb25maWd1cmF0
aW9uIG5vdykgYW5kIHRoZSByZXN0IHNlZW1zIHRvIGJlDQo+Pj4+IGRvd24gdG8gNjQgYml0IGFk
ZHJlc3MgRE1BIHRvIHRoZSBzZCBjYXJkIChub3QgMTAwJSBvbiB0aGF0IHlldCkuDQo+Pj4+IFRo
ZXJlJ3Mgc29tZSBwYXRjaGVzIGZsb2F0aW5nIGFyb3VuZCBpbnRlcm5hbGx5IHRoYXQgc3VwcG9z
ZWRseSBmaXhlZA0KPj4+PiB0aGluZ3MgZm9yIFFFTVUgdjYuc29tZXRoaW5nIGJ1dCBJIGNvdWxk
IG5vdCByZXBsaWNhdGUgJiB0aGV5J3JlIGZhaXJseQ0KPj4+PiBjb25mbGljdHkgYXQgdGhpcyBw
b2ludC4gUGxhbiBpcyB0byBjbGVhbiB0aGVtIHVwLCBidXQgbm8gcG9pbnQgc2l0dGluZw0KPj4+
PiBvbiB0aGlzIHBhdGNoIHVudGlsIHRoZW4gYXMgSSBoYXZlIG5vIEVUQSBmb3IgdGhhdCBhdCB0
aGlzIHBvaW50Lg0KPj4+DQo+Pj4gQXdlc29tZSEgSXQgaXMgZ3JlYXQgdG8gc2VlIE1pY3JvY2hp
cCBzdXBwb3J0aW5nIG9wZW4gc291cmNlIHByb2plY3RzDQo+Pg0KPj4gQmV0dGVyIGxhdGUgdGhh
biBuZXZlciBlaGguLg0KPj4gQXMgSSBzYWlkLCBubyBFVEEgeWV0IGFzIEkgZG9uJ3Qga25vdyBq
dXN0IGhvdyBmYXIgb2ZmIHRoZSBzZCBjYXJkIHN0dWZmDQo+PiBpcywgYnV0IGl0J3MgaW4gdGhl
IHRvZG8gcGlsZS4gSW4gdGhlIG1lYW50aW1lLCBJJ2xsIGtlZXAgYW4gZXllIG91dCBoZXJlDQo+
PiB3aGljaCBJIGFtIH5jZXJ0YWluIHdlIGhhdmVuJ3QgYmVlbiBkb2luZyBzbyBmYXIuIEkndmUg
YWRkZWQgUUVNVSBzdHVmZg0KPj4gdG8gbXkgYnVpbGQvdGVzdCBzY3JpcHRzIG5vdyB0aGF0IEkn
dmUgZ290IHRoZSBkaXJlY3Qga2VybmVsIGJvb3Qgd29ya2luZw0KPj4gZm9yIG1lIHNvIGhvcGVm
dWxseSBvbmNlIHRoaW5ncyBnZXQgZml4ZWQsIHRoZXknbGwgc3RheSB0aGF0IHdheS4NCj4gDQo+
IFBsZWFzZSBDYyBtZSBhbmQgQ8OpZHJpYyBpbiB5b3VyIGZ1dHVyZSBwb3N0cyByZWdhcmRpbmcg
U0QgY2FyZCwgb3Igb3Blbg0KPiBhIEdpdExhYiBpc3N1ZSBkZXNjcmliaW5nIHRoZSBwcm9ibGVt
Lg0KDQpXaWxsZG8uIE5lZWQgdG8gZG8gc29tZSBtb3JlIGRpZ2dpbmcgZmlyc3QgOikNCg0KVGhh
bmtzLg0KDQoNCg==

