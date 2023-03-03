Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zr-00016z-VQ
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zq-0000s3-3L
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:34 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zo-00089c-Bv
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:33 -0500
Received: by mail-pg1-x52b.google.com with SMTP id s18so1038639pgq.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832950;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xo32Q/W9exIcQSQRk26MLcHrnaSeK2Ei0hlw6FIGGU=;
 b=avYThU0ZFYYCrYit9saFZvsyJokVo0iUFu5PTwBoTzUB1x/PrbYaNR39VlDA7d/zRe
 ih1BAIks/L2rh91kizls5JOWx8CLnRZvrEud/I0wJ5gi9BdLCPMeKNRCABRMCB56vyfg
 AdKGyiRkhEOS+XWI/RS1TbPJCYcXiY4g6OzUU1VVQ8WugYABR4og994cPtXkPB63dXQx
 ag6dyudxjfJSply2UwPmFWx9u17M1Vj+zZvXqwmdf8Q8SmZUOLJcLP2JyxDfX4cKta6t
 ezatxslb+DeaeVKE5uu1wIWqKTBHF5kMqj3eIqs5HvJYAGf2LqTUypQni8P7vOnCPABq
 n89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832950;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xo32Q/W9exIcQSQRk26MLcHrnaSeK2Ei0hlw6FIGGU=;
 b=37rl2epYU4J+7BttC72bdJI8t/aa4UIkhyTxDYbVz9LRbPNe3eb2bXiMm7gDBPd0xT
 1w9QC8Z0hhrRnD8xRqETSUhsOkyF3fq3qMVGfksKNaJjks3akzITDHQpvRfyRUqiFbMk
 FzFLOBd1MDdhpt+gmQ0+MzoJ7RXeH0XPNRKwBc94RQNXph3LDr1Ir+cWJV/FE1+wADX9
 8CXNij4uuX92yim3qEbg/HtsOT6qP4F1RxCOAqKEafXsgNu5ujkW4F26r06ZarfyXAPT
 ZJXtwUosquZdSzfhYdYQvpZ+wUd1cWYg32TaQrU5udoSEfCPjFx91bKJ936HR/Mu52eV
 iz0g==
X-Gm-Message-State: AO0yUKWBcZGrqe2PTra8va1OkZzaKb2Jy8yRv/ypZHjJRJlDFe7VMC/T
 R4hc4kHQMQDD7cpuYj4+VjBOQizFmev0WtEf
X-Google-Smtp-Source: AK7set89KiXBQT6AtGNz17PQj2AeJWb4BlzOlmSv5DX66IbJcMjlACWoumSNRfX2VqoeXY71GyftFw==
X-Received: by 2002:a62:3813:0:b0:5a8:9858:750a with SMTP id
 f19-20020a623813000000b005a89858750amr925422pfa.13.1677832950448; 
 Fri, 03 Mar 2023 00:42:30 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 p3-20020a62ab03000000b005a9cb8edee3sm1034433pff.85.2023.03.03.00.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:30 -0800 (PST)
Subject: [PULL 55/59] target/riscv/csr.c: simplify mctr()
Date: Fri,  3 Mar 2023 00:37:36 -0800
Message-Id: <20230303083740.12817-56-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:34 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Use riscv_cpu_cfg() to retrieve pmu_num.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20230224174520.92490-3-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d047d8b45c..bf456fe87c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -165,8 +165,7 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    int pmu_num = riscv_cpu_cfg(env)->pmu_num;
     int ctr_index;
     int base_csrno = CSR_MHPMCOUNTER3;
 
@@ -175,7 +174,7 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
         base_csrno += 0x80;
     }
     ctr_index = csrno - base_csrno;
-    if (!cpu->cfg.pmu_num || ctr_index >= cpu->cfg.pmu_num) {
+    if (!pmu_num || ctr_index >= pmu_num) {
         /* The PMU is not enabled or counter is out of range*/
         return RISCV_EXCP_ILLEGAL_INST;
     }
-- 
2.39.2


