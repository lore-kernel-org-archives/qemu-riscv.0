Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C601C02183
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 00:50:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tYE4x-00087Q-Us; Wed, 15 Jan 2025 19:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tYE4q-00084P-UB
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 19:49:41 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tYE4p-00013q-7J
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 19:49:40 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21631789fcdso19354145ad.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 16:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736988577; x=1737593377;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lgkkhzulTnPKcpEBmv5wI+O/YgsMfxY7bx5/eHF5LmE=;
 b=o60CLDO2mvh6NQbaTgsK++qc94WRToo1DBVvQ4UJSYZ4/I3xwb6EKwXToNHsv+lwd+
 bY9HmMT5m4POPLWxiKQZBh+rOfcWg+xQzj8Uz3XeB8LBJ2ZDvJP+FVRQCki5JPl8o1mP
 PyxPWvQFEy2x4tBFgRplQYSwxSgJGLpDpBuRr8qPpGwmlaRp64QtrJHBqVTxnTwi0qQv
 TngzHpPvlFBVMnRs0amvls6iYYDwPwkCleAyPeCKCkihLkKy0WFfRJtkA41QVyNn8hgg
 LNLGi1eFYzAGtB/VRZOlRhNAZ81Hz3zwCRrpXACeshSwkcKeSuv+xE7toLRPD040m4O4
 MEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736988577; x=1737593377;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lgkkhzulTnPKcpEBmv5wI+O/YgsMfxY7bx5/eHF5LmE=;
 b=YzkSarcl0hOA8D9swTWCU8JLUzQUQ2Wo6oFBvOIpRl8Fk57LgXRpXF91KyhZH20hgF
 1QEX5r94S2Y16cAiRY0KJMGi8e+37JO2rp/6Pa0lfNHiRETbh66mA/rIpcQHUuBKOMul
 ayxRs3SvSucS/OLfqKTkaBwCba0gvbc4qfsLgiTapY7rJgUyPM02wF+wmhJqiPMaN8XQ
 EWnnMKhAsbFdyZRZeVE2kNb/CrBdtFHyvKF3ttuuGJx9E/oON3FyINM7W6Kpr/bvgwso
 /GfII5VxV9W4SoCy80ThHKVfNJVkLVpV4R0YZb7uqflvaBV0yEyJ9vYeUlCCMh2ui+It
 hvTQ==
X-Gm-Message-State: AOJu0YxJKHLXfUlC2CZGvqgmHivac2ywXgC/XCAxLCo2Yy4Q+dfJYs5s
 pDMiH42MW1qsySbixYPxXGlaqJm/w6rnZtL5weThUeFjHc/zYa/kVBOGSM8IS6Q=
X-Gm-Gg: ASbGncucL9fIaR63ytzzm2ENHoJg8vQ1BD8q219d2v5opvP4xuuoJbAw2KYQlIPZOcc
 fNrQKHxDR9e6lIvzHKbJDw6gAiVnlPOYNt5TeylzJ11kLakQO4SSx/BmoTmeBZYLo70H3+Oy1EJ
 MasS2YvsF7N08bGYj2c53uqlo6ptATWoAKBYYDho3t9zUwixlk0s0FwDq1QCLaRPg4JQUvF1pfo
 l4PEpgcSU2I2f6TZLLQMBWUOC9e2NIsVdNw2vng4BU9z+5Pnu2CiB1CXlQc9yTbIu4jTg==
X-Google-Smtp-Source: AGHT+IGjMuzuTMLEd6F0ofghXzioexFDI380SwoYW+3GBbIYYSuSYVbZvijo0NwwH3yZBu3meDqU3A==
X-Received: by 2002:a05:6a20:9188:b0:1e1:9e9f:ae4 with SMTP id
 adf61e73a8af0-1eb0255b580mr7562798637.13.1736988577273; 
 Wed, 15 Jan 2025 16:49:37 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d406587a1sm10036256b3a.105.2025.01.15.16.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 16:49:36 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 16:49:33 -0800
Subject: [PATCH 2/2] target/riscv: Mask out upper sscofpmf bits during
 validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-pmu_minor_fixes-v1-2-c32388defb02@rivosinc.com>
References: <20250115-pmu_minor_fixes-v1-0-c32388defb02@rivosinc.com>
In-Reply-To: <20250115-pmu_minor_fixes-v1-0-c32388defb02@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x632.google.com
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
2.34.1


