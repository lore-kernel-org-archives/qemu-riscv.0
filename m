Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLUQO-0007dt-9r
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 14:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ9-0007KX-G4; Tue, 09 Aug 2022 14:57:41 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:57414 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ6-0003Ab-Ll; Tue, 09 Aug 2022 14:57:41 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oLUQ1-0039E2-0w;
 Tue, 09 Aug 2022 19:57:33 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v4 4/6] hw/core: use qemu_fdt_setprop_strings()
Date: Tue,  9 Aug 2022 19:56:38 +0100
Message-Id: <20220809185639.750345-5-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220809185639.750345-1-qemu@ben.fluff.org>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.187, PDS_RDNS_DYNAMIC_FP=0.001,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 09 Aug 2022 18:57:46 -0000

Change to using the qemu_fdt_setprop_strings() helper in
hw/core code.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 hw/core/guest-loader.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index c61ebc4144..7b8e32e06f 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -56,18 +56,15 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
     qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
 
     if (s->kernel) {
-        const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
-        qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                      (char **) &compat,
-                                      ARRAY_SIZE(compat));
+        qemu_fdt_setprop_strings(fdt, node, "compatible",
+                                 "multiboot,module", "multiboot,kernel");
+
         if (s->args) {
             qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
         }
     } else if (s->initrd) {
-        const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
-        qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                      (char **) &compat,
-                                      ARRAY_SIZE(compat));
+        qemu_fdt_setprop_strings(fdt, node, "compatible",
+                                 "multiboot,module", "multiboot,ramdisk");
     }
 }
 
-- 
2.35.1


