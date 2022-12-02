Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0tZu-0005OU-Ek
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 19:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3286bccba=wilfred.mallawa@wdc.com>)
 id 1p0tZn-0005Lj-L2; Thu, 01 Dec 2022 19:06:47 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3286bccba=wilfred.mallawa@wdc.com>)
 id 1p0tZl-0001i7-SS; Thu, 01 Dec 2022 19:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669939605; x=1701475605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UbgtiucymCIBXwyLEOBvittKwKFiO/+cuHpgyg4L7uk=;
 b=rOpO9KFWnOThVkjd23tjbHQe5TeHp84ga+4kPCkdVRRWrKc7XzOWVH/u
 Ds3MyuuzwoIyEGLOprof+YNufUbdFINKO8PUfMLvQnh8zkBHv25Zdk6hb
 HoEcZXYn51Krvf+Q7xVXnZZwsjfZnW192hjVq3zM0xiIulFQmNndp6WwZ
 ybXRJZwtAis0ePcY3Z8Z6CNkuR/B+6xcSTurfo3X2dyodETdSijax/xoi
 HfOSgqBm6E4qQw7P7FTwXQS5ci3zhN7Ko2YZx/5u3nFa3jGC+wQdleSRV
 vntgjVqP+jZ61jqBoPLC44ZP9xM/2IT4xVEFHHehgsPmj7wIf4T6ypemO w==;
