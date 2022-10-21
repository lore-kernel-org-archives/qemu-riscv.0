Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oll33-00016p-AK
	for mharc-qemu-riscv@gnu.org; Fri, 21 Oct 2022 01:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2w-00011h-2V; Fri, 21 Oct 2022 01:58:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2u-00074P-4C; Fri, 21 Oct 2022 01:58:17 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oll2n-001R0a-2i;
 Fri, 21 Oct 2022 06:58:09 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v5 5/6] hw/mips: use qemu_fdt_setprop_strings()
Date: Fri, 21 Oct 2022 06:58:07 +0100
Message-Id: <20221021055808.342055-6-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021055808.342055-1-qemu@ben.fluff.org>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.4, PDS_RDNS_DYNAMIC_FP=0.01,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 21 Oct 2022 05:58:18 -0000

Change to using qemu_fdt_setprop_strings() helper in hw/mips.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/mips/boston.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index d2ab9da1a0..759f6daafe 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -515,9 +515,6 @@ static const void *create_fdt(BostonState *s,
     MachineState *mc = s->mach;
     uint32_t platreg_ph, gic_ph, clk_ph;
     char *name, *gic_name, *platreg_name, *stdout_name;
-    static const char * const syscon_compat[2] = {
-        "img,boston-platform-regs", "syscon"
-    };
 
     fdt = create_device_tree(dt_size);
     if (!fdt) {
@@ -608,9 +605,8 @@ static const void *create_fdt(BostonState *s,
     platreg_name = g_strdup_printf("/soc/system-controller@%" HWADDR_PRIx,
                                    memmap[BOSTON_PLATREG].base);
     qemu_fdt_add_subnode(fdt, platreg_name);
-    qemu_fdt_setprop_string_array(fdt, platreg_name, "compatible",
-                                 (char **)&syscon_compat,
-                                 ARRAY_SIZE(syscon_compat));
+    qemu_fdt_setprop_strings(fdt, platreg_name, "compatible",
+                             "img,boston-platform-regs", "syscon");
     qemu_fdt_setprop_cells(fdt, platreg_name, "reg",
                            memmap[BOSTON_PLATREG].base,
                            memmap[BOSTON_PLATREG].size);
-- 
2.35.1


