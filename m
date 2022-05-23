Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntHpo-0004GM-9f
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 19:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpj-00044V-Te
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:31 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpi-0000MU-EC
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:31 -0400
Received: by mail-pj1-x102f.google.com with SMTP id l14so15359136pjk.2
 for <qemu-riscv@nongnu.org>; Mon, 23 May 2022 16:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYLWZ0AYEvI9FBKwXnehy1Q/hHHMEHlwZRLdtpEy/kg=;
 b=sItjCSHmuTcjv0HZtuTy4cynqcrDMdVZMPhGfhT7V7FPPBevqwLQ2cTIj17sNPKpWN
 wBGVKdYUr8OPJt5OFY0U6AXwHi8BwzLPwGoFCkC+BMTogcLnwZs3AgKFG6eSNfxegisY
 8Nx/rYnkzrpYb5R+paEIxsvVKynl36SIUlXWQLBZ4/Oa+usmvIv7O3+oopf7ufiJaMe6
 AHqtbLmbsdk9ZQclHM3fFZiWS16RpuNIsCDWljEx4BvtX3PASyI1jqjr2hHMXYVxV6aG
 ejygkovdgN2BHs1Put/5hWW+XtyCwtn1hJ5+eDtCT5x1HORXHDMSg5urkdydXYWIhhT4
 ybKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYLWZ0AYEvI9FBKwXnehy1Q/hHHMEHlwZRLdtpEy/kg=;
 b=B2JuGmg3dfSkwuIEovk2i+8bciCaeexS6GN2DQ+mP0eNN9tOHy1uQ7+PmUyeiH6gyP
 jkL/V1fMyeqc3L6ycB+qN3Z28VdZlZkPb5yIdQ4WXc4ECSQ16uXHDp/a6nFiznRpufzg
 T8feIJq8mANS7caOu84aDQhw+yHOQO/lkstSuUCD6/W5/kbniRUxJR/jEhnoWIQuV3ge
 GbiR7PQmTx/e35diT86Ng2bi90oVL+kfkevSL1aRDLie7O227hvsJpHzil71KTaOam5z
 5Qz9xStrHV87kcvLTnR7buXPv+cCwlKCXV2d5bYWQ7qrn9xT96TATxoPAGxY6IhAqHS1
 AVoA==
X-Gm-Message-State: AOAM530xSryuH6IwjJgSZqCL/kMh/RVsdl3nTx8KwCkogIgYF9MImpKL
 mXavRWRU9lpOwiGxgrwiKrEFrg==
X-Google-Smtp-Source: ABdhPJxOUA7piwTA/VD+dvrXjbNR1vhFH7nkxpwh94PzJQps5o5qlaiiaN57gFkgcmoVENYQDGj57g==
X-Received: by 2002:a17:902:ccc5:b0:15e:f75e:6ce with SMTP id
 z5-20020a170902ccc500b0015ef75e06cemr24775678ple.104.1653349889755; 
 Mon, 23 May 2022 16:51:29 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 pl15-20020a17090b268f00b001df4b919937sm257084pjb.16.2022.05.23.16.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 16:51:29 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v9 03/12] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Mon, 23 May 2022 16:50:48 -0700
Message-Id: <20220523235057.123882-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523235057.123882-1-atishp@rivosinc.com>
References: <20220523235057.123882-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 May 2022 23:51:32 -0000

From: Atish Patra <atish.patra@wdc.com>

The PMU counters are supported via cpu config "Counters" which doesn't
indicate the correct purpose of those counters.

Rename the config property to pmu to indicate that these counters
are performance monitoring counters. This aligns with cpu options for
ARM architecture as well.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 2 +-
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ccacdee21575..5ad17b40189f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -822,7 +822,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe6c9a2c9238..09a0c71093c5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -391,7 +391,7 @@ struct RISCVCPUConfig {
     bool ext_zksed;
     bool ext_zksh;
     bool ext_zkt;
-    bool ext_counters;
+    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d175fe3f1af3..c625b17dd58e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -74,8 +74,8 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
 
-    if (!cpu->cfg.ext_counters) {
-        /* The Counters extensions is not enabled */
+    if (!cpu->cfg.ext_pmu) {
+        /* The PMU extension is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-- 
2.25.1


