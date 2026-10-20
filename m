Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D2606A322
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iCv5mBKZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJ7Jb-00048D-JP; Tue, 20 Oct 2026 06:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7JX-000469-NA
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:43:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7JU-0004J0-9Q
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:43:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so23724675e9.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792493002; x=1793097802; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GObncgmEUBUSeoRmmw6cdeZcoKrwnIqxlNvyYUwUu+A=;
 b=iCv5mBKZoEQzGYBBQZmyqGREpGZopyN2ntXUYWUEcX8aQz91F0hbnpltOjOv08cHc8
 /+JWJjhqjSprGTzGMUZnW+4pRA+22jpAMd87cbvVimzRNtU4LHkQ+9ET/prOiLWESHLA
 Im4yaPl/N1tp4Hj5anoeay8mxDfwKwrDJzhk7D9qTTBNNNdRB7Y6kx7N6L1rkafo77o/
 77AZRwKN+pyvV1BKoSSUDVc1dHrNX70ALjm7e+r2PxHuWg2aKV90Fn71UQxhSv28EvDu
 iqHL+No7MqX4djpXlniha+lGDMqbUm22IgSdVR8IKVJYPmb/aU0Hv/IkzHJgjlqjS2+6
 rVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792493002; x=1793097802;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GObncgmEUBUSeoRmmw6cdeZcoKrwnIqxlNvyYUwUu+A=;
 b=Tp7zFVfBlPlZzOFABnKbfillMFSTf0pvPI+kBv3atbmsZvcBM5PvXk6F11QO/8z/4f
 GusEzJQHqDb6Jatyi+7zvVAWewiwStYzrbaffbMGC22ATdtqbQwVUzwya2XbuWEUQga9
 TpRFComXdyGXtn8vtcIN4zMYQY+1JXWVxU20xdAN2lvZoXAOQJM2WrtTkCYDdiPrWJLT
 Qp2x4htY1slIaFj8GE1VqpmBDCV8Is5x2+lSV2WIsBTblbWafFZ9ClybgGrg//rSxRs+
 Mk/wzawA0ZHsMcQiL+fOKQEev65rkiWecLPhP8Dmiu47G0oYjVZ3o6GyvZ2uqJbosUQc
 TVRg==
X-Forwarded-Encrypted: i=1;
 AKwUvBypUBbecJJ4FWHT0lAlbpzMN3fjpmDuAnA+TWkOOnRJcrq8ZUK8tdXUvyFwcC7cElfnx2Kvvi8oz0Ss@nongnu.org
X-Gm-Message-State: AFq9FYJEW+qE00+Qay434z/5CK9zCRuaEfHs+BrWxlSgum6WO8/GVyGk
 pFgfTGGk1nquPOqIe3PI7QfXyqvn6mhYm6C62xw2G/gZmIzkv7vDPCMBtyN6rNqCQ7k=
X-Gm-Gg: AYBFou1gJZlXYsAajvhsi0n/peBiy6X7gWVzjMdnwssYo1JONbvTeOm09SjX8JJk21p
 64d6buLSwYk99Y+beF9PUvjORL17/60G9c4S6NFcYRhuicj7/mJRcn+/nCX0QnNCtDt6hTpqz8m
 H7rtuxBpMctSa0AYAItltx5MgW/n4z/2+p1Ln7rBlUK3//q/mJadiIc1pW/Edw/K0IOW/cej/Cy
 TdpMLpsX0l/XNXbQZmcu8hZzFl793xZEBg6ytJ6oKYQQ/DPJdl++tYbSObPME4d2U/3IFpeLwJe
 0gafz/lfOqhTSBGbxhntaKq7W9lurglmoGAzRxp18+rD0pW+ZU2eATKF2H1mT3EGcJdbB8B5nim
 xhro+sNZHsMpKkM8nbtO1A5XfqEZuLTlYZ2tB1RdKUrUBV4r7uOQCAGaMqVwfVMCrkT7JFof0vT
 LGUBIGV/tO/CQ0Gjaay27pF9FUtoVhPrM6O7o+PmEaLo4nt1wijoS6qMRIfbXw4puKeB8hy/49x
 LxfFj1R
X-Received: by 2002:a05:600c:c0c7:b0:4a1:d743:77f1 with SMTP id
 5b1f17b1804b1-4a1d7bc2e33mr147348455e9.24.1792493001951; 
 Tue, 20 Oct 2026 03:43:21 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2cc8e98sm67312705e9.9.2026.10.20.03.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 03:43:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 743535F957;
 Tue, 20 Oct 2026 11:43:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bibo Mao <maobibo@loongson.cn>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Song Gao <17746591750@163.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Bj=C3=B6rn=20Walk?= <bwalk@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-ppc@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, linux-edac@vger.kernel.org,
 Glenn Miles <milesg@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Menghani <gautam@linux.ibm.com>,
 Xianglai Li <lixianglai@loongson.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Chinmay Rath <rathc@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Weiwei Li <liwei1518@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 02/23] target/i386: wire up empty KVMAccelCPUClass
Date: Tue, 20 Oct 2026 11:42:56 +0100
Message-ID: <20261020104320.3686723-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org>
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We will fill in the functions in future commits.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/i386/kvm/kvm-cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index da8d77ade06..9de107a18d5 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -17,6 +17,7 @@
 
 #include "kvm_i386.h"
 #include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 
 static void kvm_set_guest_phys_bits(CPUState *cs)
 {
@@ -233,17 +234,22 @@ static void kvm_cpu_instance_init(CPUState *cs)
     kvm_cpu_xsave_init();
 }
 
+static const KVMCPUOps x86_kvm_cpu_ops = {
+};
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+    KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(oc);
 
     acc->cpu_target_realize = kvm_cpu_realizefn;
     acc->cpu_instance_init = kvm_cpu_instance_init;
+    kacc->cpu_ops = &x86_kvm_cpu_ops;
 }
 static const TypeInfo kvm_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("kvm"),
 
-    .parent = TYPE_ACCEL_CPU,
+    .parent = TYPE_KVM_ACCEL_CPU,
     .class_init = kvm_cpu_accel_class_init,
     .abstract = true,
 };
-- 
2.47.3


