Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FDCC369DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 19:25:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9U4y-0003cr-Hc; Mon, 28 Apr 2025 15:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9U4w-0003c1-GK
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 15:23:46 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9U4t-0007M6-Uz
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 15:23:45 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22d95f0dda4so77588735ad.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Apr 2025 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745868221; x=1746473021; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOeCBxmoJl3fpGbBgDl7Mncm5lacwWUBmOxyjJ4Qi9g=;
 b=kDD3IM+cS9wW6EtObfpQpWo8igB1mm3qbo6wSosJCwEApK3bWcH6xo4fP8lvcUtaWP
 cDVGZ6ii8WyRwRnvlumWlPiVIe7+E18cb0crncpgtwi9iiTju9p3e/0TcYwsvmfcU0GB
 QcFk5woUjWIKJdthrL1vKmaQU5dBs82gmN2ZM3bjC+RUHK+9IFnKQ1hHoESr9AeRTCch
 8/JfwaEIAzg/ThtqErJUEAQSNzbqiWAjn8YVdEBsLIJLiHFjHD/yyFCQCrjac+gYQ8Gh
 1tgDO1E79KyduU4pCpLzhw7LZo0MhMWhKgVHE9q5zwHgG/Z5B0illZquiyMp2HZM16LZ
 eyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745868221; x=1746473021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOeCBxmoJl3fpGbBgDl7Mncm5lacwWUBmOxyjJ4Qi9g=;
 b=wXQxxyWK6baXdT3a585Z5E4ICYqwdrWphIPl3pKIgJT/j7OTF/PCpY+1CK59K2zT90
 O8to4q787tNNTIq93+YsiUAgs44VzMxdAlbywZgUdlG45Jo4BVL7DB30j/s/p5ZaKIuN
 s0oZ+S4qJf8m8Rj9SxEd6w33j7azJUoIk0s/DXrK/Rft3M53/llQPz7uGbK01wi/opda
 EyFroXbBeoByxsu3orJPTMTe2XM291tEQVMNDuHY/Ct1XyGGEyDIKAcn+cu/489nZOBU
 K2FEIkgXH2rNzZyq+HNiroVoE/zdQL4aHvnWK68JPtlAQT8qWmWdjQXv7a/rU5mx19k/
 SVFQ==
X-Gm-Message-State: AOJu0YyDmRC3KMKfj3Hayzwdy4kr8QKks8CHqLBI9n/MPndeRPCnmuFz
 PtSTBX+2Z/Loopa+2RcxQv8iz0zPdWbveOJ0rNMa3zh6XFHtosJCB05QI0Z6c1o=
X-Gm-Gg: ASbGncsKBRypXqz+pwRQzxPu9OF500q0FSkdgPd6I2twdqhLcpa7W25mOSJO1Fq3Upx
 XsjCoAh4EdK6z09j3cLcyv6I6fAJdezDbWTxsFoxmMC+/039l96jUj6QWIMjAloG3TRS+VqkrZk
 ZO7YfgMgbsVkf6iYRnmmfAmHQ/xr/YCMR1j3r2eQ4Pb/oOdpDrCP12JvEdo4K7feDWdHoUQ83Dv
 0M3VYqRhdWNIVACSUGbKG6Ck9/GfHBZxp/ayrldRyWBDThsfgOuAG0uAdCgtGqeOfC0f7q6MUnY
 scuMs8awvHUtqO7GqFNmbAiu72if8OqQvPEQaeMIXWk4
X-Google-Smtp-Source: AGHT+IGvGt+ZA76bXf7rA/QgT+NlkWA2ckxJ+it9GwjuYhdgSwXMR52EmKApbVF3P37+7TL3nz+Xrw==
X-Received: by 2002:a17:902:da88:b0:224:5a8:ba2c with SMTP id
 d9443c01a7336-22de703cff0mr3185845ad.52.1745868221642; 
 Mon, 28 Apr 2025 12:23:41 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:906e:57d5:dca2:1ab3:20de])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4db99d3sm87300565ad.53.2025.04.28.12.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 12:23:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 3/9] target/riscv/kvm: turn u32/u64 reg functions into
 macros
Date: Mon, 28 Apr 2025 16:23:17 -0300
Message-ID: <20250428192323.84992-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428192323.84992-1-dbarboza@ventanamicro.com>
References: <20250428192323.84992-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

This change is motivated by a future change w.r.t CSRs management. We
want to handle them the same way as KVM extensions, i.e. a static array
with KVMCPUConfig objs that will be read/write during init and so on.
But to do that properly we must be able to declare a static array that
hold KVM regs.

C does not allow to init static arrays and use functions as
initializers, e.g. we can't do:

.kvm_reg_id = kvm_riscv_reg_id_ulong(...)

When instantiating the array. We can do that with macros though, so our
goal is turn kvm_riscv_reg_ulong() in a macro. It is cleaner to turn
every other reg_id_*() function in macros, and ulong will end up using
the macros for u32 and u64, so we'll start with them.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm/kvm-cpu.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 6ba122f360..c91ecdfe59 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -58,6 +58,12 @@ void riscv_kvm_aplic_request(void *opaque, int irq, int level)
 
 static bool cap_has_mp_state;
 
+#define KVM_RISCV_REG_ID_U32(type, idx) (KVM_REG_RISCV | KVM_REG_SIZE_U32 | \
+                                         type | idx)
+
+#define KVM_RISCV_REG_ID_U64(type, idx) (KVM_REG_RISCV | KVM_REG_SIZE_U64 | \
+                                         type | idx)
+
 static uint64_t kvm_riscv_reg_id_ulong(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
 {
@@ -76,16 +82,6 @@ static uint64_t kvm_riscv_reg_id_ulong(CPURISCVState *env, uint64_t type,
     return id;
 }
 
-static uint64_t kvm_riscv_reg_id_u32(uint64_t type, uint64_t idx)
-{
-    return KVM_REG_RISCV | KVM_REG_SIZE_U32 | type | idx;
-}
-
-static uint64_t kvm_riscv_reg_id_u64(uint64_t type, uint64_t idx)
-{
-    return KVM_REG_RISCV | KVM_REG_SIZE_U64 | type | idx;
-}
-
 static uint64_t kvm_encode_reg_size_id(uint64_t id, size_t size_b)
 {
     uint64_t size_ctz = __builtin_ctz(size_b);
@@ -119,12 +115,12 @@ static uint64_t kvm_riscv_vector_reg_id(RISCVCPU *cpu,
     kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG, \
                            KVM_REG_RISCV_CONFIG_REG(name))
 
-#define RISCV_TIMER_REG(name)  kvm_riscv_reg_id_u64(KVM_REG_RISCV_TIMER, \
+#define RISCV_TIMER_REG(name)  KVM_RISCV_REG_ID_U64(KVM_REG_RISCV_TIMER, \
                  KVM_REG_RISCV_TIMER_REG(name))
 
-#define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id_u32(KVM_REG_RISCV_FP_F, idx)
+#define RISCV_FP_F_REG(idx)  KVM_RISCV_REG_ID_U32(KVM_REG_RISCV_FP_F, idx)
 
-#define RISCV_FP_D_REG(idx)  kvm_riscv_reg_id_u64(KVM_REG_RISCV_FP_D, idx)
+#define RISCV_FP_D_REG(idx)  KVM_RISCV_REG_ID_U64(KVM_REG_RISCV_FP_D, idx)
 
 #define RISCV_VECTOR_CSR_REG(env, name) \
     kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_VECTOR, \
-- 
2.49.0


