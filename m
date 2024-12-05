Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11348E7716D
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 13:32:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJBy6-0001zd-17; Thu, 05 Dec 2024 08:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwL-0001Ck-4j
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:45 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwD-0005IK-B8
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:41 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-725a84ff55dso402316b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 05:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733405432; x=1734010232; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTXa46qgl0bT9Oh34ETAIQH/PNeVQZ1IudEGxeU9iLM=;
 b=dZaErTxw4E0A2rweKpu6/pAb5wIn01D5NeC+XMLshWDouoTLMKf01jtc901TQWVG1M
 YLvs3abyXK3S7f2V7FhT27xR/BoZChS0qV0YMx2CvBErhIywB3uPErKZsW8b+iQIgtpN
 +zxOVAJfsSWLDI74voXNq0NUoFJ0v0uVud9bBAR9piajqwVpBJuYkaO9gGWQe2jAW9/D
 Q23y7HWDRSGnU3df0J//HUTb8IXoQtCby7CLfWNUxvJHV2HNwfxzzyQGi15i8PohgRf+
 JFJLs5TTYY44sltEjav41Lgg7YVtnUSxyYVJJ8AP+dk8adOh/7VVVeERqYwodC4kXU3j
 Dreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733405432; x=1734010232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTXa46qgl0bT9Oh34ETAIQH/PNeVQZ1IudEGxeU9iLM=;
 b=X//G6Otg3Ln1ZPnsmp+m74ChTN/yzEgJMOt7V4Mq7tEAuMNMjE3UGNXK6SGTdPxQgB
 1Bbfan0G6TveWCUYLvrma8flEvbFiuoHUSm82TBlZA3GJFvqFwFMrVWhnno6T825gRVT
 5+rxBK5Ee2xjxMumprT/qZJ5WH6RMeDToGAkIbWX7WKYcXa/SFTTKUkG87SzULHiHv0C
 y2Fn+s/I6HcXna8mPNSJRUixrYL1TnvHLZXBjQ2cV3somdqH/RV/TpE8Jse/C7V7ikPG
 OiTdjdS4IrGywreGHIcZREGtSwe8zfBhNypWo0yy6giXjVgGw4b0G57Yw7DLt5+5xk8n
 emUw==
X-Gm-Message-State: AOJu0Yy/+ZVbC2pWRrPlKxS4g3Ua77OaQ/tHjvxp1QEA4TNu/YZQ49Ow
 z7LIV0bp6I6VqLlp7Ep6KRMIsJy7s+OvXWsl6TB2QwQNXTCksSV+siuCnnHbJnYyo/U70ZgEsPh
 e
X-Gm-Gg: ASbGnctGUFY1oLhamNDznGT7lu50D+/5BYbBhBRNB/c5ZcBUtF5allPA63CfHQthPOk
 34q0nWcCPH0LkYkfTbc25jGTsn4iyNASlXdGN2sE7CoptzZIwxLQ25UB+bvaUhi6eEidS1RsJVp
 NxLH6sb/VYTU3TuTmQoRztoIMmWjeHTZ0ZsEOWMKBf7HTvG+CkswM/WSt7ZVBF+zpOj2/OfxQtO
 2x66t0Ut5Uk1Um+usOs2PgW+5NYmf519zThmsYw+9pmpjOSloi35ASjfyvqHNFo+KFFncS/xJSs
X-Google-Smtp-Source: AGHT+IFWRGB7k52H24z+rYgPM8bHYZalAXjAABJ6G2xZoZEXIpUXGCeKP84vEzrVQuw5J3hpAzT07A==
X-Received: by 2002:a05:6a00:3d53:b0:71e:7a56:3eaf with SMTP id
 d2e1a72fcca58-7257fcdae57mr15024815b3a.24.1733405431686; 
 Thu, 05 Dec 2024 05:30:31 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a2a8f512sm1250315b3a.126.2024.12.05.05.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 05:30:31 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Tomasz Jeznach <tjeznach@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 07/11] hw/riscv/riscv-iommu: add IOHPMCYCLES mmio
 write
Date: Thu,  5 Dec 2024 10:29:59 -0300
Message-ID: <20241205133003.184581-8-dbarboza@ventanamicro.com>
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

RISCV_IOMMU_REG_IOHPMCYCLES writes are done by
riscv_iommu_process_hpmcycle_write(), called by the mmio write callback
via riscv_iommu_process_hpm_writes().

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/riscv-iommu-hpm.c | 19 +++++++++++++++++++
 hw/riscv/riscv-iommu-hpm.h |  1 +
 hw/riscv/riscv-iommu.c     |  2 +-
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/riscv-iommu-hpm.c b/hw/riscv/riscv-iommu-hpm.c
index 70814b942d..1cea6b1df1 100644
--- a/hw/riscv/riscv-iommu-hpm.c
+++ b/hw/riscv/riscv-iommu-hpm.c
@@ -262,3 +262,22 @@ void riscv_iommu_process_iocntinh_cy(RISCVIOMMUState *s, bool prev_cy_inh)
         timer_del(s->hpm_timer);
     }
 }
+
+void riscv_iommu_process_hpmcycle_write(RISCVIOMMUState *s)
+{
+    const uint64_t val = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_IOHPMCYCLES);
+    const uint32_t ovf = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_IOCOUNTOVF);
+
+    /*
+     * Clear OF bit in IOCNTOVF if it's being cleared in IOHPMCYCLES register.
+     */
+    if (get_field(ovf, RISCV_IOMMU_IOCOUNTOVF_CY) &&
+        !get_field(val, RISCV_IOMMU_IOHPMCYCLES_OVF)) {
+        riscv_iommu_reg_mod32(s, RISCV_IOMMU_REG_IOCOUNTOVF, 0,
+            RISCV_IOMMU_IOCOUNTOVF_CY);
+    }
+
+    s->hpmcycle_val = val & ~RISCV_IOMMU_IOHPMCYCLES_OVF;
+    s->hpmcycle_prev = get_cycles();
+    hpm_setup_timer(s, s->hpmcycle_val);
+}
diff --git a/hw/riscv/riscv-iommu-hpm.h b/hw/riscv/riscv-iommu-hpm.h
index ee888650fb..0cd550975d 100644
--- a/hw/riscv/riscv-iommu-hpm.h
+++ b/hw/riscv/riscv-iommu-hpm.h
@@ -27,5 +27,6 @@ void riscv_iommu_hpm_incr_ctr(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
                               unsigned event_id);
 void riscv_iommu_hpm_timer_cb(void *priv);
 void riscv_iommu_process_iocntinh_cy(RISCVIOMMUState *s, bool prev_cy_inh);
+void riscv_iommu_process_hpmcycle_write(RISCVIOMMUState *s);
 
 #endif
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 56ec2d6d42..3bdd88df4a 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -1934,7 +1934,7 @@ static void riscv_iommu_process_hpm_writes(RISCVIOMMUState *s,
 
     case RISCV_IOMMU_REG_IOHPMCYCLES:
     case RISCV_IOMMU_REG_IOHPMCYCLES + 4:
-        /* not yet implemented */
+        riscv_iommu_process_hpmcycle_write(s);
         break;
 
     case RISCV_IOMMU_REG_IOHPMEVT_BASE ...
-- 
2.47.1


