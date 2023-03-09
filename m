Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paATF-0004vh-RC
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 02:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paATE-0004uc-5i; Thu, 09 Mar 2023 02:13:48 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1paATB-0005sT-Gc; Thu, 09 Mar 2023 02:13:47 -0500
Received: from localhost.localdomain (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowABHNxQdhwlk2VFnAA--.11047S4;
 Thu, 09 Mar 2023 15:13:36 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 2/4] target/riscv: Simplify getting RISCVCPU pointer from env
Date: Thu,  9 Mar 2023 15:13:27 +0800
Message-Id: <20230309071329.45932-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHNxQdhwlk2VFnAA--.11047S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF45AFWUKFyfCrW8Crg_yoW8WryUpr
 W8CFZ3XrW0qwnFg345tr1UAF4kJw45Kws0kw1DA3yYvFsxJFs5ZF1DGw1SyFsxCa48u34U
 t3y5ur13ZF4I9FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
 kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
 kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
 6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
 CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8BMNUUUU
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

Use env_archcpu() to get RISCVCPU pointer from env directly.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index b8e56d2b7b..a200741083 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -223,7 +223,7 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
         return true;
     }
 
-    cpu = RISCV_CPU(env_cpu(env));
+    cpu = env_archcpu(env);
     if (!cpu->pmu_event_ctr_map) {
         return false;
     }
@@ -249,7 +249,7 @@ bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
         return true;
     }
 
-    cpu = RISCV_CPU(env_cpu(env));
+    cpu = env_archcpu(env);
     if (!cpu->pmu_event_ctr_map) {
         return false;
     }
@@ -289,7 +289,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx)
 {
     uint32_t event_idx;
-    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->pmu_event_ctr_map) {
         return -1;
@@ -390,7 +390,7 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
 {
     uint64_t overflow_delta, overflow_at;
     int64_t overflow_ns, overflow_left = 0;
-    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+    RISCVCPU *cpu = env_archcpu(env);
     PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
 
     if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscofpmf) {
-- 
2.25.1


