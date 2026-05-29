Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28327CD6E50
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:30:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSyAe-0006uq-Kx; Fri, 29 May 2026 10:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAc-0006oY-RU
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:42 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAZ-0003Ff-TJ
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:42 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45e8a834cc2so8692158f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064798; x=1780669598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbRLYretApx2XFNweDx4MjqL1BkYigncE9vMgvnIk44=;
 b=xQWu5vhRixQtyGmXZ4O5XxYftfJJrMH9BYK5UXHqqj1gDy6GQ1o6Ss1syvFM1NDe7A
 SyKLUQJ1zeJGMdIDlhirnaxbdFHXc8voEqE0NvRkDlw3Oh6qBMXGHfuXOcKtP9AqPo1q
 uIgc6tcSlyl2p9D4F5ENY5qOyCR4g+IGCkslf+ncpxTdwUVaOQbHJVQ9GZBNN697K/BX
 GsyWfQ8CVFB/GGBGRYuYHTji3b/Hq5Pt1GjT+sBbECfCUVg19xtxQhQoMuhIgJNi30bZ
 5YzLXdR+yzrQGob4phDmrzEe7DUhsFh5/lXtlQKIj82ePJ59ksuEHJIy2fAvMMTgRPTI
 mfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064798; x=1780669598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GbRLYretApx2XFNweDx4MjqL1BkYigncE9vMgvnIk44=;
 b=Gq1f/W9Ez9XvTaWSwX7RyftpXUaCbLMlsWs8Utf1aLmTyEhEXlgnI9hOkE2pr7WXtr
 nSgyclgNj+1PwOnNwnkpW2DoRB6LO5D47mQlREVz5Gsi/k0Pu7SX9J7tLvdRX3caDr1E
 YuvyJ7ZqPbWcNrP7JVrQxqpUGeW7xO/2ghXGzZ/BxgpeftwvDddKhSr7Vu+AvtMQPFZ8
 ENLULZXMTZv4tCKqPn3tp/HRCyEoWWYpsdGSk14S5EXYBvTE5jheejXPyMYhqL0U6pG2
 VdDTd/vzBXPz8KiHhY1BjgayLLQv6UPdDIAKuNM3YxI0DsW4qcNokQ04J3wRRmHGx2qU
 evtw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/QwX+Nye9C5Z/sU53zWAU5AS+R2xG6yJ+JyElxjbxB9ZMzEi6X1l58vRAGkabUuY6ri8PkarkcNAzU@nongnu.org
X-Gm-Message-State: AOJu0Yyk5ulgmSSeggGJFwW+VWqvO0+dfKJAU1mOGYENBQhNrBYNNAZi
 7ub71pO8Sve+3d7jWlrY3l2CL9frKNZduHvEfZ2PZiyPsG1WhNcZXcmM/xdm2oAT4nE=
X-Gm-Gg: Acq92OEZ+VFlIMKZtWzhtSrB35gZ00KcCE7zDFBmQcaX+qDk6Bo4d3R9tRK7RKqFZBJ
 QZjaXivwxziph/BSR0Hz0k/iyHBnAtiLTlCsrMR0pdKoS8v8+YlQhwO7Wc+D7dSUnY9T7ncbmXI
 lpQIq0zU0y8SIBlgRdBA55dJtu8Mg9IxgNnGk38CLL0maxq5ItCiVh/RI/UwuDSNQk5uokr+bEi
 NOw1V9bHdTYklyeVxk8+h+F1T0/Oqq78Z8NIdBmrcsVGMFU9kq9PQyxPFqTDk0/fLzxf07G+qng
 t4oJKwVv1xRw3MYXWiWzTgrtqKAF9XNjtzoSEinCfkpsVETR2Pfl9cwJT1uVdUmku2cuEf1VQkX
 oPyAY/EHd8ZaJAE+zij01YoREBOxaHYJBDBnfZB+rTjmAfJtnhTvFF4/Uf8dSxkr72KHvGi64jI
 qAOCDsSFazITatfjbnrQGnZO/cyXc9kxW/eFpbq9xp2z5UEJuS7dIuf5sD0n/8yA7GXA==
X-Received: by 2002:adf:e7cc:0:b0:45d:b14b:23fb with SMTP id
 ffacd0b85a97d-45ef6b24f8dmr59899f8f.11.1780064798213; 
 Fri, 29 May 2026 07:26:38 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3556f51sm3823250f8f.25.2026.05.29.07.26.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:26:37 -0700 (PDT)
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
Subject: [PATCH 15/17] accel/tcg: Convert RISCV AccelCPUClass ->
 TCGCPUOps::cpu_realize
Date: Fri, 29 May 2026 16:24:31 +0200
Message-ID: <20260529142434.87880-16-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Register AccelCPUClass::cpu_target_realize as
riscv_tcg_ops::cpu_realize. RISCV's ACCEL_CPU_NAME("tcg")
TypeInfo is now empty, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/tcg/tcg-cpu.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 703c2d9bd0a..c885af6c03f 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -30,7 +30,6 @@
 #include "qemu/accel.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-#include "accel/accel-cpu-target.h"
 #include "accel/tcg/cpu-ops.h"
 #include "tcg/tcg.h"
 #ifndef CONFIG_USER_ONLY
@@ -269,6 +268,7 @@ static vaddr riscv_pointer_wrap(CPUState *cs, int mmu_idx,
 #endif
 
 static void riscv_tcg_cpu_instance_init(CPUState *cs);
+static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp);
 
 const TCGCPUOps riscv_tcg_ops = {
     .mttcg_supported = true,
@@ -276,6 +276,7 @@ const TCGCPUOps riscv_tcg_ops = {
 
     .initialize = riscv_translate_init,
     .cpu_instance_init = riscv_tcg_cpu_instance_init,
+    .cpu_realize = riscv_tcg_cpu_realize,
     .translate_code = riscv_translate_code,
     .get_tb_cpu_state = riscv_get_tb_cpu_state,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
@@ -1676,24 +1677,3 @@ static void riscv_tcg_cpu_instance_init(CPUState *cs)
         riscv_init_max_cpu_extensions(obj);
     }
 }
-
-static void riscv_tcg_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_target_realize = riscv_tcg_cpu_realize;
-}
-
-static const TypeInfo riscv_tcg_cpu_accel_type_info = {
-    .name = ACCEL_CPU_NAME("tcg"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = riscv_tcg_cpu_accel_class_init,
-    .abstract = true,
-};
-
-static void riscv_tcg_cpu_accel_register_types(void)
-{
-    type_register_static(&riscv_tcg_cpu_accel_type_info);
-}
-type_init(riscv_tcg_cpu_accel_register_types);
-- 
2.53.0


