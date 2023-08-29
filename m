Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F5DC6FA8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 12:22:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaxjS-00088n-S1; Tue, 29 Aug 2023 08:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qaxjO-00087l-D2
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 08:22:03 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qaxjI-0001M2-2c
 for qemu-riscv@nongnu.org; Tue, 29 Aug 2023 08:22:01 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1c504386370so2947236fac.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Aug 2023 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693311714; x=1693916514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Vxlb2B+ITtVd9TDdOjjXHyYKGUxZtS9Vvd0RcKz1Eo=;
 b=OCFmhYz19IT1pxyHYKGBt5/Cm8fI3Zf5ccK9jcK2JxenQ5DszOL2G+J9hzxzNlGUVu
 QCMupoqqv4hXUQLbOvUBHD8rWqnbx+Gs48YSGlBLe+R2l6+htohHe6fDr0q0/ctJIDWe
 FXiUzeZf7gYnUp9UzgQ+tyPevlqmfYqLxjtH9rA08Uuxjbv+pAaKYdRPeCBgg75dL17N
 UNEvDGAAARgvVrO4ywS1XIUjbMNHHnRO5SgoK0lpRNjoQkuQTW0Q7VjfK1KlaZ+2qCc8
 61E4ubmGYsaGi6qkf6hNU4G+b3j9iSMs0BTFZT+4PD9ish60qfLlfWQdnplATj/iRgTo
 /rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693311714; x=1693916514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Vxlb2B+ITtVd9TDdOjjXHyYKGUxZtS9Vvd0RcKz1Eo=;
 b=X3b2YViVB5+DoH4GH9ZAQyASKp/skVlqwo9natzI9oh62g531Z567bvqGL38WWUc5J
 IZqdZ27IRPwl4XFaGZ4xVMCfUbtDI05uLGDogtHmRzvC8QF3xxPIyIokLplQM+MybHML
 GRzvnEMY//1Vzxnx0tKiT6egjBfO2J7QZ5J8KIR00K2C04ubCEe5Mbq+NswuqaVzxDQA
 TXCYUElGwTEM8M03YBeFzFHxaG2SKXeLo4EGRnkLlDUtOcL6+LJy7t+LB1CbQ3ZzC9AQ
 71IR+AeEcqARUd2R94Ktdw6M8S41jz/aSygDY8cryw4ajhQk2KW63Da5ItExGohsa7tf
 vUZQ==
X-Gm-Message-State: AOJu0YyY8HwXOI4KuUFdu2d18acLg3urpVV1RwBk8FzgBQ8mkQLMTNR0
 yYBUz328xg37YiRaLxG7OGqF+Q==
X-Google-Smtp-Source: AGHT+IF+PV0EXDvel6CKhiMmEYj/WBSJL8cvlPsY3fdojHaMke4J5QyflL/LudqxkJ8j4AYhj+L+jw==
X-Received: by 2002:a05:6870:210:b0:1c8:cf1b:feee with SMTP id
 j16-20020a056870021000b001c8cf1bfeeemr15960231oad.13.1693311714396; 
 Tue, 29 Aug 2023 05:21:54 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a4a97c7000000b00573320e1241sm5079327ooi.14.2023.08.29.05.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 05:21:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/2] hw/intc/riscv_aplic.c fix non-KVM --enable-debug build
Date: Tue, 29 Aug 2023 09:21:43 -0300
Message-ID: <20230829122144.464489-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829122144.464489-1-dbarboza@ventanamicro.com>
References: <20230829122144.464489-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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

Commit 6df0b37e2ab breaks a --enable-debug build in a non-KVM
environment with the following error:

/usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_intc_riscv_aplic.c.o: in function `riscv_kvm_aplic_request':
./qemu/build/../hw/intc/riscv_aplic.c:486: undefined reference to `kvm_set_irq'
collect2: error: ld returned 1 exit status

This happens because the debug build will poke into the
'if (is_kvm_aia(aplic->msimode))' block and fail to find a reference to
the KVM only function riscv_kvm_aplic_request().

Make riscv_kvm_aplic_request() a no-op if we're not building KVM.

Fixes: 6df0b37e2ab ("target/riscv: update APLIC and IMSIC to support KVM AIA")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/intc/riscv_aplic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index 592c3ce768..b634738bda 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -483,7 +483,9 @@ static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
 
 static void riscv_kvm_aplic_request(void *opaque, int irq, int level)
 {
+#ifdef CONFIG_KVM
     kvm_set_irq(kvm_state, irq, !!level);
+#endif
 }
 
 static void riscv_aplic_request(void *opaque, int irq, int level)
-- 
2.41.0


