Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o2eqI-00035C-3R
	for mharc-qemu-riscv@gnu.org; Sat, 18 Jun 2022 16:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1o2eqF-0002zF-UJ; Sat, 18 Jun 2022 16:14:47 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:41234 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1o2eqC-00051K-Vs; Sat, 18 Jun 2022 16:14:47 -0400
Received: from ben by luna with local (Exim 4.95)
 (envelope-from <ben@luna.fluff.org>) id 1o2eq2-0010hl-DL;
 Sat, 18 Jun 2022 21:14:34 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH 3/4] device_tree: add qemu_fdt_setprop_strings() helper
Date: Sat, 18 Jun 2022 21:14:32 +0100
Message-Id: <20220618201433.240973-4-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220618201433.240973-1-qemu@ben.fluff.org>
References: <20220618201433.240973-1-qemu@ben.fluff.org>
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
X-List-Received-Date: Sat, 18 Jun 2022 20:14:48 -0000

Add a helper to set a property from a set of strings
to reduce the following code:

    static const char * const clint_compat[2] = {
        "sifive,clint0", "riscv,clint0"
    };

    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
        (char **)&clint_compat, ARRAY_SIZE(clint_compat));

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
--
v2:
- fix node/path in comment
---
 include/sysemu/device_tree.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 79ce009a22..28b68bacaf 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -87,6 +87,21 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
 int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
                                   const char *prop, char **array, int len);
 
+/**
+ * qemu_fdt_setprop_strings: set a property from a set of strings
+ *
+ * @fdt: pointer to the dt blob
+ * @path: node name
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


