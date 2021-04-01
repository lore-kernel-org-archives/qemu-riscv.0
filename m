Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRz72-00072z-6w
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 11:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz6z-0006zx-4U; Thu, 01 Apr 2021 11:19:57 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:23965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz6x-0004jK-1X; Thu, 01 Apr 2021 11:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617290394; x=1648826394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dqwAJfuA1e/RYG4bU1etDZREYvBWEd7y8YmBWf0vHrM=;
 b=a9BG5EFtb5SeLSpz70l5xsV35nwm+7JGIqWOZTigMKyFsHFHTC3QwMZL
 xrygj9FG1MrKRU81CQeDEY9/w71AJ5Uml7cPz+VI/IG/Cm7LOMIL+3Y2U
 LIFqypYMHo+ETms/TbVMq9WYpN6V71+i7fgbOzDhmQk9T/yBxwn1PZ1Sk
 HJvABIQxShKFKny+1HyrrZP9UKd+765NLD/3E4YSTH3pCbuaAxaqpWZ5L
 mBt4N5yqtyv/QEsvbbPXyIE5bEMKzmx43BjjLHqWJXmjXp7ktpzJO6rTG
 9MtjJv787JGROlSdj85P1JwrWl1QybiTYUJ/cIezdx+9qqYTmGkl0B70o Q==;
IronPort-SDR: 0VdhvplYewhVYIVskOg80y0Ze61/F3DDcphblMoXgzCMG0ALh4o7xJWhZ5W/UqUOUH+i+oL09C
 7W09GYOnaBibOTh+SruvsSDeRi3zCDTbd7Tz/HlZpxuHvjxCke/1YjzAIXTKD7jhot2BLwzQO4
 ZIJGs2T8CJzM1Hvl1lxU1t8etQ9hKw+so8Ll7fWSgL5HrhaC1owo6cl+r6XIIeZdEzXlVcPITG
 l3woWzFMvvp8MZuch83KGB1izLgLSQur45a1ZpvGR2HXLrP59Utnavcrt+OPIbVA5bgE6k4NZl
 9Jw=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; d="scan'208";a="163455429"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2021 23:19:30 +0800
IronPort-SDR: Y8iy4SEk2pBx2k24kfovtrDt80z/RtTkDtjur8lW4DxU+OjYUgxTYe8ZQYrJTKlFis+wbABt1K
 d0mUaWfW9mZ7gCjb1D8X1/ajLbQJeI6NON98BTojrJu5QXUNJw9CH9fvVCUUbfZKSTOGILbKzC
 pFXkVlRzsAtNPtXxvASHYJepzkPvIQ+cZOFZ0gy7Wmkjn8gmvyaiZg3ynJuKshvZ0j9kU9ate3
 8sujqiqXSKGg+FDCksCCf7wCJScGVyVFCpk2GgMFrUTRY78UrdI9LlEqPTGKVZfLrtzGD6G/E8
 eghBGKstEsPezysg+nwRXgEZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 08:01:10 -0700
IronPort-SDR: VRFgSuaY0KF1+9VoJboOvT3CstsMtNDemuCkw4KvUm74Zp8fFkmhMaAvb/GA3SzHH7S9hgW3KU
 Db8y3zIJkSc8xd+QmWItHBz9Z3oGMAImJnOXBBpIx5c2Nhk5bdorT10mMVbingUBOdfsQhwdRB
 CdnO0jV/28nPlizF8yA6qO72dfzMEHBF9gS0vB0NBs0K+4kR6/22bhpx1aNmPO46CW6wthw5jG
 jYRH1JxxjlqCcdSTaGsX2JlZ7xo3z67BTlT3MDKksTDan0iekXfvBzwSKcgcyAOluZ97oMGuR+
 XFU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.75])
 by uls-op-cesaip01.wdc.com with ESMTP; 01 Apr 2021 08:19:28 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 2/5] target/riscv: Use the RISCVException enum for CSR
 predicates
