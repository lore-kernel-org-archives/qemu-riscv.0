Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puMyI-0004cF-9H
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 20:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=481b59591=Alistair.Francis@wdc.com>)
 id 1puMyH-0004c1-61
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 20:37:21 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=481b59591=Alistair.Francis@wdc.com>)
 id 1puMyC-0004Mg-2g
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 20:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1683160636; x=1714696636;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J7fw6HkNZkeB8RpwoD9CSxkE7gNdW0JGE9iVbSvF/+Y=;
 b=ivdUw1e1iE/tV43qpGb8cw7D1KljIkyOpzbVt/GYAU7xsx/P58iKBA+M
 dXWRvkDc0CizE881uxYrJ2q50Gj44nKLpdG7WeyFvc/+hXmxQr8wIJrMT
 hjpPfcF2wBn9bsuG9KRAKqx6oo+Ba6uV/oSR3cMPHEIT1jpkYhIFE7jzB
 1vPKzUTbMHifWzqyaK+2VkrarkxktHxolmreE26hByjRB592KgLEg5GNf
 efYHY3kD/u1kRUUVkPj+bHPufi5OFRFs0KFWdtF5mzszLJrpu+YeiHFtg
 prKOxXSmO4mE7cMFLTN8w+V7D75ud+DSutWm/8X1NCgkucnErs9xmq/DW w==;
X-IronPort-AV: E=Sophos;i="5.99,248,1677513600"; d="scan'208";a="229727953"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2023 08:37:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZmvlgOu32OmLeUoEryePIr+NEKFHnJF5iptq/tXoIGvXomRvt9G/lmb1zd6x/YWDna2O2An9pPuIO+OqbHZoM9enjFMrp6/DsqGxZy+7qPHTwOYYeeTlI5Hu2TJI2HaYaGcKb/3260qp6pOvS6tV4sSFIoB5nlaadNw0mMRyAsyOVdeyAapIauCKoHkxSLQj38VSjjwA59dWboDkEHJS2lo/UFFkX2YeiOIRRBIxpBTsRqn/8SIYEeA9kps7Mij680iuLZHFPBa8QkhqsK9lEDUKwfPpgVEahGVWzZFM/AbdRn8Cac6xIPpnZbOHRnpFKPh5TqbPe6GQ6yMmMalgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7fw6HkNZkeB8RpwoD9CSxkE7gNdW0JGE9iVbSvF/+Y=;
 b=FFjUA+c8HKQ3ZcUjXM501DSOiG9z8uVS5FnNLqrfmOLU7k5wMC/PDHfJpXR8BAxDDqr+Ot4oXDcChYlX6IndOzndveqXOosSuI0i8LKezgOBMUo4hKN4rTU+UWUtD9qa/fYBQd//Y8qvmL38tLNo5DYfU21dSIjxiQiZTCA5nDhiy5aVvOO5wnv7CFvyXMOnpvUG6XtWsT7srQP9mZNNYlMo9PL3CTs8/rzxgUoHf7Rtc2Lblfl/94O/I07fmsJU+K1jXt+AAG7Hwu2wRfxlVi2SW2yoc4WgJ86TzxuWppARRFVJtRBh9FQAmDmlKeEXGqkbeFG7EdndAcONMMOgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7fw6HkNZkeB8RpwoD9CSxkE7gNdW0JGE9iVbSvF/+Y=;
 b=BhzOMcj+BUlHhH2dipFc4B+a8RHFJw3OyFQoS2lLD+JfVbX6z5c/TJG67DW/JAdtZRLOfX2Y9OuwqvT4NmOIL2QOHcMDDtjIf53FWANrWn1n6qqjQty6QR02fs3Wpxhb8vwo4x0snKPCL9Jkf3Hsur6CNODnG61yUrC2+UoXUN4=
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com (2603:10b6:a03:303::20)
 by DM6PR04MB6394.namprd04.prod.outlook.com (2603:10b6:5:1f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 00:37:11 +0000
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::a6cc:777b:f631:2a7e]) by SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::a6cc:777b:f631:2a7e%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 00:37:11 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: Atish Patra <atishp@atishpatra.org>, "sig-qemu@lists.riscv.org"
 <sig-qemu@lists.riscv.org>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "alistair@alistair23.me"
 <alistair@alistair23.me>
