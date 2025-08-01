Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5140FC87FCA
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 23:29:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhzAL-0000Z4-Fr; Fri, 01 Aug 2025 19:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8x-0007WN-NY
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:31 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8t-0005y6-El
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:31 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76bc5e68e26so2933241b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 01 Aug 2025 16:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090785; x=1754695585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlUXIhi6h78CRePZELfzHeitKJjJ5bn9ta1i4YKR6R0=;
 b=C9VOhYYAMsIIqMhQ53njXNd9yo4/D5OAYr9vKGYtQ+smofTjnZPj+oEUL1Eb+4IsHS
 tpWEndfMj0a1EBihIhRrLAVq0dWZtcvabL1fa0iwp9RGTbDAzoCyJMfnF273w7Avoo9H
 3OTh0h2IOJ3aiz/uKFU8Z9CFhKCn+23JFH1v7CaJYAGnROay+Gw+KEW2BWpVd1gfA6pP
 +XqSf6Saql8M4gK9KS9hdP+QNe6uTN28tpYt8aoOs0M8C0Y0mVNNXQBlkAalHk3JVUYt
 azbhgWMOj+cVMD3xFtKjiwqdLi78kpgGO5pE1Jkyx3HcRxUNs2+9aTAqMmTrxaTrm/Lz
 MihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090785; x=1754695585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zlUXIhi6h78CRePZELfzHeitKJjJ5bn9ta1i4YKR6R0=;
 b=KkzDouYVIJclLPNk4YLlt/+9WYxIckd38RhU2trMopiu6EzBgf91+wnny3sBS+HuXo
 zyEDdx3ALexD4waRo9K/fsTvbzhn/pZ65zljpiHLJD7Ig711QOZ/RAAnviMVBnp6Tf3l
 5yHi39B+A+Kt6CqUFvj6/ZPYfo7doJcQRGj9IciMA7+nFQa0jFKPVhnBPiqqdyhwKWiz
 HGr7gXD9QFq6x4bE6iFJHCJCEBKYnXqRvjgnl5MuDITb4SnawHlrbIuXRqt+yKyUqmjD
 OfvQQDcAMy4pD5B0RzundvEhsf/cGC6f6VVuFrfE9ax49rfVucTfBpcu2fdJt+20blKc
 i/Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Txw19sa/fLakKdNGoLNn3oP7brSO/V3DQeXYl0xhJzELQ6lP8VYP57qM0/hiaIx2SkxTXSzak0NI@nongnu.org
X-Gm-Message-State: AOJu0YzOHPYZj1EXzFCSqW0YOmaegQtNAGyiBQKS9yBejpWeH2RjOuBr
 EaZpGd6W/gbYHT2Kwb5ID3ZEykc4iOyBcKa5mA25B+Yfy1lAYtZqQVIbIo1QUmiPDRw=
X-Gm-Gg: ASbGnctXHWljwjrpYPrV3UYbqCG4zqixmWHHcxQ5uhd20WYPRhsWZyses5ALckyHJmU
 7APcS5TCVyHDTIE4oW4tUDEO+EVcimqPeIAVNuGrD091evLXskQGXsAbYTqr/pBgMnitVTea7dA
 F156kAvMmZPxEdQnp/uDKCzA90cUbFwRgsHbEdtw6bTsyPAlG46ROTEiOdyisYM8I5zwbogVml5
 lq0PQTcpCfQb44judf88IKv89ywN0CZsSxB+fhipWR1l0iBx7ndMaJv9lHUAkOQdZg5oRKFNgrv
 655lZWiq+XnKfIjvqpGqHbCJMPLO2Ntcx2gUuxg3dPT2qfbcz5qyigRq4G7m0su8MrIryBVCz13
 OfC9nSGORaFDOsxi2ehFb/w==
X-Google-Smtp-Source: AGHT+IG01OBI7okrRxwg7bAA0tgYnaGw3fGVkgDnGnSC6XEP6eNOkzi1zRbpLsNj3l3FgdepOmRzEA==
X-Received: by 2002:a05:6a20:2448:b0:23d:dbe7:9557 with SMTP id
 adf61e73a8af0-23df8fa4df4mr1667364637.16.1754090785550; 
 Fri, 01 Aug 2025 16:26:25 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 10/11] semihosting/arm-compat-semi: remove dependency on
 cpu.h
Date: Fri,  1 Aug 2025 16:26:08 -0700
Message-ID: <20250801232609.2744557-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 550c8f3589a..f4c92ab6660 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -34,7 +34,6 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
-#include "cpu.h"
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
-- 
2.47.2


