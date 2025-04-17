Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77654C369B2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:50:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u5OgJ-0008Jq-50; Thu, 17 Apr 2025 08:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u5Ofn-00083t-38
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 08:48:58 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u5Ofl-0004Ut-Bv
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 08:48:54 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22c33677183so8331855ad.2
 for <qemu-riscv@nongnu.org>; Thu, 17 Apr 2025 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1744894131; x=1745498931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yvfv+xaPiq07LdBk/ThXSnMXR2kTWo1wDRCBynqc/Ek=;
 b=Jx2lRhd/eE5YXSVlrZzS+QirpLuvOXmlLFlUlewmb2+hlR2Yz1BOTKtA6tw/G52sWh
 gdZNyXdab1NFWpWDxN8vknYd1nTTR8TfkPC5ms8/GIdScE2puhak/0SlOUqChZh6t5fj
 OzZynjODYgGGAzS5DFkjwzxNezDDg66xyil7N/V9nZ9UdjHz4XrajvhLlmfoyAhgN2Gz
 105esMfLO5GPwOv7RK60nj/irRfU1+m7yEr8T0XlYQa/untVpkRML8Hm1tcpXsimvbEc
 Bh4wL+JLSE+775ZsL0kUwmVWFVJe/W7edMsY/+JgsYwyrMWlSSsF83KBo1780tbaA57p
 ntOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744894131; x=1745498931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yvfv+xaPiq07LdBk/ThXSnMXR2kTWo1wDRCBynqc/Ek=;
 b=V4RbdjLFrYLhZ973+3TA4cSEntgsgj1YXlk5e+yZWTVdFzc4KDVBetYi0lxLrbkRGR
 EuBcpFk1hoszTjE6Ur/dLBcS0b1kefI3WIrVOEh3iW/ytc9Mn14g/ekFdAKPOpaRkMwY
 1b785XBJjksenEE4XxETsjG7RWpJGBmckdNT6T/Q1/gV+8UyxHQ3QR2yllicA2xgh2fW
 C7Jmq9Kl57+ZASw/IrRC2/0FNbQZd2fQ+YM2hmREvUQkHnhTyDGV8TOxpykWcZBfkVQA
 csqpvgYq+HIqeqO023rxuTbzdcylM5jSrHD/Q+3Jq7+N+f+aev3ldQ3cpHy3eNxGCQeC
 yaCA==
X-Gm-Message-State: AOJu0Yz5ID7DKEo5v14J4rUNJSO5cqkXMx+gP4MPss0OdWSu8F4rPKF8
 7Qth2Wx0iX9fT3H758QACB/UFfzHpemaE1opRCqKUaJBC/aK7N8to82wLAEqHoM=
X-Gm-Gg: ASbGncvv167n5P2kvOYvhFaMSujpW1vEZq2VQadg27NgQ1C8ASdj4/9YethY4YpdUwN
 tuZvYzLn/mK4Vzc8j0K0u7ZTTTCy6Nj4yLIBw8FP+8/86H3Id1L12HTQPNTvMUHAhAtKABSLa4i
 xPfpsOfd49fyyEwQneI96mfpQpdkSw1A42cY0NzU/IorLk8r7/4eOCQsoJwbEMN8T0Ht4QjMx8B
 SiGkXsi/Z4WKLxXxTxXklU/Fk3qCeWns7+6dCPf2p051WVNgI0srI2a63MQ7jdM41J8eJtG2DPm
 MAJZYWwcx1iiexrhtamoIaOtOwP00ADwlLLb5TETWTLTkVBOkHt8ZOzIYYrPbupxZqgu
X-Google-Smtp-Source: AGHT+IHAx5dYpIMvjCpyULNfnGgpkHKpoufUkaBwwkE1rUKP5o80UykqG7jmstsNykZ2u9snWtjNrg==
X-Received: by 2002:a17:902:da83:b0:226:4764:1963 with SMTP id
 d9443c01a7336-22c35983d1emr74819355ad.51.1744894131518; 
 Thu, 17 Apr 2025 05:48:51 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33fe6dbasm32175065ad.239.2025.04.17.05.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 05:48:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, abologna@redhat.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/7] target/riscv/kvm: turn u32/u64 reg functions in macros
Date: Thu, 17 Apr 2025 09:48:34 -0300
Message-ID: <20250417124839.1870494-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417124839.1870494-1-dbarboza@ventanamicro.com>
References: <20250417124839.1870494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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
---
 target/riscv/kvm/kvm-cpu.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index afe3d3e609..9d5f54f270 100644
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


