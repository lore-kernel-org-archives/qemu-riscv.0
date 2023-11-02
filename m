Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88C5C4167D
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:37:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLfa-0003GQ-3b; Wed, 01 Nov 2023 20:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLfX-00035B-Vo; Wed, 01 Nov 2023 20:34:44 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLfW-00041X-6N; Wed, 01 Nov 2023 20:34:43 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1dcfb2a3282so249273fac.2; 
 Wed, 01 Nov 2023 17:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698885279; x=1699490079; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XnpCoeX2w3H0zqVhsrfEmzmt75LUmW929Mj+moNRHDQ=;
 b=SaiiSqumt2ybpAlWTZMixihvgbLUHAD30BpCs4Q0bvYlPxDe2oHUxTbKgT5lhaMIwO
 M1YJ8xn8mZZb1/JRBlI7QEX8CfMamLiDNNbAl9sJAp7Eep5bqbxxvR0P9EsZvEfhwq9K
 ci42VECUvGGBOes7FScXujoxWBMoWqalG+6thLYd7ZlEVdgDeqpZ4RkqJ+VFauZ3YmkY
 cRqD+Qit7xOJwMO+RJJdOeYNnp+SMZsdOBrFJ/oNNfJ+aVNasvMBxvOgsjlDw+tZlbTE
 nXbfb+2+1pQkYZ27OM5EgUjxmeKVYFRMidcIbbtbmd+cIIl9/D7pFi5jCn0ywLDT6ACT
 WLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698885279; x=1699490079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XnpCoeX2w3H0zqVhsrfEmzmt75LUmW929Mj+moNRHDQ=;
 b=wuMZp8sau852wK0MhhiECXhGVDtDHtgNNqQazK9ksvbrHrKesO1iOhV1BUJVRMTc9o
 G9rN7i4KzOuBWa9FeY3QyRBoY2OjkqdxiVGFPp35G393/9+slX3EQRzyeGOtRASsZqH0
 qb43sMviVQ6I8Y8c8lfb518r45TSC1yiFt1pOcMHXunbN/FIZHOuH17ixUv4U47GBlg2
 gNS8/A3Ob8HaKeXAoM3RrhAvmzzCu0TWhVfXh65ZoQWo+E6JHnTvqvCt7TobgmPBlX1a
 kXjjvlwpDA1LGX/VhbSveJB3yjuxLHrT+QwJrqVEdImbfqWOH/cYcubGFFBAfQzxFoVz
 cXXA==
X-Gm-Message-State: AOJu0YxBB/kyTi4/sRWl4mkAfM5nUgQuRSGuq03bjyc8f6no/HR2UyXJ
 q3LJQg0PwjRolI1wpOWqNGxCH/yFX7QZgA==
X-Google-Smtp-Source: AGHT+IEpMDBqqA4JS+VwsSz0ihpOSbpzthqFwdCcFmS4SjjMLOsrqSGYd3ngNHpscYOT/lXepEUWDw==
X-Received: by 2002:a05:6871:2b04:b0:1e9:5480:1df8 with SMTP id
 dr4-20020a0568712b0400b001e954801df8mr21971947oac.51.1698885279432; 
 Wed, 01 Nov 2023 17:34:39 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a633dc4000000b0057c29fec795sm411783pga.37.2023.11.01.17.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 17:34:38 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, bmeng.cn@gmail.com
Subject: [PATCH 1/2] hw/ssi: ibex_spi_host: Clear the interrupt even if
 disabled
Date: Thu,  2 Nov 2023 10:34:23 +1000
Message-ID: <20231102003424.2003428-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102003424.2003428-1-alistair.francis@wdc.com>
References: <20231102003424.2003428-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

We currently don't clear the interrupts if they are disabled. This means
that if an interrupt occurs and the guest disables interrupts the QEMU
IRQ will remain high.

This doesn't immediately affect guests, but if the
guest re-enables interrupts it's possible that we will miss an
interrupt as it always remains set.

Let's update the logic to always call qemu_set_irq() even if the
interrupts are disabled to ensure we set the level low. The level will
never be high unless interrupts are enabled, so we won't generate
interrupts when we shouldn't.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 1ee7d88c22..c300ec294d 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -205,9 +205,10 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
         if (err_irq) {
             s->regs[IBEX_SPI_HOST_INTR_STATE] |= R_INTR_STATE_ERROR_MASK;
         }
-        qemu_set_irq(s->host_err, err_irq);
     }
 
+    qemu_set_irq(s->host_err, err_irq);
+
     /* Event IRQ Enabled and Event IRQ Cleared */
     if (event_en && !status_pending) {
         if (FIELD_EX32(intr_test_reg, INTR_STATE,  SPI_EVENT)) {
@@ -229,8 +230,9 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
         if (event_irq) {
             s->regs[IBEX_SPI_HOST_INTR_STATE] |= R_INTR_STATE_SPI_EVENT_MASK;
         }
-        qemu_set_irq(s->event, event_irq);
     }
+
+    qemu_set_irq(s->event, event_irq);
 }
 
 static void ibex_spi_host_transfer(IbexSPIHostState *s)
-- 
2.41.0


