Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWxWA-0005LL-A1
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 05:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxW8-0005Ki-Lz; Tue, 28 Feb 2023 05:47:32 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxW6-0003xe-EI; Tue, 28 Feb 2023 05:47:32 -0500
X-QQ-mid: bizesmtp71t1677581234teljenir
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:47:12 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
X-QQ-FEAT: nA8mzCjPbKgVHkwH6S450zcro+Wuzi0qx+B7gHciUvrnZOdIujWNnHEt+BGYs
 AsZYPNydL9UA77txphqXAcbkt0V/rA7qj1kqCP4BI29G9d/27HPPhTdwOOTwQo/ChsYbTJN
 1N8JC+zRIlmdby3tImqS4eXJtKAr/gxQmg7ZpmWGTuRje5keJDEx+pUcnbizWTFdQjIH7xZ
 lUHXKM9b/kxlelYnycoiel0j8EpCK2TSpNPt7eASHB3vUdw85D/qzxmPZLQ9DpxrtHtXtMI
 M+HUEvBCEDktGmE/jMQliKet/OsiU2cUv4VhrBNW0NfmILN05lNjzvB/OWJBpqOW/OHcUx8
 rVU0iGmIuWxANLsJEBd2OympwyqQSVtL2tt7hS8l8hm0j2xJQc=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 06/18] target/riscv: Coding style fixes in csr.c
Date: Tue, 28 Feb 2023 18:40:22 +0800
Message-Id: <20230228104035.1879882-7-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Feb 2023 10:47:33 -0000

Fix various places that violate QEMU coding style:

- correct multi-line comment format
- indent to opening parenthesis

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

(no changes since v1)

 target/riscv/csr.c | 62 ++++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cfd7ffc5c2..6a82628749 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -963,7 +963,7 @@ static RISCVException sstc_32(CPURISCVState *env, int csrno)
 }
 
 static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
-                                    target_ulong *val)
+                                     target_ulong *val)
 {
     *val = env->vstimecmp;
 
@@ -971,7 +971,7 @@ static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
-                                    target_ulong *val)
+                                      target_ulong *val)
 {
     *val = env->vstimecmp >> 32;
 
@@ -979,7 +979,7 @@ static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+                                      target_ulong val)
 {
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -996,7 +996,7 @@ static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+                                       target_ulong val)
 {
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -1020,7 +1020,7 @@ static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
-                                    target_ulong *val)
+                                     target_ulong *val)
 {
     if (riscv_cpu_virt_enabled(env)) {
         *val = env->vstimecmp >> 32;
@@ -1032,7 +1032,7 @@ static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+                                     target_ulong val)
 {
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -1055,7 +1055,7 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+                                      target_ulong val)
 {
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -1342,7 +1342,8 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
 
     /* 'E' excludes all other extensions */
     if (val & RVE) {
-        /* when we support 'E' we can do "val = RVE;" however
+        /*
+         * when we support 'E' we can do "val = RVE;" however
          * for now we just drop writes if 'E' is present.
          */
         return RISCV_EXCP_NONE;
@@ -1361,7 +1362,8 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         val &= ~RVD;
     }
 
-    /* Suppress 'C' if next instruction is not aligned
+    /*
+     * Suppress 'C' if next instruction is not aligned
      * TODO: this should check next_pc
      */
     if ((val & RVC) && (GETPC() & ~3) != 0) {
@@ -1830,28 +1832,28 @@ static RISCVException write_mscratch(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_mepc(CPURISCVState *env, int csrno,
-                                     target_ulong *val)
+                                target_ulong *val)
 {
     *val = env->mepc;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_mepc(CPURISCVState *env, int csrno,
-                                     target_ulong val)
+                                 target_ulong val)
 {
     env->mepc = val;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_mcause(CPURISCVState *env, int csrno,
-                                     target_ulong *val)
+                                  target_ulong *val)
 {
     *val = env->mcause;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_mcause(CPURISCVState *env, int csrno,
-                                     target_ulong val)
+                                   target_ulong val)
 {
     env->mcause = val;
     return RISCV_EXCP_NONE;
@@ -1873,14 +1875,14 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
 
 /* Execution environment configuration setup */
 static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                   target_ulong *val)
 {
     *val = env->menvcfg;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                    target_ulong val)
 {
     uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
 
@@ -1893,14 +1895,14 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                    target_ulong *val)
 {
     *val = env->menvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                     target_ulong val)
 {
     uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
@@ -1911,7 +1913,7 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                   target_ulong *val)
 {
     RISCVException ret;
 
@@ -1925,7 +1927,7 @@ static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                    target_ulong val)
 {
     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
     RISCVException ret;
@@ -1940,7 +1942,7 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                   target_ulong *val)
 {
     RISCVException ret;
 
@@ -1954,7 +1956,7 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                    target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
     RISCVException ret;
@@ -1974,7 +1976,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                    target_ulong *val)
 {
     RISCVException ret;
 
@@ -1988,7 +1990,7 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                     target_ulong val)
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
@@ -2031,13 +2033,13 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_mstateen_1_3(CPURISCVState *env, int csrno,
-                                      target_ulong new_val)
+                                         target_ulong new_val)
 {
     return write_mstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
 }
 
 static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
-                                      target_ulong *val)
+                                     target_ulong *val)
 {
     *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
 
@@ -2058,7 +2060,7 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
-                                      target_ulong new_val)
+                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
@@ -2066,7 +2068,7 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_mstateenh_1_3(CPURISCVState *env, int csrno,
-                                      target_ulong new_val)
+                                          target_ulong new_val)
 {
     return write_mstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
 }
@@ -2103,7 +2105,7 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_hstateen_1_3(CPURISCVState *env, int csrno,
-                                      target_ulong new_val)
+                                         target_ulong new_val)
 {
     return write_hstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
 }
@@ -2142,7 +2144,7 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_hstateenh_1_3(CPURISCVState *env, int csrno,
-                                       target_ulong new_val)
+                                          target_ulong new_val)
 {
     return write_hstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
 }
@@ -3335,7 +3337,7 @@ static RISCVException read_mseccfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
-                         target_ulong val)
+                                    target_ulong val)
 {
     mseccfg_csr_write(env, val);
     return RISCV_EXCP_NONE;
-- 
2.25.1


