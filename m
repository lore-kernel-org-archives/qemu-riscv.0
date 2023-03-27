Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvfm-0006Hp-7J
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfg-0005p6-Nu
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:38 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvff-0007Sm-2R
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:36 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 o26-20020a4ad49a000000b0053964a84b0fso1602710oos.7
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09mt1iFgWAFBIcBlhAjlAJo1LnkrG2nDaqFjPIncSms=;
 b=N+TUleqJTI+92N3iwJsgZfARCNpiAnYfg+Omwb0Zybv6J+15aMaAdazWzcG09nvQ3m
 UgtadjxeNmr1+Vtgcajtn5G6sfRSzIVXNemej6CcYK5FT/7W01JUVF+jp0gfyGxBfETg
 1xp35peE2j+IT4r1CSpWSZs7ZQZKlPSDXoOkHrfkwXX06aY8QyircI8pdPkL4oB2Gujp
 78sbPQQS7lCa5pFi79iCOB2+x7+tqv/oCpgloqn64cxY5EZPdfQ87QupG3SaXSM9A1lu
 pf+YL+f2PmwACvN+im57FNQXLIjoDff9nEu1amJTRSUCffYwGydHwIgUoSEntuQ2+2eS
 iLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09mt1iFgWAFBIcBlhAjlAJo1LnkrG2nDaqFjPIncSms=;
 b=I7wF+hixKxU3GbMb8noq61gblV1orSLpXlDLnva6oR5veUR/nRX1PbMW0e0BqiSx8e
 EXeVqsk0biKKCOJqhNDrJEHAZ0sJm8tv9o2suQaSqTVM7GtSxgtqiPWfekuZGIXf5BPQ
 v+JihKqnSy1hTbRNmG5HkDUowoGsqimck+P8icZkzJmAGOQPFROPlH0Jk6W4odJ0JW5K
 p3YliRzqMQIthH4/8Z6Ib6FPXE2p1Nb4hg8q9fMWP9xEIttpoxq0XRj4271rcOGkeHam
 iv+B2b6+PEtOUn0sWyJI4QDx3d5y8OrMDMhGiZyARK34QCKXJlYMbdv8XiLRHo9Sn85S
 bWRQ==
X-Gm-Message-State: AO0yUKUMY52A8+9h+EHfqrnxJl+nmOffMwDRlKjDxTRz/f3+RTkU3Yrt
 Jo6qXwZSlqj83Mg8slfI6IO3Ug==
X-Google-Smtp-Source: AK7set+yF4OhedxLI66lQahXgLOzWWybk3ZgIF48stQt99kQ1ZST5S7jzbmlUbg08f62xjtYmcSq5g==
X-Received: by 2002:a4a:3356:0:b0:525:c83:2f94 with SMTP id
 q83-20020a4a3356000000b005250c832f94mr6529629ooq.4.1679957434480; 
 Mon, 27 Mar 2023 15:50:34 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 13/19] target/riscv: remove cpu->cfg.ext_h
Date: Mon, 27 Mar 2023 19:49:28 -0300
Message-Id: <20230327224934.363314-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2b.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 22:50:38 -0000

Create a new "h" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVH. Instances of cpu->cfg.ext_h and similar are
replaced with riscv_has_ext(env, RVH).

Remove the old "h" property and 'ext_h' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 68233c8e89..9fa7104801 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -841,13 +841,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVI)) {
+    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
     }
 
-    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
+    if (riscv_has_ext(env, RVH) && !riscv_has_ext(env, RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
@@ -1113,7 +1113,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVU)) {
         ext |= RVU;
     }
-    if (riscv_cpu_cfg(env)->ext_h) {
+    if (riscv_has_ext(env, RVH)) {
         ext |= RVH;
     }
     if (riscv_cpu_cfg(env)->ext_v) {
@@ -1450,6 +1450,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVS, .enabled = true},
     {.name = "u", .description = "User-level instructions",
      .misa_bit = RVU, .enabled = true},
+    {.name = "h", .description = "Hypervisor",
+     .misa_bit = RVH, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1474,7 +1476,6 @@ static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
@@ -1579,7 +1580,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
 
         /*
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7b98cf4dd7..f3cb28443c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_h;
     bool ext_j;
     bool ext_v;
     bool ext_zba;
-- 
2.39.2


