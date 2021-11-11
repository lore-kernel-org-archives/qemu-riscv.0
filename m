Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml38h-0002wL-M3
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 01:00:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml38e-0002rj-0o; Thu, 11 Nov 2021 01:00:44 -0500
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:58497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml38a-0003TQ-Qx; Thu, 11 Nov 2021 01:00:43 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07453308|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0231685-0.000144035-0.976687;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lr0nzHO_1636610436; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr0nzHO_1636610436)
 by smtp.aliyun-inc.com(10.147.41.231);
 Thu, 11 Nov 2021 14:00:36 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 05/20] target/riscv: Use gdb xml according to max mxlen
Date: Thu, 11 Nov 2021 13:57:45 +0800
Message-Id: <20211111055800.42672-6-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.121; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-121.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 06:00:44 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/gdbstub.c | 71 +++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 23429179e2..8d0f9139d7 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -24,11 +24,23 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+    target_ulong tmp;
 
     if (n < 32) {
-        return gdb_get_regl(mem_buf, env->gpr[n]);
+        tmp = env->gpr[n];
     } else if (n == 32) {
-        return gdb_get_regl(mem_buf, env->pc);
+        tmp = env->pc;
+    } else {
+        return 0;
+    }
+
+    switch (env->misa_mxl_max) {
+    case MXL_RV32:
+        return gdb_get_reg32(mem_buf, tmp);
+    case MXL_RV64:
+        return gdb_get_reg64(mem_buf, tmp);
+    default:
+        g_assert_not_reached();
     }
     return 0;
 }
@@ -37,18 +49,32 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-
-    if (n == 0) {
-        /* discard writes to x0 */
-        return sizeof(target_ulong);
-    } else if (n < 32) {
-        env->gpr[n] = ldtul_p(mem_buf);
-        return sizeof(target_ulong);
+    int length = 0;
+    target_ulong tmp;
+
+    switch (env->misa_mxl_max) {
+    case MXL_RV32:
+        tmp = (int32_t)ldl_p(mem_buf);
+        length = 4;
+        break;
+    case MXL_RV64:
+        if (cpu_get_xl(env) < MXL_RV64) {
+            tmp = (int32_t)ldq_p(mem_buf);
+        } else {
+            tmp = ldq_p(mem_buf);
+        }
+        length = 8;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (n > 0 && n < 32) {
+        env->gpr[n] = tmp;
     } else if (n == 32) {
-        env->pc = ldtul_p(mem_buf);
-        return sizeof(target_ulong);
+        env->pc = tmp;
     }
-    return 0;
+
+    return length;
 }
 
 static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
@@ -198,13 +224,20 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
                                  36, "riscv-32bit-fpu.xml", 0);
     }
-#if defined(TARGET_RISCV32)
-    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
-                             1, "riscv-32bit-virtual.xml", 0);
-#elif defined(TARGET_RISCV64)
-    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
-                             1, "riscv-64bit-virtual.xml", 0);
-#endif
+    switch (env->misa_mxl_max) {
+    case MXL_RV32:
+        gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
+                                 riscv_gdb_set_virtual,
+                                 1, "riscv-32bit-virtual.xml", 0);
+        break;
+    case MXL_RV64:
+        gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
+                                 riscv_gdb_set_virtual,
+                                 1, "riscv-64bit-virtual.xml", 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                              riscv_gen_dynamic_csr_xml(cs, cs->gdb_num_regs),
-- 
2.25.1


