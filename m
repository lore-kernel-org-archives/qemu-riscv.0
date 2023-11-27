Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A989C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 11:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7ZwT-0003vp-G9; Mon, 27 Nov 2023 06:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwR-0003vT-UG
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:19 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwQ-0005OO-8g
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:19 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6d8029dae41so1871869a34.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 03:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701085097; x=1701689897; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yElVsIHzCua4iZ431C/kmIyyY3CeuHOk6mNAF42rzU=;
 b=okeMCogZ62waKfAbiBbHnmcvZyZ8zBF4rb3ZjdgKGDXRSo2eSFha6wdKHRU+5IH6pX
 gLCuPyzHzwLe4hYJ1XHhOFio2lA8KYO7EXKrfXm6vM9p6zaaF2Mw/L3ILfPzGdU/HtuA
 pjIk359S5LVUAj+k70r8yfy3v4CrV5rNy78wCL6IrVfYW1A+QDWVbgkc+S8nFF+yIVi/
 AMPRXX8orKuw363bwXIB0wJBDpw4779bGhj9S+XQfqLXUaPwHfUgYTH+bZgmz3XDN9oy
 jzBRtsvaHmEDyH+oWDf9ss4d4I/EEGvz4vh4vwVgq/VjHNiOXBBkO+TN2PZCwjwenrN5
 QSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701085097; x=1701689897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7yElVsIHzCua4iZ431C/kmIyyY3CeuHOk6mNAF42rzU=;
 b=tl3wa5+89XLRxGkE3qQPcN+JBaVWwVu0Lrz+o6sbogK/TT1ld8nKJjHnzvYNG7HitA
 VlGnl2valhfgEeXgXGHxnwB+Rhg80AmLssl+iWBwLZr3LKcHHJ4Cn1S2fBux99eKehuo
 VtUugeBglOHhJqobbJ/FNUkeE9bbSiHosIteWiMXMCoOSLsKCL9XfEp+oIk3FykBteRC
 OtvRerWCNJXevQ2f+67oUlSqwWLJNk+KeSdvxn7+aT8CfAOyReIbJ96XoqF0dp5UOX00
 qwYLe/bB34xW6zDkLse9ChQND0hJquxUG2ocBKTkRI4FPiaZnZGRPKZH6L2wLE9wifhW
 pi3w==
X-Gm-Message-State: AOJu0Yx1uvB9Eow2Y7N7R/tzTf8aigJS1AJ6L8JqbMjAyuioAjW4lEbk
 zFUL7pjN4UJnFl+0TD6Ha3NXig==
X-Google-Smtp-Source: AGHT+IFoVE84r8JGtV3jEtfZAjDU0G+cEMJr0ecngAsqegkGryFU+vqDWniQTFg/X17zlo/4s7KhYA==
X-Received: by 2002:a05:6830:1be2:b0:6cd:179:f80b with SMTP id
 k2-20020a0568301be200b006cd0179f80bmr13227840otb.30.1701085097180; 
 Mon, 27 Nov 2023 03:38:17 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a63e94f000000b00578b40a4903sm7618323pgj.22.2023.11.27.03.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:38:16 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v2 6/8] target/riscv: add 'parent' in profile
 description
Date: Mon, 27 Nov 2023 08:37:50 -0300
Message-ID: <20231127113752.1290265-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
References: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
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

Certain S-mode profiles, like RVA22S64 and RVA23S64, mandate all the
mandatory extensions of their respective U-mode profiles. RVA22S64
includes all mandatory extensions of RVA22U64, and the same happens with
RVA23 profiles.

Add a 'parent' field to allow profiles to enable other profiles. This
will allow us to describe S-mode profiles by specifying their parent
U-mode profile, then adding just the S-mode specific extensions.

We're naming the field 'parent' to consider the possibility of other
uses (e.g. a s-mode profile including a previous s-mode profile) in the
future.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         |  1 +
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 14 +++++++++++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a77118549b..6957b4b9be 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1540,6 +1540,7 @@ Property riscv_cpu_options[] = {
  * having a cfg offset) at this moment.
  */
 static RISCVCPUProfile RVA22U64 = {
+    .parent = NULL,
     .name = "rva22u64",
     .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
     .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6c5fceb5f5..44fb0a9ca8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -77,6 +77,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit);
 #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
 
 typedef struct riscv_cpu_profile {
+    struct riscv_cpu_profile *parent;
     const char *name;
     uint32_t misa_ext;
     bool enabled;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 152f95718b..6284d36809 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -797,7 +797,7 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu,
     CPURISCVState *env = &cpu->env;
     const char *warn_msg = "Profile %s mandates disabled extension %s";
     bool send_warn = profile->user_set && profile->enabled;
-    bool profile_impl = true;
+    bool parent_enabled, profile_impl = true;
     int i;
 
 #ifndef CONFIG_USER_ONLY
@@ -850,6 +850,13 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu,
     }
 
     profile->enabled = profile_impl;
+
+    if (profile->parent != NULL) {
+        parent_enabled = object_property_get_bool(OBJECT(cpu),
+                                                  profile->parent->name,
+                                                  NULL);
+        profile->enabled = profile->enabled && parent_enabled;
+    }
 }
 
 static void riscv_cpu_validate_profiles(RISCVCPU *cpu)
@@ -1107,6 +1114,11 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     profile->user_set = true;
     profile->enabled = value;
 
+    if (profile->parent != NULL) {
+        object_property_set_bool(obj, profile->parent->name,
+                                 profile->enabled, NULL);
+    }
+
     if (profile->enabled) {
         cpu->env.priv_ver = profile->priv_spec;
     }
-- 
2.41.0


