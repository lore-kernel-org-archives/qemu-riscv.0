Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC831E77188
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 20:22:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tO0Xg-0001Si-T6; Wed, 18 Dec 2024 15:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0Xc-0001NV-JO
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 15:21:08 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0Xa-0000JB-BR
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 15:21:08 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436341f575fso717125e9.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 12:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734553265; x=1735158065;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=sdHX0E+f2BPfkimwAxCMoiRGg1f/sgk99ZgqYNHlTmgDiMONFA9evZiR7WOpQ1Wz0V
 kPIs48i5pHZH1MU1nIiucA9kJuCavm5fbek3LqprB3rpGry7lDn3W+BMFGdCD0Yb747m
 iZjRxg5fQd2aHBd2g6X4IfdF6lu6BtqS+3mkCII6fXC73XtgEeVU/S/aju4owd+IrTzl
 MjRhY1zkcdU5fMaeFWK2f3+CIJMB/3quBRJzY+1TuE6/iqt9aToEgP9e40zzVjGhQAnW
 IZqMJ1fHKBFCUT1sinGNvUysZH4243cZbC9LL0hHKIH7iy8PlhDIjY6BrGvoLn9d6XCz
 7dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734553265; x=1735158065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=HNlLGh3Ju3ph/rHdsB49t5n2hYcDEsUPESrLpPL4wv8bOfIgvq1awgL5P05MMnNnCX
 5JlO1mipKfOwxw6IFnlcyZOwWRiQ1Guth0a+xkLxSqYVHtzsNpQSQyCU7JgpYzUFUueK
 pDN1tr9Io/cC3BCnd6jW4uz6xKtAL94MnFUqU8UG/qb/+63K2zxIKmv6Qh9jZ07JXcn2
 MJSSpiXwTOUp1LQneSX6PQKfj/crL/e3C6VZGCMKa1s92Jh5gE1JEZ0YbpD2gsE+pLGY
 yJrZc0melGVbjlAbnyIcZW9+xBr7IwNAl/6H5Jw4g6qlLNWsw4t8iaUkiiYmHVuA8GHd
 uVlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJnb2aGPgRBF7UUmJF+J6/Ap1tYEGxw1vDPUFdteDH4wEkgvxTZOSXvrJ/lSuxDfMLnvgYztu/uNcy@nongnu.org
X-Gm-Message-State: AOJu0Yw9QfAxi5gK/ncUHJIy5np5GexVAjpZlodL/ulYE1r6+WOUCVWr
 dtrUe9kTkvUpxtBejfDavIE3VbYDPrYMDIRtRAwkN8BNxd8Q/BkKQ1kW4/gmJQ==
X-Gm-Gg: ASbGncsKALX1Y0iZ/WjG1zbir43zFIixzC+BkgGpzHKkJCXEYTRKZg1l9hdT1vl8DnB
 OYnSXj5wj5CK8NXIpncxMHzAdreIMY9PfuTzdn6Sxwj9duxCPZL47zUj4Q2BkI+MSoIGpf/rPC8
 BwKIYayKr+Q5/UsyAArlThoexu+znxnehW+jpkNRdrEl05DkNb71Ar62BZfITxx0GrosWZvJVCp
 rXi5QTdW7ElInLOHnCkoVmPuvHYeY/K8McnsMHzBWjlxLfBRnPWvJFI/aVcueCzdl6RnXks29Nf
 RX6qn4ADCqnmLGEc78amTlvsX3OUUFZf
X-Google-Smtp-Source: AGHT+IH3lUeylEGyFOFalRNZZaAwWTI0SudFIVvTSL/uDhyXl1nx4W+AEY464p7OnPVMqyrWlfvpOg==
X-Received: by 2002:a5d:5f56:0:b0:385:f996:1b8e with SMTP id
 ffacd0b85a97d-38a19b0504emr1134877f8f.16.1734553264856; 
 Wed, 18 Dec 2024 12:21:04 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80120c7sm14842267f8f.13.2024.12.18.12.21.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 12:21:04 -0800 (PST)
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
Subject: [PATCH v15 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Wed, 18 Dec 2024 21:20:29 +0100
Message-Id: <20241218202036.80064-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241218202036.80064-1-phil@philjordan.eu>
References: <20241218202036.80064-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::32e;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x32e.google.com
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
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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


