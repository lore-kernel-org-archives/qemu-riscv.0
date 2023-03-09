Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paATH-0004xx-Tj
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 02:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paATE-0004um-FX; Thu, 09 Mar 2023 02:13:48 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paATB-0005s6-GF; Thu, 09 Mar 2023 02:13:48 -0500
Received: from localhost.localdomain (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowABHNxQdhwlk2VFnAA--.11047S3;
 Thu, 09 Mar 2023 15:13:35 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 1/4] target/riscv: Avoid env_archcpu() when reading
 RISCVCPUConfig
Date: Thu,  9 Mar 2023 15:13:26 +0800
Message-Id: <20230309071329.45932-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHNxQdhwlk2VFnAA--.11047S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1fXF1rZF4xAw4rXFyUtrb_yoWxZry7pr
 4UuFZxGFW7ta4qva93Gr1DXF1rJ34xK3yYkws7Wa95tF45JrW5GF1DGaya9F4DWa48Z34j
 yayUCr1jyr4jvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
 kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
 kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
 6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
 CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5SoXUUUU
 U
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Mar 2023 07:13:48 -0000

Use riscv_cpu_cfg(env) instead of env_archcpu().cfg.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_helper.c |  9 ++++-----
 target/riscv/csr.c        | 40 ++++++++++++---------------------------
 target/riscv/gdbstub.c    |  4 ++--
 3 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..e677255f87 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -314,7 +314,6 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
                                     int extirq, unsigned int extirq_def_prio,
                                     uint64_t pending, uint8_t *iprio)
 {
-    RISCVCPU *cpu = env_archcpu(env);
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
 
@@ -323,7 +322,8 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
     }
 
     irq = ctz64(pending);
-    if (!((extirq == IRQ_M_EXT) ? cpu->cfg.ext_smaia : cpu->cfg.ext_ssaia)) {
+    if (!((extirq == IRQ_M_EXT) ? riscv_cpu_cfg(env)->ext_smaia :
+                                  riscv_cpu_cfg(env)->ext_ssaia)) {
         return irq;
     }
 
@@ -765,7 +765,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
     bool use_background = false;
     hwaddr ppn;
-    RISCVCPU *cpu = env_archcpu(env);
     int napot_bits = 0;
     target_ulong napot_mask;
 
@@ -946,7 +945,7 @@ restart:
 
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
-        } else if (pbmte || cpu->cfg.ext_svnapot) {
+        } else if (pbmte || riscv_cpu_cfg(env)->ext_svnapot) {
             ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         } else {
             ppn = pte >> PTE_PPN_SHIFT;
@@ -1043,7 +1042,7 @@ restart:
                benefit. */
             target_ulong vpn = addr >> PGSHIFT;
 
-            if (cpu->cfg.ext_svnapot && (pte & PTE_N)) {
+            if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
                 napot_bits = ctzl(ppn) + 1;
                 if ((i != (levels - 1)) || (napot_bits != 4)) {
                     return TRANSLATE_FAIL;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab566639e5..b453d8e8ca 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -88,9 +88,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (cpu->cfg.ext_zve32f) {
+    if (riscv_cpu_cfg(env)->ext_zve32f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
@@ -193,9 +191,7 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
 
 static RISCVException sscofpmf(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_sscofpmf) {
+    if (!riscv_cpu_cfg(env)->ext_sscofpmf) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -310,9 +306,7 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
 
 static RISCVException mstateen(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_smstateen) {
+    if (!riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -321,9 +315,7 @@ static RISCVException mstateen(CPURISCVState *env, int csrno)
 
 static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_smstateen) {
+    if (!riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -390,10 +382,9 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
 
 static RISCVException sstc(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
     bool hmode_check = false;
 
-    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
+    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -1170,27 +1161,21 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
 static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    *val = cpu->cfg.mvendorid;
+    *val = riscv_cpu_cfg(env)->mvendorid;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_marchid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    *val = cpu->cfg.marchid;
+    *val = riscv_cpu_cfg(env)->marchid;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_mimpid(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    *val = cpu->cfg.mimpid;
+    *val = riscv_cpu_cfg(env)->mimpid;
     return RISCV_EXCP_NONE;
 }
 
@@ -1232,9 +1217,8 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static bool validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
-
-    return (vm & 0xf) <= satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+    return (vm & 0xf) <=
+           satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
 }
 
 static RISCVException write_mstatus(CPURISCVState *env, int csrno,
@@ -1897,7 +1881,7 @@ static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
 static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
@@ -1920,7 +1904,7 @@ static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
                                      target_ulong val)
 {
-    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
                     (cfg->ext_sstc ? MENVCFG_STCE : 0) |
                     (cfg->ext_svadu ? MENVCFG_HADE : 0);
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 6048541606..b2e08f1979 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -129,7 +129,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 
 static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
 {
-    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
     if (n < 32) {
         int i;
         int cnt = 0;
@@ -145,7 +145,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
 
 static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
-    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
     if (n < 32) {
         int i;
         for (i = 0; i < vlenb; i += 8) {
-- 
2.25.1


