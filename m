Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B007E7716D
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 13:33:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJBya-0003IZ-SE; Thu, 05 Dec 2024 08:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwU-0001J3-Bi
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:55 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwR-0005B5-6I
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:54 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-724fc1aaa91so948640b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 05:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733405429; x=1734010229; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o3wQwqjU1VzzKyMbT4hRnaV/t/aFay9eavJGn9ofOPk=;
 b=QMVdm16l74kp857dnVMVsHMaamQAY0A+1gEC4/mkxd+F9FwQFinhHXfikx4Hwtq6b5
 omm1aA+jHRq4y7HhsIQt6JiScA/Jj6AWDhF16qEl6tApBsIpqWWiffL4OUz+aoZcr0K9
 Oz6T4TLdcnpJuFI9AxwOszbRAhBCv9R1gfT8PKbVtkizTUquzEhNsbI6Jvb6MzHGOnNK
 QFaWh0t5OgCPN69ym4q0lhA3ea+wO+t6UlrY8U1anTqzxz8EpfXeC+YxxBK1Im444IvL
 8oleMrZyi7zb/25oWIo30MzLCLFmKrvvbM3F/vRo+eFhcoIPeX+0tP8AR3o7eff5phPY
 HHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733405429; x=1734010229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o3wQwqjU1VzzKyMbT4hRnaV/t/aFay9eavJGn9ofOPk=;
 b=SX/vJX4so3X1IwKVMIxguPZJVO7+cO5vbnMip7K6BtNdbsI18ppe4lm0chyipObAoH
 0M3Z5WHXGN1NPQu4UBfgJXtXewvHAPx1d1LA4wJcRIcyA9KshzL0eGpvzd1opT7RQ4NQ
 vSbifgfX7sOfVvEej8W2SuNMiZSRaP2leh19OA4K9tag/9BgwGUyud0VjSyJhXimHBfW
 IynWQyPQVWmROVKhtze0NZDSKD9d8RuVYfT/b8Rz7do/n3zrDQGH7f0Z8loxXSEUq/hB
 eF4/ulu9fszNny6mTC9a980PeO9QbJLezxNJpvoGhBG+1/7mPkTy4FjRREt+KPqBZKjf
 d9pQ==
X-Gm-Message-State: AOJu0YwjfIkYE+NuOw8RzOL15y3hIp9B7OVJFle+WB/4YznLsPVavKuf
 1S2//XR+lcyeLR+ZBXR3guduhtlXbnebl7yGB0b506hfNNmVyf4XzU3m5rWk6iw=
X-Gm-Gg: ASbGncv47QWAgewBUWKRBOHFqfg5wVFpi4bohRYufGTVBVNiVHvUgM9eZ0SECh1Rdmy
 9xwtr4EX2v28ncHopQ50ASWV1we1elqGQoNzH1Kmv3nkwOYm9KXkIqN+WBmR3PQTLr1hOahh65k
 fiLxH3+ETH8XwzylhG+pmUjf0EpEJYW1FIf+90RY/DvNk8h4u0FrE2woFSf5oFXW/G85ojcUCMv
 hDy219sVjeRvmiRrNqpi3X4UwvE0qG7vhSA5ic8kVoPuhezztP/kW9udl6XRWBJ1xXSzg2rcATR
X-Google-Smtp-Source: AGHT+IFUyMlCc8OOYnlwW4TEHgHD7BgeQx09ZelVl/jN33gIeobFDKhkbO5QBwpMQns2PuA3E+tJ4Q==
X-Received: by 2002:a05:6a00:1387:b0:71e:4296:2e with SMTP id
 d2e1a72fcca58-7257fa77460mr14354642b3a.11.1733405428641; 
 Thu, 05 Dec 2024 05:30:28 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a2a8f512sm1250315b3a.126.2024.12.05.05.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 05:30:28 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Tomasz Jeznach <tjeznach@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 06/11] hw/riscv/riscv-iommu: add IOCOUNTINH mmio
 writes
Date: Thu,  5 Dec 2024 10:29:58 -0300
Message-ID: <20241205133003.184581-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241205133003.184581-1-dbarboza@ventanamicro.com>
References: <20241205133003.184581-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

RISCV_IOMMU_REG_IOCOUNTINH is done by riscv_iommu_process_iocntinh_cy(),
which is called during riscv_iommu_mmio_write() callback via a new
riscv_iommu_pricess_hpm_writes() helper.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/riscv-iommu-hpm.c | 60 ++++++++++++++++++++++++++++++++++++++
 hw/riscv/riscv-iommu-hpm.h |  1 +
 hw/riscv/riscv-iommu.c     | 38 ++++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/hw/riscv/riscv-iommu-hpm.c b/hw/riscv/riscv-iommu-hpm.c
index 325088333e..70814b942d 100644
--- a/hw/riscv/riscv-iommu-hpm.c
+++ b/hw/riscv/riscv-iommu-hpm.c
@@ -202,3 +202,63 @@ void riscv_iommu_hpm_timer_cb(void *priv)
         riscv_iommu_notify(s, RISCV_IOMMU_INTR_PM);
     }
 }
