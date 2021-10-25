Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf3tt-0000Lb-AF
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 13:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tc-0008Vt-J0; Mon, 25 Oct 2021 13:36:30 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tZ-0001wS-69; Mon, 25 Oct 2021 13:36:28 -0400
Received: by mail-ed1-x532.google.com with SMTP id n1so2576080edd.0;
 Mon, 25 Oct 2021 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LmdFiYK0DkTfBOXHFFLupMEByC42b7l7VOV72X85buU=;
 b=W0whfJjjI3t0dKQApwdBkfYmcQP3s5EMPm4xBfZ+tLO7NL5r9nBvpPjxYjA9JKb0Na
 tVo+nKRIz/LhfPyu939xdbDKA5WHsG2sBYE/nXLqJ/JeMxU+CQr5s3M/EufEOvU280x5
 2Mppk+JTpQfGzqjVs2jhhVxO1OYshqk8QA10W5XVi+whOVflqTMsEB17kTzbY+3H6k+r
 tNTwk6ANbQbpz5jWvBjPZOS+hRNLBNYcDM1LZ4jyLV6B9pQ1uWG8iBJcSZG41h9b0+Au
 9Zu6GxxfbQhUgV+HsLg9Vnr+W9hDvySWAlmtyYNjJdBN9gIuqPesk7y5FD49bUtcr9Sz
 ARFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LmdFiYK0DkTfBOXHFFLupMEByC42b7l7VOV72X85buU=;
 b=hHNStsKYbb7h1XL5yF9bbF0mJ/ugOFfxWG0nK/aAlffc9CLfwnrcBH1NZq0mu7GXkn
 89RyJpgFMeEdUdAcj/2Q8FfwUZenVIDgGLHRM9sanW+FKbPBQp1kPUu5rVR27yZXjlNP
 NLSz4saXDGRimJYP6T/0VsyFXeQQXjfx/qKve9VGFSNqji/vy/QCvwxuUgpbE8mgPSg8
 DHQ7rZ2UT7uVp018+GWfvmLfATxCgDbdecSAooTmHci6gEBHk1WfbkJKwBnJEmu4E3Gu
 HOIO1M0PwxKtPCUFIk/uy1Mx3ltukXHw1h5OUB+SO7xzcYXZEAhdKOWrufJTAHtpKTi8
 3MhA==
X-Gm-Message-State: AOAM532GeDZz7OdQHSJWRNNKuvtQWuk+k/QPIoEeS44vCbNnXqOmOkvG
 FINwK63vXPKaPdZdUsqFE68=
X-Google-Smtp-Source: ABdhPJz1kRTuxzMY7faAJ1xV1Zc8Ev0V//iv1ThbZAAOT9T/Si+zbLbSKIMn892zRxv6oq7lwC8x1Q==
X-Received: by 2002:a17:906:6ad0:: with SMTP id
 q16mr24049665ejs.552.1635183383284; 
 Mon, 25 Oct 2021 10:36:23 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id q14sm9718871edj.42.2021.10.25.10.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:36:22 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v17 5/8] target/riscv: Print new PM CSRs in QEMU logs
Date: Mon, 25 Oct 2021 20:36:06 +0300
Message-Id: <20211025173609.2724490-6-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
References: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Oct 2021 17:36:31 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b767a4a0b..16fac64806 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -271,6 +271,13 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             CSR_MSCRATCH,
             CSR_SSCRATCH,
             CSR_SATP,
+            CSR_MMTE,
+            CSR_UPMBASE,
+            CSR_UPMMASK,
+            CSR_SPMBASE,
+            CSR_SPMMASK,
+            CSR_MPMBASE,
+            CSR_MPMMASK,
         };
 
         for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
-- 
2.30.2


