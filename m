Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBDFC4167D
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:35:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1xq-0007Yi-5r; Tue, 12 Dec 2023 07:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1xo-0007WH-4s
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:34:16 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1xl-0006ag-Nr
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:34:15 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-551c03adfc6so417114a12.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384452; x=1702989252; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ek5eH89m6U4onfJDQbwgikjGRZL4xGCW1/xN2ORw4ro=;
 b=xGuCP10wN5A69z4IkUoYupDOd4e40T2kgKc1SuEJyHIr1ZXW5H36fR7vqBBZKsYRTU
 gU0D5md/mABDfvfbHL8dnowwweP5YmElSNL02B94ihzUyZwZvs4uCq5g+ZMv29/Ty+yT
 VpmgaKh4QmU0skTRXSjRSqHFt6vym8vmrn9fhDOxw2RCcBUf5/eK4AAl9UGhE9q4ENYk
 OLsnxV/PmFlivkpWr1uPn7/OcYbGzW3rmQ2JRLenJ3nrRr5C/zcbfWySR8j3vNdIE+p8
 Cl+xMihwmzR9gfNrz0jyDL/87fj1BGEqj+9s41EuD8W6JxcnPk2WYuuzqK1sdExQZzDr
 2bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384452; x=1702989252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ek5eH89m6U4onfJDQbwgikjGRZL4xGCW1/xN2ORw4ro=;
 b=SYaBZ2eRsXWcwRppoIoI3l6avnPmSdCDhIsQQdBxwV0+ZMvoQ6zmLDUNLxr6dJ+RlV
 xdXSLSPEpXeg8dNzwM+PcTPD9Z6vNF6XyoyM0igLWwsY9tJbz1WWsIzrB9XxVq6X3p7x
 rcWyb5IAmlU6Y1EkK/9ATmWwxC5I7PNotA8BsIwkZlcrlROIvXa+fnHgo3Ak+oIorsvJ
 kFLMV2dAkCiWlp2WEY/SjDHRe72HoCJmfxgbn+bFlCMCqziIPTLByMpX8/JtabCqsh83
 A60UVgg7cTTGHVVKJHQ4ol9zTRkpw/1JPlmQTH3AqA7wB83XQBMTCyQppYUpTd9lr7r3
 8jZg==
X-Gm-Message-State: AOJu0YyN0AGonOCpE1/HOdKUYqpdyEjS6eCoFZjIfuir6A/3D78jCeF5
 kaDvr91+Rp6Dnsx/+/uSEvGd0Q==
X-Google-Smtp-Source: AGHT+IFBHZ2/jWW2AkikjY0zIuTT+PxnUkcMnGaFhesUbqMGzvxdFjcSr85mnVL4Fe8nIxjFgxsMcw==
X-Received: by 2002:a17:906:e294:b0:a19:a19b:421e with SMTP id
 gg20-20020a170906e29400b00a19a19b421emr2004022ejb.137.1702384451860; 
 Tue, 12 Dec 2023 04:34:11 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 uv6-20020a170907cf4600b00a1e443bc037sm6274678ejc.147.2023.12.12.04.34.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:34:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/23] exec: Include 'cpu.h' before validating CPUArchState
 placement
Date: Tue, 12 Dec 2023 13:33:37 +0100
Message-ID: <20231212123401.37493-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

CPUArchState 'env' field is defined within the ArchCPU structure,
so we need to include each target "cpu.h" header which defines it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
---
 include/exec/cpu-all.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5340907cfd..9a7b5737d3 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -411,10 +411,6 @@ static inline bool tlb_hit(uint64_t tlb_addr, vaddr addr)
 /* accel/tcg/cpu-exec.c */
 int cpu_exec(CPUState *cpu);
 
-/* Validate correct placement of CPUArchState. */
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
-
 /**
  * env_archcpu(env)
  * @env: The architecture environment
@@ -437,4 +433,9 @@ static inline CPUState *env_cpu(CPUArchState *env)
     return (void *)env - sizeof(CPUState);
 }
 
+/* Validate correct placement of CPUArchState. */
+#include "cpu.h"
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
+
 #endif /* CPU_ALL_H */
-- 
2.41.0


