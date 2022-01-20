Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAdjC-000396-Qe
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 15:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdjB-00033t-LZ
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 15:08:13 -0500
Received: from [2607:f8b0:4864:20::72d] (port=39804
 helo=mail-qk1-x72d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdjA-0006ka-1G
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 15:08:13 -0500
Received: by mail-qk1-x72d.google.com with SMTP id s12so7438261qkg.6
 for <qemu-riscv@nongnu.org>; Thu, 20 Jan 2022 12:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pkyENVGUMb3mufj6ENQMxHRLGDlkjMu9ZYeHJiUyAZs=;
 b=WoN9cxO3iSz5z68avTv/5yxHCGJo8B5cFJhG9ZCt1ymLj071kfPjd09o1NaO+igV39
 3P6UR+XGyqWaaL9+Cocqww9QfS8+JdjG9oZ56ywS3KTpG/g7aWOXhN+ZSTPm+4IloC+X
 raQUb/Dbn0RP4g1Jteog/C2rMSITUyVNIXWhZSiHBBHG2Y3rJYcJdtvF/gJHY9xsMseM
 7Z86Pj8QW+BlaZ8WFRr2IPSBgX/xlX0KDGITT3fudBLDV4Ele4BAv2g3Qgx3SoY/8UOW
 wytpLTRDJjW3uREgXLXFBnrqNpzh1HY8tRhY6tE6N78So1I+nICJIGsrs8N1Z1cqLIT6
 3ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pkyENVGUMb3mufj6ENQMxHRLGDlkjMu9ZYeHJiUyAZs=;
 b=7x03irxaI+DsLUGYYZwX7ErowNLcSrc8dzudlcBxBUJ3aCuAWdjlQty/FL3ou7GyKY
 NdedS+fmGgjUnDJHo4mgPOd4E0ITNl0q/TOCEA27q1P7hiAT/NcQ6rswXCG7aPMeLKSi
 tJ04ZzMBdX4iYGwIzsodmECmqFNvDtKt69aHBI8iTmNt4h8i9/acxCzv+d170MPeETLu
 pywxoqSbtg4nqum9P+fpG05D3sw8Zz/ktdxcGKlr9O9dLifnroI/bzeoCU4M+C8VpQu1
 uazPVR/nWHW9xFm3x6ufI2VMDbTezo4Si/2N/9Qz+uzBTEiD8N9WlFexUVBfZMlGU84K
 s8bw==
X-Gm-Message-State: AOAM531OxuphlmpeC6G+ciDf4Ijk1a2PhftLq6CzdRlj1yxBKGl6CByr
 n8ER41uk95UPOMI5H3zI5pCX0w==
X-Google-Smtp-Source: ABdhPJw/4BL1RqNPQce4YIreliiKBZOMcvv5VwmC9Azki9+QnOUycetcu82J0pWJtCnojsT9Mxqsjw==
X-Received: by 2002:a05:620a:2684:: with SMTP id
 c4mr440358qkp.24.1642709291245; 
 Thu, 20 Jan 2022 12:08:11 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id a136sm1834160qkc.56.2022.01.20.12.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:08:10 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org
Subject: [RFC 5/5] target/riscv: Enable privileged spec version 1.12
Date: Thu, 20 Jan 2022 12:07:35 -0800
Message-Id: <20220120200735.2739543-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120200735.2739543-1-atishp@rivosinc.com>
References: <20220120200735.2739543-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=atishp@rivosinc.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 20:08:14 -0000

Virt machine uses privileged specification version 1.12 now.
All other machine continue to use the default one defined for that
machine unless changed to 1.12 by the user explicitly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c |  8 +++++---
 target/riscv/csr.c | 10 ++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055d4..cec5791151e7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -153,7 +153,7 @@ static void riscv_any_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 
 #if defined(TARGET_RISCV64)
@@ -439,7 +439,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
+            priv_version = PRIV_VERSION_1_12_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
             priv_version = PRIV_VERSION_1_11_0;
         } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
             priv_version = PRIV_VERSION_1_10_0;
@@ -454,7 +456,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     if (priv_version) {
         set_priv_version(env, priv_version);
     } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_11_0);
+        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
 
     if (cpu->cfg.mmu) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a4bbae7a1bbd..62d429cc3f17 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1874,6 +1874,12 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     int read_only = get_field(csrno, 0xC00) == 3;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
+    int csr_min_priv = csr_ops[csrno].min_priv_ver;
+
+    /* The default privilege specification version supported is 1.10 */
+    if (!csr_min_priv) {
+        csr_min_priv = PRIV_VERSION_1_10_0;
+    }
 
     if (riscv_has_ext(env, RVH) &&
         env->priv == PRV_S &&
@@ -1904,6 +1910,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv_ver < csr_min_priv) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
     return csr_ops[csrno].predicate(env, csrno);
 }
 
-- 
2.30.2


