Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2550E7716C
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 13:34:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJByU-0002oE-4e; Thu, 05 Dec 2024 08:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwN-0001F5-MM
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:49 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwH-0005ad-L7
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:44 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-7fc8f0598cdso1623075a12.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 05:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733405438; x=1734010238; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3EeZpgq6R4MqoVKGrcajTFkb8K2YP44seXY0vVc1+eQ=;
 b=Rs3qiV+CvqZyHgUFVD1uvrOTjb7ar81De6ZJE5GyvI+Lwx3StHGZkfuOLbYncbMAhi
 6kQAq8Rl59xrDibz5Um01iiY80OaIj9b3kb2tirpdhCnEfHM7FkvUJNy+drBIkkbmvtJ
 3XSN5OvmuEgMVv23y6arr5c/PX250sBQO/4d0owl+KAIv9bDDh6V3LeezMCkV/NaqGkN
 D/p0qslWzEmDGM1xR0GjKJXVAuWbobVSjoj1cokktmr62Vjq2FSmj1KgaCkZluzHe7tt
 UVKn4feoIRkPkEktV5FhZnIahMGI6XZvg419kDCbISq1Q++BpbrxpoQLAz2xlQ55MZ4t
 7RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733405438; x=1734010238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EeZpgq6R4MqoVKGrcajTFkb8K2YP44seXY0vVc1+eQ=;
 b=Jj8SZWPnvUV74MAl5qUAa+5KJHDdovb+JM2i2D7umeaKGI2eIC/x6dv3r6PHuAQTv6
 vAZ6eFOvdSuir0EB53NFhjAvdd3JqstRG8FwLfW9RyFfCRQ6A9IzbgyugaoSVj2X4ZjO
 6+P/isHbsFRikGqJ0n+3XmhRXCaZGDENh+Nf3IJVPibrf9N+yT1OdPa3WlVUuoVa9NTW
 ep2k/jR0C7mgVb5sLVJTKU8m4yWcFDOXblQhE+wJvZJnY0rGW9JwmGNHZEbta3WQOiGA
 krEOoiM1Y+Mgb/irBBQ8MTH+mDIlLSJUOMQF5MqLmhv+bvhqZqM2utZSmYo1ONlmKKTz
 L2Ug==
X-Gm-Message-State: AOJu0YzCvqQSbxwrjRXJXKYbNsMYexHYE4DJIgHLKzxozbFl3q0nX5jH
 j1l8k9WWzSt1RdPE0tqS9FuwmOiq7Q8yrzjkuJuaKc8fSj5KFr/tOUzMq3Pl2Ro=
X-Gm-Gg: ASbGncsCGCQGrF/r5rji5ZzZjvVCOQsFP21AlsJ4IDdkHEBH2kMLUS13TCirCGnXIfY
 mJJV3VoWe2eDKxBeILslzTibPYifokUgwizf+tAwnIqkjNvfycZo/TrdJwVXiBh7KygHGTBzMpw
 dKguhDkjANFt+MTFZVm2UvbIZvhFtllrxfQptSUSUGmarLms1hBJDRZNk87bs7v+CqQy2Rf2JTw
 ImrL2rpe6d1LlusCYW3YKOO+d2pJ9ClzcCldxNrVEqHgGU2Za401oCuHQmRDWswBCHuf/pL9Mtt
X-Google-Smtp-Source: AGHT+IHE6Nm9wbd1k7xrISdaThmK9d8ABGqfk5GnYTxMkxgAys2+4XpupZb9un3Z1nOaS90n6xPczg==
X-Received: by 2002:a05:6a20:2590:b0:1d9:761:8ad8 with SMTP id
 adf61e73a8af0-1e17d3f3806mr5575242637.21.1733405437730; 
 Thu, 05 Dec 2024 05:30:37 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a2a8f512sm1250315b3a.126.2024.12.05.05.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 05:30:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Tomasz Jeznach <tjeznach@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 09/11] hw/riscv/riscv-iommu.c: add
 RISCV_IOMMU_CAP_HPM cap
Date: Thu,  5 Dec 2024 10:30:01 -0300
Message-ID: <20241205133003.184581-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241205133003.184581-1-dbarboza@ventanamicro.com>
References: <20241205133003.184581-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x531.google.com
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

Now that we have every piece in place we can advertise CAP_HTM to
software, allowing any HPM aware driver to make use of the counters.

HPM is enabled/disabled via the 'hpm-counters' attribute. Default value
is 31, max value is also 31. Setting it to zero will disable HPM
support.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/riscv-iommu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 83cd529844..7df40900b0 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2256,6 +2256,15 @@ static void riscv_iommu_realize(DeviceState *dev, Error **errp)
                   RISCV_IOMMU_CAP_SV48X4 | RISCV_IOMMU_CAP_SV57X4;
     }
 
+    if (s->hpm_cntrs > 0) {
+        /* Clip number of HPM counters to maximum supported (31). */
+        if (s->hpm_cntrs > RISCV_IOMMU_IOCOUNT_NUM) {
+            s->hpm_cntrs = RISCV_IOMMU_IOCOUNT_NUM;
+        }
+        /* Enable hardware performance monitor interface */
+        s->cap |= RISCV_IOMMU_CAP_HPM;
+    }
+
     /* Out-of-reset translation mode: OFF (DMA disabled) BARE (passthrough) */
     s->ddtp = set_field(0, RISCV_IOMMU_DDTP_MODE, s->enable_off ?
                         RISCV_IOMMU_DDTP_MODE_OFF : RISCV_IOMMU_DDTP_MODE_BARE);
@@ -2303,6 +2312,18 @@ static void riscv_iommu_realize(DeviceState *dev, Error **errp)
             RISCV_IOMMU_TR_REQ_CTL_GO_BUSY);
     }
 
+    /* If HPM registers are enabled. */
+    if (s->cap & RISCV_IOMMU_CAP_HPM) {
+        /* +1 for cycle counter bit. */
+        stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_IOCOUNTINH],
+                 ~((2 << s->hpm_cntrs) - 1));
+        stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_IOHPMCYCLES], 0);
+        memset(&s->regs_ro[RISCV_IOMMU_REG_IOHPMCTR_BASE],
+               0x00, s->hpm_cntrs * 8);
+        memset(&s->regs_ro[RISCV_IOMMU_REG_IOHPMEVT_BASE],
+               0x00, s->hpm_cntrs * 8);
+    }
+
     /* Memory region for downstream access, if specified. */
     if (s->target_mr) {
         s->target_as = g_new0(AddressSpace, 1);
-- 
2.47.1


