Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKCu9-0004GE-FE
	for mharc-qemu-riscv@gnu.org; Sun, 29 Aug 2021 00:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8689bb0ac=Anup.Patel@wdc.com>)
 id 1mKCu7-0004Fn-Ty; Sun, 29 Aug 2021 00:58:47 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:60249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8689bb0ac=Anup.Patel@wdc.com>)
 id 1mKCu4-0006NF-1L; Sun, 29 Aug 2021 00:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630213123; x=1661749123;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=8aoLuZX6wGdCjwgtuoS9iJO52GlR79EJKFBryGliJuY=;
 b=DNo6eg8mO3x76uCzai9sz/MJbx9CItM6KVsgSZaB+ulErzQoAm2PbkEp
 JdevdX9a+k3WVTm1ASYIAbMVWyqQzSQK0r1cSQkhDvNW1CcM/o6EGfW4Y
 AUmpvVr4TKoH0MrUh0dHx+T/bQiP/7kIySodfS+ddcwzvODinmpnQD/fz
 3nlnQ6s1a1GSxnemh5OIbD9OKwQrZko9cb5Vf4Dnk1VRyYgN7zt9VByEc
 AmwjUNPxisQolnLVqSPCvI0T/0UrCM/yiVhayJ6EKHYROaSHO+ktOf1GG
 jVCXKBcdZ/140QF2/XE0KjBS4q+9fKdyBGZ9UymneRiPzi+LM9uy1qjBT w==;
X-IronPort-AV: E=Sophos;i="5.84,360,1620662400"; d="scan'208";a="178690905"
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2021 12:58:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IV7JnkS5gsc/sYbqycMx/nuK68IWN6+IwbtFAiLK6yPX9Lmcyls6PfgozsiAXlI3VfKZA3FcxvH+c1sRuwcFJnycuSANWa6dR/5ynRv48t2SeGVQsstTyq3gDx6INmVJv6XhsGR7viV7dqOAePM7rP6596iANTfxt2DkGnu7bdEDRnjnjUFzCVPPNtAJvm93QkdwjCnd3NuDZuCwwP04uzfrIlGjsuhBnVgjHbRWebcPq2rD3JqQrcjad9/FuDb02+ms/ellg39S94MYt/MFjlPp0VFZ+BRxo0BjOjwKEdisXii4y3ocvsm8H2xj0YyCVQ6Yn5Ty5Nd6A40bCHm7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVoQSxioQSPY8YrX0gxuziPngVzE9z8BAs283CCbigE=;
 b=bIP8EDzip/Hl4iu8ACAXl10s9D0h3I5HMHQzjNPpQmPv3npFlWP98dmZt3f9MEuM2+jihqic2sIrynb1TgQ176sLSn20/et1BKEH3IDRoCkYY+7bZmxpbT/b7JZlxJLeYYJ89VgVy0rhrQkFw9DrzCDFRLT6iJI0o9k07WtWK/mOGaPyRP/OI/KRKtHD6Kvqs7n7kuyMDEdXJHqb3w6f+3EVizO78DHwnCCOrQgiMhI1w5rh5BuwlmIu/ihBYi6XKvMK0q5J1igiclE/AJnSU+NSIkxSc4v1jYUIG74WZJ6SDOfWVjcGIUpnX8IGaXoJbmDN2SyQaYYHs2oB99YNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVoQSxioQSPY8YrX0gxuziPngVzE9z8BAs283CCbigE=;
 b=EB3d+Uq4DEFD/qBz40XsdT5H4OmMwFh7CAkigHhlQhtCiPmUA7jpSMTjeM1Wcr4n0dLhlqcnHtpvjXs2p7bm5GKMRn24bbrXsbXPKYS1ebKvADnGjq1KILkjQ9L+ZB7MZdG0rcf0S0I6TX2L6FEyAKmKn/KAPXbsrJeKr7S4az0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB8274.namprd04.prod.outlook.com (2603:10b6:a03:3e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Sun, 29 Aug
 2021 04:58:37 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Sun, 29 Aug 2021
 04:58:37 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 0/4] QEMU RISC-V ACLINT Support
Date: Sun, 29 Aug 2021 10:28:10 +0530
Message-Id: <20210829045814.69744-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To SJ0PR04MB7821.namprd04.prod.outlook.com
 (2603:10b6:a03:3ac::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.185.161) by
 MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Sun, 29 Aug 2021 04:58:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d93d292f-c0cc-49d9-2fbc-08d96aa9a920
