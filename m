Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngFLB-00022C-Vm
	for mharc-qemu-riscv@gnu.org; Sun, 17 Apr 2022 20:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCD6-0001sL-UX; Sun, 17 Apr 2022 17:13:32 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:48562
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCD5-0001bW-Fd; Sun, 17 Apr 2022 17:13:32 -0400
Received: from localhost ([127.0.0.1] helo=luna)
 by hetzy.fluff.org with esmtp (Exim 4.89)
 (envelope-from <ben@luna.fluff.org>)
 id 1nfp7E-0008Rs-65; Sat, 16 Apr 2022 21:33:56 +0100
Received: from ben by luna with local (Exim 4.95)
 (envelope-from <ben@luna.fluff.org>) id 1nfo7v-002G1c-Vx;
 Sat, 16 Apr 2022 20:30:35 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH 1/4] device_tree: add qemu_fdt_setprop_reg64 helper
Date: Sat, 16 Apr 2022 20:30:31 +0100
Message-Id: <20220416193034.538161-2-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220416193034.538161-1-qemu@ben.fluff.org>
References: <20220416193034.538161-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -0.6 (/)
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: ben@luna.fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: none client-ip=2a01:4f8:222:2004::3;
 envelope-from=ben@luna.fluff.org; helo=hetzy.fluff.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 17 Apr 2022 20:34:04 -0400
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
X-List-Received-Date: Sun, 17 Apr 2022 21:13:33 -0000

Add a macro qemu_fdt_setprop_reg64() to set the given
node's reg property directly from the memory map entry
to avoid open coding of the following:

    qemu_fdt_setprop_cells(fdt, nodename, "reg",
        0x0, memmap[SIFIVE_U_DEV_OTP].base,
        0x0, memmap[SIFIVE_U_DEV_OTP].size);

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 include/sysemu/device_tree.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index ef060a9759..28352e7fcb 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -135,6 +135,21 @@ int qemu_fdt_add_path(void *fdt, const char *path);
                          sizeof(qdt_tmp));                                    \
     } while (0)
 
+/**
+ * qemu_fdt_setprop_reg64:
+ * @fdt: the device tree path
+ * @node_path: node to set property on
+ * @map: the map entry to set the reg from
+ *
+ * A helper tp set the 'reg' node on the specified node from the given map
+ * entry.
+ */
+#define qemu_fdt_setprop_reg64(fdt, path, map)                  \
+    qemu_fdt_setprop_cells(fdt, path, "reg",                    \
+                           (map)->base >> 32, (map)->base,      \
+                           (map)->size >> 32, (map)->size)
+
+
 void qemu_fdt_dumpdtb(void *fdt, int size);
 
 /**
-- 
2.35.1


