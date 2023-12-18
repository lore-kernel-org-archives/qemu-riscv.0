Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D01CC46CD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:58:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD8p-00036c-Ch; Mon, 18 Dec 2023 07:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD8o-00033Q-8r
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:38 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD8m-0004yG-Ff
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:37 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d3c76ee799so2248345ad.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904075; x=1703508875; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CP/c5R02eM2GaLTfkAYXYfStMwDAvEVf0ZCoFBAB56Q=;
 b=f0QuMaxVxTs9b/Wspo7hpoWh79NV9Slp1rJtHNBtLiX8kOquWisjcPJbxOlJm8skuW
 gkQFEMG4zdhDUaINreuvywJ3ete1iCTjI/rlCIDlk3f9xbfIi6swukzihx+EBisP1A5K
 C2w7U7eK/RjoOLlb9dE0FKSypF276RGXMoqvVL1QzfTQDSDs3TqYK469RYP1AOMYqHZC
 3SJFTEv+7V9HvsaVW7FWUJMUUu18jkEuSGsMGdnFkcwxWVTONOh8xpNMmcID7Uhz0YPG
 8EPikVyj+sy4l3uG11l8M3fHuO/ilUvaGZ2keeITrPe/O7uf9R068tVN+nbnbEKwjQdi
 n4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904075; x=1703508875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CP/c5R02eM2GaLTfkAYXYfStMwDAvEVf0ZCoFBAB56Q=;
 b=Iw938w5hABWSXjVfkAJ6OOy62+PQ9zK/dwzCcDVLK45KHfeWh4mdRRdXYo9Utq3nuQ
 v9uGlE13vv1fy13h9VQTi2xcBPvfnya2UanMHk+hX1689SQHKV8W1P2tKIoKjA2XUzaC
 KB+Gq3no81vgm7Pb5sB4xR/NrvqL3pOMFJm+1eBo51XtxXOa48KnGQ1n22hZVUB7SkTF
 QnEZLjy+PM2it4Bo1IYKX9BBfYzxgyn/0KfLXR8P5uhe0yZ1lhSXElq/nc7qBu20JZNk
 N4of4a7n3BmkP5HmHolztRb2G3lRliYKkaVfyHVGrqqRD6bBr7FMnGVtXP/BrQghT+8P
 CnvA==
X-Gm-Message-State: AOJu0YznTspYHy3TJCtiQyJm4YomrC+p2D93HW9ZaoMTerVPnX/x7QH6
 pJFqgmWaVlW2krEmNxIx+LT9owDjai9KDe3mVik=
X-Google-Smtp-Source: AGHT+IHPMdKTZThSygDNjfa9P0eoWtXMD6T2B06v8+cMpLTAeYNvCkDMDSmTnoOZNQSM9BHweUjrPQ==
X-Received: by 2002:a17:903:246:b0:1d0:6ffd:8369 with SMTP id
 j6-20020a170903024600b001d06ffd8369mr7133520plh.116.1702904075112; 
 Mon, 18 Dec 2023 04:54:35 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:54:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 16/26] target/riscv/tcg: validate profiles during finalize
Date: Mon, 18 Dec 2023 09:53:24 -0300
Message-ID: <20231218125334.37184-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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
index c9df783c51..005d8be26b 100644
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
@@ -727,6 +747,54 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -745,6 +813,7 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     }
 
     riscv_cpu_update_named_features(cpu);
+    riscv_cpu_validate_profiles(cpu);
 
     if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
         /*
-- 
2.43.0


