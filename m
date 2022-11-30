Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0IVk-0000jE-2k
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 03:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1p0IVV-0000ct-Gk; Wed, 30 Nov 2022 03:31:54 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1p0IVM-0007mr-Ue; Wed, 30 Nov 2022 03:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1669797105; x=1701333105;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5ouzLXH43u5Hv78ahhEgaDqXneHaJQG23QTP5j58KZE=;
 b=prUfVfAvzQeRW2+RPrx+Y4+cYRYinLIhfFzjVzfk3i70w2UPJ/TIqVbb
 jrIwZMPWqaolHqSGO6eTUXqoR7COsKYJWOQtA92p66TEVQ03neWfV2iVp
 XlRzlZfeceDASQuck0dBVzh5aDnPgTuMKVW1kkrF29wVzcDmy3oRsr9rQ
 JRU6tmqAwPMJB/0FkJSiVL6OAZ+kT1hHLIpVf0r+R92ESopHW+8quuY9O
 mr68WpGfsFMtsruBAK9bwlBDoYDNah7s2vSV5V8+acOd6J4nwGDhxIhb6
 ZfaOCyoOx2WS7JGwQxrHbVobfGGtSvPZR1GvK37GJorqXnU1WyNz47fOO A==;
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; d="scan'208";a="185827633"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Nov 2022 01:31:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 30 Nov 2022 01:31:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 30 Nov 2022 01:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ8D19jBJKv93818ksIZ7cZeEBBWO/KTE4SAr22I6USeF7GSwjTwGxiln9CuqHEYfWpWj4kCdDMvk4fZiZsfJXXJG2wM4grR0w9ZY64BroA4FSbUBJD1wuVjXh0V0ub+bLconj9A0S/7rD3kM/okK1pJNZRFCZLuepCBZHAZHqv72wErQ7j446W932k806EsZyQC9vbDiQg8qGeTSNAhChabiYtvW6Nk8wY7GAmi9fwfFlZ0yTxwRedD+yTxAq/upWlF1X8mJlikvXFdcJ9u5dehjLh2n2AAw05WZEAv5edDQArsB2+h6K3dxBeZiejXFOWC8698Mpn5uAYEgb6VTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ouzLXH43u5Hv78ahhEgaDqXneHaJQG23QTP5j58KZE=;
 b=C2HWlJO/8Drmgy41f4INR+vGv7oy3ZMLzXXOXB3mVTuOFnA4QLkYoGEeQ5+ocIrn5+bXDLRee7WUz4ut1LqJ2mi8v9v1T280CteCtFbgni8L2qbETbGzY1Bsv1TPHflnI4hLeu71VfcTMUYKHtifZVdEhnhRDqJF2bf+Zm6Kmh7qdtp9Ufl8gMa+7D08VJG4/ahPHugpgs0DaMmLxPfd1dYx7rRgwJmYqk3gjeMHwNrGtR56o3ihj+P4cdUvgCnXXJw+M5+CLdiDs78b5Zy8eP7CKf2TOUEkeuAy3opmuDAt5cTHdphp79JSdGnRw42xK8Jk0NbVN1D5mDIComiPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ouzLXH43u5Hv78ahhEgaDqXneHaJQG23QTP5j58KZE=;
 b=HTMOkSSjS5d2t3p13sOpt/pugbFuK0sDzpNVNpVXYjebWcOrx5CNLT9nKvsETb8twvggpXUswoKnMpbDts87f/ZBdjC6TTsffjxIlUS+bRyR16bVIYUWxs162HMU2M8t0UBLWPNsAAxNZBjW0lEsC9GJCxQLYrb5TZdND5DS4zE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 08:31:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 08:31:24 +0000
From: <Conor.Dooley@microchip.com>
To: <atishp@rivosinc.com>
CC: <robh@kernel.org>, <ajones@ventanamicro.com>, <qemu-devel@nongnu.org>,
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>, <palmer@dabbelt.com>,
 <qemu-riscv@nongnu.org>, <samuel@sholland.org>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
