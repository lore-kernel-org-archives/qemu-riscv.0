Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmCE-0008Fj-EO
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 08:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCC-0008FS-HG
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:32 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCB-0002tn-0C
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:32 -0400
Received: by mail-oi1-x233.google.com with SMTP id q27so5472986oiw.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679921010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CX5TUXO30u9OEj//bxH1SGp4tY23FdOQO1o2JzGdBug=;
 b=hZ4n8rXxxEcBJNxyPbUApQgnmve1IiQ+U0/9IaObHzghuLm2k1jn0nh4rDmv4Mk7QB
 hwZltFt4tRjU7YRm+S0VkRIToNfGldSW+0rEdXM9PQT5doIxZoBNFi2Ks2ABHfghPuBt
 BTj7F3jVKzyEIgkJKO1y1X/PnkmIfoDlIqgT8fG0KyfLPxnyNHqhxiqwkGAYnIi7bv7U
 jnZXmL303dZ1XVZubmtyanU4XhtuJUomSQ9gLm5ap5kl/eeR/P7X9bXajiIpkF/Ra2e3
 DEACNUUHAURgAWmrtOo0KD1px2cQRe/ckRAWu14Lwh7SdrTRCxJAAKauJnQnqvuNhCQj
 UJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CX5TUXO30u9OEj//bxH1SGp4tY23FdOQO1o2JzGdBug=;
 b=V/0q9ojDRdTYjgPVP+XUyWy5npkEJRyJI9g/a3ZyauiFLoBl37sF8RrsGS7P61Dmdp
 OoAuplYU0bt4JL1N2Rzvp6ypIHUlfdhqkJeHqupDDB1XZhUEMqRNH98wlNhFM+XxhEj0
 X4sQtnyRbGJgt+zlRvROySezLhPgx666P2CglQNkR9BYfJTOOpoUQ+xqL1o3QPB3Y+5r
 wMJUW7Fed5iLmm1Ji9FHjDzCp2Q6v6Aavo5cFX0F+NfAFh4Jb7nGdjgKezDXOwsiFRhr
 HT0+Nk/DdwfdFDyxbIyCF6Kt3AT0NyywoQ+dsJNUh3pY3mqAJ/qcpA6RSB/PXFJqcnNs
 dQ7w==
X-Gm-Message-State: AO0yUKXXNqDLtWBDUTBoEBRGbQwFe/HaNAFMg7YIQ2uFyKiiNM5q9Q5e
 1eBePcy1JZitDt48MOGy2Su5LsbA4qa4nOdhJ/4=
X-Google-Smtp-Source: AK7set+JKkaszTFGpeQ7mTl1DYC5JLzEUC43UFUHNygtBasnCkLAcJ/5oBXDZx149I6V5ETBp7zfvg==
X-Received: by 2002:a05:6808:192:b0:386:ca93:7ada with SMTP id
 w18-20020a056808019200b00386ca937adamr5174561oic.57.1679921009842; 
 Mon, 27 Mar 2023 05:43:29 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:29 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 12/19] target/riscv: remove cpu->cfg.ext_u
Date: Mon, 27 Mar 2023 09:42:40 -0300
Message-Id: <20230327124247.106595-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 12:43:32 -0000

Create a new "u" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVU. Instances of cpu->cfg.ext_u and similar are
replaced with riscv_has_ext(env, RVU).

Remove the old "u" property and 'ext_u' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 9 ++++-----
 target/riscv/cpu.h | 1 -
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d657ad2fcf..12bc307992 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -401,7 +401,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_u = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -836,7 +835,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
+    if (riscv_has_ext(env, RVS) && !riscv_has_ext(env, RVU)) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
@@ -1111,7 +1110,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVS)) {
         ext |= RVS;
     }
-    if (riscv_cpu_cfg(env)->ext_u) {
+    if (riscv_has_ext(env, RVU)) {
         ext |= RVU;
     }
     if (riscv_cpu_cfg(env)->ext_h) {
@@ -1449,6 +1448,8 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVM, .enabled = true},
     {.name = "s", .description = "Supervisor-level instructions",
      .misa_bit = RVS, .enabled = true},
+    {.name = "u", .description = "User-level instructions",
+     .misa_bit = RVU, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1472,7 +1473,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
@@ -1579,7 +1579,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fc35aa7509..7b98cf4dd7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_u;
     bool ext_h;
     bool ext_j;
     bool ext_v;
-- 
2.39.2


