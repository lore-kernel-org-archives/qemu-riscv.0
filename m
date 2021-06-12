Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ls69q-0002ac-4E
	for mharc-qemu-riscv@gnu.org; Sat, 12 Jun 2021 12:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=790f0be0c=Anup.Patel@wdc.com>)
 id 1ls69o-0002Wd-DT; Sat, 12 Jun 2021 12:06:48 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:45074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=790f0be0c=Anup.Patel@wdc.com>)
 id 1ls69j-0002GR-Vi; Sat, 12 Jun 2021 12:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623514002; x=1655050002;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=uW/VGVQkB1dcvj24bPjg23VQoszEkPNQxGE6u2mPlF8=;
 b=MsRUe1TKsANNHv9qetivXlb552UUsmJQN9LIZcBVey/7d0PMhNP4JdK+
 83uiOvoF8cVhSSLjKkCZVHkKGwjQDSS7vYwb9eNnoh2WZ69EHdHhi00TY
 VIpAe+3UBwe/swVErdiaaTEpGxxkIUChnrJat93N9ZTZrjiz9BkkWZwqy
 BTTzP3VGN//ormn9rBSPFRyGdkRZflED1jI1iVFDI+tzgulP2OiN4Wz9c
 KpQH+K4kqOX96vGEtV+bJQwvoDBczgOsbP7jNr54Ie43ykAkTtSQhUCDi
 gNzj6I333rxo0aA/dA/njOJAlunaFX4edzMx5MLEcYgK2A4mvBNoJXdYx Q==;
IronPort-SDR: sgHZWAq+4/rf2MQusf1zvdY7X/XgnAfiP2YJUXkigTx/uTYBhC9kBXi69hWBSzUsqVEHjq3f/m
 ER+wOfKhRFdaUjkWNUyv4R/qbX1mnEmyVMsXXHsFpkp/juMPh/Md6HDzugTZy2fLk0jM+pR/dt
 PVTnHnDNt/5pWK7DPNxvNVzbddqv1WlHRla1lLvrQMOaNwpXT4ktluQpuh/ZbnGEMfszUOmmn+
 8wJImUEPPc50Tsq094Zmx59gmdynM4Hi+Ar6AvaJWMgaS1R9Pb+Mjdf7w2Rq3V/LV1F9YhJXaP
 794=
X-IronPort-AV: E=Sophos;i="5.83,268,1616428800"; d="scan'208";a="171704745"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jun 2021 00:06:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ+3NLPwKKzNsvu1tbBFDTqYvEN8C/2ItX/rcf+4tvVh3oFFNJt7oIEMvtgqd3ul/mm8gRa5ZmE0sMjvzTNdX9c1qUBybwYlVjMZ1wJMYz1asy8QuwNZeStBY7x5avyBTJPM5UHlVWP9SboD4Gu+PZ0iHElLs2L2RkVnTkuKiKACB+NdD5ALTjNWJOX1LCTf/gbvLTTGGo9BRzHUPfgb90J2ZyMrMvoTJam6skAbsRlLF2GAA5BK5W/4wl7IpYesIBVyOoDzCUMe5F8fOPFg+N2Sjkotyh91sK8QWQSRKuFjsLApgGwhpKvC2O3VqukQsvJgQGwgJsKlAEDi2SecuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuLfHbf0XaQrYmcy5FUO7waq+m5+g+1Or/j264D5+0Y=;
 b=imjizbA1tYMFuJMjVHs2Ke04UVYvcTkeBITDy4akRWrq9FyAuizyM8FMfKSGbwMD5y1SkrK1ezpp2BTyFRG5BEbas0Qb1RgJTdFZGzExq+h/skyJZLtqzh2lofWj1BEdNic/8m/QzXuGKSp05Giz7xUyWu5KWevsi1qhGVlkj0n+1OQ1KWYDtcyQEl0TkBgF1hIlOvaJ3nKgaTp3tzDCercdMHjUQ3iyCG5QInIkbtMxawdeuZfAyDoaNWEVZMT8YOltytUYtSVP+Ek/lWc63b/67bF+X8xpR2PZlBpo2mlGyMMC8ykK+AjW3khqRyzrya1UJW67Wo5ex18uqAT42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuLfHbf0XaQrYmcy5FUO7waq+m5+g+1Or/j264D5+0Y=;
 b=FtC7Nk2Nsd9LjS3INKwvJlODBDdiJAYfSyQKWG1HWnCJlzD2wj1uX/8J7CKVDn2IRG2KdXgk/tWH0it2APYlGnIyp4wlbcndTqZjYAoSgzu4YnxzfZXBDn8uTKlDrym12EDZJYzv2sFBJKpZ9CJTywB88ANgBzKOgaUCdTS13Y4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7747.namprd04.prod.outlook.com (2603:10b6:5:35b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Sat, 12 Jun
 2021 16:06:36 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4219.025; Sat, 12 Jun 2021
 16:06:36 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v1 0/3] RISC-V ACLINT Support
