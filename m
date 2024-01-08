Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EECC47074
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 00:14:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMdH0-0005yX-AO; Sun, 07 Jan 2024 19:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdGz-0005xy-6P; Sun, 07 Jan 2024 19:13:45 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdGx-0000IS-Hd; Sun, 07 Jan 2024 19:13:44 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d3e6c86868so11085865ad.1; 
 Sun, 07 Jan 2024 16:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704672821; x=1705277621; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ydyQcpoWwEBe73HeZcT4G88tDIBP8gJ14l5X8kcFbbM=;
 b=fu0lqz0+ffhOW8dzQnXy9r2q2y5BKZqYnKx7fql8O0eNC7BPflZSlgk4xEZ17+ZqeW
 sSaIuC/ie50DPxv/BYVU9D9JlMpU8tQBU86KfOLMiCIaQhGYAOCXUCmMgXiRTXEBPY+B
 PFejHSnupfbBzK1aF0/WBLAni5Lz7tEAHfi9uN/UibyHaEhJ6cIWmaAiL+aY/KNILeg4
 W4kjJRopEnPdLF498z1GSFH9JLA1W9ni/+ZmhxkzpfRv1p/phpIz34ctA6dmFRPAIspu
 hOr2FYAUyUEmhf/bTF8DVhMMJmFD3d5GCDCJpzjL+k+9twMgfQHdOwx8+o05tFQZzyib
 i9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704672821; x=1705277621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ydyQcpoWwEBe73HeZcT4G88tDIBP8gJ14l5X8kcFbbM=;
 b=q/wQaqT+EdQk9mW4rbOWc/La5RJZRQ/Nb7f/idaitoyhFx+N+1/qZYsYSQ27IicFQw
 9uyk3LpLaBU528DuoiypeqiGcL9e9tUwdwcUy9QMXAMlfD2StJSt1JC5qZbHyQzXM994
 Ru4jj9YQXzJVL7D5TBYH+GjxN/woe5yz/LjpdXtfxTSg5mtbocd4PVyPLRBzLEgp3LtA
 3yAj0yxfpLp85/dsOFqHQ5KYVL2nD4rAA+f248RBaKGX43j3IbW8xrQIdD8BS+E+9yN7
 ogj7hVVI0nw65E4WgI3g+GcVX4LOotiGq1y1mURUyZRT1mVv8jatET7E0c9moe3u47+N
 2DNA==
X-Gm-Message-State: AOJu0YwLlnbBLBH6QLZp3+us/Q9OBykTE6Z5tdL1lvYSt4BG3Ql9JB7H
 pH5FbCZQoWgurJn1ggyEJks=
X-Google-Smtp-Source: AGHT+IHdHUcyp/ly2k/G7eeBGv3Zh5M9TU4WmWE7CKh6o0oAWBQEnBN2t8AA3J06Zjf2QKEq0t3cvA==
X-Received: by 2002:a17:903:24f:b0:1d4:75c8:6d2d with SMTP id
 j15-20020a170903024f00b001d475c86d2dmr3811976plh.49.1704672821594; 
 Sun, 07 Jan 2024 16:13:41 -0800 (PST)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a170902b70f00b001d4974385d4sm4943434pls.250.2024.01.07.16.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 16:13:41 -0800 (PST)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 dbarboza@ventanamicro.com, bin.meng@windriver.com, qemu-devel@nongnu.org,
 liwei1518@gmail.com
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/3] target/riscv: Assert that the CSR numbers will be correct
Date: Mon,  8 Jan 2024 10:13:26 +1000
Message-ID: <20240108001328.280222-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108001328.280222-1-alistair.francis@wdc.com>
References: <20240108001328.280222-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The CSRs will always be between either CSR_MHPMCOUNTER3 and
CSR_MHPMCOUNTER31 or CSR_MHPMCOUNTER3H and CSR_MHPMCOUNTER31H.

So although ctr_index can't be negative, Coverity doesn't know this and
it isn't obvious to human readers either. Let's add an assert to ensure
that Coverity knows the values will be within range.

To simplify the code let's also change the RV32 adjustment.

Fixes: Coverity CID 1523910
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fde7ce1a53..336ec7eda7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -195,8 +195,11 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
 
     if ((riscv_cpu_mxl(env) == MXL_RV32) && csrno >= CSR_MCYCLEH) {
         /* Offset for RV32 mhpmcounternh counters */
-        base_csrno += 0x80;
+        csrno -= 0x80;
     }
+
+    g_assert(csrno >= CSR_MHPMCOUNTER3 && csrno <= CSR_MHPMCOUNTER31);
+
     ctr_index = csrno - base_csrno;
     if ((BIT(ctr_index) & pmu_avail_ctrs >> 3) == 0) {
         /* The PMU is not enabled or counter is out of range */
-- 
2.43.0


