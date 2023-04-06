Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTyJ-00012j-DS
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyH-00011w-BZ
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:29 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyE-0000eM-3T
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:28 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-183f4efa98aso2159384fac.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4z24gtDXDugF/zsUCpawt2hpra7MWomBPWmPIVOu3U=;
 b=o7RCUMljqcUNkavvT5acNcbWGWpzDnYaGnNm6/DGFmJA9UC9o4r0mY39+D59liDzXb
 VBsyY8fM2lVES4nuzhFb0L0XSez+84FMKWY3svTwIvOFmQh+u8OeGBuwHd7LCsnIOeFi
 0F82j6HyFI5L6/j/MvQ0JhpDiqLmD6xTYzJk0V24ADefwClNI21HFmeuB53acHisiau9
 OXaLBt1iKYbmta+OFK7aVCAgtfo7OMp37/dD4AVp91pawdAnh/OSsJlVcK/+1dTfkVVm
 FrH1NbRmI3E7zocXFccxkqPOSzeGznZDs7CcRDONEcg2XNdZfHr7XSfuitspXJN9od+Z
 Sc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4z24gtDXDugF/zsUCpawt2hpra7MWomBPWmPIVOu3U=;
 b=GRpmAzun0h9zrr7D0tyoPWMKcMgdF8DEtvKFzQGjSL1Xsps6AKCqbVGDCpyLapcYrT
 3EY4O5fS7iZm8Z+7v2f8/oXiDlmLwy4bVqLqZcS8liCqDBUnU3N7rEVMrU/8ODPDMT+d
 DQbJm2IUVSzE/ZMUvf1H2Xjblv6RUzvUTjP/RKau1z4INeXHY1anai32NRcFocEesecB
 jA0kzRSeLxzjSnePP9+5ywmFJwsucvFED17LEfrpkswXxpDtWM+BoS0xbUpgaGh+z59d
 lOH+c3dY3f8bdlKKwwGuMyy6X3cyCvNGU7iMWeiVPHM/7UoQqKi8MzyBJJNaEVQNjKRq
 7qPA==
X-Gm-Message-State: AAQBX9c16uMZF3apWZBOgcdpUVnB1ca/raKyQXtgZSwzULyUSgD6XldC
 5Qy24IZa3iR7gG7u2KV26rxq5A==
X-Google-Smtp-Source: AKy350bTilafw94sdVe0NAK2ycTKhU5y2z2ULa8B+xP+oeahKfIECnAdHjzIrG0JaFY7sKpUnkcUyQ==
X-Received: by 2002:a05:6870:d189:b0:17a:a7f3:e591 with SMTP id
 a9-20020a056870d18900b0017aa7f3e591mr91524oac.26.1680804264750; 
 Thu, 06 Apr 2023 11:04:24 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 08/20] target/riscv: remove cpu->cfg.ext_f
Date: Thu,  6 Apr 2023 15:03:39 -0300
Message-Id: <20230406180351.570807-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:29 -0000

Create a new "f" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVF. Instances of cpu->cfg.ext_f and similar are
replaced with riscv_has_ext(env, RVF).

Remove the old "f" property and 'ext_f' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 26 +++++++++++++-------------
 target/riscv/cpu.h |  1 -
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5bb03e2ee5..715cbca1b3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -819,12 +819,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
-                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
+                            riscv_has_ext(env, RVF) &&
+                            riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
-        cpu->cfg.ext_f = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -861,7 +861,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
     }
@@ -875,12 +875,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zfhmin = true;
     }
 
-    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zfhmin && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "Zfh/Zfhmin extensions require F extension");
         return;
     }
 
-    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
+    if (riscv_has_ext(env, RVD) && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -905,7 +905,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
@@ -938,7 +938,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-        if (cpu->cfg.ext_f) {
+        if (riscv_has_ext(env, RVF)) {
             error_setg(errp,
                        "Zfinx cannot be supported together with F extension");
             return;
@@ -950,14 +950,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zcb = true;
         cpu->cfg.ext_zcmp = true;
         cpu->cfg.ext_zcmt = true;
-        if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
+        if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
             cpu->cfg.ext_zcf = true;
         }
     }
 
     if (riscv_has_ext(env, RVC)) {
         cpu->cfg.ext_zca = true;
-        if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
+        if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
             cpu->cfg.ext_zcf = true;
         }
         if (riscv_has_ext(env, RVD)) {
@@ -970,7 +970,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
+    if (!riscv_has_ext(env, RVF) && cpu->cfg.ext_zcf) {
         error_setg(errp, "Zcf extension requires F extension");
         return;
     }
@@ -1160,7 +1160,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVA)) {
         ext |= RVA;
     }
-    if (riscv_cpu_cfg(env)->ext_f) {
+    if (riscv_has_ext(env, RVF)) {
         ext |= RVF;
     }
     if (riscv_has_ext(env, RVD)) {
@@ -1500,6 +1500,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVC, .enabled = true},
     {.name = "d", .description = "Double-precision float point",
      .misa_bit = RVD, .enabled = true},
+    {.name = "f", .description = "Single-precision float point",
+     .misa_bit = RVF, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1526,7 +1528,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
-    DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1646,7 +1647,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fba5e9a33c..e5680b0709 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -426,7 +426,6 @@ struct RISCVCPUConfig {
     bool ext_e;
     bool ext_g;
     bool ext_m;
-    bool ext_f;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


