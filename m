Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97320C7EE23
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:26:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2QtV-0005LT-TK; Fri, 26 May 2023 02:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q2QtJ-0005EQ-Ap
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:25:36 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q2QtH-0000p3-Pt
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 02:25:33 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64d2a613ec4so436247b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 23:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1685082330; x=1687674330;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dfZLHLenIMrmO0jB1mDUgnBqGDCRWU9RcEAKqrqYqAE=;
 b=i6YXnEHHRZcYV9PvNABDtI6eQRHR9T/UAF6RJlRt3uxKrS3FRQq4tSDVs8Pw6yeHFH
 yhWjiVXG3iWmkEqMCwvJTPXpLXPDQj56DTCdFQDYg4wu6jZOrjOStci38FHiHto7vLTY
 pBO9aUfBiRm9TnsZHWLyP6u32KsGDLRY0I+XxbeHjK1anUJG/xfc9CNn9EM3VBM8HEB/
 XlPNp6WQ7bA9kI3ErFRdjRDeMStVHXiAgYnQTUNFI/RyC7dtmFtAkw3tIIglof7ZKDyh
 FQrAKOoa1vfO/8N1RvOfn9EjtMb4t8qaxypBWFS/zHsZtKXWiRfvRmF6Qqs4oieM9FhO
 dIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685082330; x=1687674330;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dfZLHLenIMrmO0jB1mDUgnBqGDCRWU9RcEAKqrqYqAE=;
 b=cG0/N9TGwfCmYraXhhzv+6olAoT7i1WRhqvFYqasFDXxOoBdSthgexzqIBpxFdTlv7
 2kW41QbFzq2+BGTUqx7X22q6gwzi+2LqVuqcOpYAWqDCGT5kEr+u13DQWOsjmVRTtu2C
 qsj5K/HrwTivdkfE7ZYygJEqYqYPq3/ofc2cbTQ3JghbpKfXkl8Fei9F2UZsZOmEh682
 /eqC1qS3z88eR5mCBrIcVwhY4P8wFMVHa9faS9LuyDdc32CAii6DIIRVYl1Hz/nI/PdW
 xOSJbOmWKBrTMut+7n5JAzpD+xYjomaEXPcsIuNFCMZ4GbB77aTkEa/HQd6Qu8ImyY2u
 MnPQ==
X-Gm-Message-State: AC+VfDxQCgFQcnNvDEJ6zR0bsbSrc461DiTRUP2cNJGMmsa+9wEY/fsv
 +v8nW7JdanD+Sr7IBA4whcKrqQ==
X-Google-Smtp-Source: ACHHUZ5WevrNwpEUd09OMlCMcDFl3OE+OQQn7rZ71gbWoj0Tp4n/zT3Iqf3ICCPuop30Pk2qUImn3A==
X-Received: by 2002:a17:902:eacb:b0:1af:a2a4:8386 with SMTP id
 p11-20020a170902eacb00b001afa2a48386mr1442476pld.38.1685082330441; 
 Thu, 25 May 2023 23:25:30 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a170902bb9800b001a94a497b50sm2429150pls.20.2023.05.25.23.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 23:25:30 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com,
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Subject: [PATCH v3 3/6] target/riscv: check the in-kernel irqchip support
Date: Fri, 26 May 2023 06:25:03 +0000
Message-Id: <20230526062509.31682-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230526062509.31682-1-yongxuan.wang@sifive.com>
References: <20230526062509.31682-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We check the in-kernel irqchip support when using KVM acceleration.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/kvm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 0f932a5b96..eb469e8ca5 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -433,7 +433,18 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
 int kvm_arch_irqchip_create(KVMState *s)
 {
-    return 0;
+    if (kvm_kernel_irqchip_split()) {
+        error_report("-machine kernel_irqchip=split is not supported "
+                     "on RISC-V.");
+        exit(1);
+    }
+
+    /*
+     * If we can create the VAIA using the newer device control API, we
+     * let the device do this when it initializes itself, otherwise we
+     * fall back to the old API
+     */
+    return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
 int kvm_arch_process_async_events(CPUState *cs)
-- 
2.17.1


