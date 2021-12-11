Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtrm-0003uS-2i
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrk-0003rr-CY; Fri, 10 Dec 2021 23:20:08 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:50811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtre-0001Wt-36; Fri, 10 Dec 2021 23:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196401; x=1670732401;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=F1PsSdvsH3W7yvkUSEr0kSdVAD3tlcGvE/LEyz7SiH4=;
 b=kL1XW2BQv8Q7xuzFYamO2PEAY7HEY61CphZmoltuz+UaNn7UHkC65YJT
 dZiLryEpr/Ikj9eF2syogIX9uSaOvUdp7dFocNU1/jHY+PxPa0/VHcYWC
 c+7TMI47DeOspeQysTkSDOpHK1NABcS5iv1DFzjdaB/gYTbIbC4iQwv7B
 JK8FpUo+xRmERicCTt9IKfTY/cINfgfuBLo7Fz6UuFJ0Fk0l+bbF644aF
 N6rPzGKVFwo56O9LBv+A9IRan52yMA5x+10/J0HyDYdUi4XFzQxKubE4l
 mZLyZqt80Uzf8cxsd07DGmC5VXX7Zgpt6IpVtg6d9hPpNyirmV0YW+kFO Q==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="186970357"
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:19:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqSYPncFM8bh5N098IWaxjUPtM0NI8Q9dbhHt4FuuBVv7u6HcDFKNwbBb3QXh/1blCxHbT+KwuSXwXR5SyTsHrqvsyGNJAoFfYyJ0EAnAwKVYSEZiVAlAOWzfUtKjVeaZ8oKxnpL5wBR/REaBGdCJZ0Z2r9AEV/Ay2PIs/JnKe1gGWTy8GLK6w6kezbkThbvnZXamQaI2IKZgnpcf9SV75HXLi8E7dbQ9lGFqAv8EBuDnO2q7Vq2sZ2OEHl6E6PhIZbnWXFuNKAsIVijRbqtn6sO9KAvtcglJl5Ne8WitcfWRkVGnVsu62Ey4R5J/OyxYSULC/oYZwKlR7+yfgnmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOtBWVHwW1SP58adxo5gkYRHOuc86KdNNMEuVvWqfI4=;
 b=IJtEKAiFxPU+PXfHRGmV63OqCU3Dq3ZdEvPaqnrUEOPJ5rEo1uHIAqHfYPPUB/BFv99REEkCmVsy3cbDSumfkzl9q9BIt7zFKIsJakR1peY/ORlY1LA6OgcyMW8SaCfDR48nnevsPNPhJZORNlOoWh2NacdWIUaNoaIy+ZT9EjAxuVo1v2Xvcnr5WyAOKq50Wfi36xAE2EsWAnTIq8u37lD6DjHsG7mAxzXVqsqjMdVKAh51f7BMSyUldAanCLcrFz+ieIrh/ES4ybAntINEfGe75rSZdNPeVFvUneqPMFc9lO6ZQdkqBfyEvesTTt2rjzZegwSbFDWaguNf17J6lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOtBWVHwW1SP58adxo5gkYRHOuc86KdNNMEuVvWqfI4=;
 b=rcxiJwXPoAeDSjBjsECbU9849Dm+UUPYTwfSjs+ux9OEYgfAWi8TumJXkM8BcWSZSUYrgdaL3XltuJb4EKYpPfL87Fm/wAAp0YaSIjoCPjyx6oWH0sXcNBJ9az2oAM6Ckzs6fxrO7C4gcvrsMWaR9LTCyAu7auFf0gjADo2FScg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8265.namprd04.prod.outlook.com (2603:10b6:303:150::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Sat, 11 Dec
 2021 04:19:54 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:19:54 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 00/23] QEMU RISC-V AIA support
