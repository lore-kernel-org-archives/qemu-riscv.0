Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oll33-000173-HQ
	for mharc-qemu-riscv@gnu.org; Fri, 21 Oct 2022 01:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2w-00011g-1b; Fri, 21 Oct 2022 01:58:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2u-00074N-5h; Fri, 21 Oct 2022 01:58:17 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oll2n-001R0R-2O;
 Fri, 21 Oct 2022 06:58:09 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v5 2/6] hw/core: don't check return on
 qemu_fdt_setprop_string_array()
Date: Fri, 21 Oct 2022 06:58:04 +0100
Message-Id: <20221021055808.342055-3-qemu@ben.fluff.org>
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

The qemu_fdt_setprop_string_array() does not return error codes and
will call exit() if any of the fdt calls fails (and should print an
error with the node being altered). This is done to prepare for the
change for qemu_fdt_setprop_strings() helper which does not return
any error codes (hw/core/guest-loader.c is the only place where an
return is checked).

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 hw/core/guest-loader.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index 391c875a29..c61ebc4144 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -57,25 +57,17 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
 
     if (s->kernel) {
         const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
-            error_setg(errp, "couldn't set %s/compatible", node);
-            return;
-        }
+        qemu_fdt_setprop_string_array(fdt, node, "compatible",
+                                      (char **) &compat,
+                                      ARRAY_SIZE(compat));
         if (s->args) {
-            if (qemu_fdt_setprop_string(fdt, node, "bootargs", s->args) < 0) {
-                error_setg(errp, "couldn't set %s/bootargs", node);
-            }
+            qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
         }
     } else if (s->initrd) {
         const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
-        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-                                          (char **) &compat,
-                                          ARRAY_SIZE(compat)) < 0) {
-            error_setg(errp, "couldn't set %s/compatible", node);
-            return;
-        }
+        qemu_fdt_setprop_string_array(fdt, node, "compatible",
+                                      (char **) &compat,
+                                      ARRAY_SIZE(compat));
     }
 }
 
-- 
2.35.1


