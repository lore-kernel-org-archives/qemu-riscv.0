Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0te8-0006pz-Sp
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 19:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3286bccba=wilfred.mallawa@wdc.com>)
 id 1p0te3-0006pB-9h; Thu, 01 Dec 2022 19:11:11 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3286bccba=wilfred.mallawa@wdc.com>)
 id 1p0te0-0004vE-HE; Thu, 01 Dec 2022 19:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669939868; x=1701475868;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PNKChjxtemK8Rtfg2MVldLJe4/BjZ/6OFiRAR/DM5h4=;
 b=Q5+fLufx/EZ/hIniYAhdKu1EkDSzvceE37YsT50rh7Pu4awfDLPvnPiN
 2kS2h6XJLGt6Cj2yi0fCvXs4u8Wy6x5ZVPGowFTgwYPoS5MQ6vQPn0rYF
 tlFyvmC3mMnWhJnxgOtGDARTzH+ZvlGQQAzzcoHRQb5Ajwj1D8T//i26A
 ow6HaFA+VoxKBkKtUFQZRorR9T6AOaFn6tx741TKOg8KmFS9uE96qQYWJ
 c1epTICzeR/d1AceWZORbvRrBcNOxwg6bGZ6wzwDgCiwjP6xHhUAJVlWx
 cqeDu7gzifyLAajoy3f5OUXr8TgwbMLr1ryNRsY0wgAXF7ulBWEjYb2dK A==;
