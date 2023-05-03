Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6aZ-0007Kg-IN
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a5-0005CB-93
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:18 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zt-0005cR-Fz
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f315735514so10775115e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097624; x=1685689624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvLKyw9z19puGl4906wWpsqbju3c3EHRrQAYILFihCI=;
 b=MVnJ9l5spUH5OFm1bTK3TIwf78cBpsOG1k6kxTpswzfl3DyjhdQr4kArGOuJjhQdDA
 1DlOEpl3LJNFtRqHP+kNTI2uL07UEvPYEBkEXB3e6V4mYMEmxhdCgqQNPY9Ow7K2xN9m
 yi6QwmMbIWH9+UxMSqxkGhV3OXpce6tAi4zoNSbz0xBpdploJI531UaDUbBlrvHI3D4a
 625Q9miYhpzhjtz9k+tt4LPSQGcy9yTUPvVr7gRfNbgEpg1cln20AhPpq9k3qIYJMTLT
 xvL5ih55+6dJukvhUoYxAP2a0YxVuXO9fnRKG/IBYpwhXU01ePwQnSXB+oiWcTocPb2x
 erfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097624; x=1685689624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvLKyw9z19puGl4906wWpsqbju3c3EHRrQAYILFihCI=;
 b=EyFJmAePmHDEMKbmPGorVBjZr0WIVhGOm93mdehjd6KPJiT7IgN3XRZa0DCt6WIVvA
 3FWY+xiu20b3L3rFyTMQKDWKOe7bXsdlsst+pU6P9jdwGKUSfQunubQvl6I/d5HjmQkW
 tEYjUYeaq3IFmgaPy0T/2qh0WBkwhp7t74hR1++ZdniymusZ8u7xVxzvJB8xm6BsDeFK
 qCZlMyFKJJSTjXPfIMY+83bo0DprVEa9xmg9WSS5xiqGa4GnvJnIMpG/yY6Q6k5m6Uqg
 BvbJ3eQrfaLAkRNbNmCyLjXX8TQMQjRzLb6lGwtFlqfO7gXOUHy9sLXeOPhFMZZjtHly
 9zcw==
X-Gm-Message-State: AC+VfDynWbf44M1fs6/t3xsU78bDRpA+0tZ1+BY9AKSzCgWjcc6i6I6V
 BavN4XjV7HBrBmaFMpZN8ZEZrw==
X-Google-Smtp-Source: ACHHUZ70ezwEaY8K1QL1NdkA2etqqCJvE9WsA1qOHIKxbs3Xv5QgN+dyVG4VKKMAFyo3SuHwvpNcmw==
X-Received: by 2002:a1c:7c14:0:b0:3ed:3268:5f35 with SMTP id
 x20-20020a1c7c14000000b003ed32685f35mr645653wmc.18.1683097623838; 
 Wed, 03 May 2023 00:07:03 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 08/57] target/loongarch: Do not include tcg-ldst.h
Date: Wed,  3 May 2023 08:06:07 +0100
Message-Id: <20230503070656.1746170-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:07:19 -0000

This header is supposed to be private to tcg and in fact
does not need to be included here at all.

Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/csr_helper.c   | 1 -
 target/loongarch/iocsr_helper.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
index 7e02787895..6526367946 100644
--- a/target/loongarch/csr_helper.c
+++ b/target/loongarch/csr_helper.c
@@ -15,7 +15,6 @@
 #include "exec/cpu_ldst.h"
 #include "hw/irq.h"
 #include "cpu-csr.h"
-#include "tcg/tcg-ldst.h"
 
 target_ulong helper_csrrd_pgd(CPULoongArchState *env)
 {
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
index 505853e17b..dda9845d6c 100644
--- a/target/loongarch/iocsr_helper.c
+++ b/target/loongarch/iocsr_helper.c
@@ -12,7 +12,6 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "tcg/tcg-ldst.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
-- 
2.34.1


