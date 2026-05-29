Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72291CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 19:51:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT3Dq-0005ky-8Y; Fri, 29 May 2026 15:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Dp-0005kW-GU
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:50:21 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Dn-0004cQ-8A
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:50:20 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4906238c62eso58635905e9.3
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 12:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084218; x=1780689018; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSy0FrB9/d+wf1C2wnq80axQw2/zb3tMBvJqGyVtn+c=;
 b=upfmkLQ4ZWySOH9KHD5xLmdqK5/gTa41uLo2jVCDqC0tQb5RABnlFEqXJ21AEYQqaV
 HakFC+0BqG/EbJrkrWcZzEmYZI8iSFLZyCCBOebkFWwfcg0CyOm41SXyweFYxEJBMitz
 oVyerxGfDIUYWoUv1vr0ZKolqyv8o4FUQ37q0Pux/UhUW6vON7LKR0NsacA36HLhWVXX
 zBlhn+SlLzFeUf2pcnH2/HfdQMKn2MjECFAuajZ3nBVsWCwEnoXjOxzkq7YTOCKz8G/F
 tNehzaXP9/Z00aCcTa7oZZtQ5AjRCqtA2wfi/sbDstelzIwpUFCfQK4oJINOipOGQtcd
 VIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084218; x=1780689018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cSy0FrB9/d+wf1C2wnq80axQw2/zb3tMBvJqGyVtn+c=;
 b=s5SzSjFlbzAHpvshuNRlbutiaGCVrLbqnZiK+TQzhOeiU4GZu88ZGd2dHikifIf+i0
 TiItJ40J8rQu8bhPy9lCN+ZobhaQrysVOj/2lvCt9USDiN6ohyRQ0gru2LUN+ksJLC+3
 r794L22Zm2UFDpYiYnH3Epo4eOnzHNBK107eFZoAAWZo5T6jkjfkoqdD5Rodl7x38/5J
 L4Hc3Fy+/WVFtdue+dUw48+z64znscZKaQzxz6CYm+aGWlh//8YsHzPbO9APd0fXLT51
 ZcGA7T3l0Nm+XNiAWwsQnY4N+gtwthFlIxOxJlP14j6N8qC1YznZWSsXWj3XGlrROgiI
 jvfQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9/+voRi5C9ksfYrTe2NCUmwiD4DIEJz+3EO699RlaI9VW3I3KtL+zB7MlXnPEOOka1JB+67ldP570t@nongnu.org
X-Gm-Message-State: AOJu0YwzHkC4jpK2cdFHNGlqcM0Mb7R95BvBtW3StCPoWBA5vemiZia9
 1yRG9n1Iy9PUlCoNtcmGQlMYJz3gy1Rz+ouxlb3+wyjg8JfSsBEm/kXBBAIEyC03NN8=
X-Gm-Gg: Acq92OHfL4BADMkYLZ5ShNldlFavgnCYbmCtS/PIqMuHqHCP4LGsa33viS0FHwygGQV
 6ypa9lslMflS8gtMhwJA90hEq4YsOPhSrhro/WvoqglKWqKVpYvFZ44v/XmOETv1zYzTBT1V9Jl
 MWwE3ElqFOoeVLPOFCo5RsuzX4r2VVG4IK8x7c5/bjopRPQiKBnEERKsXi+/n6DyMIxJfrT8lDS
 LkWNId5OnCJOBQyH+p85RM4eyLEqlUk/TwRWdLaHmRmEOUEqvo+GFSVcb0UFy1QlA29Y9lmVU+m
 iOAau6JmYd3vqO6bmv9TrcWwBwCV88qz0wDvrB49OnhtqOnl1dVBfEsQP2fhhsnqRXp+s7SLJta
 LDtxTlEVHqDfCEdA6VFAqQOO4s7VmbzYlxonAbtfyLQWlTyjqkW/COJMbWtMD8pTGSxUoddpS1F
 G0QbH4IUs6Ucq/KU7f2X3ie7mxwOjmyo+6+A14fsu10awGGJvIekHZjy7I5VPoFgaXnA==
X-Received: by 2002:a05:600d:8445:20b0:48a:5c23:cab with SMTP id
 5b1f17b1804b1-490a293a126mr13005065e9.19.1780084217642; 
 Fri, 29 May 2026 12:50:17 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cab0e94sm64497825e9.12.2026.05.29.12.50.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:50:16 -0700 (PDT)
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
Subject: [PATCH v2 04/17] accel/hvf: Remove need for AccelCPUClass::cpu_realize
Date: Fri, 29 May 2026 21:49:26 +0200
Message-ID: <20260529194940.97143-5-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
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

accel_cpu_common_realize() first calls accel_cpu->cpu_realize
then ops->cpu_realize, which is set to hvf_arch_cpu_realize() on HVF.

We want to remove accel_cpu->cpu_realize, so have hvf_arch_cpu_realize
directly call HVF AccelCPUClass target_realize handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/hvf/hvf-cpu.c | 6 +++++-
 target/i386/hvf/hvf.c     | 5 -----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/i386/hvf/hvf-cpu.c b/target/i386/hvf/hvf-cpu.c
index 316c1b0ba07..35f6bddbc0e 100644
--- a/target/i386/hvf/hvf-cpu.c
+++ b/target/i386/hvf/hvf-cpu.c
@@ -73,11 +73,15 @@ static void hvf_cpu_instance_init(CPUState *cs)
     hvf_cpu_xsave_init();
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return host_cpu_realizefn(cs, errp);
+}
+
 static void hvf_cpu_accel_class_init(ObjectClass *oc, const void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
-    acc->cpu_target_realize = host_cpu_realizefn;
     acc->cpu_instance_init = hvf_cpu_instance_init;
 }
 
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 2d1a943b96c..c2cbacd3360 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -369,11 +369,6 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
-bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
-{
-    return true;
-}
-
 static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_info)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-- 
2.53.0


