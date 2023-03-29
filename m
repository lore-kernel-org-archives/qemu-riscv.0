Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZcK-0004bE-FL
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcJ-0004Wt-6J
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:47 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcE-00013q-Cw
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:43 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 j12-20020a4ab1cc000000b0053e6062a9eeso1007256ooo.8
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQvci0IHw9SwXqug/5WIZc+Yvh5N70IeK/Lji1u3mQc=;
 b=CSrA0Z/JafxwCEmK2h3ZxNCntvaBNn6zU80j+T/2499gKkm5XtbSNcCsZc0fKkupmy
 CCpfAaoIW9ekTK58v/8iyuzqHpKWmuB3fazQS9KKshb00EjWK3rEv1dAzp2G281Cu14Z
 8qo2G1t3nfpDrt8SJax4WaDs7tn2Lr1vud1pXx2Pxx1cIXZmPZs6A/uShtVVX2WIeQzY
 Tj1TqDGpoeBpsGjY75E9jSlT6om5MBD1dmA9DN4NeEcPM/FcjSjaS/rP27ZU9Rs3zsJo
 dCudBZks+GolQFZK20bhKt00nrjxfWUC6rbF5lGNFemSe6dpcG5qAv35IvpuFJoFuARx
 YDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQvci0IHw9SwXqug/5WIZc+Yvh5N70IeK/Lji1u3mQc=;
 b=RT0ko0RMMVPaGwvo482dI3PPujgQ57zOI2tbFY2gRGYZMNeVcC1p5/1xOR3MFQfFcL
 d/gMSoQajIoUgSvBw/KqIrdYOlwFGAk4CPXdSED38exABptKiDpa82nOIKXbPsjlqlFC
 sqKA2UPRaKjxLQ+wL8Cme0SW4I9MrG+sRs6vfP8RgF+Q+DAS6XdM7avWiPZ7P73Fq+C1
 zh5FXIyZsji6LOyCCR77Sgz6S5Za9DoVFUz/ptRCvdwkVPr1ckd7U+mgMyY+CFGB/ww6
 +aJu8xQyQl+a8BrYGQr9sKtilcWrV8tUn4ZqE/MKM5ZH8hFe/9ZjG1Hefg8QmB2H/i09
 Z7Dg==
X-Gm-Message-State: AO0yUKXl6hByISkgwMry2QwS5R35Degoj/RRSrXYdrKP0zs4VdCswR7z
 CyNk07lf7bwAQGcSxAZ0p30azw==
X-Google-Smtp-Source: AK7set8b0Jo2N3/jqUa+3+rb+EJDnTbd6qW9AYkyiqxg5BzcpY1KeXWSb7UgT35X5VkU4SGbJpWLoQ==
X-Received: by 2002:a4a:5852:0:b0:536:a447:b270 with SMTP id
 f79-20020a4a5852000000b00536a447b270mr11460522oob.6.1680110981712; 
 Wed, 29 Mar 2023 10:29:41 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 11/20] target/riscv: remove cpu->cfg.ext_m
Date: Wed, 29 Mar 2023 14:28:54 -0300
Message-Id: <20230329172903.636383-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2d.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:47 -0000

Create a new "m" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVM. Instances of cpu->cfg.ext_m and similar are
replaced with riscv_has_ext(env, RVM).

Remove the old "m" property and 'ext_m' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9cf3ab3988..6861446489 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -810,13 +810,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
 
     /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) && cpu->cfg.ext_m &&
+    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) &&
+                            riscv_has_ext(env, RVM) &&
                             riscv_has_ext(env, RVA) &&
                             riscv_has_ext(env, RVF) &&
                             riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_m = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -1093,7 +1093,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVE)) {
         ext |= RVE;
     }
-    if (riscv_cpu_cfg(env)->ext_m) {
+    if (riscv_has_ext(env, RVM)) {
         ext |= RVM;
     }
     if (riscv_has_ext(env, RVA)) {
@@ -1445,6 +1445,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVI, .enabled = true},
     {.name = "e", .description = "Base integer instruction set (embedded)",
      .misa_bit = RVE, .enabled = false},
+    {.name = "m", .description = "Integer multiplication and division",
+     .misa_bit = RVM, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1468,7 +1470,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1576,7 +1577,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cc0b9e73ac..7a42c80b7d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_m;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


