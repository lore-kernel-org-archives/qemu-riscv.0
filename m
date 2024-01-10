Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C652C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 08:03:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNTYn-00027q-Ak; Wed, 10 Jan 2024 03:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rNTYl-00027E-VD; Wed, 10 Jan 2024 03:03:35 -0500
Received: from mail-bjschn02on20620.outbound.protection.partner.outlook.cn
 ([2406:e500:4440:2::620]
 helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rNTYj-0004Cz-SS; Wed, 10 Jan 2024 03:03:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2GwBGsFEfYPhXPi6Ds4qPz+f4fdKTAglBJ4ZylLpGNyTtKo/Mh8LFcgmZ7ng5YaG6QDIhTfOt2dfAbw/sme1RjyxT/4FWM5Sfpzu2GdC8aV2bFbx75dRoNNDcN+gReFZBiXlzyoTvBfo40F1NWr7xKqsC3rGcmpt2908jCnwNfhry4bKBpu4Oe8I1kN841GXk+wevXqpqMfLBnIvWSpGBjghK4GUVwLZfocHM/y9ZVjtlM5bhpLjVzRkrryeYzAPJkm347T6O3a3ImFarOb76NdqeV+RnjlEbAmRL1xUE6e2G4l8Up60wPZ/8ePJq70nOwIVV/1QWjeBHPfzGrsxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWhspMuDL6Ty4lEbuffb+m063T3ZjG1PuUjYZyU/ULY=;
 b=fcdBVMKunBd13kuaV1dGBtAtV0gqaYuaLVmUh0wJofxZjoAja7bx9OsSTGwjNjhxJdHYUQmkoOVOCdh/nCXW4U39Em2Fs3HDvvefMxiwjWqPYN9623mB5rGN7b7BSLG5opfz+Gm1ESV2gQ9/XhvH10MENITaiDYV+2shlTF2JcFAaTtvlzgKZ/LYRuU39KSci0gTjX/fpfoi1620MfxHJ5fU19yI8Fx6p2tm/NNsKN1irjUctS+ylN1FRZpLpenF7kv0pWqgJXQWK9DY6zQmWy7ezvQX96AbQv3PZXPmEosP3mK3AnJmuzABE8mWUvgFNXEdfxQa8T2UW8wpniFoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::14) by SHXPR01MB0782.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.36; Wed, 10 Jan
 2024 08:03:25 +0000
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f]) by SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f%3]) with mapi id 15.20.7135.032; Wed, 10 Jan 2024
 08:03:24 +0000
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Sunil V L <sunilvl@ventanamicro.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "anisinha@redhat.com" <anisinha@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>, "liwei1518@gmail.com"
 <liwei1518@gmail.com>, "zhiwei_liu@linux.alibaba.com"
 <zhiwei_liu@linux.alibaba.com>
