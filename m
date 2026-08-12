Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA742C5B56A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 17:45:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuD0a-0002xj-6H; Wed, 12 Aug 2026 13:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuD0J-0002nw-TD
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 13:44:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuD0C-0007cV-S7
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 13:44:36 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-38de840f2f0so1130771a91.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 10:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786556671; x=1787161471; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rOQkVidkXGCU4X6LBKsJvJHPV73NIi57GitFKMqrLX0=;
 b=U4Z3/TV7+O2mhdO9r1Bc3fWPjxSbssWEwKU1SAKEdNkH7IHDn+5jGfPy6tPRttakh+
 b+freKjm6suBEX1aDrR3sut7VSWEhKnO6MTF+WZFaLSr++wLrssixjI0RRbfqMoIb0hI
 8k17X6osH6/5U5sHAUWGzxx7EAGL4HAspbnPjIsCWLzFC1ntOAeUtlg8+fVgw0Zu6b0M
 P1ASKLtteGg3gpV+av2heyviWjJpYankhNxpLt4hTVbMFJDPHbOp1j/5crW1EMf1CKEd
 cyv6A4wszcZ0J/bVT1aV9dzbSMsA8xjOJU1UV7oZ/a8eo08UihQJsQIH/YYvHYvzj0UC
 vV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786556671; x=1787161471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rOQkVidkXGCU4X6LBKsJvJHPV73NIi57GitFKMqrLX0=;
 b=qx+uo4/cvgRTa4dpvyHKa0wy+ZvLPxC3TgQw1mnvAX0UeoCI2EiP58Z3rVLLjIaVMX
 kq+9s5tOIgilQLRWBsu9gahLgRaRkc+Jxz+Woww2PNZu7aH/xvXCgFl3EeFIJraiXewe
 FPdOr7wdyQ3IWTgwSmsdUv46EA5oKlEeCzbUj4LmLQG1eEw+kLGM1ICGi1MsIDVt8YBK
 lV8z7eNajkE8043vMZH5OsRJd2S56EQI6/5EiYmBbIXQeCQ1MPVIO0MSmr66PeziXczI
 eeIfcACzCiZMn18lciJrtzyNdlUbRpSfOzfvfplcTWN5wsZLN5OIQnp0Qz9qbuYQh4gj
 3Okg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpw92kydo2I4S0jUAmlubGXhRB0XOeWMR+NnFZmr3T7Rd4/OEiC7CyjDUwJZh0UYrxMj1nk5ifh519L@nongnu.org
X-Gm-Message-State: AOJu0Yw4eQ4WAbAvA1aENu2CPkxWjrKdMTiP7yu9ESt3LlKnzz0fIAld
 WPF6Qy4VrRgtcEV74cPa/XgKMK5K03BZ5GQ62V/3sJLRrB8r8ICKw0E0FXu3+CFPijsJ/2b5VU9
 tvqT5
X-Gm-Gg: AR+sD11WZEfbQCHXikwBgchG6zsORbfJbNEZuvdOk4ucgTtdoKQPkWixY2H9m0jYDmq
 BeWownx7oRk4Gk6BRBftidbXgoBrMsKRN/WnBo5+RrDb72yUdkvZv39v3ioPEuez23UmtOBSEQA
 xDYCTDQQvyBuQjmvSQDhqq7lA+sEtsLR5bkGt0eOo5H1gb/GHMV3SPGJTvgwEyagcChvDhEh8Rp
 lQppeAzbPqLfO8TiFrLth8RrYQz/4Xoc0+eTTkSM6fRkRMtg/161SzTLPMMrzNQo7IUcNjbHNG5
 ahk5mi4CXTIucoU8X5+plaqmcqkE5JzaJiO5pxtYw/gFpH9tYel/HvTMtATpLZHyQnjnLdExDb+
 mWLpEW5U4GUgVD13tllMAM6kdUT9okVuikWCHWSlvHL4fE+vl7Hg8eTwRpGpshyyuC4a+cQBTsa
 q3C7JLRX5hqqtHn8UCjqI722BsuReqMaNQtO16wVk+DBo41Gk1YzbQt8J5EJGFH9NXF1NJmzgeJ
 jOhDfh0enj4gGOQkO1hzJQQTsnsY2U8FEdxnu3Oe8PiZRSpTiwDReQC+7Ndh3q1