Date: Sat, 11 Dec 2021 09:48:54 +0530
Message-Id: <20211211041917.135345-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15a99b15-daf4-466d-4b18-08d9bc5d7b91
X-MS-TrafficTypeDiagnostic: CO1PR04MB8265:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826557791BC058F59EDBCA808D729@CO1PR04MB8265.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DW52eWMyCMpqgGqBDAat2l9qTVUnHcBWF7xHSWTWdJltXmrdtQ/mfxXukgfT6j6PPYf/vZ6Ivo8QPdDSBFEVljj7uDFnE0HJ/5AKTsmYmkMZtHXRSOUNf9pXve4F2qwu2dGijKf1zM3kn1Ee4YJAyqX4218kTQa5GSPTfNEZi2TxKtxZ5mdJf0xNsZ15eIEQ34untFJivRwZBFARDLqWXVTJ/pAGy1zs6V1KiHKapxjjk6gcMqBjfRgnui8C/+4ozXJQtBG9DEeXBnIiX5aT0YJRFUIDO+Qh/zgJxFhFXm+pYE63sGnAxMaEy4tUpiPE78jhHa82XyKpjFvpc/0xkUpLBRb5CsBJ86ROxPcy4qObmy+ONoaLi8Bkp4xx6FB1eqX1urfkl2ZXPCyhMswmfDUMKRFIhIPuvK/pnZ5f2MKIpa6Lo7FLiYte+6Wg1gXVefgk0m0n44miMXJuxOxiMev0YlTb4JCdw8anYOGAkvFylMU/CzXsNflG+9LKba7plumkoM88P4jqSfqot1FIQWJy/HMMGhSO/iiK/z/0FZX5Q8Nk5GL78WgVUmhTMXr+97nRO3u1sQbjzsAal+4mKvXn97HLdqYrbWQGtI6zXTOklgxpPKj65lg0teXT/fLMbMvVENXiiIv6JkWyreYpGChkj1D38wN4VnARSv3D40QiVfOlANK5yIYJO8tQq1QglqC3JPlUBwCg3BovU67Cn2htfuMD8eE/BHMyhDkJNtqvFmMEfc2L1TgojG2MPIzpmMpeTDO4xnqm7xEdzr7hWPOYz0B5cuwp8Ao0o2BtR1PQw6+FmHXqi5dvr4rbO0/VcBGgqamzC+/S5Mu8oHTSBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(54906003)(508600001)(110136005)(316002)(82960400001)(83380400001)(6506007)(2616005)(86362001)(36756003)(186003)(52116002)(2906002)(4326008)(26005)(5660300002)(66946007)(6512007)(66476007)(44832011)(6486002)(66556008)(8936002)(8676002)(38350700002)(38100700002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wlp5Vn7gP1PzADLkQDCkiEIrZbALZE07I76W13A6sJoFrqQfytwLcQobt9L7?=
 =?us-ascii?Q?LcsV+NmSNK8kPVIAE00RMKaSmV84+sJrgnii+GvCJy+LCpa13D3+GkxDUacw?=
 =?us-ascii?Q?cLPV9oVQpPtgJiePPXiewv7ryoTbM+UdgHi32TigCWPkuw8v40SLLMF6bNZt?=
 =?us-ascii?Q?jtE562SgFf/NrjecL4Zkfa1a7iZiL4UPgpHSvlcdkpzwzKiz8jsCos5OFpJg?=
 =?us-ascii?Q?iegevhW0ndxJF+aNhHAM9lttnHR2Z19elSc5bz4e9Px3xvl7dKX9J0PO2lja?=
 =?us-ascii?Q?staKn6ci0x3Yyqo8WHosbu+q4sLEqMAQmxB8sKL8s6l4nOX6nv4k6lus4Irp?=
 =?us-ascii?Q?v9nVQFhvhqcz7f3SnyRHDV5tZtZ0YMza/Pf47ZYzGv64tNe+b8zcgIPmAe3A?=
 =?us-ascii?Q?7eKQiFV+nYmXhSboHYHyvj3Nra/wL4UDCpPOoSOUzpFvOkPNxIevRsY0nPcW?=
 =?us-ascii?Q?Obbn2ofuGk4NmzEpUzDkbUxe+M2hojQ1pGRYv/HTrIEgbmXnOvdQBuWFTV6C?=
 =?us-ascii?Q?0d/6+mAZlymaQQ4WbH2VNjTfkgru4BclMhaUoNGDJ4iOjyLXCezmhsMq+h4h?=
 =?us-ascii?Q?VDHwNosX6Ep8b6oYsyKO+VV8K+9ELzVTVIv3Es52qhskVVteghECF9b23kA7?=
 =?us-ascii?Q?93dNoitl4KzLga7fkHvkQoSJ67vjVzGebx87yvw3cYKezT6nGs7r7dN01OlZ?=
 =?us-ascii?Q?IN8F54dBGmArimJxq/nJnyTTrwqf9hZbJud7FWBBtIm+quEZyOH5bx2FRzq9?=
 =?us-ascii?Q?oHyFbTmJNs7cIwWDNLP//Fa+p9UoaUyGP8E7/WiNFnr+aOA4A7r1MPbIpT5j?=
 =?us-ascii?Q?a2XzpB9O0OfXQUUPlsLhqw3tjHGYzxiIHGeFyanBdo6WXNy8GjRQFbTCDe84?=
 =?us-ascii?Q?J5YEIYC+Sj6PyuEjDBtQJ+ycFzlJWCLzTN7xcIBQyZuRa1F8TSiiO11yRivO?=
 =?us-ascii?Q?6ZX32ecyBb7LbbnWVzufvgfJmj4fepnnY3OiEa20vqb7LuMuvs3sRzmNp0ip?=
 =?us-ascii?Q?ke1xTPt/w7V4iQdATQl6OhziQdgaMZW191/z9J8/n+47kgOgfDGTyikSmu0t?=
 =?us-ascii?Q?vQsHz1DMot5CyREBFaNNIHiIzEVvTfkl+Po3GbYUvWhgYLlWhoI/iPS6ihbK?=
 =?us-ascii?Q?0FkSbiMz/wbQiEzIzCuy8KXJLiiWlRiqVF12Ysle7TwpRStPZN4omsNxusYk?=
 =?us-ascii?Q?2xFIzSenVSFsGUI2B71HORnsTnciJkev/stVCvVPpPmIZyoWgO0QnfIFebff?=
 =?us-ascii?Q?7J5w/wDTF6VeF0Ngo9KA9PcpcUDb52I3XMDd3Aq3nQ9ninp1tF/pfxNWez/r?=
 =?us-ascii?Q?84Vmz0rtuduC+1wOOd6KQwEg9RTigYTT7Y2X4gPvTwnaht7ARreMP3fVD5FL?=
 =?us-ascii?Q?STEPcZvS18InxiBQu2yVWp36NLmbsMcrK8NMjLwFFwUTfBCM5WbZkf+06KSo?=
 =?us-ascii?Q?WnL8ClUYHUx8IOW/vT26KmW70D1/K00Po/OJYFBS/m1XHg+h9QpjC3GP1y9d?=
 =?us-ascii?Q?O1jTQ8ZzJDfsqjplciCWphIaickZCH2TJrOw+ml59AFi/36MgmiBYUmjW3Ve?=
 =?us-ascii?Q?5i3VOa0XPrlWsQWQLQ+J4E6MXwBbrY5XDQXxCvn3y1Jz9j90msHn6E986D2c?=
 =?us-ascii?Q?G9A0Ro8vPO/N7J9rTFwWLbQ=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a99b15-daf4-466d-4b18-08d9bc5d7b91
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:19:54.3235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgH94Qt0sHZpP3DhB7BF6uzbE+r5CQWcx1s6H0J+KWVzi5vM07XfIjqLRZ49Y3UaKrfjmT86quYDnUHergnaKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8265
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:08 -0000

The advanced interrupt architecture (AIA) extends the per-HART local
interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
and Advanced PLIC (wired interrupt controller).

The latest AIA draft specification can be found here:
https://github.com/riscv/riscv-aia/releases/download/0.2-draft.28/riscv-interrupts-028.pdf

This series adds RISC-V AIA support in QEMU which includes emulating all
AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filtering is
not implemented because we don't have any local interrupt greater than 12.

To enable AIA in QEMU, use one of the following:
1) Only AIA local interrupt CSRs: Pass "x-aia=true" as CPU paramenter
   in the QEMU command-line
