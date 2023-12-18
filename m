Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E71FC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:56:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD9G-0003fW-37; Mon, 18 Dec 2023 07:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD9D-0003es-F2
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:55:03 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD9A-00052n-MZ
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:55:03 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d3ac87553bso2961865ad.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904099; x=1703508899; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8U63IzMzjkWDwurEnFNMBUdg1Ag6di1ouiDAsRlbPvQ=;
 b=KnaXo4tzjsqqLI2JrVA+EIRerrRRoTgcqQLEv+3/N+T8cTWWYVNtH/d3cJ5sy55Wgn
 F9Y7kq7QrROMddFGo8OKXBo06UaIkyDMRPxy7yIPtm2ttjpjiA/eBuuTSbqeyGiQNyPv
 WHy9FJWHWCc6dZC9SyvmjfQftJUEAizj/0ll5hA6arxzMDQ4PbJUgcR6sIr0NecR/fLj
 VgH6b16ho4XBXx7xlxV3eYshTw/AGLVibeOLYJ54jzIjEy6X6djz+N4qzJEiNmDXs0zt
 xUjWRfn4+RUsFSj5IWtvzLwQookbiuk9ElH1tmnwtemiI5AseU2mHEWjPwJ2Jn+AlLMp
 Z71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904099; x=1703508899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8U63IzMzjkWDwurEnFNMBUdg1Ag6di1ouiDAsRlbPvQ=;
 b=ohJCpwbauZooWKhwqiocUZf6N0RkWCl4WgtboHpCTe1JbFqLESe0sD3w+WSQeFK7w2
 DEE5o+W8+43cyKX+qXeb8df79IJOF+pMTLedoH2zqaMm/vkB3RnaYcw5k0d5TnJkQL/M
 a/Zn5c6bbce8xQKKhc7V06fKpbYuyzVDDSqc56b5PAwlX8AYv0vDu2eFn/uSCReovRtn
 OYc/CodmsEY3oV1JECvWECCQRs+n8C+l+ggcQGDwHCE+nbj7inyvKSDgrD5GOY40tP3e
 y5LqW9qEk+Xqh86bfbsjQiDjhnzmH1zv+vQRzBLpj6xTU/UrLhywXJp2bxCpqQT0+9DJ
 e2AA==
X-Gm-Message-State: AOJu0Yx5xB3x0A+n4rtkuf01NvYe8CszrpEKzV2whPU6qU4JCvMDuiM+
 P9Fk812kWbpXFNT2PdTd595Q0g==
X-Google-Smtp-Source: AGHT+IGTgL2Yc3xKJ6AG2j9tkh7QtC0zGciJnKUvHXY/DvRit2+VqPLm3o5fe37oJmy59WEhv7v5jA==
X-Received: by 2002:a17:903:22d0:b0:1d0:6ffd:6e69 with SMTP id
 y16-20020a17090322d000b001d06ffd6e69mr9570450plg.97.1702904099580; 
 Mon, 18 Dec 2023 04:54:59 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:54:59 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 24/26] target/riscv: add 'parent' in profile description
Date: Mon, 18 Dec 2023 09:53:32 -0300
Message-ID: <20231218125334.37184-25-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         |  1 +
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 14 +++++++++++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6795f5da41..aa33e7a1cf 100644
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
2.43.0