+
+static void hpm_setup_timer(RISCVIOMMUState *s, uint64_t value)
+{
+    const uint32_t inhibit = riscv_iommu_reg_get32(
+        s, RISCV_IOMMU_REG_IOCOUNTINH);
+    uint64_t overflow_at, overflow_ns;
+
+    if (get_field(inhibit, RISCV_IOMMU_IOCOUNTINH_CY)) {
+        return;
+    }
+
+    /*
+     * We are using INT64_MAX here instead to UINT64_MAX because cycle counter
+     * has 63-bit precision and INT64_MAX is the maximum it can store.
+     */
+    if (value) {
+        overflow_ns = INT64_MAX - value + 1;
+    } else {
+        overflow_ns = INT64_MAX;
+    }
+
+    overflow_at = (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + overflow_ns;
+
+    if (overflow_at > INT64_MAX) {
+        s->irq_overflow_left = overflow_at - INT64_MAX;
+        overflow_at = INT64_MAX;
+    }
+
+    timer_mod_anticipate_ns(s->hpm_timer, overflow_at);
+}
+
+/* Updates the internal cycle counter state when iocntinh:CY is changed. */
+void riscv_iommu_process_iocntinh_cy(RISCVIOMMUState *s, bool prev_cy_inh)
+{
+    const uint32_t inhibit = riscv_iommu_reg_get32(
+        s, RISCV_IOMMU_REG_IOCOUNTINH);
+
+    /* We only need to process CY bit toggle. */
+    if (!(inhibit ^ prev_cy_inh)) {
+        return;
+    }
+
+    if (!(inhibit & RISCV_IOMMU_IOCOUNTINH_CY)) {
+        /*
+         * Cycle counter is enabled. Just start the timer again and update
+         * the clock snapshot value to point to the current time to make
+         * sure iohpmcycles read is correct.
+         */
+        s->hpmcycle_prev = get_cycles();
+        hpm_setup_timer(s, s->hpmcycle_val);
+    } else {
+        /*
+         * Cycle counter is disabled. Stop the timer and update the cycle
+         * counter to record the current value which is last programmed
+         * value + the cycles passed so far.
+         */
+        s->hpmcycle_val = s->hpmcycle_val + (get_cycles() - s->hpmcycle_prev);
+        timer_del(s->hpm_timer);
+    }
+}
diff --git a/hw/riscv/riscv-iommu-hpm.h b/hw/riscv/riscv-iommu-hpm.h
index cd896d3b7c..ee888650fb 100644
--- a/hw/riscv/riscv-iommu-hpm.h
+++ b/hw/riscv/riscv-iommu-hpm.h
@@ -26,5 +26,6 @@ uint64_t riscv_iommu_hpmcycle_read(RISCVIOMMUState *s);
 void riscv_iommu_hpm_incr_ctr(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
                               unsigned event_id);
 void riscv_iommu_hpm_timer_cb(void *priv);
+void riscv_iommu_process_iocntinh_cy(RISCVIOMMUState *s, bool prev_cy_inh);
 
 #endif
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 2ec388ff3d..56ec2d6d42 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -1923,6 +1923,27 @@ static void riscv_iommu_update_ipsr(RISCVIOMMUState *s, uint64_t data)
     riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_IPSR, ipsr_set, ipsr_clr);
 }
 
+static void riscv_iommu_process_hpm_writes(RISCVIOMMUState *s,
+                                           uint32_t regb,
+                                           bool prev_cy_inh)
+{
+    switch (regb) {
+    case RISCV_IOMMU_REG_IOCOUNTINH:
+        riscv_iommu_process_iocntinh_cy(s, prev_cy_inh);
+        break;
+
+    case RISCV_IOMMU_REG_IOHPMCYCLES:
+    case RISCV_IOMMU_REG_IOHPMCYCLES + 4:
+        /* not yet implemented */
+        break;
+
+    case RISCV_IOMMU_REG_IOHPMEVT_BASE ...
+        RISCV_IOMMU_REG_IOHPMEVT(RISCV_IOMMU_IOCOUNT_NUM) + 4:
+        /* not yet implemented */
+        break;
+    }
+}
+
 /*
  * Write the resulting value of 'data' for the reg specified
  * by 'reg_addr', after considering read-only/read-write/write-clear
@@ -1950,6 +1971,7 @@ static MemTxResult riscv_iommu_mmio_write(void *opaque, hwaddr addr,
     uint32_t regb = addr & ~3;
     uint32_t busy = 0;
     uint64_t val = 0;
+    bool cy_inh = false;
 
     if ((addr & (size - 1)) != 0) {
         /* Unsupported MMIO alignment or access size */
@@ -2017,6 +2039,16 @@ static MemTxResult riscv_iommu_mmio_write(void *opaque, hwaddr addr,
         busy = RISCV_IOMMU_TR_REQ_CTL_GO_BUSY;
         break;
 
+    case RISCV_IOMMU_REG_IOCOUNTINH:
+        if (addr != RISCV_IOMMU_REG_IOCOUNTINH) {
+            break;
+        }
+        /* Store previous value of CY bit. */
+        cy_inh = !!(riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTINH) &
+            RISCV_IOMMU_IOCOUNTINH_CY);
+        break;
+
+
     default:
         break;
     }
@@ -2035,6 +2067,12 @@ static MemTxResult riscv_iommu_mmio_write(void *opaque, hwaddr addr,
         stl_le_p(&s->regs_rw[regb], rw | busy);
     }
 
+    /* Process HPM writes and update any internal state if needed. */
+    if (regb >= RISCV_IOMMU_REG_IOCOUNTOVF &&
+        regb <= (RISCV_IOMMU_REG_IOHPMEVT(RISCV_IOMMU_IOCOUNT_NUM) + 4)) {
+        riscv_iommu_process_hpm_writes(s, regb, cy_inh);
+    }
+
     if (process_fn) {
         process_fn(s);
     }
-- 
2.47.1