Date: Sat, 12 Jun 2021 21:36:12 +0530
Message-Id: <20210612160615.330768-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [122.171.171.205]
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.171.205) by
 MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Sat, 12 Jun 2021 16:06:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e399b6f-f440-4410-5d79-08d92dbc0df3
X-MS-TrafficTypeDiagnostic: CO6PR04MB7747:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB77476F2C36129230E223F5888D339@CO6PR04MB7747.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FbrR9i+/0mx3DTRtDJKNoWntXNHbcBsxVSqwDVMDQRov8h75GWnHJ4GucbJh+Zo+cvF1Q1gU+HcTHaf/OuLyLbUL4XIX5qRfTqJMXnGDF97a6LMGHihoWm4sfl7S4Cgag2bXaBunPvcfMlVnFoLsNqMTH++Nze07LlcJOaikkDP7zIppCc9Ijpb/JgPCa2074HgERDk9l1dQk1I51knJctbbpdjlh8yUYtfQdTBFQPS+E6I687hIc+v7fgPpW76BbtP6Zx2EOgyukgSDbGxT5zcFvESZ2CgQpt2b/tRGsgL8muMKosJVwXwn9ey/Q7AbGwUknLp/i+e/CjRVNIGDNbHgc5mrkdciFSVhGZS0vAnWvlp1vapWfKprnHKMhlo0YjZ0DTereuyzFhjWB6e8Pcmj5E4xRVChzmzcX/vy0XbSEnncUfqsiRC8dNwjgC3OBeXJ2ew89LflhZrUywZjwi55Z0ahnKy5kTwBV6lMHlRd6H+gZ/8buw65CAeNE4NtRiW4rIkmGqljebAebIW9KXvaiyh9LPrmUYm7zaJmRs4EidPK7gE/yGi8fx0SoANQ+AuDBfgPnDT1/R2y4SFi7R4+O6S8fehcfe9zWvHvBstre4NIYvXk5yV3dASppiKJc0/DjCSL5s9tUlQdMgOVtDboaTvxxa+AWFfxHXGmdD2nJvi4xkGDhSdNEixNZDYM5wxAaihFNoJiAiIv1pfA6HvGkrCvNeEBx+ldGIkgPM80UzYyPRDAkeTbv+REfwRF6FYBEModZGPthxNKMnK3Wbzr1oaIwDBH85bQE/+TSHWbAfqE+8vOsUsz25pYLmbT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(54906003)(8936002)(8676002)(110136005)(4326008)(2616005)(44832011)(16526019)(186003)(66476007)(66556008)(66946007)(2906002)(956004)(316002)(38350700002)(86362001)(38100700002)(55016002)(26005)(7696005)(966005)(8886007)(36756003)(52116002)(6666004)(83380400001)(1076003)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MXl7NHjgz1ZFw9bBqREAcm6eChbdXDWWTskD+FjbCPqxP7DF5SWo5Fa78c63?=
 =?us-ascii?Q?InEQ0H76yrQpg5nNbPnbxY62qHHF8/aXzDNsIJZb14CBaww/y8wDpnm2IRYo?=
 =?us-ascii?Q?CBurOknP+btKgNKNUgtI661Bx3/8R5zQOI8aSFXP65hlPJjlrmEO1wLjJS/B?=
 =?us-ascii?Q?JjANqvj3MBfdQrTdagIyqTiJDHZ8x/jqQW7zPbySr5e16rn9j2c57LK59769?=
 =?us-ascii?Q?zBuBfWRvAPNBpvCuNM60AQm6PmOfsaLixkN7oTom+tCa+ubHiKgqIt7P0Jhw?=
 =?us-ascii?Q?xmcpFKy02bKDVFFJEN9WP2AwPRca1Dx4u+FyeYYpflhkSkqVhrCGKx7vMiqg?=
 =?us-ascii?Q?77F+yWKF0LJ3CTyZwTCiRCHnIGbD42n6AMKqoL62psgo25UrxFAkNWn/VgLf?=
 =?us-ascii?Q?AX/VSOtOKClMbqNHtfrgINm3tZJAlz5136aNR1F6dc/KyRT2oNU8VR6StM5F?=
 =?us-ascii?Q?oNNfAjeaCktT1r4Cg5E0ZEeBNDcxBfitSMNBPpV5repNQk509PieVQpWrELC?=
 =?us-ascii?Q?rP4+rGMvBKt5Eqa4/bXCpw4KfCMyhqrQgr9+P6QdELKb2ZBQbSPOeSHF4LW2?=
 =?us-ascii?Q?C3p3ncDYWF3szSAfZ/5blwMdIvqKRjxf4vsSWuVrutnz5vJbcWB5i/1b4sUx?=
 =?us-ascii?Q?X8o3QzHnVoS2/NsO08jLe/7T+3g78S9oA58tyGSC45kaLhyB5B+XmRj6Y2EU?=
 =?us-ascii?Q?820RAYsZS55ngP1YbOn2E8sXcoctwsd4I8kHhuwqhCTohonFQJkY1U7mOBFE?=
 =?us-ascii?Q?QzDtGB3JCelN4L+H1q7SbFYEo1zz0HbTc3K9YPSN0KmbUcyDsUR8XZvV5OyR?=
 =?us-ascii?Q?9/Usi/b2/4xWU7zhZmVZwcgOMfjSlq2wbx9sri6cLnOcVUdle1MFn4YU8HtS?=
 =?us-ascii?Q?nYFwZw+CHjTSRLH1qx7wjKu3yLmMkQZPDxhSNW3zn2JWiQ5OWVckfpuQrXFu?=
 =?us-ascii?Q?9J96Eg5yj28Q3yx6jewR6CYifwSdvKdXnrX0FC5NJohFMe48TU6bQw1UG7PX?=
 =?us-ascii?Q?YVCWfOay5fIEJj78UrFt9ZAoTvHC6SS7N7jDDWQ08sbcDUw2ga6e0jT68vEw?=
 =?us-ascii?Q?59BumtSjHkqdaPiRkYbVx1dzUdrBYyr+MCUF71+DdwWZB5QWm/UX9CGdj3iB?=
 =?us-ascii?Q?YswUbJXDDg/Hkq+xIiI+lLMGcsUQea2wups7Wsz6vZynhB6x1NITkx/9W8PI?=
 =?us-ascii?Q?vYh3ML1FPwNI67bwjLS8KTOF6yeIi8i40u1GAN82AUYfZzAv4OpaabDMlZum?=
 =?us-ascii?Q?xMTbagliqBPkpU2+SJHiaaOjTEU3KATy/GYSXZYs4fBAtOChjg9pXV/lEC3G?=
 =?us-ascii?Q?NNKI9sZRqnjMdJ9gZxDJCrJb?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e399b6f-f440-4410-5d79-08d92dbc0df3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2021 16:06:36.2313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIrxruU1qR1OR+URahk9d5QBiawxt3gEGlZEQvszmoAnmh+0NClN+wSoDH3JfdDpo7IAwl9KvJwmE+nGf1Xg2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7747
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=790f0be0c=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Jun 2021 16:06:48 -0000

