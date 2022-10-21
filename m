Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oll32-00016U-RD
	for mharc-qemu-riscv@gnu.org; Fri, 21 Oct 2022 01:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2v-00011a-RW; Fri, 21 Oct 2022 01:58:17 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2u-00074Q-2q; Fri, 21 Oct 2022 01:58:17 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oll2n-001R0O-2H;
 Fri, 21 Oct 2022 06:58:09 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v5 1/6] device_tree: add qemu_fdt_setprop_strings() helper
Date: Fri, 21 Oct 2022 06:58:03 +0100
Message-Id: <20221021055808.342055-2-qemu@ben.fluff.org>
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

Add a helper to set a property from a set of strings
to reduce the following code:

    static const char * const clint_compat[2] = {
        "sifive,clint0", "riscv,clint0"
    };

    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
        (char **)&clint_compat, ARRAY_SIZE(clint_compat));

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
v4:
 - go back to the non-return call, no-one is using the result
v3;
 - fix return value for the call
 - add better help text
v2:
 - fix node/path in comment
---
 include/sysemu/device_tree.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index e7c5441f56..cb49df471b 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -87,6 +87,25 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
 int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
                                   const char *prop, char **array, int len);
 
+/**
+ * qemu_fdt_setprop_strings: set a property from a set of strings
+ *
+ * @fdt: pointer to the dt blob
+ * @path: node name
+ * @prop: property array
+ *
+ * This is a helper for the qemu_fdt_setprop_string_array() function
+ * which takes a va-arg set of strings instead of having to setup a
+ * single use string array.
+ */
+#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
+    do {                                                        \
+        static const char * const __strs[] = { __VA_ARGS__ };   \
+        qemu_fdt_setprop_string_array(fdt, path, prop,          \
+                (char **)&__strs, ARRAY_SIZE(__strs));          \
+     } while(0)
+
+
 int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
                              const char *property,
                              const char *target_node_path);
-- 
2.35.1


