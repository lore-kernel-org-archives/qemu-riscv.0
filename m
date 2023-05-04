Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puMwG-0004P1-SQ
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 20:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=481b59591=Alistair.Francis@wdc.com>)
 id 1puMwE-0004Og-Qz
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 20:35:15 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=481b59591=Alistair.Francis@wdc.com>)
 id 1puMwC-0003tN-38
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 20:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1683160511; x=1714696511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qa0UiSsC0NCKNasp3zIgotISEgiKHDGPB58AnGw0fEI=;
 b=FK49ry8Ia8uJs19GQoN6tiZ37JYSgfhP0byNspdQwwMd490cTZHLCFpm
 c4+CijN9pujpW92PH+z3TVPS/vHanW6ri2jNIMifwbjBz6IvlGxGraBxu
 ZPUhCXaeNiPQUAacg3Oc2DPVfh1zHo9my7mRF8T3aq4BvPNnFB8pdKLMu
 hGWrn5fnUbfVXNluE7fkgg9Um+I6NnqLUsXWBqXSrFBg+vJkcUXhCBngi
 fVBla1J537R4NzUYDia/l48dnaK+Tiq6ERdoXcBQeXglKRYV/+CjCztH8
 drtNQpaPiMcIC9ZSHaabyiTugSthakv3VCfHl/sUReHBkiTb5/D4Z1PbT g==;
X-IronPort-AV: E=Sophos;i="5.99,248,1677513600"; d="scan'208";a="341876065"
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2023 08:35:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZimECuv4CKMmpLcBayO47vtRAdGuhFeUlA8TEcDQo3VTJDj8gkL4X5wQRdLS6ZeuxxMMJbjIMuxKvZ5aK2jHiaJiaQh2U/BUgWXAeuFxEEHaWCgWSSHD11q+qG6rGWKAAAXtmlMcy0ROgtYHV0uj2FWj3B61H95EN9TOc+IaAWcnWQ965gsyGKr0TWcVo0q3ZXk2eIHzSisNnLXSLZuQ0gpxkcadB4bSpM5/zU08rHKa9dSKirmMreAY4tPgRTgwjZjGt5XMI3qJ66bnfVRKMT/lOuhAMS2Y/DRDyzVP5NV4QxtJuMyX9eC3z8axvfFDFO2hgnFFQEMv1gA/LK2Mwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa0UiSsC0NCKNasp3zIgotISEgiKHDGPB58AnGw0fEI=;
 b=VqQ/S2onGax8NafDKh3/b46zocr1zOrfuEbVXYNpECloQihVfTInqOmxJlPYTeDhko48MOas7YiFWqbI/sXhoLd0rAgomwmy1mO9lfoV2DC/8FsvsCfUAhZIa63JPB0FCiNNnDzP6xCLVLwdERgXsPhGltwxTTWc4p1cOUIrvkZmhLjzBzkZIQx7bQVg/sEbOat5rA3fQjNOE6ni7byalb97cnuBg20lZNJhAn23+8hElz8y4XdStcO7i1WzB14K0VVCyl0LV1si7Md7smIsi6S5kLlwLjK9ClZY/EXDwi2eN8yTOgjhbcniBFj4C5/Gdsq+Fjw9ngVrtkRb0ujxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa0UiSsC0NCKNasp3zIgotISEgiKHDGPB58AnGw0fEI=;
 b=PRlZAsgHryuSVdOQc99DyJoSbqpvXAIV6jCiWEeLsjo4D0do2dgCuQbpqlBjVtMW1OMoYQFS7qr5Mtq/0sENqr52gdexyX4ZHtwJY/WMMlafNwtTXJVUrZqj/byk/8A9T4xOTsrjPJpkwO877ttRpU29LhnWidqb93ApDKQRkPM=
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com (2603:10b6:a03:303::20)
 by DM6PR04MB6394.namprd04.prod.outlook.com (2603:10b6:5:1f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 00:35:00 +0000
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::a6cc:777b:f631:2a7e]) by SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::a6cc:777b:f631:2a7e%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 00:34:59 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: Atish Patra <atishp@atishpatra.org>, "sig-qemu@lists.riscv.org"
 <sig-qemu@lists.riscv.org>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "alistair@alistair23.me"
 <alistair@alistair23.me>
