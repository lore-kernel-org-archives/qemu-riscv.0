Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvfo-0006O5-PF
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfd-0005hH-OK
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:33 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfc-0008HE-3N
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:33 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 l7-20020a4abe07000000b0053e1205c84bso1240016oop.9
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UH+fsF0fjfAAg2Z/GyLjSpbvXK6C6YzqkBLw1CrEY04=;
 b=iDxVkSf77E3S/N+9pc4/5yHDseyCp64uti+2Q8HE2uVEL0ff2zoJFhM0u/BxadlrCf
 7JUTZwybvRSDRLldlSkIfwO/qjEy8jcFytU20QiHjKQvfguZGb8aqtjg8hHg570DwZJZ
 66IdXQxmi6UBcEiMY758m+MHvkknPuiSL3Swc4EnCGGPkgp7vrSLUSwqMkkDq3OH81T/
 5ywzuRLZm+suBh+zoy/B4tqG+rc24r9GY/WFJMzw+8jxhivUYdv3MRQuQO8LdQyA34WN
 4yclDirPA1PmYjkl4oEL8kTjezidewscYV+5QiAARX9HVWoBGvYqsQKoaJSydjPHGRF1
 +Rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UH+fsF0fjfAAg2Z/GyLjSpbvXK6C6YzqkBLw1CrEY04=;
 b=ZjAtefeB5ip4YgRpnEBxPcLU+EzHucY5UuJzKtk3YD+V80Iq6Zo4lbp9MNtXqVUBE6
 u5IEDd/ZJ3MSIaIpnTBrjDTxh6h+eFWNd8c8h3W7b/8HISu0Y50Hql+8Z0ki28gMaPVE
 +eMheIm80gnDkC6comJXqbSFThBHdOfdXq2OlOjPTbJKs2Q7wLIHFPuazxNtgzKHjYLw
 8x501G+jzaBaaXq9jsHmavoTwhhaX75zWTOcyJ6vm6gtMPQxGdMavCUad3Jgel6Utsf4
 MTznyq0yUnN+liOccvXQ2xEoJMdqvyqi9WqHKk/jzJfP7V5eiYHOjidyzX0UKLvXq6Bb
 E4eg==
X-Gm-Message-State: AAQBX9dVdXUieiB0m+ES9s1QZWxehzxbJ4x/Ycwy9S/CJ/l1EI4GSjdu
 QEsPYj9RiKYwqEs1zsSxs6kkGA==
X-Google-Smtp-Source: AKy350ZF7JLIMk+17LYcqXj3sulwS9kho78a+M8WrSznKhhPfazMMZctCVVEI/ipJ+uPe+GWwm6xYw==
X-Received: by 2002:a4a:303:0:b0:53e:133e:28cf with SMTP id
 3-20020a4a0303000000b0053e133e28cfmr4822752ooi.1.1679957430954; 
 Mon, 27 Mar 2023 15:50:30 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 12/19] target/riscv: remove cpu->cfg.ext_u
Date: Mon, 27 Mar 2023 19:49:27 -0300
Message-Id: <20230327224934.363314-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2e.google.com
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
index 768b0a79ca..68233c8e89 100644
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
@@ -1449,6 +1448,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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


