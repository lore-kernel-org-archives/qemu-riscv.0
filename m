Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf6ui-0006gf-8Z
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6uh-0006gV-4F
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:26:35 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6tP-0006XA-HZ
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:26:33 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-17683b570b8so20844418fac.13
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWIoScj5d/AB/UflSRxN6pqPw6JdXgdwjDu9WZeLHZc=;
 b=faiyZPIFW362ymnW4FkWousXmeNLgI2/ozGPoo6kcjSC9BdVZrP3eUSWoq3hKio8Qy
 KxJ/W8xOSyI7TWBQxYtn9Fx3EkV1blnIdnQ5xC4GWo780uMNFyE7S8+/Lv5cYM9M5ds5
 T6lV2E0UlRWPFlA/TGmuk2MMI04E9zAlMquHrICcwJNlUWOkFUCSgnUom7sxdNCDlkYu
 tBQOnCxDYK5uaK/pJS4dcvGdl9avd/G0LKFtRiXEhQ2DTojUYdas9pkfa3dr37PfbvWd
 rfdP/8ePhZxz1OWFUb9qxNnNqHPf+EOu7JnW/YuH3HtwFZAQEQNsTg3WtXjYVb3rXSS5
 zq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWIoScj5d/AB/UflSRxN6pqPw6JdXgdwjDu9WZeLHZc=;
 b=RFOzM6kC2VBS6EbCZ/y1hw8XpvoopEqTRkDU8taGe9AGyjXYcMIasEn/xSBicvWLUU
 7NwEBCUF15IZbjsZTV951DnocPjPBZCi83qJuK/cc5yxlz1DgPKG+OZo61Cj36yPHxvu
 d6lsCaCcWuaVnN+nir7riRXc5+D0nhpMhwFbOTs87eZvPF5QUHXbmG47AAWB3X7SWzfC
 cG/qEBOm2LUJKdjBQ8eJbKNXgFJ6ZguZXbv85TneNh+T5bQOO2MQRoSZmIj4H5514fPb
 lPGkXDuyTjxOGnb5Xhh6zNOdhzYspijzD5otR6LEJDPkpNOHxkirsc0Ed/ZPy6Qft67r
 D+WQ==
X-Gm-Message-State: AAQBX9e6hRvR4lcbUUP9XH0krnoI6qUK7iBw8rMjC5rzWvFkZvc5cekM
 9J+m7zekGVod1DuOT8WmuuttzA==
X-Google-Smtp-Source: AK7set8roRQ/GTe4p205ue3h1dRPJ8gN3+dFwPb3Xo6GGJHthM/0Ch6Y21hnopf6kJmYHcypqOlBMg==
X-Received: by 2002:a05:6870:b506:b0:172:7218:9c01 with SMTP id
 v6-20020a056870b50600b0017272189c01mr710660oap.2.1679523693464; 
 Wed, 22 Mar 2023 15:21:33 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 23/25] target/riscv: rework write_misa()
Date: Wed, 22 Mar 2023 19:20:02 -0300
Message-Id: <20230322222004.357013-24-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:26:35 -0000

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
index 0e6b8fb45e..41b17ba0c3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1018,9 +1018,8 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 }
 
 
-static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
-                                        uint32_t misa_ext,
-                                        Error **errp)
+void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
+                                 Error **errp)
 {
     Error *local_err = NULL;
 
@@ -1113,9 +1112,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
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
@@ -1206,7 +1204,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
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


