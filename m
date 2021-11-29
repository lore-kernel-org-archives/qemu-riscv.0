Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWyI-00011F-4W
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyD-0000ro-Qc
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:46 -0500
Received: from [2607:f8b0:4864:20::62f] (port=42874
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyB-0008Rr-Jc
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:45 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u17so10977247plg.9
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJrA47L2UCydyypiiwSu2A5lwraazj94d2ktAj6bj/Y=;
 b=QSfMjLEpFRBFnPMQ9wI+OJa4zR78buU2t6HVbxDogG9rnOpUh9Gf7ZrYadL6P9JJTO
 H43+hTOkdqRP/4HqB4I3h9riHZAiZwP31yyNuJBTUqBALSfJd87tkwcAStrQH2G8FpeH
 PULieiSWBtmWRM+EF2O8GstKPGkHdaO607l8XnMvLvjTXpROcA50NEdKzTsGTQsUPNVy
 2NefnBr//IZ1Ot2Qd9O72DRyQVhuZHrof9l5AgjOzDiIM+3UR7a+Mb5CnaNTVg0qfm/q
 y4KzdT2X1h7kYEmEc4FOg8STTLJDEXvpZsbpcpgSLHqKDqXvS9zT/pNwr6FmGCaoMKV2
 8eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJrA47L2UCydyypiiwSu2A5lwraazj94d2ktAj6bj/Y=;
 b=mW/gP7vjQh8jAErwhShXV8D1/9kCW1lfzI6qVErIqVBlBfDh9nvPL2HTXtu8cOFwEc
 1NASpat+J5UIEj48MZzcRLTDRC4hHYhgrxGcKrZaSy6Pp9rH9AzqTaq/lbgLRW4DmnrZ
 erYe19/JaFUMcciQkINk+4V7Pfcu4FdFJ4kn6gaeaokPQQNhncND7ZPFn94yCTJc9bM0
 JR/DRfMgTdtHyTEIgqpDLezGCsW6f7AFdhvt/PK+aILYWMSMVLl5K5izSzr7+6yBxYO+
 ZbBy4JONZO5IQvn22slzwnP6RyY7bDxZmvPNF7rN2eToMvYHEC3Y9mXjNnskR7Mm/cDd
 Qs4Q==
X-Gm-Message-State: AOAM530htJikley6/THGilyWs/b5TVFG4WUTzen7m6xwDTDEfuumguA1
 xDp9UmCGa0mg5C/nes0ECkWCvN/XNBCZ7i8y
X-Google-Smtp-Source: ABdhPJzO2VWp/D+Xeh172RuQqAPSRuGicnWTpblaxUlZtuOvIG+UVnTAz0P1OJvKleh3Hxu5JlIHeg==
X-Received: by 2002:a17:90a:af97:: with SMTP id
 w23mr34846866pjq.128.1638155072382; 
 Sun, 28 Nov 2021 19:04:32 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:32 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 11/77] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Mon, 29 Nov 2021 11:02:31 +0800
Message-Id: <20211129030340.429689-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:04:46 -0000

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


