Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcoK-0005il-2E
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoI-0005hz-Vn
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:51 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoG-0007F3-VZ
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:50 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 103-20020a9d0870000000b0069f000acf40so2305195oty.1
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aDWF4TV4NNOMbib10TqpzKDvUtAnKVMCB7lDRnKm84M=;
 b=ba0mWAsBCDDr3qswfOgrbu3o5qGCD9jNSj+Lys8VaRURzu+8qpmOx6uNuItdxhIcJ6
 JEgHgI75ogqAWJX/5YnWouFD1f2MQxsKQwZx1kyrsUwOEiw1Ewf/fVm0hx+24IyX5Yi8
 9yzVsIvcTwC8KO2yBBjOAZRhfRaFgyxsjA9DN53LiW/bhiv8RUgqJTPmQsm+VCRbr0mr
 NoECNYC8Ny9FMuoMlzowPTW4dtzEp1OfqkxsBXSH037sKySjsSm8g6dcB3FyjjH2dsIn
 YnWEcbuN8UTJOVjWKRBWTh1ytf2aQSXqtybdo/zFjw5Aal8cFGH7mQp0P91MmAmD+Y6M
 PExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aDWF4TV4NNOMbib10TqpzKDvUtAnKVMCB7lDRnKm84M=;
 b=wTh2bA40kbaY4O92qlKuvIhzHZNlsSvMcy6/ZN/idSyLbcAlT/0T73LHVA78WdImxH
 RrBaBrEaSwc0KfYAtJJ4yyedyAa8HyqT+VpfMFLxvmOox0mSTAnfdllE3xnGVHDuuueg
 W9eWHMy/k3K0jOAXv1yezB6eFUS0odzGoJpmHkaZ3l48NRh9NeQDkDX63aB3tLx9g31Z
 B+uFwEVJDhxnXtZSIPnjnzmWK+V60h52RuTucYTq1tEO64t/lStTNsakM2QKHgFwB3Fv
 uJMjuBltqHGi2r0NhsRVOREDIxkJyyFce9Qw88oubDxKBrQjvuMGNlFRBOebd5gCK/vN
 CHRA==
X-Gm-Message-State: AO0yUKWtR+lNuo0hct4GLQGgabDNa7z9es3UO68eRW+ARCvIjN8B+eBe
 Sm+Nr89RqB5J7CcA8SyTxKoQJw==
X-Google-Smtp-Source: AK7set8ua1saI1cjj7bkld324nU6Zr13mi8gHF/KDUGkEj/fz7lB+dqvRn8obST8WX1EIaGQhoybzg==
X-Received: by 2002:a9d:7f8d:0:b0:693:d8a3:1816 with SMTP id
 t13-20020a9d7f8d000000b00693d8a31816mr1446185otp.16.1679169947766; 
 Sat, 18 Mar 2023 13:05:47 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 23/26] target/riscv: rework write_misa()
Date: Sat, 18 Mar 2023 17:04:33 -0300
Message-Id: <20230318200436.299464-24-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:51 -0000

write_misa() must use as much common logic as possible. We want to open
code just the bits that are exclusive to the CSR write operation and TCG
internals.

Rewrite write_misa() to work as follows:

- mask the write using misa_ext_mask to avoid enabling unsupported
  extensions;

- suppress RVC if the next insn isn't aligned;

- handle RVE. This is done by filtering all bits but RVE from 'val'.
  Setting RVE will forcefully set only RVE - assuming it gets
  validated afterwards;

- emulate the steps done by realize(): validate the candidate misa_ext
  val, then validate the configuration with the candidate misa_ext val,
  and finally commit the changes to cpu->cfg.

If any of the validation steps fails, the write operation is a no-op.

Let's keep write_misa() as experimental for now until this logic gains
enough mileage.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 12 ++++------
 target/riscv/cpu.h |  6 +++++
 target/riscv/csr.c | 59 ++++++++++++++++++++++++++--------------------
 3 files changed, 45 insertions(+), 32 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e9172ec310..67a46504bb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1027,9 +1027,8 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 }
 
 
-static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
-                                        uint32_t misa_ext,
-                                        Error **errp)
+void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
+                                 Error **errp)
 {
     Error *local_err = NULL;
 
@@ -1122,9 +1121,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
  * candidate misa_ext value. No changes in env->misa_ext
  * are made.
  */
-static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
-                                          uint32_t misa_ext,
-                                          Error **errp)
+void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
+                                   Error **errp)
 {
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
@@ -1215,7 +1213,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
     }
 }
 
-static void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
 {
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index dbb4df9df0..ca2ba6a647 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -593,6 +593,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
+void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
+                                 Error **errp);
+void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
+                                   Error **errp);
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
+
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..8d5e8f9ad1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1343,39 +1343,17 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+    Error *local_err = NULL;
+
     if (!riscv_cpu_cfg(env)->misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
     }
 
-    /* 'I' or 'E' must be present */
-    if (!(val & (RVI | RVE))) {
-        /* It is not, drop write to misa */
-        return RISCV_EXCP_NONE;
-    }
-
-    /* 'E' excludes all other extensions */
-    if (val & RVE) {
-        /*
-         * when we support 'E' we can do "val = RVE;" however
-         * for now we just drop writes if 'E' is present.
-         */
-        return RISCV_EXCP_NONE;
-    }
-
-    /*
-     * misa.MXL writes are not supported by QEMU.
-     * Drop writes to those bits.
-     */
-
     /* Mask extensions that are not supported by this hart */
     val &= env->misa_ext_mask;
 
-    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
-    if ((val & RVD) && !(val & RVF)) {
-        val &= ~RVD;
-    }
-
     /*
      * Suppress 'C' if next instruction is not aligned
      * TODO: this should check next_pc
@@ -1389,6 +1367,37 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+    /*
+     * We'll handle special cases in separate. If one
+     * of these bits are enabled we'll handle them and
+     * end the CSR write.
+     */
+    if (val & RVE && !(env->misa_ext & RVE)) {
+        /*
+         * RVE must be enabled by itself. Clear all other
+         * misa_env bits and let the validation do its
+         * job.
+         */
+        val &= RVE;
+    }
+
+    /*
+     * This flow is similar to what riscv_cpu_realize() does,
+     * with the difference that we will update env->misa_ext
+     * value if everything is ok.
+     */
+    riscv_cpu_validate_misa_ext(env, val, &local_err);
+    if (local_err != NULL) {
+        return RISCV_EXCP_NONE;
+    }
+
+    riscv_cpu_validate_extensions(cpu, val, &local_err);
+    if (local_err != NULL) {
+        return RISCV_EXCP_NONE;
+    }
+
+    riscv_cpu_commit_cpu_cfg(cpu);
+
     if (!(val & RVF)) {
         env->mstatus &= ~MSTATUS_FS;
     }
-- 
2.39.2


