Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0054C369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 11:39:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8HNG-0001Ap-SG; Fri, 25 Apr 2025 07:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8HND-00018V-F4
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:37:39 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8HN9-0006WT-HB
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:37:38 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2264aefc45dso33988295ad.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 04:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745581048; x=1746185848; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qeMLbhxYt641Ue91qpH+f53Zg+Wm4yrzhBDmgbYMgo=;
 b=Mog8QZ+vsbHWKYgZBvFzPra2XQ2k0Tu0M5MLKUIYwnvlYFKuPj+w51/ukHIcq7dgKi
 x0cgcZBylaSDfzoCKw/MYF7aZI9yJMCAcFkbwGnmQ/d1rkt/r8J0JF5SaK2VgIqCpJ9w
 mOWeTZ9MJDk/wTckhzUqgolb6GdfiC0b4k3mTxybf9a/bOZqvZm4OoKalO16TFGHLskb
 h8U1NoV25cvjvZhBI9i1CChtbqr1b7y0eNZu6t2ajnIh3rOOZLhghO+8EQkDFi6+XfqJ
 VYrvbjRGuniJvdcfRRXsut3QBj1SG3PIAWdX+8/D6TW66qM+7XLAcsaWrTu8vAj2J/ww
 382w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745581048; x=1746185848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qeMLbhxYt641Ue91qpH+f53Zg+Wm4yrzhBDmgbYMgo=;
 b=MocL4OlzrhsZlMzobuoJeGURYWCqEy9keA/aVtvqh5gdgUQiu90V5x6BFx1C9BPSo+
 nraOCwx/YLNkq88tEcJSqtsd0FUpEVIsTvKPLLbLu2wpjGXnnCs7M1HrWEal/Vc57ltr
 MLtJNgLZB4BSkimdrf4vgFopZE8cSQ5P7JcLWKHVxey+CK/IvwFL2xlCjE0dKKkC1IQx
 0wE1ORUNOdpTJSPwile4NSPNYwD6GUKAJ7ee461rNWDqmCHdmnc1duyOLo+84KEmjXid
 jU7lNpfko+ZaaEnIPG2OTCNUrcMAveuEsFhLFo5583TTswFkIRS2FMG1f0JMwfpewQXD
 A2mA==
X-Gm-Message-State: AOJu0YzBDjB69c5o2tnaRccuk7V4MwDze6wq/qAcV0+pjTb2a0SHtga9
 6ZBqDhFtieNhIlOxRRSihWzsfxbWi8mHCzeLweyf9Iq89I7bIfD9Xl3FQbekWCQ=
X-Gm-Gg: ASbGncsiCVIrCjoC0CQC5rcez7w6QdXAccnrbLNn84cV5pWRAejoOXBuInHwaDQ+nha
 nIZau0Ng5fyo3grx9Riu+Amc0ftT8yJ/oJ39vBnpPQWf4ncyKJlMnFxSNK+ic43Khjs+PnxkvQq
 4eom5lg6je2Z3tNgqBTsgbvIsdYGC/a8CUArTFDIdA89o6bPK/ooNVXJWL3gjGxV/oswsE8JJTE
 BnXoXv6hnw4ESg8/7b1Ojsks12RRfZ/X5xvdK5i6JkNuRbS9uZVB/a0GNLgatBJNcmr23zltEWH
 d9yGzPRnM3K/cCYqOoEWu4VwjFZ9UYnbIcdBhF3fD+nNQbKFxksEExa0wmxJ2zkUr0ao
X-Google-Smtp-Source: AGHT+IE2QEVzPYdHLGNr9uDrLWj8d1yluulS13NTQ5sW4ZK8gq7V+1s5QNZ+FkSdxl9xK3oi2zix1Q==
X-Received: by 2002:a17:902:d512:b0:224:584:6f05 with SMTP id
 d9443c01a7336-22dbf73b3aemr30802235ad.41.1745581048490; 
 Fri, 25 Apr 2025 04:37:28 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50e7a40sm29881055ad.147.2025.04.25.04.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:37:28 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/9] target/riscv/kvm: turn u32/u64 reg functions in macros
Date: Fri, 25 Apr 2025 08:36:59 -0300
Message-ID: <20250425113705.2741457-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
References: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


