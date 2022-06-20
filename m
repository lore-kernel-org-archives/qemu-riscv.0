Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3QdX-0001Dx-PW
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 19:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd5-00011J-3t
 for qemu-riscv@nongnu.org; Mon, 20 Jun 2022 19:16:24 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd0-0006S4-Uy
 for qemu-riscv@nongnu.org; Mon, 20 Jun 2022 19:16:21 -0400
Received: by mail-pj1-x1031.google.com with SMTP id cv13so8753230pjb.4
 for <qemu-riscv@nongnu.org>; Mon, 20 Jun 2022 16:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdsvWw2MWYGtL4zcEfWWkegG1PMzdQinQ886RbqvoqE=;
 b=wTlrqTHvjs4pra0SrGf/4Q4pHDLWmAFNnov4VjT4Cve6Tpnd1fAAn9ABDq7+mFnjqq
 aLtxOX1+RFWsWFZMLaZYSxTiKuC+p+AJx1nhATa0BYdkXCXwe5/igK6yr0l4l54/6OQL
 Fx6xaNfxf7YqZip0MXwqQ8bc5ZSBfkZPdaW+gv3ShQoNg3V4123eTss48rkDHSDe0KML
 vMCvVu8Xbhx1dRvi278PFG9Xc/C3+K7WfRRaxLEo6BrTJSWsh9GldrlYXnoGxOZRbP7n
 Yb+LTJc8TZi8sSX2Z1gH+tR5j2RE5Ae9VPI0voEOMMXfJi8Cbp1jDQ1X2wv5N1RWxmsL
 eo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdsvWw2MWYGtL4zcEfWWkegG1PMzdQinQ886RbqvoqE=;
 b=ON1P+UFcJAH8OaVorBIO6UwjfazuqsFabGwhRXpMxZmoLC0hI5Mgwljlx0Vk6Fk1wU
 2U9YkST3YEeb6NjFA1fq8ONxIdL1TXMTQQfEMX0SuVWDQX4mf6VqizqC1XKI1IgOPizk
 9eDXEc28uA18RsQCmYKyFQqJTCyTAoN/cxuaV3/b4SugbWN5j7nalhSpWFWwJHTU+MgZ
 EYWirDl7jxKdlhUC1uvrNvkY1DZMiPYz5fy926CWee2ageJ+Srlzc67cE3rc61dLoMYP
 K3ckonEM6KSljrOE5vWGuXYdc+F4y6V3xQcKbrxSBomYu19wmjKr8qsx6K+8D99Xm8z2
 AIIA==
X-Gm-Message-State: AJIora/efJrgzfi1vCIVJDPe1uWlU3HqiyWGhna2KWQDAck/4/olDFmj
 4TTpY97nwLE7L8EDzX4WuClD7A==
X-Google-Smtp-Source: AGRyM1tSxub3dA1cpTl/y+0ONboSPVUGHzoSKhBLtH3nl0vgACGI3mS1Ai18xQf83GTryOTexREBNA==
X-Received: by 2002:a17:902:f54e:b0:166:3b30:457c with SMTP id
 h14-20020a170902f54e00b001663b30457cmr26271690plf.1.1655766976654; 
 Mon, 20 Jun 2022 16:16:16 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902a40200b0015e8d4eb285sm9191008plq.207.2022.06.20.16.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 16:16:16 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
Subject: [PATCH v10 03/12] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Mon, 20 Jun 2022 16:15:53 -0700
Message-Id: <20220620231603.2547260-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620231603.2547260-1-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Mon, 20 Jun 2022 23:16:25 -0000

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
 target/riscv/cpu.c | 4 ++--
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 05e652135171..1b57b3c43980 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -851,7 +851,7 @@ static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    cpu->cfg.ext_counters = true;
+    cpu->cfg.ext_pmu = true;
     cpu->cfg.ext_ifencei = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.mmu = true;
@@ -879,7 +879,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d6397acdfb1..252c30a55d78 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -397,7 +397,7 @@ struct RISCVCPUConfig {
     bool ext_zksed;
     bool ext_zksh;
     bool ext_zkt;
-    bool ext_counters;
+    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 58d07c511f98..0ca05c77883c 100644
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