2) Only APLIC for virt machine: Pass "aia=aplic" as machine parameter
   in the QEMU command-line
3) Both APLIC and IMSIC for virt machine: Pass "aia=aplic-imsic" as
   machine parameter in the QEMU command-line
4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
   "aia=aplic-imsic,aia-guests=2" as machine parameter in the QEMU
   command-line

To test series, we require OpenSBI and Linux with AIA support which can
be found in riscv_aia_v1 branch at:
https://github.com/avpatel/opensbi.git
https://github.com/avpatel/linux.git

This series can be found riscv_aia_v5 branch at:
https://github.com/avpatel/qemu.git

Changes since v4:
 - Changed IRQ_LOCAL_MAX to 16 in PATCH2
 - Fixed typo in PATCH10
 - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH11
 - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH14
 - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH15
 - Replaced TARGET_LONG_BITS with xlen passed via ireg callback in PATCH20
 - Retrict maximum IMSIC guest files per-HART of virt machine to 7 in
   PATCH21.
 - Added separate PATCH23 to increase maximum number of allowed CPUs
   for virt machine

Changes since v3:
 - Replaced "aplic,xyz" and "imsic,xyz" DT properties with "riscv,xyz"
   DT properties because "aplic" and "imsic" are not valid vendor names
   required by Linux DT schema checker.

