Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A89ECFA47F
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 10:33:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t3v5D-0000vs-Us; Thu, 24 Oct 2024 06:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v5A-0000sN-Ev
 for qemu-riscv@nongnu.org; Thu, 24 Oct 2024 06:28:44 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v58-0008Dv-0A
 for qemu-riscv@nongnu.org; Thu, 24 Oct 2024 06:28:44 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so116231566b.0
 for <qemu-riscv@nongnu.org>; Thu, 24 Oct 2024 03:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1729765720; x=1730370520;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=ntjXpHUY2LiIRwDaKggxAjxx9SLViOLnp3mGTP7C7pyuDDJMe/mIOHZi5049q3RRxF
 D9pyexThcHU1mqZ2cI+inxTX0RZMCnmgTA9OmXn8xJjrndXQ5Ef66I2GjhR5qG4uBgVL
 b0sRx4OnPB5TtkttRIk77FDMJ00oeqgzSoXWL5DFiHTLWvn/Sneb1r6WmJZygwORZgPE
 KzMiFJh2qotDYMi6kY8QbqVdl8L3v7naJds7h/PAgjkF7GUcwx/omxOxkn1dkxPGSYcU
 mLBkfzvBS2txAtfDCJiS8i65+aOh52GLxi4EtpEqFztYiD+hIWrBvmrkcGqJDIVTZhkY
 SRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729765720; x=1730370520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=EQiyLnpndJ8RIInLoTa1CCDJ6ZK8a/G3xok+tPYGuc21LN1f9O4ViYEgatlW20CXVE
 wSPEaZPugXV7LDuQRsaQshLIz6UxCoEwl6x4KXiUkAI92nnM60KVfsyzyCCpK5Ak82//
 O6Ywiu5McIef6bJ4pqrE+wfVKo6o6w++/MMvAXIRGe/o0k3Qgx8Z59UHe2Jl9SePicUF
 HewoEXS/9bUjKnrnvTSTMB/wrIzHhRWjmQZEapn8KEbeuShO5fgOnes47dLQlOnHbWn/
 szth0nr4aoW9cTdnS7p6PZK9Exw4c0cAw0/pZJ4QeAtQFU9xP5d/aQUjKwUtN61TVmqx
 dSYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk+cb9POXstcd5wRcC0RLb1PLYeCauhnlHFJ/CpctJD5eZPztA9VX0NHHpwdAXyDqXZiNd/Fomm8uO@nongnu.org
X-Gm-Message-State: AOJu0Yw9fgbJRcomT9z5nxhru9+D45WTWbqVNuWY44M7uubpO0/5Q+zU
 HkoPlu+Zj3ZhkCp9rr4JeVe6tkrfthI7FXw+b1vmFosMINX+gPbZCBQcrsaxqw==
X-Google-Smtp-Source: AGHT+IEW8XvWl7WjK5L6NTaQiRxCXYwncONlzs/TAiw6pzsr5QrMaAH6KgMxVt0rkKJqjqOk0fXWnQ==
X-Received: by 2002:a17:907:7247:b0:a9a:33c:f6e1 with SMTP id
 a640c23a62f3a-a9abf851e2dmr534891566b.5.1729765720535; 
 Thu, 24 Oct 2024 03:28:40 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913706d3sm601019066b.134.2024.10.24.03.28.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 24 Oct 2024 03:28:40 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v4 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Thu, 24 Oct 2024 12:28:06 +0200
Message-Id: <20241024102813.9855-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241024102813.9855-1-phil@philjordan.eu>
References: <20241024102813.9855-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62d;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62d.google.com
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
index 6cea483d422..b45b764dfd0 100644
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
2.39.3 (Apple Git-145)


