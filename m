Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCC1C77B7A
	for <qemu-riscv@archiver.kernel.org>; Sat, 20 May 2023 05:45:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q0FPH-0007GA-R4; Sat, 20 May 2023 01:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0FPC-0007Dt-ST
 for qemu-riscv@nongnu.org; Sat, 20 May 2023 01:45:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0FPB-0007cR-97
 for qemu-riscv@nongnu.org; Sat, 20 May 2023 01:45:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so2500833f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 19 May 2023 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684561524; x=1687153524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTAW6cK3XhyHe2DSiXzz9dWc3zDAXzPHwYcm030hYyk=;
 b=pW+WiwCo5lSt4d/R7h1EzOwqgt2veIicK34eOeQmtyBV/1P7xSikI7OYscaUpCoHlO
 8UPHOQcdYfgJcRwDMxr+E8obGdG8RrJ3PiT8z4DR43Mu4FTKUvoiwkrQMIXy2pRtQ8iH
 B14/qJK4CH7ZbogzWfqK+s6+LSe0Y6okbyKt5h2fGNq2+2ESGiW9Vi2uqK8snox/x3vD
 yZeiOdXw22QXPH4tqE9iF7p5R718nxExJ7QNwvYkF0MThY7ro6xgQkywlgb/XccZTGbi
 YdZoBOvH2WdGqmZ5G3U27LDGvReQc5mOid5NzZBFpf5Li50x08c0vMgpAB79GzZm7RF/
 FANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684561524; x=1687153524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTAW6cK3XhyHe2DSiXzz9dWc3zDAXzPHwYcm030hYyk=;
 b=TsmrjDQg85DmGT4VYpscaj5CkgLnNXzlKV0fB7A7jSY+SODm8c/VRaSCmqCFuu9sdA
 k+TapNQKwW2Xf/qyBDPDNYsfNyBvYOqRvhOhzey8BVz812zodkhDJg/iJ5KDJFpv4i8C
 VxnTWq2JCx0zap+vE5e+e96EXjdeB1SOofcUWYebOOoG9XY+NeQhGfqIjKLdCnQoK466
 FLEl8dYTpygpJRYndWAnoXYZbC7nSTTFMnG2SyjsJQsABUibfTozvA5uNdnzct9Y7PTq
 ejbHV3GRSRFGwkDQfSp1UKvzv7SFLEFaGnV2dtuUO2PZkjEzoTFe8k+p6mLKsyVRTGHz
 Y95Q==
X-Gm-Message-State: AC+VfDz05nXrHsCf6CbubyKeHKDEnpbkF35CbWptlGot406TQryuI1se
 iu7MxsQH/WMFeYcjzarMBHXJjbXP4aYgG26AeZk=
X-Google-Smtp-Source: ACHHUZ4FC3MChAhppSmAQjd0r86vrx342dJt6bw0lmbKUiXRki7lTY3HDSZKRDvlIFvx9fusHmNKUQ==
X-Received: by 2002:adf:ee91:0:b0:309:509f:a7f0 with SMTP id
 b17-20020adfee91000000b00309509fa7f0mr3056463wro.44.1684561523946; 
 Fri, 19 May 2023 22:45:23 -0700 (PDT)
Received: from localhost.localdomain
 (mau49-h01-176-184-41-228.dsl.sta.abo.bbox.fr. [176.184.41.228])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a5d640c000000b00307c8d6b4a0sm905259wru.26.2023.05.19.22.45.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 May 2023 22:45:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] hw/riscv/opentitan: Declare QOM types using
 DEFINE_TYPES() macro
Date: Sat, 20 May 2023 07:45:07 +0200
Message-Id: <20230520054510.68822-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230520054510.68822-1-philmd@linaro.org>
References: <20230520054510.68822-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. Replace
the type_init() / type_register_static() combination. This
is in preparation of adding the OpenTitan machine type to
this array in a pair of commits.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/opentitan.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 2d21ee39c5..294955eeea 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -320,17 +320,14 @@ static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
 }
 
-static const TypeInfo lowrisc_ibex_soc_type_info = {
-    .name = TYPE_RISCV_IBEX_SOC,
-    .parent = TYPE_DEVICE,
-    .instance_size = sizeof(LowRISCIbexSoCState),
-    .instance_init = lowrisc_ibex_soc_init,
-    .class_init = lowrisc_ibex_soc_class_init,
+static const TypeInfo open_titan_types[] = {
+    {
+        .name           = TYPE_RISCV_IBEX_SOC,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(LowRISCIbexSoCState),
+        .instance_init  = lowrisc_ibex_soc_init,
+        .class_init     = lowrisc_ibex_soc_class_init,
+    }
 };
 
-static void lowrisc_ibex_soc_register_types(void)
-{
-    type_register_static(&lowrisc_ibex_soc_type_info);
-}
-
-type_init(lowrisc_ibex_soc_register_types)
+DEFINE_TYPES(open_titan_types)
-- 
2.38.1