X-Received: by 2002:a17:90b:38d1:b0:380:21b7:e727 with SMTP id
 98e67ed59e1d1-393014cac5dmr6841255a91.14.1786556671046; 
 Wed, 12 Aug 2026 10:44:31 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931db13c3bsm13210a91.3.2026.08.12.10.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 10:44:30 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 2/6] target/riscv/cpu: List one implied-ext rule per line
Date: Thu, 13 Aug 2026 01:44:12 +0800
Message-ID: <20260812174417.2468981-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812174417.2468981-1-max.chou@sifive.com>
References: <20260812174417.2468981-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Every entry added to riscv_multi_ext_implied_rules[] currently has to
reflow whatever line it lands on, since entries are packed several
per line. List one rule per line instead so future additions are a
pure append.

Suggested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 58 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e643d7c7af7..fffb92ff110 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2818,20 +2818,50 @@ RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
 };
 
 RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
-    &ZCB_IMPLIED, &ZCD_IMPLIED, &ZCE_IMPLIED,
-    &ZCF_IMPLIED, &ZCMP_IMPLIED, &ZCMT_IMPLIED,
-    &ZDINX_IMPLIED, &ZFA_IMPLIED, &ZFBFMIN_IMPLIED,
-    &ZFH_IMPLIED, &ZFHMIN_IMPLIED, &ZFINX_IMPLIED,
-    &ZHINX_IMPLIED, &ZHINXMIN_IMPLIED, &ZICNTR_IMPLIED,
-    &ZIHPM_IMPLIED, &ZK_IMPLIED, &ZKN_IMPLIED,
-    &ZKS_IMPLIED, &ZVBB_IMPLIED, &ZVE32F_IMPLIED,
-    &ZVE32X_IMPLIED, &ZVE64D_IMPLIED, &ZVE64F_IMPLIED, &ZVE64X_IMPLIED,
-    &ZVFBFA_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
-    &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVKN_IMPLIED,
-    &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
-    &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SHA_IMPLIED,
-    &SSCFG_IMPLIED, &SUPM_IMPLIED, &SSPM_IMPLIED, &SMCTR_IMPLIED,
-    &SSCTR_IMPLIED, &SSSTATEEN_IMPLIED,
+    &ZCB_IMPLIED,
+    &ZCD_IMPLIED,
+    &ZCE_IMPLIED,
+    &ZCF_IMPLIED,
+    &ZCMP_IMPLIED,
+    &ZCMT_IMPLIED,
+    &ZDINX_IMPLIED,
+    &ZFA_IMPLIED,
+    &ZFBFMIN_IMPLIED,
+    &ZFH_IMPLIED,
+    &ZFHMIN_IMPLIED,
+    &ZFINX_IMPLIED,
+    &ZHINX_IMPLIED,
+    &ZHINXMIN_IMPLIED,
+    &ZICNTR_IMPLIED,
+    &ZIHPM_IMPLIED,
+    &ZK_IMPLIED,
+    &ZKN_IMPLIED,
+    &ZKS_IMPLIED,
+    &ZVBB_IMPLIED,
+    &ZVE32F_IMPLIED,
+    &ZVE32X_IMPLIED,
+    &ZVE64D_IMPLIED,
+    &ZVE64F_IMPLIED,
+    &ZVE64X_IMPLIED,
+    &ZVFBFA_IMPLIED,
+    &ZVFBFMIN_IMPLIED,
+    &ZVFBFWMA_IMPLIED,
+    &ZVFH_IMPLIED,
+    &ZVFHMIN_IMPLIED,
+    &ZVKN_IMPLIED,
+    &ZVKNC_IMPLIED,
+    &ZVKNG_IMPLIED,
+    &ZVKNHB_IMPLIED,
+    &ZVKS_IMPLIED,
+    &ZVKSC_IMPLIED,
+    &ZVKSG_IMPLIED,
+    &SHA_IMPLIED,
+    &SSCFG_IMPLIED,
+    &SUPM_IMPLIED,
+    &SSPM_IMPLIED,
+    &SMCTR_IMPLIED,
+    &SSCTR_IMPLIED,
+    &SSSTATEEN_IMPLIED,
     NULL
 };
 
-- 
2.43.0


