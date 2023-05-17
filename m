Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31273C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:59:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzHfJ-0001Yq-6e; Wed, 17 May 2023 09:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHfF-0001W0-U7
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:58:02 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHfA-0000a6-2H
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:58:01 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-38ea3f8e413so473020b6e.2
 for <qemu-riscv@nongnu.org>; Wed, 17 May 2023 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684331874; x=1686923874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t6Xyw8ijFq4Yvxjt3imbOP1FVRYfmako65iN6rlGhO4=;
 b=JnBVs262jhbK61QKgT77Y3OEcbXd2XgtDCAXBmF2yXCXBJhW9d6qUZ3jcn/vV4c7UJ
 3rBaDVrPfsqD5yTfDewIbGjTCrYdK/fVSP7BucoZQQ/Dwk9eGZzUx+8GapF7hX9I+VWr
 fNYxoqdQh0X9LJThf3dM0j5QQ3XralGnlkw8uap39UxPjD47vo+E14znGqpVNK/zhECB
 TwqlBU8N+k0+w9DnYM8ays1socHpX/9el7eMJgrLZkrPNvL2rJQEgUT76wX9tj7CAwAV
 /7WaNHo43tL2AHhnnBkS6Xyd9Hz7iHvelNbeJBdK2B/LH0cE/5MqHOn898WZIOqxzibD
 rP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684331874; x=1686923874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t6Xyw8ijFq4Yvxjt3imbOP1FVRYfmako65iN6rlGhO4=;
 b=DMyyIpSHmqQHnJTdz7iN/MNgG/v4OqtWb/xzNuUDgg/xzGxYCgelWBxBMlSDHlsW7a
 uTVGP4gXtUngk+OrILnasMPKYHHB3lPU5vU4ybzDlMakMIEW4Y9190cousVDI2Ke2yvg
 FLQtvmME/mNFhsf1amVV9auDKRHz+d3Inm2zAbC06oB4WWyUNisj51DzWjsiS3x9XNCk
 UuAgXEiZODKFD5mzeEUalZMB5yMLndm52+SzaMYLOCFyKIlDGBUlatACNBiLvxZdvBwy
 E/YSsHblDkM166D7GDr7sgLI59rRhbIjqEgd9EHhSGeJ4BBMoG3u6xTzSG6ZN8hT26mS
 6XdA==
X-Gm-Message-State: AC+VfDxS/1BAi/MVI5hjfflmETyP7rl2Cd2M3sEfzr22vm05Aix6pO7g
 o0ny5FYRT2Z2+KGjIfOzUjpKaljpjpShC4AtKdA=
X-Google-Smtp-Source: ACHHUZ5xXHciR7vE4lD0NlGxgWFwO0AwGcWejtQdURrUY8LKEL7uNWb0Q8ipl9assQe4ABhHy9gU3w==
X-Received: by 2002:a05:6808:2091:b0:395:ddd0:2a5f with SMTP id
 s17-20020a056808209100b00395ddd02a5fmr8315511oiw.4.1684331874022; 
 Wed, 17 May 2023 06:57:54 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a544815000000b00383d9700294sm9409562oij.40.2023.05.17.06.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:57:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 11/11] target/riscv: rework write_misa()
Date: Wed, 17 May 2023 10:57:14 -0300
Message-Id: <20230517135714.211809-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517135714.211809-1-dbarboza@ventanamicro.com>
References: <20230517135714.211809-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

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
(misa_ext_mask will be == misa_ext) and will ensure that write_misa()
won't change misa_ext_mask by accident.

After that, rewrite write_misa() to work as follows:

- mask the write using misa_ext_mask to avoid enabling unsupported
  extensions;

- suppress RVC if the next insn isn't aligned;

- disable RVG if any of RVG dependencies are being disabled by the user;

- assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
  error, rollback env->misa_ext to its original value, logging a
  GUEST_ERROR to inform the user about the failed write;

- handle RVF and MSTATUS_FS and continue as usual.

Let's keep write_misa() as experimental for now until this logic gains
enough mileage.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c |  4 ++--
 target/riscv/cpu.h |  1 +
 target/riscv/csr.c | 51 ++++++++++++++++++++++------------------------
 3 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 52f91ff8cf..6d4748bf24 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -981,7 +981,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
  */
-static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
+void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
@@ -997,7 +997,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
index 4451bd1263..cf7da4f87f 100644
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
@@ -1428,18 +1407,36 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
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
+        qemu_log_mask(LOG_GUEST_ERROR, "Unable to write MISA ext value "
+                      "0x%x, keeping existing MISA ext 0x%x\n",
+                      env->misa_ext, orig_misa_ext);
+
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
2.40.1


