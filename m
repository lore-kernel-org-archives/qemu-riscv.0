Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL1bQ-0004az-Fh
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 07:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bP-0004Xd-9V; Tue, 31 Aug 2021 07:06:51 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:13062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bL-0000tA-R8; Tue, 31 Aug 2021 07:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630408007; x=1661944007;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=E/HQFsViWaMkIBujlou/Z4C0Ob0/b14XmrMFIQSamaM=;
 b=ScvlrOLlf2aRehya6xcJ67MWiaBSfr9qUp2f6r879p4X/4hNZa+yAXLH
 sPAfXD9c2io/qV999SS2KhSnAdusEQMzaRyHJTJJ1mNwM79Tt8TPWXSb5
 HkcqViB3ngZDvy1eFWDqVIDUJnRU4Qtdx9ngjRETqzbCsPms2ERIPW5JD
 lWHUY20uJJJwu3WsOkkgPv5iEA+UMLkQG+QN9yP3L5kllpsjR/n2EOCxR
 HbeKgodt51gHHmzukUPH9ve3E8NgOHHV4CBd9phkksFb78yGaWruE5PrZ
 fMeZEdG1zlKZs+3EzWoStEoFB2MXdUbJu8GgxnhTQmaE4kPDZFDuUbX06 w==;
X-IronPort-AV: E=Sophos;i="5.84,366,1620662400"; d="scan'208";a="177951716"
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2021 19:06:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1e1ON6TGptI2A1QZsnj2VaGRXFYGIN+yjz+UKfd6SzHNgX9AnVRbxVzprpLUb8l6yVu4/bjh647YZLfMl+5v3WL8cW4dgHFHtHxDuNN/g1JxPAyd8eo35ia61V3fsV6ma7B9C9Pg94gwPPIUk/dWP1Q2wMwJ34RzxukJudlLjz4WXH+dR/nm4UEz/5t9RhXS1h0wkEe0u8ggk93I0h24nx4sjgPaiu7yjhgEZTyoFqmMKr24zJdZvZvBBdF7M6p/+dqnZ0865SesCFv2c5h3mIsWZVQ8lT3Rffr4OO7jAChWqObySc8foUdOJfdmdqU+DsXrLc+30oFchg6QRIdWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+CYTret+TkN6e1rfo9PNWNwIQxB3yNsTloyEZrLCz0=;
 b=hmM+LLJoum/OGqhlIBILx4SPXI0/FFAIguYU3xEmcgcJqHsrIwFnOtGfjYh2iYLMeSwRDCGsUfp78+8qeL1zUleVZPV3mk6dexwR5XTr1t9x5DGnyEInP8gdYjYifclr0r8c7K9eUgAJPlHAwrD55WKRt982IN1xDi7tk1iVomhdgbGfuIt2cfzmRTA96vRRfQ5Er5+Dl3lU3qqFpRriY3gQklVsOvsdb1hfrkhKr5wHNy4GpEzprVyNEwOx4mui8UnGUFBFccj+r87sTtMC3gSjbip4WZDZquiAelWoErqv3oNNi62iEQemRMIu2W3O6SaieNGM7ok0sWfGzsqOxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+CYTret+TkN6e1rfo9PNWNwIQxB3yNsTloyEZrLCz0=;
 b=k5OXGKkHCtcghgpHImmJd65SPXXfcN8EPkgvoiJUOTqWyh6fcZmDv8yjn4tsdhVeTU2v+oJl4dNdmbUD5xuU+8Lyaf13AfukVTXSRoX2jgtboKmp86PB/FjjUD8nnaqD/0Qk428YLYdSKgJfkX1VBtUxv3NI7vXp3UjdGQM14M4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB7886.namprd04.prod.outlook.com (2603:10b6:a03:300::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 11:06:40 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 11:06:39 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 0/4] QEMU RISC-V ACLINT Support