X-MS-TrafficTypeDiagnostic: SJ0PR04MB8274:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB8274FB54A2B83EF2D57F4E118DCA9@SJ0PR04MB8274.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92xPi9NwJdDGgsp3yr7SXc+r9NWZziXbICWEM9uaAfE4hkS8axYmBuRVio1o2h93ourp24/rObE8eMuQ/I0MZVJ4igtkreyn7/l+5qqhRVXXPmuhkihsR2Vt5ZRfn9FgnDKsvvI8NYIXwobGYW2Wp50eN9JCn8A0IexVF4UiKqHDhjdB8S0K5/6cohQvjqVxcS8816aO4ZCnWGY4p/Fp0M/H3GC2pQKldZ6U3rHQQ0owHQSNhmn1RyMcA2ws+V+I6Hq3WO+GFP6uDxIlN0iasQGu3N6tqUALQA6beHBhchHy5/xj5BjU7nTAQPF6o/WMZaYzGG4IZB9CtjKKjpGdQXcapMkACFKgR7JBeJTtxXWFDubEs4qK9tjMYQYvDmdOLa6+rnkiPHo9hobfma+53InvVHbo5Omb7bUu3IT8M1cnWbynDvwMPPGSt1xjvLJvqSLFjCwU3b2RjQR/rVgklYdB+g8OePLbKH0ZG/G+/p9TtyJTqZXTJjWetQzug8eyLxwxR/jqdM+1tcTsPYJ35t/oZqwbJFUyyOY2YOAfBojfygs3pRxdOrDBD8HwZdh3q8tVgbZ1DNZMarU3B5+j2Rljbj7yOmvlKyTg01mLTZ8m9e38+oQSBH1GCspCXoSdOR+y5i74cHauNx4x3KXcigBa4x0Bpa+oQJtNutV2jMmtqYjzsrrm2il7N842CzstVY9M4kdjfFrKPqUGhmyfwPal8pw+r37O76GxtN0w1g+o5/RwFTUEva/lNJKOMUAIuk1MLfG5Lqp+BntetJ7tJ1Up6nElx/XXSoAYjEcDGqw6u6fmhhXZfBbFjG7jM7pI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(38350700002)(2616005)(478600001)(66476007)(86362001)(66556008)(38100700002)(52116002)(186003)(966005)(66946007)(956004)(2906002)(7696005)(6666004)(316002)(55016002)(36756003)(54906003)(8886007)(110136005)(4326008)(8676002)(8936002)(26005)(5660300002)(1076003)(44832011)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tWpgSqmqE8lBH0WDItlTXKBHYW2rs1eaXvymTDkNFfjiKShhK+w1xGis43zh?=
 =?us-ascii?Q?hlgnIXSVbIiBiLFftZ8PXuMbPYGR4WAW5FrIrJ1ajDpIx1nF3TKAmeHE/ZHU?=
 =?us-ascii?Q?FHYbbv4bZ+Sgk+rdPnRXmv/itijXE5n9dO3PK8GChARPlUjbbyD3D203lblq?=
 =?us-ascii?Q?8hzVjCYPXC9EjXZJ2gj3HzuhO7XJ27lzpQPHesbNZAYYouwK+bSaIgCZKLVU?=
 =?us-ascii?Q?E+jauPGaSL4h3+y+Y8O4Ao46ZqJIU/od4JmuuuOBK545RnUvfgFWr8LteU3s?=
 =?us-ascii?Q?dQ3vhiZqwlb33EcdTaRG02FjCg7XwpbYo9zZuyEuDQqj7txyX4FShlu6Z3ax?=
 =?us-ascii?Q?ro9bdapfRnOogeWjGC8dCVs6iXCoI+faPvW1eWg1UFdIpH16QSaEif0nlkMW?=
 =?us-ascii?Q?oj7skq3tl79rW8CMV3rHEbJysCvPwOY5hLhxUHielmKDvw2C765OwcBqRnjP?=
 =?us-ascii?Q?GwhqlXlPs7qOz1D6O5ncP18a06WfbmGz8cIWt66artkVCJ3khu5rx2FYHHYF?=
 =?us-ascii?Q?Vwl9eS4ks7aW35uK49wqthDlmUrX4DuecOUULUe5UEtfy8tszucV0BjzE9kZ?=
 =?us-ascii?Q?wDgFNXrqTt8j1RxkGEDtFyVpYPpPeTjtOzfHC9qIGOR7njbNzl5GRHF3nms9?=
 =?us-ascii?Q?G0AvBLkI1VCwcynoZe6c9TDk0XT/LwD6+C7ktr2GDoEUzfUV4aorHitayc02?=
 =?us-ascii?Q?BWN7vdwQKM6qZd+lLk7o0j5f1uxyw889r3dX9Ah0AUrHN1dc1bngp3GSx1yV?=
 =?us-ascii?Q?FQhrVYbZZrHUCCgq8I9AVo1+o6Qr9W+7bj97dqZDYTNpcnQ0UmeSIpRc+AW0?=
 =?us-ascii?Q?V9RkNVtpbk9us2hO0RrXijz8XU9wU/XLH8CaJ+hm+ursmF1PyJoiJwZZNhmx?=
 =?us-ascii?Q?RcTS84adZdcmGLe/bJ4WDQ8gdpw1n+y8FHvdVxFMOyky8UWka4LbSMwTTQx4?=
 =?us-ascii?Q?zQ4ytC/x8S22EoBqdZpy9EYKobLhfo0Nv3/GyL1YE3kyNiwJesBWxg06X+rt?=
 =?us-ascii?Q?GZV+iDt2g/+gOLha84ovP2c/ZSDLztROLaLV2WSa6z0dm0Bzx1LyKP/QgX3o?=
 =?us-ascii?Q?IFTaX24n4Lf4qY77jtaKvJ/TSF2mu36SUXht+MMkt2f9PnSKPhV5hISm4oFz?=
 =?us-ascii?Q?WnoH4FjcHFZj+Y/QL10ETepMFpF3O0RAPTtzx+LvfnJFR9UL/yjUuezyV7bk?=
 =?us-ascii?Q?3aLBwjXZgiD2fckQb6kELpp9T09kRlbkqq0eQ9f1/z5vMnBdQflDQKQVXuvc?=
 =?us-ascii?Q?uPUdxX7MHWL/3iey6mdNcpA9K9SsBI/87mR7FpMk7Qr3coqBwtICahdlpIKk?=
 =?us-ascii?Q?2QyJ4ui+6UwtsgUYTBLJWHPd?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93d292f-c0cc-49d9-2fbc-08d96aa9a920
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2021 04:58:37.3293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ12ZZ+1CimaepO/MjE0KM2avQvNSZ0GwNDkNkz7JcS9TnUmSLHiopyk21fCH4zlPLg9BxUsTA0qRrj7CnEbLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8274
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=8689bb0ac=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Sun, 29 Aug 2021 04:58:48 -0000

