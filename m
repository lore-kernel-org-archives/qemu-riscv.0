Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD7BC0015E
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:57:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP1v5-0004qv-1O; Thu, 27 Jul 2023 10:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qP1v2-0004ps-1o; Thu, 27 Jul 2023 10:24:44 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1qP1uz-0005UN-Ao; Thu, 27 Jul 2023 10:24:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71A6261E99;
 Thu, 27 Jul 2023 14:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD982C433C9;
 Thu, 27 Jul 2023 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690467878;
 bh=n4o/1+JO1q/7Kk6TNf4LBldUmR/THk6UN/rSSi+fCWc=;
 h=From:To:Cc:Subject:Date:From;
 b=Q8PicMguBrCYjBvYoWV8MNxLNGJ04AGyXTF0Xxhot0ROV/8OoK3JpG/V6cHWQbP9d
 AnfjiAF54vUHpw/jpjGpVY7UHWude3CwPodee1wYo1Hxia2dmXtGNs809HeZ8VWNVd
 Zx8FQV/RnSlNsxTa2DKhVhuKI5R4bMhrTq2OhSHevBEICV6igEi040D9mCqnWiR7eQ
 MdyrmHZGMYlIITjhl7QchLh/3vsG5g3QI547Gu86ETSI7YE4OM+kCFdRlltzB8yUeC
 zP/A+nN/K2OxnztAIQe0sNIXrHYCkXTjckZ02wormdF1vXveToou6BaDhQj7kEF0Ab
 hTFMEZuPg1m0w==
From: Conor Dooley <conor@kernel.org>
To: qemu-riscv@nongnu.org
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Subject: [PATCH] hw/riscv: virt: Fix riscv,pmu DT node path
Date: Thu, 27 Jul 2023 15:24:17 +0100
Message-Id: <20230727-groom-decline-2c57ce42841c@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=conor.dooley@microchip.com; h=from:subject:message-id;
 bh=JLmPOncYrRgxQcCxErsT1BNk01ukDQfX1PeEAMPKQNE=;
 b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmH6gRWLnW0yZ79ljXjWpahvK7SxyLGA89PJoRfCIkW+
 jkv/vnijlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEwkLYDhf2RI85yTKYmbfzA/
 rrLccUrw5+Oqs2nM/IFd/me57h+TjmdkOHpvFs+vRh2LC1O/PLbVun7A5+y3kMOPmGXkWDvFMwy
 UWQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp;
 fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=conor@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Conor Dooley <conor.dooley@microchip.com>

On a dtb dumped from the virt machine, dt-validate complains:
soc: pmu: {'riscv,event-to-mhpmcounters': [[1, 1, 524281], [2, 2, 524284], [65561, 65561, 524280], [65563, 65563, 524280], [65569, 65569, 524280]], 'compatible': ['riscv,pmu']} should not be valid under {'type': 'object'}
        from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
That's pretty cryptic, but running the dtb back through dtc produces
something a lot more reasonable:
Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property

Moving the riscv,pmu node out of the soc bus solves the problem.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Bin Meng <bin.meng@windriver.com>
CC: Weiwei Li <liweiwei@iscas.ac.cn>
CC: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
CC: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
CC: qemu-riscv@nongnu.org
CC: qemu-devel@nongnu.org
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d90286dc46..25dcc2616e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -732,7 +732,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
     MachineState *ms = MACHINE(s);
     RISCVCPU hart = s->soc[0].harts[0];
 
-    pmu_name = g_strdup_printf("/soc/pmu");
+    pmu_name = g_strdup_printf("/pmu");
     qemu_fdt_add_subnode(ms->fdt, pmu_name);
     qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu");
     riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
-- 
2.39.2


