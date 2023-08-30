Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5048C83F01
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:36:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbLM1-0002Cw-IV; Wed, 30 Aug 2023 09:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbLLz-0002Ab-Iz
 for qemu-riscv@nongnu.org; Wed, 30 Aug 2023 09:35:27 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbLLw-0006Bd-QB
 for qemu-riscv@nongnu.org; Wed, 30 Aug 2023 09:35:27 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-573449a364fso3093077eaf.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Aug 2023 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693402523; x=1694007323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H/k+UuiCQSAnZhFSc5jEFaZQ7FiDDWP92JVM7gxN+po=;
 b=WR2pXfkB/2WjnLNYgFfr8SVCeu5/Dk5IyLHWQ2rMb9PQMhGjCY6ADWpngq3HDA5PpI
 vJPZbJT/NAykVPBOMdty7Bjps5jX1mGPWenH3TCoqLZEzfN4tkwFWE6mDO2vQ00tK/pM
 5qbVN//PsAQpnQFI8V9RnFv314CgF12k6L/N1EVeyyb8qT/fc4ZDUr5KE3Qcnzig8kW/
 lX/cMLioyybHfYaR+qHRtzviuwe1q+lrpflhMh1ytPvYkIJKK54Ed9EdLgdMMqhgEKTS
 b2RnwolzPQvcpL1WI1Zs/yZN9Ai2ECv/RAn7OlU6dyey9qsrFnQ1IGltbbGAAEDUuKBd
 ko+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693402523; x=1694007323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H/k+UuiCQSAnZhFSc5jEFaZQ7FiDDWP92JVM7gxN+po=;
 b=SfPql2NDVENwUaQql//sUjsgSFc+7TWxMMsE2KQsvtbcUgBq6ceIjWBzCRmOWE8W0x
 ddfkxpOeC+Cu4HX7L7Un12U3YAalQlHLNdFFbX+OQ5EkereS9sF6zXGG5hH7mHUStLaU
 0eO0oDXNrb+DYTYkC84psrB/1LtbXxtdMLWZWJHhqlCcEdGsIkSqyDlDfTz4tWRxqhPA
 Oz4VGO7HpCc+lmhVKo6f0HO/rMyqE3QfLi6LJ6JD7NWY/e9MHLWsB8KWjnxOpryDLffQ
 tu3wzJhfekn2r9YqtN2yi2RI0Qd1K2JYyrk2p7oz6nH40hOyQHmKEoPCvGmDgU/mFUXN
 CgNw==
X-Gm-Message-State: AOJu0YwD69CbNuqozmFXtbSTS1WdrUDET7BgJV/FGMbeanKsAjtUiBbA
 pH4tznZEqpKlGLv8ryLLe17F6A==
X-Google-Smtp-Source: AGHT+IGZ3cFJYSYEX+t5gSPEP3ZS0kav5i7FI3wscR13fUpZ3OchZrx+m1jpj88NHcwhtTH49WU7yw==
X-Received: by 2002:a4a:3416:0:b0:571:aceb:26ce with SMTP id
 b22-20020a4a3416000000b00571aceb26cemr2313476ooa.1.1693402522999; 
 Wed, 30 Aug 2023 06:35:22 -0700 (PDT)
Received: from grind.. ([177.94.15.194]) by smtp.gmail.com with ESMTPSA id
 125-20020a4a0383000000b0057346742d82sm5938997ooi.6.2023.08.30.06.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 06:35:22 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/2] hw/intc/riscv_aplic.c fix non-KVM --enable-debug build
Date: Wed, 30 Aug 2023 10:35:03 -0300
Message-ID: <20230830133503.711138-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830133503.711138-1-dbarboza@ventanamicro.com>
References: <20230830133503.711138-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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

Commit 6df0b37e2ab breaks a --enable-debug build in a non-KVM
environment with the following error:

/usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_intc_riscv_aplic.c.o: in function `riscv_kvm_aplic_request':
./qemu/build/../hw/intc/riscv_aplic.c:486: undefined reference to `kvm_set_irq'
collect2: error: ld returned 1 exit status

This happens because the debug build will poke into the
'if (is_kvm_aia(aplic->msimode))' block and fail to find a reference to
the KVM only function riscv_kvm_aplic_request().

There are multiple solutions to fix this. We'll go with the same
solution from the previous patch, i.e. add a kvm_enabled() conditional
to filter out the block. But there's a catch: riscv_kvm_aplic_request()
is a local function that would end up being used if the compiler crops
the block, and this won't work. Quoting Richard Henderson's explanation
in [1]:

"(...) the compiler won't eliminate entire unused functions with -O0"

We'll solve it by moving riscv_kvm_aplic_request() to kvm.c and add its
declaration in kvm_riscv.h, where all other KVM specific public
functions are already declared. Other archs handles KVM specific code in
this manner and we expect to do the same from now on.

[1] https://lore.kernel.org/qemu-riscv/d2f1ad02-eb03-138f-9d08-db676deeed05@linaro.org/

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/intc/riscv_aplic.c    | 8 ++------
 target/riscv/kvm.c       | 5 +++++
 target/riscv/kvm_riscv.h | 1 +
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 592c3ce768..99aae8ccbe 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -32,6 +32,7 @@
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "kvm_riscv.h"
 #include "migration/vmstate.h"
 
 #define APLIC_MAX_IDC                  (1UL << 14)
@@ -481,11 +482,6 @@ static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
     return topi;
 }
 
-static void riscv_kvm_aplic_request(void *opaque, int irq, int level)
-{
-    kvm_set_irq(kvm_state, irq, !!level);
-}
-
 static void riscv_aplic_request(void *opaque, int irq, int level)
 {
     bool update = false;
@@ -840,7 +836,7 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
      * have IRQ lines delegated by their parent APLIC.
      */
     if (!aplic->parent) {
-        if (is_kvm_aia(aplic->msimode)) {
+        if (kvm_enabled() && is_kvm_aia(aplic->msimode)) {
             qdev_init_gpio_in(dev, riscv_kvm_aplic_request, aplic->num_irqs);
         } else {
             qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index faee8536ef..ac28a70723 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -46,6 +46,11 @@
 #include "sysemu/runstate.h"
 #include "hw/riscv/numa.h"
 
+void riscv_kvm_aplic_request(void *opaque, int irq, int level)
+{
+    kvm_set_irq(kvm_state, irq, !!level);
+}
+
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
 {
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index 7d4b7c60e2..de8c209ebc 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -26,5 +26,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
                           uint64_t aia_irq_num, uint64_t aia_msi_num,
                           uint64_t aplic_base, uint64_t imsic_base,
                           uint64_t guest_num);
+void riscv_kvm_aplic_request(void *opaque, int irq, int level);
 
 #endif
-- 
2.41.0


