Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DA5E7717D
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 15:28:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tM7SH-00051u-I9; Fri, 13 Dec 2024 10:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RZ-0004QS-Cl
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:19:06 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RP-000599-95
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:18:59 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9a68480164so304248666b.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103132; x=1734707932;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=Mg/48fs7F5xz9lLSIsD7ur3qb5fJt+LVbDjCqR450zyt+5+xCZwAwqy72LY8/MGdmx
 nYS3kyldjBoum04UNsDV9dM8Pt+XAJP6b4TkcwSNgNTk9PDKyCxTCfo3h8jbyubvv0K9
 tfCa+TFI1Dpg9sSilvRH2PPpRWqdhXFQCMf/Pxq7MLYMVljL8lGLF5NOLv3XhqP6QZiw
 FyvP3cyPgX2zjkqCoxS0zcgYsCW36zFQCVB+MkSKxR1Zt2Xh9LdZMqSEoWziXC7yeQIf
 5KLTK/qT2vKLQAYVi/hY446QDxeBwFfBwvqkK4v+XPd8B3SFtBxU4w1dsCcj8PihMQvn
 aDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103132; x=1734707932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=RPLLBFm13PcpA9GT5WjCPSzTABF5M5f2w4ZINrThRVzRqLiJTCA27oegq9cyqWUs8C
 UytWvHgpFWiKy+cJjlzaoYE/vhrh8Pw+OdISuOxw+MW7/F9IlBb6K+/uCsn+WhX927ye
 9xWjs0Q4QdxDhV2T4q5FeGVJRlGw4ZbPzB3RukpsH0ZU+3/jDF4odRtIsyH+GPDO8n2b
 Ak4xtwb96bfg6vKXP5IaX2++xzCRA3GnpbSCeA/IDjXt/6FK7H+G/H7hw3S4bKRna71U
 RuVfxOrt49X2PkgDKmsAb1yrxgrCDfPs/8kN/o0yEwEl0hxdKogvozJhDU9u9hwTAAq+
 4A6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIRvnEnIwW5hMsILFivppoi8OfTAHsFrmuDTmtnrGWQVp+uS4N1yBAyIJ/FGFSpQlWh8AI7Uwdy5Q4@nongnu.org
X-Gm-Message-State: AOJu0YzqIHdDDbfGawz9BdbWVa7TOZ6DzAtj8df6iosWC/z8jlcFh643
 Jh77qAWfazM10r8p11b1NxSjtpx6fk7TzM+AGfts8a08RUoM2OVe28Z42gRJyg==
X-Gm-Gg: ASbGncu8gT54PeRX//Rki2dUfsdgf3tCa1f1f2oul9kZs3YuhgCeKMWzb1qpOZ74+qz
 VFdPoUwyDkDwA+u7DiNZ7Hg1vT04EOx7RsULFAiCZj2mLESwjlQvGHygnOqRCwgsYrw8ALQUkEH
 +HdMRnPSsRwkfWEkjw+SKvYmUYkHDukpCHDmuLEi4yN9pGfhHx73BcUkMxkzg7S4tcEKlLKWe+Q
 qsA2U8BqBQPQ0hucBmSh77Pv4VD48LPaIYSgEMPVxdIS1BYxas8kTiWfiSwT7K8uJHQEEqTlxdM
 cC8yIwd/KuV8p7ia31gWIndgC397ikdv
X-Google-Smtp-Source: AGHT+IG5bvJo7d8pkfatjbIVYQhMywy7MKrXn/q3FV5D1M66jmhBDg4HL8AFRo+DCOuQKlTU79yJOg==
X-Received: by 2002:a17:907:a08a:b0:aa6:8bb4:503d with SMTP id
 a640c23a62f3a-aab778c9cc3mr328990866b.2.1734103132294; 
 Fri, 13 Dec 2024 07:18:52 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.18.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:18:51 -0800 (PST)
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
Subject: [PATCH v13 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Fri, 13 Dec 2024 16:17:58 +0100
Message-Id: <20241213151821.65748-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62c;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62c.google.com
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


