Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B1C0218D
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:46:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6sf-0006Ot-Gb; Thu, 23 Jan 2025 18:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6sc-0006NQ-Na
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:44:58 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6sa-0003zb-Vy
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:44:58 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so10246845e9.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675895; x=1738280695; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgM0qO1a7TmnAaVr92PdlZQNV8dbDE9Lo8CXyhKvg/4=;
 b=XRbsaPaW/Mjo1pMNwc4umgoghtu4Qy8WcsPBBfhFdo+xb1lmAOxV8cCd5fnnYGMDPy
 5IUpKlcaE/GYE9IRaxsBIyj66D/9ZinJEFAPL5tUF9Xr1729EnrCZfUa1/iitQvJDxV/
 jCPUeMLjz/01iAYwVxyNh/XfRyRe0hkRFYJe5y1oovwWZKS3Z6aF7xhLkwc1J7SmRehJ
 tyg8CfxxfatD/6k1Xoz0XIJGzLE44RoPcQMtgHnhIvkMKP5gzYXePL7VsL6D6Ovc+aLq
 Pme1tw6MVqN8aV4ptz8igF4LtnVNWUoc7VDA8mAIEh25Nmq2dNZ/4NLuzfYCADsb6pYB
 WMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675895; x=1738280695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgM0qO1a7TmnAaVr92PdlZQNV8dbDE9Lo8CXyhKvg/4=;
 b=vSjU8GtG2s+LhZouc7AXr4mmfpX22lfF4+cgjkeHDuhI+241IOtHrHaLEXI4Q67z8q
 pihgYf/7EH2tzHn98d7qH3d6kn1onlnDotR6cc6XrLjEUNc1YAnU3PVAogJULfLr9r0W
 KIDdXb0vZy7uCWBj9pd3ap1bgbU1/7fVaucaIhb+E1QiSArzpFxY8brd0KdmeMc+wHQC
 SKFBcW5DzGHbRK+XHSjjlYGh+93non1504YjNlwnR1WcyrGtd7OvYmuilovaSRp3TyEE
 z6/qoQW28K1I8HQaaMk9mqHcNorGC10fquwkd2f4Vq1ErA7+F+Z7P18dfNXMz+2AbrR2
 2aHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmT+te/z3dfx2ZibK5wmhQr7vgrQ8Z4aoT/VE7kYCC0agYQckpTOArNX9rmzz139W07bsHbcdcoEip@nongnu.org
X-Gm-Message-State: AOJu0YwnhLff6h+X8pazxV5AGNC1Msc1rHDkBDKZdBBv/M8beSBHq9Id
 IkYFzONxHRpqxb6LQzX7L7PLETwbQYNLtNGsfCpTLd6Lg2oc3PrQwRAREFmE4qE=
X-Gm-Gg: ASbGnctd6Sdh9yCxg2TQ4MgfL2u1lPEFmqbgP1mwNiao88At2hW7yFmRYun0DzHxVf6
 3T2WHXD0Gu79Wn8h6OyZrGEaEktGa1G0xso/+yQOjnxE7FjvUDDSs/bHRM1MMiJDA23/qH9+HOy
 SKT6fF7DKpd/kU/VmYIpN6LMX2JDUth3yzUZtG0/ibJbELyREZ+Wi/Qyx6DP6QvEBGQcA3v/S/A
 Xjnrk9fkcbekkggCN0BIlXq68YnY7Y/tR4gQVKIw7IoLTUbSuMZDpvU0GSmcVxP+M01LW0az8Bw
 UI2ajvUCZTRdRlodl4aZUWPINGoImd3CtyBpJqxEFNZbM+2mTyD/9NA=
X-Google-Smtp-Source: AGHT+IFu3bGh+dR4gXvA0Xd23GoBCnM+yfw+G3EPNj4Vc2jg+fj1VnlHOFgKCDXygKj5XAozIyeBjA==
X-Received: by 2002:a05:600c:a09:b0:435:9ed3:5688 with SMTP id
 5b1f17b1804b1-438913f86dcmr267603485e9.18.1737675895459; 
 Thu, 23 Jan 2025 15:44:55 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48a94asm7141855e9.23.2025.01.23.15.44.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/20] accel/tcg: Build tcg_flags helpers as common code
Date: Fri, 24 Jan 2025 00:44:01 +0100
Message-ID: <20250123234415.59850-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

While cpu-exec.c is build for each target,tcg_flags helpers
aren't target specific. Move them to cpu-exec-common.c to
build them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 33 +++++++++++++++++++++++++++++++++
 accel/tcg/cpu-exec.c        | 32 --------------------------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 6ecfc4e7c21..100746d555a 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/log.h"
 #include "system/cpus.h"
 #include "system/tcg.h"
 #include "qemu/plugin.h"
@@ -25,6 +26,38 @@
 
 bool tcg_allowed;
 
+bool tcg_cflags_has(CPUState *cpu, uint32_t flags)
+{
+    return cpu->tcg_cflags & flags;
+}
+
+void tcg_cflags_set(CPUState *cpu, uint32_t flags)
+{
+    cpu->tcg_cflags |= flags;
+}
+
+uint32_t curr_cflags(CPUState *cpu)
+{
+    uint32_t cflags = cpu->tcg_cflags;
+
+    /*
+     * Record gdb single-step.  We should be exiting the TB by raising
+     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
+     *
+     * For singlestep and -d nochain, suppress goto_tb so that
+     * we can log -d cpu,exec after every TB.
+     */
+    if (unlikely(cpu->singlestep_enabled)) {
+        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
+    } else if (qatomic_read(&one_insn_per_tb)) {
+        cflags |= CF_NO_GOTO_TB | 1;
+    } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
+        cflags |= CF_NO_GOTO_TB;
+    }
+
+    return cflags;
+}
+
 /* exit the current TB, but without causing any exception to be raised */
 void cpu_loop_exit_noexc(CPUState *cpu)
 {
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8b773d88478..be2ba199d3d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -148,38 +148,6 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
-bool tcg_cflags_has(CPUState *cpu, uint32_t flags)
-{
-    return cpu->tcg_cflags & flags;
-}
-
-void tcg_cflags_set(CPUState *cpu, uint32_t flags)
-{
-    cpu->tcg_cflags |= flags;
-}
-
-uint32_t curr_cflags(CPUState *cpu)
-{
-    uint32_t cflags = cpu->tcg_cflags;
-
-    /*
-     * Record gdb single-step.  We should be exiting the TB by raising
-     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
-     *
-     * For singlestep and -d nochain, suppress goto_tb so that
-     * we can log -d cpu,exec after every TB.
-     */
-    if (unlikely(cpu->singlestep_enabled)) {
-        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
-    } else if (qatomic_read(&one_insn_per_tb)) {
-        cflags |= CF_NO_GOTO_TB | 1;
-    } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-        cflags |= CF_NO_GOTO_TB;
-    }
-
-    return cflags;
-}
-
 struct tb_desc {
     vaddr pc;
     uint64_t cs_base;
-- 
2.47.1


