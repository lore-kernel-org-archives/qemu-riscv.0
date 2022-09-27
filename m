Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1odIgw-0004hA-WC
	for mharc-qemu-riscv@gnu.org; Tue, 27 Sep 2022 18:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1odIgv-0004fI-V1; Tue, 27 Sep 2022 18:04:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:7707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1odIgt-0002s7-Jy; Tue, 27 Sep 2022 18:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664316275; x=1695852275;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fbm06furegukM36GLVuTPYNUumwMQ8MSwueCwphxaCg=;
 b=TB2xckn1KzskGs1TVdVflWYdBz0i1dme1yRSVCyjAXSE/vo6K24wGrEA
 DFgEwn8gpTQnDZYM9cjzu9IEmNtf29czPRKZFNMV0uzeo8DbriSCDsuRE
 7JfbNK25XnfAPI9BS0r35i0SkxSl52XtwVSdDb6z+IcrPkbTBgyKt1lXd
 0Y4bP+sled5VZvHW/AXdewyeWyaTRj1MJIuFzWadYmKS0jFANE+pu4YO9
 d9p8B/ni0QOVjLycMDdOqTiTGVP1l11FpKICo9CIgb88EDG5aj4rGRb6L
 c/RFz9PBra4cPPncpZiRgsyCYLEMrvB9pjgy/MPVz9JWfxSfI8X7y7SWL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="284570845"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="284570845"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 15:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="725686578"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="725686578"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2022 15:04:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 15:04:31 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 15:04:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 15:04:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 15:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTCWAxvgFX3B2XOtAKCwUqerjf5WQyZGkaCHrPncRDcx8bWu8jtdkE0//vUxu6E32aSDxJdh/fQ40Y+xAKX32YR8VUYzrdJfVp8DWfbc+ObuI7bOSRdc704QahXdMb45cLskod7ZCNt221fB98nCxSbpFIW/1hko8zOEreR9njdFP2SN0rPWxkWo+euAPFVdGfjwzNKYW5IdQE6IkX5g/u/PX689g+QwzhKu+8wERozxPIp6ZhGHRMXP8UcYZitf5lgoXxBK/xk/oE5HBRjRnidjnqWniv8fjUA8FnZzRhkrk2iIABTsXZl90DYls+U1rbOywH5G8Q5zM8WRu+mA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbm06furegukM36GLVuTPYNUumwMQ8MSwueCwphxaCg=;
 b=MgRwREMhaEV+IYsrKfcZuBeFBsoaaIcWPXVzXBI7mSuRZn+9PeMZFRqkwhVRGsBURIpn5TD062c8rQcyNGnqbIzUJDlUfh2+vSS2YT1JQ5lhgCt/rAJWG8ymAxG2KD62ihT7uv7/ZGeYaCYDa7l/U7tO8vBC+t8TfHW/FqHt5drxBmqpHYXK9EMVm1WAdhUGZBbTf9Jr6AVBeNM/APu624J9uMaK3kkSZfDjbKsOAumodyN3hxY25FlOXJpPe47jkJqxJP9gZBKCh2uzBm99hGG0KHC49Ij6cuzkwoZH8jqbLywZgOASz7tuDBbWb4cE2yJ9IrAOAOGmd3VArP1YyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3042.namprd11.prod.outlook.com (2603:10b6:208:78::17)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Tue, 27 Sep
 2022 22:04:28 +0000
Received: from BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::b52e:e73e:ac99:8a5]) by BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::b52e:e73e:ac99:8a5%3]) with mapi id 15.20.5676.017; Tue, 27 Sep 2022
 22:04:28 +0000
From: "Dong, Eddie" <eddie.dong@intel.com>
To: Tyler Ng <tkng@rivosinc.com>
CC: "open list:RISC-V" <qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "Meng, Bin" <bin.meng@windriver.com>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Laurent Vivier <lvivier@redhat.com>
Subject: RE: [PATCH v2 1/3] hw/watchdog: wdt_ibex_aon.c: Implement the
 watchdog for the OpenTitan
