Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7310DE7D27E
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 19:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qlE4R-0003ry-85; Tue, 26 Sep 2023 15:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlE4P-0003rN-Pc
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 15:50:09 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlE4N-0001Wx-Ty
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 15:50:09 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c4194f769fso69777425ad.3
 for <qemu-riscv@nongnu.org>; Tue, 26 Sep 2023 12:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695757806; x=1696362606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/ZboQFWxlADhWHzZ32NFd1Ok47zMwa/Fy7pwD6f5Rw=;
 b=e8S0kFC+tdQbsWvdBjzEnL3WWOh0CL2T95ygBVXcLUC7jhucnKS2+j7JPsYMRjaxjx
 56brchfGJLpDOCOfWHG0LM8wBgTsCfYzo/3+Jdk2dfmH/7lOjQReR5MooUbqGnKfBlFu
 fVOJYkOP+HbeZ5yDVRNUNAcKXBXn7zZpXTpDW2kLi1BpNNcdT/CQwhZNanwWdQiGR9SY
 NKjrDSM33OystpYWiF1J0nRJFTe2RMZJKUytgKIaXtH0kxqLo7iCWgYvlayLL5eREmWE
 7sbCRlxUBWJPf1gkKoYXjA84jBdZ/zYlgxFSg8K7f4nbUhMgJjl0QxoDGKkVJlFLp4LB
 9C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695757806; x=1696362606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/ZboQFWxlADhWHzZ32NFd1Ok47zMwa/Fy7pwD6f5Rw=;
 b=B3HkGmxE/hts+VE+KCSpqJM+3lsa+G7vY8VBFc9+VcIenOAaOzz3AAh4PCTdKV5t4x
 WAkEpiZQydKYDwTorKX5/89KQiua1hCy1FuCf5LQrOnIpACcrjoMQJ8PTAtZj2Fsli92
 l0JNEt0TfoBjE0qmgRrEgKBt/kxUjgLLgK78Cj91RuzCkawCjQbQ4i3kgQtswvs+7otI
 QtcobJ/t9LiXpVsqdojuKdjJDfLVB+6v/EbWUyoKBQ+367fPegLi/jHQZy85nUheb1h1
 F5d0hM//cVi+M0GXR+4nEMVXss2AU30BHLsX4iOh2jkGg1WBpA7OxHtpWxIZICT2WYmr
 pNQA==
X-Gm-Message-State: AOJu0Yz1TIUDb1L3kQ1Z6CiBlw2eH5aDqwmNjpJlLvmUpgepymmgXae4
 c+XGCv8JYRJFmDkCi8DMLc3SXA==
X-Google-Smtp-Source: AGHT+IFv7Jz7JXpv3krEIsY4h2J88+yQVC+QJDpGifjVQicIcIUOzjugiJWGFmciYbcr4ACMyUuyXQ==
X-Received: by 2002:a17:903:2352:b0:1c3:e130:18f1 with SMTP id
 c18-20020a170903235200b001c3e13018f1mr9485663plh.20.1695757806572; 
 Tue, 26 Sep 2023 12:50:06 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 l6-20020a170902f68600b001c41e1e9ca7sm11386010plg.215.2023.09.26.12.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 12:50:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 3/6] target/riscv: add rva22u64 profile definition
Date: Tue, 26 Sep 2023 16:49:47 -0300
Message-ID: <20230926194951.183767-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230926194951.183767-1-dbarboza@ventanamicro.com>
References: <20230926194951.183767-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

QEMU implements all possible extensions of this profile. The exception
is Zicbop (Cache-Block Prefetch Operations) that is not available since
QEMU RISC-V does not implement a cache model. For this same reason all
the so called 'synthetic extensions' described in the profile that are
cache related are ignored (Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa,
Zicclsm).

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
---
 target/riscv/cpu.c | 16 ++++++++++++++++
 target/riscv/cpu.h | 10 ++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b3befccf89..c83807f179 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1376,6 +1376,22 @@ Property riscv_cpu_options[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/* Optional extensions left out: RVV, zfh, zkn, zks */
+const RISCVCPUProfile RVA22U64 = {
+    .name = "rva22u64",
+    .misa_ext = RVM | RVA | RVF | RVD | RVC,
+    .ext_offsets = {
+        CPU_CFG_OFFSET(ext_icsr), CPU_CFG_OFFSET(ext_zihintpause),
+        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
+        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
+        CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_icntr),
+        CPU_CFG_OFFSET(ext_ihpm), CPU_CFG_OFFSET(ext_icbom),
+        CPU_CFG_OFFSET(ext_icboz),
+
+        RISCV_PROFILE_EXT_LIST_END
+    }
+};
+
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3f11e69223..615946b919 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,6 +66,16 @@ const char *riscv_get_misa_ext_description(uint32_t bit);
 
 #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
 
+typedef struct riscv_cpu_profile {
+    const char *name;
+    uint32_t misa_ext;
+    const int32_t ext_offsets[];
+} RISCVCPUProfile;
+
+#define RISCV_PROFILE_EXT_LIST_END -1
+
+extern const RISCVCPUProfile RVA22U64;
+
 /* Privileged specification version */
 enum {
     PRIV_VERSION_1_10_0 = 0,
-- 
2.41.0


