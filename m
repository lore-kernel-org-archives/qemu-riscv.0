Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7010C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 09:07:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLgA5-0001LH-EV; Fri, 05 Jan 2024 04:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rLgA2-0001Fs-G5; Fri, 05 Jan 2024 04:06:38 -0500
Received: from mail-sh0chn02on2061d.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::61d]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rLgA0-0008TI-Bi; Fri, 05 Jan 2024 04:06:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU+zsZgm3f2sNPgJYzBhSws28/ZKQkFxnFFcGArCUB7i+u0pkSVrF89p79AHNJNRqHp1Rzni2rh4NdP8g0u3lm8Tr47OQVAJvy9fOqaG6l/y3b9HP/WXrh1+9FaJivt69fYlqOjiYZp8r2XV2Z+5ay7vYoHGgeg2yEuf+Uqqd+/lNCxZhRTO/+ZNgFNYLZSFZaYV69drTPENrEFM+pT6wqlohMisxju6mRnr2hOM9St11ca8me0W3UhppbcHuy2gra6DB8TGCNJKz8qVcepeyU7A/60XKlGNrll/Z6p8IRMriTBTSEJQrSYmLdULE11Kbzd8CgiaUHIp+zuq0Gf+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmPhi8k8/orxKBA27Bga6nqdCes2sNZMJ00sI9/2+ik=;
 b=LdwnEbrAnvo9qXC7n49DSrcjXX3wVYHm1uu+bMO2maZ0E3fS7SMGVBgeMTvE3Eb9DqvIsh9P6qX4xcAuyHD8SZTjWg2B4Oc+Of6SqNqM34LwBrFJBZb3UhpwnufAHDBKsdLss9ntKgUsmDNVkTzwv/3goKdPGjndnCiWYZptmIVYhwzvQUn10T4y3VtzHrL50pVIt+vijxA1ZxJQpXs0Ggx4oSSbpFBk7vVX+FrkxAQS7tXGRMuy/lyp0wHz/+R9MiPlzyvWyRgezIufvPetDmfifTaqfy0PPcD9eM9CWujkY1X/ux8Q8g9332v8SmvIDiO4qLzEFsxsiV+xC2veDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:f::16) by BJSPR01MB0755.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.29; Fri, 5 Jan
 2024 09:06:22 +0000
Received: from BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 ([fe80::3862:65b4:c857:c4a6]) by
 BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn ([fe80::3862:65b4:c857:c4a6%4])
 with mapi id 15.20.7135.028; Fri, 5 Jan 2024 09:06:22 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, jeeheng.sia@starfivetech.com,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: [RESEND RFC v1 0/2] RISC-V: ACPI: Enable SPCR
