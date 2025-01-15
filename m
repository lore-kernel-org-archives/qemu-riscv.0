Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4702FC02180
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:45:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tY8Me-000855-IS; Wed, 15 Jan 2025 13:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8Mc-00083z-P1
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:39 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8Mb-00037U-4T
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:38 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5f8befb03d0so13312eaf.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 10:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736966616; x=1737571416; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CzmEArjLiVmocefSg9osSrzLAYi0GSzBGOKbwgq1rK8=;
 b=Up7rg+Z8PGXey/6Nk9xz7CtVgX6lxip8bOFL4oFuZEbHntmUFBowZuVsJICUpaTfGh
 bLgB9u6x3grAThY6mDkPOY8IbjkWSiET1vCSg4CoKJj2jfCZuqCwz24DbwrEdy+w9X2f
 /328nPKVnFZlMSu4luQZ9zwHCwHak9HTmwEJqSygFEpK1WrF5t7EtXVROVuHbMxC/C0c
 vjexN/cvwFcJSQNM0dxIt82D7CZngP8WJ3m8F4VYPkd55E4s3m0EnBcBhzC/hwI+USqw
 WsadmcYpAvEvW1NelebsPu6de2a8170LF/jKgCAg8lJwUayrEN7vk2uV0oNk2sVQY/Jq
 G4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736966616; x=1737571416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CzmEArjLiVmocefSg9osSrzLAYi0GSzBGOKbwgq1rK8=;
 b=FXChNQORMVAvlFCfMrxzDHpGiQayXtreYyIsKWAI2Bika166ul0HlU3O2Iik79rihl
 QI19aZbWtHOEbdaAvKjECRdbj5PNIRmX6mVTr4qE/+XF+2jOnNuJfAB7zu/GqZF2bGHb
 vKsDBLUYOcrqPV8jRk3gBmx9JyoyK5dz52ZvFGmTLc3GlhHUvv5bx2n2RW46WRrH3UV/
 rb2wG/D0SG4q90emqICx3+GqhEaPaVXpobsf01QddG5k5t6miK9l/oaZbaXNi+XKjGOA
 31wFFnbVWiMh0oWdDEPLAX4MhmfeLuGF+CBz/YvQ7lnLSsZJofQ7wgOzjlCUcTP9sYdR
 zuUw==
X-Gm-Message-State: AOJu0Yx4dWe013dPo8M0SDAMDPjkntaeKgMTytj5TDtqI8fA9Bo0BNW7
 fZqpTdcwoUkqOOBdsAkfKWUcIH3IGyIfySZRmTo6GTeDrLxPfDAs/V1Ytos1ZF4=
X-Gm-Gg: ASbGncsrp055EPy41wR0rjtXpjbznswjiiyYVvHLKis/HTa5udGYFBVMeedk3rgGCxP
 7wGDk6zBGmlE47/6Ny/kaJvWOH+KVVb2Skm6JDkRwblrYzv5RmWJDYsOjVPaniPPctr7JlEiWsw
 s1FwO1uJavQj8h8TpyuSYs4SiRtR4vei+uzt3bVx7eDnCETWZ+HJfMKX0syun5DaX8JCZspiT+m
 sJog5ZOsCVuihDV0aqv0VczkEsNER4+x+pLTAqLVBscwtMiSCwk+jP7VTw=
X-Google-Smtp-Source: AGHT+IFqJCie2fDPyrZYbYkmeo6t/lockk0lT9Wd5/eYzi+IMRdYEdrtbFsMSqjLPtiA+g7R219wIQ==
X-Received: by 2002:a05:6870:610b:b0:27b:61df:2160 with SMTP id
 586e51a60fabf-2aa0690ed8cmr19136737fac.31.1736966615869; 
 Wed, 15 Jan 2025 10:43:35 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ad80a5cb64sm6539196fac.47.2025.01.15.10.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:43:35 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 3/6] target/riscv: add profile u_parent and s_parent
Date: Wed, 15 Jan 2025 15:43:13 -0300
Message-ID: <20250115184316.2344583-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115184316.2344583-1-dbarboza@ventanamicro.com>
References: <20250115184316.2344583-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2c.google.com
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

The current 'parent' mechanic for profiles allows for one profile to be
a child of a previous/older profile, enabling all its extensions (and
the parent profile itself) and sparing us from tediously listing all
extensions for every profile.

