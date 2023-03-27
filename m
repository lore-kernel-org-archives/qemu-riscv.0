Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvfl-0006AQ-4Z
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfY-0005ZF-M8
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:29 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfV-0007PX-FC
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:28 -0400
Received: by mail-oi1-x233.google.com with SMTP id y184so7628494oiy.8
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fFBbPXuZjV6eddXwXT4KhzyORLANTgVnsa8jR4GuZjI=;
 b=CRJQmhblQghvhqXwttXWaXFeek/1yz2WotbdPRpTvse4gD8HbgELdX59FaaUz7mLtd
 m0f64BMfxXqDsBQBEcYqPN3E2yaBUNIDRrAvyH94mrjbvm5z5JMdZJNwhVYodWvH1FrT
 t4Msvq8VrE/qHwi6AFCZj7XC9DanaEWU6GMDdDWWGFUxZjGzhKPIOAq3b35aMDE4VH8G
 7xkHixzYPcocdi9NJioiUQADDCdXj24Srjb+EDTRuW+8o6fzAUwhGjNtXlWMWnl9mKRR
 C2BpAC5w2L/uqoJ0bycN7CAMfBlLV5V/faa2cG6utGDx1ncW3WsTW64IE15PjaAh45rq
 2Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fFBbPXuZjV6eddXwXT4KhzyORLANTgVnsa8jR4GuZjI=;
 b=L0bUQdBwqkIB6Xi5KhE4GNKbMWsbdK8qgijKvocYzo1UQB19fOSTAg2sxN1T492ONi
 HQszYIgqySpmV+vh7Z2xE8ncrn3u/oIOdY50vIwk9RsLyLbkhNciyTPJqQsfKU4oYLyx
 qJq23v2M5sd7Q2M3Y7thfaqHwdoTmCyVUFVP9hr3ONBPJkojBfLphyQNG6I8IL72Sx62
 Tk0oEc0clowro1GGPn6Cjd6SJNIMtgNTg9MF392qZvqSzNEC+WKdvG0Rx21d8rrvsKTm
 poS54dE14z+wANJXpN5sly/1rv9cCL9LOETMNdLXfO4EaaIFMUkbG0Nborety0hLf1O6
 LMNw==
X-Gm-Message-State: AO0yUKX130WJ96Hl3e3/ABWQOzxTrY6Oz15POopC73QWh5Wzj1MlFlIa
 3Oqc87Cg8EC59Yk8fsUETYPaVw==
X-Google-Smtp-Source: AK7set8B9zTJkfRtm1B8QkCAi294oogDPjxB1gCVp9tEbu8oGtdCDankEvU71m7WafQL3fsrOo54zg==
X-Received: by 2002:a05:6808:659:b0:384:4585:737f with SMTP id
 z25-20020a056808065900b003844585737fmr5874215oih.14.1679957423644; 
 Mon, 27 Mar 2023 15:50:23 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:22 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 10/19] target/riscv: remove cpu->cfg.ext_m
Date: Mon, 27 Mar 2023 19:49:25 -0300
Message-Id: <20230327224934.363314-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Mon, 27 Mar 2023 22:50:33 -0000

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
index 3b580eee9a..67a7d518c1 100644
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
@@ -1446,6 +1446,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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


