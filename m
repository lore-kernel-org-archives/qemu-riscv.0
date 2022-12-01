Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0tRH-000269-D9
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 18:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=327315efa=wilfred.mallawa@wdc.com>)
 id 1p0tR7-00022w-Ta; Thu, 01 Dec 2022 18:57:51 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=327315efa=wilfred.mallawa@wdc.com>)
 id 1p0tR5-00082o-27; Thu, 01 Dec 2022 18:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669939066; x=1701475066;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k5WwZcszl21UTzwRHE2nlt+XE++PVv7PIZnCMNnR4mM=;
 b=fPEq6mS5DZa2PyxiOzAed36guN9BHMrWMOtL1KoUwPcWaSBq94u0nVob
 OWkP1BPIZpF/jE0+2z0yfdab/osKoG9zby4y5O8aiZXevH+TQHTEMO+yk
 wvTMZfjmwOk2H92hboO1nM5BB31DsheHzZMY/zipSP7CdScnn+onglMRF
 w3TrW0P7uMQZhqXpHZaM8hISZtX54R9+Eon55QbTAKe/Whqg96sDBCzG3
 SoG4FedHeygWXp2yYjlLREkM7u68PtBpN20F3NtTQeSKtlaXGSiZCQCwH
 rVCwKHKUZmC6Q+u/HKjPfsyfRqH2X0SqBZlOifKCf/6ORaVfPM9NEwErb g==;
