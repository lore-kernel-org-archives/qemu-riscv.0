Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7s4-0007Y9-Mt
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rw-00072H-HA
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:27 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rm-00037W-2G
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:20 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 e26-20020a9d6e1a000000b00694274b5d3aso8750591otr.5
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r84xJtHoIGB7ABAqtSobwcdMIMD2s20w0sZHcVJeXVo=;
 b=ItIR+YA5L0bcz4od03u1DfYT9SY9zVYw/LDV9i+eVAZVl3P4Y5jX31Q6HQngwIp48P
 rwm0pSusDRtzk8wPTcFuA9iZfqyWhSBncIDHrxEgUkgiP4+GzLGSV38s82SWuJhQjoxr
 PafUxXvjHW2qeuGIAQ+IuALJ9vqS7t1VXOnrXXJMMfg4yHtpwS4unkcQx61FA4juIsyV
 NL9/gp1xan7tvbMcBgYt2xH8jANWQD2u3xJvuYDkE7w727wLj9OddC/WtMBRkXG/PbJn
 8a9AiN9CHOwKQUhs9rnLSZqlu9DFg5VlL9JRqUvhYjldZJZBX/gS3GYfnvQcje35TuK2
 79jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r84xJtHoIGB7ABAqtSobwcdMIMD2s20w0sZHcVJeXVo=;
 b=KYbSzhxkiSilygEnle3UxhezyKhFicLO0bmbhzHaG+dosvNmzQIWa9W22grlcyyKXv
 9X2Q02Ml7sAMdF9BZtSaypNh+pMHl8u42z7XH1UK+gQ6QRln1ceMfPSuy+oB1DLavjzU
 ncG8KtQkoCttIwPBaSTsl25ortpF0s0looUUwltGN+kpVxHVnetl65vAINjsMeDUWZS7
 qtNPnOw3XjiHSXibaI+z3qEYV8cynSn2qo2fapYKeYf/08hjfEXUg9PobtxHXFvyqMNq
 B/VD3oi2bzH5Xtb/mnDBmzGFQYyLGg2Vp//pUYYGuuWdAMIdKjVAmbv6F2L7ZRchKfsT
 1SBw==
X-Gm-Message-State: AO0yUKVo8FEpRU4CJlfjej854j9c+J/CrrvqphMZr3SNRInI/Iz5/CXM
 4gz93SfSU+lA8uWZVRjYJQxTDw==
X-Google-Smtp-Source: AK7set/58BhPhTnbIMDODReUTIltqEECJW/MBpsQA0nDper8mptUMiBe1bM9Ljvnu000d5JNTV5i2w==
X-Received: by 2002:a05:6830:24a4:b0:68b:e391:324d with SMTP id
 v4-20020a05683024a400b0068be391324dmr18934702ots.0.1678812671712; 
 Tue, 14 Mar 2023 09:51:11 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:51:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 25/26] target/riscv: rework write_misa()
Date: Tue, 14 Mar 2023 13:49:47 -0300
Message-Id: <20230314164948.539135-26-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:51:27 -0000

write_misa() must use as much common logic as possible. We want to open
code just the bits that are exclusive to the CSR write operation and TCG
internals.

Rewrite write_misa() to work as follows:

- supress RVC right after verifying that we're not updating RVG;

- mask the write using misa_ext_mask to avoid enabling unsupported
  extensions;

- emulate the steps done by realize(): validate the candidate misa_ext
  val, then validate the configuration with the candidate misa_ext val,
  and finally commit the changes to cpu->cfg.

If any of the validation steps fails simply ignore the write operation.

Let's keep write_misa() as experimental for now until this logic gains
enough mileage.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 12 +++++-------
 target/riscv/cpu.h |  6 ++++++
 target/riscv/csr.c | 47 +++++++++++++++++++++-------------------------
 3 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5bd92e1cda..4789a7b70d 100644
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
 
@@ -1134,9 +1133,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
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
@@ -1227,7 +1225,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
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
index 918d442ebd..6f26e7dbcd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1343,6 +1343,9 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+    Error *local_err = NULL;
+
     if (!riscv_cpu_cfg(env)->misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
@@ -1353,47 +1356,39 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
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
     /*
-     * misa.MXL writes are not supported by QEMU.
-     * Drop writes to those bits.
+     * Suppress 'C' if next instruction is not aligned
+     * TODO: this should check next_pc
      */
+    if ((val & RVC) && (GETPC() & ~3) != 0) {
+        val &= ~RVC;
+    }
 
     /* Mask extensions that are not supported by this hart */
     val &= env->misa_ext_mask;
 
-    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
-    if ((val & RVD) && !(val & RVF)) {
-        val &= ~RVD;
+    /* If nothing changed, do nothing. */
+    if (val == env->misa_ext) {
+        return RISCV_EXCP_NONE;
     }
 
     /*
-     * Suppress 'C' if next instruction is not aligned
-     * TODO: this should check next_pc
+     * This flow is similar to what riscv_cpu_realize() does,
+     * with the difference that we will update env->misa_ext
+     * value if everything is ok.
      */
-    if ((val & RVC) && (GETPC() & ~3) != 0) {
-        val &= ~RVC;
+    riscv_cpu_validate_misa_ext(env, val, &local_err);
+    if (local_err != NULL) {
+        return RISCV_EXCP_NONE;
     }
 
-    /* If nothing changed, do nothing. */
-    if (val == env->misa_ext) {
+    riscv_cpu_validate_extensions(cpu, val, &local_err);
+    if (local_err != NULL) {
         return RISCV_EXCP_NONE;
     }
 
+    riscv_cpu_commit_cpu_cfg(cpu);
+
     if (!(val & RVF)) {
         env->mstatus &= ~MSTATUS_FS;
     }
-- 
2.39.2