Date: Thu,  1 Apr 2021 11:17:39 -0400
Message-Id: <187261fa671c3a77cf5aa482adb2a558c02a7cad.1617290165.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617290165.git.alistair.francis@wdc.com>
References: <cover.1617290165.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=718ae7c5e=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Apr 2021 15:19:57 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  3 +-
 target/riscv/csr.c | 80 +++++++++++++++++++++++++---------------------
 2 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..1291ddc381 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -473,7 +473,8 @@ static inline target_ulong riscv_csr_read(CPURISCVState *env, int csrno)
     return val;
 }
 
-typedef int (*riscv_csr_predicate_fn)(CPURISCVState *env, int csrno);
+typedef RISCVException (*riscv_csr_predicate_fn)(CPURISCVState *env,
+                                                 int csrno);
 typedef int (*riscv_csr_read_fn)(CPURISCVState *env, int csrno,
     target_ulong *ret_value);
 typedef int (*riscv_csr_write_fn)(CPURISCVState *env, int csrno,
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bf..5dc2aa9845 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -35,29 +35,29 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
-static int fs(CPURISCVState *env, int csrno)
+static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* loose check condition for fcsr in vector extension */
     if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
-        return 0;
+        return RISCV_EXCP_NONE;
     }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int vs(CPURISCVState *env, int csrno)
+static RISCVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
-        return 0;
+        return RISCV_EXCP_NONE;
     }
-    return -RISCV_EXCP_ILLEGAL_INST;
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int ctr(CPURISCVState *env, int csrno)
+static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
@@ -65,7 +65,7 @@ static int ctr(CPURISCVState *env, int csrno)
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
@@ -73,25 +73,25 @@ static int ctr(CPURISCVState *env, int csrno)
         case CSR_CYCLE:
             if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
                 get_field(env->mcounteren, HCOUNTEREN_CY)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_TIME:
             if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
                 get_field(env->mcounteren, HCOUNTEREN_TM)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_INSTRET:
             if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
                 get_field(env->mcounteren, HCOUNTEREN_IR)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
             if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
                 get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         }
@@ -100,93 +100,101 @@ static int ctr(CPURISCVState *env, int csrno)
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
                     get_field(env->mcounteren, HCOUNTEREN_CY)) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_TIMEH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
                     get_field(env->mcounteren, HCOUNTEREN_TM)) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_INSTRETH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
                     get_field(env->mcounteren, HCOUNTEREN_IR)) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
                 if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
                     get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
-                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             }
         }
     }
 #endif
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int ctr32(CPURISCVState *env, int csrno)
+static RISCVException ctr32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     return ctr(env, csrno);
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static int any(CPURISCVState *env, int csrno)
+static RISCVException any(CPURISCVState *env, int csrno)
 {
-    return 0;
+    return RISCV_EXCP_NONE;
 }
 
-static int any32(CPURISCVState *env, int csrno)
+static RISCVException any32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     return any(env, csrno);
 
 }
 
-static int smode(CPURISCVState *env, int csrno)
+static RISCVException smode(CPURISCVState *env, int csrno)
 {
-    return -!riscv_has_ext(env, RVS);
+    if (riscv_has_ext(env, RVS)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int hmode(CPURISCVState *env, int csrno)
+static RISCVException hmode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVS) &&
         riscv_has_ext(env, RVH)) {
         /* Hypervisor extension is supported */
         if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
             env->priv == PRV_M) {
-            return 0;
+            return RISCV_EXCP_NONE;
         } else {
-            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
 
-    return -RISCV_EXCP_ILLEGAL_INST;
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static int hmode32(CPURISCVState *env, int csrno)
+static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return 0;
+        return RISCV_EXCP_NONE;
     }
 
     return hmode(env, csrno);
 
 }
 
-static int pmp(CPURISCVState *env, int csrno)
+static RISCVException pmp(CPURISCVState *env, int csrno)
 {
-    return -!riscv_feature(env, RISCV_FEATURE_PMP);
+    if (riscv_feature(env, RISCV_FEATURE_PMP)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
 }
 #endif
 
@@ -1313,8 +1321,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
         return -RISCV_EXCP_ILLEGAL_INST;
     }
     ret = csr_ops[csrno].predicate(env, csrno);
-    if (ret < 0) {
-        return ret;
+    if (ret != RISCV_EXCP_NONE) {
+        return -ret;
     }
 
     /* execute combined read/write operation if it exists */
-- 
2.31.0


