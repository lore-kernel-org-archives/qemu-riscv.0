Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmBq-00086W-Ie
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 08:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBo-00086B-HQ
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:08 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBm-0002Gg-Lz
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:08 -0400
Received: by mail-oi1-x22e.google.com with SMTP id bk5so6212376oib.6
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679920985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAcHpKaxiY6Az83ZJ4/BliDw22FGWTTkygO0Lj2z+Rg=;
 b=pHfaOPjMZVz0bVHOWSun6NGJl28E64QP3mLTB3LMb7fjLWxS9aQqQK4FSjTwtbeHXu
 RYOAdTEP0L0LZxaZXiYF6dYsMC3SimnQ+aVk+2YLXQNokkvlfUSnniW/vac9vNnbGoTB
 hS5iKHv+4BOAacdFVVjMzlniCOW0DH5sJXnSEXSxkpIu0VmidDU/j3MrRx7vI5Ti9xn+
 OstCtEfWQTbXThknymsP5mGuekwSADnOEzJWc3AjxQj/rJ8rwz7taLqWfgSnmJ0zW1nR
 gXQ9CkLEVhfckxcpV6JEpOUZgmK2BBL0A2JIDmRUx5JbtsoNgRcQlP/4Qd8qAeXWevyt
 7c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679920985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DAcHpKaxiY6Az83ZJ4/BliDw22FGWTTkygO0Lj2z+Rg=;
 b=TPiQomZlpYk9SWoM59iisHXoRxN1GwDUHZiZPdu583Iyzia9AmVmBhMnZOo7LkVs/F
 JTPM2ceIQ90gIis09pzhkyAE+Yvi3xaigXGnf6OzgDUpJA8pOGecM9hnaBEsgTLNDntM
 1ejJqqhbkjF2O8o0jCsGZEJJ3txUawISffIyQizCl/ucrXifuh/x/kG6InLqzxMDvZUN
 CeFV64u1RAvp7+44ApJbrW6G4ZtJ7AykSyxZXgtwtKnuO16EBCg2WqqKCNkzxsdrVxY/
 /+VonaYgYWmzz7BYXQy+ox091aRifxmPOvxu1QuryZo2YOnGm40rDXVeyJld6pmzxn6F
 JHsg==
X-Gm-Message-State: AO0yUKX2z+H2jR2H0pbzy+Um2mSCwneGcQiisSMMjSdVrm96E0qhLtoM
 8qgKi3n/IHSfxB8e9uWj+r3MzDHsBfIhOm4iFzs=
X-Google-Smtp-Source: AK7set88a7K9jTK0RhuSS0rLEnCAAkgMT9r7ZCOFYfc+GxfonmiQrLyws+6QEEilxshiFuXINoE5fA==
X-Received: by 2002:a54:4418:0:b0:387:5323:6aae with SMTP id
 k24-20020a544418000000b0038753236aaemr4826149oiw.27.1679920985605; 
 Mon, 27 Mar 2023 05:43:05 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:05 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 04/19] target/riscv: remove cpu->cfg.ext_a
Date: Mon, 27 Mar 2023 09:42:32 -0300
Message-Id: <20230327124247.106595-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 12:43:08 -0000

Create a new "a" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVA. Instances of cpu->cfg.ext_a and similar are
replaced with riscv_has_ext(env, RVA).

Remove the old "a" property and 'ext_a' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 16 ++++++++--------
 target/riscv/cpu.h |  1 -
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c33ba86085..d2484396c4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -813,13 +813,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                            cpu->cfg.ext_d &&
+                            riscv_has_ext(env, RVA) &&
+                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
-        cpu->cfg.ext_a = true;
         cpu->cfg.ext_f = true;
         cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
@@ -863,7 +862,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+    if ((cpu->cfg.ext_zawrs) && !riscv_has_ext(env, RVA)) {
         error_setg(errp, "Zawrs extension requires A extension");
         return;
     }
@@ -1101,7 +1100,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_m) {
         ext |= RVM;
     }
-    if (riscv_cpu_cfg(env)->ext_a) {
+    if (riscv_has_ext(env, RVA)) {
         ext |= RVA;
     }
     if (riscv_cpu_cfg(env)->ext_f) {
@@ -1437,7 +1436,10 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
-static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};
+static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
+    {.name = "a", .description = "Atomic instructions",
+     .misa_bit = RVA, .enabled = true},
+};
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 {
@@ -1463,7 +1465,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
-    DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
@@ -1577,7 +1578,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_a = misa_ext & RVA;
         cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..f703888310 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -422,7 +422,6 @@ struct RISCVCPUConfig {
     bool ext_e;
     bool ext_g;
     bool ext_m;
-    bool ext_a;
     bool ext_f;
     bool ext_d;
     bool ext_c;
-- 
2.39.2


