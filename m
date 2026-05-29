Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D76CD6E49
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 19:53:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT3FX-0001au-IY; Fri, 29 May 2026 15:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3FC-0001DP-8K
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:51:49 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3F9-00059G-0f
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:51:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so97413895e9.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084301; x=1780689101; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnMiDonv1YO14rMlbhW2kVzk+7R9nLq/lyljZBG8qv0=;
 b=TJseCz0/dbwKmJWYGurhwcJj9Jw6QFbgL1bMibMWsagFEh2j866WlsFc1cJ8ZwPycS
 M9PARSwQ/NF3Vu4N8XBZBpn52L4aAhfL4PyI4dRRQ++o/9YXM+LnctVrK9mH9M8K/Xq3
 vR8cDpntIwF3vrAKoiKd4euVsGfwrDWvj+jhDpJ8XdjSAH7TlQ0r55LMS26YaZJazp9R
 iFtjuJxqjvXQc+OgBQEeFIeiiT2/QY9vzdjEwZm34WxOaoRqzm2lTc2gx5oT88A9n8qE
 jEdXRX4eeOSolMNjD81hgxX7XjidN3wvym/vJCeQFpPxvwqwcDVRMQc+32faHLVsCE7T
 l1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084301; x=1780689101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WnMiDonv1YO14rMlbhW2kVzk+7R9nLq/lyljZBG8qv0=;
 b=rh1OPPPN4mlQrRc5M8TkK6LKLeyyH9X2cS0q433GJAg4ZQlfF5gKQObujJUpA8bDIZ
 d/PtuR1UrEsqWY8kqh2hEm/9aWP5Pt7+REz7soCjnTrmrsPakxAyaQU7GdUOQI7QkHO4
 tlGTPE0g5iAhXM55FUQYBWgsfsTvtMTLQL6wjHqA4jxxpm8XlSkhftinGIiunEf8cyP3
 sQgDBj8ZxaZFqKyNdqEOjhhAGl5zJdbt03As1qnZfCZ2SjoLJQguMgyVbJvJVY83IrrJ
 h4wuPPwuqePAqPSNdNyer2dw/Ss4BtSihZEs4LnQaXhB3g6QvI0JDl4WxFQSifJ5ijP+
 PUbQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+hGeUDT2oLuxMrqlFaL4XojzQ6RDFld8cgzwxZf/LShPwsgRiHo/kGQoWIQ3DWErl18ZzjEQ7dcy9p@nongnu.org
X-Gm-Message-State: AOJu0YyWALb3T1lZry0ZzDE0tkwzcMm16XfK0rkRGRTVFpoGaUbpTVYu
 /JBpH/NGH7l9BT3SWJuBmf4Pxmk2k6CEmV49C5JKTKPg28XqBrKfnZv6Uwm0uDUu9f4=
X-Gm-Gg: Acq92OGlZHnQUPeA1q15UxN6LTQw38XVpBsF7KE88c8X1rkAdxhyx9fkKJGaQrWMWLT
 dpp3HCIaGhYicK+vWCoDLpGMjFNP2Ar4vXif+uR7jAuw58X9qtEWF51IPvwqZ7nsEM+QwB5DeYy
 nl4QEINGSvYEOL+y0JxqLAbkWpJOm7375FR46Wgp++kRGese4zwE9S1KSiSp2sqBZPGPyUZ2ntb
 nQJ87G5YJ2IMB/Mf3zG6CCDEG1i0ZV1HP6fEL2hdHEpkGJ39cA6zxRBoHv1PHjknqo6qQcNbvRF
 j04ljZIOBa85/kLtyUYnUKqmTYGUIcZaT8RT+xwaTeMh4kPpV0dLPZkw7zWxBfjQblbLJ7JOZZR
 I1okzBg+ppuW6/JfhsRMRRI98NLB9puBnKNJNyfR72/9tX/+wD16U32st1/VcQiwMVkFIN8N3Zv
 22Ro24XWHq74RbZRU9rn55WRRiRl8dqGGBZI+pSfqLe5KvNeocDyB6RmMczoWW9kpxQw==
X-Received: by 2002:a05:600d:848a:b0:490:58ef:cea7 with SMTP id
 5b1f17b1804b1-490a293dcefmr12453125e9.22.1780084301545; 
 Fri, 29 May 2026 12:51:41 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c12359bsm25514985e9.4.2026.05.29.12.51.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:51:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Johansson <anjo@rev.ng>, Claudio Fontana <cfontana@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Reinoud Zandijk <reinoud@netbsd.org>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/17] accel/tcg: Convert X86 AccelCPUClass ->
 TCGCPUOps::cpu_realize
Date: Fri, 29 May 2026 21:49:36 +0200
Message-ID: <20260529194940.97143-15-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
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

Register AccelCPUClass::cpu_target_realize as x86_tcg_ops::cpu_realize.
X86's ACCEL_CPU_NAME("tcg") TypeInfo is now empty, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/i386/tcg/tcg-cpu.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 04bb9787575..2a61de7f610 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "helper-tcg.h"
 #include "qemu/accel.h"
-#include "accel/accel-cpu-target.h"
 #include "exec/translation-block.h"
 #include "exec/target_page.h"
 #include "accel/tcg/cpu-ops.h"
@@ -180,6 +179,7 @@ const TCGCPUOps x86_tcg_ops = {
     .record_sigsegv = x86_cpu_record_sigsegv,
     .record_sigbus = x86_cpu_record_sigbus,
 #else
+    .cpu_realize = tcg_cpu_realizefn,
     .tlb_fill = x86_cpu_tlb_fill,
     .pointer_wrap = x86_pointer_wrap,
     .do_interrupt = x86_cpu_do_interrupt,
@@ -232,24 +232,3 @@ static void x86_tcg_cpu_instance_init(CPUState *cs)
 
     x86_tcg_cpu_xsave_init();
 }
-
-static void x86_tcg_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-#ifndef CONFIG_USER_ONLY
-    acc->cpu_target_realize = tcg_cpu_realizefn;
-#endif /* CONFIG_USER_ONLY */
-}
-static const TypeInfo x86_tcg_cpu_accel_type_info = {
-    .name = ACCEL_CPU_NAME("tcg"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = x86_tcg_cpu_accel_class_init,
-    .abstract = true,
-};
-static void x86_tcg_cpu_accel_register_types(void)
-{
-    type_register_static(&x86_tcg_cpu_accel_type_info);
-}
-type_init(x86_tcg_cpu_accel_register_types);
-- 
2.53.0


