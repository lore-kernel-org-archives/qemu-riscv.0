Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nouNY-0004eB-61
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 18:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNW-0004bJ-EX
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:18 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNS-0006fr-UF
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:18 -0400
Received: by mail-pg1-x531.google.com with SMTP id 15so2930994pgf.4
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYLWZ0AYEvI9FBKwXnehy1Q/hHHMEHlwZRLdtpEy/kg=;
 b=8XVsZqYqvgsyuCbAmC1P7WtONitrDbyuIo6rXd6Vjw7OBoyosds369O2yhggZJcP3C
 rc1nReAOZlfa822CuuzChjdpOcwLTz3xWhUrQAieqN5kFkys2vbbHGNu3S1IyG4GK8GQ
 iBNHlej70AmqdzwzfpLN1nPqEqs/Pz2SI4w+y+z25Aowk2fEILVFu6+w393JMzknZge1
 d/XKEZDs9XNSZNx6YBUM9ywMl/iMz60ptOQE3Wn/7aLoY9MobXYHIEilqCfWpG59hj2S
 B6nloDA2L48vKKqS9lU4yPGNiG3fKurPv8+7RHFqxjltRdxsTaZU+dXAggKMsvx97qFg
 MX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYLWZ0AYEvI9FBKwXnehy1Q/hHHMEHlwZRLdtpEy/kg=;
 b=f1SZQ6R/VAEU8Bl0un8x6f5LHOX13zelEmXv2LRLJFIGEeEe4TjYekaBMk+Bj4ntef
 C+tA8XJiKYVz7SiTec30HXhvUxYaTrBy0SDmNBiGt/Mc5dKV3t9PKXjpD9AHeq1D77nM
 GIpsiQznLGOLMRE0+PcVLKWXYuBF8AvCG8ZC3qqcbSoR88e/odY8QUjNzzwbasjGKRLU
 cumrtpqvId+k3O2IV1zzp8akU0SrL77EFsDqtBlLolk9aJS2v0ZmeFSeyvB9Cpa2egOg
 Ept4ap68PMmQyki9R4ExNnv0ux/kV/FyjUXR4Y7h3uS5Sbb+w/tfMingpzBzQzilud8H
 mG5w==
X-Gm-Message-State: AOAM532IJ00EF1+dcgKEE1XgKpAN2qWJKWuIJYpqG2pQ2DOOYYde4/gy
 kfBjVpIPVF0r1qqssv8BUzgc8g==
X-Google-Smtp-Source: ABdhPJzRXGY9IIhw1vr6kOjOGeJN1WZT7FkL5PWxwXudYM+a6J+4P/o7WA3ynuu5ZsYU6vd8WXjwcA==
X-Received: by 2002:a05:6a00:a1e:b0:50d:bb0c:2e27 with SMTP id
 p30-20020a056a000a1e00b0050dbb0c2e27mr27009583pfh.49.1652306413555; 
 Wed, 11 May 2022 15:00:13 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a62e417000000b0050dc762816asm2261303pfh.68.2022.05.11.15.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:00:13 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v8 03/12] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Wed, 11 May 2022 14:59:47 -0700
Message-Id: <20220511215956.2351243-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511215956.2351243-1-atishp@rivosinc.com>
References: <20220511215956.2351243-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Wed, 11 May 2022 22:00:18 -0000

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


