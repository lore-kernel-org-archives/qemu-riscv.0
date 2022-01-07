Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5em3-0001u5-JH
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 21:14:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRl-0001aF-2B
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:49:33 -0500
Received: from [2607:f8b0:4864:20::22f] (port=42542
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRh-0003XO-Tb
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:49:32 -0500
Received: by mail-oi1-x22f.google.com with SMTP id w80so6116862oie.9
 for <qemu-riscv@nongnu.org>; Thu, 06 Jan 2022 16:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySDY8m1tY6oV6HqE3QA/CH+8RjjTJfuo39P2Fzqq1cA=;
 b=PVe5RHJJxOmr6vFmeghn0oe9lBC8ephomBQm5Kb9PMZufWFyIvrISdXuYCAOT/BXGU
 LGwz7o2vHYknywqoaptEf0sUB4AC2TWIAT0gSjJjsG+x5iCuZDQTDD5ycJ49V8KVwBFy
 I15Bd4E8x7iZfE+As8QjtBTetOuE2pndUB9zBZNiaI5Nrlo5tOSLFfNy08MFds+DzwqH
 itVzMrkyyK18dsg8q0I5QIsbyZkW4HzJp8gCJL4TCG5mioDCEaF65cHt/qj+xDcC9ohH
 QXF1DMf2fRNDXqejAis54qylSIAx2KHK3wZL/94wPFrf/2oZFjqABYWTFopbbKkDNjaz
 GeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ySDY8m1tY6oV6HqE3QA/CH+8RjjTJfuo39P2Fzqq1cA=;
 b=1/X+ujTmZUiENGSaxDFWvmtCEjz7ESW1ziEVghOYeuBSsaNE/1UxVQNNFlWwNNrtYt
 qEzBzsj0RreEAOrx9C+r3hoPvUK+a5NObn0CxK7ZCBBv8NBnTyMX/hksMlVOE/Igtthf
 eKvraj03MKXK7LbrRisGTe6I4zQtamor0qO1aYH33OO6rPWmYL+dN577LW+e6HHxyygW
 pdgYpF2CLcxegfGWLoA3WvpzVAHPavhW49wkMTr+v+JMObmilJTpTi6uFa4Jy+/wrMy8
 Mn1RttH+cNER9TnV7irfAan7uDAc8ynKNTzpITwEt0o+0TWo0gbbgLKLNNi591ONddpa
 Rbmg==
X-Gm-Message-State: AOAM531JVAggc36eX1E6u/7fN92BgjJOqU0vqYRb3C9gop6CALiYmk4q
 nkMB0zpBfTbm0Q85HqBv/F0M3Z3X6BHVZKOq
X-Google-Smtp-Source: ABdhPJyA1Kg9rvjmi4KyPz1Cuy+gQHDDUddOqoqIfgNQROyBsRpY70g4MtymMbTw1G+9vbLA8ewIbw==
X-Received: by 2002:aca:44c1:: with SMTP id r184mr7944044oia.15.1641516569056; 
 Thu, 06 Jan 2022 16:49:29 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id e4sm678441oiy.12.2022.01.06.16.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:49:28 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v4 02/11] target/riscv: Implement PMU CSR predicate function
 for S-mode
Date: Thu,  6 Jan 2022 16:48:37 -0800
Message-Id: <20220107004846.378859-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107004846.378859-1-atishp@rivosinc.com>
References: <20220107004846.378859-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x22f.google.com
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

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. It also does not check mcounteren bits before
before cycle/minstret/hpmcounterx access.

Support supervisor mode access in the predicate function as well.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 53a621fdbaef..823cc306d74b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -63,12 +63,64 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv == PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_is_32bit(env)) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-- 
2.30.2


