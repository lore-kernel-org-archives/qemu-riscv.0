Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNMPY-00089F-PE
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 18:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oNMPW-00088M-Ei; Sun, 14 Aug 2022 18:48:46 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:10073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oNMPS-0004Qk-Rl; Sun, 14 Aug 2022 18:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1660517324; x=1692053324;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FTBobfUZjdekruQva+3tpE+QKaP0jkP0QdvAnH7d0n8=;
 b=PLz0M58EhnAJ0t5pEybwFZpSLDXCee/v4wb1xQSUYUVah9O1WN+vBq9G
 GGQupl/TsTlz+kFyrT3GULgQHN/BLqyhGC9qArtBFSmabVDX6AhLIi8MR
 DwcPv/asml0FgMqOWgSGh0y5/QoX947GIGzu5RMKcwjQ0J+SFefJmV8Dg
 xnm0O+PSM8tj5PcpSV50u05i5GgSTQQ7imj8QBLJyf934hzc9pjV8yg0d
 DSOuXrN9ccw1Y0COtUKszqRwt/LJHU4o38fmyulS1p1HUAb/djiUdlx6b
 7LITvUuNt71DCBxZGC+DFbWlNqBFVVw2gJUjvokdXr4wb170fQ4zJOO6u A==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="169230649"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Aug 2022 15:48:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 14 Aug 2022 15:48:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 14 Aug 2022 15:48:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8EE8wIh6dQ4QGGOH+yb5qf1zL9IOYvUbtNrKMkz+mXtgpUQ7lzTUSFmFFr82IAqZD6ewbq+i0yeNYoAjZfcFIzzWbe3LbI+tD/HB/GUX6PzSSmEqwqNp17H0kVEH2t/7wRfo8+m6IZ/qmu2F9mp/kB1A7bwLAjzutseOMdS2xDlpTKXZClX8iFbXLHDVBl9v6cjGgABW60UwkUr3VnhHsPWOYJaKnTq00EmOHudJGxmfiu7mL4QjdaoQc6Dmi+ZRhyxWWlyEOltZDrm3JEwaBTPY4R7LRjQiFglNipUVB3vtLuYWxho4g4vzN63pAfSUTdKtC6Xnz54I9gXQq823Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTBobfUZjdekruQva+3tpE+QKaP0jkP0QdvAnH7d0n8=;
 b=IOZSrlMbhSNs8/sm53w6XSd5Vd6TiHh+nx7xxavp1S6WYxkMsuHXhr7tGqY981Yyq2Y6tcDIqYc0yxFYM588C6q/eQ3hwTbjzmMIBFG2VhhDYRE3DkS+c9kshVQxJ2KbyQvGcnGUnc+5H4jQj3RkfsJ0hnbLkM8bKlokJrteqI1NHLnF+/X/X7+3tq/HANVXUh0iXFcTzBwAeo5XslJC0ypDsILdBFSK0Wgqkr/a1r/Irr57/WrFV4/xsy9SM6Wdoc/1uRmaa3E+bOLzQqLLDf66u/BjpbdyrQY7fg0HNztm6hbSovyMGJwIepdlV47vhT9DuM4C69vyiZDRqsr6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTBobfUZjdekruQva+3tpE+QKaP0jkP0QdvAnH7d0n8=;
 b=p70yTeoo0Ppk4tA9p5lIK0/qvgI/aiqI7HvxACaQMYRtzNmlb/N3Y23IUmFnbeOvMgCtzQqdZdu44deVBrP6bTBT/5kYf2eyVR22abhOvUJVDTuFQIIlfsz4QT2EDgf9OINNrryrsWY4E2Zqt3UpMamXYfjhjIzVIkYSVuaFHY8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN7PR11MB2801.namprd11.prod.outlook.com (2603:10b6:406:b4::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Sun, 14 Aug
 2022 22:48:31 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Sun, 14 Aug 2022
 22:48:31 +0000
From: <Conor.Dooley@microchip.com>
To: <alistair23@gmail.com>, <mail@conchuod.ie>
CC: <bin.meng@windriver.com>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/riscv: microchip_pfsoc: fix kernel panics due to
 missing peripherals
Thread-Topic: [PATCH] hw/riscv: microchip_pfsoc: fix kernel panics due to
 missing peripherals
Thread-Index: AQHYrxvqqD58nEZEZU25F4G2+c7Jcq2u9nSAgAALRgA=
Date: Sun, 14 Aug 2022 22:48:31 +0000
Message-ID: <2dd018bb-3026-49a9-3938-3bff62a31179@microchip.com>
References: <20220813135127.2971754-1-mail@conchuod.ie>
 <CAKmqyKMoQgpEcKSLuLrTT-bbeiwzySNSaeHt12Ou+wuHf7xzpQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMoQgpEcKSLuLrTT-bbeiwzySNSaeHt12Ou+wuHf7xzpQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f78608c4-fcc0-4523-a884-08da7e471c89
x-ms-traffictypediagnostic: BN7PR11MB2801:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O0Gb0GGeon0meWQKlOnvguloN8h9CFSPDvOmxvSxSurNjfco6cZCvCRUJCD9CFy9k+NgI//ENgGhmQ4Ys2ekIM/qQ/MgE6givbV9Rv2stLmiehK0eZly8RboQWN44NFRdv/H6BTp+b+wEZ7YqACQ25/A5pOiWsWEUjk3++zgQZ9N/WYWNpnvrlF+wh7SOjlCxHOTyXQhzigB0/tuDMyyfFcRlJG3dWsToYGeO0nC3T6to43RZ74EI8ucnqZm+CsI+nXih3CHh1fhTGvldDoP7IwUVc+9k8ByeKfb9W83C9Jcmh5Iy8Z5f7E1HCaKr7gsKV9zjJcDDqvLwYa2CqPZio/7ICFXcJwDX4A74r3IinUIyzeEfOZhdu2huA4i/CqMQLrEyS9BA05XtBzvBwkpa/iBofiKNEZSjYS65UofKy/ztGPbM4G1b4v2nNZyWrt5Nck3U2nGloVAOG7npRLoS796ExDvBFzJkvj1A9etCrghYLxdVSAtzhHKvUBR7415B8HzZi31DvSVxNtp0sgsCwpuUIxFGh2Q2mOwcd5n4nCTJwUQq5gEcFtW+F+kyzXL8StZWkyRc1p9GtYu3FsL0De5S+6L5/5yMEGKFIYjibdbpC7POk60UVLLLJ1dXwc5Nq6bPTaJByKPUBVr0IawMwsqREP3tmSR/x64T4+8HSZrUhBF+InxLl6dndG2uFFVB5XlX7PWizMLxlY5dkJAlhpaB3OSRD41/x8n6iCazprWJdVvcp54H3eCzg2234qLGAVUJg9EUGAG9B6irKcS9rCK72bjghwvxZOokKM+9B+D1h5DJKzNFz6DCT3AEFrZZkKCp3nervZGG5UXd6K30xR7CMQ+3bmXy2C1E+Cns2KZHLSysGWEPx9th0KFSAfL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(366004)(39850400004)(136003)(376002)(5660300002)(8936002)(31696002)(2906002)(26005)(86362001)(38070700005)(66476007)(71200400001)(53546011)(186003)(122000001)(41300700001)(2616005)(6506007)(6512007)(66946007)(83380400001)(478600001)(38100700002)(4326008)(8676002)(66556008)(316002)(64756008)(76116006)(54906003)(110136005)(6486002)(91956017)(66446008)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qk9JNFZIR2ZQTXcxaGxPOWNnY2s1WVo5SmF4SXhLRENJSDc4T1pJTE5qNGpP?=
 =?utf-8?B?UEQxNlRIMWlqQkRDYlB5eEJMY3FOMi8wMi83WE1pN1Z2blZwN3ZFNDFxVzdk?=
 =?utf-8?B?VGVrYUIrZU0yZnpOYzhEMzdzZ2czcGNxaHBnNHRScks1MG4yRFFhd21BOUZT?=
 =?utf-8?B?bGNnaXg3c3NESm15UGVHMzlIek51OE91N0tjUGoyMmc2Q1V0cVRXbkJKd3Iw?=
 =?utf-8?B?L01XT2lrLzB0WXE4eEUwNzFOZGVlVFBHeXgrb0tYZEZ4Q0o2M08xMHZOUDRo?=
 =?utf-8?B?NlQ0VWZoN3dzZ21YRmtoRWNoaWRlR2NOZkQzL2ZmSG92VkZxT08rUDF5TkRw?=
 =?utf-8?B?UGU2bWpVbi8xejJ2ZWY4c00vU1hsZ25od2lIRGtIWHc5NUlhQ1gzV0Z3UTVQ?=
 =?utf-8?B?MlBDaUNGT2tiMU1XV1lteXg2K2U3NDh0WldJOHhHYzRSU2RyanlqMVhNZ1lp?=
 =?utf-8?B?UEV1NTRNNHd2NVdwYWFaUDRMQ2ttWXVsbWdrM2ZTaXRnVFB0VGx0VG9vcG4w?=
 =?utf-8?B?bkE4TG9GYlRLSEZNNFR3SmZudmt5bWRGTHJzWktWUERWS3k2YUtXZVgxSVQy?=
 =?utf-8?B?TkhGWDZDLzREbVJCVlgvR2xYdHlnM2M4R002TzdLUkgyeDA2cXh1WU95YmYr?=
 =?utf-8?B?WmJXcCt5SWxEeXlJY1RPTko2azFwRUZKcWRyNHZ1SVY5L0k5NitETGtubklN?=
 =?utf-8?B?L3N5elIrelZSbSs1RDdGb294aUlMRjh0WmRSTkRzMlRkbWp1Vkw0UW14cHpW?=
 =?utf-8?B?RWFhVThPdGlZNmFVNzZWVzFDQS9SbkZmaUJxemw4Q0EySC9Jdm91WXN3OUNL?=
 =?utf-8?B?STRoVzBMSzFrc1p5M3ZnS3d4WGluU1BWcGNSeTlOSWRmbjk0TU9xZlRxRGtp?=
 =?utf-8?B?UHFIRUJLK2NPeU1ncEh4eHBpN0d0UCtCT0xxL2dVbUNTR1hYQmVZQ2lJeHZ4?=
 =?utf-8?B?a0NQRmQ1N1NPdEVvcmd6MExwQzlucSs3OUoxWjVaV2FWODE0ZTRhNm9mbHI0?=
 =?utf-8?B?QWhVN2RMQzkxbkhpYkUzdkJ4Zm9JN25iWUNwNUo0bkwrSVRGQU54eXM0cjhp?=
 =?utf-8?B?bkFsUjVMakpvK3dGdnpQaDJzOEVkNS83WW5QTVBzckpHRnlFb3V1T2xTTVhP?=
 =?utf-8?B?THRlaEZRKzZITWlxdlNTSlhYVG9pNUZBTTUwRHZTMWRUcG44eDNFRGxDUlZR?=
 =?utf-8?B?amtNaDZSbk9kVjdzdmtJTEZHYWlXUzVHWmEzcHl3bVJjSGJtK01xWS9kYmNW?=
 =?utf-8?B?OXJPTjZMR2xjSXMxZlQ0L242K3JHSDdGa043anBhTlpBRnh0aEZsT3hhRTlV?=
 =?utf-8?B?aFV1akZOR05ucFJsZzdUOUR0RjhnWjFRQ3BEZDU0NGswT2hPdzBOYm9ZNUdx?=
 =?utf-8?B?a2dDK1lUSVIyVVBOVXpUKzhhQVBaQnJrZCtDcWNuZ3VmWll2TEh2b3RpcGRv?=
 =?utf-8?B?ZjREOWdlMmdoTHNBdkpiT3o0QllQTHFTY1QrMUdVZnNlN3Rzb1k3RzFMOGFN?=
 =?utf-8?B?SmUzQmF1aGxDalZaTnFsOUc2Yks0cVJBQjV3OFZMRElsOGhITlhlcTJyMG9I?=
 =?utf-8?B?c3Z6MWxSSW9PYTdDdm96eW8xN25WWHpKeFBPeUxPMXpjYVVPRFZ6ZGVhVVQx?=
 =?utf-8?B?Z1N2OVJBa3JFbzNRNjAzSG1NdGE3UlI3TVNGekVDMlFYdHJCSC9yRFdRUERz?=
 =?utf-8?B?ejlqYTRXKzdxRm9DbVpFNldESWJzaFB1M3ljRzgzTkEzWGE0V1dlbVlwUjlx?=
 =?utf-8?B?aEdFaiszdjJ4OTBYK0g5bkVjMkh5U2xGVFZMcWRhYjdEcTJzN2NOR1pkb1Vy?=
 =?utf-8?B?TDRqcXhrVHAvVkdiZktpNTcrQ0lkTzFLRlBrMHF4OXJqVUs0SEFEcUpISmRN?=
 =?utf-8?B?T2NnNUQ3KzJ4NXZzd0ZlaEFzajUwelk3c2NSWjNqanBDcXRmME1SNThwWGFj?=
 =?utf-8?B?M1BJWjZHM0wwUDVzaHFHN3ZsQmFKQ1c5RFVqNVpkNG1tZVlzRER1a1dzY2pN?=
 =?utf-8?B?TXdHL3N0Z2xFcmpEZVRvT1g3T0pPSmI5aUhBUkdDK1hhK0hLZ0R4NjBrMWc0?=
 =?utf-8?B?Y1pqa21VY1p5aGpQVVZsWDJ1R2s2V1NvdURDN1c3WkdOdlJBVmNmZEg1Zno2?=
 =?utf-8?Q?Tw0EMvSjtlmQP7Fnwtf+krJ5R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8010A973C2849148A5FA00E59DA755D1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78608c4-fcc0-4523-a884-08da7e471c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2022 22:48:31.2751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8dUiJLBT9wI1oGvNviMZJfKuWELPQEBH4d6g4VQIpQbYxG5ssb27jOjGNnKxHhQsZyzBloybU88FJBigvyjRGVxaa4zBi+jjD4npf5CPDZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2801
Received-SPF: pass client-ip=68.232.154.123;
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
X-List-Received-Date: Sun, 14 Aug 2022 22:48:46 -0000

T24gMTQvMDgvMjAyMiAyMzowOCwgQWxpc3RhaXIgRnJhbmNpcyB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBTYXQsIEF1ZyAxMywgMjAyMiBhdCAx
MTo1MSBQTSBDb25vciBEb29sZXkgPG1haWxAY29uY2h1b2QuaWU+IHdyb3RlOg0KPj4gUUVNVSBz
dXBwb3J0IGZvciBQb2xhckZpcmUgU29DIHNlZW1zIHRvIGJlIGZhaXJseSBvdXQgb2YgZGF0ZSBh
dCB0aGlzDQo+PiBwb2ludC4gUnVubmluZyB3aXRoIGEgcmVjZW50IEhTUywgVS1Cb290IGV0YyBk
b2Vzbid0IHdvcmssIHBhcnRseSBkdWUNCj4+IHRvIHRoZSB1bmltcGxlbWVudGVkIGNhY2hlIGNv
bnRyb2xsZXIgdGhhdCB0aGUgSFNTIHRyaWVzIHRvIHJlYWQgZnJvbQ0KPj4gKGl0IG5lZWRzIHRv
IGtub3cgdGhlIHdheXMgY29uZmlndXJhdGlvbiBub3cpIGFuZCB0aGUgcmVzdCBzZWVtcyB0byBi
ZQ0KPj4gZG93biB0byA2NCBiaXQgYWRkcmVzcyBETUEgdG8gdGhlIHNkIGNhcmQgKG5vdCAxMDAl
IG9uIHRoYXQgeWV0KS4NCj4+IFRoZXJlJ3Mgc29tZSBwYXRjaGVzIGZsb2F0aW5nIGFyb3VuZCBp
bnRlcm5hbGx5IHRoYXQgc3VwcG9zZWRseSBmaXhlZA0KPj4gdGhpbmdzIGZvciBRRU1VIHY2LnNv
bWV0aGluZyBidXQgSSBjb3VsZCBub3QgcmVwbGljYXRlICYgdGhleSdyZSBmYWlybHkNCj4+IGNv
bmZsaWN0eSBhdCB0aGlzIHBvaW50LiBQbGFuIGlzIHRvIGNsZWFuIHRoZW0gdXAsIGJ1dCBubyBw
b2ludCBzaXR0aW5nDQo+PiBvbiB0aGlzIHBhdGNoIHVudGlsIHRoZW4gYXMgSSBoYXZlIG5vIEVU
QSBmb3IgdGhhdCBhdCB0aGlzIHBvaW50Lg0KPiANCj4gQXdlc29tZSEgSXQgaXMgZ3JlYXQgdG8g
c2VlIE1pY3JvY2hpcCBzdXBwb3J0aW5nIG9wZW4gc291cmNlIHByb2plY3RzDQoNCkJldHRlciBs
YXRlIHRoYW4gbmV2ZXIgZWhoLi4NCkFzIEkgc2FpZCwgbm8gRVRBIHlldCBhcyBJIGRvbid0IGtu
b3cganVzdCBob3cgZmFyIG9mZiB0aGUgc2QgY2FyZCBzdHVmZg0KaXMsIGJ1dCBpdCdzIGluIHRo
ZSB0b2RvIHBpbGUuIEluIHRoZSBtZWFudGltZSwgSSdsbCBrZWVwIGFuIGV5ZSBvdXQgaGVyZQ0K
d2hpY2ggSSBhbSB+Y2VydGFpbiB3ZSBoYXZlbid0IGJlZW4gZG9pbmcgc28gZmFyLiBJJ3ZlIGFk
ZGVkIFFFTVUgc3R1ZmYNCnRvIG15IGJ1aWxkL3Rlc3Qgc2NyaXB0cyBub3cgdGhhdCBJJ3ZlIGdv
dCB0aGUgZGlyZWN0IGtlcm5lbCBib290IHdvcmtpbmcNCmZvciBtZSBzbyBob3BlZnVsbHkgb25j
ZSB0aGluZ3MgZ2V0IGZpeGVkLCB0aGV5J2xsIHN0YXkgdGhhdCB3YXkuDQoNClRoYW5rcywNCkNv
bm9yLg0K

