Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTyH-00012D-JO
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyD-00011a-Md
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:27 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyA-0000cV-4d
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:23 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17fcc07d6c4so29154992fac.8
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9x0iEmvZZnGbXL5Z/nMToKlOj5c7ZztL5LLqrRttDI=;
 b=HSYaYqj72PYQurYdg8h3Cw4jrdp9mLmRnDuyUESiqpjihn0fmCPJImoGPCN1FF0L+d
 96ivhaQgbGzTelS8mGCWGzyMCJSu0kEdgdF5Lv23wmqmB4beidMvyy6NQRaS+I6772qi
 u8WmCzMsUlLWbazYsHAG8UYnmwXa2hqKKwaZenyvUDcLi01X8ieGxZSTWLrVxRj143WV
 KIGnhg95zJNssuLz+wFkjaOII+T37QKYZldKYVYvT8dEYzrcxP5ephGoLylia1s5TEyJ
 W0ydtauQajgjnMaTuQ1ICQF8ctQqbQnJhnYCCc71+EvU11AA+rSeL+PwZCFdsS3xDJmY
 +LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B9x0iEmvZZnGbXL5Z/nMToKlOj5c7ZztL5LLqrRttDI=;
 b=qmYYpzmPrTeAdmw1fQ9He7G/YaZDf0DcRgMIJgtz1IYVVkOcS24YZcXuAhTczjoH3h
 R5BJTsl9e8eEgxG3el2ql5TUnwWjpxyHwGIHZezNVmB7sf6cUAYKyXoT3ddwzair/nLo
 5E29DOiYXYT+2zcFCIhLwBSZ4Ah0viD3lzTKeP1SdhJ+w7VNJJZwSI46gWuO0cyVBPcv
 PFs/pr8wOYEfsjaPZz2oV52p21AyT9Fu1Vy4YNnKygTDmWSibUXT+7StH6R6xAK7sP5o
 IqR31EtytszMBfrArMozukF2Snwr9PoX85DRmy44xWulDODsfySaZy7DYFnDYqFOzR2y
 H0yg==
X-Gm-Message-State: AAQBX9c8bt0ShfnPgva272JdjcKrCvhQs3G9PvF4QRfJwdCXFX7knFmR
 41febVHmyVyWPXJiANsyP01eIw==
X-Google-Smtp-Source: AKy350a9oJARNDAXB6dNJKIcFrGpxSsjMXGzsmmS45gnhD/WOhR9oYDqVVv3XthPM27e+wi8Wf6jAA==
X-Received: by 2002:a05:6870:b619:b0:183:e8b2:92f6 with SMTP id
 cm25-20020a056870b61900b00183e8b292f6mr94474oab.27.1680804261483; 
 Thu, 06 Apr 2023 11:04:21 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 07/20] target/riscv: remove cpu->cfg.ext_d
Date: Thu,  6 Apr 2023 15:03:38 -0300
Message-Id: <20230406180351.570807-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:27 -0000

Create a new "d" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVD. Instances of cpu->cfg.ext_d and similar are
replaced with riscv_has_ext(env, RVD).

Remove the old "d" property and 'ext_d' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 17 ++++++++---------
 target/riscv/cpu.h |  1 -
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2e00b8f20a..5bb03e2ee5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -819,13 +819,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
-                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
+                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
         cpu->cfg.ext_f = true;
-        cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -881,7 +880,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -901,7 +900,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zve32f = true;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d && !riscv_has_ext(env, RVD)) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
@@ -961,7 +960,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
             cpu->cfg.ext_zcf = true;
         }
-        if (cpu->cfg.ext_d) {
+        if (riscv_has_ext(env, RVD)) {
             cpu->cfg.ext_zcd = true;
         }
     }
@@ -976,7 +975,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
+    if (!riscv_has_ext(env, RVD) && cpu->cfg.ext_zcd) {
         error_setg(errp, "Zcd extension requires D extension");
         return;
     }
@@ -1164,7 +1163,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_f) {
         ext |= RVF;
     }
-    if (riscv_cpu_cfg(env)->ext_d) {
+    if (riscv_has_ext(env, RVD)) {
         ext |= RVD;
     }
     if (riscv_has_ext(env, RVC)) {
@@ -1499,6 +1498,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVA, .enabled = true},
     {.name = "c", .description = "Compressed instructions",
      .misa_bit = RVC, .enabled = true},
+    {.name = "d", .description = "Double-precision float point",
+     .misa_bit = RVD, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1526,7 +1527,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
-    DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1647,7 +1647,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_f = misa_ext & RVF;
-        cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9a3847329c..fba5e9a33c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -427,7 +427,6 @@ struct RISCVCPUConfig {
     bool ext_g;
     bool ext_m;
     bool ext_f;
-    bool ext_d;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


