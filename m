Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf6q5-0006T3-DV
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6q4-0006Sn-GB
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:21:48 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pr-0006WC-Or
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:21:48 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17683b570b8so20844001fac.13
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aw+7wAt+UOzc0KBymK9byKqs7rrsubq5pvYdEehGPjI=;
 b=kSt4H7Br7gGSn4NPk4eWUQ/HPjegEM768OULLMtMy2PO5uzN28K75hE98QQcw3N1aw
 74LKaunUeXyFuTvklZeDVxfPlW/S88mwlKSnNx7e6IgzSGwqXmbN386tGZtz0abe3rXS
 GAU7Yjim4lmiFBq1kD0Dbag+WuxyL9X0nG2ria/nGjOZD1MsuuVcZ+ojhRPAyPynzUBJ
 dRnHv4xVIwWj9WUGM33U7IVEUpJESmxaV1Hwt1JC/D0EZ/1r17mqRukGzvcLDToU7axy
 FYS+MYdB0s0Frq2CZTrZjpBB28g87TgZ1iDOBI1Qd+JrVryz07LsoJztY6Y3MoWh55Go
 9nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aw+7wAt+UOzc0KBymK9byKqs7rrsubq5pvYdEehGPjI=;
 b=APN5DGnfhSGljVMvWdRfGyduy613g6l0L9BdyGD80IhCcwINSgFKjRv3Z7DVYtn/ri
 Xbcpe1ucM7Eo2R4dIHficRVHnuepzvxW9irKCWuo72IymK08LLTI1jILn07n21rZsmPS
 ic4lzQRboIUuprfij9cBB2eMjOIOisw5RT1XI6Vtowgzwf7iqcxk/fl/ZW4oVYmvOwTA
 8hOuZDT9eun9lpaOZfWi2FLEOCzuh6J5EsxHp7bJr/1q9hTEQhuV/eLUX/fgTqNCyfsm
 29D0aaYBPH8MCuQMfpD0Y7rbh7d9SlYaZ5cvRe+/WKEsSTDs+Lk5bPjtaen90o/txbkX
 S4Jg==
X-Gm-Message-State: AO0yUKXqtzqf6vXrQP0p63nmcy9Vkh7Rka4iqqqxWZ+MJqCFrzyRpyrY
 V8CvbwqJ99Y++7WCwkJbEJ+hfQ==
X-Google-Smtp-Source: AK7set9CmbKgPSonzx8bhXpV0ku3+kFyrquqFZ97NUnME3aXD0yjnGuJ2a0KUMeOQLcSCpSUHje92w==
X-Received: by 2002:a05:6870:6123:b0:177:b0ee:b034 with SMTP id
 s35-20020a056870612300b00177b0eeb034mr763201oae.43.1679523681375; 
 Wed, 22 Mar 2023 15:21:21 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 19/25] target/riscv: write env->misa_ext* in
 register_generic_cpu_props()
Date: Wed, 22 Mar 2023 19:19:58 -0300
Message-Id: <20230322222004.357013-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:21:48 -0000

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
index d2eb2b3ba1..f1e82a8dda 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1107,14 +1107,10 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 
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
@@ -1231,10 +1227,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      * validated and set everything we need.
      */
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
-
-    ext = riscv_get_misa_ext_with_cpucfg(&cpu->cfg);
-
-    env->misa_ext_mask = env->misa_ext = ext;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1345,6 +1337,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /*
+     * This is the last point where env->misa_ext* can
+     * be changed.
+     */
     if (cpu->cfg.ext_g) {
         riscv_cpu_enable_g(cpu, &local_err);
         if (local_err != NULL) {
@@ -1622,10 +1618,12 @@ static Property riscv_cpu_extensions[] = {
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
 
@@ -1636,6 +1634,10 @@ static void register_generic_cpu_props(Object *obj)
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


