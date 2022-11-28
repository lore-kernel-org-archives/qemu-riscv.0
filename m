Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oznCn-0004OS-VW
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 18:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=324a54ae4=wilfred.mallawa@wdc.com>)
 id 1oznCl-0004Nt-M0; Mon, 28 Nov 2022 18:06:27 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=324a54ae4=wilfred.mallawa@wdc.com>)
 id 1oznCi-0004F1-HP; Mon, 28 Nov 2022 18:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669676784; x=1701212784;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GJ/qibJIfXbeg06azlan/xhGiua9dSpg+9tKTp/v1Q0=;
 b=mttZc4Rf7gHAyTgoIHKh6vZzX1uikTAv4sPQJhTuAB06hmBa7Xs+KoVw
 hf7gzK48U0PmA665OgSomiL30FZXvYIqrnKzTsnYjl5bCJZym5yzeMIP2
 XWzhHNnEm8WT5VfRwAShRntSyifPi90oFA66LfNNrFiPnM999tKyAaR17
 bFzN2BhSU3KSQ9UdwjBl6gsqrfXKknnHJb4Puc+AEQry9+l5DjMY1zOer
 fPZMUtO8pvXY/cccBDv4F7ZNzCiSoofDJ3wAYPas2ypX1Dqr3ocHA6R+j
 j4gLqIhdzUCjT0NdG+9HP2+Om0psqIW3CBOcQ91naSMhH1z/JWGnmjHzs Q==;
