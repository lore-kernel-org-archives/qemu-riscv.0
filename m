Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C56C7115B
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 17:22:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uTkrU-0004Sq-VE; Mon, 23 Jun 2025 13:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uTkrO-0004R4-F3
 for qemu-riscv@nongnu.org; Mon, 23 Jun 2025 13:21:35 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uTkrM-0006DG-8T
 for qemu-riscv@nongnu.org; Mon, 23 Jun 2025 13:21:33 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-236377f00a1so41504025ad.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Jun 2025 10:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750699290; x=1751304090; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0trTbrlEckBm1D/wCLK5pgkruWisL1/jrSdP5YRGaVY=;
 b=FWDED78Csyr9Y1J0LUWgPTAwvxW6iy2lgTLJvJ3uhQyJYe0/8NsNH/a3PtMrVizHQS
 jP9DimSaBu6lABZTi1Aq5Ee6tv3u0kqOs3O+z5Abz3EdvnRK2TgcyttUnhRWIlvCW+rv
 w6EXlOfvTWdFAU0LgK50PcOabO2H1QhMi+iLEfch76agwoYJ+aMrCtCOCt9E0ILxbIxf
 kYu0iplbepU3Dz/LuPNLev0HF2p+47GvfXSP6wbz9bkPdy8FNDDdOB6ha3/5/VutgBuN
 BkU0CZLlccej82k950u3gw2XyCto43PxyDvfv/kFnmchUA7vv7uRuwhcwMf0CNrQhTnc
 F5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750699290; x=1751304090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0trTbrlEckBm1D/wCLK5pgkruWisL1/jrSdP5YRGaVY=;
 b=GSHemeDvUHBhg504XjpgMG6SmQkbNU0cMDq2EEZ1PMT7fGJKIYWvnW71rlYsktfm1H
 muLN8uzJMg1LxxlyQwAvwr8/CmOo/KhL6fGDLYuk0L+rSJD/HnQ55Lsr3OaXJejkJlbA
 aJlureZaVxQ1aNUy4+LBZKMK5k8eZIPECVcya37eL9v89p01TcbxUiJSAvDk3/TN9Cbs
 z+sY0NQBbO6oyemMwDgprz2L5GA7ZLbX9aG1StS8D4q9A6VE1ecXTCMYpqOn31oN0Hmd
 BEVAicox91K8xxesXAMesefncJiFuKAVmZS4rIsYaiI3BEXdt99m7vaM1zopKebZ2q4A
 cqvw==
X-Gm-Message-State: AOJu0YwEFXowmujNw6JZaxcAaL7hzGZbnGXhc1W3AHTFULxXFf1VcZUX
 szhF8OfX5zpnp+o6fyDPS1mcbPHCkvd/esyPIgNbHuZYLuUu10TrLHlWK74+W+QO4tM=
X-Gm-Gg: ASbGncufiqB+uRft8oI3zu4udTLaWGky1Ra7Zcv+9TRnt1yoINZhNxcUj/Af8qSNSjS
 ju/Oo92uHVu4KAYz/4n3KsRcJyD7ywV5eLKl5DIZiDWU36bLjysMVOqNwpEl3PN+AYWq/ZsyGPd
 Sqxfgd0c78lJa1icIN3CrfPfLnLSisq0G1Yb7bc/t65xewiFTmUqyRujad8KX2GVjlTpr7EF960
 PDxpZA6OlWmpw9i557BIuC18mFwrRzmvRWrJWK4LL8hlh942GA+eegqUFNQDPjk7djtb6iRo9/2
 Pis6B2MDWeBBZMqKup6XJS8Wg656SSv7rn3VCZOJs0oxXRjycRakI4xQ9GLZMvU7
X-Google-Smtp-Source: AGHT+IHufz60AlBSXwE2Mmah7pM7H1tLCjNJ2PFTwAA90KfaJlbOkWadh/52HZR8R6WNgf0ggF1wLg==
X-Received: by 2002:a17:902:f68f:b0:234:d2fb:2d28 with SMTP id
 d9443c01a7336-237d96e2305mr222750045ad.2.1750699290527; 
 Mon, 23 Jun 2025 10:21:30 -0700 (PDT)
Received: from grind.. ([191.255.35.152]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d873845esm90847525ad.243.2025.06.23.10.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 10:21:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/3] target/riscv/cpu: print all FPU CSRs in
 riscv_cpu_dump_state()
Date: Mon, 23 Jun 2025 14:21:18 -0300
Message-ID: <20250623172119.997166-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623172119.997166-1-dbarboza@ventanamicro.com>
References: <20250623172119.997166-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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

We're missing fflags and frm.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 67e4eda4f9..95d0b88937 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -593,6 +593,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
     }
     if (flags & CPU_DUMP_FPU) {
+        riscv_dump_csr(env, CSR_FFLAGS, f);
+        riscv_dump_csr(env, CSR_FRM, f);
         riscv_dump_csr(env, CSR_FCSR, f);
 
         for (i = 0; i < 32; i++) {
-- 
2.49.0


