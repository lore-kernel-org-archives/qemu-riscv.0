Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E958CA0FF3
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 19:49:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcA7j-0000Bz-7b; Fri, 01 Sep 2023 15:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA71-00080h-K3
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:47:25 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6y-0003HU-MY
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:47:22 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-57355a16941so1515920eaf.2
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 12:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693597639; x=1694202439; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBydyKFWUP98r2ON5JCRCiGHqIfQ4WnnATiO49oGAgM=;
 b=aZWjO1Vfygdcx3RpZ2lMOHt6FQWkajQzbDLCFOlycQhGukTVSud1/GyXQEiZRnHLdg
 dG8EAsevGtcSY8Ft4npFsBWocuPsFb1aOKXFGUFmR+uEPbzvjYvsdokm5oTwqvmMy4n4
 GwN/uF9QLluuqhgFDh1KXt/BgBFSZ5/LcuJ0ieWvJOseoERnAY/8z5wi1GlUwVoh6hGZ
 pHQkihWQBW8M043h6ZTCGUblaFmSPNmHpSfkEgvuAzhgqCcF8VohJ8OEkFkLSBOiRLN8
 kCLZKu3d8ANT8qClzwz0Kjuc/GVjXOIj7HVXrhagUk+W9J7pLXIy5zdBiXLIkm0hbMpw
 QEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693597639; x=1694202439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OBydyKFWUP98r2ON5JCRCiGHqIfQ4WnnATiO49oGAgM=;
 b=HsP2lx/pq713m/YAPAhKsN16kmsjIoVVFY7yM3fXmOgeEKWH6h+rw2zz9qSc+wDzOq
 E3VR3ubxTHPbomW82BjMeN32zbkkyyza3WdFtlYdhCp1armoCmIwBlm/oT/EHtKSRv1W
 du390YiQYitbDOPKrMz0uA6aVSJtlj3hz7tKd4TJ7vI8+xUQZzH3U5Dk2c/P0scCBCIj
 z3pkI84T+w26Lfq79QeTynfDzaXYhwZIV+Q0hCGalhINl/V48ojJ3HRzj1s+cr/qWCvA
 1lOGMIwCyXoxFdC5X2RzEL02esGTN2JZ3jwa+REcjNxF80L+wfcE8zxA/Syjgl1eKpSi
 Mr8g==
X-Gm-Message-State: AOJu0Yy41+yhPLbv8X7Bp+zpR9zRvxRJxFNcRJar/djvO/Bw0eNaK024
 bU2F0cTFHciMIqLiVE5NftTM3OQxygtvJiBgTDg=
X-Google-Smtp-Source: AGHT+IF2QVz1RHlILlhr7uQZwnFBRPIUbradhSaYELXrrLwdMKq309t2a7UWeL2zmfZhnFv2qdcojg==
X-Received: by 2002:a4a:2a59:0:b0:56e:4dea:bc5c with SMTP id
 x25-20020a4a2a59000000b0056e4deabc5cmr3806150oox.8.1693597639740; 
 Fri, 01 Sep 2023 12:47:19 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 h187-20020a4a5ec4000000b00565d41ba4d0sm2303002oob.35.2023.09.01.12.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 12:47:19 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 14/20] target/riscv: make CPUCFG() macro public
Date: Fri,  1 Sep 2023 16:46:20 -0300
Message-ID: <20230901194627.1214811-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
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

The RISC-V KVM driver uses a CPUCFG() macro that calculates the offset
of a certain field in the struct RISCVCPUConfig. We're going to use this
macro in target/riscv/cpu.c as well in the next patches. Make it public.

Rename it to CPU_CFG_OFFSET() for more clarity while we're at it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 2 +-
 target/riscv/cpu.h | 2 ++
 target/riscv/kvm.c | 8 +++-----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 03e936348a..43c68e1792 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -48,7 +48,7 @@ struct isa_ext_data {
 };
 
 #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
-    {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
+    {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
 
 /*
  * From vector_helper.c
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6ea22e0eea..577abcd724 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -62,6 +62,8 @@
 const char *riscv_get_misa_ext_name(uint32_t bit);
 const char *riscv_get_misa_ext_description(uint32_t bit);
 
+#define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
+
 /* Privileged specification version */
 enum {
     PRIV_VERSION_1_10_0 = 0,
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index c01cfb03f4..14763ec0cd 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -205,10 +205,8 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
     }
 }
 
-#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
-
 #define KVM_EXT_CFG(_name, _prop, _reg_id) \
-    {.name = _name, .offset = CPUCFG(_prop), \
+    {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
      .kvm_reg_id = _reg_id}
 
 static KVMCPUConfig kvm_multi_ext_cfgs[] = {
@@ -285,13 +283,13 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
 
 static KVMCPUConfig kvm_cbom_blocksize = {
     .name = "cbom_blocksize",
-    .offset = CPUCFG(cbom_blocksize),
+    .offset = CPU_CFG_OFFSET(cbom_blocksize),
     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)
 };
 
 static KVMCPUConfig kvm_cboz_blocksize = {
     .name = "cboz_blocksize",
-    .offset = CPUCFG(cboz_blocksize),
+    .offset = CPU_CFG_OFFSET(cboz_blocksize),
     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)
 };
 
-- 
2.41.0


