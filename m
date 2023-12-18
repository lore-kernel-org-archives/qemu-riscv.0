Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224F3C46CCD
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:56:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD94-0003WQ-N3; Mon, 18 Dec 2023 07:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD93-0003Vo-ED
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:53 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD91-000510-QZ
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:53 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d3ab37d0d1so3840485ad.0
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904090; x=1703508890; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xd3UFvv5DNYhJrjtLFgbotziEqzGlx9oazmi2l+D3iA=;
 b=JV29uSvUW8VgZh17sWX6KLr95jw3p2R4d8JINsKNdfzdrQLmVbBvMLuox1LgpZaJrP
 nD9Ri5Ch3BJ3dZjta9nwy+fzzWM6z061y1poiE68ESRcJumXrX5SL1p+OfcaEuPYKzmH
 l6oS49B4ntYb3yPkWQDlt5D5cvnvSpgnQ/DphF4WQqdHYxH4NDxLZbDsuXGahXZai27O
 tl7Pe9n92Ir+0WqMXH11vV5Jav51v+TdnKiQsN2kscXVbDYjMhINhelRgY0tw0dh1vbQ
 kNq0rNNTPejkMOL6NtcY4VzIluOoFvswtDSRrQ4++fuAXBEuB1tzj38kxxe1J6qZBPCP
 jgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904090; x=1703508890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xd3UFvv5DNYhJrjtLFgbotziEqzGlx9oazmi2l+D3iA=;
 b=ckqHxxAL3e88GiLFhvJrDBHf9exnR7NsVatb3iMtV0XjPCTHJ0crmVXgBjgpfrzwRB
 zaERV8WR/e0cfUhWOzt8ZaFJ9z7AynjO51LJqdAaM7aR4xpU73OMzxZRP1Omce0ADx3k
 PmNchHM3c2PGlUUYrVpkhO5HOVXFIoW/8pBFWy1lpHGiw4BYuyFugRq8pritNDEqg7H7
 65r0oMcdfiUVMFf3cQ9D5J+6KHIblVKwxYXFGgCPWhw70cJlNTTNamqGLnim7+DxJlDQ
 56XBaWuEK9GJsHfA48DmfWMhRvJ48/UE9WrJ+8YTIFs9oyR6t3/gPHDCM03j+tJLGXIS
 4l3w==
X-Gm-Message-State: AOJu0YwteXYom8Zt6BkUG0mmCucbBGq/a8fpBTLm7U9sFq9Rgw6sGtk7
 nHYLgBGNcoSYxdDBNvEFuk0tsw==
X-Google-Smtp-Source: AGHT+IFwn46vNO1l7si9kWF2ZVJli3/leHKxZnRED6Y3ktCSUr+s0RIbrpY+z8WyEwbNCEagBpH3mw==
X-Received: by 2002:a17:902:e845:b0:1d3:c12b:6af3 with SMTP id
 t5-20020a170902e84500b001d3c12b6af3mr569694plg.100.1702904090330; 
 Mon, 18 Dec 2023 04:54:50 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:54:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 21/26] target/riscv/cpu.c: finalize satp_mode earlier
Date: Mon, 18 Dec 2023 09:53:29 -0300
Message-ID: <20231218125334.37184-22-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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

Profiles will need to validate satp_mode during their own finalize
methods. This will occur inside riscv_tcg_cpu_finalize_features() for
TCG. Given that satp_mode does not have any pre-req from the accelerator
finalize() method, it's safe to finalize it earlier.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1ba85c6d1c..6af1148cf5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1056,6 +1056,14 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
+#ifndef CONFIG_USER_ONLY
+    riscv_cpu_satp_mode_finalize(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+#endif
+
     /*
      * KVM accel does not have a specialized finalize()
      * callback because its extensions are validated
@@ -1068,14 +1076,6 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
             return;
         }
     }
-
-#ifndef CONFIG_USER_ONLY
-    riscv_cpu_satp_mode_finalize(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-#endif
 }
 
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
-- 
2.43.0


