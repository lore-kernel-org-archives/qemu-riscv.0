Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA80E7719E
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 12:56:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWEYN-0005av-1V; Fri, 10 Jan 2025 07:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tWEXa-0004G6-Ji
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 07:55:07 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tWEXX-00010I-Fu
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 07:55:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso15208565e9.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 04:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736513700; x=1737118500;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTCLjoP17doq2guAu37UKxNoduJWAXBrSqWmmRC0mqk=;
 b=l3XK4/uY2G8C748igqtBcc4h20cg1jv+2W1TtQSAM3AewEGTEDNsyZGycbfkOy2siw
 mpEmJYF15cuFC++/R3bLrP9/v+UjgHsszDISfCb/YIokBiql7MF5NzbeXyemZcgzaSeR
 a+L+LEvzyCu27/dQK9BQN0FJzwxMEIjGcLihZJjurZ9yRUXWv7+xU9vFHWPX3RbSZ3iN
 8UyaehGNt+cfXBmD0FF4H1pHd7qYZNqv94mylZT4x6MR3CsofFQPL2TS7whZ2ElmahKo
 /9qFlndgRdZd6OdxMVzse4R5fqu+kjsovQzcyFrMo0z5oj9xX8/hxInCZ6NmxI6jhGal
 1Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736513700; x=1737118500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTCLjoP17doq2guAu37UKxNoduJWAXBrSqWmmRC0mqk=;
 b=wTQvneSEycnnPcAD5F+JrT5DwNfswnaP4n+oe6XGE9tUvWrP5hPEFeNX/LaZDW/l3q
 UHzMuHQJBqJvlZQaft3s3tcwZZaZI0dMW2w6oDZ0JCodvxBmGeKOW06GzEYQnbxHMtjt
 R6cngAiy7cLFxeHqlwop9vlIDsYruAqTFJUKrRzNHmGtY+kXCXC1o5Oh7JQRAbVMW4ZV
 BP1kBZBnQdH6BulmrOZUUxUaOaAROaGLQJnghuGbXzBRHntm5gi56GBcN6rx3IkU9IM4
 3bphTN2ZNJmXyUrCIUPnHnXyhLZ4tqVRbOcNClQlE/E8SAzjTMocaEtuJOfgR41xIoY+
 e7Vw==
X-Gm-Message-State: AOJu0YxOkx6zHfyY7Bs7pjyv+VTxxCJx52XwoSNHj0BtLjaKyR9wZIgg
 gYHVO1CMchf/iXdmYwOBRbDcrY0cBzMJc6uvvk9JncwoY0vm3c8S/m5WtxF8ev31zPwJNZeVoZJ
 /
X-Gm-Gg: ASbGncsxZF8F4ucsn6QkLH5ISiME0jRZLiNygjWI9OsL8b3vv5Mc88m2F54zSjJGRa+
 1Q9tyhAlLfu39/LphoGbejAJKrCkL6KrnHk4DCGQ+JK0HZ/qvyEL+JLq0KKecaHkHjGhiOWi/Ma
 EU0a41cXRACHg7mv8JMx7hVmYJUfM+fpG9sir21e7ydCzhPBaDucd2fQ80qY6d+6Yu8Z4CyW9AE
 JJfoU/iuqhHyOPRvnnOTO9OzyCMUTEtpINoaSWg/6SZ0y0gIZ2+pyg3+Q==
X-Google-Smtp-Source: AGHT+IE7HxD7hddsRMal6BijxL6C/PEH9dSmU2FsowmzZjQQI84T5f/r/I/X/JKdwUgHs7X+XT89XA==
X-Received: by 2002:a05:600c:3c97:b0:436:840b:261c with SMTP id
 5b1f17b1804b1-436e26ab54fmr92383685e9.19.1736513699770; 
 Fri, 10 Jan 2025 04:54:59 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1c01sm4548921f8f.97.2025.01.10.04.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 04:54:59 -0800 (PST)
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
Subject: [PATCH v8 7/9] target/riscv: Implement Smdbltrp sret,
 mret and mnret behavior
Date: Fri, 10 Jan 2025 13:54:38 +0100
Message-ID: <20250110125441.3208676-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110125441.3208676-1-cleger@rivosinc.com>
References: <20250110125441.3208676-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x336.google.com
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
index 59c4bf28ed..ce1256f439 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -306,6 +306,9 @@ target_ulong helper_sret(CPURISCVState *env)
         }
         mstatus = set_field(mstatus, MSTATUS_SDT, 0);
     }
+    if (riscv_cpu_cfg(env)->ext_smdbltrp && env->priv >= PRV_M) {
+        mstatus = set_field(mstatus, MSTATUS_MDT, 0);
+    }
     if (env->priv_ver >= PRIV_VERSION_1_12_0) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -391,6 +394,9 @@ target_ulong helper_mret(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
         mstatus = ssdbltrp_mxret(env, mstatus, prev_priv, prev_virt);
     }
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        mstatus = set_field(mstatus, MSTATUS_MDT, 0);
+    }
     if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -436,6 +442,12 @@ target_ulong helper_mnret(CPURISCVState *env)
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
2.47.1


