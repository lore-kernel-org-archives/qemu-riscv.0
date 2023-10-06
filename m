Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400AFE81DF4
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 13:24:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qokmU-00064j-IF; Fri, 06 Oct 2023 09:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmS-00064S-Ao
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:22:12 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmM-0003Dh-Dl
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:22:12 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c735473d1aso16475805ad.1
 for <qemu-riscv@nongnu.org>; Fri, 06 Oct 2023 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696598524; x=1697203324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KvKZS7XsbHTlH5mCfjOVY2NDos1DmofvmwtvjcTHu6A=;
 b=bh7knsF1aXub7txu/fKMpttiJ9GS+nRfCgIe251hmHUSmpp+/M7piGloHLEFWrt+9f
 lMwvXHCNDmWlJvNZ2StEShM3wg2Pg5FjnVS2QjrGB4U7Aplghnhd27423POc/ku2wCiv
 8tWOafeKGWWaiKqiISJgLW3UaG7ruDSmbE+9eucJoNhzIMVnRQEYPKNNkHfrCkTR2BjP
 4L2JwhMx3NCq85Th52MHceJhsXZzzrIspVgbvh5rgQFX/UEYNuiPlRs7nGlAt7XjRKiA
 lxjGVhqK4r4U9KQe296t7Wlz/X0jbCFoNRcuKikgyB3/LlvRc9KWe352fAwXVvMORq1c
 EnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598524; x=1697203324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KvKZS7XsbHTlH5mCfjOVY2NDos1DmofvmwtvjcTHu6A=;
 b=m+rqfMrFqMepZ1JUsV7NBWvO/cXSI2LW4PCsbuX0TXdeAbv48OHZKj4CReqDb4Hdbg
 FBhwbyPhBKu8Gfkm6MH5TbS70jj92EGm+ufc++JSIkqHles+WytuGaPEk6zFtzT3wXfq
 Rl+LZeLSHiNHC45uUtjQHA31xk/wj4dqW2AGKm90ywdRSQyh4PFmB/UEvJy1ml3Wm/Ev
 0cyC7SKBmcsNWeK8D2uAaJjCuGd9ltpZrn9YpI2yNEgMy1rv2oSqDp4YDCUoG+ZttUL4
 FBL3fnJUHJ+ycQttoEKEUvEGe5dt6dTi5NaiuH3v6xuCaEVSTi+/E+eUJxP32vHsr4tj
 vTxg==
X-Gm-Message-State: AOJu0YwvAMNW97N/LhRQldG0S+Dy8ki7m0xMQcgUaxoTpT9Qq17QlW0q
 rRpWhBUSVMIGpNaaFLQH5Mxc2w==
X-Google-Smtp-Source: AGHT+IHLN0pkchy8VcODabrbm1ux3O8JSc46uoLJ7NJawlp+1Smu0XOIhaXdFGsNS1m8OuTHVoNi3w==
X-Received: by 2002:a17:903:2348:b0:1c5:6dbc:7938 with SMTP id
 c8-20020a170903234800b001c56dbc7938mr8567430plh.69.1696598524177; 
 Fri, 06 Oct 2023 06:22:04 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170902c1cc00b001c60a548331sm3796669plc.304.2023.10.06.06.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:22:03 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 08/10] target/riscv/tcg: add riscv_cpu_write_misa_bit()
Date: Fri,  6 Oct 2023 10:21:32 -0300
Message-ID: <20231006132134.1135297-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
---
 target/riscv/tcg/tcg-cpu.c | 44 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 58de4428a9..b1e778913c 100644
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
@@ -700,20 +714,14 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
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
@@ -757,7 +765,6 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
  */
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 {
-    CPURISCVState *env = &RISCV_CPU(cpu_obj)->env;
     bool use_def_vals = riscv_cpu_is_generic(cpu_obj);
     int i;
 
@@ -778,13 +785,8 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
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


