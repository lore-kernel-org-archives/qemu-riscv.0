Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmBo-00085k-6N
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 08:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBl-00084n-SI
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:05 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBj-0002AE-VL
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:05 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17ebba88c60so9103371fac.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 05:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679920982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jeg3GxSDxmmA0MBD21AJ7I14mC68S1GlN34RqLnYtvU=;
 b=Vwlj8mi9y92puZnB/cwjz3GttSugT8RYme541GySJeio5FhFulsWrqu2xY2EUbRWNy
 7vC1wUBRuzlimNzFudwNiJuvEDYy3CUpWATWEY9r8Q7muiRPmbTf9wQckbsx6F3aoOhy
 9JpLcTcNFJXJqTwMFYbVT8mcbdgm1b/ks1wd3WSzH4dO7M+jEzzXLc+Cw0K8B7p/OhcE
 0LHO2OYRWB1Dp1z6WB7sb+JkfHRAas5NQZuvLT/cdrymRC82bEmnNrJ6qZK3hAeOCI22
 E9JOIf/CfClJeUGLhEXF90I/mmp9XoP7FMY7F/Yj2f/Znp6j7W4UzMuf0moepGjENKTk
 r3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679920982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jeg3GxSDxmmA0MBD21AJ7I14mC68S1GlN34RqLnYtvU=;
 b=ZXbekIEuFJcfbkCvbx/DM4JfL3cKg4EpoTCcvq9n1m8gf90F3b0toztGzS2iFvC8A+
 adQw6BPuU647+thpgXi2EdoeiLe46+Wt+Qxvf+PZTIp1qxUr470nhqKTDbN7G5lB4BEf
 AqDb/D3jEQadW9DaDYQSjpyTgfL/CbLyR3NKvnyNAID2FJ7TOaKjjKIZhq8Z499YY1AR
 pYhN8BkZPmuJkuegRoP8KAtE0s03w5m4k/eLpBFkMu+YM9wjqQOCqudR9l9wgwdqdT7b
 XTClcxSUygK7vj27dqPgOF2QqiRVuN4QzLOG0YJgZjb5PxOJy1mVJy8AApu4VxhDBLRs
 /kJQ==
X-Gm-Message-State: AAQBX9di2ldGO5OSWnIDvcWIiUC1FmSYj83ucUSpDc99camXDqDfluOZ
 jaPZiddSwxXovD3jg5OjKN6DTA==
X-Google-Smtp-Source: AK7set/yEAZvOT9HwYaWzLS5CMps64wIa5Y6Sbj86nZvd3vH4ekwl9yY0yDu9c/oJ9zpP1w37ty8Jw==
X-Received: by 2002:a05:6870:d24f:b0:163:8b58:ab23 with SMTP id
 h15-20020a056870d24f00b001638b58ab23mr6910583oac.35.1679920982494; 
 Mon, 27 Mar 2023 05:43:02 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 03/19] target/riscv: introduce riscv_cpu_add_misa_properties()
Date: Mon, 27 Mar 2023 09:42:31 -0300
Message-Id: <20230327124247.106595-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Mon, 27 Mar 2023 12:43:06 -0000

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
index 21c0c637e4..c33ba86085 100644
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
+    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
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
+    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
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
+static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};
+
+static void riscv_cpu_add_misa_properties(Object *cpu_obj)
+{
+    int i;
+
+   for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
+        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
+        g_autofree char *name = g_strdup_printf("%s", misa_cfg->name);
+        g_autofree char *desc = g_strdup_printf("%s", misa_cfg->description);
+
+        object_property_add(cpu_obj, name, "bool",
+                            cpu_get_misa_ext_cfg,
+                            cpu_set_misa_ext_cfg,
+                            NULL, misa_cfg);
+        object_property_set_description(cpu_obj, name, desc);
+        object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL);
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


