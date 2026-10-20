Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB620606A31E
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qAfBWoy9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJ7Jr-0004IX-5W; Tue, 20 Oct 2026 06:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7Jh-0004Ep-3j
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:43:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7JX-0004L6-2G
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:43:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so23153865e9.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792493005; x=1793097805; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=clY0Exi/Fk2cbqeICRgpqzcE6k7M0cr1lXEHsMtE1Ok=;
 b=qAfBWoy9q5DhzDzQoUugTRkane1EVfx/uUaOa7JoDNkC7u5sdBMcZ3Iy743WDem/va
 81UwaMoT7DfnJobJWl9pKdi27CTOhgLTL+5Gx8L3ScIQiF5VkOQ8YjEvd2qcUjTa9ehn
 vH6KSFNFLwPFfzakuzg3vX+JTUsH9iu1DpgKz4vX/5GfLo42Q17Y0ZPCaMQZ8FOtVvqg
 AUR/hyAjQ1PJuacvU+dOyNaD0JHVQw9eX+wPgGJW6SzPEkoiJax7w+5bhRcQ6mD6OWsS
 hVNdDbl9bD3rrM+RUtXVS/b3kdbP89saygXbcBz1fHvjaLkzVQd5GiAGlNq2A5Ukmfge
 7/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792493005; x=1793097805;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=clY0Exi/Fk2cbqeICRgpqzcE6k7M0cr1lXEHsMtE1Ok=;
 b=n3Ko/JAYsSMUgaMZiX0FhCWGNEGEqYHEthgqPeuvwKGYox7+s7VazWHznEXPkTBVKw
 XsHtj8O0KF+gDqrZV2CEZ6roDHr9qbhSFZHyBVzAU85RtFrOzzVKtTTVFHXI8vQfCmcE
 MHu2LrhOkXGKw8PVtD148h2VaPtASCugH1K7ejk/X0UOcv1DsE4+Rk0xOon9QHhYc0uy
 J/q1mEfSCRG0VF5/oRYQl0iK7UYqlEPkC9rEVSoCtTB8Izqz3jr447D+EZ4F7wVlLUpf
 qzr7iULHfCBCpi2k8mxvVP9cjBLs8/uUJjX+zp7gKCThcmcEfkfcKEm+yPi3xg4fmxAk
 +B8w==
X-Forwarded-Encrypted: i=1;
 AKwUvBy5I0aq5bciHlnERzy3kCQ2ItGzQRli2jT9E/+qam91Bssxy3rI4byGjIAloCdWflkWHxHuoitK6QnX@nongnu.org
X-Gm-Message-State: AFq9FYJCoeqlUdwMCyCvb99TV54+yoY90Yo+eZotVEWKQs4A3BwvFboQ
 zlzsQj4t4IJycgPoA+pPBlpj5YRhcOSxEq85f92ZN+rsQxw/puc8bXJaP+FTuEah1Ww=
X-Gm-Gg: AYBFou3s5bAzbjg71+UmYZSBjogYIIq1L5GANc2qtin5jaLDk7i5BhE4AKCfmSn64Nr
 EWJZ1RJ67RPtG8KfTVQ/wUO2ajV0nJHJNurquVHyMQCoyGETmfaeHWIIotWdpyKYG83F2EzgUrh
 /5zJnKGV2VK26faeVhnE/Zn5ozbE+zPdiVLPPce57nlw9KKqm/dRQZ5mdGkJPxnO1xuBPS0LkrA
 gE7vFai6xug1NO37niiadSXs7KoPqYGLk4dcXSSth5e5vWQj6AA05b/ePetlsYG8BOgoV2svQOV
 UfmZUuuKcPItFfWI1OV6P9Zs7BjzVtdGQ0t5ifjsuAZZcarnaX5DCXtKHyav1Pw+MDaz61qbjX7
 m9ZAQvMcKe9XJi2KP0fAa6n78Id9fEvMuqOWB7H4edbNQiK9byxLDfBxVyqtG19YRTLXpnXjQ13
 lNTJdiNxpDT6LUB5uFeZa8hOFNEsibAFOczM75Qog/q07ULAapguXAF41qHPbStfhFMS0FZw==
X-Received: by 2002:a05:600c:3513:b0:4a1:a39b:e75b with SMTP id
 5b1f17b1804b1-4a1d7607560mr224796055e9.21.1792493005376; 
 Tue, 20 Oct 2026 03:43:25 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2cc809csm64722745e9.8.2026.10.20.03.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EA3605FAB3;
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
Subject: [PATCH 06/23] target/s390x: wire up empty KVMAccelCPUClass
Date: Tue, 20 Oct 2026 11:43:00 +0100
Message-ID: <20261020104320.3686723-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org>
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
 target/s390x/kvm/kvm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index dc67e848864..69e49b7d151 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -52,6 +52,8 @@
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/s390-hypercall.h"
 #include "target/s390x/kvm/pv.h"
+#include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 #include CONFIG_DEVICES
 
 #define kvm_vm_check_mem_attr(s, attr) \
@@ -2655,3 +2657,26 @@ int kvm_s390_topology_set_mtcr(uint64_t attr)
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
+
+static const KVMCPUOps s390x_kvm_cpu_ops = {
+};
+
+static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
+{
+    KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(oc);
+
+    kacc->cpu_ops = &s390x_kvm_cpu_ops;
+}
+
+static const TypeInfo kvm_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("kvm"),
+    .parent = TYPE_KVM_ACCEL_CPU,
+    .class_init = kvm_cpu_accel_class_init,
+    .abstract = true,
+};
+
+static void kvm_cpu_accel_register_types(void)
+{
+    type_register_static(&kvm_cpu_accel_type_info);
+}
+type_init(kvm_cpu_accel_register_types);
-- 
2.47.3


