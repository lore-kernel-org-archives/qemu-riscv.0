Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9175DC0032E
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 22:40:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtyAO-00042A-F7; Fri, 20 Oct 2023 18:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtyAN-000420-JZ
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 18:40:27 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtyAC-0007k3-Dx
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 18:40:27 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1cac925732fso9029595ad.1
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 15:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697841615; x=1698446415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38V46/Na8GbB2MFByOT/BTnEIfG+mdTlZvxewyQn28Q=;
 b=gBxwqO9l6uuz2Q0HhhARNChPjOF41Ie2xcTt/2JISHnBMHc7hzxDYmnjH0B2mzP+XD
 TLbOxbUkDh36K0BOhLib74NdZ2LsLPSYAr7WKj+Jpe5++sZ3KhgsGkfpPROB1mTMrZlX
 AorEWLqf8XnZ0MSBt7/B3MmFP7v4Yey5n5FVbuQqTk1NFOlAMv0FwQkNbdBEK+7EobBV
 uARi296FHiX2pFcWreyJMWd3J10F5XgU7JC4RS5ngEotRPjCaK1TCmCnTgkomU1GMVfn
 hKTTYFb4QAOWHxxjbUQoJ+ZLVMRys1DJOzITyPEeAEaEx6QU6pIRDzXgrADrmoGLEjRt
 cqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697841615; x=1698446415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=38V46/Na8GbB2MFByOT/BTnEIfG+mdTlZvxewyQn28Q=;
 b=eq6DkR4q0u/W1TgW8gs+PVYdmuRBlvBp6XlAsTvXhRwrLg4L8i9B+1SS4VcI+/u/w/
 4GmFdaHff5I2mZzEb/0LH5DuIwdxz71qIhpgZhf9pRE4XPlkXiJsJw4T9FyX3npfgDkB
 lz9us7Lg1L9SRe+tQ4AQDzoRBuaepHCd8Bd60Rrm98xU6BvC8mlyXP5LAK9J+6OPr6pS
 6ST1l4Gw5s7VP8QQ74ZXg+zurMJUTP0b5ePQR1T/9IUZRKw4t1zipszRrkftORl5bo79
 8C4CS8y3wnBfueVK/h35c1fN6ktMNOEFVOsKq+oRfhacpqpFHRF/PsLSDbbWiuHYpmV9
 qFZQ==
X-Gm-Message-State: AOJu0YzDWLOkyfAwWKt0gVR9xIQ1MC9Kat+Fj8soD3pM1NDzie9RofeA
 ccDaqqylJT8eRvCD2ooO9OGl+w==
X-Google-Smtp-Source: AGHT+IFUqHYwoaIdUezwsD1ERcTJFThr2I+ArE/8aScKSt8svz0lGRsqL+AEdnPG0dwui8hIvSBRKg==
X-Received: by 2002:a17:903:280b:b0:1ca:86b:7ed3 with SMTP id
 kp11-20020a170903280b00b001ca086b7ed3mr2635469plb.40.1697841615102; 
 Fri, 20 Oct 2023 15:40:15 -0700 (PDT)
Received: from grind.. ([177.45.186.249]) by smtp.gmail.com with ESMTPSA id
 h1-20020a170902704100b001c61921d4d2sm1992373plt.302.2023.10.20.15.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 15:40:14 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 5/6] target/riscv/tcg: add riscv_cpu_write_misa_bit()
Date: Fri, 20 Oct 2023 19:39:50 -0300
Message-ID: <20231020223951.357513-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020223951.357513-1-dbarboza@ventanamicro.com>
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We have two instances of the setting/clearing a MISA bit from
env->misa_ext and env->misa_ext_mask pattern. And the next patch will
end up adding one more.

Create a helper to avoid code repetition.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/tcg-cpu.c | 44 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 59b75a14ac..ba11d0566d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -42,6 +42,20 @@ static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
                                  GUINT_TO_POINTER(ext_offset));
 }
 
+static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
+                                     bool enabled)
+{
+    CPURISCVState *env = &cpu->env;
+
+    if (enabled) {
+        env->misa_ext |= bit;
+        env->misa_ext_mask |= bit;
+    } else {
+        env->misa_ext &= ~bit;
+        env->misa_ext_mask &= ~bit;
+    }
+}
+
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
                                           const TranslationBlock *tb)
 {
@@ -680,20 +694,14 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value) {
-        if (!generic_cpu) {
-            g_autofree char *cpuname = riscv_cpu_get_name(cpu);
-            error_setg(errp, "'%s' CPU does not allow enabling extensions",
-                       cpuname);
-            return;
-        }
-
-        env->misa_ext |= misa_bit;
-        env->misa_ext_mask |= misa_bit;
-    } else {
-        env->misa_ext &= ~misa_bit;
-        env->misa_ext_mask &= ~misa_bit;
+    if (value && !generic_cpu) {
+        g_autofree char *cpuname = riscv_cpu_get_name(cpu);
+        error_setg(errp, "'%s' CPU does not allow enabling extensions",
+                   cpuname);
+        return;
     }
+
+    riscv_cpu_write_misa_bit(cpu, misa_bit, value);
 }
 
 static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
@@ -737,7 +745,6 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
  */
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 {
-    CPURISCVState *env = &RISCV_CPU(cpu_obj)->env;
     bool use_def_vals = riscv_cpu_is_generic(cpu_obj);
     int i;
 
@@ -758,13 +765,8 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
                             NULL, (void *)misa_cfg);
         object_property_set_description(cpu_obj, name, desc);
         if (use_def_vals) {
-            if (misa_cfg->enabled) {
-                env->misa_ext |= bit;
-                env->misa_ext_mask |= bit;
-            } else {
-                env->misa_ext &= ~bit;
-                env->misa_ext_mask &= ~bit;
-            }
+            riscv_cpu_write_misa_bit(RISCV_CPU(cpu_obj), bit,
+                                     misa_cfg->enabled);
         }
     }
 }
-- 
2.41.0


