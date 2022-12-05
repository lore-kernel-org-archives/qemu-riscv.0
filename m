Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2KeH-0004ly-SA
	for mharc-qemu-riscv@gnu.org; Mon, 05 Dec 2022 18:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=331af8b0c=wilfred.mallawa@wdc.com>)
 id 1p2Ke9-0004kv-Js; Mon, 05 Dec 2022 18:13:14 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=331af8b0c=wilfred.mallawa@wdc.com>)
 id 1p2Ke4-0004QU-VD; Mon, 05 Dec 2022 18:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1670281988; x=1701817988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eEVTQ9V+RKWBe1amflNaGagrDC49UQPOQTYir+rG2lE=;
 b=J4Fu8Wxab/AQPuiygJV6AQZOj5rA8SsgavVHwhOCDUmw6sL9lXEt3cn6
 7YNbBTjW++cDf+qqRJUX6qCBpkloc9H/MEOnKezo/LLXAEsEBJdLRYi8f
 BGu8M8doSZRxobLqzitgw1ikNpLxz0IAIJy38sEOWZdlgywm9oA6PoyvF
 +F8h31YnRoPJV9QzmsiqZ6xMNGqyLOkoR0ucWzrw9CKZZuc+QOOptqaXT
 qOtQLWFXb5i3c62P67FuwR9emq5VpHxZToq+Co8actfUUixkIQSFZwbvA
 rSyXn12S6QdyvA1OKPewCxBWimGoNTRG1l2tz275BV1QYsdedRMQ4ldwN Q==;
X-IronPort-AV: E=Sophos;i="5.96,220,1665417600"; d="scan'208";a="330050337"
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hgst.iphmx.com with ESMTP; 06 Dec 2022 07:13:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8M5W/N3UZOLXRvnwAp1uXkIOqZQOZnjmKuORziP9McqeHSp3k49j4c4XhiY1IsbL9iGnfoWR5IF6htR/IV7GcaC825oEwLUGk5jVsyPJVOHZ/RPidbMNakttrs4u/E113W4RMvL8tYERZLrFL5MF8EiYlTD8YNjFEMgNWcSni/bQQxZXk9zZZzhNNASNkN1IBagTargs6vOzgprNERe5Xda2qzgJJAKeqQ7OXDCvTrFRCC4ancsddQBe2E3Cy5cCTzlzepNiF0EtmpXD06w3rMBp1hBwMzOI7A047AXNdMcnHC6oiqKvXgFJEZiMyp/16IWsbEspBVbTZ32raN0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEVTQ9V+RKWBe1amflNaGagrDC49UQPOQTYir+rG2lE=;
 b=htWCnWSJ/RfJYW3siqQ1vAmu283QNPd+uKiwqOQwK9x/VDS+H9g+pc8y3C8WzgB2RSmvrHr31XUgCZax5uJ1DMrv7ePXD9X96FZZBpyKgmx++F6/ppmlBOABdARns50Xp5ICTyxojP61q4PcnqGi5R5dNLqdhhQCO8HY9Pf+L6YEQR+064MlqYNd3NetAwtMYNQ4z3DATnTEpIySLMwZcF0HHG0ULARGmdB0nTNpuDkwG6JUu6Pl5rAhbsnstGUkf++HEM9UrBVGuL3dib+NSNGVFtjVl0fCSAkvB54PBfOEiJEuUiT8VnmSqMdbUAO0jbCSTr45fCHhSex9Hjavww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEVTQ9V+RKWBe1amflNaGagrDC49UQPOQTYir+rG2lE=;
 b=Skn2sRz8pgXlecUTsiRqXe2hjtgYY1FKpD1ZdzB02AcwmjhyCBCAkPC8AonPm/Hb6TIH4PlcoeK8Dg5Hu91MD9Vfoyx5gqmSQ0IJva+dy2Shr6WB2Mz9QXD4TzbKajKAxITyre6ODH6vBdBLsP1lV12ZviJvyeKha20xiRLW8IM=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by BY5PR04MB6931.namprd04.prod.outlook.com (2603:10b6:a03:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 23:13:02 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%6]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 23:13:02 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng@tinylab.org" <bmeng@tinylab.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "bin.meng@windriver.com" <bin.meng@windriver.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH] target/riscv: Fix mret exception cause when no pmp rule
 is configured