X-IronPort-AV: E=Sophos;i="5.96,210,1665417600"; d="scan'208";a="222869330"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2022 08:11:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bY/xyE4/Yhwn42KdmMchtVtWkmTRz15+j4DTKcgexlvHjVJnUfH6xu539+bafU6wQK2GufUxRpqHpiENV6FllWWawb8mdcZXyQ/+9XTZQoUpuu+hqi/uYhL9AuoHzupuEQPEwH0qGzqPWAKn8znOZC5mqncKH9cTGaIzUauCZoX0yB2/6daGXF+2w/7C1xHOBpZpfCEs0tSSkyB/fFvO4IteTz26iikturgBBt2yQInNfnVxDf6FmzUxMBOxy2hNKV9TNOruRZHWT5aG6EC8IPvdCAFi9mN+oPnC1FShhD67EJ4rKcbDiMfnk+97Ff/SHWaSC+pOoplMepM5bwTfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNKChjxtemK8Rtfg2MVldLJe4/BjZ/6OFiRAR/DM5h4=;
 b=IfRcKV/RWSSmaR8Y6YsJe9udda7xyPsk0DK1l/pXpY9hywjmKMVKXGtYl30CblpsIUJ3It/y9BK4I2kHd22a6EVqHUAdk2+u+4ya7KpgXKWxfNg+BwhOmvdK3UJyxWK47V9hgMjv/iCcNcc02LbQZZLtDek13d252S/5UX/+v1txTtlwAItYqWgnKzf9al5+vPvcBcL/igufTgs04LIqVMFamUtnSNBNBXJtjacPctX6fXKlTffw1P7WNOkQzZKJP/vPjdQYXvOq2xJ0bd2BWhbQ+N7o3rveGsKS3EdZg4EyFbs6TrEudaOzoFZfeLuTBKoN0oSlm1MpIl4Z/MOw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNKChjxtemK8Rtfg2MVldLJe4/BjZ/6OFiRAR/DM5h4=;
 b=eIftk/vA1wGfOMcwdtxSwdFoycWdXm4toHRlmu1PhMhnCvw0Rfe7548HGe9J3IIzmo5j1hMQujA7vhjt2CwWA6DedT8msdj02/31kyrw8YXUM4+JyUG+2FiP1eSMFm2Cut20ZDpNOdkJg4+3gCl6NsYFtv9pFkoAB3jj51V0LAE=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by BN7PR04MB5409.namprd04.prod.outlook.com (2603:10b6:408:35::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 00:11:03 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 00:11:03 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng@tinylab.org" <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "bin.meng@windriver.com" <bin.meng@windriver.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 14/15] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
Thread-Topic: [PATCH 14/15] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
Thread-Index: AQHZBY7QGsbI5RYNBE2vyyKh2RKtUa5ZugGA
Date: Fri, 2 Dec 2022 00:11:03 +0000
Message-ID: <cd38d2925d5ae80a825d87b2c3d31d8079c79d92.camel@wdc.com>
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-14-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-14-bmeng@tinylab.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|BN7PR04MB5409:EE_
x-ms-office365-filtering-correlation-id: 1b59569b-d28c-48f9-b8df-08dad3f9b36f
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FJab5N8sXVIKARDPnw1Pk4kvZtM1r8CzEbvNab9WfkF38MaMRIEVjAHEo2wSaSCjHGEiuRhF2yIbZpsjXcWLWPymW2aBs6JxmB/IyPp8udjfWAMGn3+iI+y4m3NB0PFJA36bSUTpj/08e9yxe4lU92HidJIG1Deri11G4Jp5ayxQCCrQENfVcumiaRNxbxi91t2fjc8A2SKi/a7wRlAKDr5k9mR/ThjGEyH3d9ay4qCn7v5JazzxsBgBNWrePiPwxVgiJoZibSxEIU1SmCGm0jjRxCM6c/t082aiAnal/ItqTT99+8p0+jgWkYTv9AeuuNBIVLgrriQhCOcQLchRnqtcRzdVG8Th1QRjiGn/tE7Ye5IvgSWQ0hXPkeEaIPAWutgbC7DqsBdjbNrRPFmcDEdzZJcMQVqujHC73Eu5YelZM+5C0B9ANDNpszrOfjRBEJA2aLsLjNBRFwIKSiTVURyzylicErz3WvqHFAPsrLzwiHZVxdFVjUHrSS9fEdIXfpUemyXKnkgc0zPqYVIJPMXQgG9lENZoit5RAdWUK4yP/tfL2C/h+MH3o8qfU+GQeObDw69GDRgIkB5yXs7lbBeo5TxcswKN9jscmxFOCHLnVG/7aOAtminO4RDuhTRh0P7bHFn3mxVd7hA12bfsVXC/o1qJZKizMv0QhDtWA7KAxYfmsak0YR3f8Mrygm+mb6YpyCJhxHKzK3h3kD+H3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199015)(64756008)(44832011)(5660300002)(76116006)(8676002)(110136005)(54906003)(66946007)(66556008)(66446008)(41300700001)(66476007)(4326008)(316002)(91956017)(71200400001)(6486002)(122000001)(36756003)(478600001)(2616005)(82960400001)(86362001)(6512007)(6506007)(38070700005)(26005)(186003)(8936002)(2906002)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ui9hVHlYbmgrbWtVT21zWW83VzRydjlYdnFRdlI2Qzh0NGJFL3BwajNLdVRB?=
 =?utf-8?B?WXVVQmJncTFYanZ4MlVrUHZvbzhCZzFTUmtvWmhRTHR2WnM3MXhhRVNpdGVT?=
 =?utf-8?B?dnk0ZUw4MzgyalVhbThyR1lzNlYzNG5BQndtUlBURitrUGpZZU5oYU1jZnUr?=
 =?utf-8?B?N3Q4SWJIeXVyZTR6eDhVaVc1L3liZ1VxRk1XT1RjS3QzakZxbVNHTnJYdHdP?=
 =?utf-8?B?eklRLzJJbkp0cG4vWU94cXBjVnZtRjFiRHZERUEweEhLRnBVOTBRU2FWQzZk?=
 =?utf-8?B?b1BVZVh2V0FWZTNPS1R0b0NSVGp5ZWhsdHRsdW9YcmdVaWJET1Y2a09MNE94?=
 =?utf-8?B?OW0veUtvZVM0ZTlPUGh6WHdsbk9UeXJDbzNiOXhYSE9XVVllZnhaTFlFUXlZ?=
 =?utf-8?B?aXZzTHNESzgwWEd6V1Erb0ZQRlVSUWVUZjhPRENhbzVuOE5pdUtNcFYzeTYy?=
 =?utf-8?B?M0VTczBNeWI3MzJYaUxHQ2hmMnNqZmY1Y3ljRFNheHpwT2JDTFF6aXR5Z1BC?=
 =?utf-8?B?ZnhwNHZPN2dTVG1keUlVdTBRekhsVzQ4cElHSmtKaUtpdGVVa0NiYmNIMUxm?=
 =?utf-8?B?YkRubExScEljVUNvNnZSb2NyR0wraFhsNlFzajZUb0wxQWRzSWJBc3FCNTVq?=
 =?utf-8?B?MnZMQndhSGNOY3hYUGZHaGpTdlpZdDlZWGQzRCtuTjR3WG1pVlRGa3F2all0?=
 =?utf-8?B?NnVoc1VWR3Erc3NYSTlUakQwbUlLMng2eVAyYWZpRWxUTTdJWVE4bzg5cVZp?=
 =?utf-8?B?dFJUazhBTkdyeU9QcU5QU0xjM0djRG9UUFRtRlp2dlcrMVF1Uml6dGhhQW54?=
 =?utf-8?B?bGUyVCtVZVpLYWs2NCtqYldPVHBCb2RLYUhQUm9nNU1yRE1VcHNHcUJhc3Ix?=
 =?utf-8?B?Y2NJa3ExdEhtajZCQk1ROUpzOEErMHQyRk84RDI0aXVZZjI2WUpZSUU2aE41?=
 =?utf-8?B?a00reDVMK2JvVE5acXdqNnR2Z1J2TUZkVCtXbERQdi9rbFp2WjdKWERzYVlT?=
 =?utf-8?B?Zk1oRm9aZ1dOMVpWRWtxbC80WGFGb2owc2V0c2hmMVRSNDJnOUV4OWtPVDBn?=
 =?utf-8?B?b2FibVp4RnU0ZU40S3hPbmFLZlhnODNiZjhWekpzT3pPeVFzcHdIaUNUWjRz?=
 =?utf-8?B?eHN1eGFRQzBPQWU3QVJTQVc5RUJ5ejJjQVdlZmFWSmhCTllCMFVmaEdJbkxY?=
 =?utf-8?B?ZzdvaG1ZeUR5ZnhQdXpHMTMrQjYxTmJaNHJwY2Vsc3g2VERhVytVUTYwdGZB?=
 =?utf-8?B?TGtNeFV1Ny9LL1Z1SUZYNkZCZ1grd1dGQVNmSzBQY0swejBML0JVdzZOZjJa?=
 =?utf-8?B?ZFBVcktBYytGSkFZdko5Wk5qNEdtTisxR1lVcTR2WW5haGg0OWJzd3BzMHhN?=
 =?utf-8?B?Znd1UVljVlhzTUVvd1R1RWFaNWZJamVJUWNURzdNV0lGTE5sVnJ6VDNDWXRs?=
 =?utf-8?B?MUpXU0pFbUFMR2ZUUUlzYytqUEhpbXc3ZHlZN1hLbGhrTlJEbFBwRjFBQzBD?=
 =?utf-8?B?aUNGQkxFUmdkeXViNXlteW9XdXVDZHRRakRmYjJ3UitIcGFybFdTNzJsblEy?=
 =?utf-8?B?a0dpYmZqS3ZZeXNhUVlqb1kzM3diYlR2QzNHNXF3Q240ZW1NWUtqQ29jRDZP?=
 =?utf-8?B?Y0EzUUVXQXFoRWhlVi9RbEVDSU1DQ2Joa016ZkdoU3d3UVZvUHVoMzlQV2w2?=
 =?utf-8?B?ZE5DdkNjRVNaaTBoR0VSUEpVK0Z5eHF1dFB4U2FTNENTRU9CVXM3VEVSN1ha?=
 =?utf-8?B?SitWVUhCV0VXdUdXN29aVTlraVVGanZpcm9QQTZGcWp1a0hLMEJXOW12VUVW?=
 =?utf-8?B?cDBxRGhBTjJtbFlKeEd2MU9sdWk0YzgvVWZWZDVXSmllSVdBYmw2QWRFZllP?=
 =?utf-8?B?VktuRm95QllxWlp5cDBkWXh4RWg4Q3JEWmd4NGJDTTNnVzJXNnhwYThMdWpJ?=
 =?utf-8?B?RWZhZURkZVZ6bm1VQ0ZLVFVmM0lPZVlXVE1IQjdyTDVVWHFBN3ZCbkFKWWVp?=
 =?utf-8?B?TWZCR1A1QXdIRkNIQmZDY25tcy9wazlFN1lGOEdHenVBYjFFOGN1Q00wUmdY?=
 =?utf-8?B?YWUrYUt2YWI2N3JnYmJSdEwzblQ0VXFBOXNrNUl6bWxrYUl0WDYwcW9nSEUy?=
 =?utf-8?B?OE83YnN4TzBGR3Vsd1B0Vk9nRUhQSFJnbDVOZ2FHNHF5Z0hNL3pXK1gyZ2NP?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A77817826D5974AB782F47BBC7B7282@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4e6l2wNxS900wdY4MVgOTeBd3PYzPRtf6WZ+xYwU5aHwkoPk92LhrJoHR0u6Meu3yMqMaljcsYLgxTwGy8/RwTWi3TYcuIfbM3rCdb6SyvgXxJJ+vJbBwtqlw/yDC+R2KqfxcpaiqMz00W8YO0Dps11py9C+6ffVq6RKfrnArLsCRK60lSa1cH7VdANW5NonRy3/Vk2243wR3W1ZmsHYU4xQkh5kz0Y/Y9aTeCefejdOwGE9ifbXqxXPYL6mMnA4D67EQ/RIo8Td9tIdLO3PMBP08mKbDDel36R+OLMd/FnUG6VQi3Y6a3ogyWGUs/QHrfySMCfmJuz27o3+Kv+zGuBe3MzqbFwOwI5NJIJfXajVuqHN7bWlPqYdCQGoQ/gEJw09xnhQsoVl/1hWeJuUc9+HURF9hLfUWo+sAUvHQXCpRywewBQNzHsdQQY8f5/75QETvEUXOGXk7Cr2bb0kPcV3IfO//9fkizT/YzcsZel32P4D4RguJH2MX5/+SUw6enm1MDaxA/egmRw4Q9uqpLOy/2Aao0ClcqHZfhIoxNyCdY3rt5pndQZh1ISJmzLG/3aP8wWt8duGmVDAH/QHIxijT95MqgPbDrH9jB87ftiwXkX/8UufLKeIdw6NT1EPXQBijqRfPyLmpOQiHOsTZvTCgf2L99T3iXWVpMug3P67QljXOgvfv80WPNeN/8a+fOPOoO5SIz4I1d2mMbD+uczwsw2zWwKjNNJcSbHGTIg9X+I8dq2ij68bMQYAXG1rEPMCcb/ijmiUGiH2Z9xyQ70bbpboyBcdzf/ZP9wiXMk/1+y6lG/mj7raQeGUe7rhKvGVxs+cEQ1jZGvuCXtW50k6mx62222tApCEKzqXL1RA9f1rIIbdulNgBMjCLH5ZCOPBvHrqGTo0eYCZnaMQVA==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b59569b-d28c-48f9-b8df-08dad3f9b36f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 00:11:03.6794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rSOqrzr0euFZfRjUbRXYr57jeafexXdugqxemadOlB9qymdZJYU3PQRa54+/WLQbzQY1QKcCtQQMPJbWwOvopA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB5409
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=3286bccba=wilfred.mallawa@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Dec 2022 00:11:15 -0000

