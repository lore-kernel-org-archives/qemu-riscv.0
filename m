Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvf7-0005Pz-A6
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvf6-0005Pi-AI
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:00 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvf4-0007PX-Fo
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:00 -0400
Received: by mail-oi1-x233.google.com with SMTP id y184so7627784oiy.8
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEqQoxZLH7dYfKrcPIHz/K3/m7SkKVG1VdgDo1LivtE=;
 b=jN18pdl25Mdi/VjxzLmido0rBQ/x9xPTyb5CN3iYJZpYBvnSKTAK87QV8Gil+Tvti2
 YSonmCuIrOEztc8pRmjuTWOpZkIgYLbuDesusyBM/ewdLQFOxotkNR475haJ6vOFqSet
 QNpmzO+g0liQDcuF0NR1yoOAP3mJdqJ1U2InmPqwOCw3G1Nr/BXwdFF4+JMLIDlJxmWT
 JNjq+oEq+Ieg/qQ0dwnzoXVJ5M4eM684VL5Ctzq61fYS8YTY32BU0AC65xixhqVicaGS
 X53g5jBV2Ls1K7yAei1Anq/v2QTNs6O411T7QDCDLOWhZC0ArhO57P4tDtK88pio7AHk
 I2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pEqQoxZLH7dYfKrcPIHz/K3/m7SkKVG1VdgDo1LivtE=;
 b=50Sp+VziOdMGcqni0AVfB71G6LoRUGIyEqEUnOurWrUoMnf5GusLXXEH70D5cp6L3W
 N6ckuXQobYSDHaVrVOKfl1VK9Ygvcj6m9C6j55S0gDxJqEkLKGCdokBPRBIeVDR2RSg1
 BG38aqwbB6zuKRH6Jof3XTXIDTPKwz6s24XR+dBSCQDUC8uUP1BqM7oq1h2FSJbmOFxM
 SBOfyQ0CDvAgUmC4jNhNooCXaTCcRTcY+GOszPx6QUmBp0qkA4rz6wAd3NHDwTzkQ1Qw
 mdsGVqrkE7fi1zkW6PcXeezW7+YBSBS5zGTH+jMl/bAu5bFsdPZMNFoiCBSX16cDvl9b
 +FAw==
X-Gm-Message-State: AO0yUKWJeocWy40iGjjW6OgLHPWsgi8CRaQqKXNL3Uyl0j14ClTJDzxr
 TMGjiDy1YvcdFUqZ0G7ETbmYHw==
X-Google-Smtp-Source: AK7set98bF1o1QWkZ4BgLZH/boBdhCn4PPuiiyyQK3yOnxGThQtY6LnAlUAlwSVR4XCBhXLltYuPNA==
X-Received: by 2002:a05:6808:1495:b0:387:4984:ea6b with SMTP id
 e21-20020a056808149500b003874984ea6bmr12039625oiw.12.1679957397253; 
 Mon, 27 Mar 2023 15:49:57 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:49:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 03/19] target/riscv: introduce
 riscv_cpu_add_misa_properties()
Date: Mon, 27 Mar 2023 19:49:18 -0300
Message-Id: <20230327224934.363314-4-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Mon, 27 Mar 2023 22:50:00 -0000

Ever since RISCVCPUConfig got introduced users are able to set CPU extensions
in the command line. User settings are reflected in the cpu->cfg object
for later use. These properties are used in the target/riscv/cpu.c code,
most notably in riscv_cpu_validate_set_extensions(), where most of our
realize time validations are made.

And then there's env->misa_ext, the field where the MISA extensions are
set, that is read everywhere else. We need to keep env->misa_ext updated
with cpu->cfg settings, since our validations rely on it, forcing us to
make register_cpu_props() write cpu->cfg.ext_N flags to cover for named
CPUs that aren't used named properties but also needs to go through the
same validation steps. Failing to so will make those name CPUs fail
validation (see c66ffcd5358b for more info). Not only that, but we also
need to sync env->misa_ext with cpu->cfg again during realize() time to
catch any change the user might have done, since the rest of the code
relies on that.

Making cpu->cfg.ext_N and env->misa_ext reflect each other is not
needed. What we want is a way for users to enable/disable MISA extensions,
and there's nothing stopping us from letting the user write env->misa_ext
directly. Here are the artifacts that will enable us to do that:

- RISCVCPUMisaExtConfig will declare each MISA property;

- cpu_set_misa_ext_cfg() is the setter for each property. We'll write
  env->misa_ext and env->misa_ext_mask with the appropriate misa_bit;
  cutting off cpu->cfg.ext_N from the logic;

- cpu_get_misa_ext_cfg() is a getter that will retrieve the current val
  of the property based on env->misa_ext;

- riscv_cpu_add_misa_properties() will be called in register_cpu_props()
  to init all MISA properties from the misa_ext_cfgs[] array.

With this infrastructure we'll start to get rid of each cpu->cfg.ext_N
attribute in the next patches.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 21c0c637e4..45a73f3079 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1394,6 +1394,69 @@ static void riscv_cpu_init(Object *obj)
 #endif /* CONFIG_USER_ONLY */
 }
 
+typedef struct RISCVCPUMisaExtConfig {
+    const char *name;
+    const char *description;
+    target_ulong misa_bit;
+    bool enabled;
+} RISCVCPUMisaExtConfig;
+
+static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
+    target_ulong misa_bit = misa_ext_cfg->misa_bit;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value) {
+        env->misa_ext |= misa_bit;
+        env->misa_ext_mask |= misa_bit;
+    } else {
+        env->misa_ext &= ~misa_bit;
+        env->misa_ext_mask &= ~misa_bit;
+    }
+}
+
+static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
+    target_ulong misa_bit = misa_ext_cfg->misa_bit;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    bool value;
+
+    value = env->misa_ext & misa_bit;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};
+
+static void riscv_cpu_add_misa_properties(Object *cpu_obj)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
+        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
+
+        object_property_add(cpu_obj, misa_cfg->name, "bool",
+                            cpu_get_misa_ext_cfg,
+                            cpu_set_misa_ext_cfg,
+                            NULL, (void *)misa_cfg);
+        object_property_set_description(cpu_obj, misa_cfg->name,
+                                        misa_cfg->description);
+        object_property_set_bool(cpu_obj, misa_cfg->name,
+                                 misa_cfg->enabled, NULL);
+    }
+}
+
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
@@ -1531,6 +1594,8 @@ static void register_cpu_props(Object *obj)
         return;
     }
 
+    riscv_cpu_add_misa_properties(obj);
+
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
-- 
2.39.2


