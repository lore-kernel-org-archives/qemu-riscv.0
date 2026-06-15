Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876A8CD98DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 13:20:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZ7EK-0002E9-39; Mon, 15 Jun 2026 09:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wZ7EH-000269-QP
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 09:19:53 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wZ7EG-0003Ra-6p
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 09:19:53 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c86307c4e6bso1110995a12.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1781529591; x=1782134391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CxuHpoyLbCuBBV1xvqG7iCJBo9LTacVKLFQHWxZw77A=;
 b=gJ5UhWdU/cUKxrFf11yIY8pYK9+haJVJfNYV99aF1++bt/UM9eIpqXAzOUoGPZYSK8
 JxCO0BBG7NYDcn/6pawfSFEm9dFyg/Lj1qZmgYqvBPyox65aE+f8a4lmQ1Wsog7Joc3b
 h7E2imunsdCfQonC0L0TpCVZhK1U0y9PGF6moTcvpfsIlthVSB2MPSwrq+Ti5RzFnc42
 eJhGrB+nHU3N1pCAo/cGmkIS9qx6T5w7PhbWBu42SyJG2UckcqcTJNDjRiA1fhQexxZn
 FJ0xfjITYdhFznGeoYDjgtlA+aI/fHuIbqJYXGA5SqLiHR7ZaE3VLDXi7i4jhkFFod5g
 Czug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781529591; x=1782134391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CxuHpoyLbCuBBV1xvqG7iCJBo9LTacVKLFQHWxZw77A=;
 b=hf26ZiNlVSFMS+CeC1j453//2cmYm6Zec3NX8qsZVyYUAxhJK0rW7HAQoDofe1eq47
 5CZzN6gglBBdsLt27EDJWIzCaHgSYRW5Hwdt1sJQZ3KmraNfoSx2kDb/wO7erMTQokk7
 FLlkn4NXdz1Z1oDGI1ZBARGqPO/LwbMgMutKKGQWe8OXDZc1bfs7dgBxuSZKXqmx/8Sx
 1BE59zi3UJ6V6LHZHG3aRLOBTmgbqP5ZLQ397UwYUeO/MCqfZGHaT3KcFlyfQvNM8DIM
 T6QjD4deXglv3r3P5i+A5A7nQ5isiRpoAoWSawFR6+KRPPoCDAgTKyF4IbknztnCfRIQ
 SetQ==
X-Gm-Message-State: AOJu0Yxm5z675uA/GtihIXNU0SOp0qK6K7p+sI2+qhG47RyAWS6AeMsI
 tcdCLtkOlP0Ex8lKEPYuB45eNC/fWtKPfHeVsB+IQ6yyCC/WLLa5vu/DZkdgxqhjSQ9biZCTQHs
 dzXiG
X-Gm-Gg: Acq92OGzEagjMJc+Z0rW6rvBe1EjukjaQarkWbSjbm4Z/LCyxS1s1B6wA7c5aIbXEFY
 xYNpitwFB1xInzZa0M080b8SCu8f6aEnDRZdFGctdhg229RT4oahvh/H1AydIwdxwiusB6x/XRB
 0SfPJ7xDFAGSnqEB+J9564nbJ8VisVMtjG3V7AaoL17U7exVA5m5zG1hKq6r41PKo14c3kF10gg
 xs6MTnOBD/OVHEXXqKr4SKmEElC1VaKb2LV6AztKOOo1TsOMKSDjnQj+MfhZ8MW+4nQW2S5hCHH
 euMxASh0T83rwcF1Nvf5krJGOeRuGpxfPXz9o65wSWGWk7eMgJuXzKGWH3gSTd7yEuMz3avfMr4
 PuLzf4YGq4Lr3S+EIIOsro4wBl+UXGOB/iWk0mL4gOkVqCofi86UfXTR/Lir7k3Ph+PSjWEdixB
 K+lv/5Vdc18dgWJfiN7KiMvu7j7WGWdZVf/+2C4znueg==
X-Received: by 2002:a17:902:e807:b0:2b2:ec46:dfed with SMTP id
 d9443c01a7336-2c4126540abmr152933175ad.31.1781529590711; 
 Mon, 15 Jun 2026 06:19:50 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c432c8ca31sm101483565ad.55.2026.06.15.06.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 06:19:50 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 jim.shu@sifive.com, nutty.liu@hotmail.com,
 Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v2 1/2] hw/intc: riscv_aplic: Skip reset for KVM irqchip
Date: Mon, 15 Jun 2026 21:19:24 +0800
Message-Id: <20260615131925.3019370-2-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260615131925.3019370-1-qingwei.hu@bytedance.com>
References: <20260615131925.3019370-1-qingwei.hu@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=qingwei.hu@bytedance.com; helo=mail-pg1-x532.google.com
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

The emulated APLIC state arrays are only allocated when QEMU handles
the interrupt controller state itself. With KVM AIA/APLIC-IMSIC, the
interrupt controller state is owned by the KVM in-kernel irqchip, so
these emulated state arrays are not allocated.

The APLIC reset handler still clears those arrays unconditionally. This
makes qemu_system_reset(), which runs during machine creation,
dereference NULL pointers with -machine virt,aia=aplic-imsic and KVM.

Skip the emulated APLIC reset path when the interrupt controller is
handled by KVM. The emulated path is unchanged for TCG and for
configurations that use QEMU emulation.

Fixes: 99bfcd329a ("hw/intc: riscv_aplic: Add reset API to APLIC")
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 hw/intc/riscv_aplic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index c2c67c29e6..84606e9f3d 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -910,6 +910,10 @@ static void riscv_aplic_reset_enter(Object *obj, ResetType type)
     RISCVAPLICState *aplic = RISCV_APLIC(obj);
     int i;
 
+    if (!riscv_use_emulated_aplic(aplic->msimode)) {
+        return;
+    }
+
     aplic->domaincfg = 0;
     memset(aplic->sourcecfg, 0, sizeof(uint32_t) * aplic->num_irqs);
     memset(aplic->target, 0, sizeof(uint32_t) * aplic->num_irqs);
-- 
2.47.3


