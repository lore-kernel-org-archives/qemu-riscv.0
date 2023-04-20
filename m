Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppQU3-0000Sh-DY
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 05:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQU2-0000N0-Ie
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:42 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQU0-000777-Dw
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:42 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-38e12d973bfso440558b6e.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Apr 2023 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982499; x=1684574499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KV9S0BrAPflgbxJI53zCrQXG3eq2eAnzCX9tfPmbAE=;
 b=Mqsmw52ePrvgnUCgVBhwer57FUnh6MUzBNJglZ+YCjO4h+V8z4nCkitujw8CfJNpxQ
 u8z3tHUQbzHJPfXcv5eJ/n1b63PRsVRbjF8b1zf13KfvlU8/e7f/NVodnEWzNGVAF4An
 RqFQ4UXun6MRYA0EuhFGNEEyMPWH6VPnRyvhxL/uK4AztTuxBclVildxTv4rGyTkDdtL
 iF4uqHUK/W88Gcfsltg9UJ4SBGNYt5kvdIgLC5ZFNEic5FkrfVcWbY5GYP6rujtnvp72
 Gc/znBlO4awnkbm/VSymzgodnwwrdT6Cs5GDnx8vMaAbnd0VpbRiJBBRFe/7/sdhxk5o
 J1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982499; x=1684574499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KV9S0BrAPflgbxJI53zCrQXG3eq2eAnzCX9tfPmbAE=;
 b=XKtuRcg7XJvyzcQF05ELFnQoUDQOlJAloIEVS+fRMS6dj8nOqIKtKMUq9cByv7gG56
 dPRg2T++rgRhQRSyNRlekwoVPCYJ4XhOwDW88J9d4mtKjYfFExcSCCch2+SnG79GCCyA
 r5B/QdSUNMYjbVGtGncjdFOAS+f864CA8eRwy1ZE3e2fduCQy6UrDzPjMUhKZW77AG+6
 1PwNNB7Jy40j/U3+3E04aLV9rdU97DnQhOQukSGUXbvBO15sakMwRQCwGaLpam+IJi68
 ByyQF2q8WduLg1sjijcKkKPSGEjKYm4rw3dr13E5/fG4oLi+aVDEP9OlUOQjZtJaf1Ip
 w09w==
X-Gm-Message-State: AAQBX9eBNONOBo7g5ZHKI/9WUtZarHxlSpb03ruJmOnsIYxrsbvvoU+A
 jYv5hdZG92Qu41oIauI8v9JOGA==
X-Google-Smtp-Source: AKy350YZbV4DcS9Gqjlvh+A7peeUHMC0x840b4JY5pIjirseV7SvyemsGrC4NkeG/OmDfEgc9+WyrA==
X-Received: by 2002:a05:6808:30a2:b0:38e:67d7:9d0e with SMTP id
 bl34-20020a05680830a200b0038e67d79d0emr534004oib.31.1681982499281; 
 Thu, 20 Apr 2023 02:21:39 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 11/12] target/riscv: rework write_misa()
Date: Thu, 20 Apr 2023 06:20:59 -0300
Message-Id: <20230420092100.177464-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Apr 2023 09:21:42 -0000

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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c |  4 ++--
 target/riscv/cpu.h |  1 +
 target/riscv/csr.c | 47 ++++++++++++++++++++--------------------------
 3 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d407321aa..4fa720a39d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -944,7 +944,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
  */
-static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
+void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
@@ -960,7 +960,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_ifencei = true;
 
         env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
-        env->misa_ext_mask = env->misa_ext;
+        env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
     }
 
     if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 15423585d0..1f39edc687 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -548,6 +548,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
+void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 865ee9efda..d449da2657 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1387,39 +1387,18 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
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
@@ -1428,18 +1407,32 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
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
2.40.0


