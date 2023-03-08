Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0Gx-0008Qz-JB
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gv-0008Nq-LQ
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:20:25 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gt-0002TF-SX
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:20:25 -0500
Received: by mail-oi1-x236.google.com with SMTP id bh20so13111567oib.9
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EimxToi/BazSalyp/y380Q6hQb77b660ehnq+DK3D7I=;
 b=k4V3Sf5/+dq3Dq3abaWsRUkMKiO32iqs55XXcZtAs8Ny5P1UuP0YOvo4/mlWthfm+E
 2GeYol8V79yt3N87GHLxC1KuubCtYE6TMsGTryeT1EUxWsIePhD0KdumlHuJYMD6ur/8
 SEAtLOhqRJmOTuaDLh/ygTV+qFVcwScCEQlI2rVG6tffQHVPc5oe+aEhVsRmIhJHdLJL
 TnYVtfEd3DIr/7vCYNprGd5WHmHMlPwQsXzZTIHFRnywj9EwujBBhd3hvmoJ3bwwNWW9
 vH3XNAb96U1IO6ITo/LR9ruvc+VsFl9LhtlzpJI4O8juhjLUyJ2h0s3Umrsv3SbISkPc
 WdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EimxToi/BazSalyp/y380Q6hQb77b660ehnq+DK3D7I=;
 b=eKq6Na1hqhS/qD0Vh0lt55UwzMrPcu6VXsIoXx4X72mw/7tN49IMvxm5dMCm35/YaO
 aUV3/ngLrhZL9z0SHpkBLsnI2h2+DPAgnH1QOivqym0DqAUFBD1t451fRIW/hrsBZG7G
 hR83tQKlhsnXXwKaHCeNvDuji2ccxto1imNk+AUq3DlOf49RBou+d05Jc1LCgddKSMql
 dc1vJVsUVBIPojaZ0E4S5S0YMihGRumMM9HF7gfpCpNsgJLxr2vj2yUfP1kunVimmKzg
 MffrN6uANRO/K7n0m0CGU0bSFbgED2xqQ9NpIwZ7X57RXeWXbjCYqW4hvwFeXIPQphdn
 x4yw==
X-Gm-Message-State: AO0yUKXDhW0NwKL8wKeyC0tcuJnxE0xK2LInBp13Hidpz3XwNMfpoJDp
 UI2tQi9BrttAYotdcekkVicw0g==
X-Google-Smtp-Source: AK7set+sAzdLqPgAeeI7F5klEJ8lnp6NPg9uTtGWsr0Kvl4Cw02OE+eAiCrVDapvfNW9SJ3WLARRnQ==
X-Received: by 2002:a05:6808:902:b0:378:a144:f7ad with SMTP id
 w2-20020a056808090200b00378a144f7admr9466837oih.17.1678306823184; 
 Wed, 08 Mar 2023 12:20:23 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:20:22 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 17/17] target/riscv: rework write_misa()
Date: Wed,  8 Mar 2023 17:19:25 -0300
Message-Id: <20230308201925.258223-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 20:20:25 -0000

write_misa() must use as much common logic as possible, only specifying
the bits that are exclusive to the CSR write operation and TCG
internals.

Rewrite write_misa() to work as follows:

- supress RVC right after verifying that we're not updating RVG;

- mask the write using misa_ext_mask to avoid enabling unsupported
  extensions;

- emulate the steps done by the cpu init() functions: set cpu->cfg using
  the desired misa value, validate it, and then commit;

- fallback if the validation step fails. We'll need to re-write cpu->cfg
  with the original misa_ext value for the hart.

Let's keep write_misa() as experimental for now until this logic gains
enough mileage.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c |  7 +++---
 target/riscv/cpu.h |  2 ++
 target/riscv/csr.c | 53 +++++++++++++++++++++-------------------------
 3 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7be6a86305..4b2be32de3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -281,8 +281,7 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
     return ext;
 }
 
-static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
-                                       uint32_t misa_ext)
+static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg, uint32_t misa_ext)
 {
     cfg->ext_i = misa_ext & RVI;
     cfg->ext_e = misa_ext & RVE;
@@ -299,7 +298,7 @@ static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
     cfg->ext_g = misa_ext & RVG;
 }
 
-static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
+void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
 {
     env->misa_mxl_max = env->misa_mxl = mxl;
     env->misa_ext_mask = env->misa_ext = ext;
@@ -995,7 +994,7 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly, doing a set_misa() in the end.
  */
-static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
+void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPUClass *cc = CPU_CLASS(mcc);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 013a1389d6..d64d0f8dd6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -591,6 +591,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
+void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
+void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 02a5c2a5ca..2e75c75fcc 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1342,6 +1342,11 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+    uint32_t hart_ext_mask = env->misa_ext_mask;
+    uint32_t hart_ext = env->misa_ext;
+    Error *local_err = NULL;
+
     if (!riscv_cpu_cfg(env)->misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
@@ -1352,34 +1357,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
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
-    /* Mask extensions that are not supported by this hart */
-    val &= env->misa_ext_mask;
-
-    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
-    if ((val & RVD) && !(val & RVF)) {
-        val &= ~RVD;
-    }
-
     /*
      * Suppress 'C' if next instruction is not aligned
      * TODO: this should check next_pc
@@ -1388,18 +1365,36 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         val &= ~RVC;
     }
 
+    /* Mask extensions that are not supported by this hart */
+    val &= hart_ext_mask;
+
     /* If nothing changed, do nothing. */
     if (val == env->misa_ext) {
         return RISCV_EXCP_NONE;
     }
 
+    /*
+     * Validate the new configuration. Rollback to previous
+     * values if something goes wrong.
+     */
+    set_misa(env, env->misa_mxl, val);
+    riscv_cpu_validate_set_extensions(cpu, &local_err);
+    if (local_err) {
+        set_misa(env, env->misa_mxl, hart_ext);
+        return RISCV_EXCP_NONE;
+    }
+
+    /*
+     * Keep the original misa_ext_mask from the hart.
+     */
+    env->misa_ext_mask = hart_ext_mask;
+
     if (!(val & RVF)) {
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


