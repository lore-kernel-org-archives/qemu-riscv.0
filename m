Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvfj-0005yD-Ix
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfW-0005Yc-VI
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:28 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfH-0007hN-I5
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:18 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 p2-20020a056820044200b0053e5914a50fso341422oou.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aySN8GkXQTKl5kQc6i8ClQ5aGNCXNpIJAx+Xhhfuamk=;
 b=eRmeoNi3jyf0Tb7ZYfbnE/UyNqxGSbCsVO1dL+mLBP8FBZ1lvTNe5FQxABEo0lyL+X
 fVARkRY2LnZkBB538tJwqlNCO3Kqh611v4VxgADVHT6HRdJH4MdOKP4tmjDfZKuBjXUh
 e4cnxu235VMR7ddp5jD1+mISc48pPTuzWu6x32yd5dGC2aOt4GTjqQpLEgBHDTvlWfjT
 X+QotA5v65GaMTsmuMKmBafxoKmtRy1M8nHg4io0J0e9H6SVQ2tU9pyNcfNOwltEwqjj
 A4FX1gKPZ3Ph7LbNdyViYdobWkvxREv5+i5wqIdxqjKDDTaOLzmsEsQXAWmBvg6I/blX
 auGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aySN8GkXQTKl5kQc6i8ClQ5aGNCXNpIJAx+Xhhfuamk=;
 b=KXIrTFxST2OmRr0vTD9Vn9BcSoijWmseIds+lRyNQmd/05Krcq+vggzGhUwDdol9u0
 CgWkh2QOzx9fRRF7HV49TCzXLeAay64ACxlz6AUHNby7nAztyJ5KND/oeW8aoJdz1iw8
 eRBmngDyePljUG8VShH7oTFXW0pwM88YqNI+pvjQ8Zi4Oca/kjOo6Pf98cY7Fy/WhIv4
 vmKn2ls9yCs3Wzlv5uMBYfZvWYz8qB4oWHmNIud6GF+aMq3Q8nj2lgBw3TtYSPv9Cfuy
 drmmunB86x1V6UtgTPWoRuA1G5qjXy1qxp+Ewy3B7X7Cl/4cSQgeOi3Nw8mLxAsoJvwW
 drqQ==
X-Gm-Message-State: AO0yUKXUQfgJIHnTfJN2BC7V1wYpDaHpBqFvWeHM3IHisZVjfXlYT0aA
 UMUZ6a1PT2bFJ6O1Enk0umZMvP0Nt6hMw8SzuvA=
X-Google-Smtp-Source: AK7set+tYhlmDzG4Uo//B3MrWCcisSKVajpakKLR8CnwBROg9UeVvQO0lrrWRbdpSXN6d+GMNaHoLw==
X-Received: by 2002:a4a:334a:0:b0:525:59fd:fbe7 with SMTP id
 q71-20020a4a334a000000b0052559fdfbe7mr6524309ooq.2.1679957408893; 
 Mon, 27 Mar 2023 15:50:08 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 06/19] target/riscv: remove cpu->cfg.ext_d
Date: Mon, 27 Mar 2023 19:49:21 -0300
Message-Id: <20230327224934.363314-7-dbarboza@ventanamicro.com>
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

Create a new "d" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVD. Instances of cpu->cfg.ext_d and similar are
replaced with riscv_has_ext(env, RVD).

Remove the old "d" property and 'ext_d' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 13 ++++++-------
 target/riscv/cpu.h |  1 -
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ae60ff3e5d..fed697be9d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -813,13 +813,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
-                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
+                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
         cpu->cfg.ext_f = true;
-        cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -875,7 +874,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -895,7 +894,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zve32f = true;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d && !riscv_has_ext(env, RVD)) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
@@ -1105,7 +1104,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_f) {
         ext |= RVF;
     }
-    if (riscv_cpu_cfg(env)->ext_d) {
+    if (riscv_has_ext(env, RVD)) {
         ext |= RVD;
     }
     if (riscv_has_ext(env, RVC)) {
@@ -1440,6 +1439,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVA, .enabled = true},
     {.name = "c", .description = "Compressed instructions",
      .misa_bit = RVC, .enabled = true},
+    {.name = "d", .description = "Double-precision float point",
+     .misa_bit = RVD, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1467,7 +1468,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
-    DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1579,7 +1579,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_f = misa_ext & RVF;
-        cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c6dc24d236..e4cf79e36f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ struct RISCVCPUConfig {
     bool ext_g;
     bool ext_m;
     bool ext_f;
-    bool ext_d;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


