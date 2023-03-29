Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZcR-0004tf-Bf
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcO-0004jV-Vb
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:52 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcN-0001C8-Cl
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:52 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 o26-20020a4ad49a000000b0053964a84b0fso2547858oos.7
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7M1fUNGDTOy8VNRnwNxoGRai0RYY9nTu1neYsYHLcVI=;
 b=UkhgaX1vSe6JxmzzzCMm/jt/Dpx3M9rRDTEyM8hHcK0kiOaIzuJSV0LnJ8raAThPS1
 +zYZWUy/EshtmUisehCA6ffi1KS9IiMdMMMZpNqGUPaJTJrdT9STu4Gs+CqlHaextLqI
 ZAleJQhiqWyTUaTgr6W5p+75VYgFESwQZM5aiCd2PKqJBoAPuW8mefGjFVaKZK6B3ATM
 wXCXNSrluLldLOM1UAB6PWQgW4bLONXPensLwL1VA9IrzrFoa3St/FvhLGyaSCfsMFX5
 zQFTzZK0ky1+a9FEPR5ZYfXgFKFUfXTndpWnThPWswLhEQ8R+mmUG6WAUcwwdO+XdB6l
 48pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7M1fUNGDTOy8VNRnwNxoGRai0RYY9nTu1neYsYHLcVI=;
 b=XgdRhLCdsgw25RyIxOavyBv84h5VkS1QLql3tVBWPjOgYLURHnNlK8eQLtrRGZUI09
 Ww4yRKGUZTY1Ns3DvSnSlLPNceXR6a7Yvq/IShG5/JMxnCuThfJJcmcTdxxj14d4T6Rc
 ZhA7LJIyabruNjQpI/jPEzW5EBBBNsjqthSsW1xUOXPX46PbcSBrGS00LXjMo8HM+xwN
 RxRfMINgLdFVSuPL+gyiY90RlI7l53Sc2wuwrDLMJDLH/ALNrP3j5TKgpXopIHO2GR3x
 e/79XzAIwB2tGVNqTF0ES1c0L6XTPLRwcAYV6lbbCm77rMurEqkFL4/MA8nyJbg6nwI6
 h9fQ==
X-Gm-Message-State: AO0yUKUkSVjfxeXRXdbDtjeM10ogi/mQ8iUpUNmdOnGl644y0olBElkz
 prS3qdjrH6xQkjrpi9/LFDdNxQ==
X-Google-Smtp-Source: AK7set8zzAwXmB7EPWYOHuKnXig2p4UBxa/hEbf7TUDGFNBEtDTq0B70iduAhKP3c6GYqHQlb8fRRg==
X-Received: by 2002:a4a:4951:0:b0:53b:691c:43f9 with SMTP id
 z78-20020a4a4951000000b0053b691c43f9mr9925564ooa.2.1680110990439; 
 Wed, 29 Mar 2023 10:29:50 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 14/20] target/riscv: remove cpu->cfg.ext_h
Date: Wed, 29 Mar 2023 14:28:57 -0300
Message-Id: <20230329172903.636383-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc34.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:53 -0000

Create a new "h" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVH. Instances of cpu->cfg.ext_h and similar are
replaced with riscv_has_ext(env, RVH).

Remove the old "h" property and 'ext_h' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a72bc651cf..76dcf26f6c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -840,13 +840,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1112,7 +1112,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVU)) {
         ext |= RVU;
     }
-    if (riscv_cpu_cfg(env)->ext_h) {
+    if (riscv_has_ext(env, RVH)) {
         ext |= RVH;
     }
     if (riscv_cpu_cfg(env)->ext_v) {
@@ -1449,6 +1449,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVS, .enabled = true},
     {.name = "u", .description = "User-level instructions",
      .misa_bit = RVU, .enabled = true},
+    {.name = "h", .description = "Hypervisor",
+     .misa_bit = RVH, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1473,7 +1475,6 @@ static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
@@ -1578,7 +1579,6 @@ static void register_cpu_props(Object *obj)
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


