Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOPr-0001TX-2p
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOPn-0001JK-EI
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:33:27 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOPj-0004UC-8d
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:33:25 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso26795286e87.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451201; x=1685043201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9PQZw7N1cpbJGxx9QlJTxfD8yUIeHJGfpj65uurq3A=;
 b=rdHB5RvZZMJvU4Hj2LXflPxFbf2BpqAdtXsnS6o0Yj+sy0tERwuJ8mDqky+Bh9ytEI
 g/lAiEykFS8K5piZ5simeCD2l9ktOcLnm3CIxjQDKTuknjk50c24VpEiTI5MX9XcHMFr
 ElGWLTKXte510RQ7Pr+GZvQDIt502TyOXA4NDMnVTLWkiPRCWGjde7px3TVBwW7BoN/1
 zqNq66gyZhMUiPTmOO6+kMaSaRVrVBqwMaCwPN9EhZkimuqXa65aHZn3qts1OZbU/t1Q
 SzJztr3qdYIdDfwsKGd2Hm8Sc8B7L9uESGv59yZaxvmkeLuceTT96zmpiLhQuVznSQZe
 Orsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451201; x=1685043201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9PQZw7N1cpbJGxx9QlJTxfD8yUIeHJGfpj65uurq3A=;
 b=gzVakhlDGd3kPvW69q6II9WNNPnMDw9JaxFlalwO3jz6m/5VnV6oZS0/crk0W7+lKc
 iQsT0dR3Nn1OAspGXMyuDSBRwbcanD7SZKp0kWDVV/fibngOOqXcLbUeGKngXPJdetKu
 nkJ6h2fFj25aaPMwnJWQqveD1n2EIOZcTMXCuAnRsOcrqrSqyPvPzed6zkhsJ2mUyFCG
 LhFvRXcv5L+Xu5xASZfRCPi6qQ6s7rWGtOpiH1yJD1jToGp/k8BtRYca7wi0NbhyNSTP
 bxk2pnCxbJjJs2UtjtGRYYCRJZDqBYZIR6X36VmGMTRZi3Fbz9HcbXCx+5wLw+Rji+a6
 5n9A==
X-Gm-Message-State: AAQBX9fAm0R88j+MFqLI1dVFzE8qbq1EWkIAWx4S9bnMUTZPCsF9Enh+
 xC91oC/HeQwBfVPJd1nh72A87Q==
X-Google-Smtp-Source: AKy350ZQ/l0hCXv38JU1/IUlmMhnwq82g6huj8ZCnRjh5mQ4wECB6Av6Kx0rRvZdscOQ65L6SSCaVQ==
X-Received: by 2002:a2e:800c:0:b0:2a8:e84e:4e5a with SMTP id
 j12-20020a2e800c000000b002a8e84e4e5amr4208459ljg.21.1682451201534; 
 Tue, 25 Apr 2023 12:33:21 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:33:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 08/57] target/loongarch: Do not include tcg-ldst.h
Date: Tue, 25 Apr 2023 20:30:57 +0100
Message-Id: <20230425193146.2106111-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:33:27 -0000

This header is supposed to be private to tcg and in fact
does not need to be included here at all.

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


