Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvfj-0005zv-P6
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfW-0005Yd-V1
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:27 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfK-0007mN-G8
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:17 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 j12-20020a4ab1cc000000b0053e6062a9eeso65141ooo.8
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dm+X7fP6QDGUWbBJ8mOxB+DtEet4SbFw4ntc5NVHWkM=;
 b=pg5CR39DMXLDb18dPPn1B3r0lj8UZQyCz1wOJxLntVVlYzmkDB5xCxsF+YxqPwipOi
 bLvy9hGNr0uIMONxkSEbuQaJ2Xd0JOOdoMzpIEFVeV53HGjbezECqbvHZFsiTer+eCdP
 dRcFy4iOgP2Wx5m1fKtjkOb8x3YlK1zIFv4oej2QEJh++8ecMezhEh5XYUVARO4PYQ0l
 WZCnsYlxpaB09Foor7kY+xOa2ud6ae8dqArsVoha/y7eq2MFc7ReP3IG3brSbi26KRl7
 DtsVr3HEUELGmlk6aaZPhAV16AVKaqebJyxNjar46JRhrgKn7ZHiqjzP6LJ5FjbcElMr
 hwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dm+X7fP6QDGUWbBJ8mOxB+DtEet4SbFw4ntc5NVHWkM=;
 b=u/3jioF6xUMgjHTSyWxgMlv1/tu+YYIWcWRolRt9EHxRWb+QJU55sxc+l7a0sk5fSa
 NtXUZM/s4UeeNN1gDM02n0qdZ0DAnCSDOc+DcI4RC+4HA3A4K/7N3Ahr53mbxaMlraO3
 jxd9mpnnRpVz1nuQzT6DeuuaK9LYdYdDLBVKIqDkZEdECg7q1Fom76xRVwhe29F/DJ8c
 Gs71dG5svSKozKvehmTiuB/f51ha8//z4Alnps8Kyw02AlYIaLxkjAgvKV4u7HGVyVxb
 Gve1NFX9l67u1P8YtSHC4HE3MfBns34AcSbHjHMu8IdLWNRhu5Ig0lEm7yczMij61QbM
 N6jA==
X-Gm-Message-State: AO0yUKVtlucuFCyhGc6Tb6O3QeIvbgSNiMwxQ+0an4yBQ4uImvrdYmbf
 a+JVlevJpoeNUmbX8ybq/jRPEQ==
X-Google-Smtp-Source: AK7set829zGf3kFtrHWrvhL4xWnj5dx1F1NCTJ2AmWjai3Axh01hZxBud4ItMTQCdMFRyMa0DvHorg==
X-Received: by 2002:a4a:494b:0:b0:525:4316:7dac with SMTP id
 z72-20020a4a494b000000b0052543167dacmr6632764ooa.5.1679957412612; 
 Mon, 27 Mar 2023 15:50:12 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 07/19] target/riscv: remove cpu->cfg.ext_f
Date: Mon, 27 Mar 2023 19:49:22 -0300
Message-Id: <20230327224934.363314-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Mar 2023 22:50:30 -0000

Create a new "f" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVF. Instances of cpu->cfg.ext_f and similar are
replaced with riscv_has_ext(env, RVF).

Remove the old "f" property and 'ext_f' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 20 ++++++++++----------
 target/riscv/cpu.h |  1 -
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fed697be9d..54e88f2b71 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -813,12 +813,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
 
@@ -855,7 +855,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
     }
@@ -869,12 +869,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -899,7 +899,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
@@ -932,7 +932,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-        if (cpu->cfg.ext_f) {
+        if (riscv_has_ext(env, RVF)) {
             error_setg(errp,
                        "Zfinx cannot be supported together with F extension");
             return;
@@ -1101,7 +1101,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVA)) {
         ext |= RVA;
     }
-    if (riscv_cpu_cfg(env)->ext_f) {
+    if (riscv_has_ext(env, RVF)) {
         ext |= RVF;
     }
     if (riscv_has_ext(env, RVD)) {
@@ -1441,6 +1441,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVC, .enabled = true},
     {.name = "d", .description = "Double-precision float point",
      .misa_bit = RVD, .enabled = true},
+    {.name = "f", .description = "Single-precision float point",
+     .misa_bit = RVF, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1467,7 +1469,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
-    DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1578,7 +1579,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e4cf79e36f..ce23b1c431 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -422,7 +422,6 @@ struct RISCVCPUConfig {
     bool ext_e;
     bool ext_g;
     bool ext_m;
-    bool ext_f;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


