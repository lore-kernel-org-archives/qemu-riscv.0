Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNkF-0004yh-Hn
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkC-0004sz-UE
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:00:12 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkA-0004ap-Ar
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:00:12 -0400
Received: by mail-pf1-x431.google.com with SMTP id l203so8676211pfd.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJrA47L2UCydyypiiwSu2A5lwraazj94d2ktAj6bj/Y=;
 b=EvEAKVQWQTK/yFIm2rtuFbXRHTDf/AN+/NNgbuRGumzFJu8ZFa4Ci8lASFluS0i1Is
 rQDixOgP/dE0m2039jaA1GdDtLEfg+Z2oazzDpXhrvZfung9EmyxbzN8TdQN50BUpj70
 6uf2k99p+7MLMYCXYICSGqIqVgLB7vbWZqBHuuq6w+BDvfspHfd9FG5lC0QYbkr7aXpE
 WDMckaTuJ2PELcgWCEgiqd2VtHqhjtgPDxv5OSQTVEaMWHGELtHjiQEeURyDfI5esJh3
 WUgJbAH3zaoZFZ8JCMl9NctY5SaC7jItnRYI/EJLzlCkdwI+ZlJy6eAFKtmc/u/H+88h
 1/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJrA47L2UCydyypiiwSu2A5lwraazj94d2ktAj6bj/Y=;
 b=njirqHEeEXO4lpYzbMKGPLEvNRE3jhmKKbeY1dXt2rtNmcDl5h2coomSkVhnDKyJr/
 Ew2AUts29cdO/UrZYVm/zsAMukuKckelGCk7oqnZAmr5df0a0ARBdTaMzHsvtZ2vpGsk
 ih9Nv/8J3KntbnJ8ZC1vuZD6O3QtsFu9zjOqhTU94F6wbzRLe8WdyYoaryYEjQgUvZi4
 /Q18Gz+/rRFD1RNt2/nqobK+zx8hI4H4vqndUffiMLt4lsrv8v7eOrT0ewiccr0TgPfF
 m1M6KIidb/0ekG8SI0iX7hAiuK2kYA7oe2PZ/9QJSQ5iCpKwwskxaH5bdgob8NQyrIs8
 +1Bw==
X-Gm-Message-State: AOAM531Nm+gTY9UPd6mgasJxlyQznVoA+jnH4wV0MNndcFuPzj3yvrxO
 rOuo0QebplZLtPkVzOwhGFlMrw==
X-Google-Smtp-Source: ABdhPJytrV9/ls/juFxNw4JqfUDgPHCvWiNP3DL1MQnSlzRSBKd5SbINg5PhB4pZxH46t8/wuEMyQw==
X-Received: by 2002:a05:6a00:1906:b0:44c:b35d:71a8 with SMTP id
 y6-20020a056a00190600b0044cb35d71a8mr9773237pfi.51.1635498009019; 
 Fri, 29 Oct 2021 02:00:09 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:00:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 11/76] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Fri, 29 Oct 2021 16:58:16 +0800
Message-Id: <20211029085922.255197-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Oct 2021 09:00:13 -0000

From: Frank Chang <frank.chang@sifive.com>

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5d1eec1ea05..3dfbc177381 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -48,6 +48,11 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa_ext & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+#endif
         return RISCV_EXCP_NONE;
     }
     return RISCV_EXCP_ILLEGAL_INST;
-- 
2.25.1