The RISC-V Advanced Core Local Interruptor (ACLINT) is an improvement
over the SiFive CLINT but also maintains backward compatibility with
the SiFive CLINT.

Latest RISC-V ACLINT specification (will be frozen in a month) can be
found at:
https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc

This series:
1) Replaces SiFive CLINT implementation with RISC-V ACLINT
2) Refactors RISC-V virt machine FDT generation
3) Adds optional full ACLINT support in QEMU RISC-V virt machine

This series can be found in the riscv_aclint_v1 branch at:
https://github.com/avpatel/qemu.git

To test series, we require OpenSBI and Linux with ACLINT support which
can be found in riscv_aclint_v1 branch at:
https://github.com/avpatel/opensbi.git
https://github.com/avpatel/linux.git

Anup Patel (3):
  hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT
  hw/riscv: virt: Re-factor FDT generation
  hw/riscv: virt: Add optional ACLINT support to virt machine

 hw/intc/Kconfig                |   2 +-
 hw/intc/meson.build            |   2 +-
 hw/intc/riscv_aclint.c         | 374 +++++++++++++++++++
 hw/intc/sifive_clint.c         | 266 --------------
 hw/riscv/Kconfig               |  10 +-
 hw/riscv/microchip_pfsoc.c     |  12 +-
 hw/riscv/sifive_e.c            |  12 +-
 hw/riscv/sifive_u.c            |  14 +-
 hw/riscv/spike.c               |  15 +-
 hw/riscv/virt.c                | 635 ++++++++++++++++++++++-----------
 include/hw/intc/riscv_aclint.h |  73 ++++
 include/hw/intc/sifive_clint.h |  60 ----
 include/hw/riscv/virt.h        |   2 +
 13 files changed, 923 insertions(+), 554 deletions(-)
 create mode 100644 hw/intc/riscv_aclint.c
 delete mode 100644 hw/intc/sifive_clint.c
 create mode 100644 include/hw/intc/riscv_aclint.h
 delete mode 100644 include/hw/intc/sifive_clint.h

-- 
2.25.1