Date: Tue, 31 Aug 2021 16:35:59 +0530
Message-Id: <20210831110603.338681-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To SJ0PR04MB7821.namprd04.prod.outlook.com
 (2603:10b6:a03:3ac::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.35.197) by
 MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 11:06:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3af27c4d-9944-40bf-fa05-08d96c6f67f1
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7886:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB788637F83A4A5E9C337C32DD8DCC9@SJ0PR04MB7886.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G53xcsp2E7eHp9PZcnknlMh4Uy36TASKkb2rJYP2JP0a/fOfpeZYZ3ubCDk2/2utrB8L2MHC+9c5mCW9Jq/sqo84EOQSlqgrH8x9FGPL8bGgwggllArG0fyVhA2nYMdHOsvfp+10MFEeNb3suvCd/3pKhoJfmoBa7esZzGHGJUxXXWbA4bYjqp9NzyTKG/lDbjwyRHeYFhulG5j0vQzLAzP6RlcxfIaQ4ofbpsYDLaI3ZSErSHCn8ySLmgqZu0gGXugMtUwd5/fXguOcNRt1FzmFxlWVfE85tNyc27iE4R5b3Qh5xM+WvhMKfrbFXgxSkX3DM83yagvqNGsZZNMgnpqxYYU7wnka+4/x/EN+n2hb1I4wEr9I8NuGeJwbkUnXyqrhssCHNMNrpMQlX8QUFYzGrs6R9F0QfazgC//Lj6rLLTEWto4EQnaiOj2a1fOKfxhiNL9jq5OdhkQ8tvFeWd8tXZl5/Kn9wJU11ij/b7NBHjvmw7wXPFPMEkqO6ex1vA/knOUMRHJs6WordvZa5sA238JHEIdg/TMP56xwnwUjsybbU6DFUvS9Rgmvulqy0Gp5rWIhHMoSDSKirVVVmzyyRqpaaYWHzWwNQ0R0YbTz/MB/17nBg6qpMAqvYVOj3qYbOpy4vDVHSMCqIiWtL4a5jUjShwIP9CmqFmJRc21f7O6kh1jGadu/6vQ7BcFlIBVUAH8LwdRMq09UhT8H6NT17DvWe89UQciumG2DwVDr7c1DnZDfunByP5P2tTppS/ilQn7w7kgEqz988DSzXcIuiJOFhjTksHnJnAmsE8EDrKpBUKtf8TZP4W4TxoAI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(38350700002)(86362001)(2616005)(7696005)(38100700002)(44832011)(2906002)(26005)(8936002)(956004)(66556008)(8676002)(55016002)(54906003)(5660300002)(8886007)(66476007)(83380400001)(316002)(66946007)(186003)(36756003)(110136005)(478600001)(1076003)(52116002)(4326008)(6666004)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5JUzoxpM3x4iKxYockyWTXQo5SO6sBq6FB2qwA4RMWxu8E5svV/+0mwJgasx?=
 =?us-ascii?Q?SOnyRJbHjsQgisZP8N3uo/9gIEaQBawP8LpgeiL5vGxu/x0Q4Gwi1XhlmHv1?=
 =?us-ascii?Q?CO8Zhpst1vTLMTTvCZ3dXB9/+kKgksW0+zF/KOhCTfje17TFpcVPKB5mLQpS?=
 =?us-ascii?Q?doJ4MDB63iwueOfdkI1O7MKlpgCrj1ai7YlfoqYiUe/Wfzb5Z5HZGAlGixIw?=
 =?us-ascii?Q?O4B3VAQSE+AW+d+Iysmh8XnfGH5ZLVrBbWrSMvPrTpcToX9UApC6fvpf0/l9?=
 =?us-ascii?Q?xE9UjqVNX61brETI25ubAS1BY3EP12gsh6/raioIhKUv4/oOzj7ZmuD9CpWO?=
 =?us-ascii?Q?6nvzPGiByxXuDAEMJ1Vkryu/L9MacKiUhZnx//V1eSXv9qrsZmhyhVVo47Ou?=
 =?us-ascii?Q?9GyGZmq+Qu64AlVjhSYXv5rq65dMp2MkSh4S3x9hUgifYA2xhjfoo7qvlXED?=
 =?us-ascii?Q?7rnXNsHk0as9ddaUpOIiDIHAsjV9WlR3DDUs7hUer9focB1GmUF3K2xvebN3?=
 =?us-ascii?Q?3h55A06RaKDuJYH9klSST7FSUKDlMBCaXTS35VsYpeOkVeR84tk430GGVefy?=
 =?us-ascii?Q?CClFHQm1BSfIJbvyKQSwR37hb3UUF+rC3Tx9hOO8JcnAqnnWRdKPBeOB4kK4?=
 =?us-ascii?Q?Kb7Nse/PWNaZS0SGFaChiAQ8R5XQL6uUNuq3tqm9Qct0QUjo1/o5FmmlzxV9?=
 =?us-ascii?Q?42/BUTNISUQut3a+/nF64Co4RfsJhVdXNRXuMOP1trKtThJ29ax2Nt5lzu5a?=
 =?us-ascii?Q?uXJTDVvHQ91Cf5LGdIcyyd9hcUc4FRu24DOeoDWvi2Z+Qmgzr1ky0Mydo2Of?=
 =?us-ascii?Q?ZNzK7yyXpRJR2SZuGZE6iItU5mlSc5lX5vjDnvWL+zNRHDZvHy7iTQD1lxI9?=
 =?us-ascii?Q?zWFKdZtJCNJb73jB5egDkbShuTA96tGfxrLtNGcOxPOwr30mTG3bpBU/iBNm?=
 =?us-ascii?Q?VLt+IRj6sdyHc2AbcihnqE5bGqhsbMtIzvbt9fQxny9uKqVNntmmPrXx8Zj2?=
 =?us-ascii?Q?9eqo0aaNfxT6WJLR6AP8h6I+ZzPx43aqvqOLJJqB1J+3IPHG/G1dMvisgrW6?=
 =?us-ascii?Q?thSDHiLoQiviti8btxqEiIIj/vMdYTuo161+/EDlbGeVMKNXROenjSq9K4ds?=
 =?us-ascii?Q?9KMkKjHFB2tXfxIJi/okag+heNIrbsU84lBexajTEZ9c+9+ALhcc2At/D/vF?=
 =?us-ascii?Q?SNmCQyHhqlpIo8e/WZ9r/QHlr2j1+sfrzlHazy1Q3g3Emsn3wskaGR0vusKB?=
 =?us-ascii?Q?YK0BzxlRA129jZPCpE5PhwcLWkMmORaj/HWf5I0XOOjJtTxO/kyI0LrRvQwS?=
 =?us-ascii?Q?h5qynP55THA1g0NTRMidTePA?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af27c4d-9944-40bf-fa05-08d96c6f67f1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 11:06:39.2409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNNkkZDaz+wWQX8+elVOXCnYEDgCglerhnwgNovXMfy0I5HEDGmoMNO8rS2ra8Ptzj3vSvU11HB8QNw9cIiuZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7886
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=870f666b0=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Tue, 31 Aug 2021 11:06:51 -0000

