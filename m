Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTyV-0001BB-PT
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyT-00018a-BC
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:41 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyP-0000gb-B1
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:40 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17aaa51a911so43228835fac.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+T787wtOE0aKK/i9r0lVaLXC3vz5Uj8Ub6gpP1wvpc=;
 b=SLbCBQ69U+qxBXQDw8MOYxVAPsdM/NiWvWllf7T9JK1ZfJO3+fn4srDJKyBGmLcwPU
 8/7a/UqsixM8tLBS8T2J2ywSGO8ky9DXU7MGJBLi5q1HwUY+KarpxfuV24FAP+owX8gE
 GFszm2oV4tIu6HguAHWdO/MlXow+19QldreKoJp8d95mC8NjkHfI4iOavFJaCt7kKxkS
 mxFQ175Hu+8NjNhydVLMu8AiY3FXYCyJdvhC0jJb14cy2JOxtpk/9O95x1qasXCurp+N
 RJMBA2rVKET1OBTILt0GgHdWbl8vjZ/FiT2Al1mY1TYjqPY4tnTSq5vnXwO33r7N/w5b
 /yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+T787wtOE0aKK/i9r0lVaLXC3vz5Uj8Ub6gpP1wvpc=;
 b=hhlU3lOM/CI/LhFz/w5L7DOF6o99v85C0iusABUvxLRrxDrJeqMc+CxUzUV2zjtbGE
 DiSHb28/0TN0+kjG3yHLsE2iE1TSpPBw6QUd49d5I2XB5qcWpZDH1IVV1Z64sNOCze16
 DI5B1u2HhrtIlIRARjxiu/1aZaD8Np1NjkPTnW7Ea/DeQR8Hig/kl3GELRkbJwbbZHl+
 WOQKBqZ3S/o9kWCH2fZUj7D9GQPHgq2yaFSYD1xuROl/05fx47HzRRvZHJuvFdQUbrs3
 CGnxpiXai9wAt5X1Lb3rLtARihViaUNbUv6dwAqq9suR5Q2uwQrykZ2vklBTo7P2FDmk
 3NJA==
X-Gm-Message-State: AAQBX9eO1JwPkiHf2+HS3WL1ILame/RY35xHRNzTgwEdvBeRJ0Qp2cP0
 DP9zp5ivE2OcM18SnrTRY4MwbA==
X-Google-Smtp-Source: AKy350bBE9AT8SirlNtzlBjD4CY64hopTMa3Venn4ROjpxttxnwJoG+8+wqSt+uKbbxKi38FlWvnSQ==
X-Received: by 2002:a05:6870:9687:b0:183:f65c:8c41 with SMTP id
 o7-20020a056870968700b00183f65c8c41mr947425oaq.15.1680804276431; 
 Thu, 06 Apr 2023 11:04:36 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:36 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 12/20] target/riscv: remove cpu->cfg.ext_s
Date: Thu,  6 Apr 2023 15:03:43 -0300
Message-Id: <20230406180351.570807-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:41 -0000

Create a new "s" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVS. Instances of cpu->cfg.ext_s and similar are
replaced with riscv_has_ext(env, RVS).

Remove the old "s" property and 'ext_s' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 11 +++++------
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 24640450c7..cded82ac7a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -408,7 +408,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 
     cpu->cfg.ext_g = true;
     cpu->cfg.ext_u = true;
-    cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -843,7 +842,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
@@ -855,7 +854,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
@@ -1168,7 +1167,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVC)) {
         ext |= RVC;
     }
-    if (riscv_cpu_cfg(env)->ext_s) {
+    if (riscv_has_ext(env, RVS)) {
         ext |= RVS;
     }
     if (riscv_cpu_cfg(env)->ext_u) {
@@ -1507,6 +1506,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVE, .enabled = false},
     {.name = "m", .description = "Integer multiplication and division",
      .misa_bit = RVM, .enabled = true},
+    {.name = "s", .description = "Supervisor-level instructions",
+     .misa_bit = RVS, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1530,7 +1531,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
@@ -1647,7 +1647,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 71540a33ec..8b8e541e5f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_s;
     bool ext_u;
     bool ext_h;
     bool ext_j;
-- 
2.39.2


