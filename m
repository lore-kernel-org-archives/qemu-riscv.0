Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRdFA-0000Xq-Gt
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 13:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdF7-0000Vb-QN; Mon, 13 Feb 2023 13:07:57 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdF5-00029g-PL; Mon, 13 Feb 2023 13:07:57 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp62t1676311396tyhr8vhs
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 02:03:15 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 11/18] target/riscv: gdbstub: Drop the vector CSRs in
 riscv-vector.xml
Date: Tue, 14 Feb 2023 02:02:07 +0800
Message-Id: <20230213180215.1524938-12-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
References: <20230213180215.1524938-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 13 Feb 2023 18:07:58 -0000

It's worth noting that the vector CSR predicate() has a similar
run-time check logic to the FPU CSR. With the previous patch our
gdbstub can correctly report these vector CSRs via the CSR xml.

Commit 719d3561b269 ("target/riscv: gdb: support vector registers for rv64 & rv32")
inserted these vector CSRs in an ad-hoc, non-standard way in the
riscv-vector.xml. Now we can treat these CSRs no different from
other CSRs.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/gdbstub.c | 75 ------------------------------------------
 1 file changed, 75 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index ef52f41460..6048541606 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -127,40 +127,6 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-/*
- * Convert register index number passed by GDB to the correspond
- * vector CSR number. Vector CSRs are defined after vector registers
- * in dynamic generated riscv-vector.xml, thus the starting register index
- * of vector CSRs is 32.
- * Return 0 if register index number is out of range.
- */
-static int riscv_gdb_vector_csrno(int num_regs)
-{
-    /*
-     * The order of vector CSRs in the switch case
-     * should match with the order defined in csr_ops[].
-     */
-    switch (num_regs) {
-    case 32:
-        return CSR_VSTART;
-    case 33:
-        return CSR_VXSAT;
-    case 34:
-        return CSR_VXRM;
-    case 35:
-        return CSR_VCSR;
-    case 36:
-        return CSR_VL;
-    case 37:
-        return CSR_VTYPE;
-    case 38:
-        return CSR_VLENB;
-    default:
-        /* Unknown register. */
-        return 0;
-    }
-}
-
 static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
 {
     uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
@@ -174,19 +140,6 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
         return cnt;
     }
 
-    int csrno = riscv_gdb_vector_csrno(n);
-
-    if (!csrno) {
-        return 0;
-    }
-
-    target_ulong val = 0;
-    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
-
-    if (result == RISCV_EXCP_NONE) {
-        return gdb_get_regl(buf, val);
-    }
-
     return 0;
 }
 
@@ -201,19 +154,6 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
         return vlenb;
     }
 
-    int csrno = riscv_gdb_vector_csrno(n);
-
-    if (!csrno) {
-        return 0;
-    }
-
-    target_ulong val = ldtul_p(mem_buf);
-    int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
-
-    if (result == RISCV_EXCP_NONE) {
-        return sizeof(target_ulong);
-    }
-
     return 0;
 }
 
@@ -361,21 +301,6 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
         num_regs++;
     }
 
-    /* Define vector CSRs */
-    const char *vector_csrs[7] = {
-        "vstart", "vxsat", "vxrm", "vcsr",
-        "vl", "vtype", "vlenb"
-    };
-
-    for (i = 0; i < 7; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"%s\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"int\"/>",
-                               vector_csrs[i], TARGET_LONG_BITS, base_reg++);
-        num_regs++;
-    }
-
     g_string_append_printf(s, "</feature>");
 
     cpu->dyn_vreg_xml = g_string_free(s, false);
-- 
2.25.1