Subject: RE: QEMU SIG Meeting
Thread-Topic: QEMU SIG Meeting
Thread-Index: Adl5d3WEYXigVKyHQyaMjKOJ2jvZOAAAdpLQASj814AAALq34AAAF2Vw
Date: Thu, 4 May 2023 00:37:10 +0000
Message-ID: <SJ0PR04MB787226486E2F78B2693FDCF1906D9@SJ0PR04MB7872.namprd04.prod.outlook.com>
References: <SJ0PR04MB787223A0357CF1901224B0AE906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <SJ0PR04MB7872731EEB43478A94698A34906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
 <CAOnJCUL3ou38Jw3MRExp3j64-tqQP0cPvbgF0Sk2izcCTn+X5Q@mail.gmail.com>
 <SJ0PR04MB78728BA9A1105067AD238C62906D9@SJ0PR04MB7872.namprd04.prod.outlook.com>
In-Reply-To: <SJ0PR04MB78728BA9A1105067AD238C62906D9@SJ0PR04MB7872.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB7872:EE_|DM6PR04MB6394:EE_
x-ms-office365-filtering-correlation-id: 99de2456-7ebe-45f4-4107-08db4c37b2c4
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cCdRSOU6gFBg9saR1S36DvDWPReM3elNKRYb6clxKxsa2nbMNcElDgjrDZo88mYbtTB9/0jeDmCKlTnwX89yV9JfZerRM/WQySo6JDZpF2NMer02j6GxJIgNE5xBp12NkCpdoszhirqf4jWUH/aGsEE2eW5HiZMLluYNDcoz92wkIR4uiyXqBL+n3NIp3lnY9SUEUhc54vfnjmNxUmJD9jKjV6csTL8KI4UTs/7Nw3VJ9R9gAmS6khW5B+01cvJhQRCdp7JNPj9/e4er1P49riyzENVJzSqHedliGy+b1uC0oecxEGtxFfSSd5b6mJ0Q8u95TlpvkDYpjjqqmXeGVEN/mjaKnO1tabhE6KGA1WZZwk/DGSCqopn5Qe4gQ5Y+TqRzu6jd+vk+ZSPOOOSGKKbSopJHCDoD8rqXgMj5pN82OxxwNUGzLtY3xVCWYhrASiDa1ats6mOp3i0nbE8Bo8VNXsSG74uRbhYX8Cs1iJbUXwGv3sbq4bDr5H4SX7ozlAnwjF7Q8Zq76lNRopGa8gCtURrXGxGCxy1F8AV5/GCazkNiVnn5TmMe+UogFRtmpJEKezO5PtUfnLiLEsS3uvl1vdWZvAPmYAEnB5C75BQaHMeV8A9f4Rw0adE7tIKo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7872.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199021)(83380400001)(54906003)(110136005)(9686003)(6506007)(38100700002)(2906002)(26005)(53546011)(3480700007)(2940100002)(186003)(7116003)(52536014)(122000001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(82960400001)(478600001)(5660300002)(55016003)(8936002)(33656002)(41300700001)(38070700005)(71200400001)(7696005)(316002)(86362001)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJ0ZlVZQklKOHJUNlpGL0E3d3R1ZWpOa05nV2RoRUZZOUZuSXJKeFpGY1lk?=
 =?utf-8?B?S0o2NU9ZSUtsSjArK2YrTjJKbTF1NWVsc2kzZlh4NkVpUSt2Y25MaGp6SUE2?=
 =?utf-8?B?UXF4MnIwTUFJTjhwV1BQK1hSeHArYVdLa2VyaFRneVAwWGFwdjZaZDFMYVY1?=
 =?utf-8?B?eHluQkdPOU8wSWwyYjdmZWlwWEV0UWxra0RtWHdKdXZqSldrMVk5bkZNd1FM?=
 =?utf-8?B?OUV6WTRucWdlWHVEdG9KR3NyaW03Q2duaWtIZ2JFVm84eFJFczNpdytFR2cv?=
 =?utf-8?B?M3VjbGgrRVpia1NXNUtyVGFLcUwyWkFkLzcxQjU4eVVYNGFYemZrUmFsOVRq?=
 =?utf-8?B?UkQ3Wm1aMjYxRENicjJVQTdiNHE2a1M2MEVBVWkrMEUwMWhpYXpMbFo3UHFP?=
 =?utf-8?B?ZDRHb1lwY1ZMRlJHZkY3Mmw1MHF2ZWU5cVBRWlZtVmxkeUZTSGloVHNDK3E1?=
 =?utf-8?B?T0pQUFRkalZsdkZTREZ0K3ZGUC9mRkdQeUo5TUZmYWVQY20xbHg1R0pxVlo0?=
 =?utf-8?B?ZUdMRHVIYWxXbHZINkZwa1JNYm14azM5YkYzQllVVEcydi81R3M3NzBjUFhs?=
 =?utf-8?B?bmxKdU1VZDRaZXFYWWpRWlBXUVdwT3hhUU9kOHJOcjhCSGdoMFlIQ1ZZYlFw?=
 =?utf-8?B?Tk1XRVJUTGdwSWVqZWMwNVY0bDdFTkdOYXFlUzlkdU9KTFhCcVdoM3BCRkdE?=
 =?utf-8?B?K1NsbUl2NUFXalc1cm1BTHpJWFVpcUx0azdZVGhVNDRHQkFtMnFHcW9tTTlQ?=
 =?utf-8?B?ZURjSXN4aUYvdUVjb3phSXNTVGpLN3cxOTdieHFGbVBSOSs5dC9uKzk4ZWFN?=
 =?utf-8?B?eDFFeFNSYlQ1NUs4citwcVNnM0Z4ckxzb1BQZ1IwQ2NNeWplMjFFRDlJUG1Y?=
 =?utf-8?B?eDRvT0x0OC92TnV1am9JNElHM2ZyNytxdkNrSGVWTkxnRjdGa1dDNG8zZU9V?=
 =?utf-8?B?dHh0ZDlOSDJUMlBlL0E3TnAvWHJkT0gwTU9TYS9rK01aa0ZXaUYvcFF4amVn?=
 =?utf-8?B?OWpPZGhpWTNOQzFlR1F3WmRMLzR4Rk9JU2xKQ3F3ZU9FeHVwQW1UVGRnMmxw?=
 =?utf-8?B?RytZOW0yT3BkWG1vamkyMmNCMU42VDNmOVp5Vm9sdzgzZWI4ZjZSUkFMeUJr?=
 =?utf-8?B?b0dYdkZBWGNrc28wdFpPL28zVmJGdXpRTm9uSXNRSjR6YzBLc1RyTW5vRHc1?=
 =?utf-8?B?a1B3eGYycUVzVHVhZU1LYjZwUzZRQ3dUQ0s1RXR2WlBYM2owekFRdXB6Ymc0?=
 =?utf-8?B?ZG5kS2RUK0hxcnpCNVVucjJQVUdWYWRHS1V0U0dTM1UvL1J5M2wrMk5UYnl4?=
 =?utf-8?B?Z1JSSDNiczFGc3RzR2xnSjROd0s0MTdXSzRnTi92M0o1dUdmQ25RTURTZWFK?=
 =?utf-8?B?aVlvZTRpRXVRVEVnLzBNeExEMXV1QXMrS1Z2bzAwVU9Xa0I3L1JZSkxWTjR5?=
 =?utf-8?B?REdzQWZ2b1Uyd3pJVGJFV29tNnFyK0FLckFKcnZtM1pHMzA1dm1qOUlGVmg5?=
 =?utf-8?B?U3cyMGUzaVhZQ3dpdWxFTEg0SGg2NTJnS2ZESENPZkFUQXhNUEJXQlZNb202?=
 =?utf-8?B?R1crZlVvUVJ3M2tkWC9hcS9XdEMvMy9WaHNGK3Z6VDZCeitJK0ltUTZVQ1o3?=
 =?utf-8?B?cVRucXJvSlVpbjZBSzJQeU1NSEpMOHV0Y0c2NCs5UFJEMlB1a1o3VnUzZWJn?=
 =?utf-8?B?dUViY241WStMTlQ4c3Y4dXE0bUFHeVMrYytqOC9BZHpJSFdxU2l2QnBUbzBU?=
 =?utf-8?B?eW53MzN6blpyWEg2M1dFNE16Q0pidDJZNTFIUGVSeUVOOHpZZDVmOHRpT3FG?=
 =?utf-8?B?MGYzWHpYOXN5R3N1SWczZGw5MXB5SVBuMkljZmlJdjZXSVZ0V3RucXF0QWQv?=
 =?utf-8?B?OElvaGEzNERBMmxrK0tmNzJxSjJsU2xjMW5INHdKSEF5bUdWL0g0Y3V3WkFJ?=
 =?utf-8?B?Tk9zVmpMNlh3RmxQaXVqUFJkUDNFWVlQdUlJYUxpMFF1UXo4N1FRbXA1WXd3?=
 =?utf-8?B?NVIrUWlQNFFzMWR1U3hRNjk1c2VYek5pTDhVc2QvZHdNOW9EUGJTZThZY3Nv?=
 =?utf-8?B?SlBBM0pMZ25JMWxEclhwSE9qdFB4VVA4TkcyZSs2RlRNSU5mWDZ3TllNRkpa?=
 =?utf-8?Q?DazS0t4EISqqCErkmJU0XcQqa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JA1y61HFGXcCq4n9i5OYtGWrYXiwX+QWBqteNRMtBppVB3pFwcki9rqGKIS6lpEQffaoTxb2ep1mDVlbV4npQRQebrZJHFxRI/VI2gXpeRl2JduON4khEZk0TY82CDlSEGSoch/QQ9JW62UoDKo4DMXF55EvmaOTpLLgcQfIuKwYnwhPKTo++recgNZPdiTPAyuJlH1rCFB5PlfkdlDg96IOMASMthfk5jumOmDkv2BK5EfrENckGYJ0VY1JiKyXg5VLDkVVe6lXNYuvx7857qfJ5cbVhkmtCpHebFJzdWieKWX0xvF4DKo4r97MShglA+yfxBgNrIgvWnl4aZKobq0g+x9rSV0V2GOENXauTNmXLYgcuonHkMdQhRrK8Ha8VARYyhooHcXw5eDwdtQc6rukqU5qoXVxSeTcofV8JzDbYFO+aTUyv5WB9rhpG7at9ZFRjsAiBj3rEJsV4crgsfqV812utp87B6PV0wSgoS5e94UJ2nF4U3HIxVF7FzyW0H7PPDHPyc0BnOf6226jRfS9Gs8zWQzRXYDx6Dr8Vx1C/OVxTq5WC6EKtO8Z/7PcRZ3QdHINqP17hREb4VmLAp1KAmuM3e97aDYVIHYoF1Zo1KHMoEsEdO4P3JcerWdnWy/VaT7jzKUAdlO3nnyEGovfGbuaSL75b1j8Cnq7+asm+Vmc7xM7BypC8O4qEAT1xNHdnbsr9Ekrju+7MrAj+IYmm2R1qXRgaVUOuDfD4rqJ6iuKrLBmPEzP9ZViM3/5JeXook5ZAenR8uhDGOpcXG51iIRbfbn+d2EuuB0mr4U4AVWqqFCnrkx8bojal7k0KpyU2xSR6xHWOIl/weq+afjWI7xM9pRzy8z9HyVlS4YqwXmiMTBIrudprZRbyjHQ
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7872.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99de2456-7ebe-45f4-4107-08db4c37b2c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 00:37:10.8667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bsg3IpdSyWaXU7JgAG48NUho3s9Lz8d1dgU2KSdwAc/ZnYokJIld8XgZ86V4j3a+PXSvBqhqAPe+oRv9USG/wSICVVu5DGGx3TMv3GxGAtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6394
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=481b59591=Alistair.Francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 04 May 2023 00:37:21 -0000

SXMgdGhhdCBiZXR0ZXI/DQoNCkFsaXN0YWlyDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBBbGlzdGFpciBGcmFuY2lzIA0KU2VudDogVGh1cnNkYXksIDQgTWF5IDIwMjMgMTA6
MzUgQU0NClRvOiBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNocGF0cmEub3JnPjsgc2lnLXFlbXVA
bGlzdHMucmlzY3Yub3JnDQpDYzogcWVtdS1yaXNjdkBub25nbnUub3JnOyBhbGlzdGFpckBhbGlz
dGFpcjIzLm1lDQpTdWJqZWN0OiBSRTogUUVNVSBTSUcgTWVldGluZw0KDQpIbW1tLi4uIFRoZSBs
aW5rIGlzIGluIHRoZSBvcmlnaW5hbCBpbnZpdGUuIEknbGwgdHJ5IHVwZGF0aW5nIGl0IGFuZCBz
ZWUgaWYgdGhhdCB3b3Jrcy4NCg0KQWxpc3RhaXINCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IA0KU2VudDogVGh1
cnNkYXksIDQgTWF5IDIwMjMgMTA6MTQgQU0NClRvOiBBbGlzdGFpciBGcmFuY2lzIDxBbGlzdGFp
ci5GcmFuY2lzQHdkYy5jb20+OyBzaWctcWVtdUBsaXN0cy5yaXNjdi5vcmcNCkNjOiBxZW11LXJp
c2N2QG5vbmdudS5vcmc7IGFsaXN0YWlyQGFsaXN0YWlyMjMubWUNClN1YmplY3Q6IFJlOiBRRU1V
IFNJRyBNZWV0aW5nDQoNCk9uIEZyaSwgQXByIDI4LCAyMDIzIGF0IDg6MDLigK9BTSBBbGlzdGFp
ciBGcmFuY2lzIDxBbGlzdGFpci5GcmFuY2lzQHdkYy5jb20+IHdyb3RlOg0KPg0KPiBPayEgVGhl
IGNhbGVuZGFyIGV2ZW50cyBhcmUgY3JlYXRlZCAodG9vayBhIGZldyBnb2VzKSBhbmQgeW91IHNo
b3VsZCBiZSBhYmxlIHRvIHNlZSB0aGVtLg0KPg0KPg0KDQpUaGUgbWVldGluZyBpbnZpdGUgZG9l
c24ndCBoYXZlIHRoZSBkaXJlY3QgbGluayB0byB6b29tIG9yIHRoZSBwYXNzY29kZSBmb3IgdGhl
IG1lZXRpbmcuDQoNCj4NCj4gQWxzbyBJIGhhdmUgbG9zdCBhbnkgUklTQy1WIGxpc3QgbWVzc2Fn
ZXMgc2VudCBvdmVyIHRoZSBsYXN0IG1vbnRoLCBzbyBHdWVybmV5IGlmIHlvdSB3YW50IHRvIHJl
c2VuZCB5b3VyIGVtYWlsIEkgY2FuIHRyeSBhbmQgaGVscC4NCj4NCj4NCj4NCj4gQWxpc3RhaXIN
Cj4NCj4NCj4NCj4gRnJvbTogQWxpc3RhaXIgRnJhbmNpcw0KPiBTZW50OiBGcmlkYXksIDI4IEFw
cmlsIDIwMjMgMTI6MTcgUE0NCj4gVG86IHFlbXUtcmlzY3ZAbm9uZ251Lm9yZw0KPiBDYzogYWxp
c3RhaXJAYWxpc3RhaXIyMy5tZQ0KPiBTdWJqZWN0OiBRRU1VIFNJRyBNZWV0aW5nDQo+DQo+DQo+
DQo+IEhlbGxvIQ0KPg0KPg0KPg0KPiBTb3JyeSBhYm91dCB0aGUgZGVsYXkhIFdlIGhhdmUgaGFk
IHNvbWUgdGVjaG5pY2FsIGlzc3VlcyBvdmVyIGhlcmUgYW5kIEkgaGF2ZW4ndCBoYWQgYWNjZXNz
IHRvIGVtYWlscy4gSSBhbSB0cnlpbmcgdG8gc3dpdGNoIG92ZXIgdG8gbXkgcGVyc29uYWwgZW1h
aWwgdG8gc2ltcGxpZnkgdGhpbmdzIGluIHRoZSBmdXR1cmUuDQo+DQo+DQo+DQo+IFNvIGEgZmV3
IHVwZGF0ZXMgZnJvbSBsYXN0IHRpbWUuDQo+DQo+DQo+DQo+IEZpcnN0LCBaaGl3ZWkgYW5kIEkg
YXJlIHN3aXRjaGluZyBjaGFpciBhbmQgdmljZS1jaGFpciBwb3NpdGlvbnMuIEknbSBubyBsb25n
ZXIgYSBSSVNDLVYgZm91bmRhdGlvbiBtZW1iZXIgc28gSSBjYW4ndCByZW1haW4gYXMgY2hhaXIu
DQo+DQo+DQo+DQo+IFNlY29uZGx5IGxldCdzIGFjdHVhbGx5IHNjaGVkdWxlIHRoYXQgbWVldGlu
ZyEgRnJvbSB0aGUgcG9sbCB0aGUgdHdvIGJlc3QgdGltZXMgYXJlOg0KPg0KPg0KPg0KPiBUdWVz
ZGF5IDRQTSBBRVNUIC0+IFR1ZXNkYXkgNkFNIFVUQw0KPiBUaHVyc2RheSAxMEFNIEFFU1QgLT4g
VGh1cnNkYXkgMTJBTSBVVEMNCj4NCj4NCj4NCj4gU28gbGV0J3MgYWx0ZXJuYXRlIGJldHdlZW4g
dGhvc2UgdHdvLiBXZSBjYW4gc3RhcnQgd2l0aCBmb3J0bmlnaHRseSAoc28gcGVvcGxlIHNob3Vs
ZCBiZSBhYmxlIHRvIGF0dGVuZCBhIG1lZXRpbmcgYSBtb250aCkgYW5kIGdvIGZyb20gdGhlcmUu
DQo+DQo+DQo+DQo+IEFsaXN0YWlyDQo+DQo+DQoNCg0KDQotLQ0KUmVnYXJkcywNCkF0aXNoDQo=

