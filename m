Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lkU1v-0005Oz-GH
	for mharc-qemu-riscv@gnu.org; Sat, 22 May 2021 11:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lkU1t-0005NX-KV; Sat, 22 May 2021 11:59:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lkU1s-0006SR-28; Sat, 22 May 2021 11:59:09 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so9002958wmf.5; 
 Sat, 22 May 2021 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TvBLNYrKfyjXtRdJiJuel4o4Z8NUFOeu1XgoNZa0swE=;
 b=N6x6yaX8ZCEGlwSByTK00+UXOn8BvngFR2NeLDoGOQ9Er2FMt7VuD1RZk/ty7nmfra
 IaNnU0Q2b03+V5PUBcmnrQU7MhFm3QLKGTNM7UkQ2SRDOHx7niWcinAy9NYScJvcjVl1
 AiZczW4B3U9nGuMjgm8kILVqvRYbSC8bylZexUQwvHB0FR/AtbTbfXbaL62gD9gx0GFN
 m8+kUJVVevxZfepFyZxP1w8+lql5v53I7dJ98ccBSnQdowGIOAX18Rfmkx3JCbX/Oi3h
 ArJqluXNafn2ooGGkqT3tNkB6gyxDCv/9j4Jud8uEOe9uAsEOoTr88tdhFaC/GZlBHrD
 1fHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TvBLNYrKfyjXtRdJiJuel4o4Z8NUFOeu1XgoNZa0swE=;
 b=FLWB+stfF7v7q5f2huuz8miZWQFmwlyuGTOrZcntjwdPsVP//62pOZpJm0Sw4Gdrdf
 afe67TjmPiNgoIqqqrYOMljVogz+bUmqlt+irUk5LQZtEPlfazYuUGowpqXbN8hvwyKU
 XUn2H1YGe0S5TJLCzGfP2zPdXB/q+HHPEM2qLgn2syRutvZ3xudSN8kkhBppLk3uWwPr
 TXi3+mQyA9MqrI1x1uDGl+Btv11n6+k04JsAD9AujUVG0ShRg/yUCJl+Es0YY7UFGzyN
 ZBNLtcbc1VpdVFWRTScaR155zQ8KhWbt4xkEi3YSx5LIl8XOT/ZVyPp65rcnm39vHMyi
 kEaQ==
X-Gm-Message-State: AOAM530xqNLKXP2GkPtiS7NxthDXvUOk+iJ8tP9dnliRU5eJ1PJOw7Fx
 Hf4f+juxSQrIGB/OGOOEAvhkkfYW2edWxwoJ
X-Google-Smtp-Source: ABdhPJwMFvrAvwMmpmYoRmY6E6bhKHG8qJdtEA9cJRAlH/aALy52k93OSN7/AmKBcHhzAcEXq9B7Ew==
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr13466579wme.60.1621699146013; 
 Sat, 22 May 2021 08:59:06 -0700 (PDT)
Received: from asus.. ([83.144.169.104])
 by smtp.gmail.com with ESMTPSA id i1sm2768599wmb.46.2021.05.22.08.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 08:59:05 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv: hardwire bits in hideleg and hedeleg
Date: Sat, 22 May 2021 16:59:02 +0100
Message-Id: <20210522155902.374439-1-josemartins90@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=josemartins90@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 22 May 2021 15:59:10 -0000

The specification mandates for certain bits to be hardwired in the
hypervisor delegation registers. This was not being enforced.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
---
 target/riscv/csr.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bf..9b74a00cc9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -394,6 +394,7 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 
 static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
+static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
 static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                                      VS_MODE_INTERRUPTS;
 static const target_ulong delegable_excps =
@@ -416,6 +417,14 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
     (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
+static const target_ulong vs_delegable_excps = delegable_excps &
+    ~((1ULL << (RISCV_EXCP_S_ECALL)) |
+    (1ULL << (RISCV_EXCP_VS_ECALL)) |
+    (1ULL << (RISCV_EXCP_M_ECALL)) |
+    (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
+    (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
+    (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) |
+    (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
@@ -963,7 +972,7 @@ static int read_hedeleg(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->hedeleg = val;
+    env->hedeleg = val & vs_delegable_excps;
     return 0;
 }
 
@@ -975,7 +984,7 @@ static int read_hideleg(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_hideleg(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->hideleg = val;
+    env->hideleg = val & vs_delegable_ints;
     return 0;
 }
 
-- 
2.30.2