X-IronPort-AV: E=Sophos;i="5.96,210,1665417600"; d="scan'208";a="322062810"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2022 08:06:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfXuNIHImIuUNpMh6h3EAUBcFpUL854YkAcHLcJBksRbp1nLRVy2pSeffUAcUCEtJ0UgPXmeP7HU0APwr7xqnlvL27q+FyMdAp6HDXX5KQ+JCpl4elJjPj8rrxrJ2YkOd17HHpP0bB0a7vVZA0cPn+T0ZOMaul5SVyna+nJvrRzeM+rOW8iBj0HRJlbs075Vk+4AD68xKiDXNPSJikPnUcdOu7b4bh/69sXCgBVQ65hrMJUO+L3hN3rWbFgpRaElq+JZs5PayfvLufCBNI0irl3Hz1kKcXJSettj9Ek6QqHcbzSCqEdcrpbw4WsoQbLQAip2mRoKJpoeQD6E8FKNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbgtiucymCIBXwyLEOBvittKwKFiO/+cuHpgyg4L7uk=;
 b=Af7Y65dlaL4h0jrRVCFAtQ3N1XI0437KkCbO7mOrS/y6xkd+ZBp1qqIaeloTTHPeskfa/KrIg1LGDryDS93fqaeTLztvFHN0vK6m+lC+GLujAPGAFxs86sdkVtS5JODT8H8yL+IszP9Z3BcRO0W5vHBNzPVQzCVtz1IX9frEbRas/HcWnuQxgocwMHM1IksF1wqkkTcjtvKwumrwCL+FIsUULFvY23arPK0GEg48tFAAhxLrn1ikI6iDcw+egg/IpLQ7noZ37akt5mYSDHtP9mUJb4tY8v89BFOODvVedlFh7ToPwwg+mAko+MC698lTKrqeriFa7WEPy/OC4x2dWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbgtiucymCIBXwyLEOBvittKwKFiO/+cuHpgyg4L7uk=;
 b=zyJQmYba/ukPmV12fOPCwphVrwywbW5TPTA4W+k3ZaYRje5VJZBsSeei0O+jZIxp5zeK0LrmzF9LnGTAiSq1IC3dBWxibKw88RtRRF3C28qSaM1NZeuAygsTJEI9EhoEc7SX3UHfOU+vPttSR7S4YiKvOvKtefgpBw0YxpMl5EI=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by BN7PR04MB5409.namprd04.prod.outlook.com (2603:10b6:408:35::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 00:06:40 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 00:06:39 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng@tinylab.org" <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "bin.meng@windriver.com" <bin.meng@windriver.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 11/15] hw/riscv: sifive_u: Avoid using magic number for
 "riscv, ndev"
Thread-Topic: [PATCH 11/15] hw/riscv: sifive_u: Avoid using magic number for
 "riscv, ndev"
Thread-Index: AQHZBY7CmSvip3+hWkKlGwJbl0XDcq5ZuMcA
Date: Fri, 2 Dec 2022 00:06:39 +0000
Message-ID: <4bb132f673ef4c439aba2fd07490727a8c4e339b.camel@wdc.com>
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-11-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-11-bmeng@tinylab.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|BN7PR04MB5409:EE_
x-ms-office365-filtering-correlation-id: 3c5f9463-b9d7-4d2e-0e63-08dad3f91634
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l5bB8PTKLMBUAcFBp6rIdTLyNiJI5aj5zQlpXk09I3RsKvNINEw2BS4ULxxZ2LIO6jd272l5yPBSNYkGNv0N5ht2pDn+eboWoR5OVEFaXyxiudXcS4rbiTg292w5a6h3Q5ONDVgXr69ZOfzvHfm/3vfWI4a+EepDV1z0lg62NaFzMqYa2jHCxgOgNy/zdStozf4YQSrXVH/s2VgwU48oahiS0kitTO+Oxj3Bj7RSqJQ2e3tUX6A8gGuh5+EnK9tb5NhpEJeYyakiujG6tZOPqa6OUntS/4JQ+RvpkSKOJPYAUelQ4D/1q/r3y1D5RFYTM3S/j5QMkPbgM9cnZMg79WTKHs6DoPzl/X/NmlW86yVLBciZN0ZBNNXvytpDlRGewBMrXCUudpXOZ6v/k6pcpY1/bvKGtO0/ldn16J58eRrPY0J2EqRDsSU4x0DYUahJpfCjePl9HakkYe8nO+7gZewfPyivUMNk5X4SQSLREzkNRFeGFv5YNgjlangJDhyy94Mm6tjSw3RIArjv7Hj8WgYOAl+7Qmbxlz+oRrPXk1i+IHRXowpsWKu4oG1M3WMeJ8UPsDjPMfqgXpm64WdPb/U2aOJ+o9gF4uRs73o3KXjVrWsWN1yhLd5/faO6aQw6lCxxw7bb2DZi70Wutp4VsfBiwkKpEoJMrj7/iorMOpLLHnTnscpQDMymIdeA+4Fti1LY8bJJliF2rq35vM8Zcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199015)(64756008)(44832011)(5660300002)(76116006)(8676002)(110136005)(54906003)(66946007)(66556008)(66446008)(41300700001)(66476007)(4326008)(316002)(91956017)(71200400001)(6486002)(122000001)(36756003)(478600001)(2616005)(82960400001)(86362001)(6512007)(6506007)(38070700005)(26005)(186003)(8936002)(2906002)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Slg3YWQ1RldBS3p6NDZUL1l1TWtLNnFFbjBKMEdrVXQrWUpwbVhtWUxWbXlJ?=
 =?utf-8?B?Tmt6aEhON2tPM2wwS0E4RTFRVkpWZGZNQlBTMGV3VnNwU3JrUTl1Q25Rdk12?=
 =?utf-8?B?MGRRRjE5M1pPVWlEM2Q5ejlKMzFzWTlSMGpwMDNZc0VJUmpjQkd5V3U3NnU3?=
 =?utf-8?B?NjRIQ2hJRUJmVytnMEFjTlZNZGNDU2RxVnlYdlpzU3d5QW0wYU9YU3FDRnRU?=
 =?utf-8?B?U1IvL3VYVWtKWEtMcXpnVVZXbm5DTEFxL21kRk54RG9veFB2Q3dMQjc4dmlh?=
 =?utf-8?B?b2JWSlFvWUtnNXgzZkp5TDVuOEN5WGxIWm5YV1haWjE4WDUwVnowWlUwNnE4?=
 =?utf-8?B?REViZjVPSGZwVWZ5TlZYRDgyRWFHckoxbzk4N0VZRUMxN2dnYy9lVEkxVita?=
 =?utf-8?B?MnBzcHFwcUs5aUswYmg5eVY1Sml0dGlVUDJPYWJwVWpXaVM4cGpTT01uUHFD?=
 =?utf-8?B?VmlKYXhjci9JVG9CdmpDcm9kaGQ5eUI5Z1hGcHhaaHdZdHp5Q1Z5Sk9scytX?=
 =?utf-8?B?elhNcjRzbEpjSzZRcjQ1ekYyQ3QwVm5XOGs3YzFDVXA4ZlRmbmwxVkh3T1dw?=
 =?utf-8?B?Y0RaMnNUSWJJU2YrUjJNRW8vZmNjRVhiSXR1UC9ENTlZMHllWkJUSWtaQnpy?=
 =?utf-8?B?ckt2M1RIQ1YwcEdOdENKNEloMjRsTEJqZUhDWjZuSjNRcUxKUHp5T2gzbnpD?=
 =?utf-8?B?VFJCcnNKc1JkakovVnlLT1lQTVV1UEZVeFhUYy9BWnd2d2t0UkJsdWNsNVMr?=
 =?utf-8?B?OHZKNkhLalpGMzhjSTVlVTRlbXdqQVlSeHN6RDdEQ0JiQ3JMYzFWTDliSGlh?=
 =?utf-8?B?R3A3MTB3ZGtGZlQ2T2ttb2hJRk9mTkUrUm40cmsrL3k4N3lENW14bFM3VlVn?=
 =?utf-8?B?RTYxRzM2WXU2TXgyV2FRV0UyeTRCSmJBdndkd2hIbW9nTVlUNHdCdlcyN2ZL?=
 =?utf-8?B?NitsNHBaMzBLTWd0ZVF1UTdoR1ZzWTFCNG1sUEhNbU1LQ2tlYnZRZWRPa21R?=
 =?utf-8?B?eUxnMkRGSjg2MVVrTDVzUU5lcDFZU2RXdlg0S3pNeC81bm1IOTIrSHdFVlZD?=
 =?utf-8?B?cVZCczhFbkE2T0M5elBic0VnT3hOdmsvb0UyVWRSOGhLdmhVWkhNcHlET1Jy?=
 =?utf-8?B?UU40TzdCQ1EwcjMxR2RJNjlZbGo5d0RYMEkyU0pQQ21vamdWVHlHc3lLTktV?=
 =?utf-8?B?UFp2YTBzS0VtcGZ5VVBrSVpTZWtPcHdCMFFWMnpaejBsbndVRlVWd3lZNWEv?=
 =?utf-8?B?QWJ6SWFNejZldVZ5eURsY0N0NVBsdW5ncnp6dnkxVlNQbnJDR3JEYWwrMXVj?=
 =?utf-8?B?dVU2djdOLy95RUEwY2U1UWlBbG9qRUtmYkZ0cDhkKytCYnZHR08wcXBTdGtl?=
 =?utf-8?B?eGJCbFBOQnVDMCtPODdnOEhIdndWbHljeHlwYVhNU05OOFpicEpZejFVVXJQ?=
 =?utf-8?B?SlV2bkRYSHRLeWYrZWtsOGpQcVVnam9xQVhoZFdNTXBkaVBpREdQMmVNYTBE?=
 =?utf-8?B?c1dhRmFWblE4NUgraHBKRnhuWDFKMElPcWloL1NqZTYwaXIrMDFWQy9SVXhm?=
 =?utf-8?B?Wis1bVlJalZwdE1UQ3BQQ2UwNlZJSElrb2ZkeEZxaERUdHBiTWg1S2xPOW5L?=
 =?utf-8?B?MUpjMUhQMTRkc0p1cVRSMC9BcnFuQ2hMSXkrVnF1TXBDSWRUd3lORVkyVGw3?=
 =?utf-8?B?VVJidkJlOGgyenlZZ2dScEhHc2lwQU9tMWxFcm1xVG1udWEzaGxBVTVLU1dy?=
 =?utf-8?B?VUlsK0diYlVSM05hVC9xVGNucGhpRzhBTTJwS3ZQTjRQRTRzVUdCcURhTTJX?=
 =?utf-8?B?RU5oUCtFZVdDVlV1WDQ0UzRtbDNjZEJNd1NZZi9CRlppWFg3ZENpdWVZNkZ6?=
 =?utf-8?B?bnhlaHJDcmJ3REI0Q3p0RWl5aXFaTDNQRnZFdFpDTkRiTXZaK0xHMjFoYm56?=
 =?utf-8?B?NStKYjY4V2ZhUFB5WjhpeWpVOXlCcUl5RjhGSlRKU1RRa29naVhLOHYrL3RZ?=
 =?utf-8?B?OHdTNG40aW5GR1VKaGVCUnVDQzA2S3hoMTAzMzRaelR0alBZUTM1TWRZUTRN?=
 =?utf-8?B?ZHdyREZiNVZZVWRDeWRIYjhLR3E1V1dTb0JXU3lLWnQxdGM3VGQrSG4xNXYv?=
 =?utf-8?B?Q2lZQ0lSdnNVSUU1V2JnNEhoamJqaVVvYnVIVHA0OUZGVDNSNXIwY2g4RGtD?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6350E0EA68F78E43B0D813D345A8A247@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QoM6zRwT/FLaG1psHa14d4AT4cQzfE/2hEYpSuT64rP35o5ZDrFRsA/STjH8NPLfhBpbLbb8d1pSg2QdcQBM9BCt4YqvYCXctr6ShHLaNwSTL+bwiFuIGrEyEOLXS/u2I+Xex/DSqx7QsGUJg+HD/tCVf0tkAVcqhO78bQKtUcHgeye50VfbI22zZbdPzlbt6Y7Epy1iCE8UgHs5I3Z8z80AwO5/Xq4N0fVuSmN5u0Y479l9Il5z1aStP3i3R64yEyMeXmuNTu69c8AGiq+WYv9KV1E4jdMF1lTZc/CeZ6FKq/AsrG2JWiH82iUe7AOEgcjVnJXm+ot3a9YwvJYhl6cc0cGTjtKQqfHH7m4V0K+5pd4oUFrnk0aUPCGM6Qlm9rlRVYyRizN7kUoFy7imqhM3+2COUGUZooHeHan3dWaPLlshG8v+mJEh8txTIbiv3D9HUU824Tab8P6nV2Noa2Bk+JxM5ZZIIibiGoTOxLUhRyMZsF3mLaPlzLcMVktQOKGmMlH1jPduDZTzPktlu6uRZiSFzh9IpB8j19uRqkA2MLK0gJM6b88MzVYdzTMwJRv06sYoHGNO0wQWA+vvjjN8GkYIZvkQfa3Q7sGtPJ1mIrNW1pWN4TidWV1H0Wz7bYveBEv6PbKxJObKp7Wc1kw8vAvUk7ptZz8HOoPeNKVg6ze2fKnAMapQxOonpRXlW+MgtQEdoofTeeiohg1LOdmGxGqw94tMe2Dd3aoLFhriAjzHPo86LJlZ4Sx9f+Own1S74W4wuVft77NFFrzf2+d7afaYTRBZsGitG/hF2QD2TcJP321oF4mCmb5yt7XghRjunH9mQtVKuVzhmG1RXjHkRbTZJq6GEg5iFFzhuXU07/wcDttK2kAnlbubo5P3HXsUwTOtXQkpB+BzD76fyA==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5f9463-b9d7-4d2e-0e63-08dad3f91634
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 00:06:39.8705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S9FNko3iuLN3HNGaF3qIQlvgw9VbqipsNd7SQ7oVPhv6xvNzBXPmYRb1mrHobG7Mo64U1E8ENJP3ANdFMm1oSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB5409
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3286bccba=wilfred.mallawa@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Dec 2022 00:06:48 -0000