This works fine for u-mode profiles. For s-mode profiles this is not
enough: a s-mode profile extends not only his equivalent u-mode profile
but also the previous s-mode profile. This means, for example, that
RVA23S64 extends both RVA23U64 and RVA22S64.

To fit this usage, rename the existing 'parent' to 'u_parent' and add a
new 's_parent' attribute for profiles. Handle both like we were doing
with the previous 'parent' attribute, i.e. if set, enable it. This
change does nothing for the existing profiles but will make RVA23S64
simpler.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         |  6 ++++--
 target/riscv/cpu.h         |  3 ++-
 target/riscv/tcg/tcg-cpu.c | 35 ++++++++++++++++++++++++++---------
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6fb4d5f374..e215b1004d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2349,7 +2349,8 @@ static const PropertyInfo prop_marchid = {
  * doesn't need to be manually enabled by the profile.
  */
 static RISCVCPUProfile RVA22U64 = {
-    .parent = NULL,
+    .u_parent = NULL,
+    .s_parent = NULL,
     .name = "rva22u64",
     .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVB | RVU,
     .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
@@ -2381,7 +2382,8 @@ static RISCVCPUProfile RVA22U64 = {
  * The remaining features/extensions comes from RVA22U64.
  */
 static RISCVCPUProfile RVA22S64 = {
-    .parent = &RVA22U64,
+    .u_parent = &RVA22U64,
+    .s_parent = NULL,
     .name = "rva22s64",
     .misa_ext = RVS,
     .priv_spec = PRIV_VERSION_1_12_0,
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 97713681cb..986131a191 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,7 +81,8 @@ const char *riscv_get_misa_ext_description(uint32_t bit);
 #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
 
 typedef struct riscv_cpu_profile {
-    struct riscv_cpu_profile *parent;
+    struct riscv_cpu_profile *u_parent;
+    struct riscv_cpu_profile *s_parent;
     const char *name;
     uint32_t misa_ext;
     bool enabled;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 48be24bbbe..c060b65fbc 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -713,13 +713,29 @@ static bool riscv_cpu_validate_profile_satp(RISCVCPU *cpu,
 }
 #endif
 
+static void riscv_cpu_check_parent_profile(RISCVCPU *cpu,
+                                           RISCVCPUProfile *profile,
+                                           RISCVCPUProfile *parent)
+{
+    const char *parent_name;
+    bool parent_enabled;
+
+    if (!profile->enabled || !parent) {
+        return;
+    }
+
+    parent_name = parent->name;
+    parent_enabled = object_property_get_bool(OBJECT(cpu), parent_name, NULL);
+    profile->enabled = parent_enabled;
+}
+
 static void riscv_cpu_validate_profile(RISCVCPU *cpu,
                                        RISCVCPUProfile *profile)
 {
     CPURISCVState *env = &cpu->env;
     const char *warn_msg = "Profile %s mandates disabled extension %s";
     bool send_warn = profile->user_set && profile->enabled;
-    bool parent_enabled, profile_impl = true;
+    bool profile_impl = true;
     int i;
 
 #ifndef CONFIG_USER_ONLY
@@ -773,12 +789,8 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu,
 
     profile->enabled = profile_impl;
 
-    if (profile->parent != NULL) {
-        parent_enabled = object_property_get_bool(OBJECT(cpu),
-                                                  profile->parent->name,
-                                                  NULL);
-        profile->enabled = profile->enabled && parent_enabled;
-    }
+    riscv_cpu_check_parent_profile(cpu, profile, profile->u_parent);
+    riscv_cpu_check_parent_profile(cpu, profile, profile->s_parent);
 }
 
 static void riscv_cpu_validate_profiles(RISCVCPU *cpu)
@@ -1181,8 +1193,13 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     profile->user_set = true;
     profile->enabled = value;
 
-    if (profile->parent != NULL) {
-        object_property_set_bool(obj, profile->parent->name,
+    if (profile->u_parent != NULL) {
+        object_property_set_bool(obj, profile->u_parent->name,
+                                 profile->enabled, NULL);
+    }
+
+    if (profile->s_parent != NULL) {
+        object_property_set_bool(obj, profile->s_parent->name,
                                  profile->enabled, NULL);
     }
 
-- 
2.47.1