Thread-Topic: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device
 tree
Thread-Index: AQHZA2ZrKWGujbHaTkmukQtrcQh1RK5UzAKAgAAA1ICAAAftgIAApykAgAAGxoCAACAygIAABBsAgADuG4CAAItwgIAABNiA
Date: Wed, 30 Nov 2022 08:31:24 +0000
Message-ID: <16fcf836-8116-0320-90d5-7787641022cf@microchip.com>
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com> <Y39urpX82uO85AAb@wendy>
 <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
 <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
 <CAHBxVyGVigqBLLS9vqas+uq=Joyr2F6ir0zqtg+0y2GaTCyX-A@mail.gmail.com>
 <b42e75c6-8c52-025e-35ef-326537ccc90b@microchip.com>
 <20221129070820.7varmruxjkhdwoc6@kamzik>
 <cd386574-b115-328e-c5db-6f85b6cf6c9e@microchip.com>
 <CAHBxVyEthq3q-C_dy0ZQ1rOGwTWUF8_rXG1_7AHRFKxk9q0D1w@mail.gmail.com>
 <41abdee4-8d33-193b-9b78-080c75a8fec1@microchip.com>
 <0d83cbe9-bc8c-75da-e1a0-a4eb8b3824fd@microchip.com>
 <CAHBxVyGd8CuBBxyWRX4AYS-VZUC+=ae3x5zcxRN9UMKjcaT6KA@mail.gmail.com>
