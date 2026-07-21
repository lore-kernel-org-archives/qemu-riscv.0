Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25FDC44529
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 12:23:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wm9T1-00021E-RB; Tue, 21 Jul 2026 08:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wm9Sr-0001yj-U4
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 08:20:49 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wm9Sp-0003nI-VC
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 08:20:49 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-ca97d139d8dso4712848a12.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1784636446; x=1785241246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UDmKj9ojGbNAJQJDYvvRAPXarsrqhccfsavTta3uxqc=;
 b=FaYKmApYnYkN8Nh1n0DLfH8nOhjzZ08nZ5BXkJPcrHAlkcASnRZsDMRNt6uJKSwTKN
 xGLwQgXippZmblfQ2ib0fY2BtWexOq7jY611CCrN5yIMInVItj17BaZwly5N8DlG1Xss
 OklioTc8psiMJJCRD0p/LIW72hX7wC5YwtAmRy+z5rK5jTTWZKR1cDGJW/u8KiEr/3fk
 Zb2PgmG5ED+qwHiy25fxXHMqET111pWca7HZ/MnKqMJb53/GLD3Cj5xjmrZAmquYrj+c
 qtQrW3rlWH65BftAkXKX11Ff0I64XY+GG6Z6cC00YfDBJnwPBqCGsTnEdqTEoGb5OkOQ
 xlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784636446; x=1785241246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UDmKj9ojGbNAJQJDYvvRAPXarsrqhccfsavTta3uxqc=;
 b=siko1iXbTK+NhN82Ym5pL/6u9EGdsbAwobdJvuAjjOrWGtonSwoBDdK1P9XFkYhU/t
 ciDzAfCYbO6aiD2TOlP2+LpTIOxJenHnsTshY8TOaLRbPtCQRiIcgOnfh/Vaogzk2uCh
 tXqoulIcNhuxukBTqYW5BXP+UHScc++lkrJWNlL17Ydy/LfqFPaAl/8alssKMPLMBOHy
 pV7Vebxi0xNsXKjY5zlPdDDQ9UE6ikTX9jCST0/a1dVSzEGqfA+YZWsv/JBQtgGNeMdL
 KsQdLlMt9c/A5KKjLZ9vj2/IdZgg1zTUceMp7LExIrzuWydIQZIgWyoE8qtNXwqubao/
 hsqQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoddN5FIxqE6F1LWK4nzZOs6rAyI5fAcvkXRzzJ3aZ0VVNeTbUGPt0gu4EOYON9z8wu8cn8HEx/b6zJ@nongnu.org
X-Gm-Message-State: AOJu0YwwPMJUDwtT378pnRTtj835S73cBDzY1KDc5AerXbPOo5Ttz8my
 RGb7T27952KxQphPgRqgp3bq1uNdx2/eQ3OM942qpnx9pafNAlhKen/OypnZtOCFBwY=
X-Gm-Gg: AfdE7cnMsHYAqb7jzXUjB4jbZBfaYCGpKgrakrIpikapQa769Y3wfuEb9ngiJtaysRF
 vZS5//NsaBT9M7ojvsYK7THrzoSvOrfbNOt+zvvroM4/Xi2wlX7TAYCLTSufpi8JVKVNpZB4kP6
 p/F/py1YsXZxNK670YurMksNJ4HWF68ej4ia7d9/90MoKULvWR1zvLDry/BvkECGzl/P8DjPh1W
 X80InzTZ50hwSVlCNKJbteytA0yY1G6gbvA/fPzPzSxTgoCVRmhzh0cGhLxT0lYRvg8AFyuRPOe
 8a0dTSYwklcWolJKsyK8BPGZJpdVipFxn0GXvJW19P/e7vq6P+MCbWE1ibFZ+5v6EfBydUpUiUM
 Cxt+A/vlFt8uXtHiQib6oXu+6HpiCPHeXt5RQg9TMixBoqatnkQRmkmG8GKJ1JBlw3hXnN+qcl2
 k4yI3+rEOzVi3hekdjzDl+FeuC6S+VKm1O/gS7IZ5anwBDUvkEzv9VSTGcS/wRBL6g+989C1hCb
 YhG5s5LMI7KNY6Y
X-Received: by 2002:a05:6a21:1519:b0:3c3:a168:edc3 with SMTP id
 adf61e73a8af0-3c3ad9717dfmr17121896637.38.1784636446435; 
 Tue, 21 Jul 2026 05:20:46 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cb517aad95dsm5904568a12.7.2026.07.21.05.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 05:20:45 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/5] target/riscv: Add SiFive custom int8 matmul extension
 implied rules
Date: Tue, 21 Jul 2026 20:20:30 +0800
Message-ID: <20260721122034.1567146-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721122034.1567146-1-max.chou@sifive.com>
References: <20260721122034.1567146-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x530.google.com
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

Add SiFive custom int8 matmul extension implied rules to enable the
implied extensions of SiFive custom int8 matmul extension recursively.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e643d7c7af..70baa054f9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2811,6 +2811,24 @@ static RISCVCPUImpliedExtsRule ZVFBFA_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule XSFVQMACCDOD_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccdod),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule XSFVQMACCQOQ_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccqoq),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
     &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
     &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED,
@@ -2832,6 +2850,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SHA_IMPLIED,
     &SSCFG_IMPLIED, &SUPM_IMPLIED, &SSPM_IMPLIED, &SMCTR_IMPLIED,
     &SSCTR_IMPLIED, &SSSTATEEN_IMPLIED,
+    &XSFVQMACCDOD_IMPLIED, &XSFVQMACCQOQ_IMPLIED,
     NULL
 };
 
-- 
2.55.0


