Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWyuD-0006Fc-Bx
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 07:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWyuC-0006Ct-6B; Tue, 28 Feb 2023 07:16:28 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWyuA-0006vB-1k; Tue, 28 Feb 2023 07:16:27 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp78t1677581429tzmg1wgm
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:50:26 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 09/18] target/riscv: Simplify getting RISCVCPU pointer from
 env
Date: Tue, 28 Feb 2023 18:40:25 +0800
Message-Id: <20230228104035.1879882-10-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-1-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 28 Feb 2023 12:16:28 -0000

Use env_archcpu() to get RISCVCPU pointer from env directly.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

(no changes since v1)

 target/riscv/csr.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a3e0e5755c..8e827362cc 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -46,8 +46,7 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
                                        uint64_t bit)
 {
     bool virt = riscv_cpu_virt_enabled(env);
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
         return RISCV_EXCP_NONE;
@@ -90,8 +89,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (env->misa_ext & RVV ||
         cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
@@ -108,8 +106,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
     int ctr_index;
     target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
@@ -166,8 +163,7 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
     int ctr_index;
     int base_csrno = CSR_MHPMCOUNTER3;
 
@@ -195,8 +191,7 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
 
 static RISCVException sscofpmf(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!cpu->cfg.ext_sscofpmf) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -321,8 +316,7 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
 
 static RISCVException mstateen(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!cpu->cfg.ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -333,8 +327,7 @@ static RISCVException mstateen(CPURISCVState *env, int csrno)
 
 static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!cpu->cfg.ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -363,8 +356,7 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
 {
     bool virt = riscv_cpu_virt_enabled(env);
     int index = csrno - CSR_SSTATEEN0;
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!cpu->cfg.ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -918,8 +910,7 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 
 static RISCVException sstc(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
     bool hmode_check = false;
 
     if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
@@ -1152,8 +1143,7 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
 static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     *val = cpu->cfg.mvendorid;
     return RISCV_EXCP_NONE;
@@ -1162,8 +1152,7 @@ static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
 static RISCVException read_marchid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     *val = cpu->cfg.marchid;
     return RISCV_EXCP_NONE;
@@ -1172,8 +1161,7 @@ static RISCVException read_marchid(CPURISCVState *env, int csrno,
 static RISCVException read_mimpid(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     *val = cpu->cfg.mimpid;
     return RISCV_EXCP_NONE;
-- 
2.25.1