T24gVGh1LCAyMDIyLTEyLTAxIGF0IDIyOjA4ICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gQXQg
cHJlc2VudCBtYWdpYyBudW1iZXIgaXMgdXNlZCB0byBjcmVhdGUgInJpc2N2LG5kZXYiIHByb3Bl
cnR5DQo+IGluIHRoZSBkdGIuIExldCdzIHVzZSB0aGUgbWFjcm8gU0lGSVZFX1VfUExJQ19OVU1f
U09VUkNFUyB0aGF0DQo+IGlzIHVzZWQgdG8gaW5zdGFudGlhdGUgdGhlIFBMSUMgbW9kZWwgaW5z
dGVhZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJpbiBNZW5nIDxibWVuZ0B0aW55bGFiLm9yZz4N
Cj4gLS0tDQo+IA0KPiDCoGh3L3Jpc2N2L3NpZml2ZV91LmMgfCAzICsrLQ0KPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQpSZXZpZXdlZC1ieTog
V2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4NCj4gZGlmZiAtLWdpdCBh
L2h3L3Jpc2N2L3NpZml2ZV91LmMgYi9ody9yaXNjdi9zaWZpdmVfdS5jDQo+IGluZGV4IGIxMzk4
MjRhYWIuLmI0MGE0NzY3ZTIgMTAwNjQ0DQo+IC0tLSBhL2h3L3Jpc2N2L3NpZml2ZV91LmMNCj4g
KysrIGIvaHcvcmlzY3Yvc2lmaXZlX3UuYw0KPiBAQCAtMjg3LDcgKzI4Nyw4IEBAIHN0YXRpYyB2
b2lkIGNyZWF0ZV9mZHQoU2lGaXZlVVN0YXRlICpzLCBjb25zdA0KPiBNZW1NYXBFbnRyeSAqbWVt
bWFwLA0KPiDCoMKgwqDCoCBxZW11X2ZkdF9zZXRwcm9wX2NlbGxzKGZkdCwgbm9kZW5hbWUsICJy
ZWciLA0KPiDCoMKgwqDCoMKgwqDCoMKgIDB4MCwgbWVtbWFwW1NJRklWRV9VX0RFVl9QTElDXS5i
YXNlLA0KPiDCoMKgwqDCoMKgwqDCoMKgIDB4MCwgbWVtbWFwW1NJRklWRV9VX0RFVl9QTElDXS5z
aXplKTsNCj4gLcKgwqDCoCBxZW11X2ZkdF9zZXRwcm9wX2NlbGwoZmR0LCBub2RlbmFtZSwgInJp
c2N2LG5kZXYiLCAweDM1KTsNCj4gK8KgwqDCoCBxZW11X2ZkdF9zZXRwcm9wX2NlbGwoZmR0LCBu
b2RlbmFtZSwgInJpc2N2LG5kZXYiLA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgU0lGSVZFX1VfUExJQ19OVU1fU09VUkNFUyAtIDEpOw0KPiDC
oMKgwqDCoCBxZW11X2ZkdF9zZXRwcm9wX2NlbGwoZmR0LCBub2RlbmFtZSwgInBoYW5kbGUiLCBw
bGljX3BoYW5kbGUpOw0KPiDCoMKgwqDCoCBwbGljX3BoYW5kbGUgPSBxZW11X2ZkdF9nZXRfcGhh
bmRsZShmZHQsIG5vZGVuYW1lKTsNCj4gwqDCoMKgwqAgZ19mcmVlKGNlbGxzKTsNCg0K

