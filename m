Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E0CC3ABCB
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 May 2025 04:12:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uF3T2-00022s-LQ; Wed, 14 May 2025 00:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uF3T0-0001zF-VT
 for qemu-riscv@nongnu.org; Wed, 14 May 2025 00:11:38 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uF3Sy-0001jB-RR
 for qemu-riscv@nongnu.org; Wed, 14 May 2025 00:11:38 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-30a9cd61159so432272a91.1
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 21:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1747195895; x=1747800695; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1A6Tdq+NlocQQr+dW43vTkDs6+pSgcMdXP/qV+lPTUo=;
 b=ilmsAxtmrG0uEHZnamDZTyxMGKuf3/EQxzIPMsuCpvHgBaZgDZsgz9szUFN/UNLsT3
 dJDcOxBcYIQHbYDmDSt+tST49ojNViR8JZR7ldLoykDOIY6qhKzrrecup5Fsz/dlWRV4
 K+0h3owIBoyfx4P3MoVkypNWD907ZvVvEXzcqG7m0hzvUPZV0gkBT3NwBhTorOr3Se80
 BC5VBG9pp3v7AXOJILAKmbtYQjY+8VUmBJ2JnEVAvEJlP7OiZBLLD7UdJbk0/SGqneTo
 W4CUYcgMrFYmcuRLPpJzpqQ6DE4sjBDoKfHIagtwjcTNZtRps1HZDMJmJV2dlO87ESbY
 THRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747195895; x=1747800695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A6Tdq+NlocQQr+dW43vTkDs6+pSgcMdXP/qV+lPTUo=;
 b=luK0LPPBPq7rsaZ2/PjG4IF+O0wk6+pDByZw/Q4ZYCwcAZkv6EaGKRTpptVGuhXAnK
 S55qUAx7YjIXJk7tdlmrekVYVCA8gd+gqadg0An6r8Kkz5Bs3hIcFNtp6ZAeZ4H+Bhcc
 sw5S0QH5YmXv4miCpkbvEHwg45h+JRXfcMXEfHPx+BFhpkFL0tf4EDJ/FTGkzVgee9F4
 0qQrVM9L91z2Xr3TEWHC9RaoQzzUg/7fZPS3iKsisT4+KW05O3ieNYgd3I1+zzH+3m0P
 dmNrff4gkB07ail5vadcDuLw/O0JQKa443TiK163yZNObURzs+EZA9uSVDs5VM8djVI6
 GAFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfY3DOCZOaQyC2kSS/4PWhEjCsX1SX9uMjMH/Rr3OXA+sQ0P2Cd7W5+NeEMKpfFDReRcYvgYZDmSvi@nongnu.org
X-Gm-Message-State: AOJu0YziwlXqeq6g5ctuH59+TwZa/XmeM3E2wJt4+crHWf10XUs+wgxx
 r6kJrIe/3GqXwJEgYm5ZANDSR7gmWB9lZD7DdslvisTOHlTfY2eth611VXRwZ1c=
X-Gm-Gg: ASbGncu8iAL06EqXVZP1g7OoWId7wMARXWK5rdSczd2bH93Cmoe9gusQAHtuAmn1XS4
 AwSrB1ym781yfZMthXAHHvzTi0LYDDW9gkkRqDPtdea5Y2aioVlEcnSZb091c033UVq/88lxJJJ
 3m/RQKDTPvG7wvJX9d1nPWSrTfXRIQKmkDirKLebrCOHgVv/4YC1PF+992mBcjWn8ECy5dE5C2D
 PPTC1Inx3EydrQYTX85WPlVEWRtgkP/BMoYQPt6bHiDEie15dGVQ929MBjl7FI7vf6nAcwwFMOP
 dvn/PpxAKlRjBH3jBQ3ypLlIs+uytg7VDyJ8bFBrbg9FgtAk+42wwF3jJXIwOJgaJ2uCfY4QHrK
 f3Y4=
X-Google-Smtp-Source: AGHT+IGbn8Wg/ANip1Vr5TSN3ZvLJF31+rLv1UOgk+0WGEUycv8aF2qmAOByzPeAvwLSWvnVQMdUTA==
X-Received: by 2002:a17:90b:51cf:b0:2fa:42f3:e3e4 with SMTP id
 98e67ed59e1d1-30e0daf5dd2mr8260370a91.3.1747195894836; 
 Tue, 13 May 2025 21:11:34 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e3354b633sm533552a91.49.2025.05.13.21.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 21:11:34 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>,
 Jerry Zhang Jian <jerry.zhangjian@sifive.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 2/2] target/riscv: Add standard B extension implied rule
Date: Wed, 14 May 2025 12:11:18 +0800
Message-ID: <20250514041118.1614-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514041118.1614-1-frank.chang@sifive.com>
References: <20250514041118.1614-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Add the missing implied rule for standard B extension.
Standard B extension implies Zba, Zbb, Zbs extensions.

RISC-V B spec: https://github.com/riscv/riscv-b

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 27edd5af62..f737b703da 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2532,6 +2532,17 @@ static RISCVCPUImpliedExtsRule RVG_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule RVB_IMPLIED = {
+    .is_misa = true,
+    .ext = RVB,
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
+        CPU_CFG_OFFSET(ext_zbs),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZCB_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zcb),
     .implied_multi_exts = {
@@ -2910,7 +2921,8 @@ static RISCVCPUImpliedExtsRule SSCTR_IMPLIED = {
 
 RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
     &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
-    &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED, NULL
+    &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED,
+    &RVB_IMPLIED, NULL
 };
 
 RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
-- 
2.49.0


