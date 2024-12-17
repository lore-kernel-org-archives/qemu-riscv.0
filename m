Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F4EE7716A
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 09:10:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNTYC-0008RX-TL; Tue, 17 Dec 2024 04:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTY4-0008NJ-E9
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:25 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTY1-0001Yp-HZ
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:23 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436202dd730so35904995e9.2
 for <qemu-riscv@nongnu.org>; Tue, 17 Dec 2024 01:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734426439; x=1735031239;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOP7Hqao7kiNDStvwCeVXCCvUD1H/qgyxYLIdZ3OWV8=;
 b=NICwzmHebaBeFeUcmFfM/zM0IXEr3EEE3lGGhXLAn/7grFul54XDuwOEGn7thcHWBu
 4ZB7dEk6cbjH33707Z2xWRAkatxi7FzJBU1i/sFsmb/SDV3hq2n3lSr+16NHWuk2r3Du
 0CcvvcIYt71qR5WQan3JQVk+ckBKgBO6wkDwel4Wo/6R8uZF1iCNt4vezn894NbhVpK2
 xttoIcq9fDxg9VdI5vmPrVzG8Ra2yAiBaPb/ZmYBwsyhvZyWkUbnhFwY/7hZlnMXT1vE
 gdmbxHc9F56c2tH31xo3bZoD0V7495XkXxIDoutXcXIrvI48hPZqvDmIw4KdabWYZYT9
 Idzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734426439; x=1735031239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOP7Hqao7kiNDStvwCeVXCCvUD1H/qgyxYLIdZ3OWV8=;
 b=bbstTiH7Nap39iqJ1wGSXnIeIFWOEnLa+xZBO7P/Chl5PyHlnGcDsbMArEULNpV3Mc
 4UMVNq1NnHw/5JdaaWX8e8Gb7TjWQRMzmfl0VouGZvGHeVssD53fn05hj/gc3vdL7fxQ
 q3ww2XuBNwmNcVPNY6GY0tsusEBJlTzUUbw1046Ey8R1CIDwnxx+Cf6x2R4SFxs8Py+a
 AxQs9Khl54ZOhri/klTMHdk2qQt7a8fSvNYYQOcfxjYgKqEb+PlyxXJVW3wOIMZXiYel
 I0/HFu93Q3bztOTl/jOY1xc71zhlD7LZE9/nuUukerDjWLEsZWVcuMAWdu4y+K9GhFwl
 ZrDg==
X-Gm-Message-State: AOJu0YwK3vI9vq628tESGf911DVu8NcDFrn84zkKq8Tr/yH+/hak+RXn
 VdCgs4kz+Nfrm+CVaWWEcvonKKoPyG9QUtbAOCzFlgJr+6Capb9MsNRDE5tKae7hDQdeZvbfsfe
 BDj4=
X-Gm-Gg: ASbGncsODbT4OeXy7IWY9HAfJZ0+BNzyHSZ/wSdA0Fy9iRUZ0a4gZAbij59hArYwvGn
 a7K3Dvi/dWftqS50l5WttbRX3nxjE8NN3YVYl9c9rvd4fXyQgEtZefsdk9+Q0wb5WFhsrwGwcz1
 gQC9WWMJ2Y4BsJvblLEYN51c8nSHy6Pkl1nAVHOGY8n7RUQlk6COYMOZ5IsBumPHpK7NRPnvqAf
 WYd6tQ3wObO2vtaX3S9Y7SXeFK19Uxy0ccGZI2VNQeFWlyF5cA46s4hjQ==
X-Google-Smtp-Source: AGHT+IG1/qaNQM74O9mE85VtMUgHRXRyff+/ytiyti4AwKg+Z96ZfyDBhujJ7JcB/jKgGucoOsVnfw==
X-Received: by 2002:a5d:64a1:0:b0:385:f092:e16 with SMTP id
 ffacd0b85a97d-3888e0c07aemr11158473f8f.55.1734426439099; 
 Tue, 17 Dec 2024 01:07:19 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046c46sm10704122f8f.71.2024.12.17.01.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 01:07:18 -0800 (PST)
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
Subject: [PATCH v7 7/9] target/riscv: Implement Smdbltrp sret,
 mret and mnret behavior
Date: Tue, 17 Dec 2024 10:07:03 +0100
Message-ID: <20241217090707.3511160-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217090707.3511160-1-cleger@rivosinc.com>
References: <20241217090707.3511160-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