Date: Fri,  5 Jan 2024 17:06:06 +0800
Message-Id: <20240105090608.5745-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0007.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::19) To BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0561:EE_|BJSPR01MB0755:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d77cebc-7131-4e24-2bf5-08dc0dcd963c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TxYBNHQtrGg+eRhkNnAwmyZ09ONjLDAjbVD1otqktGtwNMMtXx3Ni15Z1HLrs08XBlqJVQthlP8du0WkDGE7A1O10sWoOv8Vz38cj3aAa02hEIqrHXm5onKG7lOo0YJ5+AOT400sxDBMCovDHrjV5Pa8Kw7fzUm1YaDquKl3Y8ztzFaqQqZOsmRCd7epV5HZdM/xDaabx045vRiZLkkjVqc9KtyvUAeXuu+BQeZ8uxcqjEqpOBbvPQkYbQOnmuTy7hkpN7ecRQpIQG1P5qznxsuL/IPO5MxLIdhdPYIpvU43qNZV1mcrsEmiopVeY5a+kLQKczk8WtxYL4ssMAr9dmomgy6ChknQTkQ9PPqzThEe3u4XXVkRj/tQPrxW5q3CpidalJXgcdOgxndPAIoucQKL+VTnFcxOmg1kUC357lwANaWSOr5lrzlUh+ngvp1Rv8iRKtJUB6rTzBmp3T+DBTQGvCxNYGtuLIWE+E/N5Q67Un4OgJ74d959UTh2lr9WDizK1jYu/Ov4OB3Y2fNO2Yt82JnRHuIQDpOVyJZmkBAY/gUwJX5JPnUeUEPosSbP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(39830400003)(136003)(346002)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(1076003)(26005)(52116002)(6666004)(83380400001)(40160700002)(36756003)(86362001)(38100700002)(40180700001)(38350700005)(5660300002)(7416002)(4326008)(4744005)(55236004)(41300700001)(66946007)(66556008)(66476007)(966005)(2906002)(8676002)(508600001)(8936002)(41320700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uVTr0+5pNi8FjK9Un8oAEo62omBN9GrIlL7uAoH+ZS1CncmPKcQL2FItwRee?=
 =?us-ascii?Q?1sRGwXZnWB8hLCyti+g6C1dUoWQBwgLYIbeSYYOmQEU8m3EQ25EZLldXJgOk?=
 =?us-ascii?Q?rSm6AJ5pjLS8TPvkyXxvSnKNY2kryBMPrN2hDVIyW7SDMoETTc5JIqIPUDqP?=
 =?us-ascii?Q?oW1Vp2WfsZ2lpL6ZkmhD4RnesMzxRMLp0FE89wchrLL0PH9nz2UvrYvxRt3L?=
 =?us-ascii?Q?PJgbffQTiwuamGgg9+lcyKdbZLdMHJbcU9C32vAuWTjfjgNS38FhuPD/1YlH?=
 =?us-ascii?Q?jfHtWgDZNcJXDXwPr7mYONFLI5LgnJugUQwvzHH507NFK9peRFsJSCBP/Pls?=
 =?us-ascii?Q?gEHwer/jYYk2WUhlbf1fF0bn0Mnewt3rW5TwpKQnzIlpcvv4C5E7SVww8ySu?=
 =?us-ascii?Q?QS2cWWBZnLQ8CQisJVC+v7cSiMflEQWbjZ4iNlJG37mTJlghy2qubRwplP5F?=
 =?us-ascii?Q?jQSSDq2YQNjwxWvA0Od4Ilp7LIQGRAK6woWaHCN4iGZJSgzGrl80IamydjzI?=
 =?us-ascii?Q?RUhxR9RKXa4uBaQXQvUyXymDiuYiyFJgJj+VsAY2+3FznBDZAz1JhobK1eiX?=
 =?us-ascii?Q?yxhyV8q9Gt6AkvE1Ks25J9xJClmBPLiS5EqENHN2bOv/WoeFphaSkc5Jojmf?=
 =?us-ascii?Q?NgNqhP5G9Pyq64lWJTnjKW71JWYrdozuhckmL97ReVK5eor7P/mUI14C+uY+?=
 =?us-ascii?Q?8UBU60AZR4XyUilg8ws9WeFKQpHfAXH2/1xrfhW2+DbLk/42tDW0cSZs6gqn?=
 =?us-ascii?Q?qeJszOQmEHrPzsUoGtDgkwI5xpD2PPBhG+LFzakoGkZ+gkO/9htWbvtJsQvW?=
 =?us-ascii?Q?2FdrOOyQcaChjTtzWExry0rm9bNxOQxlX9+K7R61Fx9PR3EK2Y+D8TAzWnXy?=
 =?us-ascii?Q?pYTUsTxt0hcxh8uJwu/kFwiAoFbx4lVJDEUs/Wh/9fBsw4qT9/8gpR4mxl6J?=
 =?us-ascii?Q?x3F7v/2e9vnGhlQOv9K1UboTkCaaefU5WlIxC0+i0qB5GLWGwOQ48CoR0hLS?=
 =?us-ascii?Q?N4oV0xJ+PZSEoydURmPFAL8bmH5Af19CrZBfZ+wV9K94yzcbFQ2MwGDceDTv?=
 =?us-ascii?Q?G/Y5T+sDsZLyRexA24xY8limFO6IBC/BrpRAu6rXa5w2CQ0ShL5gL/wD1rFT?=
 =?us-ascii?Q?t6X2MpXAlXBTBXVD6GHdBi6U3hPcBLHhoyQPGq7oZanaP0NWYMkOdpipdRbm?=
 =?us-ascii?Q?o2WnXRAmf5en/2ryhS/uieW7w5UFniqLslad4NAVL+u6f8f5ufhaZalQJYWY?=
 =?us-ascii?Q?hA+c4/AsWaFxTNgsL9ccPARE1qJDByk0iQEwYtFE2Oh08K90cU8xoAl4tM0s?=
 =?us-ascii?Q?8x6rhYUkQZWeabc6lGsX9Vg8l7UQ379X+ktv9FOZfIFUywK0n/o1uyBhBN1k?=
 =?us-ascii?Q?4bnllh1V2Kmn6ZkCzMiGkkug0sgtbQGLve6CRgb/8GhcwxJ2U3of3thZVB3t?=
 =?us-ascii?Q?00d9qjtFrx4iJLjQrO7/jJqPP6o5vaNn35LmLUe2FjWvX8vP6MFEIdUs2DIY?=
 =?us-ascii?Q?oI+iLoHdSTcoDiOP8mgrSy15pdOBHvslsSqny3yVRrYaR3MPsIYz2tYmG2n5?=
 =?us-ascii?Q?3HQi17ZDg1txtgxxIrb3b3y8740rP0idYAmeH1XuyZE0QBaNT+P6fklOUU8U?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d77cebc-7131-4e24-2bf5-08dc0dcd963c
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 09:06:22.2201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xfJltRxeIde++T8opaUGax7OIDVFzGmBI1tFSJqOTJkxossI5aZpgGkuQwFecrCTDz5b7RoHQtNBkEW9kyDPsCvnVO0gkHHR2RbJt7BWzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0755
Received-SPF: pass client-ip=2406:e500:4420:2::61d;
 envelope-from=jeeheng.sia@starfivetech.com;
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn
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

This series focuses on enabling the Serial Port Console Redirection (SPCR)
table for the RISC-V virt platform. Considering that ARM utilizes the same
function, the initial patch involves migrating the build_spcr function to
common code. This consolidation ensures that RISC-V avoids duplicating the
function.

The patch set is built upon Alistair's riscv-to-apply.next branch and
relies on Sunil's patches at [1].

[1] https://lore.kernel.org/qemu-devel/20231218150247.466427-1-sunilvl@ventanamicro.com/

Sia Jee Heng (2):
  hw/arm/virt-acpi-build.c: Migrate SPCR creation to common location
  hw/riscv/virt-acpi-build.c: Generate SPCR table

 hw/acpi/aml-build.c         | 51 ++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 68 +++++++++++++++----------------------
 hw/riscv/virt-acpi-build.c  | 39 +++++++++++++++++++++
 include/hw/acpi/acpi-defs.h | 33 ++++++++++++++++++
 include/hw/acpi/aml-build.h |  4 +++
 5 files changed, 154 insertions(+), 41 deletions(-)

-- 
2.34.1


