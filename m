Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTyY-0001Cw-PC
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyX-0001CZ-G0
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:45 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyV-0000hk-MI
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:45 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-177b78067ffso43242949fac.7
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+m6bMfy/cyrt4lCC2IbuWnYLtXN0nBbEUV0AP0ycayo=;
 b=KmLnLi1305sEQuA4o1DojqZdFQLd5DegtjaNbLaTZnj7u2LndNKAcVts2vhqR9Hdzj
 wxeT2AB9lNDHb1g5QPm7/4VI5JPOhpdcCF8F11cTF0BZJTyJhH61ySyl1Vu12uxW4t4L
 gxOtMPtOlrtj+RHyFtTUqO7ughfljkbNIQfaWidgCVBybktqyq9+q0HSnWrhi1bH/N0b
 MwNbpTjRT0kdcBSCvoCArtttZI+iEKSGqk3gLVx6j70hlrqgHm0LW54wL3Xae71jVoDf
 udt89cGfuxTpRT7iZAZkx1LenDJt5PwNV6DLlO6PanfQVv/ak25MCorgg95aKghXU2Y3
 +ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+m6bMfy/cyrt4lCC2IbuWnYLtXN0nBbEUV0AP0ycayo=;
 b=klpB7NRPU2uSAYStii2fDpP8CflXxJGq9TFdlVNPqSSjcCiO77BRrhT3YR1jzbUUgR
 Yji9DszehlntBlfWSIR3EbJEtkLA+UaHcqOj6yMlVmzbSxCJBE9Xm+0XT1xdZwwWMRde
 +tz71jDEOpsCO0GC05mH9rR/rp1mpCrCme6jWfKcj+C6UXwq8dcfEpSn56/2zSEInua0
 gyqnFXU55b4Xq5ja/yRbbJjUYAzKL7XCwQ6qSBMrmSRwOBHoePRSW1zYDEFHlWGYxxcb
 UV+6r6qkgEsJT3RNSv3La5DIRPgki6xYpIUety2yAtmWy6pwyXqgLPHuXB91yKYm4w67
 JRsw==
X-Gm-Message-State: AAQBX9dM8uX/XHQvocjHlBMJlRMHbcvl8IEU7XnqoRMU5FNfGxsi7yrm
 p0l1BdXSBIwJ1+bLU5Aef20Cmg==
X-Google-Smtp-Source: AKy350ZFcHDR3xtFi9ZiOrSX9nj9S9JpgvBiqz9V5hrZVv+/U0bDvfypERtVG6RLdCoWR88Bmki/jQ==
X-Received: by 2002:a05:6870:5588:b0:17e:752f:2263 with SMTP id
 n8-20020a056870558800b0017e752f2263mr3647502oao.23.1680804282612; 
 Thu, 06 Apr 2023 11:04:42 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:42 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 14/20] target/riscv: remove cpu->cfg.ext_h
Date: Thu,  6 Apr 2023 15:03:45 -0300
Message-Id: <20230406180351.570807-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:45 -0000

Create a new "h" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVH. Instances of cpu->cfg.ext_h and similar are
replaced with riscv_has_ext(env, RVH).

Remove the old "h" property and 'ext_h' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9565495839..6291224905 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -847,13 +847,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1172,7 +1172,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVU)) {
         ext |= RVU;
     }
-    if (riscv_cpu_cfg(env)->ext_h) {
+    if (riscv_has_ext(env, RVH)) {
         ext |= RVH;
     }
     if (riscv_cpu_cfg(env)->ext_v) {
@@ -1509,6 +1509,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVS, .enabled = true},
     {.name = "u", .description = "User-level instructions",
      .misa_bit = RVU, .enabled = true},
+    {.name = "h", .description = "Hypervisor",
+     .misa_bit = RVH, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1533,7 +1535,6 @@ static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
@@ -1647,7 +1648,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
 
         /*
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 486061589e..823be82239 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_h;
     bool ext_j;
     bool ext_v;
     bool ext_zba;
-- 
2.39.2


