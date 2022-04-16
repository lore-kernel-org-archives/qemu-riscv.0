Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngFLD-00027S-Mc
	for mharc-qemu-riscv@gnu.org; Sun, 17 Apr 2022 20:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCDF-00024C-17; Sun, 17 Apr 2022 17:13:41 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:48562
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCDD-0001bW-Co; Sun, 17 Apr 2022 17:13:40 -0400
Received: from localhost ([127.0.0.1] helo=luna)
 by hetzy.fluff.org with esmtp (Exim 4.89)
 (envelope-from <ben@luna.fluff.org>)
 id 1nfp7G-0008S9-8V; Sat, 16 Apr 2022 21:33:58 +0100
Received: from ben by luna with local (Exim 4.95)
 (envelope-from <ben@luna.fluff.org>) id 1nfo7w-002G1i-25;
 Sat, 16 Apr 2022 20:30:36 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH 3/4] device_tree: add qemu_fdt_setprop_strings() helper
Date: Sat, 16 Apr 2022 20:30:33 +0100
Message-Id: <20220416193034.538161-4-qemu@ben.fluff.org>
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
X-List-Received-Date: Sun, 17 Apr 2022 21:13:41 -0000

Add a helper to set a property from a set of strings
to reduce the following code:

    static const char * const clint_compat[2] = {
        "sifive,clint0", "riscv,clint0"
    };

    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
        (char **)&clint_compat, ARRAY_SIZE(clint_compat));

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 include/sysemu/device_tree.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 28352e7fcb..6ad09564d7 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -87,6 +87,21 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
 int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
                                   const char *prop, char **array, int len);
 
+/**
+ * qemu_fdt_setprop_strings: set a property from a set of strings
+ *
+ * @fdt: pointer to the dt blob
+ * @name: node name
+ * @prop: property array
+ */
+#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
+    do {                                                        \
+        static const char * const __strs[] = { __VA_ARGS__ };   \
+        qemu_fdt_setprop_string_array(fdt, path, prop,          \
+                (char **)&__strs, ARRAY_SIZE(__strs));          \
+    } while(0)
+
+
 int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
                              const char *property,
                              const char *target_node_path);
-- 
2.35.1


