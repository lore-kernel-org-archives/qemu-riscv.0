Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5em2-0001qi-Aq
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 21:14:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRl-0001aE-1z
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:49:33 -0500
Received: from [2607:f8b0:4864:20::229] (port=37740
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRj-0003Xb-1i
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:49:32 -0500
Received: by mail-oi1-x229.google.com with SMTP id i9so6145553oih.4
 for <qemu-riscv@nongnu.org>; Thu, 06 Jan 2022 16:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37u6j7pc0R3Ygux+uuwwnDcDeg6VENiH2FLX5eNaeJ0=;
 b=aOpphZnUZQvIRBdNbmO9otrKfE1Ld0zAQ6ESPynRxxbYc34+AD400hYaYLFwnVjWXV
 5Wvi2DeDxfU5umSfIUuUj7y9m6SN1hfKbDrswVVx/utZ1kdXpWkHVYUxBBiZCwWDOWsl
 33yLgkWc0cLQDa1fUYJF18v7VG3mBTeMedU+c6phLt2jjnroBnc9kc7hstfrTqCrUike
 vjX/4UqRs0l6tc3f5YF5XnHRXAMDdCj7i1/++4ue/OMj+rM5rIp4ns634As6CiBBjxYx
 graVWH9jkp0F+4GUhgyTiJ6VmtTfryTxx+N2KjHhCSTvOnGp0cNWLxtauxsq8rq+X90j
 Mbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37u6j7pc0R3Ygux+uuwwnDcDeg6VENiH2FLX5eNaeJ0=;
 b=4DotBa20IxpwJ5h1U6mh2EobeAdFwYM+1pYmQxbFOb46ExoIGuy/2I8muSMAM13Xiu
 f0C740vXqIUZGRJoqcgZA5IMNAS5PWucj35Uckj08ewvBUshed4PoWdz2nWtdauH8/Rd
 ulItvT7ZP5xJq4h7AHQk+pcxNZorgGPm0ElaEUqTXZTw2aK/H+hZsgKm3YSKamXKzN9m
 LdMoHZYc0wO4QqHysa8AqqRJn/YmVa9BJMm9WIFGAP2tDrw+sk8N7RwgKKoiNkICBPCL
 SWoAOlhmqIVSGUsZawX1+0lLaOLE8Xd5vmg1SqsxwojhbhwiCN43JewU18SHDHewQFW2
 Y66g==
X-Gm-Message-State: AOAM532f3mDhoTTckLwCogDuxe7dETCRhTTEdNni3xzLBqxfdxdeZDD0
 Xo/cu4wJG85iR7J0gr4pbvrswg==
X-Google-Smtp-Source: ABdhPJz7bnSiQYBr4DgwoXkdJq+4p2z6B6vRzqDHr1GceRJDFNtm0vj/myUM1s9JhHb4ddEcdhNHww==
X-Received: by 2002:aca:d704:: with SMTP id o4mr8393070oig.99.1641516570209;
 Thu, 06 Jan 2022 16:49:30 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id e4sm678441oiy.12.2022.01.06.16.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:49:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v4 03/11] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Thu,  6 Jan 2022 16:48:38 -0800
Message-Id: <20220107004846.378859-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107004846.378859-1-atishp@rivosinc.com>
References: <20220107004846.378859-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 21:14:12 -0500
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
X-List-Received-Date: Fri, 07 Jan 2022 00:49:34 -0000

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
index 6ef3314bced8..df87489f6d87 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -627,7 +627,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index dc10f27093b0..16d0b4f139ee 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -312,7 +312,7 @@ struct RISCVCPU {
         bool ext_zbb;
         bool ext_zbc;
         bool ext_zbs;
-        bool ext_counters;
+        bool ext_pmu;
         bool ext_ifencei;
         bool ext_icsr;
         bool ext_zfh;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 823cc306d74b..a6e856b896a9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -65,8 +65,8 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
 
-    if (!cpu->cfg.ext_counters) {
-        /* The Counters extensions is not enabled */
+    if (!cpu->cfg.ext_pmu) {
+        /* The PMU extension is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-- 
2.30.2