The RISC-V Advanced Core Local Interruptor (ACLINT) is an improvement
over the SiFive CLINT but also maintains backward compatibility with
the SiFive CLINT.

Latest RISC-V ACLINT specification (will be frozen soon) can be found at:
https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc

This series:
1) Replaces SiFive CLINT implementation with RISC-V ACLINT
2) Refactors RISC-V virt machine FDT generation
3) Adds optional full ACLINT support in QEMU RISC-V virt machine

This series can be found in the riscv_aclint_v3 branch at:
https://github.com/avpatel/qemu.git

Changes since v2:
 - Addresed nit comments in PATCH2
 - Update SSWI device emulation to match final ACLINT draft specification

Changes since v1:
 - Split PATCH1 into two patches where one patch renames CLINT sources
   and another patch updates the implementation
 - Addressed comments from Alistar and Bin

Anup Patel (4):
  hw/intc: Rename sifive_clint sources to riscv_aclint sources
  hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT
  hw/riscv: virt: Re-factor FDT generation
  hw/riscv: virt: Add optional ACLINT support to virt machine

 docs/system/riscv/virt.rst     |  10 +
 hw/intc/Kconfig                |   2 +-
 hw/intc/meson.build            |   2 +-
 hw/intc/riscv_aclint.c         | 426 ++++++++++++++++++++++
 hw/intc/sifive_clint.c         | 294 ---------------
 hw/riscv/Kconfig               |  12 +-
 hw/riscv/microchip_pfsoc.c     |  11 +-
 hw/riscv/shakti_c.c            |  13 +-
 hw/riscv/sifive_e.c            |  13 +-
 hw/riscv/sifive_u.c            |  11 +-
 hw/riscv/spike.c               |  16 +-
 hw/riscv/virt.c                | 646 ++++++++++++++++++++++-----------
 include/hw/intc/riscv_aclint.h |  80 ++++
 include/hw/intc/sifive_clint.h |  62 ----
 include/hw/riscv/virt.h        |   2 +
 15 files changed, 1010 insertions(+), 590 deletions(-)
 create mode 100644 hw/intc/riscv_aclint.c
 delete mode 100644 hw/intc/sifive_clint.c
 create mode 100644 include/hw/intc/riscv_aclint.h
 delete mode 100644 include/hw/intc/sifive_clint.h

-- 
2.25.1


