Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43059C27C47
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 08:57:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwf5m-0000LC-AI; Sat, 28 Oct 2023 04:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwf5k-0000Jw-Ki
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 04:54:48 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwf5i-00048r-Rl
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 04:54:48 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a7b91faf40so22611207b3.1
 for <qemu-riscv@nongnu.org>; Sat, 28 Oct 2023 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698483286; x=1699088086; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOEmF+JC1jgSPQFX63YoAlOw+epoUxfLq+H1+hWdDYk=;
 b=KpWDNnk9kTN6cki/CXZ1yXOxBKjxjjkiQjH11+FBqNFBGlIhjC33GMpqtTA/19WJMS
 Y56HiWPbEWy3Maptt7oHtl/jrn9JzRm7Q1O/qPF3W+4xXgrc8buLdyq+GDUJlQCCw9sg
 8ugKRgB5cdnw3Tb251TWkbBFOfV7IgR6B2cQIwtj4qIUXhj1i2Htgq51Da45keSQSvC/
 ty9/6O3URsQH5fGWTGlJBWa+vcUwb0Q4qUQkb0XT0AbqFWHavesjDZr7EsftYvrJApj1
 sOC4/sSsSDkO99I4qIpXv1gHUn75QSdpOedx4OOuzXgqGeajtDQtifDq370K65laygDZ
 euKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698483286; x=1699088086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JOEmF+JC1jgSPQFX63YoAlOw+epoUxfLq+H1+hWdDYk=;
 b=abA1YiOztyxlYr3YSFemOvlb6+qAyaoRcEFIRVbLOb4rM4DvItDBkSPfj5dmhbEzWj
 brZyLtgcdliBT0LMss2yMjXyc6+1sWcYR7a/D6AdNNGfl6jsuiluUlA3Q3sCgcJ+8pcH
 RjwG9LdITSES32SCrV+GxzG1vCwPUIolxaYzGBQj3rPb52WmTFUBFTk8759lDNw8cPeB
 QtED/10XUlmUraZoTEuIMtQc6nibgu+6Lfxnok0ttLr64V+Fl9H/TPJnvw92j6D0BfoH
 7zE+PqVeeMF6g/zocP3xIZRsTpvXa6aPrEVf00wrebE5U7Vfa0AVyO14w0YGGw+lnyHc
 DnRA==
X-Gm-Message-State: AOJu0Yyh+hAjBrYogOlGTDGej94aJoUrunnSSjKmYiRjWM9RGlnLISwU
 PyPn+pL3i8FjCz73o6bIqAVpCw==
X-Google-Smtp-Source: AGHT+IE3+vS0xK0KbUdRB5JNr/NLmTsLaN5KOB+cy/1eSR690N+G9B/1R/a+Sa+4OI7fGY7JDrU0jQ==
X-Received: by 2002:a81:ed0a:0:b0:583:b186:d817 with SMTP id
 k10-20020a81ed0a000000b00583b186d817mr4452280ywm.27.1698483285887; 
 Sat, 28 Oct 2023 01:54:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a81830f000000b00594fff48796sm1604325ywf.75.2023.10.28.01.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 01:54:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 04/12] target/riscv: add rva22u64 profile definition
Date: Sat, 28 Oct 2023 05:54:19 -0300
Message-ID: <20231028085427.707060-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231028085427.707060-1-dbarboza@ventanamicro.com>
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112d.google.com
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

The rva22U64 profile, described in:

https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#rva22-profiles

Contains a set of CPU extensions aimed for 64-bit userspace
applications. Enabling this set to be enabled via a single user flag
makes it convenient to enable a predictable set of features for the CPU,
giving users more predicability when running/testing their workloads.

QEMU implements all possible extensions of this profile. All the so called
'synthetic extensions' described in the profile that are cache related are
ignored/assumed enabled (Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa, Zicclsm)
since we do not implement a cache model.

An abstraction called RISCVCPUProfile is created to store the profile.
'ext_offsets' contains mandatory extensions that QEMU supports. Same
thing with the 'misa_ext' mask. Optional extensions must be enabled
manually in the command line if desired.

The design here is to use the common target/riscv/cpu.c file to store
the profile declaration and export it to the accelerator files. Each
accelerator is then responsible to expose it (or not) to users and how
to enable the extensions.

Next patches will implement the profile for TCG and KVM.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 32 ++++++++++++++++++++++++++++++++
 target/riscv/cpu.h | 12 ++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 316d468a19..8ee6d46967 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1441,6 +1441,38 @@ Property riscv_cpu_options[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/*
+ * RVA22U64 defines some 'named features' or 'synthetic extensions'
+ * that are cache related: Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa
+ * and Zicclsm. We do not implement caching in QEMU so we'll consider
+ * all these named features as always enabled.
+ *
+ * There's no riscv,isa update for them (nor for zic64b, despite it
+ * having a cfg offset) at this moment.
+ */
+static RISCVCPUProfile RVA22U64 = {
+    .name = "rva22u64",
+    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC,
+    .ext_offsets = {
+        CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
+        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
+        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
+        CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
+        CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
+        CPU_CFG_OFFSET(ext_zicbop), CPU_CFG_OFFSET(ext_zicboz),
+
+        /* mandatory named features for this profile */
+        CPU_CFG_OFFSET(zic64b),
+
+        RISCV_PROFILE_EXT_LIST_END
+    }
+};
+
+RISCVCPUProfile *riscv_profiles[] = {
+    &RVA22U64,
+    NULL,
+};
+
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ee9abe61d6..d3d82c5a7a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -68,6 +68,18 @@ const char *riscv_get_misa_ext_description(uint32_t bit);
 
 #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
 
+typedef struct riscv_cpu_profile {
+    const char *name;
+    uint32_t misa_ext;
+    bool enabled;
+    bool user_set;
+    const int32_t ext_offsets[];
+} RISCVCPUProfile;
+
+#define RISCV_PROFILE_EXT_LIST_END -1
+
+extern RISCVCPUProfile *riscv_profiles[];
+
 /* Privileged specification version */
 enum {
     PRIV_VERSION_1_10_0 = 0,
-- 
2.41.0


