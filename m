Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA9CD69113
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 14:16:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGfHO-0005l3-AX; Thu, 28 Nov 2024 09:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tGfHD-0005Um-L5
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:13:53 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tGfHA-00063p-WA
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:13:50 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-215348d1977so2285825ad.3
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732803226; x=1733408026;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOP7Hqao7kiNDStvwCeVXCCvUD1H/qgyxYLIdZ3OWV8=;
 b=2yPQ4CmvBM3nUIDIpNyBktjXHZZt0zJR6KItmBsGPlEwzdKXlAp8r0DEc7tBAQGTmD
 hsmE9TLUHgKK6QomY+I/TxwjyLHKEhiaXiuO2tNChd+TQxAj9KNJxD8FDRhYzSiZBfFg
 GnQgs4Fvrh7M3E2m0LjvoScjFtx6TYGO5LHXWKZQU4c3Ev4UebcsPlItz+Cn08ZFyFS+
 Dp56VOSZQAIawHhx36jeK1VKiFQM4ALCaCaxoI+YgUJmgybn8i3hZZ4o8/ix4O35v9t3
 Oj009XU4XSlI6c7FamRQ4puflXa++6jZNMoiwfH25HsHiC8dfUrXA3rs3q5bTPCZ1T5o
 sGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732803226; x=1733408026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOP7Hqao7kiNDStvwCeVXCCvUD1H/qgyxYLIdZ3OWV8=;
 b=pX9O/4G8lFxXROwrOlHDwJEzD88vUZaCX+MxNV09pVVMBdVpl9XvySjAe/fw3KFA5h
 fyPA3TRH66oxTHEstvm969itZMy6XacXBJgPYGwygm6GHCBZv8ws/KS2eR+DXQsiBPoL
 B1OssnRtwhIXMe0At/O+dMB/ENbOppoqZ/ZaT2jeb9jM4WoMawdmwWRQN3RXufOGnQFs
 efqxTmNfLBtPac3uXkRuEeenJKAFI4CAH9Yto3kuEYorkQAcv+pBg7XoaIE1PZGLBW8S
 G6GmQwU77cPQcKAaSutr3dMd6ageqx92R28+dNhWdJ4mDfZd5C+LWV5GJB+ZVF8dx8N/
 iI+Q==
X-Gm-Message-State: AOJu0YzLLX3LJUR6K1baVkPq9Y7iHqY9LLG2bCBESf7v50I77d906Nhi
 NdI6ME2sXqzEkFp6x+rOumFO9ZwSFs2XS5XUIJMib+IW48e6FafHuPYMLTM7m9ATBbXdZigmxHM
 H
X-Gm-Gg: ASbGncs82h2pFWSCzWi7SVb7v5N5Gi3isRLw4EwKe6pD+YjK9bjfsgcYcS7F9HOpEhr
 UeFEvEvme2KwP6dw65N8LK+ltNrxz1jDvmdWslh5yR3DOhmlRJdePkk/QOGaUQtFI0uzCuYHB7E
 9EiaD1u7MBPNb4eGw7L/JjHPN9MPNXbymYGdLQGfSTIIepghOC0mQuJbcFuF8Y4JBoMK2rHnq6W
 5b6U2fAa9m6UTlQ0rhAtU4gySEpIz7JC9PiBf+0iUyyovPqMpI=
X-Google-Smtp-Source: AGHT+IGpSoh0+KuaUmbtzf7psTJL2sEZHjOMJGTPxqPhdzCChYmOavow3xeHBSZMOHxavsOGbeO9Tg==
X-Received: by 2002:a17:902:f64c:b0:20b:7210:5859 with SMTP id
 d9443c01a7336-21501d587d8mr96068425ad.38.1732803226644; 
 Thu, 28 Nov 2024 06:13:46 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215218f452csm13829005ad.48.2024.11.28.06.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 06:13:45 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 7/9] target/riscv: Implement Smdbltrp sret,
 mret and mnret behavior
Date: Thu, 28 Nov 2024 15:12:27 +0100
Message-ID: <20241128141230.284320-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241128141230.284320-1-cleger@rivosinc.com>
References: <20241128141230.284320-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=cleger@rivosinc.com; helo=mail-pl1-x62f.google.com
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

When the Ssdbltrp extension is enabled, SSTATUS.MDT field is cleared
when executing sret if executed in M-mode. When executing mret/mnret,
SSTATUS.MDT is cleared.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index eeacb2d1a1..9de4df207c 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -299,6 +299,9 @@ target_ulong helper_sret(CPURISCVState *env)
         }
         mstatus = set_field(mstatus, MSTATUS_SDT, 0);
     }
+    if (riscv_cpu_cfg(env)->ext_smdbltrp && env->priv >= PRV_M) {
+        mstatus = set_field(mstatus, MSTATUS_MDT, 0);
+    }
     if (env->priv_ver >= PRIV_VERSION_1_12_0) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -384,6 +387,9 @@ target_ulong helper_mret(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
         mstatus = ssdbltrp_mxret(env, mstatus, prev_priv, prev_virt);
     }
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        mstatus = set_field(mstatus, MSTATUS_MDT, 0);
+    }
     if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -429,6 +435,12 @@ target_ulong helper_mnret(CPURISCVState *env)
         env->mstatus = ssdbltrp_mxret(env, env->mstatus, prev_priv, prev_virt);
     }
 
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        if (prev_priv < PRV_M) {
+            env->mstatus = set_field(env->mstatus, MSTATUS_MDT, 0);
+        }
+    }
+
     if (riscv_has_ext(env, RVH) && prev_virt) {
         riscv_cpu_swap_hypervisor_regs(env);
     }
-- 
2.45.2


