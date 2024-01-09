Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A06DC47079
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 17:19:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNFku-0001tq-Np; Tue, 09 Jan 2024 12:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNFkt-0001sf-W2
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 12:19:12 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNFkr-0004yM-EC
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 12:19:11 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e5451c13aso972065e9.2
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 09:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704820748; x=1705425548;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/e1lo51RsK7PB7U4/L0cmcttPiaIe/swqRAqrJ0m2Y=;
 b=Dm72MFRJDqlhWA23hOyOiwEM2E77jsRq46jTMrOgBrukPksoZ1pnnQ5J/KcpxykifK
 x7wdmzBbF+OmTd15v4m2/0hpLV9kb8EW8c8EDeuIki8TLdYXyBD37gswaNs8RXG+rH1O
 8HfsLI07r1nqLPS14xNjyElFKO06XH+OFC38FxXUZbwAaXHbSaxLRvBlDENyF5ZzDTit
 h6c57g03IkioABfSzTGeRmAPPN+0uK8biyQQTCtVFpucsJBGB/WnPL4MAx+bGmm98OnS
 1571iN5PrDIII3e1YgGyOhHYQpa+auBTViEZsqUPgX3eElfJf/5XSPFcywO7qcquTeq7
 ZQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704820748; x=1705425548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/e1lo51RsK7PB7U4/L0cmcttPiaIe/swqRAqrJ0m2Y=;
 b=WxbR+I9KRdP//2BInwn/PiPoZvwp77k/7mswRI4Yt2nOkN5I/OPSe08f1Q7md2KJBQ
 xFBvGeBfVjIW8Y8+r6AwWvIAhMcCssppl9UhN06tunxypwTX+vyZ1uUD0Z37upJeLiK2
 EWbTwyc82KZlw7p0ZGKsf/icOwM4+y+R1r7FL3ahiPnrP2wyvHAe6RhfGHvUGI1X1BzO
 kWT3ukBAdB9A1j3bpZs1FQ3cTC0glJxua4KDRmCeXQenSZTdFbRmcg2bOLFFnFLn12lT
 tdIZKDqXN2GI/39cjcvcaHr0TNzo1gq45py3N1zfX/LdInRExUhyGWZK2v1sm9PZueNd
 smXA==
X-Gm-Message-State: AOJu0Yw3cpFCfb+3w1qauiPKnej8jcL/E5lXPWVoiDUS/6Nmw2iOX3tl
 QSri2oxbu/DqHTv1RMQmF7oy9xwRuRzP3Q==
X-Google-Smtp-Source: AGHT+IHOEKWG42EhClf9orVWPN+86A3v91QKVtH/8kicHqWT2SVcPxekIC6K166k7Sy3ViYrL7tp/g==
X-Received: by 2002:a05:600c:511e:b0:40e:5320:2582 with SMTP id
 o30-20020a05600c511e00b0040e53202582mr139929wms.107.1704820748205; 
 Tue, 09 Jan 2024 09:19:08 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 bg30-20020a05600c3c9e00b0040d62f89381sm4350308wmb.35.2024.01.09.09.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:19:07 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 2/3] target/riscv: Add step to validate 'B' extension
Date: Tue,  9 Jan 2024 17:07:36 +0000
Message-ID: <20240109171848.32237-3-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109171848.32237-1-rbradford@rivosinc.com>
References: <20240109171848.32237-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If the B extension is enabled warn if the user has disabled any of the
required extensions that are part of the 'B' extension. Conversely
enable the extensions that make up the 'B' extension if it is enabled.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/tcg/tcg-cpu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index fda54671d5..f10871d352 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -273,6 +273,35 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
+static void riscv_cpu_validate_b(RISCVCPU *cpu)
+{
+    const char *warn_msg = "RVB mandates disabled extension %s";
+
+    if (!cpu->cfg.ext_zba) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zba))) {
+            cpu->cfg.ext_zba = true;
+        } else {
+            warn_report(warn_msg, "zba");
+        }
+    }
+
+    if (!cpu->cfg.ext_zbb) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbb))) {
+            cpu->cfg.ext_zbb = true;
+        } else {
+            warn_report(warn_msg, "zbb");
+        }
+    }
+
+    if (!cpu->cfg.ext_zbs) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbs))) {
+            cpu->cfg.ext_zbs = true;
+        } else {
+            warn_report(warn_msg, "zbs");
+        }
+    }
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -309,6 +338,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
     }
 
+    if (riscv_has_ext(env, RVB)) {
+        riscv_cpu_validate_b(cpu);
+    }
+
     if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
         error_setg(errp,
                    "I and E extensions are incompatible");
-- 
2.43.0