In-Reply-To: <CAHBxVyGd8CuBBxyWRX4AYS-VZUC+=ae3x5zcxRN9UMKjcaT6KA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SN7PR11MB6558:EE_
x-ms-office365-filtering-correlation-id: 8036c829-bdc2-443b-e4e8-08dad2ad4474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D7X/HNL3f1BhHJcTEuIdfg52SiRigPQTVWHNjCVIqBiyQYj+YdDWn2A2QP3Gmn1yyh+DC5gyg9G6pE1hphAW859kyo21QRUxexHMIuyXKvuObJPRukInStIY8fRtrKoQNE2zigR2OJE4AwKCNuk++6jKxpRjXEWodCFwQsybahBWF623iQknVzBA6+AWbz+8jUVjWYYHz0GLwPAl4IhsVUZpRo12qCCW//7wP7zNx6ITDoYTeDK53ahnba1XgtjjUu1deeERv1d8K1tNmYC5FKYYvSANHN9qI7YKeB1s37o7aq4PGMvfCyNKcaI3eCIz3O7i3oJuUiskw2KI+SIr/dGLTNOkz/ffmWX2S+Q37IOJK85RF9NZhI0fSdVsZMoCihke1M6GT9759rdHd1BXq5cU2cvyFYyeH3BDKVDTptON6JnDO6Et+mQFO5/GYjfcryeQG7GlzXxt+9D0wqKKrU9IxG1+PaZ4OC+ALkWrWPEphho0b/GzLO/8Noj3ptTd3Tdg4y+Rn7lmDxTCd6xwrgMT9+NHN8r5dR6js1dv/kami0RluEANN13/kSv6dfVzPkpiI2ns4JwDPDvZLOnkDCyLM85rKG7no/hkNwY2dp2sdaDB88i2Z1MFtVwhdjvDfws+jjppu4ZGAn0kvOVLYDkL3+e+db9AVi9rzj+fG6rPyyMNCRHWA/Eet9f8f+yAnZbzDLZW0+dXgez3oqtwLF7nDbC5VwNITRPjOXah83JAKkuxIRgNgLUQzUeTBtLvnm3ivW4xS+fq7QaJxIcP6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(5660300002)(31696002)(26005)(53546011)(54906003)(6916009)(6512007)(41300700001)(36756003)(186003)(91956017)(4326008)(8676002)(2616005)(66446008)(66946007)(76116006)(316002)(66476007)(64756008)(8936002)(122000001)(38100700002)(38070700005)(2906002)(66556008)(558084003)(86362001)(71200400001)(31686004)(6486002)(6506007)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEsvdVY2QmJncDNDZU1LM2dwQzQ3dlFFM3dDZDVHN1RzdHRvNFcwc1p4T0kz?=
 =?utf-8?B?Qlg3dUJhQ2J0RTFnQzRxZ1hYY0FRd0VHWWhxUmN4MWc0cHYzUERpbFNUN0c0?=
 =?utf-8?B?eTJLWWJ2L1FGU1B0dFd5NEt5MC9IcUk5amV2REdzRkFzZ1lxUDJlL2RkaGE3?=
 =?utf-8?B?TDdKekdVM2c4TUR5RDJGdFRqS3hOcU5jcnFjZ0dmdjFUd2dMT3IzY0c2Znpy?=
 =?utf-8?B?OXRDNmdTeW5FQUlFRExwVFdXMld3d0t0cTVHZ0VkRWpBeUVPSnVpNHFwcDAz?=
 =?utf-8?B?cEgwZHJHek5LOVR3QjJEVDVtU0FsRzZicFNDT2NJVVpBa0EwRngyVDV4RjRT?=
 =?utf-8?B?S2ZkZU9nUTZ1VFc2L3BRcTNpRnRRNVJaVEt6ZzZ1aEJKdUVUSHdPOGg4T1V0?=
 =?utf-8?B?a1dxMkl4MnEyVEk5M044RFB3SmlmTDI0ck5Ib1ZtNUpMNVNOdlozVVpBKzZC?=
 =?utf-8?B?K3RXdHVQV0hhQkNjMERlSlJYbUI1ZjdGb3l5TUhxcWpoeGJYL25HOTZrMnVG?=
 =?utf-8?B?OEhlWlFnZkQwYXJlbUlqQkhtL3Y2WGZSMXNyampsVERKekhvYitIdXZhWk1R?=
 =?utf-8?B?Q1BYRUVIVnFEbi81SlJ3ZlUySHJrN0xOOVBTM1RsWjJpSUZIWWpsVWdMNEtj?=
 =?utf-8?B?K2RseTNpQWM2dEJRajNIZ1pLQW1zY1ZaczR2YW80RU90aFBUNjk1TWhwTm1q?=
 =?utf-8?B?V3VwTElVSVQyMVRVMEp0U3BTZXQ5b2xIQlNrZzlhVEhtS3lBdG1ReVVWbGRy?=
 =?utf-8?B?T2UxV25VelplTEN1d3ZHOGdlRFlJRHMwZ2ltNkxDU1BPa29lb2FzYzZiY2FD?=
 =?utf-8?B?YnQxSlZFbzZNNUR4a2RiY1gwUk44TWpuL250U2JmS3B0T0tCQklFckF4SThE?=
 =?utf-8?B?Ly9FTXFyd0FiUGxNY1VLUXZ5N1FCL2c5cTBnWjM4Ym9WWTNGWGNudVpVaVVH?=
 =?utf-8?B?UWxLZ1VvZmtvT0JUN3RuWW1zVFR4VW4vbkgxamlLWjNuT0ZYeUVsYWdnU0o4?=
 =?utf-8?B?ZiszOGI3ejMyOExQaDVvTDJkaTRQOHMyZitWMTQwV0lTeUgrMHQxdEl5S3JU?=
 =?utf-8?B?MTREaVlUSjFZUlh1MmNkQUJyMEZMZnBvUFdjcmNtK0wveWdHODc5a1l1c0Ny?=
 =?utf-8?B?SVhXck9aRDN0T25aVkoxQmZRY1VSMGpQNVBFQVZKSFpuVTdyVU4wYkFRT1Zr?=
 =?utf-8?B?UVNKUUNkZXBPMDFpU2ZkNHZMRzBYaEVDZlFiSnlONXdMbVZvcHVIV2hiUm5D?=
 =?utf-8?B?L3U3SFFCY2ExcWt1b0R6ZjlvZ3VtY2NyVTZxT1djWnlrTmNqK0FrZWZqeXg5?=
 =?utf-8?B?Rk0ySHR0RURKUlNEc3Q1UTN6R3FTWGVLWVE0RjhSa0xmOGVNZERreWUyMnR6?=
 =?utf-8?B?UEc5U0NURUFiOEpOM0RNSVVMVHBscm4rcVBOV3c2MGd2S1ZjbW1NdHB2UW1i?=
 =?utf-8?B?N2E4engxTFFlZnl1bXplZXNWMG00QWY3dHdGVnhqRE1POXh3SkV2cyt5TXA0?=
 =?utf-8?B?MG5IOVZLZGw1eko1eGtlUTNqVks1YnZrbDUvVC96KzhpU3FRRk0yRVFONGtX?=
 =?utf-8?B?dTVUR2g5eHc4bS9OcnFrWXBOWmhjdlVkeGZXNFdDcXdNVUxQdHE1WXVBTVRJ?=
 =?utf-8?B?TmFnVVZCbzJVVUNUNXlMQU1GMTI5a3ZncXVNenNuZERsTzFVRkdlMFBEdVo3?=
 =?utf-8?B?UWRDN0FYSHlGN0g4WERuSWltTmt4K2FJNExhQk5vS1ZNRllrYVFOZk83T1o0?=
 =?utf-8?B?YTR0bWpIbElSVEpkMGZERnpiejdmekpOcW9YM2VLOGZuY1JuS0lYaVd0OUVY?=
 =?utf-8?B?OWRJKy91eVBkdnphQVNoTWdiNFYwVm9sVUg5RzEreWJvVDlrdnNpZFBJeTBt?=
 =?utf-8?B?eWRGOUlETHMya1Y1SGY0aDJrSWhvYXFiZkp4ZFFrekJYNFJ1OWtlWUxQaVlx?=
 =?utf-8?B?KzNEbmtQRFlTbHhqb1N3cVFjdVQxNTEweVAySmV3R05CcEFTT3lKY2NnY3Jr?=
 =?utf-8?B?Tk4rY1EycEtYbmJQeVVBUUk4N0hIN3BVaU90eDhlR0F4REpMbjRYV3l1MThu?=
 =?utf-8?B?T0RUM1BpaXpPaFV5YzdRVkRrYjFqbVBQbm5LRlc4aTBuQ2NvMHJrU2RvUTdj?=
 =?utf-8?Q?V3gwWZO+5500Atsk94IG2AjlJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24DDA858A00673409BFC0C1938E4A86B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8036c829-bdc2-443b-e4e8-08dad2ad4474
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 08:31:24.5876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwwin4mdmPe7e4pStFYFgV3D5GIlQn4YzAMwLG7Ae2Ui5GizvVCxiZrxjLpKfK991/k1ZkRVXmm7ceGWIOnzP+dxTgYCgQ+bYUH+g3GdOxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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
X-List-Received-Date: Wed, 30 Nov 2022 08:32:03 -0000

T24gMzAvMTEvMjAyMiAwODoxMywgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6DQo+IEluIExpbnV4
IERUIGJpbmRpbmcgb3IgZHQgc2NoZW1hIHJlcG8gPyBJIGFtIGEgYml0IGNvbmZ1c2VkIG5vdyBh
cyB3ZQ0KPiB0YWxrZWQgYWJvdXQgYm90aCBhYm92ZSA6KS4NCg0KSSBhc2tlZCBhYm91dCBhIGR0
LWJpbmRpbmcgYW5kIG5vdCBhIHNjaGVtYSBjaGFuZ2UsIHNvIHRoZSBmb3JtZXIgOykNCg0K