X-IronPort-AV: E=Sophos;i="5.96,201,1665417600"; d="scan'208";a="329494667"
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2022 07:06:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgVSq+AMkDUysywLpeHsdVixe1mvscVANlRu0hMtDgOR0WPfoEC8dzs/4DI5SgDbhoC4UW/F5N+jyu9uvABTjIeO3cHA+Qv6MMnbLeguJwK7x16Uxt6hlBWswqzroKrTePlDev9POXlTk86bGJ1hFkdIW4+5bUU7MsHC3fJU88pt1INbnWNSccTp31byw/pS92kNkHqTJ97j1CEINx+8YzoUsrR64KUDEeKC/bBEsMpt/hcX/7atKSkfmg3hVVVH6V9QkcU+xWz9ecBEkqxCptJvshsmyqVVu0r3k54V/pUZaQHf7UAlfWvg1b9fWQGBm1BRZmRxT+OAepn5hTF81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ/qibJIfXbeg06azlan/xhGiua9dSpg+9tKTp/v1Q0=;
 b=cSq5+5m1gwYE/TU6GBckQ1Ptl2tN/mT7q/wrI6JYNeVT8MDWGf3WzZQV+TRCVckPw66gDrcHJ0i+gmRaP5rG1IoY3G9QKdy7vJVi1l5E9FgZtxP8z+9F1s226xBlRSu5myxPNEb/2WkY4EXMEB5LyMQO/jGy9d6084CTmMs/QS9CgitPW0FyD6b3oJomnWm95hAXA395cWs3WUoq1S6ZZfcNLxnNSXXXBYq6/oJQbBJZEcdWvI8JyDkZY9vyyqypJSM0iBIkwb7egrEWkKKgse+K5h49s3pq0qPyzgq7mj8Q4hD1TMKiANRCpzkAy/4Lc5FHugplAx96m4MWSx7O9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ/qibJIfXbeg06azlan/xhGiua9dSpg+9tKTp/v1Q0=;
 b=0JgVfttIGl0WBAHrwA5fR9ZKar/DmfplVVCZ6lOKIn85060yBnh4OM3D9/MAi3PPg4WlM/5hiWms5XhVEAk9O/KEU2RROBzHKBhyD1jjt5ifP6QcztoGcg7RDU5I9ezJlHSXcUIS4mMImrVyy9KxoHwNDb5tuK+T0FLbWBgUYEc=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by DM5PR04MB0442.namprd04.prod.outlook.com (2603:10b6:3:a9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Mon, 28 Nov 2022 23:06:14 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 23:06:14 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "palmer@dabbelt.com" <palmer@dabbelt.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 "liweiwei@iscas.ac.cn" <liweiwei@iscas.ac.cn>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
CC: "wangjunqiang@iscas.ac.cn" <wangjunqiang@iscas.ac.cn>,
 "lazyparser@gmail.com" <lazyparser@gmail.com>
Subject: Re: [PATCH v6 2/9] target/riscv: add support for Zca extension
Thread-Topic: [PATCH v6 2/9] target/riscv: add support for Zca extension
Thread-Index: AQHZAyWBK/m8H5sF9Ey+r0QDz0pVoq5U9bYA
Date: Mon, 28 Nov 2022 23:06:14 +0000
Message-ID: <421c4ba3559b6d83e8a348766b7a77f9e1268bf8.camel@wdc.com>
References: <20221128122913.55611-1-liweiwei@iscas.ac.cn>
 <20221128122913.55611-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20221128122913.55611-3-liweiwei@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|DM5PR04MB0442:EE_
x-ms-office365-filtering-correlation-id: ac061cfa-17df-4a48-9bd5-08dad1952631
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ycAnaKcgTxj664qmvXECb5BK5jxsYl6FgFYhiLRolPREbfx/4bypBkU3g8f6V8b4oS5zoDeL+RuTiuBE+tg9SGFF0MyTeaSiGGEJNmpxJgHQGGqJks1vP44mk+RPvCRNfBTtIvLgXBVqEX5G6ArTMkWJ4byTuO3vvjY23MbcWB0lnaS6M+hyfMwHZhe/oJE3aC5c7zeyJTMVZtt5MqmHxJ2KLnW6YN4dLPxnGZaq2akKIugkzoJJYyxDNo82H3E0ntGx+M7tDXo1kh6gZKkTC5Vz8myiVNeeASJ03s7BOSMtSfhSaSgvIy5ySHLHSFz1zoCKWOeZ12xtLJuRbR/et/yKU+ZAy5yKj40i7S54EJM1m16BvUAglWVJi1FnANCoTkzCAt2ni9vO3pp83vAidvL/Af1ZKky663w5+80G1iLVqzEcjJLY4umYLB+SbK8wfzeGosreJ/oCjPDJk+JvD9l921gu908e/o3q5CJDMMJqhhcMb3JrXeQyZ72/yoopapzjQnifBsQyqPffju0VcrNSjUCEPZvfBIFjG+IjOaUrWwvb+cpT+VUo9InsMXOr+kdu3vPiVX8kG6ES5rTmKIEWtLDrCGyZcV20G4OBZ0mXjzMovkXHzTL2XE32zOpzUCEwHWJWdAuinJ+dnj/uku7n1g8J6cIaZQfKWiUGVeFhh0pG+OYGf4Oqmj/cQArh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(66556008)(66946007)(36756003)(64756008)(76116006)(66476007)(66446008)(91956017)(4001150100001)(5660300002)(44832011)(8936002)(4326008)(41300700001)(86362001)(122000001)(26005)(6512007)(6506007)(83380400001)(71200400001)(2616005)(186003)(110136005)(54906003)(38100700002)(38070700005)(316002)(6486002)(8676002)(478600001)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEQwVmhkMVNocDREV0lhR1ExKzZETXEyeklNbWFuN2Z5cHVSa1JXK0s2Y0Z3?=
 =?utf-8?B?V2pySkdTbkE2Rm45WE95OTVPQ0laNUwvMWxLRFU3YWVJLzZZbWdSTzdtbmlX?=
 =?utf-8?B?c0svcUpLd3d2aFU2YkpQMDhvSDVkellNQjV1NjA3SnVEbnIvNDVBVWpwWkpF?=
 =?utf-8?B?Tk4vWC8xOWNpbTVmZnB3RDZvSzh1UDBSZzkvSnc4aUF4c3JUaG5XR0dIN28v?=
 =?utf-8?B?aHptUTY1UFpRNTlFZ250eTQ2YXRwYSs3dlJyK0V0aUNaRUIyL3BzRU84Vk13?=
 =?utf-8?B?ZVAzVVF1bnhjcnYydkYrUk10dkVBR2J6bktnSXNQYyt4cXlqT003azVwREdq?=
 =?utf-8?B?TGRIQVJOOEZzRHRTUmVneDhKQ0xQaVVIc0J4eSt2Rm9ZVG5mejZkRW1IM3U4?=
 =?utf-8?B?Y1JTcGJYbTlsem1rY3M4KzdSOHNQcDRTMmJBOW5pdFRMODkzN09vYndCNmV6?=
 =?utf-8?B?VDNKakNrakQvMFhNQUdpUFE0QlhpMnJNUkVzMzRlb3BsYnFOdTdZeUVNY0ti?=
 =?utf-8?B?SU1yWjByMDZnTmZVYkNRaVRuTmt2UHc3RFlETFdiYmhUZGpaWGhESDJXL3pp?=
 =?utf-8?B?NVVKZU11MDU5eE1sWlM4eGJ0YU14YUZZZ3hxZ01IbGdyTVFKQjVtWitZcG5T?=
 =?utf-8?B?UXR1U3lxSHJFTVVWQ254WWYrVTMvTEZXaFF0aTF2c3pCellIeXpiTFI2TEty?=
 =?utf-8?B?QVl3VitWbXR0enpZU2YweWwyM1JZWCtaaUkzcllnSnVLVk52MTJ3Y1NlVE41?=
 =?utf-8?B?QjhBbWZ4ZVpvbzFrL0NzZlFiUkE0SUp3bTBvRUNHMW9tMm5RUms2djBxMjdP?=
 =?utf-8?B?d2dVZ1Vmc2RVS2VXSGxhSlVuMWZrOHU2TEt0YWtjZG5OR0pqa2lFQ1dHenl3?=
 =?utf-8?B?M3BZZEFMVEh1VThwTTNqNUpFWURzZUNodUdDUUNDTTFSU1BadVduTXZJT2t5?=
 =?utf-8?B?WlBtR1dxVUc5eUtvY0YyOE9UU3paZ0R3N2NpRlBwVzFpL3ZwUVErOXZDc3E0?=
 =?utf-8?B?MXhqalFDNWRWaUhBYmZlOEU4Tjc2RVdPdlZERUIzc2FyWnJtejVJdmc5dEQy?=
 =?utf-8?B?eVhTYnlLUHJJQndaTytUUXRrV1QxYkRzS2dSOGFXWlY1NXFWQ2tIM2Q4T0pQ?=
 =?utf-8?B?TkxZYjBnREZxU3RHUjk1bHM0L1ZRak9IeW1QaUZBc3VkQ0xtNlBYVVc5b3o0?=
 =?utf-8?B?UytRUXprNU95bE5kcVEwZy9MbGptcjBEVVk3aGNUYUgvVzY0M2dJdWNJbWhV?=
 =?utf-8?B?ZXN5ZDFnd242RjFibElOMCszYzg5Q0VkUXcvbXprK21LcWZTaHQ4RXBOQTdi?=
 =?utf-8?B?YUFha0p4c2NpazNjbU5jQXg5MUhxWHRxUVRIc3VrT21EWFg2dFNEWlNSYmly?=
 =?utf-8?B?d29IVk5Ec0wxcXVGTjB6SDdyZmdObmdETXV6Ty9uS1BRZXFkUFd4eGNkay9i?=
 =?utf-8?B?dmoxUnI5NmJLM2Q4bUx0ZG9GYkJQRE8vbmdMYVBadjdqYkQrN0hOenA5VU9i?=
 =?utf-8?B?L1ltUXEvc0VrOVBzVDg0OUkrVzJ0Riszb00wTDdONGRIeWxZcFoxTG15YUc1?=
 =?utf-8?B?ekZkbnhzZVVUbjVpLzFnMG1neEpWV1JMVTh1NytQNnBzRGtURHgzWjlRVjdD?=
 =?utf-8?B?OVpBWGxwTkdQa0d2YVNBVEJ2WGN4eGhzS2Vxb1Bka1dnN3l0ZGRHUmVJU0h6?=
 =?utf-8?B?OTR2RG9haXZ2VzhDUUIyQnBHUm9IZ3BiZ054VlJBcnZDb1B0MThVdGs3WXhp?=
 =?utf-8?B?S21ZVGgwR0dJZ3NPbUJkbzIyQmdnYUNKNm8xdjllcUh3U2gvdWZ5ckNQNENt?=
 =?utf-8?B?YjFYb2lBaU9qZndZakxkZkJJcFh6aEJiclJRaGh4VndCN1dRdUNnK3J4dGJT?=
 =?utf-8?B?RHhYWk5zZEdxdVFETTQ1bFk0eENkTXBvQVBjUTNYVjdhbTNBVDBiSTNxNnNO?=
 =?utf-8?B?SFZZZEh4aGx3NEFpekpSQXVWVmtzN0JLN3hPK0lBNlRreFMwMGhjQWI0aS8z?=
 =?utf-8?B?SEh4ZWRadHNSWUdLNHVCUWdRTHhjSFhQUFUxSzlYVzA2bnZQYTZiclFkQ1U1?=
 =?utf-8?B?ZnY3ZTBBQnM1eHF4dGRPMXNGWG5tL0lVR2t1RDRLY3IycjdZRnNHUlUyc3k2?=
 =?utf-8?B?MERzU2NYTldqV3dHV01NMGltOTlORFI0c3lBbzJtM2ZlUVRmT0xPUjF2L2Fn?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C04E67E2159814FBE286A976427B2F0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ZVR5blVMcGh5WEk2T0R1a2d4ZTJUN0pvZjE0MHZ0QUhFN1hiZ1J6Si9VVXZk?=
 =?utf-8?B?ZWFCOS9kNnZXYmF1QWh2MngzN0VHdExyNy9HZlRnNUJpUy9FaWxhMjdoNWh5?=
 =?utf-8?B?SS9Da0VnQVhmY2VLcENnUnZaUjNkN1FWQ3cveTltTGVQOUd4NWhCejBqamxX?=
 =?utf-8?B?SVZMRWR1a3NiZExIN1YvQkV2dFU2UFYvWjBNdUhVNGRoQXc0aXJSRzJYTlhM?=
 =?utf-8?B?TVVGamp5MnA2TXFmTFEvU2Q1WC9vbFZST3IxTmwzMFlmcTNnd1NwWEljUnFp?=
 =?utf-8?B?ZkptWFNROXlnS1pmMEFQNkxYeERYY3h2RkdGOUgyUVFYanhJTlEwWlNKWFNX?=
 =?utf-8?B?Z2pDbXRVVHU3QkFGdlA4WEhZVTVhM2Z3SHFNdWR3Rk5DMHNjbzBlWmRRUFJl?=
 =?utf-8?B?cER5S21JN0NPWU5jSEw0Zk1hODFMbnpnUmx3Y2YrU3NmZ0pDSE11QXNYUlJJ?=
 =?utf-8?B?VzR5eE12aEx3OGFtcGE5cWt3YVNwWFY0dXo3eW1DQ3N1OE8rSElCY2xLQVhi?=
 =?utf-8?B?ejZTcVE1U2dlS3hYSzJPcjdmMmhEQVBRNVowTnB0NnhGdXZHMFA2WnZQNkph?=
 =?utf-8?B?WkVMUkVSYS9nYzV2aWt3SHlzWmNJaFBWSjJmNGFGS0RVUFhuL2JIekZBYjhI?=
 =?utf-8?B?bllKZHdpYS9UN3lQQXpjamVHZFpKNzJ0RHgrUG9jdUpJMjQ2M3B3UWZrMlZl?=
 =?utf-8?B?VHZiNmRzZWxOTEN2MmxDQ01saTFKN1dZcGFyQUpwVEhMaWNEaHErZG1xblpP?=
 =?utf-8?B?VHhFN2x2RGlUSGZidDlId2wzdkhEdkNBNkJhWnVQclBoOG1keVZRQU1TOHhj?=
 =?utf-8?B?eGlVM0M1bDlBM0ZRWURIVVF0R0ROblFpV2NpNWc2M1NxTWV1K0tqMVRmNm14?=
 =?utf-8?B?c1lIYTZuaTI1MnhtVndQYVYrMTBrUTlNd3pZN1Fhd3RkSjU2aHIwd25qM3Yy?=
 =?utf-8?B?WmM2Qm5FRkFRU1J2ZXZHTXNjcVNuUTNNVWNkbDVxeDZVVzZta3JXT2lrQlgv?=
 =?utf-8?B?MjBBUWROS0t6cW9uLzJWL0MwUFpWS1VzamltZEIxMlI0RXdCbzB6ZzRDT0ov?=
 =?utf-8?B?M2tkWVFDZ2IwbEF3akVBWWthODdmaTFyd1hWcGxIUWdiNUlKSjFwZ3dQNFYv?=
 =?utf-8?B?WlV0NXk4NFV6T3ltWTA5UXRaZ3pIRHhpRGNQcTdoaGVnV21jUm56N3VxOWMw?=
 =?utf-8?B?VVZUM3haVXFuRXZndEdWSzllU0hPajdmWTh0Mk5TaEx3Z0UvMXo1Y0hlaTNv?=
 =?utf-8?B?Z1hiSHV4UjBKdWJoeXZlTm1sSjhHWmNIbkxOY0M3WjhzVEc1S2gvd3lVMVJM?=
 =?utf-8?Q?lCHoEO/QsPLi0=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac061cfa-17df-4a48-9bd5-08dad1952631
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 23:06:14.5433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmODBbGbr18Zwnuo/hmh3fPMBSKNr+SzctBpRMHiKNfy9gq0b+3+ptGaVIgyqfbc6wIx1C3CF6ixpQ/lHeFgrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0442
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=324a54ae4=wilfred.mallawa@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Mon, 28 Nov 2022 23:06:28 -0000

T24gTW9uLCAyMDIyLTExLTI4IGF0IDIwOjI5ICswODAwLCBXZWl3ZWkgTGkgd3JvdGU6DQo+IE1v
ZGlmeSB0aGUgY2hlY2sgZm9yIEMgZXh0ZW5zaW9uIHRvIFpjYSAoQyBpbXBsaWVzIFpjYSkNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFdlaXdlaSBMaSA8bGl3ZWl3ZWlAaXNjYXMuYWMuY24+DQo+IFNp
Z25lZC1vZmYtYnk6IEp1bnFpYW5nIFdhbmcgPHdhbmdqdW5xaWFuZ0Bpc2Nhcy5hYy5jbj4NCj4g
UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPg0KPiBSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3
ZGMuY29tPg0KPiAtLS0NCj4gwqB0YXJnZXQvcmlzY3YvaW5zbl90cmFucy90cmFuc19ydmkuYy5p
bmMgfCA0ICsrLS0NCj4gwqB0YXJnZXQvcmlzY3YvdHJhbnNsYXRlLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCA4ICsrKysrKy0tDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2
L2luc25fdHJhbnMvdHJhbnNfcnZpLmMuaW5jDQo+IGIvdGFyZ2V0L3Jpc2N2L2luc25fdHJhbnMv
dHJhbnNfcnZpLmMuaW5jDQo+IGluZGV4IDQ0OTZmMjEyNjYuLmVmN2MzMDAyYjAgMTAwNjQ0DQo+
IC0tLSBhL3RhcmdldC9yaXNjdi9pbnNuX3RyYW5zL3RyYW5zX3J2aS5jLmluYw0KPiArKysgYi90
YXJnZXQvcmlzY3YvaW5zbl90cmFucy90cmFuc19ydmkuYy5pbmMNCj4gQEAgLTU2LDcgKzU2LDcg
QEAgc3RhdGljIGJvb2wgdHJhbnNfamFscihEaXNhc0NvbnRleHQgKmN0eCwgYXJnX2phbHINCj4g
KmEpDQo+IMKgwqDCoMKgIHRjZ19nZW5fYW5kaV90bChjcHVfcGMsIGNwdV9wYywgKHRhcmdldF91
bG9uZyktMik7DQo+IMKgDQo+IMKgwqDCoMKgIGdlbl9zZXRfcGMoY3R4LCBjcHVfcGMpOw0KPiAt
wqDCoMKgIGlmICghaGFzX2V4dChjdHgsIFJWQykpIHsNCj4gK8KgwqDCoCBpZiAoIWN0eC0+Y2Zn
X3B0ci0+ZXh0X3pjYSkgew0KPiDCoMKgwqDCoMKgwqDCoMKgIFRDR3YgdDAgPSB0Y2dfdGVtcF9u
ZXcoKTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoCBtaXNhbGlnbmVkID0gZ2VuX25ld19sYWJl
bCgpOw0KPiBAQCAtMTc4LDcgKzE3OCw3IEBAIHN0YXRpYyBib29sIGdlbl9icmFuY2goRGlzYXND
b250ZXh0ICpjdHgsIGFyZ19iDQo+ICphLCBUQ0dDb25kIGNvbmQpDQo+IMKgDQo+IMKgwqDCoMKg
IGdlbl9zZXRfbGFiZWwobCk7IC8qIGJyYW5jaCB0YWtlbiAqLw0KPiDCoA0KPiAtwqDCoMKgIGlm
ICghaGFzX2V4dChjdHgsIFJWQykgJiYgKChjdHgtPmJhc2UucGNfbmV4dCArIGEtPmltbSkgJiAw
eDMpKQ0KPiB7DQo+ICvCoMKgwqAgaWYgKCFjdHgtPmNmZ19wdHItPmV4dF96Y2EgJiYgKChjdHgt
PmJhc2UucGNfbmV4dCArIGEtPmltbSkgJg0KPiAweDMpKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqAg
LyogbWlzYWxpZ25lZCAqLw0KPiDCoMKgwqDCoMKgwqDCoMKgIGdlbl9leGNlcHRpb25faW5zdF9h
ZGRyX21pcyhjdHgpOw0KPiDCoMKgwqDCoCB9IGVsc2Ugew0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0
L3Jpc2N2L3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L3Jpc2N2L3RyYW5zbGF0ZS5jDQo+IGluZGV4IDJh
Yjg3NzJlYmUuLmVlMjRiNDUxZTMgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9yaXNjdi90cmFuc2xh
dGUuYw0KPiArKysgYi90YXJnZXQvcmlzY3YvdHJhbnNsYXRlLmMNCj4gQEAgLTU1Nyw3ICs1NTcs
NyBAQCBzdGF0aWMgdm9pZCBnZW5famFsKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcmQsDQo+IHRh
cmdldF91bG9uZyBpbW0pDQo+IMKgDQo+IMKgwqDCoMKgIC8qIGNoZWNrIG1pc2FsaWduZWQ6ICov
DQo+IMKgwqDCoMKgIG5leHRfcGMgPSBjdHgtPmJhc2UucGNfbmV4dCArIGltbTsNCj4gLcKgwqDC
oCBpZiAoIWhhc19leHQoY3R4LCBSVkMpKSB7DQo+ICvCoMKgwqAgaWYgKCFjdHgtPmNmZ19wdHIt
PmV4dF96Y2EpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoKG5leHRfcGMgJiAweDMpICE9IDAp
IHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdlbl9leGNlcHRpb25faW5zdF9hZGRyX21p
cyhjdHgpOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPiBAQCAtMTA5Nyw3
ICsxMDk3LDExIEBAIHN0YXRpYyB2b2lkIGRlY29kZV9vcGMoQ1BVUklTQ1ZTdGF0ZSAqZW52LA0K
PiBEaXNhc0NvbnRleHQgKmN0eCwgdWludDE2X3Qgb3Bjb2RlKQ0KPiDCoMKgwqDCoCBjdHgtPnZp
cnRfaW5zdF9leGNwID0gZmFsc2U7DQo+IMKgwqDCoMKgIC8qIENoZWNrIGZvciBjb21wcmVzc2Vk
IGluc24gKi8NCj4gwqDCoMKgwqAgaWYgKGluc25fbGVuKG9wY29kZSkgPT0gMikgew0KPiAtwqDC
oMKgwqDCoMKgwqAgaWYgKCFoYXNfZXh0KGN0eCwgUlZDKSkgew0KPiArwqDCoMKgwqDCoMKgwqAg
LyoNCj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBaY2Egc3VwcG9ydCBhbGwgb2YgdGhlIGV4aXN0aW5n
IEMgZXh0ZW5zaW9uLCBleGNsdWRpbmcNCj4gYWxsDQo+ICvCoMKgwqDCoMKgwqDCoMKgICogY29t
cHJlc3NlZCBmbG9hdGluZyBwb2ludCBsb2FkcyBhbmQgc3RvcmVzDQo+ICvCoMKgwqDCoMKgwqDC
oMKgICovDQpMb29rIGxpa2UgYSB0eXBvOiAqYHN1cHBvcnRzYCBhbmQgKmBDIGV4dGVuc2lvbnNg
DQo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWN0eC0+Y2ZnX3B0ci0+ZXh0X3pjYSkgew0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2VuX2V4Y2VwdGlvbl9pbGxlZ2FsKGN0eCk7DQo+IMKgwqDC
oMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN0eC0+b3Bj
b2RlID0gb3Bjb2RlOw0KDQpvdGhlcndpc2UsDQpSZXZpZXdlZC1ieTogV2lsZnJlZCBNYWxsYXdh
IDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4NCg0KV2lsZnJlZA0K

