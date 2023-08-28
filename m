Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4802C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 14:56:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qadf0-0003Nd-PV; Mon, 28 Aug 2023 10:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadez-0003NK-W7
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadex-0000fD-Mp
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31c3df710bdso2582268f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234566; x=1693839366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXtDlBaV4QYBxAWaYJ7Na+553ToqZMUDyRUVndMkrKA=;
 b=Fi5EfCZizUdiyM0qhIfy80uUGXGeZVRvKB9AepVxClNSEo6fT6nngK8MSTGmXkWK0J
 InhkoXhL2bUvjJ6axowNG38eNED0WMXI3DfdsUs02Rz2ud2mM+A9J458X5y23fmFxkXo
 9C8mEU/zNMzlGragzyORb9jNcDuTdF+XWrS7LFMCghJO91UhzSaGannkoTynSUO++jTu
 TMz0rN5jG6hGQWsL0Cdk70Lq1Kmm1SmfWgE/tzfpPVeyrpiK8OZgjBqBqAg4IQSTQJ0v
 U+d0cYH89eaIrlt7rX2+6rFoua8AG8BPW7vN4uq/ZJUNCRWpOFnpZSBg1BMx6uPAMu0+
 5uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234566; x=1693839366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXtDlBaV4QYBxAWaYJ7Na+553ToqZMUDyRUVndMkrKA=;
 b=YCxd12raBooSp3gcNC9aZycTsk2bCJXoG+3b+0sjeB/xICTfBokGSQcFqqH2YHNt1d
 0Z9OU3qfmGeWyOsCPfjCE0GJsc2XV40UHbDQywyXOQDzFwQy440pSu9tKwm/RGexBIoA
 S1I1YldliL9O74XUh7o90NwqTf+ZgOjPPqpOmG2eRCRfH2WPXS/xeZ6VN9i4oo+wt7hc
 bAoIZQvvzJ4Vs+qdTNPFBVr9heEJ/+DVPAe5outEs6UwHBwERgjOigghA2Vk5sQAcgg+
 UkCM/DHmtnXDNqlheo75C14AKWvljrkvOwx/Es5yoVZH3ahw0MxnjzOLpHevVhfPq1Tx
 aAYQ==
X-Gm-Message-State: AOJu0Yw2Le+pu+kOPt094q3KqjaoJkg4OkJzesMDNPoZsAzvsu5bHLFf
 gyPcHWHEIhcckM1dnX25SA0daA==
X-Google-Smtp-Source: AGHT+IFKRewcUCpbCoFKnPMd+GVHXy5YRKSFNFUSbynNx/vyjvm6HXmqkGu2Jy5L3P8gduuJXzVMUA==
X-Received: by 2002:adf:ee8b:0:b0:319:6997:942e with SMTP id
 b11-20020adfee8b000000b003196997942emr18952747wro.8.1693234566159; 
 Mon, 28 Aug 2023 07:56:06 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c260e00b003fefb94ccc9sm10943778wma.11.2023.08.28.07.56.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] target/translate: Include missing 'exec/cpu_ldst.h' header
Date: Mon, 28 Aug 2023 16:55:40 +0200
Message-ID: <20230828145545.81165-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

All these files access the CPU LD/ST API declared in "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/avr/helper.c                  | 1 +
 target/i386/tcg/fpu_helper.c         | 1 +
 target/i386/tcg/sysemu/excp_helper.c | 1 +
 target/loongarch/cpu.c               | 1 +
 target/mips/tcg/ldst_helper.c        | 1 +
 target/mips/tcg/msa_helper.c         | 1 +
 target/riscv/op_helper.c             | 1 +
 target/riscv/vector_helper.c         | 1 +
 8 files changed, 8 insertions(+)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index e6e7d51487..fdc9884ea0 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
 #include "exec/helper-proto.h"
 
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 6f3741b635..4430d3d380 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,6 +21,7 @@
 #include <math.h>
 #include "cpu.h"
 #include "tcg-cpu.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "fpu/softfloat-macros.h"
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index b5f0abffa3..226689a4f2 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 27fc6e1f33..65f9320e34 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -11,6 +11,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "sysemu/qtest.h"
+#include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "cpu.h"
 #include "internals.h"
diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index c1a8380e34..97056d00a2 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/memop.h"
 #include "internal.h"
 
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 29b31d70fe..c8597b9e30 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -22,6 +22,7 @@
 #include "internal.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/memop.h"
 #include "fpu/softfloat.h"
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 9cdb9cdd06..7e2f1908ee 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -23,6 +23,7 @@
 #include "internals.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 
 /* Exceptions processing helpers */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4d06754826..e3ef2113d6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg-gvec-desc.h"
-- 
2.41.0


