Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ossEC-0007ke-DT
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 16:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1osqXy-0007XM-8H; Wed, 09 Nov 2022 14:15:43 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1osqXw-0001db-EJ; Wed, 09 Nov 2022 14:15:38 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0750061C5A;
 Wed,  9 Nov 2022 19:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43227C433D6;
 Wed,  9 Nov 2022 19:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668021325;
 bh=NBnRr7WkoGXtjz0uvWYDYVwkcealLEitdzP5+LmavIc=;
 h=From:To:Cc:Subject:Date:From;
 b=bA2QQVPkxbhBiQZclaqhs5IkzT6t8wkcHAWCv/mSnu3J+m8fhLmK4usFAepBRb2gU
 wMuuBnI3qBsBaECxvaguMzJg3oF4jJ3gNLAR9WvEfhTvzM3OMMlq5RT9ILqarY9oLn
 nWc4lFgcScZTNlg9OMmTdA3jcgyBABLjDlDg7jy8iybRHuUAGP/CjIJs3p/zgf4INz
 DVQeNlv3G2ebriOTrRDwu4nVPdtf5wuwizBFIighO5Z0J4fERq1hjJteMRhwMB3r7r
 9bjte4tv06q0gdSWKgIaxDfIA1MfoeHgLLI3anlWi8ZnfNsdjv0BDRXYsHx7Pc8z/k
 H73x3ppZPST/Q==
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] hw/misc/pfsoc: add fabric clocks to ioscb
Date: Wed,  9 Nov 2022 19:08:50 +0000
Message-Id: <20221109190849.1556711-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=conor@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 09 Nov 2022 16:03:14 -0500
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
X-List-Received-Date: Wed, 09 Nov 2022 19:15:43 -0000

From: Conor Dooley <conor.dooley@microchip.com>

On PolarFire SoC, some peripherals (eg the PCI root port) are clocked by
"Clock Conditioning Circuitry" in the FPGA. The specific clock depends
on the FPGA bitstream & can be locked to one particular {D,P}LL - in the
Icicle Kit Reference Design v2022.09 or later this is/will be the case.

Linux v6.1+ will have a driver for this peripheral and devicetrees that
previously relied on "fixed-frequency" clock nodes have been switched
over to clock-controller nodes. The IOSCB region is represented in QEMU,
but the specific region of it that the CCCs occupy has not so v6.1-rcN
kernels fail to boot in QEMU.

Add the regions as unimplemented so that the status-quo in terms of boot
is maintained.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
The last line there is a white lie. v6.1-rcN has both v2022.09 and
v2022.10 reference design changes. This patch only accounts for the
v2022.09 changes. The FPGA design is a moving target and I am not
really sure how to handle that in QEMU. For v2022.10 a bunch of stuff
got changed, including the addresses that DDR lies at which I am not
sure how to handle yet.

That puts my todo list of broken things to:
- MMC (only direct kernel boot works), pre v2022.09 reference issue
- PCI root port address, address changed in v2022.09 but from a cursory
  check, I didn't see any PCI support in the first place. It's connected
  to a FIC, so I think it can just be made into an unimplemented region.
- DDR address changes, 2022.10 issue. Looks like a straightforward
  change to hw/riscv/pfsoc.c but I don't think it'll be backwards
  compatible.
- hwrng breaks boot. Tipping away at this one, hopefully I'll have a fix
  for it soon. Need to implement the irq side of the mailbox for it.

I'll send some more patches as I work through them.

 hw/misc/mchp_pfsoc_ioscb.c         | 6 ++++++
 include/hw/misc/mchp_pfsoc_ioscb.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
index f4fd55a0e5..f976e42f72 100644
--- a/hw/misc/mchp_pfsoc_ioscb.c
+++ b/hw/misc/mchp_pfsoc_ioscb.c
@@ -33,6 +33,7 @@
  */
 #define IOSCB_WHOLE_REG_SIZE        0x10000000
 #define IOSCB_SUBMOD_REG_SIZE       0x1000
+#define IOSCB_CCC_REG_SIZE          0x2000000
 
 /*
  * There are many sub-modules in the IOSCB module.
@@ -45,6 +46,7 @@
 #define IOSCB_LANE23_BASE           0x06510000
 #define IOSCB_CTRL_BASE             0x07020000
 #define IOSCB_CFG_BASE              0x07080000
+#define IOSCB_CCC_BASE              0x08000000
 #define IOSCB_PLL_MSS_BASE          0x0E001000
 #define IOSCB_CFM_MSS_BASE          0x0E002000
 #define IOSCB_PLL_DDR_BASE          0x0E010000
@@ -168,6 +170,10 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
                           "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
 
+    memory_region_init_io(&s->ccc, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
+                          "mchp.pfsoc.ioscb.ccc", IOSCB_CCC_REG_SIZE);
+    memory_region_add_subregion(&s->container, IOSCB_CCC_BASE, &s->ccc);
+
     memory_region_init_io(&s->pll_mss, OBJECT(s), &mchp_pfsoc_pll_ops, s,
                           "mchp.pfsoc.ioscb.pll_mss", IOSCB_SUBMOD_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_PLL_MSS_BASE, &s->pll_mss);
diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
index 9235523e33..687b213742 100644
--- a/include/hw/misc/mchp_pfsoc_ioscb.h
+++ b/include/hw/misc/mchp_pfsoc_ioscb.h
@@ -30,6 +30,7 @@ typedef struct MchpPfSoCIoscbState {
     MemoryRegion lane23;
     MemoryRegion ctrl;
     MemoryRegion cfg;
+    MemoryRegion ccc;
     MemoryRegion pll_mss;
     MemoryRegion cfm_mss;
     MemoryRegion pll_ddr;
-- 
2.37.2


