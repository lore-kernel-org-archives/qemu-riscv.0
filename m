Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nGdhF-0008Kr-TL
	for mharc-qemu-riscv@gnu.org; Sun, 06 Feb 2022 04:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdhB-0008Ap-AO
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:57 -0500
Received: from [2607:f8b0:4864:20::22b] (port=41808
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh9-000152-Oo
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:57 -0500
Received: by mail-oi1-x22b.google.com with SMTP id q186so13860316oih.8
 for <qemu-riscv@nongnu.org>; Sun, 06 Feb 2022 01:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DpORpBZuRTgyXLMxgMIyGunVHEl3TZnt8/u2Ndv1j9A=;
 b=ZnFHX41mZA+eYqy36wCT4ZthuFYEk6lMIkhwNhqkJodbpf6nTab6jQ7VC2XjUBeCjk
 dmECiAj8kSXdb1tGlZm8XY3x/Fsm1hEwmQUcxyp66AJ6+3HqLUSYltnpuTKn+f+3ZBA1
 ru7f7IS4m4xLgj9lHWtGwBwqGXjeHOufWxcDf1R+FxCkGJnwhoWcW7DIniPQSdW8+cTu
 80jtUk8aUibrTKbEQ1rec7ndZ366sNnl6PMjy1qq2tVVVkEIHwVHgT+RPVZ0hg2UAWDP
 eFqhcxV9lmj8Vj3sKAQWH13pm+Zfb+PVjRAdlw93TCj84whkqbsvi0HwkRHoznNXpm3U
 vS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DpORpBZuRTgyXLMxgMIyGunVHEl3TZnt8/u2Ndv1j9A=;
 b=7+DYPDGTmT+qvGdnm5pJJX9pcrOwjyXxBC1SfAx/+2K5iHJUQ0Sx/dDGiM7vBrWOFo
 iUJdoLr148cnqVqCYZYgEzgWXywgbraJ1tPZZRCdaZuZFN1DKYFnFsomIix2I1V5O8qa
 PPonzWodfVZtZKnoj+1w6UVUKza/HaXEcpC3btMC3xNIsfv4RUx8RqWiEd3UyTkbzHNf
 VaZGxLJgdIL1IDNPIKtZFHe6ajFC2v71PsgAHab621sMh1gVOiZCr+0zYIynKP3hjh8T
 npQ6k6BFRWyWLFkDCy02u8dVaKl4epbFlZLWCVURR42b9E63pDmOZahIvy/1rqINlIfW
 YORw==
X-Gm-Message-State: AOAM531ZKr/b0gXKHuKnO2xct6uJ1qm8a8p4LM/WtFEcdmbXGeeax4W6
 m/oZ4iKHpMpIQuHge6XyHcNmEA==
X-Google-Smtp-Source: ABdhPJx/sNTvFtfld8wV9p7G2TMyGZmyvfzzT/zBiy9SEuvMF43l0aoa+H5iMEaH6OHRVrBNQsetlw==
X-Received: by 2002:aca:a891:: with SMTP id r139mr4959191oie.337.1644139134819; 
 Sun, 06 Feb 2022 01:18:54 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id 1sm1596841oab.16.2022.02.06.01.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:18:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 6/6] target/riscv: Enable privileged spec version 1.12
Date: Sun,  6 Feb 2022 01:18:35 -0800
Message-Id: <20220206091835.1244296-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206091835.1244296-1-atishp@rivosinc.com>
References: <20220206091835.1244296-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 06 Feb 2022 09:18:57 -0000

Virt machine uses privileged specification version 1.12 now.
All other machine continue to use the default one defined for that
machine unless changed to 1.12 by the user explicitly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 8 +++++---
 target/riscv/csr.c | 5 +++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2668f9c358b2..1c72dfffdc61 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -150,7 +150,7 @@ static void riscv_any_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 
 #if defined(TARGET_RISCV64)
@@ -474,7 +474,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
+            priv_version = PRIV_VERSION_1_12_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
             priv_version = PRIV_VERSION_1_11_0;
         } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
             priv_version = PRIV_VERSION_1_10_0;
@@ -489,7 +491,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     if (priv_version) {
         set_priv_version(env, priv_version);
     } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_11_0);
+        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
 
     if (cpu->cfg.mmu) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ff7e36596447..1c70c19cf9bd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2886,6 +2886,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     int read_only = get_field(csrno, 0xC00) == 3;
+    int csr_min_priv = csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
 
@@ -2918,6 +2919,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
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


