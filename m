Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBF4C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 20:41:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxvXI-0005ld-IC; Tue, 31 Oct 2023 16:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvXG-0005jx-Te
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:40:26 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvX5-0007qW-T4
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:40:26 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5a8628e54d4so2520777b3.0
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 13:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698784806; x=1699389606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HVP3RrPMog2SU6IORDMM2BbVpKPnsZIsyMSPeZJkcnA=;
 b=nuuFbn8eGfK/wZySQq861OPwiAvFnmHOeCS37Q+WLg/uyKwPFfN8aiQHgO5RAHcgr9
 NTwZjAKRKQFYDqTsHuWG9CJ65DXS0n09bYw5S8bbzPkRdCj2ovqbjmuKI04Dsa7Fb/gb
 MDy9f+jdBj21CPy2PIt+ww1Rb2YB9RcYeogR6VkiMewrtzStFxOvC1mh/jXD0C2vPrz6
 2H4SsYOKKTxCRF8auET14jtyeg3LE8u0Nj9KVwczHdnqqIgYw4pTM+jrRHBSW87rpILs
 wI634FMjm9DHg/v2dlh7AGxbjG+kjnyRkaKoQr9hCDg0z8iQDwRN1HxG9PqUmqr/Mlle
 hjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698784806; x=1699389606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HVP3RrPMog2SU6IORDMM2BbVpKPnsZIsyMSPeZJkcnA=;
 b=a5GpvMcNfMwKWXgR1ai4ufnYSyeGybt49pjFMF5J1ke9nAwo8E3WXBdvcFK0FP1wH3
 Cln0P3+kH3n0z+NewK5Ka7vURXDSypr8e+5atEhoqe6tHH+16GhC686KFEbJJmN3NhDc
 BpDBZ8KQFV7FU5Z5nVQd6PrFw06O890XbVvCOyFNKj4e/ruk2HXQlkJoWNxdNhlngzre
 yHuX4rr+W11iLdrlDPofXS7UKlXkK+xAFNhiJrXJS8LHFYhzFxvor0uKHU2AIjIsr9mH
 y3NdzPmrHUG1DkFgZt9/VQlFO1TYR97iA+gSZWxCsXej9KeHmLDcRLkyABR6R9zI7aA3
 1d8w==
X-Gm-Message-State: AOJu0Yw9Igsj9deU9WOCl+tzp513wm2dik1j8+DlSmpxvoXDXGQepmrK
 RpWmouDjn1sujZuOS5zHCeVlng==
X-Google-Smtp-Source: AGHT+IG+WFHd76UktR6icTlRYETLzbDVoJq0i37T50kL2ypxqxA4vdy6PiHW5XmTbzK6xdya9uTX9g==
X-Received: by 2002:a81:b611:0:b0:5a7:dad3:cd21 with SMTP id
 u17-20020a81b611000000b005a7dad3cd21mr3499964ywh.10.1698784806121; 
 Tue, 31 Oct 2023 13:40:06 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 k1-20020a81ff01000000b005add997ae53sm1272802ywn.81.2023.10.31.13.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 13:40:05 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 15/16] target/riscv/tcg: validate profiles during finalize
Date: Tue, 31 Oct 2023 17:39:15 -0300
Message-ID: <20231031203916.197332-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031203916.197332-1-dbarboza@ventanamicro.com>
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112b.google.com
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
---
 target/riscv/tcg/tcg-cpu.c | 70 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 544f6dd01d..23007b19e4 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -147,6 +147,27 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
     g_assert_not_reached();
 }
 
+static const char *cpu_cfg_ext_get_name(uint32_t ext_offset)
+{
+    const RISCVCPUMultiExtConfig *feat;
+    const RISCVIsaExtData *edata;
+
+    for (edata = isa_edata_arr; edata && edata->name; edata++) {
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
+
 static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
                                     bool value)
 {
@@ -631,6 +652,54 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -649,6 +718,7 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     }
 
     riscv_cpu_validate_named_features(cpu);
+    riscv_cpu_validate_profiles(cpu);
 
     if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
         /*
-- 
2.41.0


