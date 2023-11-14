Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5220EC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 12:39:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2shN-00014t-6C; Tue, 14 Nov 2023 07:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1r2shM-00012r-AU
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 07:39:20 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1r2shK-0000Sb-A6
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 07:39:20 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so43800985e9.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Nov 2023 04:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1699965557; x=1700570357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j6ceYkr7vqDmfoGECYBesJd1DqOCI8NwuYAkPi6njPE=;
 b=SgRXI7UxflJjwjqjfbjNkKJ8BI3gw9wsgxNT3HqmuBgJOBdyKmXZpM5NrA6J0igGLP
 4P+QiSYOCHGiNY+daYSr9VbIvWEwYdlVuytHdrKF5ZgthGKIArzYiNSY9CxPcsK+nvJm
 6D7929FpiChHXUMyX3fs6YczYd6YaTRiLYjLB2vM1hRIsDwmO5LwdU+0BN2xOdpby0Zy
 enrcZce7PBomBC4v6UG9PZ5JRenaTvCbZpo6iUGnVUcqp8FFm9W9CZhux1QDaMNYmQVL
 x6d6Bjpp/coHG09RX72kKn99i4KPMWyrVT9FG9/Z3wiLLTu4CPe86LCKUPxwTrgy/h33
 avVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699965557; x=1700570357;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j6ceYkr7vqDmfoGECYBesJd1DqOCI8NwuYAkPi6njPE=;
 b=sp/n5wv4lIhXN5PBCVNRktJLWnQVNc1OIr5+L4nfUL3q6oS2JNk7PmU1qwcuuHPMxj
 CRshcbH4nZCjJRu7ut+lL+xzlizXyDs6HSl0T1kJghWIdlLgjvBPlg/BB5zomlrJHVdC
 aLg3Vn8shkIQIyg4x8//mAQYpSWz+X8sNJ57/tvmRX6sdgsbqkqx18ZvZwZt0yogLEEx
 UeKWf4KckCxQ15hz3PBM7G32dq1PvQOELnPekrkWPYMhRQOlPb5pzmvrEVts2i+oqXZo
 8D29xXCEFTZvrcGhU5ExaEWIBX/IFkT0q8ZjOo6LbJFkqfWf5m2GzEk75B+XNcl43O+1
 dCXQ==
X-Gm-Message-State: AOJu0YxWRm5y2c77TgRsdTyeIduvx9fU3hz0BA5kVdAXyAGZ7NPb2qEE
 m6+KlMdK8Movn1e9BMEczTC8yGCE+UVBZ7VIWm0=
X-Google-Smtp-Source: AGHT+IEF48ju6qbkfOYn6MKX6UHQkpwESFkdWwbuinKNMM7ii7gTQVor5I+AZ+kZmZdz4RR6KM8sbg==
X-Received: by 2002:a05:600c:4f8a:b0:401:d803:624f with SMTP id
 n10-20020a05600c4f8a00b00401d803624fmr7678274wmq.4.1699965556686; 
 Tue, 14 Nov 2023 04:39:16 -0800 (PST)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b004063ea92492sm11458469wmq.22.2023.11.14.04.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 04:39:16 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, dbarboza@ventanamicro.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, bmeng@tinylab.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v2] target/riscv: don't verify ISA compatibility for zicntr
 and zihpm
Date: Tue, 14 Nov 2023 13:39:13 +0100
Message-Id: <20231114123913.536194-1-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The extensions zicntr and zihpm were officially added in the privilege
instruction set specification 1.12. However, QEMU has been implemented
them long before it and thus they are forced to be on during the cpu
initialization to ensure compatibility (see riscv_cpu_init).
riscv_cpu_disable_priv_spec_isa_exts was not updated when the above
behavior was introduced, resulting in these extensions to be disabled
after all.

Signed-off-by: Clément Chigot <chigot@adacore.com>
Fixes: c004099330 ("target/riscv: add zicntr extension flag for TCG")
Fixes: 0824121660 ("target/riscv: add zihpm extension flag for TCG")
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 08adad304d..8a35683a34 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -250,6 +250,15 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     for (edata = isa_edata_arr; edata && edata->name; edata++) {
         if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
             (env->priv_ver < edata->min_version)) {
+            /*
+             * These two extensions are always enabled as they were supported
+             * by QEMU before they were added as extensions in the ISA.
+             */
+            if (!strcmp(edata->name, "zicntr") ||
+                !strcmp(edata->name, "zihpm")) {
+                continue;
+            }
+
             isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
 #ifndef CONFIG_USER_ONLY
             warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
-- 
2.25.1