T24gVGh1LCAyMDIyLTEyLTAxIGF0IDIyOjA4ICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gImhh
cnRpZC1iYXNlIiBhbmQgInByaW9yaXR5LWJhc2UiIGFyZSB6ZXJvIGJ5IGRlZmF1bHQuIFRoZXJl
IGlzIG5vDQo+IG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIHRvIHplcm8gYWdhaW4uDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBCaW4gTWVuZyA8Ym1lbmdAdGlueWxhYi5vcmc+DQo+IC0tLQ0KPiANCj4g
wqBody9yaXNjdi9vcGVudGl0YW4uYyB8IDIgLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBkZWxl
dGlvbnMoLSkNClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3
ZGMuY29tPg0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3Jpc2N2L29wZW50aXRhbi5jIGIvaHcvcmlz
Y3Yvb3BlbnRpdGFuLmMNCj4gaW5kZXggYmU3ZmYxZWVhMC4uZGE3M2FhNTFmNSAxMDA2NDQNCj4g
LS0tIGEvaHcvcmlzY3Yvb3BlbnRpdGFuLmMNCj4gKysrIGIvaHcvcmlzY3Yvb3BlbnRpdGFuLmMN
Cj4gQEAgLTE2NSwxMCArMTY1LDggQEAgc3RhdGljIHZvaWQgbG93cmlzY19pYmV4X3NvY19yZWFs
aXplKERldmljZVN0YXRlDQo+ICpkZXZfc29jLCBFcnJvciAqKmVycnApDQo+IMKgDQo+IMKgwqDC
oMKgIC8qIFBMSUMgKi8NCj4gwqDCoMKgwqAgcWRldl9wcm9wX3NldF9zdHJpbmcoREVWSUNFKCZz
LT5wbGljKSwgImhhcnQtY29uZmlnIiwgIk0iKTsNCj4gLcKgwqDCoCBxZGV2X3Byb3Bfc2V0X3Vp
bnQzMihERVZJQ0UoJnMtPnBsaWMpLCAiaGFydGlkLWJhc2UiLCAwKTsNCj4gwqDCoMKgwqAgcWRl
dl9wcm9wX3NldF91aW50MzIoREVWSUNFKCZzLT5wbGljKSwgIm51bS1zb3VyY2VzIiwgMTgwKTsN
Cj4gwqDCoMKgwqAgcWRldl9wcm9wX3NldF91aW50MzIoREVWSUNFKCZzLT5wbGljKSwgIm51bS1w
cmlvcml0aWVzIiwgMyk7DQo+IC3CoMKgwqAgcWRldl9wcm9wX3NldF91aW50MzIoREVWSUNFKCZz
LT5wbGljKSwgInByaW9yaXR5LWJhc2UiLCAweDAwKTsNCj4gwqDCoMKgwqAgcWRldl9wcm9wX3Nl
dF91aW50MzIoREVWSUNFKCZzLT5wbGljKSwgInBlbmRpbmctYmFzZSIsIDB4MTAwMCk7DQo+IMKg
wqDCoMKgIHFkZXZfcHJvcF9zZXRfdWludDMyKERFVklDRSgmcy0+cGxpYyksICJlbmFibGUtYmFz
ZSIsIDB4MjAwMCk7DQo+IMKgwqDCoMKgIHFkZXZfcHJvcF9zZXRfdWludDMyKERFVklDRSgmcy0+
cGxpYyksICJlbmFibGUtc3RyaWRlIiwgMzIpOw0KDQo=

