Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJDe3-0006nV-0A
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 08:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oJDdv-0006iw-EE; Wed, 03 Aug 2022 08:38:32 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:48230 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oJDdj-0003QM-GW; Wed, 03 Aug 2022 08:38:31 -0400
Received: from localhost.localdomain (unknown [116.224.155.20])
 by APP-05 (Coremail) with SMTP id zQCowADnCH4xbOpi_EQbFg--.51468S2;
 Wed, 03 Aug 2022 20:38:10 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH] target/riscv: Fix priority of csr related check in
 riscv_csrrw_check
Date: Wed,  3 Aug 2022 20:36:52 +0800
Message-Id: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowADnCH4xbOpi_EQbFg--.51468S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy8Wr47Zw15ArWxGF18Grg_yoW5Jw1rpw
 43K3y3G3yvgasrAw43tFn0qF13X34rGay7Jw12k3yrCr13C34YyFn8Wrn29F93X39YkwsI
 yF4DAFyfuF4UAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 Aug 2022 12:38:35 -0000

Normally, riscv_csrrw_check is called when executing Zicsr instructions.
And we can only do access control for existed CSRs. So the priority of
CSR related check, from highest to lowest, should be as follows:
1) check whether Zicsr is supported: raise RISCV_EXCP_ILLEGAL_INST if not
2) check whether csr is existed: raise RISCV_EXCP_ILLEGAL_INST if not
3) do access control: raise RISCV_EXCP_ILLEGAL_INST or RISCV_EXCP_VIRT_
INSTRUCTION_FAULT if not allowed

The predicates contain parts of function of both 2) and 3), So they need
to be placed in the middle of riscv_csrrw_check

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/csr.c | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0fb042b2fd..d81f466c80 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3270,6 +3270,30 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     int read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
+
+    /* ensure the CSR extension is enabled. */
+    if (!cpu->cfg.ext_icsr) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (env->priv_ver < csr_min_priv) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* check predicate */
+    if (!csr_ops[csrno].predicate) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (write_mask && read_only) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    RISCVException ret = csr_ops[csrno].predicate(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
 #if !defined(CONFIG_USER_ONLY)
     int csr_priv, effective_priv = env->priv;
 
@@ -3290,25 +3314,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-    if (write_mask && read_only) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    /* ensure the CSR extension is enabled. */
-    if (!cpu->cfg.ext_icsr) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    /* check predicate */
-    if (!csr_ops[csrno].predicate) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    if (env->priv_ver < csr_min_priv) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    return csr_ops[csrno].predicate(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
-- 
2.17.1


