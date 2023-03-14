Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7sD-0008Do-K6
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rj-0006xC-CU
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:19 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rh-00037C-LV
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:51:11 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 bg8-20020a056820080800b0053160781f11so63071oob.11
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kLvyrtSvvuZg8uzOBdjg6jj7IyKLzGPxs656bAqgPdU=;
 b=Nm8wUb8g7VLlnX30F+sN1Z94B3+a9XYGZmQZATifFay57iDQtCgfaNGPsC2ABfmRVJ
 KGXN3V+Pa8xRYfK5WaH6yYrFFNANoapjkrTZ0CBEbWrImLYUXTEGUbEYQZNUglRvhtB+
 MTZlkR/tiR17tv/0BP2mqAMiJXfA2WMRjCnTwvgNjDzNUh5I4nYMC57zAhVlgQvmaw9o
 MqIppD1wY9423xba1rRuR1FakDO3LurncFUX4NChOibWc8sBsc19WiNaIsJvrxP6gbAN
 ymkrN0AEj4VfOjHZe7jOlzafbZuWqPhAwlLqRxE8BZ9GJ/SeL4aHr0ESvLDO1xjW9MWz
 W80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kLvyrtSvvuZg8uzOBdjg6jj7IyKLzGPxs656bAqgPdU=;
 b=JE5ssAdScY9MV/EKN9sGnWpqhkRsUIzbT2T3iF/RVb5npmhm0+yk+FUQpM+VprCn1Y
 V4vctFGZ+49GN2rFHaEUJdxA+jLGbJ7Ii/lfG+n/WSzEmbkHwuGT8pESYYtT/XF0ro12
 JvUWKGJP0QYJnYxMjbW5lX+lc1qDv0i6UgvIwkZoejpAZrarW9yjQRiSwrzmAEPGKz2Z
 Mpg2DQ6wouxhDHOF/sXEqzcR02LSAjuIGnUe+gbvG7LYioSv8uMxbheUwq77Ax6+x5bU
 eCiL5lpvEGVGp4mdjaE9mj7AnN7swwGs2ev27HYmkhVDQNrzBHDsbBz/kqRHPCe+eqmf
 VEeQ==
X-Gm-Message-State: AO0yUKUwjM3KomGVTlPzJpEzX+GCgShvO98zezFupOwI9JGfVDSixtVp
 zRqkzHMo5ZvPHhR7W4Qir/G2Wg==
X-Google-Smtp-Source: AK7set80C+pAlSwk50L91T0H99QsHglogqf9bI9ewY0ab0ODjn1sjB5uxQ0EoFRDa4gPj9l7TuXuOg==
X-Received: by 2002:a4a:95c6:0:b0:525:129c:6165 with SMTP id
 p6-20020a4a95c6000000b00525129c6165mr17589170ooi.6.1678812668646; 
 Tue, 14 Mar 2023 09:51:08 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:51:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 24/26] target/riscv: use misa_ext val in
 riscv_cpu_validate_extensions()
Date: Tue, 14 Mar 2023 13:49:46 -0300
Message-Id: <20230314164948.539135-25-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2b.google.com
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

Similar to what we did with riscv_cpu_validate_misa_ext(), let's read
all MISA bits from a misa_ext val instead of reading from the cpu->cfg
object.

This will allow write_misa() to use riscv_cpu_validate_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e423d3e2d2..5bd92e1cda 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1130,10 +1130,13 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 }
 
 /*
- * Check consistency between chosen extensions. No changes
- * in env->misa_ext are made.
+ * Check consistency between cpu->cfg extensions and a
+ * candidate misa_ext value. No changes in env->misa_ext
+ * are made.
  */
-static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
+                                          uint32_t misa_ext,
+                                          Error **errp)
 {
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
@@ -1144,12 +1147,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+    if (misa_ext & RVF && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
     }
 
-    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+    if ((cpu->cfg.ext_zawrs) && !(misa_ext & RVA)) {
         error_setg(errp, "Zawrs extension requires A extension");
         return;
     }
@@ -1158,13 +1161,13 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zfhmin = true;
     }
 
-    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zfhmin && !(misa_ext & RVF)) {
         error_setg(errp, "Zfh/Zfhmin extensions require F extension");
         return;
     }
 
     /* The V vector extension depends on the Zve64d extension */
-    if (cpu->cfg.ext_v) {
+    if (misa_ext & RVV) {
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -1178,12 +1181,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zve32f = true;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d && !(misa_ext & RVD)) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
 
-    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f && !(misa_ext & RVF)) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
@@ -1216,7 +1219,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-        if (cpu->cfg.ext_f) {
+        if (misa_ext & RVF) {
             error_setg(errp,
                        "Zfinx cannot be supported together with F extension");
             return;
@@ -1378,7 +1381,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_validate_extensions(cpu, &local_err);
+    riscv_cpu_validate_extensions(cpu, env->misa_ext, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
-- 
2.39.2


