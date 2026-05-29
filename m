Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBBCCD6E51
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:29:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSyAX-0006aK-00; Fri, 29 May 2026 10:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAV-0006UM-0z
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAR-0003Bn-RV
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:34 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so147987345e9.3
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064790; x=1780669590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+YM3QmRUdwOukM/MeGpefVIWU6iLYxgHP+iBzBx3U8=;
 b=iyPJPUGBH/vn93bOZigrZiqOdGrLKyaJ5+W6M+oey58OlX0mctBDAOIg/SydzbnMrf
 d5BXds4badR1DVpOAolsp99JPqQ0fG3NT5Ci23RejPTUYzMqYQ2o/0Q9X+4R0E7Gw6bd
 Tmk3oVkoSufjWsCyaJJnUJSB8PIUv6YYoACl9boR77hv4LDchBeqxs9DefDWCoujGErD
 tvKjnRCva0go9CU4kUotZ4zrxpZmbUoM2gNk7U7iRzQtD2FuiesJk2KI1wsQSzEOD4cG
 vu38WHITH9ZRoRACPpTzc56ksUjOKKUP2RLCqCFeRSiKOJhR1ROSZOqINpAVaANV7+9Q
 7uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064790; x=1780669590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K+YM3QmRUdwOukM/MeGpefVIWU6iLYxgHP+iBzBx3U8=;
 b=snsvRbvBvH65UYIUlgJaguRxPNrBz7R5Ps5knon+WNB/PqrhXiqSIf3Ak45nsJW2G6
 3cQ5r9Eo18mI3w0kKzEs3vDAWFykzySh+hn6+assj3V08Ds0TZgDMkNZVYtIlPYrLJkp
 d6hsjtMEEspgoVP3aeNjqt2sU7fND1EDjv1wfrWNgDyGmg375JAnn1+DbwOr/p76w/e1
 Bh/uyA1a40O9GluzGWhWE9QwSCSVCiYf6CAatXjqoLBRdtlvLa1av4EVyEzYTNjKEqla
 v+gUo3SHwBHd2mfGQaxloc4kKUR/QLWODUTwKdD6zzKPsLBWlT435rlwqKCGFvgBHbzW
 e9mA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ubHMwdzkkOEyX+Ra+g9oReSTeyYH+Uysis341gPik0FQg+AHJ3r1cZdiLkYtJn0pxVl/9CJQX1fOs@nongnu.org
X-Gm-Message-State: AOJu0Ywycy/Ax7Navwv62RKNzomd471BG5+kTfWEOiR+hIm/ey/dlPgY
 HFwQocZ5i4e1yrYQhyZ0l0HeZ1aL5Kw1/1jN02Lk7/eGuzMZXTHUeR9OAub/alwnbPU=
X-Gm-Gg: Acq92OE0tVBwq6SedeTT/6mGIYqnkh1YHhKttLG3wIYwiwrtbPpc5XIe7OMITV4qvd6
 YHfArF2c7foGDQr4VMjU+GV9X9JEny+h7vgzW59QhkV8dcEBmOF/LcdusJEu2JXDlmqvdLTcMyu
 jKU1qVkCV46n3P1QHPwcU9h1T1mz70CJlxXezB0k/BigSa8uHhSAgIVq+XNcOXHFos2+JKGEz5H
 OAuHKzqyGH3iQXfC25HavyUSbX8EBJDatfkjRCjM11Kxm3+QsfnCRTK0K39kostZHuCyakK67TN
 jBRwRzOEOBN9mlo4o+1usZ0i8zLV+Ws75KjaoudWpJMkS94t6vD9qArZdODUtoOCtIV+XJoTX6S
 peIIJ9Q2UZusGRi5faZ9H8J1XqtTQ8OnOWzxqOMQiFu/nK/tH2qtRns6IHioqulzC1xTAvW3nRL
 4Q/zT8YF3i/0dTlVJHyoyqzm3WRElXBVDuPA3vhGUakCwktX0vbtLmED6aLbWSd9Im3Q==
X-Received: by 2002:a05:600c:3b10:b0:490:5872:e641 with SMTP id
 5b1f17b1804b1-4909c0cfe40mr56255845e9.18.1780064790272; 
 Fri, 29 May 2026 07:26:30 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909dff2a80sm49531525e9.3.2026.05.29.07.26.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:26:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/17] accel/tcg: Convert X86 AccelCPUClass ->
 TCGCPUOps::cpu_realize
Date: Fri, 29 May 2026 16:24:30 +0200
Message-ID: <20260529142434.87880-15-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