Changes since v2:
 - Update PATCH4 to check and inject interrupt after V=1 when
   transitioning from V=0 to V=1

Changes since v1:
 - Revamped whole series and created more granular patches
 - Added HGEIE and HGEIP CSR emulation for H-extension
 - Added APLIC emulation
 - Added IMSIC emulation

Anup Patel (23):
  target/riscv: Fix trap cause for RV32 HS-mode CSR access from RV64
    HS-mode
  target/riscv: Implement SGEIP bit in hip and hie CSRs
  target/riscv: Implement hgeie and hgeip CSRs
  target/riscv: Improve delivery of guest external interrupts
  target/riscv: Allow setting CPU feature from machine/device emulation
  target/riscv: Add AIA cpu feature
  target/riscv: Add defines for AIA CSRs
  target/riscv: Allow AIA device emulation to set ireg rmw callback
  target/riscv: Implement AIA local interrupt priorities
  target/riscv: Implement AIA CSRs for 64 local interrupts on RV32
  target/riscv: Implement AIA hvictl and hviprioX CSRs
  target/riscv: Implement AIA interrupt filtering CSRs
  target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
  target/riscv: Implement AIA xiselect and xireg CSRs
  target/riscv: Implement AIA IMSIC interface CSRs
  hw/riscv: virt: Use AIA INTC compatible string when available
  target/riscv: Allow users to force enable AIA CSRs in HART
  hw/intc: Add RISC-V AIA APLIC device emulation
  hw/riscv: virt: Add optional AIA APLIC support to virt machine
  hw/intc: Add RISC-V AIA IMSIC device emulation
  hw/riscv: virt: Add optional AIA IMSIC support to virt machine
  docs/system: riscv: Document AIA options for virt machine
  hw/riscv: virt: Increase maximum number of allowed CPUs

 docs/system/riscv/virt.rst    |   16 +
 hw/intc/Kconfig               |    6 +
 hw/intc/meson.build           |    2 +
 hw/intc/riscv_aplic.c         |  970 +++++++++++++++++++++++++
 hw/intc/riscv_imsic.c         |  447 ++++++++++++
 hw/riscv/Kconfig              |    2 +
 hw/riscv/virt.c               |  708 +++++++++++++++---
 include/hw/intc/riscv_aplic.h |   79 ++
 include/hw/intc/riscv_imsic.h |   68 ++
 include/hw/riscv/virt.h       |   42 +-
 target/riscv/cpu.c            |   97 ++-
 target/riscv/cpu.h            |   72 +-
 target/riscv/cpu_bits.h       |  131 ++++
 target/riscv/cpu_helper.c     |  293 +++++++-
 target/riscv/csr.c            | 1278 ++++++++++++++++++++++++++++++---
 target/riscv/machine.c        |   24 +-
 16 files changed, 3937 insertions(+), 298 deletions(-)
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 hw/intc/riscv_imsic.c
 create mode 100644 include/hw/intc/riscv_aplic.h
 create mode 100644 include/hw/intc/riscv_imsic.h

-- 
2.25.1


