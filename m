Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269D5C3ABB2
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 May 2025 18:45:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKLlO-0006WB-Ri; Wed, 28 May 2025 14:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKLlG-0006Ry-Gz
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 14:44:23 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKLlE-0000O2-Ai
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 14:44:22 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-5259331b31eso32131e0c.0
 for <qemu-riscv@nongnu.org>; Wed, 28 May 2025 11:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748457859; x=1749062659; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xvfwNtjb2BZpidyYY9f3GoOnOR8S7xgGDRa12AkpsY=;
 b=D0VmeCxo3yx+DpjDAn4t4d3O3J0rADAONCPDGlMXUAMuSzJ1gQ2TbTBgZs6RkcUtLi
 EtjFNLXr9qDp94hUsTCfnVcW8iCEshjzc0QqQtJrRI89XPVtcU4VNXqIP2LF0knW2U3O
 VmXDLnFXMPwnsgJMiLQHK2U6r40L0W8oddGQy01JD8xl5bh8zfNhMEosb2jnML+phWPu
 d3VwBrJ8+BYaVrwGUMMB5l42H33YHNNei/eq1td8suMKyOemUoLkbqXETXx/pXVoeGG9
 W8pXpNseXTRBb3Jok2l+nnTqSXvQcJTUkHUt4A1DI/QPYt1h3haOVkVIPGVuJ5wvSG5j
 qtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748457859; x=1749062659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xvfwNtjb2BZpidyYY9f3GoOnOR8S7xgGDRa12AkpsY=;
 b=PL+BN2ia/rcIPN4deA7+1Mbw6E/acNAp3qU1BKLoqmw6Eh1vVFoCABFHAHOnmnqepT
 VPfiVn4RbCaL+oMZ/VZQGgzbS6k/BEsZk5diJ5zWmdwG8AdVoy3uhGAoEqYcJt7723uI
 IJLx8mxuhbGVtzeDIYbBt1gjFIa0LmWNMX5yb1QRj5S/GKucrssEPsbTn0EMF4pwpjlA
 SJEei7O3GYm2nu97Vu1I6refDlNpxxQwP7prnb8sybS9pXMMZT/ssVxj02OcR2/v+ni7
 JKMXX0kROL/Z+Q+hXYqGipk8ih0w6vFYo1z0r/znM/CTr0A48M/SMqYyWoIX0oOvQI6y
 bl2A==
X-Gm-Message-State: AOJu0Yx7xFh/L2npAtJpHAwz4mdEnjPjbWeqwn+VYFEnZzKLAyYtWjVH
 XP4vjxxMNBS9WCYq4rq39fh+oPkMZBefvdPHLIZXndkgzDOg++6ztMpF+RvwmbOu9+0=
X-Gm-Gg: ASbGncsKnhCoIrxNZPqrvFsitvrxmRKK7XzGpbcIpqm+4rEMNyQL/HXM3T0RoZ1RjAO
 qSU7SYgfQiKWDMTN/+jH5AHAd/FkgNr49byIrIGYIrEn2iHrPgHU29VZgYGMVnO/L5kUDfkqMmD
 haeiglSZInvWBa0DrIP8CE6oDxiawECfG6l5r+nkxdYLJugXVEjmbw/4m3nIwNhv5ZmaZJLIiAB
 aqK2RDIzszPZmlEAF3MCsmPciDNR0tNGaK8vtlrA3QqfjGQL4ggJLh+X01rZqAHJ0Rl9ol6gpZE
 nvpKPh9jN0a9s2FA5UphWeeD0jVC046tH78DlL8P8XtzyT6OeH9GoQ==
X-Google-Smtp-Source: AGHT+IEctjboTfnWlSPUm5JNhoGK86EgFmpw9vg5pThxW1BrM8ElHLfFYHBIs97vOwNs7iC2/aWzkA==
X-Received: by 2002:a05:6122:d9e:b0:520:64ea:c479 with SMTP id
 71dfb90a1353d-52f2c5ae0damr13794226e0c.10.1748457859211; 
 Wed, 28 May 2025 11:44:19 -0700 (PDT)
Received: from grind.. ([191.255.35.190]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53066945971sm1568512e0c.30.2025.05.28.11.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 11:44:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, ajones@ventanamicro.com,
 bjorn@rivosinc.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/3] target/riscv/tcg: decouple profile enablement from
 user prop
Date: Wed, 28 May 2025 15:44:06 -0300
Message-ID: <20250528184407.1451983-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528184407.1451983-1-dbarboza@ventanamicro.com>
References: <20250528184407.1451983-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa2a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We have code in riscv_cpu_add_profiles() to enable a profile right away
in case a CPU chose the profile during its cpu_init(). But we're using
the user callback option to do so, setting profile->user_set.

Create a new helper that does all the grunt work to enable/disable a
given profile. Use this new helper in the cases where we want a CPU to
be compatible to a certain profile, leaving the user callback to be used
exclusively by users.

Fixes: fba92a92e3 ("target/riscv: add 'rva22u64' CPU")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
Tested-by: Björn Töpel <bjorn@rivosinc.com>
---
 target/riscv/tcg/tcg-cpu.c | 127 +++++++++++++++++++------------------
 1 file changed, 67 insertions(+), 60 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 857c625580..f8489d79d7 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1140,6 +1140,70 @@ static bool riscv_cpu_is_generic(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
 }
 
