Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9652AE7717D
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 15:24:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tM7Sb-0005xh-8j; Fri, 13 Dec 2024 10:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7S7-0004nV-An
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:19:40 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Rs-0005Ms-25
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:19:36 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa66e4d1d5aso297190766b.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 07:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103163; x=1734707963;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=zDDozi3URzuy3BD/2wxsvWSTPemoukV14WC6mIB2bNeg7qgi0vvK48LE3DqTGwBJuj
 bBayp1K3urSPCRjc2HEa/5WqUgMGVjNrAzHTMyDJgNj58wFPXB/mCfUZ6rI15H1igYuq
 zJVoIGn0ooons/yl4bc11XcV9DIMH6E04CyvQ0PJP381cO2aFDy7Nh4xH1x5zbMIXOhE
 IhGQX1gpdg2hm+tBAHTmipa6+oAk1xvW6piggwMMocPshkQyBqMqkrWLsYB/Ia2OyG6S
 9P0YN8O4ccvd5ms76zDuCiA0/xkPGzqU/npxx/tXr4Gq4qyV4xM0PH/jBXl4zjE5ZKUI
 E1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103163; x=1734707963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=NlgFMp8yZusErFynMg3OBkdhcqi8qMdKwbRrOjt+xPpYibjt/Aqs5y6IOEsFRpLvA5
 yZtbQ/uMZxyL5TP4ZaMCKrkjKqWJOLvCdn58P229SQ0IwL4zknP5kRY2BiN+5VrWLSHC
 dYqOF4AmK9Dk739UAo98UD6BbMYI/09/adz4a2Wq6KedmGcZlBRTZLBHOgY6mn2uEhk4
 0N7yHz7cWRgGC08sWJLQbpOixs/Ubkdg+opjZ6WWZKEvgwZ1KLk1VKdxiTMFoFhLt5hK
 D9BTMouO0TZkLLIJL8kRRunKH8PnqKQrcb2CSa8Q4vUf0J1Fo/sY2QhE5wnAS5/NrFGa
 mrGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOwKOQTKwUZVjxkH4+YLTqasSeeLOp1G1vAAYwX703H6dSzXVuS4Xj7V3YHtkjVoc0FRQaAuW4k242@nongnu.org
X-Gm-Message-State: AOJu0Yxd5zLcVd1PmLbYewU4a/gv8aH7DrLzSo56wAlodBOEOIKlYg6e
 msiy6gGxOSaeS5h/FjBLVOnWRuJ0Fbh1GcMXxvflAqDljFZ1ZvV68MIhG4lMTw==
X-Gm-Gg: ASbGncvqaTyhykdQ3qwE1fR77gNOHJrZMYyDcLZPOCqowrj8d3rJ1qVdoVAIcGHqH+b
 D3bffQB9VhM8PMDPXKtpNglE6qL4avGQ0F9ohQPpGEb+E+Hk95iWkmfNZzu/s1f4GH/CK6gIZFx
 lwpLXKG6oqEYubHEjWcTHnrorlhEUYJAY0MchyxBOxwB7GFEoMte7jalf1g88ec1wKnTYPqaVtL
 SPFIPRckhH+L/yxi3u42d6zkhlj0i65GDVUFcgpaQVwRFqdf2E1zEQBICHWuLMuAmR3yg5YLBXB
 PfD6proKXdby/7pzo+sJKyuwjRHb0ANf
X-Google-Smtp-Source: AGHT+IF5PPSX3PcdDyLMno1xB5YKxsDErOLFv9wfZNBM++bTd6w9SsB9zRDRId5ALtwVW3/qmpEZ5Q==
X-Received: by 2002:a17:907:7ba2:b0:aa6:8275:223c with SMTP id
 a640c23a62f3a-aab77e7b67amr342828166b.44.1734103162677; 
 Fri, 13 Dec 2024 07:19:22 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.19.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:19:22 -0800 (PST)
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
Subject: [PATCH v14 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Fri, 13 Dec 2024 16:18:14 +0100
Message-Id: <20241213151821.65748-25-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::632;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x632.google.com
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