Subject: RE: QEMU SIG Meeting
Thread-Topic: QEMU SIG Meeting
Thread-Index: Adl5d3WEYXigVKyHQyaMjKOJ2jvZOAAAdpLQASj814AAALq34A==
Date: Thu, 4 May 2023 00:34:59 +0000
Message-ID: <SJ0PR04MB78728BA9A1105067AD238C62906D9@SJ0PR04MB7872.namprd04.prod.outlook.com>
References: <SJ0PR04MB787223A0357CF1901224B0AE906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <SJ0PR04MB7872731EEB43478A94698A34906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <CAOnJCUL3ou38Jw3MRExp3j64-tqQP0cPvbgF0Sk2izcCTn+X5Q@mail.gmail.com>
In-Reply-To: <CAOnJCUL3ou38Jw3MRExp3j64-tqQP0cPvbgF0Sk2izcCTn+X5Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB7872:EE_|DM6PR04MB6394:EE_
x-ms-office365-filtering-correlation-id: 6ccbc27e-d431-408b-bf64-08db4c37648c
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IpWj0Q7A2p4tU4hZSKzetxQTSycPLsxoeHi6c2oaT32cnb0uQzU2GXCO2b1OJzp2HFPxXrAtZAg2J86ya69u9MAWe81Fg0zRy/7z5dVOQSQEMb2596H12L1pXQY+gHljro42LOh8sHxCvefNSoLofz8iHqKFcc51IrcgqgBp6wUbqemqjF2qrzycnCByVTkNhn4I350i3jODTlvjITXqWdO9E3fDVRKD6HvnhGyPH6SR2IY8H+JasRwvfOzIToGD4S6uXgf8TG1/U3VosfVaQStXQyi9hHy9lwxu992cnqvt4GQZvrTKPbs8KA5FBBf+pLoo1O+2pk8LKdzxhG5SZiDYJaFN8VYFo4lZcRw6lEovmutk9Y8EDRrFI0UWBjfbe+D+5L/ZNWiihN1jqNFh32h3qZ4gb6nUNAe/RihbHudg08qYDhBGLfm45oxtJLryDNbsanBbcKC9BQpJqMA7OOqc8kAskxXGdJEXiAYYiIU7GKo7vLKJQA6w0soaf14MTkyKvLja5lIIK5+qbThfFwaLT57939+U1gASgBVuoDYLJ5EawtT5s4V/8rbXn3TytMU0OwAmQc312kGCxifyOhptcNiPSwHpZEYvO/aYnff4Dvm8QJKLf5krzEpctTLQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7872.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199021)(52536014)(7116003)(8936002)(55016003)(7696005)(71200400001)(4326008)(8676002)(86362001)(316002)(33656002)(41300700001)(38070700005)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(82960400001)(122000001)(5660300002)(478600001)(38100700002)(2906002)(83380400001)(54906003)(110136005)(9686003)(6506007)(186003)(53546011)(3480700007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zkd1a3dxK2lFN0tDMDBNb1lqUVEySjFzT2FQR2JmbEpKMUgyc0lkRU5HMmtR?=
 =?utf-8?B?Z2JUOEdvMkdBSjAwc2c5U0owMFNYUC9ERFRGd2FwREhKZlpOZWZzSU1pcmlT?=
 =?utf-8?B?Ukpjd2NaY0tTMm8wREhEeDFXOUhQNG16UC9KaFhsTkNNTE1NVHI1YUI0MStZ?=
 =?utf-8?B?MUtYN1dLK1A2MjNTN1Y3UW00NytZOHdZZ2x3N3MyempjcmZyZlVSY1pKakJo?=
 =?utf-8?B?dkxNV3VrckxTZjJqZFREUVY0ZkUzZCtwZHpKUllnRE5CalhxcDRxK25uNlNS?=
 =?utf-8?B?RXRLTU53cTRWZjVwYkdKTXlSUWEzaHVhT1JUMWJMQzFUS3FZaWM5dEkxQ3I2?=
 =?utf-8?B?VXdPdFZJZDN5TlZZelVwcVkrZWNQYmpHRTYySm1Jckp3OHd0VUpIV25zazJZ?=
 =?utf-8?B?dWJURjlRZnNKR3BaN1hUazZpU0Q3RkdRRXorbXVycTJLN0VrS3E0akgzSDJI?=
 =?utf-8?B?bVY0L3h2cVRMdks5RmcvNDFNbkVGallmaEQxKzk2VWtVakRoSzNZWVdHSVN0?=
 =?utf-8?B?cjMwMjY4M0JVeVpiVGpiZ0NPb3dSS1pTejgrandUdW1KcjRULy9XZnQ1cWxS?=
 =?utf-8?B?bndMUVJ0b25CRW5rVDhpNm13SWlva285VnFJV21mdTN3bU1lV0o2ckYwem5t?=
 =?utf-8?B?cEw4V1RPRU50YmdCektmWnFCMEh6VWhhOVF2NWcwU3FTTFJRS1lHL3pzSUh5?=
 =?utf-8?B?NHZ5a2VwTUZyMTdqNUR2YlVVMjBvSXpjNWRpSHVjRDlZRm1rUkx5TCs4K1ht?=
 =?utf-8?B?ekNlVk5NWlFhd2hsOW10VWJIaCtKQUNqT3lZWUJac0ovUmZyVHNySEhGWEEw?=
 =?utf-8?B?a3pkQnRta1UxcmltSDVxOEJSZmt6dGIvMFpUVGdhc2JnaUJDZVUrQytUKzZM?=
 =?utf-8?B?ZFFreFBFdnZwWHNYeWMyQlo5UkZIVC90S09ZNmJ2ZFYwVnp6VWY1cnlicFZU?=
 =?utf-8?B?MFhNOUtzWVF6WlZuZFBCNXRvaHozTHR6NW4zRDBQU2xtNGZFUWdQemo1ZzZn?=
 =?utf-8?B?Ty9NSlE4QThkUEJKcHFBY0h2cUw3dFQrYTZDSW5OeDUyUVB2NVhGZ2dhWVBQ?=
 =?utf-8?B?NVl3bVJESDRQa2MzSm90aWVUVHZVR0FsR00xK3VjZXczV1lVK2NVVVlJR09I?=
 =?utf-8?B?K0dQOEdmOUlVR1o5b3ZmREI3ZVg1bTJwTExuRTk5bDh0cXdEK2ZhM1dRQXhX?=
 =?utf-8?B?TDFZRzdqeWxXa0RyL0pJZGlUbXhpQWtmUDVQeEkvbk9sNDE4N0lqRzZzbWxR?=
 =?utf-8?B?dG11U2xmWFlPRHhtaDd4RzVPZVVYTmp2L3YxK254ZW01M21WM3pBZFplWllG?=
 =?utf-8?B?NjhKT1NhNnhrTXhYSFZYUzZXZ0xiNWNoMEVKRVhDbkltODE3b2lsRUFuK2dT?=
 =?utf-8?B?RVpTVHhQQ1lvRGFDM0d2S1RxVmMveFVNLy9IZ2htU2NKbUxiYVFmSXB6Nk5Y?=
 =?utf-8?B?K3U5ZnUrbGJNblFzM3ZHUzMzbTVUbEZPZllUSHJ4S3l4SXNrZmMwV3pVMW9O?=
 =?utf-8?B?WXhPbmVXTTlaN0U5SjNVcW5aQmFZSHJLcXB5azZwRHBnZ1JyVFFWTUNRQ0tp?=
 =?utf-8?B?aG5GOEZpSnlpTnRhN0Jsd0U3aWxzSjR1ZlVoai90Yi9vdTBqNnYwSjhCODdn?=
 =?utf-8?B?S2MrQlMwd2tBbDlLRU4rVzVLYng0dVFWbWNxclE4N2tVSzNmTUxhNEhxNjR3?=
 =?utf-8?B?VVd3bWh6NHl0OTIrS0VXeThtVEhjSWJGcVFBUlR4Y1pLWUhVVEtQaWdpSVJ5?=
 =?utf-8?B?QmtJRGlwdUNUVzZpdXIwTXRRSTl4RnhidlUrSU50SjVUcEJmaHRFd3VNL21s?=
 =?utf-8?B?S2tSRFBITkJjM0I4SzA2T0Y2Z0h6KzUwbDRvdFJKZ0tNNVlmanpydEl0T21x?=
 =?utf-8?B?aFM4RHpxRUIvdzB2VzVqcU85RTk5eWxlR1RLOWhSMHM3bU0vZ0h0VitYUXcx?=
 =?utf-8?B?Sy91clRmQ0ZldGhueEl4dkplMTBkR0VYbHdtd29iS0sxSG5SNWpTdUZ6UHZM?=
 =?utf-8?B?V1dGaUJ1ODhPclNZUlBwWHI5elBKOE1IODczMXdtSWw5S1VFRjhvUE1aNGov?=
 =?utf-8?B?Mm9od3Z4Q2VxZmZ1UDBDNzZXVkJVMzZvN1NvL3YwOGFneGFiTTZjUTZkVTBK?=
 =?utf-8?Q?TNHODHhFy6j4eR6TmsqWmmpZt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dx0QM0iKAJEj5ZCdfP/vLyl87LuoPluIb+hqm9ZAOi2cu3cEe44Dp4rUc/3aAkHrux5SOvL0mkNwq4YtluatX2F0KOWEC4NpbbjyjN7R0H57vpanawgMrESuW+7yNPRwbl3JYaP9xaZk8CZRVs16scaOwS4qdKphhq70M8kt5tr3cHb3l9c8YytlEgSOsxwa8dWDiZo7mZV8EI5gjBeS4p3i+fpmF95q9vuj/PTE7aaWnl/FHcaAlFv/ezFBp0Yo6vlcOIVxKZJkuusGbMNFlsOAfGcnrkrxDJvi4HT+NYnX6LjBuk5mFaCwxFaL5FK5a9xhbOlaoa4RPuXyb9OvaHEz9LYuK1JJMrtf8JDh0LMJikHuuYdHULlHdVNkZKYIITEpYsA27Zuum/bzV+q+GZLVi463CZwtW8hMlNgzczzfbRKJ65v5DBrSus0fvzDlgqow//nRck4OVYiaL6rKfmwhBAaN0sIfTqmqF9M/JXN/JLadtrZLN/QqIwmu3efBRdJKHi2yVKK5bAdFiWJaNdZ5n3Ks53rOYUKYLKpK+R11KF59YfFgb2PSASKJWpbx+i29xmuMq6l8hneFj+i7duLBwm0YNPUrad7ktJp/dL3RKYueS1u0VscoStsd2VaJ/RXaM60HpdOpMbouxiEDePycQ1fRPS9HdaC0F6zL1zPL9cZohi2JZaP7M47JNaT/7Pgwv4N+FCakx9soxu7iFFZ6HVQt+vCDEf2PuH1z2TaL8AdCK9O1yCPRiXqd7HFjmpTBSLMiSzt1zZscSPaLzJOxLF9BhAeo5iFr2fFEgewfIGrKhrYOhUnE7ELn0nymv6l5TA8Yuwrv0aOdud7bfV9chZOIZljjBiwJg8aetD4yGVM1e68jpkvEUtk4N50A
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7872.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccbc27e-d431-408b-bf64-08db4c37648c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 00:34:59.6557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6DrOl6fnVEt/a5z8N+PUG0QOdPWynM+v4G14NB8YSD1aJu5TmjopyeA6/60lqYkm2ombNRRrx3suoIFFqp6Dp6Gr+dFPme0GF+ZuS4Hynk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6394
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=481b59591=Alistair.Francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 04 May 2023 00:35:15 -0000

SG1tbS4uLiBUaGUgbGluayBpcyBpbiB0aGUgb3JpZ2luYWwgaW52aXRlLiBJJ2xsIHRyeSB1cGRh
dGluZyBpdCBhbmQgc2VlIGlmIHRoYXQgd29ya3MuDQoNCkFsaXN0YWlyDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNocGF0cmEub3Jn
PiANClNlbnQ6IFRodXJzZGF5LCA0IE1heSAyMDIzIDEwOjE0IEFNDQpUbzogQWxpc3RhaXIgRnJh
bmNpcyA8QWxpc3RhaXIuRnJhbmNpc0B3ZGMuY29tPjsgc2lnLXFlbXVAbGlzdHMucmlzY3Yub3Jn
DQpDYzogcWVtdS1yaXNjdkBub25nbnUub3JnOyBhbGlzdGFpckBhbGlzdGFpcjIzLm1lDQpTdWJq
ZWN0OiBSZTogUUVNVSBTSUcgTWVldGluZw0KDQpPbiBGcmksIEFwciAyOCwgMjAyMyBhdCA4OjAy
4oCvQU0gQWxpc3RhaXIgRnJhbmNpcyA8QWxpc3RhaXIuRnJhbmNpc0B3ZGMuY29tPiB3cm90ZToN
Cj4NCj4gT2shIFRoZSBjYWxlbmRhciBldmVudHMgYXJlIGNyZWF0ZWQgKHRvb2sgYSBmZXcgZ29l
cykgYW5kIHlvdSBzaG91bGQgYmUgYWJsZSB0byBzZWUgdGhlbS4NCj4NCj4NCg0KVGhlIG1lZXRp
bmcgaW52aXRlIGRvZXNuJ3QgaGF2ZSB0aGUgZGlyZWN0IGxpbmsgdG8gem9vbSBvciB0aGUgcGFz
c2NvZGUgZm9yIHRoZSBtZWV0aW5nLg0KDQo+DQo+IEFsc28gSSBoYXZlIGxvc3QgYW55IFJJU0Mt
ViBsaXN0IG1lc3NhZ2VzIHNlbnQgb3ZlciB0aGUgbGFzdCBtb250aCwgc28gR3Vlcm5leSBpZiB5
b3Ugd2FudCB0byByZXNlbmQgeW91ciBlbWFpbCBJIGNhbiB0cnkgYW5kIGhlbHAuDQo+DQo+DQo+
DQo+IEFsaXN0YWlyDQo+DQo+DQo+DQo+IEZyb206IEFsaXN0YWlyIEZyYW5jaXMNCj4gU2VudDog
RnJpZGF5LCAyOCBBcHJpbCAyMDIzIDEyOjE3IFBNDQo+IFRvOiBxZW11LXJpc2N2QG5vbmdudS5v
cmcNCj4gQ2M6IGFsaXN0YWlyQGFsaXN0YWlyMjMubWUNCj4gU3ViamVjdDogUUVNVSBTSUcgTWVl
dGluZw0KPg0KPg0KPg0KPiBIZWxsbyENCj4NCj4NCj4NCj4gU29ycnkgYWJvdXQgdGhlIGRlbGF5
ISBXZSBoYXZlIGhhZCBzb21lIHRlY2huaWNhbCBpc3N1ZXMgb3ZlciBoZXJlIGFuZCBJIGhhdmVu
J3QgaGFkIGFjY2VzcyB0byBlbWFpbHMuIEkgYW0gdHJ5aW5nIHRvIHN3aXRjaCBvdmVyIHRvIG15
IHBlcnNvbmFsIGVtYWlsIHRvIHNpbXBsaWZ5IHRoaW5ncyBpbiB0aGUgZnV0dXJlLg0KPg0KPg0K
Pg0KPiBTbyBhIGZldyB1cGRhdGVzIGZyb20gbGFzdCB0aW1lLg0KPg0KPg0KPg0KPiBGaXJzdCwg
Wmhpd2VpIGFuZCBJIGFyZSBzd2l0Y2hpbmcgY2hhaXIgYW5kIHZpY2UtY2hhaXIgcG9zaXRpb25z
LiBJJ20gbm8gbG9uZ2VyIGEgUklTQy1WIGZvdW5kYXRpb24gbWVtYmVyIHNvIEkgY2FuJ3QgcmVt
YWluIGFzIGNoYWlyLg0KPg0KPg0KPg0KPiBTZWNvbmRseSBsZXQncyBhY3R1YWxseSBzY2hlZHVs
ZSB0aGF0IG1lZXRpbmchIEZyb20gdGhlIHBvbGwgdGhlIHR3byBiZXN0IHRpbWVzIGFyZToNCj4N
Cj4NCj4NCj4gVHVlc2RheSA0UE0gQUVTVCAtPiBUdWVzZGF5IDZBTSBVVEMNCj4gVGh1cnNkYXkg
MTBBTSBBRVNUIC0+IFRodXJzZGF5IDEyQU0gVVRDDQo+DQo+DQo+DQo+IFNvIGxldCdzIGFsdGVy
bmF0ZSBiZXR3ZWVuIHRob3NlIHR3by4gV2UgY2FuIHN0YXJ0IHdpdGggZm9ydG5pZ2h0bHkgKHNv
IHBlb3BsZSBzaG91bGQgYmUgYWJsZSB0byBhdHRlbmQgYSBtZWV0aW5nIGEgbW9udGgpIGFuZCBn
byBmcm9tIHRoZXJlLg0KPg0KPg0KPg0KPiBBbGlzdGFpcg0KPg0KPg0KDQoNCg0KLS0NClJlZ2Fy
ZHMsDQpBdGlzaA0K

