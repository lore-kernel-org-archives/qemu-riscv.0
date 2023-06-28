Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04FCEB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 06:34:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEOjQ-0002eF-Fw; Wed, 28 Jun 2023 02:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOjP-0002dq-39
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:32:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOjN-0002l6-JK
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:32:46 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31297125334so537284f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 23:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687933964; x=1690525964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vqa+ZGVYzTSloicqLfBGr7JloKck/QuzhKdmQMoQ3mA=;
 b=dARUKh/CXDtLhKtLIuiR5DRrt+r07BFg451cIqaxTuEAvmbiZFpY/Tyn3m0M5kacEL
 KmS9l0Ukml2wOdjdguSmSubqw1h36EKZjg7GZohm3/8yBX5VPRXFXn08CmCbu0+Zy1U4
 PUK2X2v4r5DCbD1ncTdBkZW8O22NVqVnYmj6JnqQtcTztgPS5J48aPpQWAEmo539ieW0
 sJJBetwj0FFEl5hSb99NKm61i3agAn+dm5HaMTtRA/o/ZoILptpzX9fHtPwogNC37hPC
 igWLcQlX03bgE6XqX4ehSphxAo6//pp+4PmWcLmMlz3cML8EISRoFIi/4CeecVm3V1B0
 7IYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687933964; x=1690525964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vqa+ZGVYzTSloicqLfBGr7JloKck/QuzhKdmQMoQ3mA=;
 b=RLf1Fq9UlFgeAlBSC+C3Xj250AGxd9hI12YgwabxgHM7ZKviFdZzao60/hkxofuXHY
 8vtxjVyYtH6HWyQ0/WKMsnj77bG0Vrcs1joQQXITTqhnH+h/xediQSMP1gWMvWfCtXfn
 TERLtPp2NHWYIhp27g+lkae0unCcYKPsO0UqN0qoUq2c8eGAC6OkEqJc0m+NBYCiboGA
 NoWzU+4/evDjkD5yT8AoT1uNbUAdEufDG7ZP8d2Av4sPYHuka76SwRKY+wB8zzkxb0n0
 IxsAEg6rYsvrwa1pRUH+i6JZFKZfmtmGeCZk5bhweBXNajKaM2Lj5Mffk+9ZOEfRl+vm
 c3qQ==
X-Gm-Message-State: AC+VfDxtz/hHCLAHaBH0QUxsPLTAqg78PgSjz5jJtKgNEdRu2IEI/BDk
 6zgHx/Y/h/SNuz+rbfa59y2n6w==
X-Google-Smtp-Source: ACHHUZ7ZkPM94amWf4la8ILt61H6G4K8yTw4BRtrVPcCJF+9PDD1DgbVEZ0kvbpdWNVyj3ttRxkzQA==
X-Received: by 2002:adf:de0e:0:b0:311:3ce9:c9fa with SMTP id
 b14-20020adfde0e000000b003113ce9c9famr549065wrm.3.1687933964381; 
 Tue, 27 Jun 2023 23:32:44 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a7bc4cb000000b003fbab76165asm2172185wmk.48.2023.06.27.23.32.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Jun 2023 23:32:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/4] target/riscv: Remove unused 'instmap.h' header in
 translate.c
Date: Wed, 28 Jun 2023 08:32:31 +0200
Message-Id: <20230628063234.32544-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230628063234.32544-1-philmd@linaro.org>
References: <20230628063234.32544-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 98d54c5617..c0379af418 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,7 +30,6 @@
 #include "exec/log.h"
 #include "semihosting/semihost.h"
 
-#include "instmap.h"
 #include "internals.h"
 
 #define HELPER_H "helper.h"
-- 
2.38.1


