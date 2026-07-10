Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDD7C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 20:55:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIEh-00016t-Li; Fri, 10 Jul 2026 16:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEe-00014W-LB
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:12 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEZ-0000bd-AI
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:12 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-8485b358552so1513954b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716846; x=1784321646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NCYrAVPYzdovZO0+mJzi1+ftzAz885Lyc3ZdMCVw2Io=;
 b=IKMJpf2fH/2vq6PvheUOQvIvlD1mpLE69m9GA2Nx4R99Z2VytosV6EcP0USP89/7vR
 Wyx7mOpBI620l3Ecc5zu1gm9e/5WT/mgoVjLlwO3yA6JwAffgSRrUIbOYBoccoRmCMyB
 kKOoEV8EStb1wlC+heeudxrzhmv0ZSr6BxABdwzccs0DsJEjx9mCi8O8nN5Ri7tr3R3D
 TK0BG0mRXdC+MzvpOCeMn84iiyOhZbJYpxciyGnsEONNbQk6Qsfal9ZgkOSFjF/5a5lQ
 5SdDOyYetThICPxxUhzXt2V6BU4HihVTq4CMh7biUPHP+ky1ivZvSmd3+m73/8L1Foh7
 Tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716846; x=1784321646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NCYrAVPYzdovZO0+mJzi1+ftzAz885Lyc3ZdMCVw2Io=;
 b=IJuy4DKvMFa1zrP5YtMNz+rP5aBNW4Vbfgj8iMKZhjB9JvT7NHHMcefFCscHY9Vo+S
 wESRpEYp9TPim6B47IHm9/+1tIFu5Xu4dYc7jD0mTA0iIzVi/WL17jUb6fxqWjAAkrhM
 OOh5U5rWPdNN9XzylSe+BMKGou7HzhARMBI8SSeHMkgsadZJWshW7K9a++gfn90zo1Dh
 t1onPWWKRo6apqC4mXUgQFhu9dhXr1on7B5CBhe60dnRD6Ar94BEVGMMXwTVJyA6i7C/
 oQT4nJkhvxcxhBJF2R1DnNxBlZHzpq1et6WWfGHg0sNW/5bQKfrPjYCoVY1U/DzFY2iK
 3vaw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqFR0qaPJmD0ZgrqKx7/BoPZfYqeeOn5ulejfDcD6WlQr6BMWeWmws34uUiovtOirLf9pAw/jqCAzPR@nongnu.org
X-Gm-Message-State: AOJu0YyXwQE0K1FOxjmi4n6/TmY791AQT9fP6prvAQUYZBVWdjFUa7it
 u346Pj/qYUtkB+MXBYXUoYn1uSXEDDvWoNJzAxR60JjNFieBNah7YXCqiFZWZDOrVVk=
X-Gm-Gg: AfdE7cmYCcm/wbAz/RNQPtDu7CL9gCmpN5wgMeJkLrjTor3t+3tg45aE/WKwGlnTi0M
 luhOZeMngZxaEAerJWd+NMItePTk5Nq2tEsG+wboPU84HpwbYHuVGf2erP0acXi1Donjcr1yya+
 MX+eLe3tSd33yfBEh0OD1MFptlBrf3T90lXr3xveTF7d67ApAYlkd0dwG31h6gPsE7ATsz7t/Y8
 3DS2TDHtzewnwzwIYG8Mjeq0V4wcxqLyeKCDfZaeOUuoKHbQVI4txuLhDeALujDonTMEgCwlBCc
 7Qvs7bZg6a6Ql4oGo8GNK6UXP+dIXs7naYzpZsQJAYzffJT8z3HMGguFXbJDXbNrxPA4OFkkNQQ
 ysqm4mDlJA7E1smSRgdJbqRV4+Ur6b5csfzyAMucFVlK1MH6ww4b77yXyQpK1NVoTEpjkO40Dj8
 O1xOfVPR6NRid/JgA6jbf51l1KnOZ2
X-Received: by 2002:a05:6a00:1d09:b0:848:51b3:f3c2 with SMTP id
 d2e1a72fcca58-848897ebf6fmr461615b3a.33.1783716845907; 
 Fri, 10 Jul 2026 13:54:05 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 02/51] exec/breakpoint: Move BP declarations from
 hw/core/cpu.h
Date: Fri, 10 Jul 2026 13:53:12 -0700
Message-ID: <20260710205401.836304-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Move cpu_breakpoint_* declarations to exec/breakpoint.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h | 7 +++++++
 include/hw/core/cpu.h     | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index df772dfc70..e6aa630d17 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -43,4 +43,11 @@ typedef struct CPUWatchpoint {
     QTAILQ_ENTRY(CPUWatchpoint) entry;
 } CPUWatchpoint;
 
+int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
+                          CPUBreakpoint **breakpoint);
+int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
+void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
+void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
+bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask);
+
 #endif
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 82b5136088..786e9b8aad 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1149,13 +1149,6 @@ static inline bool cpu_single_stepping(const CPUState *cpu)
     return cpu->singlestep_flags & SSTEP_ENABLE;
 }
 
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          CPUBreakpoint **breakpoint);
-int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
-void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
-void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
-bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask);
-
 /**
  * cpu_get_address_space:
  * @cpu: CPU to get address space from
-- 
2.43.0


