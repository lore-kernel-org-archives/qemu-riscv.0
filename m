Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG94e-00029R-MU
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 19:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG94Z-00025u-1t
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 19:37:03 -0500
Received: from [2607:f8b0:4864:20::32d] (port=33761
 helo=mail-ot1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG94W-0001nS-BS
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 19:37:02 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 l43-20020a9d1cab000000b005aa50ff5869so450887ota.0
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 16:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7th6gIracB4kCH9B3bm0pIvdSCT1y3um6Z4gju1Bg0=;
 b=BxtLmksi0wIGesT6PRqQk+2PbUWfLXuWYxFWgGnPxz8zjI/+VejIUYHwfj6suRccPy
 nOtUeQHYlN4bB6F8RwjjgPtZafSzlnhrRbEaA3lTJ1dBZbn4u1JlGkyILXO1r9lhN+fo
 G4G+Un+YqYgKBdsZnFzFJebqteeGwRoROFPRbYmrMS+9wSs+RqbyjuwiTAlWcH0diuuu
 TKrhV0xig0NJ5RtEO3FZgnhpC/Pye1laPIEOfuvzMzvp6VMVyKQy8es3sI50yXi2vizL
 wvZW0bm9dTHYFbKGA4dyPVk7qgmYFHdLZ7jwQ6o5uqKx435+YN19Lel8ULg6abqwZbt/
 tVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7th6gIracB4kCH9B3bm0pIvdSCT1y3um6Z4gju1Bg0=;
 b=Q8hNFH7O3kNMvctAxdbNsoro26UBUI2mUH6hUTOklHehj1+28JlswMf8ObXpinkvNw
 IyZf5UeHG9RZNE/B3G35PKogI4OGU+/pK1uKd6OndlV6okUp50uXIPH6q7CHM7KWD++g
 4PH4PzyS65Wqi/ZBt6T7AYSXoART2rRHCT4m/WeAbk4Ml6asSGIgigrgA0ryjZn+hxP5
 seb8OX+y50a70vGqGOuYOV23f/Z5sbvQ4m3Bp6Zp4S+LyTU+L9k2okfG+XkLe5nAv7qf
 pB7YfNcDKpJC2SYUKdseEwFZRalg8/LQup/nI5bnhYHcrCVwciXMja9voD6Bu3EKFO5t
 nvOA==
X-Gm-Message-State: AOAM5326nXsuSXSCAmjZHPtCr372bRph1zB8RYPhm9GLRNF55eRAD5Pd
 cvODueObjSXPt3TD7yR5GU55Ew==
X-Google-Smtp-Source: ABdhPJxgVelwhcGtTSTeU8b3yX47CrXbDDOcugKzUv9qyPsQ6AuZEI+rIwD7Gs0rPkqkzhNYw/qcXQ==
X-Received: by 2002:a05:6830:120b:: with SMTP id
 r11mr568044otp.182.1644021419338; 
 Fri, 04 Feb 2022 16:36:59 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id c22sm1148888oao.43.2022.02.04.16.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 16:36:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 6/6] target/riscv: Enable privileged spec version 1.12
Date: Fri,  4 Feb 2022 16:36:05 -0800
Message-Id: <20220205003605.1150143-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205003605.1150143-1-atishp@rivosinc.com>
References: <20220205003605.1150143-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x32d.google.com
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
X-List-Received-Date: Sat, 05 Feb 2022 00:37:03 -0000

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
index 88c839a5ffaa..4e381053927d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2866,6 +2866,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     int read_only = get_field(csrno, 0xC00) == 3;
+    int csr_min_priv = csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
 
@@ -2898,6 +2899,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
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