+static void riscv_cpu_set_profile(RISCVCPU *cpu,
+                                  RISCVCPUProfile *profile,
+                                  bool enabled)
+{
+    int i, ext_offset;
+
+    if (profile->u_parent != NULL) {
+        riscv_cpu_set_profile(cpu, profile->u_parent, enabled);
+    }
+
+    if (profile->s_parent != NULL) {
+        riscv_cpu_set_profile(cpu, profile->s_parent, enabled);
+    }
+
+    profile->enabled = enabled;
+
+    if (profile->enabled) {
+        cpu->env.priv_ver = profile->priv_spec;
+
+#ifndef CONFIG_USER_ONLY
+        if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
+            object_property_set_bool(OBJECT(cpu), "mmu", true, NULL);
+            const char *satp_prop = satp_mode_str(profile->satp_mode,
+                                                  riscv_cpu_is_32bit(cpu));
+            object_property_set_bool(OBJECT(cpu), satp_prop, true, NULL);
+        }
+#endif
+    }
+
+    for (i = 0; misa_bits[i] != 0; i++) {
+        uint32_t bit = misa_bits[i];
+
+        if  (!(profile->misa_ext & bit)) {
+            continue;
+        }
+
+        if (bit == RVI && !profile->enabled) {
+            /*
+             * Disabling profiles will not disable the base
+             * ISA RV64I.
+             */
+            continue;
+        }
+
+        cpu_misa_ext_add_user_opt(bit, profile->enabled);
+        riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
+    }
+
+    for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
+        ext_offset = profile->ext_offsets[i];
+
+        if (profile->enabled) {
+            if (cpu_cfg_offset_is_named_feat(ext_offset)) {
+                riscv_cpu_enable_named_feat(cpu, ext_offset);
+            }
+
+            cpu_bump_multi_ext_priv_ver(&cpu->env, ext_offset);
+        }
+
+        cpu_cfg_ext_add_user_opt(ext_offset, profile->enabled);
+        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
+    }
+}
+
 /*
  * We'll get here via the following path:
  *
@@ -1306,7 +1370,6 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     RISCVCPUProfile *profile = opaque;
     RISCVCPU *cpu = RISCV_CPU(obj);
     bool value;
-    int i, ext_offset;
 
     if (riscv_cpu_is_vendor(obj)) {
         error_setg(errp, "Profile %s is not available for vendor CPUs",
@@ -1325,64 +1388,8 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     }
 
     profile->user_set = true;
-    profile->enabled = value;
-
-    if (profile->u_parent != NULL) {
-        object_property_set_bool(obj, profile->u_parent->name,
-                                 profile->enabled, NULL);
-    }
-
-    if (profile->s_parent != NULL) {
-        object_property_set_bool(obj, profile->s_parent->name,
-                                 profile->enabled, NULL);
-    }
-
-    if (profile->enabled) {
-        cpu->env.priv_ver = profile->priv_spec;
-
-#ifndef CONFIG_USER_ONLY
-        if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
-            object_property_set_bool(obj, "mmu", true, NULL);
-            const char *satp_prop = satp_mode_str(profile->satp_mode,
-                                                  riscv_cpu_is_32bit(cpu));
-            object_property_set_bool(obj, satp_prop, true, NULL);
-        }
-#endif
-    }
-
-    for (i = 0; misa_bits[i] != 0; i++) {
-        uint32_t bit = misa_bits[i];
-
-        if  (!(profile->misa_ext & bit)) {
-            continue;
-        }
 
-        if (bit == RVI && !profile->enabled) {
-            /*
-             * Disabling profiles will not disable the base
-             * ISA RV64I.
-             */
-            continue;
-        }
-
-        cpu_misa_ext_add_user_opt(bit, profile->enabled);
-        riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
-    }
-
-    for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
-        ext_offset = profile->ext_offsets[i];
-
-        if (profile->enabled) {
-            if (cpu_cfg_offset_is_named_feat(ext_offset)) {
-                riscv_cpu_enable_named_feat(cpu, ext_offset);
-            }
-
-            cpu_bump_multi_ext_priv_ver(&cpu->env, ext_offset);
-        }
-
-        cpu_cfg_ext_add_user_opt(ext_offset, profile->enabled);
-        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
-    }
+    riscv_cpu_set_profile(cpu, profile, value);
 }
 
 static void cpu_get_profile(Object *obj, Visitor *v, const char *name,
@@ -1397,7 +1404,7 @@ static void cpu_get_profile(Object *obj, Visitor *v, const char *name,
 static void riscv_cpu_add_profiles(Object *cpu_obj)
 {
     for (int i = 0; riscv_profiles[i] != NULL; i++) {
-        const RISCVCPUProfile *profile = riscv_profiles[i];
+        RISCVCPUProfile *profile = riscv_profiles[i];
 
         object_property_add(cpu_obj, profile->name, "bool",
                             cpu_get_profile, cpu_set_profile,
@@ -1409,7 +1416,7 @@ static void riscv_cpu_add_profiles(Object *cpu_obj)
          * case.
          */
         if (profile->enabled) {
-            object_property_set_bool(cpu_obj, profile->name, true, NULL);
+            riscv_cpu_set_profile(RISCV_CPU(cpu_obj), profile, true);
         }
     }
 }
-- 
2.49.0


