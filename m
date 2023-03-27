Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvfo-0006Np-Kn
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfa-0005Zo-0j
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:33 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfY-00089y-7L
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:29 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 h22-20020a4ad756000000b0053e4ab58fb5so554685oot.4
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N83Eb6NHjLJiqBBYeloZ5hTyvHGRV8tjH3gLHZ8Gw7g=;
 b=F6MENLH8dfI8SDG2V4fszLTOVsz0pgZXR61QUazHoa1TDISyjyLDEoSCX+ZXqM99zi
 JFbdrBccvBrB2YzTYgPtQ1dV4qw7vv6+FJ9jIe9fzwPNJ6dWefyjelvBgBpN/PKn0iTQ
 1odP0p4/jR8P+fLpQItmyjaI0C5F/RNR9INw20FQ2uuDH85+xqDNyKQDh8ct00BQt9dO
 gekW9zzAoUSfgRE+icy5qqR2Con+YANM1xYH3QLz57nDlKOwQr3waZ1H7eAGiJ9PvTHH
 L6htIZ1uWfTU3x6RsssFZtoq4quiUAR/YwfdqYP9P99qRJG9qCIwPgUxrzTvlTKPF8/8
 boMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N83Eb6NHjLJiqBBYeloZ5hTyvHGRV8tjH3gLHZ8Gw7g=;
 b=6XrqZmad97v4Kprc8MT1BFziaxr64byIuaocT6HtfEmyiywyfl3U0tSSZ6iad6sfBM
 nDb+Iiv1Xs4TleDKEWm3GqldYLtvDKNS1BuCaexWgf2VwVnleRofRrJcgtubscCnW3DX
 tqBOSfTd+wZzsk6xQ3QqhNFy837jut7TE8B1ke3kzCzmIqlHPmTvgsHoV3+za/4wDbfv
 +vCgO8IXskhWWBf7vS6BtfncpayYf4L7wSLi2bgW2G08A5c7UKyEdILq1BBb9zo6S25A
 JNTwZpRtGk7sar+TdnFbJlOXU3op2Oh+NSQTOu1RVJVauahaF7mviVSyq3nNWh0/Kpfj
 4RBQ==
X-Gm-Message-State: AO0yUKW4KJTIW7zxyHhnRw39JU8Eu3GEpsdNVL7YTRTOJYif802upL7X
 kQcs8/Wj6Gxj05UzPJ4kD0eCuA==
X-Google-Smtp-Source: AK7set+HcjwL55dgUiP+LSFK+8VV93zKcPeO0ECMKrv/8jknHCPG86hlnvyqJkTdliufTjLXwCFoRQ==
X-Received: by 2002:a4a:45c7:0:b0:538:fc3b:f66c with SMTP id
 y190-20020a4a45c7000000b00538fc3bf66cmr7878905ooa.1.1679957427236; 
 Mon, 27 Mar 2023 15:50:27 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 11/19] target/riscv: remove cpu->cfg.ext_s
Date: Mon, 27 Mar 2023 19:49:26 -0300
Message-Id: <20230327224934.363314-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 22:50:34 -0000

Create a new "s" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVS. Instances of cpu->cfg.ext_s and similar are
replaced with riscv_has_ext(env, RVS).

Remove the old "s" property and 'ext_s' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 11 +++++------
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 67a7d518c1..768b0a79ca 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -402,7 +402,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 
     cpu->cfg.ext_g = true;
     cpu->cfg.ext_u = true;
-    cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -837,7 +836,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
@@ -849,7 +848,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
@@ -1109,7 +1108,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVC)) {
         ext |= RVC;
     }
-    if (riscv_cpu_cfg(env)->ext_s) {
+    if (riscv_has_ext(env, RVS)) {
         ext |= RVS;
     }
     if (riscv_cpu_cfg(env)->ext_u) {
@@ -1448,6 +1447,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVE, .enabled = false},
     {.name = "m", .description = "Integer multiplication and division",
      .misa_bit = RVM, .enabled = true},
+    {.name = "s", .description = "Supervisor-level instructions",
+     .misa_bit = RVS, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1471,7 +1472,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
@@ -1579,7 +1579,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7a42c80b7d..fc35aa7509 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_s;
     bool ext_u;
     bool ext_h;
     bool ext_j;
-- 
2.39.2


