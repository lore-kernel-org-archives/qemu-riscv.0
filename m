Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474F2D6ACE3
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 15:08:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGJcU-0001Xq-FB; Wed, 27 Nov 2024 10:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJcF-0000p0-HU
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 10:06:09 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJcA-0008GR-W0
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 10:06:05 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434aa222d96so9325635e9.0
 for <qemu-riscv@nongnu.org>; Wed, 27 Nov 2024 07:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732719957; x=1733324757;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHwSaHBvDOuggNzApud1KzwY/aX4UN5MIxFwz/8i6yU=;
 b=F9FP6Y8stHxnJe4qGsCeTTwNuH4xMwE6hM0qPoeOFtsajPRvxHsSbJ2asnBwph9s+d
 dpa50Is6XlVOBrDqQ+h7xlIZXcayueVBJbuYDTKit20zrw0VQZEXHUTRR6oDgsEV5Q6U
 kEEJ6VTq0RaIYk+Mw1odB7G/UoOSWyqnIG81Vya9MDsNH/1Fj8fz2LyKCtF+b4b54JtG
 P+DlS+2H7nhNROoTx6vi/w2+MO1xuDfiMHgsDbloNxx8XdsMssW8aBJvg56QHmJ5g60Q
 gRLEgAVrXGuLkf8LWgyrRUtJvvIc6qM0aRvgz0PacP3BMLfHisDT/hw2DpFbewQmcp4n
 ZEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719957; x=1733324757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHwSaHBvDOuggNzApud1KzwY/aX4UN5MIxFwz/8i6yU=;
 b=kT6hSsR+5lwMbWjoNKtfVqXQrgBZgb86DHthFgZVP9cBsmu+ZmfWYBo6aW37+YJpOp
 mrT7DdECP40gNbjSRpxD/BiH7BNyoK59+oTCtHEEKcnJbt5AengNfYMvAQmOSn7MISqU
 8e98XzZ1GPIX16nx9IhR2j0rFmdkcS3vONo2xZiykiRoPGyAflL2oHnCvxgQVTx8SxGD
 pQ6i5fY3AKjDtxqKA9UCU01jNhIGmSA8cxVpCQnNCjV9xGJjGMKuBL95qVN4omWI3jUh
 2l6WDqQvmJ596qeA/FaM64vvPjxrFEpO7/IvVITBb8NV53hEEYUphO0sM/YblDjoLiLr
 KsXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy3+i+bIBLQBA8OFFSY+bNJs78Iv8qogOQu1y3ws9bsAxZavLuiniacthcDS+wl/es9bRcjcG7GzRS@nongnu.org
X-Gm-Message-State: AOJu0YxFZgy9OnlNDUTEp6TD977KcZbK/UiC4IMx6eB4k6zgpD3ho7ap
 Rbfafb1toGsJu6ZEJIUxrLsZWSkgaThkToSHSg1yPqQ3dIln8cuIuMHMTRZEfQ==
X-Gm-Gg: ASbGncs0u8dwCr/Cd8Sg02g+Az/FXSyQWNtoRg6yNYNnRDcajqmb2LSWuMI4ZlGyf7k
 GECZ2Kntwvuf6Wz0eGuVhn7GIv6CrPR2ybxglTWl0Ih5wgOHzOW0QbhFToi0Cx4z6W6xhX3QWhJ
 tmgGYj+WxWRyT0u1uHHrbTuqHsv4DWxCm/vBPr/k4Cgc7FiHPh7EE/DQKOs2T+iIgULXvJiLi+U
 0rDohlbPKWYhoP69LEEziob4hgKU90BmQWP051CVoW0VofueqWyApaZG/ZjsPqHjXwMYQKvJJGN
 8dRVJbMAZhOiButV4hrXAloDmA==
X-Google-Smtp-Source: AGHT+IEpTUCfIu2/vfRcXXbfxiMnmLWIvRV5OvDGHOKh7IJK1zQzvdZwwpIYUSyHi+CaRDwwrVO98A==
X-Received: by 2002:a05:600c:3590:b0:431:5f8c:ccb9 with SMTP id
 5b1f17b1804b1-434a9dcf254mr39924575e9.17.1732719949435; 
 Wed, 27 Nov 2024 07:05:49 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.05.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:05:45 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v11 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Wed, 27 Nov 2024 16:02:42 +0100
Message-Id: <20241127150249.50767-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::329;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x329.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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

From: Alexander Graf <graf@amazon.com>

MacOS unconditionally disables interrupts of the physical timer on boot
and then continues to use the virtual one. We don't really want to support
a full physical timer emulation, so let's just ignore those writes.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/hvf/hvf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ca7ea92774a..d75e504dcda 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 
 #include "sysemu/runstate.h"
 #include "sysemu/hvf.h"
@@ -184,6 +185,7 @@ void hvf_arm_init_debug(void)
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+#define SYSREG_CNTP_CTL_EL0   SYSREG(3, 3, 14, 2, 1)
 #define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
 #define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
 #define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
@@ -1620,6 +1622,13 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         return 0;
+    case SYSREG_CNTP_CTL_EL0:
+        /*
+         * Guests should not rely on the physical counter, but macOS emits
+         * disable writes to it. Let it do so, but ignore the requests.
+         */
+        qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CTL_EL0\n");
+        return 0;
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         return 0;
-- 
2.39.5 (Apple Git-154)


