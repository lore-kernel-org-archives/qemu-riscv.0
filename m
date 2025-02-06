Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159D4C02194
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 09:59:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfyfA-0000Pb-RC; Thu, 06 Feb 2025 04:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tfyf5-00008h-Vj
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 04:59:07 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tfyf3-0006Jj-I4
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 04:59:07 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2166360285dso12566055ad.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 01:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738835944; x=1739440744;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JcH4F+LnQtE4KW/dTgSs8FJ54przEBLLbwEc7DxuhW8=;
 b=E2fD2/wGS6AHxWe3I5Z0OgeVFP3UTPAtlUwRqrMxtQjjSCgX0DZti7hzrc3vjaTCUa
 WvX10XvIlHIzDL8rE2jcu/Fgc+RwpdStIdOPhS7pJpxLlAYtkL9eNSRAdxWyUBNgQ3T7
 ZKMMbEamua9t8/raMe3cHekL0TBDt/Kxru6cF1wO5ZNKjiaRPxeU2Tasl2OCJj7g5k+i
 UA2wCPvoDupHLcKVqhfCrbkT2VlIaiNsxfuuIVHgQatbYT3KA3L4ZG4Y/+fj+Fdb1ZSc
 5QloerUoo+JgYhygPuD5nXhqYK3gRh6RGqFxUserN5gP2P+uaIQqVOtYugt2qXtg2Vv6
 kwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738835944; x=1739440744;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JcH4F+LnQtE4KW/dTgSs8FJ54przEBLLbwEc7DxuhW8=;
 b=bay9OyWo9jKztihr4s1omt3Nc9trGdV4qOqWrffxGEZCj+M7qIqONQhrT9el3Ch7yD
 gwX4NkdVg0Vv60U8HBW2IluOINYXFBmSceZFO47lPkxlusZvT4sIS7W7n5hIsHSKsLmy
 cAqRCQeTaeLF5G34opl7zzdYXVuJfnHd/7KLiPxp4a4ZNNCPrQ0D21fARw4B+l3byaUB
 48U7/fhDDIzURSXf3aHGxJ9P1C63HctrOMq38pby/MXQGstCye8O1Gb8m8N1TDcKMDW0
 zBC2KJra8SyCvJj/Gvm8Mxm8p0unuWyH4z9QXDxQSRi5bOeD3/rguhvGEdv0rSYSXnLn
 4OXg==
X-Gm-Message-State: AOJu0YxSzQ4B9YYTCcJvFQaFYyHfECKtfgtxM4nBON8qg6fYk4REqePT
 ltaSRXnW1f/zXUcmuIbLnadT5CcF1dJX3wORWhtQR8pP+itXgtbJkMkmHbmtDn0=
X-Gm-Gg: ASbGncuVLJnG7Tfxtl0A6Kggt8KVj9j3KQSNKar+tXcpaZ2PrwNyUfK4qpN72OJMax+
 55/iy4c/2Qgs8L90xBd85JUsQO7CcUqolysKhld2mT+WO+1fpKKAO2zQdS486rVrR/2kUMLz1VY
 wE/FL/dzR2AUyv1e4OE3PZjTAbw91zMMp7Xs/aYjHTvl3CcjVi/8Tamc7aRLqSOzq82l2BHqusC
 9zC9pO/q7Cfc/C4UBxAVjhPTfFIML8mQfQ1aD8E+SLB2qMO4oL4Omfvjao9XoeTf/mwM9AB7Wd0
 NZ1b3IefKYGMN9RvXf44R7Mb6u+6
X-Google-Smtp-Source: AGHT+IHCuhzYGqjM7OMTve90iR1j8XFebNBtkTkIKGYjS/wsA5tL1AQ8GBbxxbXPCSDChA0ruh8bkA==
X-Received: by 2002:a17:902:e886:b0:216:7d22:f69 with SMTP id
 d9443c01a7336-21f17f06218mr86822985ad.50.1738835943892; 
 Thu, 06 Feb 2025 01:59:03 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f365616ecsm8768815ad.100.2025.02.06.01.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 01:59:03 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 06 Feb 2025 01:58:47 -0800
Subject: [PATCH v2 2/2] target/riscv: Mask out upper sscofpmf bits during
 validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-pmu_minor_fixes-v2-2-1bb0f4aeb8b4@rivosinc.com>
References: <20250206-pmu_minor_fixes-v2-0-1bb0f4aeb8b4@rivosinc.com>
In-Reply-To: <20250206-pmu_minor_fixes-v2-0-1bb0f4aeb8b4@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

As per the ISA definition, the upper 8 bits in hpmevent are defined
by Sscofpmf for privilege mode filtering and overflow bits while the
lower 56 bits are desginated for platform specific hpmevent values.
For the reset case, mhpmevent value should have zero in lower 56 bits.
Software may set the OF bit to indicate disable interrupt.

Ensure that correct value is checked after masking while clearing the
event encodings.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index cf713663ee56..0408f96e6af8 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -390,7 +390,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
      * Expected mhpmevent value is zero for reset case. Remove the current
      * mapping.
      */
-    if (!value) {
+    if (!(value & MHPMEVENT_IDX_MASK)) {
         g_hash_table_foreach_remove(cpu->pmu_event_ctr_map,
                                     pmu_remove_event_map,
                                     GUINT_TO_POINTER(ctr_idx));

-- 
2.43.0