Thread-Topic: [PATCH v2 1/3] hw/watchdog: wdt_ibex_aon.c: Implement the
 watchdog for the OpenTitan
Thread-Index: AQHYzqCkzYowmiYXhEufWUdCK4JisK3yKLLggAA4L4CAAXZwcA==
Date: Tue, 27 Sep 2022 22:04:28 +0000
Message-ID: <BL0PR11MB304295EA40A39F491D8DEFA58A559@BL0PR11MB3042.namprd11.prod.outlook.com>
References: <CAB88-qOh7dBoFP4SWcM4G5EVp6cumVnZ5j4tNRqSvMT08=dAcA@mail.gmail.com>
 <BL0PR11MB3042E97131ADE38A3535984F8A529@BL0PR11MB3042.namprd11.prod.outlook.com>
 <CAB88-qMZiPgFx-13WiXqJ9+EV04THXuSHkLjFxLqvZxKp5LNkA@mail.gmail.com>
In-Reply-To: <CAB88-qMZiPgFx-13WiXqJ9+EV04THXuSHkLjFxLqvZxKp5LNkA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3042:EE_|MN2PR11MB4551:EE_
x-ms-office365-filtering-correlation-id: 7167ca6d-cfb9-4446-bf2f-08daa0d43f70
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JSaUfaGPjjlHRehphmMH7s9G6L7mppCqkvcW4d22DsBgXIsGIhuDXJWNpnGRMHT97glDtxdBZRh0+8H7WqYZEmh0f+iXgJzyG2ocP9z7YlTpogViZO8UqOqNKMBS88O98oMmvtoOdn4J9sHQmZd5DyjQhZgtELiJiDUdf3DqngmBQeR9w+ypY376dIIEr4FsB+lrZxPbryZ8cUgg0hN2K12g1kRH3IUz9KLHFr2cNuYQCGl3AgTkvcXKbD5nwukbop5dO5OeGO02RKJyPIodl4Q7A+/Vb9dvykNRiXrFSqDbCEC1SnskKWuGB9R3exqJDcp2jBoDo+3b6+ZyccVCYDL0sBdCQh3lC6KUjOLxhJg4ji0kmnnVFDSx5TvPa5k6VPlkwmQH3u9L+uEyz53qwVAFqDvaRJ+LACbMpAMX4j11qNsBlVJCZXkC1vSDbAzWR7YrNTJ35yw+IK3bHkmJ7vdhuBVUUpq5lVC6+XIIt4DMbhAxOGUVmFAuXTXp4joq/Ju/KMO+i/Vcgw6Hjc76uWIgVv7PJmTJC3PyaKaHsUrPNjAqKHK0s/sz7HWFY+X6MdYFewlvmdiprKTD4lPBgvf83qUi2a4AGuEfKRtfvIWcSX5bq7a0eW/bwzrxHixg0GIKGL/1LLulGojS+vtfjLBQQYnkIaQJvqcxHxp3I0XNkHuKWzpYQmbIEVxbPwgf751LEvlW4SynME/DrvqKY9NYA36qdpbFADBx87iErlX6jGr0uEybsE8H12/MAt/S6bhahGSn5iXJlcjte8+Fjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3042.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(55016003)(86362001)(71200400001)(38070700005)(33656002)(478600001)(2906002)(41300700001)(7696005)(5660300002)(6506007)(54906003)(38100700002)(6916009)(9686003)(26005)(8936002)(76116006)(82960400001)(64756008)(83380400001)(186003)(8676002)(52536014)(66556008)(66476007)(66446008)(122000001)(66946007)(316002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnhjMXI1cnpVcjFkdjdmNVhWbFREd200bTZPOWYwTGdKUkZ3WmxiSHpvdHRR?=
 =?utf-8?B?NkRkeFZtUUJNajFCZHhINmJybzdRMVJvR2h6OVpEbnhEVy9SRFptNjlHYXRn?=
 =?utf-8?B?NFBuWHlML3BVMzlMaW95UVlZUWFibTNzbVlSZFFvYlU3YTU0L1phcld2VTFS?=
 =?utf-8?B?RGdFcndMQUpLYi9IMzVMYzFGcnVhdFc0cEJSVHN2S0hRbEwwQUxrQUVsWUh0?=
 =?utf-8?B?YlU1WkxMVDZ4RVNybW9OOEN0Z05YZWhJa2pSOXNGa2RWME9QelE4OURFRmZp?=
 =?utf-8?B?QXFMMWZWSW5pR0x0aWZxUW5ZNnhNbVAxbFFQV0R5ak9yTzNoS1B1c290K1M5?=
 =?utf-8?B?cFY3V29HUVJZU0lPTElwalIvNnRCSFI5SUNCUC80dUp0VHZMWUlMTGxQZktC?=
 =?utf-8?B?V2NTZC91VmY2NURJaTZuWkZDV0FWcHducC9EWjVZVGtocnB0Y3VySnd4SWxz?=
 =?utf-8?B?ZVZkM1ZnZlNsVTJkZXg4WUVpdWJORkFLRGdUcUpaUFFheGsrYUNGQTNHWFBq?=
 =?utf-8?B?bmxRbDBQaE9Qck9JTHd0Q1pmRTl2V0oyK083MTE0VU51VTlTZVkwTC9vMURS?=
 =?utf-8?B?SkNvMEp2MFN5NHRRTjdqS2RFaHY0YzY3UGNSakhqQzdQSUJRRXY4NHpzTGFu?=
 =?utf-8?B?L0I2bTJBdU5SQXdvNG50bndWbFBTNmNYcDN0Y1BsMTFFUGdhMFdjblI4ZDZh?=
 =?utf-8?B?NmVrMTlYSG5KZXpERXZzRkptTWZYWjJBTlovZkdVemlTbk1URTlqZ0U3VFJn?=
 =?utf-8?B?bG1OZXZWQ0xYQ1hsSnhYK283TXdqeUhrbDFkM29OS3NBbVludWwwSlFJZjdp?=
 =?utf-8?B?MW9nK05COTBCL1ZSMWJaY1ZLTFZPOWY3Y2hOYnJvODZUU3F4UEFaVjhsajdO?=
 =?utf-8?B?Wmp4aXhScTJUaWpCRi80NXBXdWE1Nm5rdG00KzVQNWM0RzZZRm83SWczN1BT?=
 =?utf-8?B?bytkc3VPWHc1R1M5RWpiZkxVYURTclhsUEcycjB0bmN0cHo1MzcrSnJnZ2pF?=
 =?utf-8?B?VTFOdGZqaE9jVWVLemhPWmVSeUM4dkh1NVk2ZVRKdUlZNWxkYm9tT0FBcG90?=
 =?utf-8?B?SlRpZDV4M1Qyc3lQZzNweXNsdG8yQ2FZOEVrSHVuU1RmRmtWR0tHNnBxazZO?=
 =?utf-8?B?WTA3RlkrVkNHOVNQMnNENXY1a1ZrTzV1NWZpbHg4ajY4M1hUL01MMjJHRG1H?=
 =?utf-8?B?Q1BLOUYyc2ZocE9OUkx6TXRjN2Nud29UMFI1d1NzaGZlYlZOUVNWbVVXMVg3?=
 =?utf-8?B?Y0pUWUVHNGh1WFd4NXVybHNEUWI0aGRQNHFzR081cVZlVnhtU09aZUNyR1kx?=
 =?utf-8?B?V01Qd0s4dFVRNWs5MWxtdzhNZXljVHFKUUVXVENtVVZDRG5QdFc3SGV6OHRh?=
 =?utf-8?B?RFp4UmkwWW9FQVE3Vmo4SG5BczZlbytkdmlHSjU5cTRsUHlaWVVUSTZCNm1R?=
 =?utf-8?B?Y1VkYXo3WERTbDFGQ2lVTVJraXVJdG9EbENFcmRPS3U4NnF6amlxbzRWSUtZ?=
 =?utf-8?B?VCtIZForbmxNQXJQTno5dDF0MUhCeDhwOTFmODBUTHQ4SXdTbXFqRkhuMHUy?=
 =?utf-8?B?Ty9SMi9sRGtMMmUzRUNTQnJxaGpZY0RlTXdpZzJKZ0ZmVmF3K3IrUERpWVpD?=
 =?utf-8?B?UElZMkYxSXFLaXBWajNJRmJVYUJjdzF1YlAzMmg5dUpJc0xXYVQ0MVByUm0y?=
 =?utf-8?B?blVuU1Zya1lDTStNazJwcXRKa0FlT0EvZ21iTTVhMDBTRlh3SUtwQ2tlQjRh?=
 =?utf-8?B?SkM5UGxLcWgzblYxQTF4U0Z0aE83M2VNTE5Id1FCQnRzUWxYTXJMUjdjWFgw?=
 =?utf-8?B?SVNRMWRjZTk1OG5pY1BOUnpHNlJUellCK3VPanNkRWowaTd0S1BWSXorbzRu?=
 =?utf-8?B?TDFIZGc2U3ZRNjVVdjk5M2ZDVlU0aStkVHphYkxBL2RZcmRtc3A5RHdxOHVx?=
 =?utf-8?B?WEhoQXVCV25xeWtVTUs5YUdDTnRZT0NMd05jblhKU0lBREt4QkMwZVRxODRI?=
 =?utf-8?B?d3JqMjlQNTMrd0FiVmV0bllLTG9vaXhNR0UxNjRPalBaRmxuTzhKRG84OTF1?=
 =?utf-8?B?dGQrRzNnUFV1OHlRR04xaXRaTENDNGdiZXVOOHdDeGlvSzV0bWE4dlh6M0NH?=
 =?utf-8?Q?kh2FQK4nFyAL7k6ScSTXimaSY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3042.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7167ca6d-cfb9-4446-bf2f-08daa0d43f70
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 22:04:28.3586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 94vs5ce6rWB52n5dmzKjdGSmNWdjmakghUFyuse5hKtPw94DmzBO07zrJmvhpsunHkJML3VqWMJk0SY/ZeG6EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=eddie.dong@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 27 Sep 2022 22:04:38 -0000

SGkgVHlsZXI6DQoNCj4gK30NCj4gKw0KPiArLyogQ2FsbGVkIHdoZW4gdGhlIGJhcmsgdGltZXIg
ZXhwaXJlcyAqLyBzdGF0aWMgdm9pZA0KPiAraWJleF9hb25fYmFya2VyX2V4cGlyZWQodm9pZCAq
b3BhcXVlKSB7DQpUaGlzIG1heSBoYXBwZW4gZHVyaW5nIGliZXhfYW9uX3VwZGF0ZV9jb3VudCgp
LCByaWdodD8gDQoNCj4gK8KgIMKgIEliZXhBT05UaW1lclN0YXRlICpzID0gSUJFWF9BT05fVElN
RVIob3BhcXVlKTsNCj4gK8KgIMKgIGlmIChpYmV4X2Fvbl91cGRhdGVfY291bnQocykgJiYNCiAg
ICAgICAgVGhpcyBtYXkgaGFwcGVuIGR1cmluZyBpYmV4X2Fvbl91cGRhdGVfY291bnQoKS4NCiAg
ICAgICAgTmVzdGVkIGNhbGwgbWF5IGxlYWQgdG8gaW5jb3JyZWN0IHMtPnJlZ3NbUl9XRE9HX0NP
VU5UXSAmIHMtPndkb2dfbGFzdC4gDQoNCiAgICBDYW4geW91IGVsYWJvcmF0ZT8gVGhlIHRpbWVy
cyBmb3IgYmFyayBhbmQgYml0ZSBhcmUgbm90IHVwZGF0ZWQgaW4gInVwZGF0ZV9jb3VudCIuDQoN
CldoZW4gMXN0IGliZXhfYW9uX3VwZGF0ZV9jb3VudCgpIGlzIGV4ZWN1dGluZywgYW5kIGlzIGlu
IHRoZSBwbGFjZSBQUFAgKGFmdGVyIHVwZGF0aW5nIHMtPnJlZ3NbUl9XRE9HX0NPVU5UXSBidXQg
YmVmb3JlIHVwZGF0aW5nIHMtPndkb2dfbGFzdCksIGEgdGltZXIgKGJhcmtlcikgbWF5IGhhcHBl
bi4NCkluc2lkZSBpYmV4X2Fvbl9iYXJrZXJfZXhwaXJlZCgpLCBpdCBjYWxscyBpYmV4X2Fvbl91
cGRhdGVfY291bnQoKSBhZ2FpbiAobmVzdCBjYWxsKSwgYW5kIHVwZGF0ZSBzLT5yZWdzW1JfV0RP
R19DT1VOVF0gJiBzLT53ZG9nX2xhc3QsIHdpdGggdGhlIG5ldyB2YWx1ZS4NCkFmdGVyIHRoZSBu
ZXN0IGV4ZWN1dGlvbiBlbmRzLCBhbmQgcmV0dXJucyB0byB0aGUgaW5pdGlhbCBwb2ludCAoUFBQ
KSAsIHRoZSBzLT53ZG9nX2xhc3QgaXMgdXBkYXRlZCAod2l0aCB0aGUgdmFsdWUgb2YgMXN0IGV4
ZWN1dGlvbiB0aW1lKSwgdGhpcyBsZWFkcyB0byBtaXNtYXRjaCBvZiBzLT5yZWdzW1JfV0RPR19D
T1VOVF0gJiBzLT53ZG9nX2xhc3QuDQoNClRoaXMgY2FzZSBtYXkgbm90IGJlIHRyaWdnZXJlZCBh
dCBub3JtYWwgY2FzZSwgYnV0IGlmIHRoZSBndWVzdCByZWFkIEFfV0RPR19DT1VOVCwgdGhlIDFz
dCBpYmV4X2Fvbl91cGRhdGVfY291bnQoKSBkb2VzIGV4ZWN1dGUsIGFuZCBicmluZyB0aGUgcG90
ZW50aWFsIGlzc3VlLg0KDQpJIHRoaW5rIHdlIGNhbiBzb2x2ZSB0aGUgcHJvYmxlbSwgYnkgbm90
IHVwZGF0aW5nIHMtPnJlZ3NbUl9XRE9HX0NPVU5UXSAmIHMtPndkb2dfbGFzdCBpbiB0aGUgdGlt
ZXIgY2FsbCBiYWNrIEFQSS4gIFRoZSB1cGRhdGUgaXMgbm90IG5lY2Vzc2FyeSBnaXZlbiB0aGF0
IHRoZSBzdG9yZWQgdmFsdWUgaXMgYW55d2F5IG5vdCB0aGUgY3VycmVudCBDT1VOVC4gV2Ugb25s
eSBuZWVkIHRvIHVwZGF0ZSB3aGVuIHRoZSBndWVzdCB3cml0ZSB0aGUgQ09VTlQuDQoNCg0KPiAr
wqAgwqAgwqAgwqAgcy0+cmVnc1tSX1dET0dfQ09VTlRdID49IHMtPnJlZ3NbUl9XRE9HX0JBUktf
VEhPTERdKSB7DQo+ICvCoCDCoCDCoCDCoCBzLT5yZWdzW1JfSU5UUl9TVEFURV0gfD0gKDEgPDwg
MSk7DQo+ICvCoCDCoCDCoCDCoCBxZW11X2lycV9yYWlzZShzLT5iYXJrX2lycSk7DQo+ICvCoCDC
oCB9DQo+ICt9DQo+ICsNCg0KDQpUSFggIEVkZGllDQo=