X-IronPort-AV: E=Sophos;i="5.96,210,1665417600"; d="scan'208";a="329804578"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2022 07:57:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+bOYN5Q98BM6HXFOBg+eVx/uVybnzCTokJQJU5S+ceVGI8rF3TopQklqIarCun7thb9wJmJ7dfBum6GnRSLZ2PqkkRJlBvDqFiqbtiSFHXwbNnMn+YQPmfU5JfO/cebQCTw4J7spVkWP98RhGgOwFBf8LTVtZa06uUJqxCiyUq8HPmES63+FQIdZNPMyMXFEnU1C/kqdJQ2dW2DsntPbmc/mFymULcuqDtGSEsAJbVpvFelXjRJNrHDTl3qsqWcyt/E4GgpgT0aFxaK6hASQOuH1osCIFDTYTYNNMkERIOuVEHD3TLnYP0Z/UJInf4JsI9wnS/vyswyqd+3I19EYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5WwZcszl21UTzwRHE2nlt+XE++PVv7PIZnCMNnR4mM=;
 b=AbJPG/zhL1xQNQaJbmbckKo//nMNKXTLUF4NbOJ0G1a5tlyE+Mu75u4X3MVysubW0mTBm+rTwVm33GTM3sgQrhypmPfLyqBh0XeGittFRJS/GnJxE0Qztqb2TNqjMOw65ESniLza+neqjeSc+NgxUtkizDCNKLrAKeh3YQHVvx1dZE18b8Y+2YqKZQN5MtS9HKI6LY7dOjT9xm3U9W+9YSuBc7DPTIJlTh753a7VgV6+6KIUjQflkke2ewWMywz0Blfkt6ihQd8TdHT5XOoVgurOazKxfc1B9ZUzbFMI0CniW4JgixZ/tCSk0BxGt5Wvz6NTAT90LIzuL3cUM7Vwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5WwZcszl21UTzwRHE2nlt+XE++PVv7PIZnCMNnR4mM=;
 b=DcTl64aC0IFnqWgEkvOgUcQa0bE7LlSBnZTrdO+X2yYEtJ0UYGULmqTEZYtJhC7vspKKe3biB3emVmrnVER+emuU1z1PkVyeKfcr4OF4oFPspHhRZ+Rd03wBfbDk9G1xzYGLoEypLMOFzfo9s6vLtDalQq/0eKk9FwqLBXKNaVw=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by MW4PR04MB7441.namprd04.prod.outlook.com (2603:10b6:303:78::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 23:57:39 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 23:57:39 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng@tinylab.org" <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "bin.meng@windriver.com" <bin.meng@windriver.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 06/15] hw/intc: sifive_plic: Drop PLICMode_H
Thread-Topic: [PATCH 06/15] hw/intc: sifive_plic: Drop PLICMode_H
Thread-Index: AQHZBY8SL1MqqtG9vUaaz88D7sbkLq5ZtkMA
Date: Thu, 1 Dec 2022 23:57:39 +0000
Message-ID: <6f753dd09e44b73e2aa312052288d60854e5c8a6.camel@wdc.com>
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-6-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-6-bmeng@tinylab.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|MW4PR04MB7441:EE_
x-ms-office365-filtering-correlation-id: 5e3cbb39-8758-4aa3-61d3-08dad3f7d3f1
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VhjAyJp12IIqIJunalvKv1N6Shmw5VKCW2A0Q5L+r5sXX1/Fv2gvXKqWBC4qaJaXfVgbQnhi/bi/VfIuFeJTNCWDQc6Fe7XjujONRGS3ehGbNs2ZsoKDCJhfbmjb88HdWvcbbdoxJCRNJWVzeVt4XGywTJBo/oqe0KqDeah+F1bXL5fV4Pg6dUp/7+ktMrUU1FtU3uoVD0uvW1mWvkBH0FNEYYsnJHsnhCY4OaJbZkniblw/jqj176hqG2S0llRag73Ds+QfmRrey4hWaMcgZTXjIS7mVHgFvbvc12lb2YdIp9OnqXTr3SrnSohnR55cGTAk/4k2+BfAaRe3xfV9fwG1xaL2mYkzGUMh5o04NKge1fOvctybgFjI30EJeQgqakywATBKIQWuyV14uykTvj2FuYmc4391BFF8Zj0wewVlctWWOxTXpVdakeC0W/9tLs61x3hHcpcbrOUIf5dfvKhBYkIyYqSOUO9Xbo/KMEM75nPw7hjRPYn5Z7qmmwhunTVs6J4GVN4Oe4JUTt9hPSzlt3kpMPc7yO/vycWuwaqDR1hGxvJ3pT8s4gDb3A5SbFZQJnmjNrRjLUdtm7or9FNbZnuFUl1CYUjJv4A4l+emg/6EbsvOSWHCT5UqEquwkz4054TcqlSBdpvKO3B4LKBglVZ4BbPEyQH3LXl+HWl1782iqnve6p8dcVqXAfdyFV+8W0xjc61ciPKpjeVEEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(2616005)(2906002)(54906003)(316002)(6486002)(110136005)(38070700005)(36756003)(86362001)(478600001)(122000001)(82960400001)(83380400001)(38100700002)(186003)(26005)(6506007)(6512007)(44832011)(5660300002)(71200400001)(66556008)(8936002)(76116006)(66476007)(66446008)(41300700001)(64756008)(66946007)(8676002)(91956017)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejdtMFpEekJFbHdSWXFReTZjWmVDUm9TVlZjWG5zZGdGZmNuNklnaXNHdHRl?=
 =?utf-8?B?YTFrdjVhZlNQMHFBbEIySW5pRkZ3SFB6S0t0TUkvWjMxRWc2M0pobDV6Q1Vx?=
 =?utf-8?B?OCtUejZjb2ptTFdyMlJjMWV1QmY2bzFhWlVBaGJvMk1lSHFkbUQ4QnhYOXdQ?=
 =?utf-8?B?S01kckdKRW1WSEVjQm44ZGRoaFMyNVJTaVRPNEQ3OG1QeGgrclZWZ3d4NlM1?=
 =?utf-8?B?ZUs5ZE41WTFtaS9GVm5PNmhFbzAvRVg1MWVrbjZRK0lHSWxMRUgrY2RaaHM5?=
 =?utf-8?B?cmd0K0srMTdaRktYcDZtYk5HUzJvY0FKY1lweHVIMFBocFhZMlpFZFZGNHlx?=
 =?utf-8?B?M0ZHcmpMYkpNR3owWHpOb1RnTmR6M2xXUmxEYmcvMG9QdWNsY3NvL0lHaG42?=
 =?utf-8?B?SXd1dE1iRHFpanYwRlpaai9pWXlqUUFvTVR0Z05JTDJSaXQwd1RHWlFjUlJu?=
 =?utf-8?B?N0pLcENyL2dDMEIzTlJ3NzU3TDJoZHpIQzA3dTB3dzVCTWlpMGtWQ1ZlVzVV?=
 =?utf-8?B?dDRIZUY3UVNXbUJJSExGM0NaY2gzMXRXOEdwVU9CYnQrSWRRZFhMTWlETlp6?=
 =?utf-8?B?NXdsVWUxRU1DRUEzYWIyQUJDb3NVNWZxRjgvQVhJbjRvZUNRNm02blAyRXRh?=
 =?utf-8?B?NURqa1R3QWcydHlyZmQrbzZwNEV4L0JWM3hUL2RsVlkzMUFYQVE4K0F2bG50?=
 =?utf-8?B?Kzh5c3pXRDZzY0RXa1IwZFlDQ2loWjQ0L25CcE5Kc1RuTTlrYnJ4QzZpSENS?=
 =?utf-8?B?UTkwdFZFMk9qN0lhVHloaTdoWEE2aC9DTFhnVEJVeXBzeUkrYkxTakFZdmdD?=
 =?utf-8?B?aitjVlZEb0wycFhGV3RHMnZRN3Nkb1MreW55bnJXSnlwbXVUeGgrL0MvRm5Z?=
 =?utf-8?B?djk0RUVHdXRYKzZzRnJ6UTNmSjBkc3E1MDZnOWhOVUtKczBLRDJ1ajlhWDJi?=
 =?utf-8?B?UkxmeXA2OE1sR1NaQ1Z4bVIwajhQVUVwZVYrQjJZREE0NHpHcnNTTE9IK1c2?=
 =?utf-8?B?QmVtY0VUbk8wQWFvdmlFeUZWWFRMUENvT0ZDQllJNk43VG5lbmtsb2psZkZI?=
 =?utf-8?B?N2EycERjUzM2WWRDU2RObFJsVlNCbVJsZThtU21zOEVLN0gyeFJsSnlLalVp?=
 =?utf-8?B?ZkdOVlRtZDB5dnhsaHJjK1cwM1dkdE15SzFUZDNsMkF5WlE1UjEzZ29xU0NV?=
 =?utf-8?B?QVFxNWdKSW0vQm56MEN6Znh0NVR2MWtJR3hFSXpMWlNwMlhlTVVxMUt0amti?=
 =?utf-8?B?MnZPM3E5N29WamZuV2VhOEdjaGU3S3dibTVaVWJieVhpSTJBRlppZm94elFD?=
 =?utf-8?B?ODJteUx1aFpHSW5FQ0FPWFdyY1Nuc3lWQ1Vwa3ZiTVNLTG5DaXd2SWh5WE9X?=
 =?utf-8?B?NzBNWnpNankxZUQ5cVBoRlcrYlFKZ3pxY2JvZ2F3Ym00UFprM0JmWnhWOHdF?=
 =?utf-8?B?c1Y2UnhCWXJSSFNMcnp1dzA0cnZFOW1KcUJtVitJWThKZktNS0JqOCtDZVlW?=
 =?utf-8?B?aExsYytvMWJybUlCMXF5N3ZKTWJtNnk1S3pXUlFJR0d2cGluNy9zOHdUVUV3?=
 =?utf-8?B?TmZDaHZMSkpMZ3hmVkFrQnY2L2tSenpTWnZXeEw3ZWUwaWZRWE9xSlNSMHU1?=
 =?utf-8?B?YUlUMW1IUDJ2Z3A3T212Kzh5Vm1jU2poSVpmTHhTaWFLZUt6YmNxZkRycGNt?=
 =?utf-8?B?MXNDdmZpeFd4VFA2a3J6Ymx0QnREeTBPMWhtNlFDaVk4QVhsdmlxRVMwaUNn?=
 =?utf-8?B?NGFQTmhSVmZ2WHkwYWdhaS80Z01na3NGcWJFell1bStDczZiOVVzb3VwTGRj?=
 =?utf-8?B?NDk1blpxQ1BQS1JqOXZhTEE0bzFiQ0cxM2E0aEJGL09vY3pYRzMySEJETEJm?=
 =?utf-8?B?cjIyOWZRTlhrZW9HYXl3UVF4K092Rmp3dlRzcVZzOWZCeGI2OXJzMmRyNWZC?=
 =?utf-8?B?R3R3ZGZuT0hud3NONG8vWDUzMXFyNmxiNmJPOFdQbldJOXpYVzZ4d0VVeDls?=
 =?utf-8?B?dXQ2NG5pdWpsVGRqdDNLN3dvdG16eVZxajdNWERLakNxdSs1VUNZVnN5L3dQ?=
 =?utf-8?B?Um5DdkRNOFFtY1NYRXFnZTNJWjBnOXVnTkFvOW8wc3hlS0Rud1RvdTFvWVNU?=
 =?utf-8?B?ZFd6QXJuam5ySjRSSnF4UGVsWGFBQW5mdy96ZnhCdlhBbXRpUXc3RHBTaTN0?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E562E600FF31143BA2202B1CC8BEE71@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JE4WgUOfAiKKk46kJ+L/Bak5YlKePgJkRR8YYIadC0yl1QwAFkksVno325jWE9enYRe+nF3cYGRLD6i12qVx+eQm8wJfkiSSkjkLRDncFiBmX8Mgva+sB6zvnAukjlV8+GBITXBlNvq7oH8MZJLDAW4WBiTLd+qKqYA3mDh08OnLNxvx6EWsFwWZIms3oV5eXoj5hbZleSyY6XgxILiTJmjRqKzJqnNwGTa7C4Rhjp/PGcyd1vAvTw4RVY3JzzaijK4MkYhRKfCYoAki3PgLoh2JouWw2BIEANu9/tywNDF7CswUv6FgXC4aZu301iKLcc5iHgvhw8vww/fEsQYxDjWnu5zEOXQZ+Lkv2MZl9sgxXTgG42vs60agixR1LzQcctX7IurUvJbMfOOf32VeZQtwF8vWne4PCuWcow9RtJIi6AcAy7AdPbLCx2YvqHi3YEBWWBY/8kMkuu6hfS47UmKHybhmAamMU47AqY/YOV8m1lBDzDiFkWsGxe4XA+upxOiX52MqYn3jAjU2mubJ9FioY6xIpG16xjp6qdmucwJsgHVLrK5E0Tqbja9hJL6dCUEz2WWv6EdJC/8heMdDNM6NLwvg3784ufziubnLuomdi0cF/Yas7wq5641+ksdfaB9ltOdF0h9uE9dKCpqD38ZzTLlkAlMaVwYy41DlvlPncy6ijX2DLVW7O2tlWWFMrZUL0sKYQk7+eTwGT4L7rN4Sy6RAnUg2IhnX4F+mi0SecVutRPGz2kX5DZO9dwEX1hbtkVmuw/2m9rjpWaWHP9QMHxTzhGzhtJ420xTBW1TLVo8LH3QYOGqxSfIuA6PqeLG80xGRjBs083R6nKhLKIL30LpMdwlkMAa/LiWCfiwdKNTIptdirztITQB5Whf9T8h/ObBd6egqGEMIH+q31A==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3cbb39-8758-4aa3-61d3-08dad3f7d3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 23:57:39.2228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ntN5gVCN+R8fOrlLcDJk6Qe21XY89p3SdjwqtP4jgDkqyU5Kp3qS+7zfvs0mBHNEk1k9KAnHVRCEb7yZTSsYBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7441
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=327315efa=wilfred.mallawa@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Thu, 01 Dec 2022 23:57:55 -0000

T24gVGh1LCAyMDIyLTEyLTAxIGF0IDIyOjA4ICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gSC1t
b2RlIGhhcyBiZWVuIHJlbW92ZWQgc2luY2UgcHJpdiBzcGVjIDEuMTAuIERyb3AgaXQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBCaW4gTWVuZyA8Ym1lbmdAdGlueWxhYi5vcmc+DQo+IC0tLQ0KPiAN
Cj4gwqBpbmNsdWRlL2h3L2ludGMvc2lmaXZlX3BsaWMuaCB8IDEgLQ0KPiDCoGh3L2ludGMvc2lm
aXZlX3BsaWMuY8KgwqDCoMKgwqDCoMKgwqAgfCAxIC0NCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDIg
ZGVsZXRpb25zKC0pDQpSZXZpZXdlZC1ieTogV2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVkLm1hbGxh
d2FAd2RjLmNvbT4NCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2ludGMvc2lmaXZlX3Bs
aWMuaA0KPiBiL2luY2x1ZGUvaHcvaW50Yy9zaWZpdmVfcGxpYy5oDQo+IGluZGV4IDEzNGNmMzlh
OTYuLmQzZjQ1ZWMyNDggMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvaHcvaW50Yy9zaWZpdmVfcGxp
Yy5oDQo+ICsrKyBiL2luY2x1ZGUvaHcvaW50Yy9zaWZpdmVfcGxpYy5oDQo+IEBAIC0zMyw3ICsz
Myw2IEBAIERFQ0xBUkVfSU5TVEFOQ0VfQ0hFQ0tFUihTaUZpdmVQTElDU3RhdGUsDQo+IFNJRklW
RV9QTElDLA0KPiDCoHR5cGVkZWYgZW51bSBQTElDTW9kZSB7DQo+IMKgwqDCoMKgIFBMSUNNb2Rl
X1UsDQo+IMKgwqDCoMKgIFBMSUNNb2RlX1MsDQo+IC3CoMKgwqAgUExJQ01vZGVfSCwNCj4gwqDC
oMKgwqAgUExJQ01vZGVfTQ0KPiDCoH0gUExJQ01vZGU7DQo+IMKgDQo+IGRpZmYgLS1naXQgYS9o
dy9pbnRjL3NpZml2ZV9wbGljLmMgYi9ody9pbnRjL3NpZml2ZV9wbGljLmMNCj4gaW5kZXggMWNm
MTU2Y2Y4NS4uM2Y2ZmZiMWQ3MCAxMDA2NDQNCj4gLS0tIGEvaHcvaW50Yy9zaWZpdmVfcGxpYy5j
DQo+ICsrKyBiL2h3L2ludGMvc2lmaXZlX3BsaWMuYw0KPiBAQCAtNDIsNyArNDIsNiBAQCBzdGF0
aWMgUExJQ01vZGUgY2hhcl90b19tb2RlKGNoYXIgYykNCj4gwqDCoMKgwqAgc3dpdGNoIChjKSB7
DQo+IMKgwqDCoMKgIGNhc2UgJ1UnOiByZXR1cm4gUExJQ01vZGVfVTsNCj4gwqDCoMKgwqAgY2Fz
ZSAnUyc6IHJldHVybiBQTElDTW9kZV9TOw0KPiAtwqDCoMKgIGNhc2UgJ0gnOiByZXR1cm4gUExJ
Q01vZGVfSDsNCj4gwqDCoMKgwqAgY2FzZSAnTSc6IHJldHVybiBQTElDTW9kZV9NOw0KPiDCoMKg
wqDCoCBkZWZhdWx0Og0KPiDCoMKgwqDCoMKgwqDCoMKgIGVycm9yX3JlcG9ydCgicGxpYzogaW52
YWxpZCBtb2RlICclYyciLCBjKTsNCg0K

