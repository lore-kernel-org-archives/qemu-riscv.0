Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7D5C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 13:51:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyuWa-0003B2-UR; Fri, 03 Nov 2023 09:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuWQ-000314-8v
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:47:39 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuW9-0000zw-H8
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:47:37 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5a7c08b7744so24412657b3.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 06:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699019240; x=1699624040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eKLA2b+3ni3oHNZSzku3n2BMkvO4OXSmTM950JOFjds=;
 b=TFPcPOKYchYRfJXpPv0g8OSm8+NqRGBQHUnp/RA2eStZZdC7hc1ZyQZwj6RT6mRNQo
 lKZNfqzY1IsBMbznGgRI0GDW/hjyNbq0YuheA35x84c3qUO8e/MHcsgyrtp9Ll2MhKl3
 dtMAPOq1kC0iM0agqwiPzoXeqCKUQieOdbkk5wCpXbCjrpGKtAC4Trp7ZWtFfqDxawcg
 NxLpxW6G2tnS4bugBb6zaFcmgv7BmskKAYPHqkLkePshEjYJ+n5Nx3d0AGIijCn1QdAd
 3ppEijySEra6vJVxAMZgkz1FrZKdolCLTUktOE5nxO2WCqfy7fYJALWcu55ILtXSWFuM
 CIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699019240; x=1699624040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eKLA2b+3ni3oHNZSzku3n2BMkvO4OXSmTM950JOFjds=;
 b=vdW8D+qz++6mTBhSypGVu4t+EGPJUs8PRwRvgSeo8jhVXS//jhUs6vDREfpfizEEwn
 NzYoc60J3W0B2xdaAIT3nvGVQZ1MWfdWasN+hw9WkYNLn/4MCZf2+ajimQU6jYIBZ6KW
 jeUJnStm6PfpqHcHoEoWh49k7WvvDuD+6k4BHQz854dAmPcLPZF9sNqDDNwpSIT8s/2m
 dhL6zwrwV9tQfdpn1R++QlFupN/keFST7pS9PqpmoKA7H2YQvfAN4Ltwz5tUkOzyJ44j
 uwGqqEn4pNIczNAMpdZiDwS6xS3Ko66lEE/01RmNiSwOOjCl4ymljU9TZuFLPvALLvDk
 rVuw==
X-Gm-Message-State: AOJu0YxS51+glLZVTSKnvRuWsH7oTXs2FoHedjky5REYPt/qxtnEq0k6
 YDG0LP5CSHaoRMpf8ZjdNXzJIg==
X-Google-Smtp-Source: AGHT+IHOMkn9p4RGHHoRvmKFHUux2lOcrKDRrAr9LMABsY2AWZUZKEoCeDGUKRz4Hc+ySVJemC859g==
X-Received: by 2002:a0d:d955:0:b0:5a7:afcc:80fe with SMTP id
 b82-20020a0dd955000000b005a7afcc80femr2947715ywe.3.1699019238433; 
 Fri, 03 Nov 2023 06:47:18 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 j68-20020a0df947000000b00582b239674esm935814ywf.129.2023.11.03.06.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 06:47:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 16/18] target/riscv/tcg: validate profiles during finalize
Date: Fri,  3 Nov 2023 10:46:27 -0300
Message-ID: <20231103134629.561732-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103134629.561732-1-dbarboza@ventanamicro.com>
References: <20231103134629.561732-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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

Enabling a profile and then disabling some of its mandatory extensions
is a valid use. It can be useful for debugging and testing. But the
common expected use of enabling a profile is to enable all its mandatory
extensions.

Add an user warning when mandatory extensions from an enabled profile
are disabled in the command line. We're also going to disable the
profile flag in this case since the profile must include all the
mandatory extensions. This flag can be exposed by QMP to indicate the
actual profile state after the CPU is realized.

After this patch, this will throw warnings:

-cpu rv64,rva22u64=true,zihintpause=false,zicbom=false,zicboz=false

qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extension zihintpause
qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extension zicbom
qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extension zicboz

Note that the following will NOT throw warnings because the profile is
being enabled last, hence all its mandatory extensions will be enabled:

-cpu rv64,zihintpause=false,zicbom=false,zicboz=false,rva22u64=true

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 69 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 9c2469412b..50683931e2 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -147,6 +147,26 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
     g_assert_not_reached();
 }
 
+static const char *cpu_cfg_ext_get_name(uint32_t ext_offset)
+{
+    const RISCVCPUMultiExtConfig *feat;
+    const RISCVIsaExtData *edata;
+
+    for (edata = isa_edata_arr; edata->name != NULL; edata++) {
+        if (edata->ext_enable_offset == ext_offset) {
+            return edata->name;
+        }
+    }
+
+    for (feat = riscv_cpu_named_features; feat->name != NULL; feat++) {
+        if (feat->offset == ext_offset) {
+            return feat->name;
+        }
+    }
+
+    g_assert_not_reached();
+}
+
 static bool cpu_cfg_offset_is_named_feat(uint32_t ext_offset)
 {
     const RISCVCPUMultiExtConfig *feat;
@@ -710,6 +730,54 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
 }
 
+static void riscv_cpu_validate_profile(RISCVCPU *cpu,
+                                       RISCVCPUProfile *profile)
+{
+    const char *warn_msg = "Profile %s mandates disabled extension %s";
+    bool send_warn = profile->user_set && profile->enabled;
+    bool profile_impl = true;
+    int i;
+
+    for (i = 0; misa_bits[i] != 0; i++) {
+        uint32_t bit = misa_bits[i];
+
+        if (!(profile->misa_ext & bit)) {
+            continue;
+        }
+
+        if (!riscv_has_ext(&cpu->env, bit)) {
+            profile_impl = false;
+
+            if (send_warn) {
+                warn_report(warn_msg, profile->name,
+                            riscv_get_misa_ext_name(bit));
+            }
+        }
+    }
+
+    for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
+        int ext_offset = profile->ext_offsets[i];
+
+        if (!isa_ext_is_enabled(cpu, ext_offset)) {
+            profile_impl = false;
+
+            if (send_warn) {
+                warn_report(warn_msg, profile->name,
+                            cpu_cfg_ext_get_name(ext_offset));
+            }
+        }
+    }
+
+    profile->enabled = profile_impl;
+}
+
+static void riscv_cpu_validate_profiles(RISCVCPU *cpu)
+{
+    for (int i = 0; riscv_profiles[i] != NULL; i++) {
+        riscv_cpu_validate_profile(cpu, riscv_profiles[i]);
+    }
+}
+
 void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
@@ -728,6 +796,7 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     }
 
     riscv_cpu_validate_named_features(cpu);
+    riscv_cpu_validate_profiles(cpu);
 
     if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
         /*
-- 
2.41.0


