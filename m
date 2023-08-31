Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A23C83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:13:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhHw-0007fu-Nl; Thu, 31 Aug 2023 09:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFf-0003IH-Cs
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFa-0005Y8-RG
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:22 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40037db2fe7so7717465e9.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486697; x=1694091497; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjQL80nyATLPTIBkc5alImMKX6tkMfdHx2YY+WxS1L0=;
 b=cebTV8R04yWBkOGOfo2qgQ7yYxe+zWEnQr7thKkWwHrwn3g1WqKt0ojULVdAaKH6bE
 Cx6e7x5lKH4oDvOXoyaeRJZghPnIC/pUgtIUAQTottoEcZ9SHcoJ/9Pl2tV4E8xgpNVx
 u/mCdlEENYi4p9n/3No7PD0Fhss929ohANuSDAUwxp0ntOovVV9/pLiLIvy9DTkBK9mz
 pwbun1M3VN/knZX3mP6D/D8N8ksCHzJFXrgYwAkP1buNlP/ZIBdxFB81Kymd3JeL0sC0
 Od9QWq4mjXeQM8w+ZeGGehaYdkzmRP7zNq4FYzvBs0J1rtqZe0b8F9Bhi8PxcdKfS9ur
 PmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486697; x=1694091497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjQL80nyATLPTIBkc5alImMKX6tkMfdHx2YY+WxS1L0=;
 b=Vk8cCOq21gqLGyh6fVpsAHwTIguzt0KBLcByqMJiHvrPRj6QrnFTe1Th9aAINj4tuM
 DQFb+FEcv1WcajXSuzX4YaMzv+9bXHE8SvbpDEBVQ02YDqVRReEhYcQa1uDbNU2a/NuN
 BHepqI3+NFJg3M0rXdwf2waGagoY62IfAgCa4dNI/0Nf/RtePT46YQLAHVAn7FQktrZu
 Gy6oaDQp4ivVJtUFkeaL70KCykoj/HtRCt5Fa8hPTpLl+a+CuuQqzAmp/8Q2R4/WTH4h
 HlAa7ptp9MdqagYUPH2oDbAYd7HvloZOjqka5aNaRokCjpCr7ssKAcFjJp8Y7+dZYcs5
 3qgQ==
X-Gm-Message-State: AOJu0YwUhj85RQDAHtZmAPJybUNTTWzZeVJhetxaGb2t8j0ipWl/psU3
 clHMVvCQDQE+jD0lri2ryuZ3tA==
X-Google-Smtp-Source: AGHT+IGDt41UxEn9c3ecD4WyJfRebsBx3qQ1+KKTlnWuxBXYiMkytgEdjysEdXbLYVa1XuXFAPEDVg==
X-Received: by 2002:a5d:574a:0:b0:317:3dff:7189 with SMTP id
 q10-20020a5d574a000000b003173dff7189mr4116020wrw.66.1693486697342; 
 Thu, 31 Aug 2023 05:58:17 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b003143867d2ebsm2184094wrm.63.2023.08.31.05.58.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 15/41] target/mips: Remove unused headers in lcsr_helper.c
Date: Thu, 31 Aug 2023 14:56:17 +0200
Message-ID: <20230831125646.67855-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

This files only access the address_space_ld/st API, declared
in "exec/cpu-all.h", already included by "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-9-philmd@linaro.org>
---
 target/mips/tcg/sysemu/lcsr_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/mips/tcg/sysemu/lcsr_helper.c b/target/mips/tcg/sysemu/lcsr_helper.c
index fb57bcbb78..25e03572fe 100644
--- a/target/mips/tcg/sysemu/lcsr_helper.c
+++ b/target/mips/tcg/sysemu/lcsr_helper.c
@@ -8,10 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
-#include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
-- 
2.41.0


