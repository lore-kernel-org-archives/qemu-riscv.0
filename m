Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcoG-0005fi-Hb
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdco6-0005P4-FX
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:40 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdco4-00078p-Pv
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:38 -0400
Received: by mail-oi1-x22c.google.com with SMTP id bj30so6210657oib.6
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KwQdqmQndsZzKf5aoxFmYpjUR9gPSzP9IGgqEepMGk=;
 b=St8Hl0tlRESllXEwP+0ih4iKVL+TTzDtFoyIEgzWyEnsZH2A0U85Vl8r+pUP6KXZ9E
 rICNveRlNIndqOvHs5q83pRx+AZndiFtdRnh/o5XcBol9o7Scizx43tW65/zSZXfLy+C
 zilFCCTQfhlYe1DDJC4ULuF0UgRlgDpYgUE8srztt/3JEDM/7xjeU6r98A59NNTcSihv
 1kSOJO+38b7LNnC+gxBeuzPQvFnW6PYG25cNFjd8BXD0YNVv/ai9gkzrTNH8E6H3nVfl
 /B8R/Hh2W/sqKuLHrisscjwNx6hgcrfnpeRx32pqlCILj49HDHJuctuJASVoJV6z8FW1
 D20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KwQdqmQndsZzKf5aoxFmYpjUR9gPSzP9IGgqEepMGk=;
 b=LH4lDedrXtQCtMM5Ll46cbhmS0hkGRaBhAkV9h766l/3EgLYGHmpVHAHahfMDHE9Z4
 eMbZuVEwu6k8msGubG266BL4NczEAUGdMjAzcaMJtmmwRrfjk3gg8giDhPU+lKzRnG2o
 xexw5/VXg69RKX26U5vHo4OQ73mczt1glTOMll2ofx/FeK82Uep0eVzp1/zuXOQ8TMdj
 8Ze2CSYdHlU+5BqARLMCQj2smR7xiU6cWPpB3rd54eqxKWIUvukZCEInaFUps2zKPyjI
 ihxnIdABhU9DTemUi/i6VcSt3I9Wdw/dbuLSIVnNjgkKd0sM2VMHpExjFWkvOCAuJzgP
 Or3A==
X-Gm-Message-State: AO0yUKXksXp+m4R0mBJSMkKHz7xIMg3gvwwZq+SqVSBtpmqkHUYtka1L
 VvcCUA6hjBv3Ti+uXP4/tnk89g==
X-Google-Smtp-Source: AK7set9iOhNEUUBHHLVxgqSx47m00Q7iLVf7YOaJY0pppyu0COcH9pPiWuoLuq05AtuOpTTosljX6A==
X-Received: by 2002:a05:6808:8cc:b0:36b:fbdb:eb61 with SMTP id
 k12-20020a05680808cc00b0036bfbdbeb61mr6554962oij.23.1679169936188; 
 Sat, 18 Mar 2023 13:05:36 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 19/26] target/riscv: write env->misa_ext* in
 register_generic_cpu_props()
Date: Sat, 18 Mar 2023 17:04:29 -0300
Message-Id: <20230318200436.299464-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:42 -0000

In the process of creating the user-facing flags in
register_generic_cpu_props() we're also setting default values for the
cpu->cfg flags that represents MISA bits.

Leaving it as is will cause a discrepancy between users of this function
(at this moment the non-named CPUs) and named CPUs. Named CPUs are using
set_misa() with a non-zero 'ext' value, writing cpu->cfg in the process.
They'll reach riscv_cpu_realize() in a state where env->misa_ext will
reflect cpu->cfg, allowing functions to choose whether to use
env->misa_ext or cpu->cfg to validate MISA bits.

If we guarantee that env->misa_ext will always reflect cpu->cfg at the
start of riscv_cpu_realize(), functions will be able to no longer rely
on cpu->cfg for MISA validation. This happens to be one blocker we have
to properly support write_misa().

Sync env->misa_ext* in register_generic_cpu_props(). After that, there
will be no more places where env->misa_ext needs to be sync back with
cpu->cfg, so remove the now obsolete code at the end of
riscv_cpu_validate_set_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d8f2eca6ca..992edd1735 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1116,14 +1116,10 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 
 /*
  * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly, setting env->misa_ext and
- * misa_ext_mask in the end.
+ * cpu->cfg accordingly.
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
-    CPURISCVState *env = &cpu->env;
-    uint32_t ext = 0;
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
@@ -1240,10 +1236,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      * validated and set everything we need.
      */
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
-
-    ext = riscv_get_misa_ext_with_cpucfg(&cpu->cfg);
-
-    env->misa_ext_mask = env->misa_ext = ext;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1354,6 +1346,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /*
+     * This is the last point where env->misa_ext* can
+     * be changed.
+     */
     if (cpu->cfg.ext_g) {
         riscv_cpu_enable_g(cpu, &local_err);
         if (local_err != NULL) {
@@ -1631,10 +1627,12 @@ static Property riscv_cpu_extensions[] = {
  * Register generic CPU props with user-facing flags declared
  * in riscv_cpu_extensions[].
  *
- * Note that this will overwrite existing values in cpu->cfg.
+ * Note that this will overwrite existing values in cpu->cfg
+ * and MISA.
  */
 static void register_generic_cpu_props(Object *obj)
 {
+    RISCVCPU *cpu = RISCV_CPU(obj);
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
@@ -1645,6 +1643,10 @@ static void register_generic_cpu_props(Object *obj)
 #ifndef CONFIG_USER_ONLY
     riscv_add_satp_mode_properties(obj);
 #endif
+
+    /* Keep env->misa_ext and misa_ext_mask updated */
+    cpu->env.misa_ext = riscv_get_misa_ext_with_cpucfg(&cpu->cfg);
+    cpu->env.misa_ext_mask = cpu->env.misa_ext;
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.39.2