The RISC-V Advanced Core Local Interruptor (ACLINT) is an improvement
over the SiFive CLINT but also maintains backward compatibility with
the SiFive CLINT.

Latest RISC-V ACLINT specification (will be frozen soon) can be found at:
https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc

This series:
1) Replaces SiFive CLINT implementation with RISC-V ACLINT
2) Refactors RISC-V virt machine FDT generation
3) Adds optional full ACLINT support in QEMU RISC-V virt machine

This series can be found in the riscv_aclint_v4 branch at:
https://github.com/avpatel/qemu.git

Changes since v3:
 - Rebased on Alistair's CPU GPIO pins v3 series
 - Replaced error_report() in PATCH2 with qemu_log_mask()

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
 hw/intc/riscv_aclint.c         | 460 +++++++++++++++++++++++
 hw/intc/sifive_clint.c         | 315 ----------------
 hw/riscv/Kconfig               |  12 +-
 hw/riscv/microchip_pfsoc.c     |  11 +-
 hw/riscv/shakti_c.c            |  13 +-
 hw/riscv/sifive_e.c            |  13 +-
 hw/riscv/sifive_u.c            |  11 +-
 hw/riscv/spike.c               |  16 +-
 hw/riscv/virt.c                | 652 ++++++++++++++++++++++-----------
 include/hw/intc/riscv_aclint.h |  80 ++++
 include/hw/intc/sifive_clint.h |  62 ----
 include/hw/riscv/virt.h        |   2 +
 15 files changed, 1047 insertions(+), 614 deletions(-)
 create mode 100644 hw/intc/riscv_aclint.c
 delete mode 100644 hw/intc/sifive_clint.c
 create mode 100644 include/hw/intc/riscv_aclint.h
 delete mode 100644 include/hw/intc/sifive_clint.h

-- 
2.25.1


