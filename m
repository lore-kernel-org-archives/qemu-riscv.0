Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA472E81DFA
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 13:23:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qokmO-0005zc-5c; Fri, 06 Oct 2023 09:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokm9-0005ta-Ib
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:56 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokm7-00038g-N6
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:53 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-690ce3c55f1so1803923b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Oct 2023 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696598510; x=1697203310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvFPTIiAXaXHOXezY7X5+ACmqmm2s3KN/IMfdAwxSwI=;
 b=M1M+ER2h79xQu/lLD/h47uDVpAnifngOeK6ouDYw4sDW5oB7kxhnzo+u9y9hnVy/XD
 MCYxrCJaMFO+Du4lsncNS3MtQvJxwYem+xxsdT2j/hkZgMVEylT/zbmEmjZxkVnqA3k5
 KBaQ7bkEc6a9edPgv+qyjxPs6F1Iwk2SLFnSNyCMTRbafwvN/FNfUQfOfhQ7dW9/h1ar
 /dLxuhLWp+pe1rEwMg8pTmdE+yRIi6tTvRNXFTGlp3SjrkeAcYBgtr/C+N5/g7v0TrTb
 FFt8a7QIkYjGwqrEroHudmiKDlxHV4F30yAcM9LM6IR69KbaO2uPOa0gwX9RQgS3ksX3
 43bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598510; x=1697203310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvFPTIiAXaXHOXezY7X5+ACmqmm2s3KN/IMfdAwxSwI=;
 b=u3Aa+vS30kFtg6fLgvcJZGx6QmFk0JTN7ksp1tXLTOvRHee1ZMpaI8d8rekgpkiA9f
 xr9cXmB6H8PUjKOAZASfxW4IK/zpRWloEosaN8sdOGVbkOhhH7AuYocchXWzriUQnXT2
 0o29xKLeEEfMXdpG9wmQUVxl3Zqnl5J+ayazAlxSenPm0pzMqAorWEROynSf3wFMMVFm
 y9chJ9H5zfSm3OKYy4B6hLP65CEvRplWGykKeMZHApn1CFJvX1keIp9OwNPQN/p69j4y
 5kMgVRKr4q6zTFpQ5t3uoi1njie6YaRFSS9mYypzV0W4QTJq5SkuTRqpUn8g7HV8VCQK
 dBKQ==
X-Gm-Message-State: AOJu0YwrNMsWR30Im7OY4siVHa8NTo+YL/80V/kcb+KrQrMlhjuspB1C
 UizSGGPpiLEpJTIfDK2sSTYKyA==
X-Google-Smtp-Source: AGHT+IGuSdAB8YsPPrxavCT2IzRuDtsih4P0NRvM4LngbRB7DO18RYhXDuJtAsYhO38qF31XubTIJw==
X-Received: by 2002:a05:6a21:a5aa:b0:15d:fc71:1b9e with SMTP id
 gd42-20020a056a21a5aa00b0015dfc711b9emr10932126pzc.49.1696598509884; 
 Fri, 06 Oct 2023 06:21:49 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170902c1cc00b001c60a548331sm3796669plc.304.2023.10.06.06.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:21:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 03/10] target/riscv: add rva22u64 profile definition
Date: Fri,  6 Oct 2023 10:21:27 -0300
Message-ID: <20231006132134.1135297-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x429.google.com
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
 target/riscv/cpu.c | 20 ++++++++++++++++++++
 target/riscv/cpu.h | 12 ++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b3befccf89..a439ff57a4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1376,6 +1376,26 @@ Property riscv_cpu_options[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/* Optional extensions left out: RVV, zfh, zkn, zks */
+static RISCVCPUProfile RVA22U64 = {
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
+RISCVCPUProfile *riscv_profiles[] = {
+    &RVA22U64, NULL,
+};
+
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3f11e69223..216bbbe7cd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,6 +66,18 @@ const char *riscv_get_misa_ext_description(uint32_t bit);
 
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


