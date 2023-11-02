Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7760C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:46:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygRd-0006pM-3e; Thu, 02 Nov 2023 18:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRI-0006UO-1t
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:28 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRG-0003Pe-9n
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:23 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5b31c5143a0so17989757b3.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965121; x=1699569921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeIpVV+xwLYJejpYC6ocOxy0ApoeLk6Pw/Epuw/aRd4=;
 b=LtLsUBIUGJ6pKSlRHnNaeCgwIR6Mo870UEvTOHxruRN9w/DCh8oDzWHddeVEBCzajq
 AUweaJl3FjLPB9jhVCLBnuK/j/ow3VhBDNgS22twRwwDBCuR9pdkxLn7JahtUvFf/2qd
 zr4wcAE6HJ6/9WSQ9wxHPvHxbS428TsTL+yWKaxSg9KiyyEUwwqUdkCbFMesn6aL4XmQ
 sGYo+av8kxQJhu2FvOpInuOL1FTDKIFZrgm5i1EyfhqgIhBeqbqKx+2W3kb3KsQfDMRj
 lVBFXyAEn2OzFm27JVbT/km0HSsZz9LHiKy0M15Aq7Iqqs5+ssuF88QQVFaEu+engfLd
 UXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965121; x=1699569921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WeIpVV+xwLYJejpYC6ocOxy0ApoeLk6Pw/Epuw/aRd4=;
 b=E38Tj0lZoWRsV0vqJvbIBBLWiMgt9cqIRevX5Ssf9S4LcXOiyq+yDwC6IxZk2NVGza
 ZM8r2TSHzoXuevRNxVOOadRNlEol9hoyrkq6q/+kt9/o/QB2H2MVHDq2Sb5TVo2rhddL
 xBCbNFaJbKJSg5CvBDdjwwTgPtkQcprgo58YCN4zcwHmd4kOWtVwzrZZDdRXiVKXHb9b
 yAyrPD0ps9d7EPG9ck3aNXcv5Gwu1+NHZUk4S8Qh/pwiTiu++VJFCnS/54VFV/htzhVP
 b+CDPFtz6JVXtIMiaj9KKx+7R9u1/Wzx2BhEk0eU4GIY8ET4HnozLa84laY5GBr7RFSk
 8NLg==
X-Gm-Message-State: AOJu0YxWdugCEaqACZZH3WeLwikwxT1cQoGmcp4qslYVugQFYDkylG1X
 yWwQvVqnIDdSJdRSU4nNwqNnDQ==
X-Google-Smtp-Source: AGHT+IHqhHkPIs2zxLPQjXn9aqig/RUNM8jcX9EOH/qxINduy57tr7QMJFNRS6Ey2HMkVpNhhDOJWQ==
X-Received: by 2002:a0d:d48a:0:b0:5ad:4975:c860 with SMTP id
 w132-20020a0dd48a000000b005ad4975c860mr1217016ywd.39.1698965121414; 
 Thu, 02 Nov 2023 15:45:21 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:45:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 12/19] target/riscv/tcg: add riscv_cpu_write_misa_bit()
Date: Thu,  2 Nov 2023 19:44:38 -0300
Message-ID: <20231102224445.527355-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1129.google.com
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

We have two instances of the setting/clearing a MISA bit from
env->misa_ext and env->misa_ext_mask pattern. And the next patch will
end up adding one more.

Create a helper to avoid code repetition.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index c1f203bf34..d80f72a9da 100644
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
@@ -801,13 +815,9 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
              */
             env->priv_ver = PRIV_VERSION_1_12_0;
         }
-
-        env->misa_ext |= misa_bit;
-        env->misa_ext_mask |= misa_bit;
-    } else {
-        env->misa_ext &= ~misa_bit;
-        env->misa_ext_mask &= ~misa_bit;
     }
+
+    riscv_cpu_write_misa_bit(cpu, misa_bit, value);
 }
 
 static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
@@ -851,7 +861,6 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
  */
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 {
-    CPURISCVState *env = &RISCV_CPU(cpu_obj)->env;
     bool use_def_vals = riscv_cpu_is_generic(cpu_obj);
     int i;
 
@@ -872,13 +881,8 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
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


