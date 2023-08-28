Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE12C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 22:15:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qakUw-0006N9-JI; Mon, 28 Aug 2023 18:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUv-0006Kg-Fi
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUs-0004Gm-UH
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fef56f7222so36066785e9.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 15:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260849; x=1693865649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSeyYv9fGrIvCDH06h643mqOjyw7AdOjJCHmBe/MXEk=;
 b=HvpjAnYRFHzC3gtkDTwozxlhG1ak3ReMatVzT8Pe0f/2/gI/eOPL8drNj6EvvQXkzT
 PnxkW24IbXCXfBdCjXBsnft67rjOkTE5pbQOjeWS3ZOswjwjIrSnXtasLA8XdguJiCn5
 LKpGf4rCE2MbWRyegi0TsE19qhrEV64Wt6M/gGbaL61fb402qJJfIqFZ3bb8fIH97kaj
 MZ1kFgogBOV2m5GILZi7f9xJSbCB5RTmXduGjLKF24PZrwUIwvVTTbDT9fwXZN6VbEIM
 AKDFZGWliSdjHbqATogc/XWNy7TqDjB+aiUqjUytuQ0tPKujK5W6Ucjz/V5R4OzPOPPG
 9yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260849; x=1693865649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSeyYv9fGrIvCDH06h643mqOjyw7AdOjJCHmBe/MXEk=;
 b=aPHiiNbSVhrDzzkB1kqDQXHiiQI466DBEAbEBT7A1Ve+rSX7nn8hQnCmc2ef/7bYX0
 QXWy6x+DBljof/FPSgMdIBzXO9SaCaDfItRUM/zvBZCjPAZ/6bkRysb9Yk8KMJk/mugI
 u1/dcp6+O/fb2gwaGe5TqteL0EG3hbv41Wafz/+KeLR4KnE6Be/eH7fbkeASwwWNM0jH
 iI+OxVyvvAGFpumaIdgUs3exjoPrhq3A10NGJv+fxAu2ghcoOUYJkTt9n68kKAH0Hh3g
 oTNWvlRya2Asl4dG/JZvkcztCUgtUyG7Oli/XrPtLOPRv3e0KuakISBOTwEDum77+Bq9
 anGA==
X-Gm-Message-State: AOJu0YxhiIGdSaeh/phiJ0n/mcJff9RTBbnk21QbfboXTbTyC2TXm6yV
 IhHTitMWI4XjD+brPK+6wNz2xQ==
X-Google-Smtp-Source: AGHT+IG0aQKYb6DlbV2N24HjFxpA9NrADQwJU8AU1W1d0IIL2g5Eza/hYPPIaBvlWNUffe1U7ZTSpQ==
X-Received: by 2002:a1c:7407:0:b0:401:c338:ab96 with SMTP id
 p7-20020a1c7407000000b00401c338ab96mr4610157wmc.34.1693260849479; 
 Mon, 28 Aug 2023 15:14:09 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a1c7c07000000b003ffca80edb8sm12058270wmc.15.2023.08.28.15.14.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:14:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/11] target/mips: Remove unused headers in lcsr_helper.c
Date: Tue, 29 Aug 2023 00:13:11 +0200
Message-ID: <20230828221314.18435-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

This files only access the address_space_ld/st API, declared
in "exec/cpu-all.h", already included by "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


