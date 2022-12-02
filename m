Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0tuO-0001et-Sy
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 19:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3286bccba=wilfred.mallawa@wdc.com>)
 id 1p0tuL-0001dD-FO; Thu, 01 Dec 2022 19:28:01 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3286bccba=wilfred.mallawa@wdc.com>)
 id 1p0tuH-00055T-V7; Thu, 01 Dec 2022 19:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669940877; x=1701476877;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4cCQDKFde6UchrwmP0x0h+0S4BgTy02nYRNp+Lt6BxA=;
 b=q1DFPmpSK6bzTYzqdRpgGsSvuqwSIbfJ2rDYL7SOkUQglVrsIkOM2jgK
 4YiC7hMJwpph/N22WXhc4s9FJhqECxsqaFfgEVtUMQnoYviPryCJDUHYc
 yYrodn80E7VvOsaBjHwfyHbDuaKve1o5xZuUgu6Dvlijqxk6iTG8frF4P
 zfoVKyz6WUhJYGcnFOd92+lXDcYMFN+OOvVC6sPTFNmsgrWnD36IDqJkh
 S+2kVU6tbuCFwFgQvFO7nT2TLG5LwyJIgJLUgiRkVwBOLO2qVrWKt+e0F
 Ez+OQm7IRsZzLHzRQZsFH/ptXTfPG4Yy362FzRWAB+RtOA5DM+gvg499a w==;