Subject: RE: [RESEND RFC v1 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR
 creation to common location
Thread-Topic: [RESEND RFC v1 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR
 creation to common location
Thread-Index: AQHaP7Z27iEkwerb1kSWH+lHBrIFFbDLI10AgASqhgCAAulXwA==
Date: Wed, 10 Jan 2024 08:03:24 +0000
Message-ID: <SHXPR01MB0574A03EA35A5C49357BC32D9C69A@SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn>
References: <20240105090608.5745-1-jeeheng.sia@starfivetech.com>
 <20240105090608.5745-2-jeeheng.sia@starfivetech.com>
 <7cb2ab36-811a-477f-b2de-1f581150a595@ventanamicro.com>
 <ZZvdzOjQBbxfmuRJ@sunil-laptop>
In-Reply-To: <ZZvdzOjQBbxfmuRJ@sunil-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0574:EE_|SHXPR01MB0782:EE_
x-ms-office365-filtering-correlation-id: 390595a9-2a49-46bd-62d9-08dc11b29f09
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r+VSchBzfwGhzL5K9KmTlQHvp+B8R4t3KfKrPV5fErXL/dd2v0MCupbO75sIHB8Hf7r5hMEPcblH977SPFfd8NAv9hDMr63IANOu2xuGi3qC0xs01Pqbk9B8wOxDNbn5u/OOnfxYAed3MJaHyKRQTgCE/bZfYKmtk0LVGoaxdzhLbKifvC5Jx9401XGxFHsn8/aR3c90ummF3XYQtrpIGXzchgTWG1wqdaiTdL6QLmKzJcUsqZzXd6vbM50FHJvJG3beJVE7jF9I8SXZKgDNZvseqLZZVmRCHvQoo8CabMPdc+sH7zPGnpURvCf8kQRLLCeNFA2G9PHZJyWLEpxPEbHeFnS1fYJS1idE+WQJX8U/c5cZAtVEM5fkBLXNKfnHWlXI5/niBRDJ42v6Q7NX3viffL1Z/+P8fB6xvvTwLjSFZ1Xb663+poYoHs1J/6cZNaRVIXLPBeSEKkGuKaQ3zuuEPr5pRy+gtIn5YvZ7+enmYnxjNChOF+VqbxCnu0t7X720hG0jfiZKZMDMUMj+YW7KeAdm/bDl0/goUp/q70eu69RUrt23FflHDfs1pZSz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(39830400003)(136003)(346002)(366004)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41320700001)(71200400001)(38070700009)(40160700002)(83380400001)(53546011)(9686003)(7696005)(38100700002)(508600001)(122000001)(8676002)(86362001)(4326008)(55016003)(8936002)(41300700001)(7416002)(5660300002)(66946007)(40180700001)(2906002)(64756008)(54906003)(66476007)(66556008)(66446008)(110136005)(76116006)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FJBqzEdeg6P8d7EguFHtkEm7pmguhU36UWxBUk4SMydV7GZeyivkoeXFGhqL?=
 =?us-ascii?Q?gEhSVSuG6aXlsw2IHj/vgXacaN5J22YzDhDHxingmy3QzsVAv6LzankgFPiF?=
 =?us-ascii?Q?it2bSEowWiL5GCNXIMRRKLP5ACco5JeiJ8VsDFLHTtG8Y1Npx/ivs+8RRBoP?=
 =?us-ascii?Q?l2cIk1QVw3mjT9ZoCobB6CR5PefMfDf6/rT7an8ghtadARrk1rW1/BNFFXOf?=
 =?us-ascii?Q?nBvAK7uQrp0mQwSP+E/sWVruweBQtHl226DreytcO5eLaMl5gZ+ztsifsGfa?=
 =?us-ascii?Q?UH6KvoXdlRx/34HhmWqoKBIWCjr5tLgxCh81zakIgfIbB7jyzuLJKzcTwcxO?=
 =?us-ascii?Q?D3X4NhGkB6JLpqXpMgp7CzT+x26UluH9jdOXyOxW+QeOQlV0SPFrYzuCGmbD?=
 =?us-ascii?Q?RdbpH4yipt75NyZ5F0POhuOWxOU3Cqe7ew7hY2nmaTVmiE/iZbTtfUc3WKnb?=
 =?us-ascii?Q?X4uEWKAU/PB+seI6d9iPJMZ9T2IJyoYOwE7ybK0XOf54gJXhbI2xETIGwTdV?=
 =?us-ascii?Q?aLfDM0jdCBLlAAuPEM7Wq/26vSWqCc+2MIjNZuFzgJQPPOzmCU0Irtxnm3ym?=
 =?us-ascii?Q?dW4V653jOW0yaajJwPXAEOf7DLDO1HmEoSb8X9veRAzaBYlVLyIIC/7/YrKH?=
 =?us-ascii?Q?zvN8cFQX1hvZD8aH0ajtHAd21rUZUXDqRZ2C+DMgSn7wRlUZ/oOZqIfxlMbe?=
 =?us-ascii?Q?Vfsn5u/k3wjt9RGLfIxLKZkR0D93Th1GOmL45fK5dbJKZiI+Ju1fdO9ktE+Y?=
 =?us-ascii?Q?IVM3G5xOCiJhQ35uWnCxZSSW7NcufCgPIIJWOUGIzzMlYk9KuadShH3h7qPZ?=
 =?us-ascii?Q?IwY2TyDJQpLwB6X4XN5x8toyGVhCsPSmFzsxTDVldYaz2TxzXg68DbGUFQWp?=
 =?us-ascii?Q?v9i7+nFwomq09LhLQyDzczeyRECRn22jPXIuLlr7s3OurcMCdjDUGIqeV+/Y?=
 =?us-ascii?Q?mIJ+2LpSPvNoKFp6CMv5q6IJ/yz2x4Nca2utusS1b8mUB6aH84qBmejEwa7u?=
 =?us-ascii?Q?2eFuLPdzkFMPUwtVcoioTQoILvB5t71qz1H7aq3uDUTYARXX6Pu2+alg9ddL?=
 =?us-ascii?Q?qKlGBk6GoFvdD+sUV2kqUPEP3V1pvZfAnX19+jK/us9Pik0wUyPDNe18tBvh?=
 =?us-ascii?Q?dIOUKjRv3K7M+yq9awYaYNAMoyLknV+wZE5ZkF6lkRwuOrmx3SVDcVF1qYKo?=
 =?us-ascii?Q?5En0OhYIewb1HEAt7er5HDapZO+WQFuf6KCxHUjS/r6kiIn9uidjqwayb0mY?=
 =?us-ascii?Q?Hlahch9E38t55SmUhbL82VBmdFsN4fu7r+xB8ZP5axCElQ8rAy7FW7NA8SpT?=
 =?us-ascii?Q?QvAOH0I5uNJNeOz/lJ8OrNNzB+qCFEpI9lTtn5OKMd8FA8CGQzzizOV9g2V4?=
 =?us-ascii?Q?n4wibkYPYL7/tvgd0Woq/FDrIxgW08dahLxxJUKhq7YgAdqjsSwbITN0aS2R?=
 =?us-ascii?Q?UR1p9IQ7jmjjLoj+ZEEwPiMVrSHO0pL9y+nsss5NHgpzSxe9WFo0SO7Uk7YW?=
 =?us-ascii?Q?DA9e5irOQWEiMvAWyk5GhpLYSgb1QBI1wnAdbAUPgkmcIkr2aCIpHsidk8Qh?=
 =?us-ascii?Q?WOC/+gMVPMXELJ6kenl6E7dD+GnR4EnQwrgOyl+0H974uFUs9w7FQ5AHo78F?=
 =?us-ascii?Q?ZeCMTgfMYNrH9JdtFLYnhpVqCsZ3AZvtOhL8e2e2jMoQ1vC6dw1/AACJ1gs0?=
 =?us-ascii?Q?ec5Jkw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 390595a9-2a49-46bd-62d9-08dc11b29f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 08:03:24.9301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uxL3DjpAmZKDqKdrL7MsA3z3T6axrVdgL0+cLha3YxswiGUD2lhLizuPfIYC7iqsj1awxYB1JWGbz3byM4Ib8e1LMEVsE1oVjCTbtzPwwzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0782
Received-SPF: pass client-ip=2406:e500:4440:2::620;
 envelope-from=jeeheng.sia@starfivetech.com;
 helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



> -----Original Message-----
> From: Sunil V L <sunilvl@ventanamicro.com>
> Sent: Monday, January 8, 2024 7:35 PM
> To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Cc: JeeHeng Sia <jeeheng.sia@starfivetech.com>; qemu-arm@nongnu.org; qemu=
-devel@nongnu.org; qemu-riscv@nongnu.org;
> mst@redhat.com; imammedo@redhat.com; anisinha@redhat.com; peter.maydell@l=
inaro.org; shannon.zhaosl@gmail.com;
> palmer@dabbelt.com; alistair.francis@wdc.com; bin.meng@windriver.com; liw=
ei1518@gmail.com; zhiwei_liu@linux.alibaba.com
> Subject: Re: [RESEND RFC v1 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR c=
reation to common location
>=20
> On Fri, Jan 05, 2024 at 09:19:14AM -0300, Daniel Henrique Barboza wrote:
> >
> >
> > On 1/5/24 06:06, Sia Jee Heng wrote:
> > > RISC-V should also generate the SPCR in a manner similar to ARM.
> > > Therefore, instead of replicating the code, relocate this function
> > > to the common AML build.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > ---
> > >   hw/acpi/aml-build.c         | 51 ++++++++++++++++++++++++++++
> > >   hw/arm/virt-acpi-build.c    | 68 +++++++++++++++-------------------=
---
> > >   include/hw/acpi/acpi-defs.h | 33 ++++++++++++++++++
> > >   include/hw/acpi/aml-build.h |  4 +++
> > >   4 files changed, 115 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > index af66bde0f5..1efa534aa8 100644
> > > --- a/hw/acpi/aml-build.c
> > > +++ b/hw/acpi/aml-build.c
> > > @@ -1994,6 +1994,57 @@ static void build_processor_hierarchy_node(GAr=
ray *tbl, uint32_t flags,
> > >       }
> > >   }
> > > +void build_spcr(GArray *table_data, BIOSLinker *linker,
> > > +                const AcpiSpcrData *f, const char *oem_id,
> > > +                const char *oem_table_id)
> > > +{
> > > +    AcpiTable table =3D { .sig =3D "SPCR", .rev =3D 2, .oem_id =3D o=
em_id,
> > > +                        .oem_table_id =3D oem_table_id };
> > > +
> > > +    acpi_table_begin(&table, table_data);
> > > +    /* Interface type */
> > > +    build_append_int_noprefix(table_data, f->interface_type, 1);
> > > +    /* Reserved */
> > > +    build_append_int_noprefix(table_data, 0, 3);
> > > +    /* Base Address */
> > > +    build_append_gas(table_data, f->base_addr.id, f->base_addr.width=
,
> > > +                     f->base_addr.offset, f->base_addr.size,
> > > +                     f->base_addr.addr);
> > > +    /* Interrupt type */
> > > +    build_append_int_noprefix(table_data, f->interrupt_type, 1);
> > > +    /* IRQ */
> > > +    build_append_int_noprefix(table_data, f->pc_interrupt, 1);
> > > +    /* Global System Interrupt */
> > > +    build_append_int_noprefix(table_data, f->interrupt, 4);
> > > +    /* Baud Rate */
> > > +    build_append_int_noprefix(table_data, f->baud_rate, 1);
> > > +    /* Parity */
> > > +    build_append_int_noprefix(table_data, f->parity, 1);
> > > +    /* Stop Bits */
> > > +    build_append_int_noprefix(table_data, f->stop_bits, 1);
> > > +    /* Flow Control */
> > > +    build_append_int_noprefix(table_data, f->flow_control, 1);
> > > +    /* Terminal Type */
> > > +    build_append_int_noprefix(table_data, f->terminal_type, 1);
> > > +    /* PCI Device ID  */
> > > +    build_append_int_noprefix(table_data, f->pci_device_id, 2);
> > > +    /* PCI Vendor ID */
> > > +    build_append_int_noprefix(table_data, f->pci_vendor_id, 2);
> > > +    /* PCI Bus Number */
> > > +    build_append_int_noprefix(table_data, f->pci_bus, 1);
> > > +    /* PCI Device Number */
> > > +    build_append_int_noprefix(table_data, f->pci_device, 1);
> > > +    /* PCI Function Number */
> > > +    build_append_int_noprefix(table_data, f->pci_function, 1);
> > > +    /* PCI Flags */
> > > +    build_append_int_noprefix(table_data, f->pci_flags, 4);
> > > +    /* PCI Segment */
> > > +    build_append_int_noprefix(table_data, f->pci_segment, 1);
> > > +    /* Reserved */
> > > +    build_append_int_noprefix(table_data, 0, 4);
> > > +
> > > +    acpi_table_end(linker, &table);
> > > +}
> > >   /*
> > >    * ACPI spec, Revision 6.3
> > >    * 5.2.29 Processor Properties Topology Table (PPTT)
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 510ab0dcca..a31f736d1a 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -431,48 +431,34 @@ build_iort(GArray *table_data, BIOSLinker *link=
er, VirtMachineState *vms)
> > >    * Rev: 1.07
> > >    */
> > >   static void
> > > -build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState =
*vms)
> > > +build_spcr_v2(GArray *table_data, BIOSLinker *linker, VirtMachineSta=
te *vms)
> >
> > Nit: I don't understand the '_v2' in the name of this function. Is it j=
ust to not collide
> > with the now public build_spcr()? Or does it have to do with the SPCR t=
able being
> > '.rev =3D 2'? Because if it's the latter, you can name the common helpe=
r 'build_spcr_rev2'
> > (since both ARM and RISC-V use SPCR rev 2), keep this local build_spcr(=
) initializing
> > the AcpiSpcrData struct with ARM attributes and then call the common bu=
ild_spcr_rev2().
> >
> My suggestion is, keep the build_spcr() generic and take version as the
> parameter.
Alright. I will give them a generic name for both the arch build_spcr() and
the common build_spcr(). The revision info should be passed to the common
build_spcr().
>=20
> Thanks,
> Sunil

