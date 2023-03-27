Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvfl-0006D7-Fg
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfY-0005ZH-Od
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:29 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfV-0007II-FW
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:28 -0400
Received: by mail-oi1-x229.google.com with SMTP id bk5so7629128oib.6
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGtio/SjOn1eNb3LZmGqyt9NYOJfI8uin3f2SFWty64=;
 b=RBbQTEkVVMuTaX+oBDZNSbCxhIDWWtL0u2MOiBsH45CZlkB0w+5ObwjJNh9FIUb6D5
 7PY9zmTBW9N+85WBo4rBNgODq9gjOOtFb8tzHPh4jCc4h0vBr/WN7o91DgkoOvzTfy4X
 rEt0FUp4q5GmYNDRWB2Fw5DmAUQqaaXnMZlSaKJa3ZFYfSQh3eXQghwvp38FH5QvRtU8
 /88g6AHOJx+h1z/THeOgI2Kus2xayaikyguN3Spm2dvJ/+wVp+4CaaxOYZE6XzBGAqCp
 6ffByqbtn8j1/Q+NdRS9xRgPzVL3T5LlzgHi0I7i3no5h8ZaLlmLz1rYjDrWsGkkjWjF
 lM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGtio/SjOn1eNb3LZmGqyt9NYOJfI8uin3f2SFWty64=;
 b=sWBEbzLN8/QIoIlg2e+3JO6r39+NiQdNIjvBxv4F9fTXvqd4NSZP2SkYgBZ0wsr03T
 taLOFa7tAOwjEZmKMxMLFCRaGt4wss9Lwopua171IMd/tKoHNsV9Re284+J7CotqRq81
 pKrTYS9iuyA3m85wtcwbo3zbtjtYlUJz+GoznpA/jTf3NG05dHH6Dafz1vSqLmr0iIpM
 vWI1lkwfWMbcJd9Fo/h3ueZzQHQV+IXVWRjJVjHr1FyJMAieuEg4X9JrXylscGPQ9nCM
 JQB5As70sS8MXcZlfjl9WM594iVZOl3p48gdrx2ZGrTA45Zoznxqp54dny4niOR4rDsb
 zGng==
X-Gm-Message-State: AO0yUKWstpZev29Wdvu4Tekym11dWU4mL5/QLJkxqOtJGQlFZJjFg/Zz
 O3FYofkeL+TxznZeEDTT/39axCekKG/O+BSRflk=
X-Google-Smtp-Source: AK7set/BwphFZbbZTrp3+DMJcwQfvtZO1KOV2PH7U7U83xAUpk1mEexsDQ5PhBgGXNQLiAfw/WSjeg==
X-Received: by 2002:aca:1713:0:b0:387:1e71:e4d3 with SMTP id
 j19-20020aca1713000000b003871e71e4d3mr6583840oii.11.1679957416529; 
 Mon, 27 Mar 2023 15:50:16 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 08/19] target/riscv: remove cpu->cfg.ext_i
Date: Mon, 27 Mar 2023 19:49:23 -0300
Message-Id: <20230327224934.363314-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
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

Create a new "i" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVI. Instances of cpu->cfg.ext_i and similar are
replaced with riscv_has_ext(env, RVI).

Remove the old "i" property and 'ext_i' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 15 +++++++--------
 target/riscv/cpu.h |  1 -
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 54e88f2b71..61ee3c72eb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -811,13 +811,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
 
     /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
                             riscv_has_ext(env, RVF) &&
                             riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
@@ -826,13 +825,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+    if (riscv_has_ext(env, RVI) && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+    if (!riscv_has_ext(env, RVI) && !cpu->cfg.ext_e) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
@@ -844,7 +843,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
@@ -1089,7 +1088,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
 {
     uint32_t ext = 0;
 
-    if (riscv_cpu_cfg(env)->ext_i) {
+    if (riscv_has_ext(env, RVI)) {
         ext |= RVI;
     }
     if (riscv_cpu_cfg(env)->ext_e) {
@@ -1443,6 +1442,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVD, .enabled = true},
     {.name = "f", .description = "Single-precision float point",
      .misa_bit = RVF, .enabled = true},
+    {.name = "i", .description = "Base integer instruction set",
+     .misa_bit = RVI, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1465,7 +1466,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
@@ -1576,7 +1576,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_v = misa_ext & RVV;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ce23b1c431..573bf85ff1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -418,7 +418,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_i;
     bool ext_e;
     bool ext_g;
     bool ext_m;
-- 
2.39.2