X-IronPort-AV: E=Sophos;i="5.96,210,1665417600"; d="scan'208";a="217708465"
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2022 08:27:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlUeV6Tx/GO1z027xcyTPIwtEzVulgKPCtz0H4k2qeKdqNdYVBuZuwcfjaneUOsE/yEXm7/E7AjplksSmHf6RJTTuTuieQBVQ3o3CCuqAd1fr8dhPn/rErjrnuMy9eEHKB261aaseNbU4FqrDnbr7tpq7sB2vgJw3MBltt/7odHIDED3RXlERdDZW90d/r6DyYEsOu4WBB8d1xAXo1crjpS2QXt45AscD/O+Y/bTrLA77X/pEeMCY7eiCuMnYU0sdr6wjxxwKcet5SNrS0xf4LfJ0O1Sq+ba3oqcK2tEDOf9toU5/izIpl2cpudInDCmoOp+Z4s4FLi6wd5plrh0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cCQDKFde6UchrwmP0x0h+0S4BgTy02nYRNp+Lt6BxA=;
 b=AYbXMHhV5tRWB132+ccl2HqtM7D+ed/CKG7rxWUjdKMOUjQDX8lLPdPKw5DGBvoH8TQiY+nd9m0GQqPObVN2sKUmxBXxMPHwjlqgikIdqXAyNIRDj6QKJAD7QgRdf3KFUC6AKxCCSi6ka5yAtg1p61D26Yq0gTEVrJDSYODNzSsG44YhqTohgaNsVkWLWM2pQv7EJM0g1kqH+Z2LO06kB+HQBfUkQgnGbc1DlkVOjpVM5ChjE28fubC03g3Vo7wntVWtG8Lng8rwGP30WK2qubl13ZUufoFQem348s6F2bZ9YkoLLs+AFqNUJX5wa4E3e/B5pyMSiIhENqsg403LrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cCQDKFde6UchrwmP0x0h+0S4BgTy02nYRNp+Lt6BxA=;
 b=JA3x8XnsS5w04bL6cpLSk4mKzy8TWz6X6QmFyhfNdYH0AAskMGKc474FScVawlrHhfSXVUfd4OmUi177eFOy7+1ESk21nsvV3edoLWIKtawShDI+RIHGuFOpV2+74nbCLna8RHthITr5pV/WdWnr94e42I4UoOc4ED+HQWo3v3Q=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by CH2PR04MB7061.namprd04.prod.outlook.com (2603:10b6:610:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 00:27:52 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 00:27:52 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng@tinylab.org" <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "bin.meng@windriver.com" <bin.meng@windriver.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 15/15] hw/intc: sifive_plic: Fix the pending register
 range check
Thread-Topic: [PATCH 15/15] hw/intc: sifive_plic: Fix the pending register
 range check
Thread-Index: AQHZBY7R/BnRbAxZ+0K9D0143fcrxa5ZvrEA
Date: Fri, 2 Dec 2022 00:27:52 +0000
Message-ID: <4d2fa372f88dda106d80bd26806bc32c2a92d784.camel@wdc.com>
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-15-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-15-bmeng@tinylab.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|CH2PR04MB7061:EE_
x-ms-office365-filtering-correlation-id: b993dc21-b4bc-4b43-a235-08dad3fc0c8f
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vdIyvU8EZyra8U8h+Yd2YuuDGdyEhkZE4VEoVrQ053K/0IVJGIqNPgRhXPzdZKjInEYDg5jT44E3p3+E/YiGS7wgeKfk3PjdFZvc3ON9frHWLvFjC5mGU6TYIz3rzJtEbU6khXcJWGCpE6BIt1et19waK1GvXR3mtyHbA9SOtisoZ/MDF+cbzwKdUWaswF4Ts54No2d5kf/3uzfdW6pOd+Bimyv8j0cPvhU9MDvN+KMgTUQanGbGDGj3TjWsrfTXvEwekFHXRnhtGNnfHTPN9/K70CAkrIs+8wUqeclEYOevIvuyKE8yXg9A3yvjN0JAKz5o6DAgI0UOlJD0el63Qp4wdpZfFOlhtjSDm/bSH45JhCTSq9oME8cC6OVM3v/8+wwjPn9ZxA9WIabEXOCIZ+zX7RXZvGcxNWYPFswGSMfTlK1S0ypHrhXkWhO/rB7St++eTthVEHZI5YAdXgPlP/npPK5NZUhCig1AibYkTxuBZYE0t5AN18eqq2f4BAMprm2yEMCZ4aJjZY0U5ijn8o9FNg0O2BLmIjazHmYtBUfHbWs9LIWme+X2/8yfj2io2DGpoKMYy3HyEKIdZpGZgNI1jOma3ORRouSE+FlRj0LBNc2/ol5CdThwYLykBA1BDD4IihOJjpGvRY0xEX7yYM6pto5aK57Ju3GIExRjmfXBKTW8BAx44uRKcoTriRm00DyEgM4d1VHxF3Z7MDXLww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(6506007)(478600001)(83380400001)(86362001)(6486002)(71200400001)(8936002)(54906003)(5660300002)(41300700001)(76116006)(316002)(6512007)(2616005)(2906002)(26005)(44832011)(186003)(4326008)(110136005)(82960400001)(66556008)(66476007)(38100700002)(66446008)(66946007)(91956017)(38070700005)(64756008)(8676002)(122000001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cC9xQldnUXM3aWpVKzdWWWYyM21QdUlnaUx1aGRIUWJyMHIrMHVMVVJtMjlI?=
 =?utf-8?B?RU9LMERiNlI3b3FFSGxmMkJvR1IyV2FVUDRSSC9Ha0t2dHdRcStQNUF1Z2ta?=
 =?utf-8?B?MU5JRTd1eUFCeTdiYSs0VVlmdDJ1TTQzYjREUll0MkNBQ2VHOHFIRGlMOHN0?=
 =?utf-8?B?Q3FzSlJaSFNpdHpIWmljaU9HUXR3N2s3SXlSbUtZTXhFb0Y5RStmb1ROOFRm?=
 =?utf-8?B?UkF2K0NEc0s1MWpjUmh1NlBTVU9BRXZYZ3lpWDBnY2hlQzlRRkdvMXJVai90?=
 =?utf-8?B?ZnJUVTdad3Bsc2pyY1ErcTFGUlpwaEJ4b1Q0ODJBNkhaemhJblI4c1lmVkNm?=
 =?utf-8?B?QjlXQnFhVjZscXdneTRNVHplYkEyNGJUWXhDQlVOK2N0RHlOZUExTldSaEps?=
 =?utf-8?B?V1lpMDc5TlZwQ2pYU1BVRW1CZFh3UHVILzNDaFdROTY4aHQ1SDlxUDY5bWlt?=
 =?utf-8?B?N29lanNYakk3WjhIVC8rQm5OOVdQSjkyWm5lenZ3TFBycm9oOUpCK1kvdDJr?=
 =?utf-8?B?NnIrQ295TjNsdmVJK0hBRmZRekFEK01ydG9TaE5IanlVVzIvVHZrWmxLNGI0?=
 =?utf-8?B?ZjNqSi80Wk51S0hMY3JvQ2k3UnJkL1hlTVRDNWo0alNHZVhocGg4K2RXREZW?=
 =?utf-8?B?UVRoL0w4UHljVng2MnpTc2E4M1FQNVUwR1FIM3JLRytKQjZwTjF6M21EOUtQ?=
 =?utf-8?B?L2NEZDZGMjNBMy9mcUdvV0ExTFQ3elM2dTh0K3kzVG5NK1l4Y3NHNmlNWWZq?=
 =?utf-8?B?NGlnc1paMkNKdVlRSHFSSWMzTkFDQm4xR3hIUkk2aUl2dXJUc21zWG05bGV6?=
 =?utf-8?B?aFdqbjZRcGtoYTl5alhJUGZJWi9raXh2a2IyVXUzUFNFUTd0RVZub0d0ZUVN?=
 =?utf-8?B?RlpIZnk4YzFPOUcrVmh2eFZrS1pUaDFHa2dwT25CRndtS2RUQkpGa2IvMzI5?=
 =?utf-8?B?U2wxNXJpTFlRZUlGOHpoa0dtcENuSmczcDNWc0xIZHcxYzVDNlR2eFdwZFlG?=
 =?utf-8?B?eVE3b1kvWjZJZTVSU1lzN3FSdS9BRHlicXkxejA5aEU5NVQ2TElqU0E5aDBU?=
 =?utf-8?B?RXF2R28zTVVHRmpnVGcwSTNGSGE0eTZPMkhwTmt1a2pGeTJzTEQ0OUdLRVZj?=
 =?utf-8?B?YnVFbXh0d0hJOXdoREluRnB0ZU9PRU5JYXg5RXdaOUNnL01rYkFIRUFEYi9j?=
 =?utf-8?B?bW5yZ1NERURNM0o5U0FZTDRHdDJHNnZRZE13Z0ZNZGpXSForMHEra0VOcldO?=
 =?utf-8?B?WXk0bERtUnQ2eGJYK1VtNVF0ZkNSalpyRkdnZFRYZWNrT1VESkZyU3FqL3hV?=
 =?utf-8?B?YStDNlM3OG1PKzFVeXBMaC9uWEVQUCt0VVVnQ3hoOVU4RWdyUkFGaVAxMUxv?=
 =?utf-8?B?ZmI5K2UrUjZ0djJyVlRqamhTWHZnTTU1N0VnNHE1VDlqcXk4TjRiQUkyNGNi?=
 =?utf-8?B?OEZpUFNJU2EwZVFyczVwTHNTOGdyT04vN05sVTY4bFhBQ2R4YXJJOGVuSkhE?=
 =?utf-8?B?WjI1c2ZyU3BKL0xzZUcxRkxnT1lKNXhJNFozSUlhdklkdXUvcTdXZnp5b1V2?=
 =?utf-8?B?YnhIVEc4d1FCOFMvcG9jSURwU3dVZ041RmJ2aXNlMzhHYVJka21xRGlJRWxW?=
 =?utf-8?B?UEpjTmlBV04zKyt2U081T2dWOGJKYVNIekdJUzFscVlsRnFEc05NcVg1ZHZS?=
 =?utf-8?B?aXFDZTdIM2FDOVJseHlORVZDWHg4aFJRMHQ3N3ZjSDQzYUZ5SnYyeVlVcS8x?=
 =?utf-8?B?R1lTckxNbzdOQlI3bXdsRzd0SXQ5TVhBQ3AyUE1FcmNvTEkwSzlpSFhnM0xJ?=
 =?utf-8?B?R08wWlJKUW5OZmxYSCtxR1dhR0cwWFE2WDhsRmJic3BnYTFybVVoN3dPajRj?=
 =?utf-8?B?VUhRdm4rdXJFRkh0Mzl4VS8wWTg2UkZQaGs4RVpxOWhHN2h2Q3BWRVBXbTMy?=
 =?utf-8?B?YitCRnRIamlXV0N4OS8vRWRlREtmL1hJQkhlVEhRVUJBUCtwVmtjbk1GNEIr?=
 =?utf-8?B?enVTZ3FpeDVZa3dZeGJ6am9QR2ZzSWZUa3hIUDVkQzNyUzBZL2hORzR6NFkw?=
 =?utf-8?B?ZjlYVW14UFRNVHhOelpLWGI4UUgwdXlYdlloS21pam5yVDJrb3RzbVhjZVdH?=
 =?utf-8?B?S1NuU21CVEtFQ0FKRktBa21EdUhYTS83ZXF4TTdPRUlGNldSZkxaemtyanZp?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAAB1FF685C0A842A77AE227A1E42D11@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: UvKdCztC+lNpqNEd/iIhZ2N6M9yLKt/75cGD6BMJlzmiatmbge7PSyfR3VZ49ScNClJ/qEPsqIEsCjJYcuz6s0bXQLyc8mTpQMtvO48qYSIOMC+WxfSJZBXM65Lk3NXg5pUJ1HOL50AceLNMYYm1lv7LOtSuC3x+LVUjSPqbf3BoS07mzL7mjsuzzf8ijdY4sieeBsbz1wnFjsA/RCS4V8fIQS5zlT384kNMWwMp9hOQuT7tvuNPBLxgptk3Rl2Q82r7YubkW+KMNeoyDE1l5/cftSwUwrLP5/eaNer7ZvNv4iuDt87GuqiI9UwbBO1lAP4gPQXHDLRoTGVMXBAaPXS0MTCL0szflG8CJPIXtmnKh4C/1o4pFQwKgu0k4AAxrVUoSJ1q/2POO3Zq0SDY5IQ01GzndFcNiGrUmU2U3CNHourlx/0Q5rZTXLqTxpZnKtgibjbmsEmpSu7l6O2ySBVvg7zO6o0YM4mP82awJLd6er1ehx9AjEruSXpTSXzNkTovOYYMCTTqoXm+7H0MlUumgqhXNYTbi2O4QJXojmDnILZddftM7xIHOQydMSHXyitznZP3dJC5AqASWYFAKUJNGEEWB8MR+/HJe0mzKj4BLdi74OMbgDN6wlXj8k43Ox/gSqD66H9wCntDbAL4GQw+YB/Hg+UEyyIBWv8VQaGHxIpFUJd+Yx9M1BzGukzIV7pvOm+UNe+IIEZ/diVHVYa9/KygL7UXtNCcOeYHjT0uzoGbi3QgZ1o5Ky88W3UdMSU7pKRqYAYimpMIbUqU7fbvWpDEqThrflTAu6AWRmxirW8IZIrP8jSPHSM51h/4wh6lSxVH0kWlWxkajITaigw7zLqv2Mtdu+ysasPCESw5DLJ9u7lZb/eoGL/19OYih43+FUPFWfoFvDO1sC25GA==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b993dc21-b4bc-4b43-a235-08dad3fc0c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 00:27:52.1680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /yMswVDd7sVnyfalO2Fc4ufMKwCFQeOMY1elphoir9YG/f5QDcok3l0q3jH2k8V8DE7R7vS2VKZWwxvsdlpHcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7061
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=3286bccba=wilfred.mallawa@wdc.com; helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Dec 2022 00:28:03 -0000

T24gVGh1LCAyMDIyLTEyLTAxIGF0IDIyOjA4ICswODAwLCBCaW4gTWVuZyB3cm90ZToKPiBUaGUg
cGVuZGluZyByZWdpc3RlciB1cHBlciBsaW1pdCBpcyBjdXJyZW50bHkgc2V0IHRvCj4gcGxpYy0+
bnVtX3NvdXJjZXMgPj4gMywgd2hpY2ggaXMgd3JvbmcsIGUuZy46IGNvbnNpZGVyaW5nCj4gcGxp
Yy0+bnVtX3NvdXJjZXMgaXMgNywgdGhlIHVwcGVyIGxpbWl0IGJlY29tZXMgMCB3aGljaCBmYWls
cwo+IHRoZSByYW5nZSBjaGVjayBpZiByZWFkaW5nIHRoZSBwZW5kaW5nIHJlZ2lzdGVyIGF0IHBl
bmRpbmdfYmFzZS4KPiAKPiBGaXhlczogMWUyNDQyOWU0MGRmICgiU2lGaXZlIFJJU0MtViBQTElD
IEJsb2NrIikKPiBTaWduZWQtb2ZmLWJ5OiBCaW4gTWVuZyA8Ym1lbmdAdGlueWxhYi5vcmc+Cj4g
Cj4gLS0tCj4gCj4gwqBody9pbnRjL3NpZml2ZV9wbGljLmMgfCA1ICsrKy0tCj4gwqAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9ody9pbnRjL3NpZml2ZV9wbGljLmMgYi9ody9pbnRjL3NpZml2ZV9wbGljLmMKPiBpbmRleCA3
YTZhMzU4YzU3Li5hM2ZjODIyMmM3IDEwMDY0NAo+IC0tLSBhL2h3L2ludGMvc2lmaXZlX3BsaWMu
Ywo+ICsrKyBiL2h3L2ludGMvc2lmaXZlX3BsaWMuYwo+IEBAIC0xNDMsNyArMTQzLDggQEAgc3Rh
dGljIHVpbnQ2NF90IHNpZml2ZV9wbGljX3JlYWQodm9pZCAqb3BhcXVlLAo+IGh3YWRkciBhZGRy
LCB1bnNpZ25lZCBzaXplKQo+IMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgaXJxID0gKGFkZHIg
LSBwbGljLT5wcmlvcml0eV9iYXNlKSA+PiAyOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcGxpYy0+c291cmNlX3ByaW9yaXR5W2lycV07Cj4gLcKgwqDCoCB9IGVsc2UgaWYgKGFkZHJf
YmV0d2VlbihhZGRyLCBwbGljLT5wZW5kaW5nX2Jhc2UsIHBsaWMtCj4gPm51bV9zb3VyY2VzID4+
IDMpKSB7Cj4gK8KgwqDCoCB9IGVsc2UgaWYgKGFkZHJfYmV0d2VlbihhZGRyLCBwbGljLT5wZW5k
aW5nX2Jhc2UsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAocGxpYy0+bnVtX3NvdXJjZXMgKyAzMSkgPj4gMykpIHsKd2h5IGRvZXMgYWRk
aW5nIHNwZWNpZmljYWxseSAzMSB3b3JrIGhlcmU/CgpXaWxmcmVkLAo+IMKgwqDCoMKgwqDCoMKg
wqAgdWludDMyX3Qgd29yZCA9IChhZGRyIC0gcGxpYy0+cGVuZGluZ19iYXNlKSA+PiAyOwo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcGxpYy0+cGVuZGluZ1t3b3JkXTsKPiBAQCAtMjAy
LDcgKzIwMyw3IEBAIHN0YXRpYyB2b2lkIHNpZml2ZV9wbGljX3dyaXRlKHZvaWQgKm9wYXF1ZSwK
PiBod2FkZHIgYWRkciwgdWludDY0X3QgdmFsdWUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNpZml2ZV9wbGljX3VwZGF0ZShwbGljKTsKPiDCoMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqDC
oCB9IGVsc2UgaWYgKGFkZHJfYmV0d2VlbihhZGRyLCBwbGljLT5wZW5kaW5nX2Jhc2UsCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwbGlj
LT5udW1fc291cmNlcyA+PiAzKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHBsaWMtPm51bV9zb3VyY2VzICsgMzEpID4+IDMpKSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoCBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJPUiwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXM6IGludmFsaWQgcGVu
ZGluZyB3cml0ZTogMHglIiBIV0FERFJfUFJJeAo+ICIiLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZnVuY19fLCBhZGRyKTsKCg==

