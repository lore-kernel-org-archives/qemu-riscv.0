Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paATH-0004xI-HP
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 02:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paATF-0004vR-JM; Thu, 09 Mar 2023 02:13:49 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paATC-0005sU-Bf; Thu, 09 Mar 2023 02:13:49 -0500
Received: from localhost.localdomain (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowABHNxQdhwlk2VFnAA--.11047S6;
 Thu, 09 Mar 2023 15:13:37 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 4/4] target/riscv: Simplify arguments for riscv_csrrw_check
Date: Thu,  9 Mar 2023 15:13:29 +0800
Message-Id: <20230309071329.45932-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHNxQdhwlk2VFnAA--.11047S6
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF48Gw15CF13XFWrXwb_yoW8Aw1rpr
 W5u39xW393tF929asIyF1DtF1rJ3yUK3yfJw1xWa15Jw1fJFW5Jr1DG3ZxtFyDWF95Ar4j
 vFs0yr1Iyr4UAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTY
 UUUUU
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
X-List-Received-Date: Thu, 09 Mar 2023 07:13:49 -0000

Remove RISCVCPU argument, and get cfg infomation from CPURISCVState
directly.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/csr.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 53143f4d9a..80fc15e4d6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3755,15 +3755,14 @@ static RISCVException rmw_seed(CPURISCVState *env, int csrno,
 
 static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
                                                int csrno,
-                                               bool write_mask,
-                                               RISCVCPU *cpu)
+                                               bool write_mask)
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     bool read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
 
     /* ensure the CSR extension is enabled */
-    if (!cpu->cfg.ext_icsr) {
+    if (!riscv_cpu_cfg(env)->ext_icsr) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -3859,9 +3858,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask, cpu);
+    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
@@ -3914,9 +3911,8 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
                                 Int128 new_value, Int128 write_mask)
 {
     RISCVException ret;
-    RISCVCPU *cpu = env_archcpu(env);
 
-    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
+    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask));
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
-- 
2.25.1


