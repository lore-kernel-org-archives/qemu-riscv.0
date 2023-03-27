Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmC8-0008Dq-9P
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 08:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmC7-0008DX-GU
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:27 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmC5-0002nC-Fq
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:27 -0400
Received: by mail-oi1-x231.google.com with SMTP id r14so537154oiw.12
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679921004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lVBWSjIdw3gkUFHTty+q6ErZT4MfbOFOY3bgWzhoIZw=;
 b=OENU0qlB/RsgfzhpkG1geJOfLzFXlmwTevOHTFakyxcuS4bpnsn98BFjAT1mupOmD/
 FKvJsV3zvY9B5kGXnRohGK5c9bagwu/8QSUkJJ+ZJ3gPgkAPNtr/GuBn0Nzl9pRc/Z7d
 +T+9avC5bmz4ZQxqoHZuN3HAxV5FBQ7z0+GBU4/fDpDILnlce6Nocqoxc6aiXB2sPwQV
 igE7zpBOzlU28+okKZxuV6+4mgKka19/2DJEqZMQwU1ojiPnDaq4QdPao2pLuDTx8cSo
 a9pJao88hqevs6jKt+bUOOXOJy6Sqz5jDmihi4puL86cExYXzxzpsIpRMTR2qVuY4A/1
 Y3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVBWSjIdw3gkUFHTty+q6ErZT4MfbOFOY3bgWzhoIZw=;
 b=kS3lwaCE2mNiVFIOaLmv2MG++9LRLBV25WA2rzVEcvFzRY43dK7jIlaGutw3lGb6sk
 oYm3iNV0i5ybtXUrP3XqL6UvJR1vStqQdAuHNH56aUCgshGgx0M3twV6opNTLG2c6E1m
 NCxcOLodFIJ/Xc36RpDqE5YpFyxNwpcoGqXT9DBaYyXMpbp4frwq7eMjsxiPtfrfSUBk
 Ely5O1nA47rtUpLKtVflwUuEvfy6lC3PkUeC6iNoPKiJCg50WCeOeiFxK0FXLKz48GeL
 qJY7FPsmy6ynNMMAqaJ7Ta1w/Nrlkay7LIGiykHIV8FkrAsVbN/eHovTJcTcs/fSpieA
 x+Jg==
X-Gm-Message-State: AO0yUKUJFkwIoBJyTW+ZCZF0ZFJg6BNpFK3Bk/UIJtnC/usO/TdtSNf4
 fdKkyLApT578D29Y6IZBPM28Iw==
X-Google-Smtp-Source: AK7set+kH6KE7H37jXsBBYt0Lvk4F9DW7FTdSogLzSC55hTeYanaOu56yBAwsvlr/aYR6IkjKipgUQ==
X-Received: by 2002:a54:4f03:0:b0:35e:1a0f:7dea with SMTP id
 e3-20020a544f03000000b0035e1a0f7deamr5252689oiy.12.1679921003875; 
 Mon, 27 Mar 2023 05:43:23 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 10/19] target/riscv: remove cpu->cfg.ext_m
Date: Mon, 27 Mar 2023 09:42:38 -0300
Message-Id: <20230327124247.106595-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 12:43:27 -0000

Create a new "m" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVM. Instances of cpu->cfg.ext_m and similar are
replaced with riscv_has_ext(env, RVM).

Remove the old "m" property and 'ext_m' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 65e4a76bae..9f4d8fe7e8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -811,13 +811,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
 
@@ -1094,7 +1094,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVE)) {
         ext |= RVE;
     }
-    if (riscv_cpu_cfg(env)->ext_m) {
+    if (riscv_has_ext(env, RVM)) {
         ext |= RVM;
     }
     if (riscv_has_ext(env, RVA)) {
@@ -1446,6 +1446,8 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVI, .enabled = true},
     {.name = "e", .description = "Base integer instruction set (embedded)",
      .misa_bit = RVE, .enabled = false},
+    {.name = "m", .description = "Integer multiplication and division",
+     .misa_bit = RVM, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1469,7 +1471,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1577,7 +1578,6 @@ static void register_cpu_props(Object *obj)
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