Thread-Topic: [PATCH] target/riscv: Fix mret exception cause when no pmp rule
 is configured
Thread-Index: AQHZCHZ9BpNSiyIBNEmqlCe2D+bFPa5f7U8A
Date: Mon, 5 Dec 2022 23:13:02 +0000
Message-ID: <b1fc81557dd150d478521665322edacc408a2f55.camel@wdc.com>
References: <20221205065303.204095-1-bmeng@tinylab.org>
In-Reply-To: <20221205065303.204095-1-bmeng@tinylab.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|BY5PR04MB6931:EE_
x-ms-office365-filtering-correlation-id: a9a54d05-8f48-414d-bec9-08dad7164225
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VDlBCI+hRY8b2ed7jbyKqGdNbe0Z/PoRGb4exoI7VjIia7+hqfsrUbTh77oHOXrgfVkcluVTvSw29vUPLnj6wCEFSGoY4M1t/Ki6M9MvSDRiyHge61rYAtkCe7nxVXRK1YkIWRXAwVB6IbrlBw3m6nuXB36KD0QhvRwk9DyYnRuoOo27NhDDckcc5vQ/y2ZC77f991ubMOl6HjbMl7ski3mkZNAqVPEt6icGQEMOfNx9WpxTziJvRSMRKJ7WHVSJs0+coGjlS1NgD5dUPXlD0AcyQDDC1oZ0vjx1F554a5GIsiyUpFud6m9T9UDPRYU3qqnXgUa/djsrhmgZY9fQjMN/syLdGjWW7JJ93UmMt6vDqHP5AJcgqLRagqVj8LzALMrCWECE01gwS+FYCkRmDl4IXRUCcc8t9G+UK2HuEi8gPs7O9dhY9cfXzJoilEWfyECmPClRK/UcrtwEKh7/PVahhaeRfR5sMgD+cpdfpQhlw3TLMwE7cpT1tZa+7ZJJlU0SmR8lMpR/8fe0QCQ7etMTMTzyVit/Xb89RDNtOQ9rStQhBIN2VTdjxsauIFpHC/ItDn4Z+AxvPRNdvEFPrxh7+EOVbrlFEdpXyXzIP8No6g2KtyI1dKxxi9+dBkUjlho0aUqrJI+sWG/aA7VuVDsy/+mzn+tAEKH8nh77f7SbtSCbMc8Oq/ki29RqvIfA09QqkvmrR1qsjYGVCZXenA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199015)(36756003)(38100700002)(82960400001)(86362001)(5660300002)(8936002)(41300700001)(4326008)(2906002)(38070700005)(44832011)(122000001)(83380400001)(66446008)(76116006)(91956017)(66556008)(66946007)(478600001)(6486002)(66476007)(316002)(54906003)(110136005)(2616005)(71200400001)(8676002)(64756008)(6506007)(186003)(6512007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THJXWUxCclFxRnZXRVp4N2dtbVpqb1JSZVZYR3dxUCtFZXRzZW1KNEZhTndw?=
 =?utf-8?B?TjdQdjhmaWtlRExuUjRLWmFsL0IvZjZ5OHFUNFZ6WDl4RDBiTjhkRWVMSDl4?=
 =?utf-8?B?TEYvQWJTODhla0RxTW9RcERjL002clZZbkRBQmtYRWdhQWxFZlJPWnYrZU1y?=
 =?utf-8?B?NWdjSHhscXdpVEJORk9IMG9qVHFyRnBZZTRsODdFbTBCM01aMFJESm5oNE4z?=
 =?utf-8?B?SExqRHJHRnd4dWo2VDlTOElwMEtCbGcvb29aTmd0djAvZm1Mb09Bc1YwdU5n?=
 =?utf-8?B?T3FTYTdVYk1VejFxZmE0S3dPQ3AwVXVXa3lpMXB5WVBzQXJaenUyaVFFR3Zu?=
 =?utf-8?B?d1ZoOE4zUHppZ0dDK2gvM210dDBTTDY1N0ZNTTA1dGs4bU5iL2VVZ0tWR1d4?=
 =?utf-8?B?bE5iNjFGZVYwZStRejJPekt4OTYxL1JmM1BqYTAxc0E5UXl1TkJITjdadHVq?=
 =?utf-8?B?ZVhJa2Y4am5QSFAwMitlV2FCNjB0N2RUclUrUWZoZ2dESndhTFZmaTJzMWlt?=
 =?utf-8?B?NHNuNk0rcStNK0ZCQlFJa0s4UVZIMjJSYTBCb3RFMjltSkJDNGcyT2RTNDd6?=
 =?utf-8?B?QW40SlhnV3VKS1o1YitNMmlLVGFWU1BBbUI3RXc2VWtpMUE1QkRVQjFjeElX?=
 =?utf-8?B?Z1U2UlFtL0hnZjMxazZsL2tRZUJtYVd0dFBDdmwvb05XWlhROFBOUHMzSXdu?=
 =?utf-8?B?V2hmektlR1RBeWdNc2krcThyby9LUzZDMTh1c2VPY0FVMlNOYWxNSlV3L3Vo?=
 =?utf-8?B?bW85Rnk2NUxFd0Z6UG85aGZGVG9vVjlyZWhwWmsxanNPV01VeUFpazZ2RFZG?=
 =?utf-8?B?M3pnYlZwK3BaVDRvOUZsc2x6eDRIZDRuTm9hdHQwMm0vSTZ3bU92RUpSVDZO?=
 =?utf-8?B?Qk10YTkvS1IvZndpalhKZ01GVDRKdFRLR2tIVjZyL0RFMzltcjZIbGdnTW5j?=
 =?utf-8?B?cUlPcVlZWk9uYnRoOW8xaXBzekQrQlB4TTJ6RjRPTzNFQnM0d1BER1cyU284?=
 =?utf-8?B?MXo5YWh1ZFlTWjNpbTZ5bW03S2t4THdMeG4wNVA1U1IzRFdHaFRDY0pzRldM?=
 =?utf-8?B?Y3JvL2M3Wmd0UWRyakNKYmIzNUJyditCNjRGQS81MFZuYWR3TnNxaTE4ZjFE?=
 =?utf-8?B?L1FLYmk0cFZJVHVSNlVSNFd2UmtvcFo5eGh3RGEzVVF4OVlaWUpKVUlZdzlj?=
 =?utf-8?B?VDZhUlM5UHdqM2ZjNlFIWGZiQm5NYkFjK0NmZWZtekJoc1ZVcEtJSFppZ205?=
 =?utf-8?B?K0NuNXZJdTZNbUh2S0VLakkwR3NPS2F2N1ZRRWZGYyszbGxJUFdWRzR6VGtS?=
 =?utf-8?B?UWNhRUJ2aUs5OU9reHA3dmpEaWs4NWpmaDQxelBuS3lVT2pmNW9GNDdaWUpW?=
 =?utf-8?B?YVUyWkRDSXpsVmgwMHMwb3JBWnJybWpXbUhuZ1NwanJOWkhUTC9FSDAwNEc4?=
 =?utf-8?B?WlhTQWhnaDNoYXFjL1VBa3pvd2dQYjUvWFpMNGxiYll3b0pQQmNPa1RWZ1JF?=
 =?utf-8?B?a0JEU2NXZ2kyUm53TjJzVEJaRTVFQjd0b3d0QUx4OXBRQ2FGSVFDNDEvUC9k?=
 =?utf-8?B?bnNUK01lL25FUENTd2UrN09OUDhBejJUdGdyWTZYSENMOFhrSUhyQzJVNnBR?=
 =?utf-8?B?cnhXODFrWUgyN25GbUpBenpmQ3Q1UnlaN3VlT0EzNysycmtFL0p0OUF5Y3NI?=
 =?utf-8?B?RXp4dUdGUEtIMkJCR3NGdzYydEdqTjN0aGpqcGFWM0tpZE83c2NkZkVOc2JJ?=
 =?utf-8?B?WmtQdzZiY0FidWNOcEcwalY4UC9BL3hKb1A2OVNlekF0azF3R1E3NUVlR3hr?=
 =?utf-8?B?YjdZajhOOFpEazhZRTliWEIyWVR0TkFITUcwQitnOUxlcEJsT3ZUbitGSVUx?=
 =?utf-8?B?ZU0yaEZ3Q0lKdTJYWEN2Ni92dm9sN1hsbGNZWnlkT0N5TlA4L2VQTG02OVdn?=
 =?utf-8?B?UTBxZkViQi9iZUVoVURyb3FNK3ZwTU1TejZqQUdYbUZjUUMzMmpHdWhkcTlR?=
 =?utf-8?B?ZzJySHJiZzBvWldsR1JvQkIyRkhOT3JlVDhPeGM4UkR5eDlubXBNSVJXeTM1?=
 =?utf-8?B?ajhhd0ViZFB6dThCZjIyTmZKdUc3MTc5ZHVWRjFHUXdnQ2RGM3JXeUl6bE40?=
 =?utf-8?B?dGdWbmNuVzN2MHIraEllZzNhVHNxd2dUQVJybndQVjFsb0hBZEVZcFYrYmZr?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A85754B02EAB554F8CC3E48C8DDB463E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NYP1/VHM9+uQ/XBafTODrAthRZdHmCSUAnVg1s8c1L3olIrX3I5JOmDXRSsLmBiQwxSvz9zQUUOkWIrkQ5QwH9vjeMaFkcmToCFBhchY2g9T1tRzHz15173msZ2tsB8G8BEMj8GH7ddIKDtbKaxcbl9fJod6BgScXS/6b7aHyfKjzEbZNd6mPDxbhOqEUs6yhShsjLlil8HUDwJ/YExBIKfS8B+9MRwpDfYcfvMGgUVFNoeFYTPKATzJO8ydo8ljlomwXZGbNm8kJRT9Cc9sseopjQUdpUK2smNPw07GreFWG0tZypJB1W2qlP56ZhgAcTpPuAkSbv7IL7HrOtd8Q2Qj/0LmiOKd1IWwuwEuDQ5Gt+sXVIZzdxLHgIdF19wurjtOUsP9sIgzH1IdoWJZcYlHoRErDPBZi24XYvJgds2+K4hACcjzAkQBgP066VdCbd/eVxHD7fgVLMmy5JkUqp3FV451gxmp3/EiGaFB/liBNeDD775yKMVZVSbTSb8nVtWvbZYy1CuqPqqtp5etGANBjzHbURhBKbn6GtlMns3IqqRC/0cEgz2jFrP/CacwhhxhCaw2UtSRkEWlJcpemnafKVWJnpm62BJlv2DCPF2SHjQKCwBxXZLSVWiytwfRBv5qeUI/PFZdF8f+R++bIvkynMv8SdIPgjC2O+wrGT7UlkMgYqQOXcs0wdXwAigbFiooJAE2QZS0zMP+Dk/uhQHhHSgKhVM59b5rLbjqbWq9UcJxP6tY9YlsA1FuK3ebYiGNDvnG6KeZHSg2AKv/gT50lHGSOv5LwhFXestxDLWFgNXUValGjFknwXIz24BxfBdeEzUxPZ9tyQJwVPs06HFCzswmMXVJXY2hh6F7zn7N1tGy8KIINbjbzMkslzZWlQbkkAuf4enKAxqjxTA7rA==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a54d05-8f48-414d-bec9-08dad7164225
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 23:13:02.4743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUDQAU+67BgCRHQRepa/bS6Lwxqw1OsrnAHhOdSz1ezoz+D1Q/l7TiTlBO/JDWPYcvT+lEWPSI5mMROWsY+ApQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6931
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=331af8b0c=wilfred.mallawa@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Mon, 05 Dec 2022 23:13:14 -0000

T24gTW9uLCAyMDIyLTEyLTA1IGF0IDE0OjUzICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gVGhl
IHByaXYgc3BlYyB2MS4xMiBzYXlzOg0KPiANCj4gwqAgSWYgbm8gUE1QIGVudHJ5IG1hdGNoZXMg
YW4gTS1tb2RlIGFjY2VzcywgdGhlIGFjY2VzcyBzdWNjZWVkcy4gSWYNCj4gwqAgbm8gUE1QIGVu
dHJ5IG1hdGNoZXMgYW4gUy1tb2RlIG9yIFUtbW9kZSBhY2Nlc3MsIGJ1dCBhdCBsZWFzdCBvbmUN
Cj4gwqAgUE1QIGVudHJ5IGlzIGltcGxlbWVudGVkLCB0aGUgYWNjZXNzIGZhaWxzLiBGYWlsZWQg
YWNjZXNzZXMNCj4gZ2VuZXJhdGUNCj4gwqAgYW4gaW5zdHJ1Y3Rpb24sIGxvYWQsIG9yIHN0b3Jl
IGFjY2Vzcy1mYXVsdCBleGNlcHRpb24uDQo+IA0KPiBBdCBwcmVzZW50IHRoZSBleGNlcHRpb24g
Y2F1c2UgaXMgc2V0IHRvICdpbGxlZ2FsIGluc3RydWN0aW9uJyBidXQNCj4gc2hvdWxkIGhhdmUg
YmVlbiAnaW5zdHJ1Y3Rpb24gYWNjZXNzIGZhdWx0Jy4NCj4gDQo+IEZpeGVzOiBkMTAyZjE5YTIw
ODUgKCJ0YXJnZXQvcmlzY3YvcG1wOiBSYWlzZSBleGNlcHRpb24gaWYgbm8gUE1QDQo+IGVudHJ5
IGlzIGNvbmZpZ3VyZWQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBCaW4gTWVuZyA8Ym1lbmdAdGlueWxh
Yi5vcmc+DQo+IC0tLQ0KPiANCj4gwqB0YXJnZXQvcmlzY3Yvb3BfaGVscGVyLmMgfCAyICstDQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQpSZXZpZXdl
ZC1ieTogV2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4NCj4gDQo+IGRp
ZmYgLS1naXQgYS90YXJnZXQvcmlzY3Yvb3BfaGVscGVyLmMgYi90YXJnZXQvcmlzY3Yvb3BfaGVs
cGVyLmMNCj4gaW5kZXggMDlmMWY1MTg1ZC4uZDdhZjdmMDU2YiAxMDA2NDQNCj4gLS0tIGEvdGFy
Z2V0L3Jpc2N2L29wX2hlbHBlci5jDQo+ICsrKyBiL3RhcmdldC9yaXNjdi9vcF9oZWxwZXIuYw0K
PiBAQCAtMjAyLDcgKzIwMiw3IEBAIHRhcmdldF91bG9uZyBoZWxwZXJfbXJldChDUFVSSVNDVlN0
YXRlICplbnYpDQo+IMKgDQo+IMKgwqDCoMKgIGlmIChyaXNjdl9mZWF0dXJlKGVudiwgUklTQ1Zf
RkVBVFVSRV9QTVApICYmDQo+IMKgwqDCoMKgwqDCoMKgwqAgIXBtcF9nZXRfbnVtX3J1bGVzKGVu
dikgJiYgKHByZXZfcHJpdiAhPSBQUlZfTSkpIHsNCj4gLcKgwqDCoMKgwqDCoMKgIHJpc2N2X3Jh
aXNlX2V4Y2VwdGlvbihlbnYsIFJJU0NWX0VYQ1BfSUxMRUdBTF9JTlNULA0KPiBHRVRQQygpKTsN
Cj4gK8KgwqDCoMKgwqDCoMKgIHJpc2N2X3JhaXNlX2V4Y2VwdGlvbihlbnYsIFJJU0NWX0VYQ1Bf
SU5TVF9BQ0NFU1NfRkFVTFQsDQo+IEdFVFBDKCkpOw0KPiDCoMKgwqDCoCB9DQo+IMKgDQo+IMKg
wqDCoMKgIHRhcmdldF91bG9uZyBwcmV2X3ZpcnQgPSBnZXRfZmllbGQoZW52LT5tc3RhdHVzLCBN
U1RBVFVTX01QVik7DQoNCg==

