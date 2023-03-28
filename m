Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phDFL-00004y-3U
	for mharc-qemu-riscv@gnu.org; Tue, 28 Mar 2023 13:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDF9-0008RX-TJ
 for qemu-riscv@nongnu.org; Tue, 28 Mar 2023 13:36:24 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDF7-0005K6-Tg
 for qemu-riscv@nongnu.org; Tue, 28 Mar 2023 13:36:23 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17ebba88c60so13519758fac.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Mar 2023 10:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680024981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IB6MPIytqxPwEACYywxPrY0MXu0k/dW8FvoTWQSwXRo=;
 b=LN6ogcDA0OGCey2tSwbevc0KhoNJzDKPSmpXSSlJ+6C0yP76yxX2La7Ky+cgqWDM7m
 Y2uqcmJE50r2M2oidJjzDW/a2s5mUa5UguEI1NtumJQb6XmhBiR8TLC+KXThlLFTNxJ2
 OxxCSRI/NG7eE11C6qIPWrKZ6IhR7fky8V4VAzPk1gyg0OceJZl20m5783lzc5HiJK4l
 zdjzY38T19i0iuTRHPKvL+AgoYCwyL5449oz9zTT9fn5EIA3wKyrE8SXQ4kYN2AxCPkv
 AC2XfMK60UApB9sa8gJpt9FuxMo8mTSgkFv63Mn/BgFJ4LvG7jnAVnnAOaIEZbUwXWcB
 uHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IB6MPIytqxPwEACYywxPrY0MXu0k/dW8FvoTWQSwXRo=;
 b=BdUIUe9KL3//sBtUfY1zYoWcpYaTV1zXu/TKbfybwhSjAQKdRpIFiYugpZwSYh2Mvr
 pTsk82fIFT6UE9Hr3PbrF/IwRBPeTkwbj9cCTKD0kIqRfdh8OGkQNxkkzNmS1+V7/Wo1
 QJ6vE5Z91Ae9uD+6TN/Z2G0dH1KYc8hFh7NUyi+LvaiSH8w9tUhPiF7Jz0KCY9fWE8QL
 eKIi9S55zCLxoNw+1/1wHv4kYTj7WkT3Mk533Hq/xzFSA9Qiyw8Aff9QnHHFn4LlJ1PD
 uq6KpW4UTrRio7LwB1urbJgUVSSfSyWPTIwrpdWvTS06tCdhTJDZMFVNpghEtWLsrZCR
 uSAQ==
X-Gm-Message-State: AO0yUKU1PhCJQ4jnQOHuWNHn84fi5cY9QUk0c7blBoyI7rOe1/t1I1lC
 VG6Isr3oYjWs1DQMrVQaeHIbkw==
X-Google-Smtp-Source: AKy350bE8dGRR3oWBJX+l2ZOI+L2mfS7JoCduWB9Sk8ElnJvUoA9B07U7WrdOmLZtULozPFJstMraQ==
X-Received: by 2002:a05:6870:3911:b0:17a:da6b:ad91 with SMTP id
 b17-20020a056870391100b0017ada6bad91mr10193787oap.2.1680024979772; 
 Tue, 28 Mar 2023 10:36:19 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m2-20020a9d6442000000b0069f0a85fa36sm11635654otl.57.2023.03.28.10.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:36:19 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 9/9] target/riscv: rework write_misa()
Date: Tue, 28 Mar 2023 14:35:43 -0300
Message-Id: <20230328173543.431342-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328173543.431342-1-dbarboza@ventanamicro.com>
References: <20230328173543.431342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Tue, 28 Mar 2023 17:36:24 -0000

write_misa() must use as much common logic as possible. We want to open
code just the bits that are exclusive to the CSR write operation and TCG
internals.

Our validation is done with riscv_cpu_validate_set_extensions(), but we
need a small tweak first. When enabling RVG we're doing:

        env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
        env->misa_ext_mask = env->misa_ext;

This works fine for realize() time but this can potentially overwrite
env->misa_ext_mask if we reutilize the function for write_misa().
Instead of doing misa_ext_mask = misa_ext, sum up the RVG extensions in
misa_ext_mask as well. This won't change realize() time behavior
(misa_ext_mask is still == misa_ext)  and will ensure that write_misa()
won't change misa_ext_mask by accident.

After that, rewrite write_misa() to work as follows:

- mask the write using misa_ext_mask to avoid enabling unsupported
  extensions;

- suppress RVC if the next insn isn't aligned;

- disable RVG if any of RVG dependencies are being disabled by the user;

- assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
  error, rollback to the previous values of misa_ext and misa_ext_mask;

- on success, check if there's a chance that misa_ext_mask was
  overwritten during the process and restore it;

- handle RVF and MSTATUS_FS and continue as usual.

Let's keep write_misa() as experimental for now until this logic gains
enough mileage.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c |  4 ++--
 target/riscv/cpu.h |  1 +
 target/riscv/csr.c | 47 ++++++++++++++++++++--------------------------
 3 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cd924029d4..d722674791 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -939,7 +939,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
  */
-static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
+void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
@@ -955,7 +955,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_ifencei = true;
 
         env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
-        env->misa_ext_mask = env->misa_ext;
+        env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
     }
 
     if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 03b5cc2cf4..13f6566962 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -575,6 +575,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
+void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..37fd619b17 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1343,39 +1343,18 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+    uint32_t orig_misa_ext = env->misa_ext;
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
@@ -1384,18 +1363,32 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         val &= ~RVC;
     }
 
+    /* Disable RVG if any of its dependencies are disabled */
+    if (!(val & RVI && val & RVM && val & RVA &&
+          val & RVF && val & RVD)) {
+        val &= ~RVG;
+    }
+
     /* If nothing changed, do nothing. */
     if (val == env->misa_ext) {
         return RISCV_EXCP_NONE;
     }
 
-    if (!(val & RVF)) {
+    env->misa_ext = val;
+    riscv_cpu_validate_set_extensions(cpu, &local_err);
+    if (local_err != NULL) {
+        /* Rollback on validation error */
+        env->misa_ext = orig_misa_ext;
+
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(env->misa_ext & RVF)) {
         env->mstatus &= ~MSTATUS_FS;
     }
 
     /* flush translation cache */
     tb_flush(env_cpu(env));
-    env->misa_ext = val;
     env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
-- 
2.39.2


