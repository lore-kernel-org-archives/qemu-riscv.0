Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99023EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 13:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCKoq-0007it-U3; Thu, 22 Jun 2023 09:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKof-0007aj-Et
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:57:44 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKoU-00011N-4Y
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:57:41 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-55e4d40794cso3247618eaf.2
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687442243; x=1690034243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=POYC7O/ejSu1jUm6PcEB3228YJgTeVuox80nsDyJJvU=;
 b=Q3X/YEk553YnSaioow0hOqLqCF827hagKNvqNYXbizsoJ6aocJn9GQNGVwkGm6nWvr
 cLUnLBED3f96rfyfS+lg9zislFfvtsZpOwuDJ+LzWgheFiu75PLqWbPKvk7xntv1lQbe
 AvfJiqjU/a0WdOabnp5aRWGikQABKUB25NNyJhMrBXx4P8Z5qYERrOF9y+MCy+aFYec8
 bPEQcyyK/n/u+UFEvo6VAGLzuixcjcAk2AfmNrRAs6num59+2ZsLFcenP0f2KNKgON+i
 R7tQ5PcxSYqMrbvAxexTaLWw+6IbEaUhi7YO9ru12LwQt/hIhvw+mGWYJ6UTfoGJUHqe
 lUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687442243; x=1690034243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POYC7O/ejSu1jUm6PcEB3228YJgTeVuox80nsDyJJvU=;
 b=Y78vLAiscJSPjFMOaubD0YhxzoNPWVGbEtwHNZKp3DnyXC2pfvfGjjD0cXKXsyUMS0
 lTAa5YIjSHq94wf0GLc1Pw3uzhWLDrZLGxJ4SDCrjNjiPAGf7zG67i1l7nSuH/BZcL+b
 AU+XJ4XDUm66yPL+hBCOJHA5vIqxt3ph+39e/cs20ZPcsDCW1oWdXNZEuebhlId9ghf6
 eL2cAH7Dai8To7E18+Y0Al4tbHrIO2tftNPnROmCmZWdZIJywgq58izQ6uycHvxOLMQh
 A1o/PrSfUt0eANcpUiJqEop6dayRuzerlS8Yfbq3a/GXzmVj2MuHFs/rsNQhG4NNBfQc
 YWpA==
X-Gm-Message-State: AC+VfDyTt4+v1iBG1wyCzavSAbJP3jgjiWnVahfPPGpRHvBunhZI9d+5
 Ud+4ZEDc9Bg24I+eOK7ldEEXqQGBx2s7oiDUx+c=
X-Google-Smtp-Source: ACHHUZ6ZpICEbY6zmsW8HWyfB45FggdlLg7gZ6gZ0yiIQCrlAnEHeF+aaq+fS2w7BrovlG/j0gWIzw==
X-Received: by 2002:a4a:be18:0:b0:55e:429c:f021 with SMTP id
 l24-20020a4abe18000000b0055e429cf021mr8492979oop.9.1687442243382; 
 Thu, 22 Jun 2023 06:57:23 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a4aa446000000b00562f06fb5easm156677ool.11.2023.06.22.06.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 06:57:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 05/19] target/riscv/cpu.c: restrict 'marchid' value
Date: Thu, 22 Jun 2023 10:56:46 -0300
Message-ID: <20230622135700.105383-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622135700.105383-1-dbarboza@ventanamicro.com>
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

'marchid' shouldn't be set to a different value as previously set for
named CPUs.

For all other CPUs it shouldn't be freely set either - the spec requires
that 'marchid' can't have the MSB (most significant bit) set and every
other bit set to zero, i.e. 0x80000000 is an invalid 'marchid' value for
32 bit CPUs.

As with 'mimpid', setting a default value based on the current QEMU
version is not a good idea because it implies that the CPU
implementation changes from one QEMU version to the other. Named CPUs
should set 'marchid' to a meaningful value instead, and generic CPUs can
set to any valid value.

For the 'veyron-v1' CPU this is the error thrown if 'marchid' is set to
a different val:

$ ./build/qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,marchid=0x80000000
qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.marchid=0x80000000:
    Unable to change veyron-v1-riscv-cpu marchid (0x8000000000010000)

And, for generics CPUs, this is the error when trying to set to an
invalid val:

$ ./build/qemu-system-riscv64 -M virt -nographic -cpu rv64,marchid=0x8000000000000000
qemu-system-riscv64: can't apply global rv64-riscv-cpu.marchid=0x8000000000000000:
    Unable to set marchid with MSB (64) bit set and the remaining bits zero

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 33cc28acf1..4768dcdf49 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -38,11 +38,6 @@
 #include "tcg/tcg.h"
 
 /* RISC-V CPU definitions */
-
-#define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
-                             (QEMU_VERSION_MINOR << 8)  | \
-                             (QEMU_VERSION_MICRO))
-
 static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
@@ -1737,8 +1732,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
-    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
-
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
@@ -1885,6 +1878,56 @@ static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
+static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint64_t prev_val = cpu->cfg.marchid;
+    uint64_t value, invalid_val;
+    uint32_t mxlen = 0;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!dynamic_cpu && prev_val != value) {
+        error_setg(errp, "Unable to change %s marchid (0x%lx)",
+                   object_get_typename(obj), prev_val);
+        return;
+    }
+
+    switch (riscv_cpu_mxl(&cpu->env)) {
+    case MXL_RV32:
+        mxlen = 32;
+        break;
+    case MXL_RV64:
+    case MXL_RV128:
+        mxlen = 64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    invalid_val = 1LL << (mxlen - 1);
+
+    if (value == invalid_val) {
+        error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
+                         "and the remaining bits zero", mxlen);
+        return;
+    }
+
+    cpu->cfg.marchid = value;
+}
+
+static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    bool value = RISCV_CPU(obj)->cfg.marchid;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -1922,6 +1965,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
                               cpu_set_mimpid, NULL, NULL);
 
+    object_class_property_add(c, "marchid", "uint64", cpu_get_marchid,
+                              cpu_set_marchid, NULL, NULL);
+
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.41.0


