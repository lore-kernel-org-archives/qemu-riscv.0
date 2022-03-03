Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPvHg-0003fh-4j
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 18:55:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHc-0003ZE-Pp
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:54:56 -0500
Received: from [2607:f8b0:4864:20::734] (port=46677
 helo=mail-qk1-x734.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHb-0003ae-3d
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:54:56 -0500
Received: by mail-qk1-x734.google.com with SMTP id f21so5235543qke.13
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 15:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0rwGIjoBMnYDkEWa/CHqq/kIsYMSF0HqNKfAKFMaxxU=;
 b=tL7ns6QZBXP+gAbNR62Ro9UY+xFlO+7BNsXkrwZ0JDx324saiuM3fGlaCLEqLcvQbr
 fevRmiMlwZSboT9MB4ruV0C7UoLuiZemBBOdLCwXAyS0+Cw2HgnKg7hp9A+PDLAfB6LW
 enMHNnBeNHCcuV9gJfr9C93xjM8apzzLjeiVnG9mWAiRb/vXxLAn4tCPDS7zFAiUtvG6
 rGUFOXxjpZB6kRJB7G/ZgTtL/FTQyQofjR+O4F4+n3IjNzR+deqPurCZLf1Ws3tmgEvE
 nsgCq5G4ky+60Fyj9xQUGg2rrPZnh9Mm8BQRG873OflVLkhLBWeqWUJ/zd0PETzXjmJE
 Xgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0rwGIjoBMnYDkEWa/CHqq/kIsYMSF0HqNKfAKFMaxxU=;
 b=kmXBiFVopdghrE2NxJneNrc6o+JGJ1HTOIMau2mMVJIkQHdBP9iTGAUvhA3moTuM/8
 5ubYCTcQ4Ycur/Xea2dGapQ0px53sRGLUwwiur5BQr5jvNaSua2CQgtdclMShFnKa60+
 zxfwDa6GFDMOkV3RAhf9cFK27j144z8qzoGqxWs9q6RnojDV+EPOz7k9mMUBgX6zpaIo
 f7GB/ZpxhhR6SzVMyl3VMy4GrZV4tByAyUo6riJ9j9dUurixoBEusJkL21D4knp/Hf9x
 t8QDrAZPaihAnNpPFT2CXAUcltvr8oyuHxHlgMfMpFqxrs4emOOm0vWiLZt6QW+nPJu/
 4h/A==
X-Gm-Message-State: AOAM532l0z3c7hXtX7YZHkrp2iuEcIjgtl0a6LYEZdm4ao8tMfv/c12s
 QA7KzuOnCjW75dPPDwRHKZuVNA==
X-Google-Smtp-Source: ABdhPJxrF56wJDd9JUosSvePgz+N/h8EIWHvN9P0LPhZT1O/Nz0ghaODxQcAAY8DVdNnVBghPzhuSw==
X-Received: by 2002:a05:620a:1532:b0:62c:e6e1:35c with SMTP id
 n18-20020a05620a153200b0062ce6e1035cmr1053030qkk.430.1646351694206; 
 Thu, 03 Mar 2022 15:54:54 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1768390qkc.117.2022.03.03.15.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:54:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v6 05/12] target/riscv: Implement mcountinhibit CSR
Date: Thu,  3 Mar 2022 15:54:33 -0800
Message-Id: <20220303235440.638790-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303235440.638790-1-atishp@rivosinc.com>
References: <20220303235440.638790-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::734
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=atishp@rivosinc.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Thu, 03 Mar 2022 23:54:57 -0000

From: Atish Patra <atish.patra@wdc.com>

As per the privilege specification v1.11, mcountinhibit allows to start/stop
a pmu counter selectively.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h      |  2 ++
 target/riscv/cpu_bits.h |  4 ++++
 target/riscv/csr.c      | 25 +++++++++++++++++++++++++
 target/riscv/machine.c  |  1 +
 4 files changed, 32 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 299dccf286e0..6667ec963707 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -259,6 +259,8 @@ struct CPURISCVState {
     target_ulong scounteren;
     target_ulong mcounteren;
 
+    target_ulong mcountinhibit;
+
     target_ulong sscratch;
     target_ulong mscratch;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bb47cf7e77a2..48b39e6d52a7 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -367,6 +367,10 @@
 #define CSR_MHPMCOUNTER29   0xb1d
 #define CSR_MHPMCOUNTER30   0xb1e
 #define CSR_MHPMCOUNTER31   0xb1f
+
+/* Machine counter-inhibit register */
+#define CSR_MCOUNTINHIBIT   0x320
+
 #define CSR_MHPMEVENT3      0x323
 #define CSR_MHPMEVENT4      0x324
 #define CSR_MHPMEVENT5      0x325
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 75f18a6323c2..9cfbd60aaeb4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1395,6 +1395,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
+                                         target_ulong *val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    *val = env->mcountinhibit;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
+                                          target_ulong val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    env->mcountinhibit = val;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
                                       target_ulong *val)
 {
@@ -3569,6 +3591,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
     [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
 
+    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",   any,    read_mcountinhibit,
+                                                       write_mcountinhibit },
+
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
     [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 243f567949ea..2a48bcf81d3d 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -299,6 +299,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-- 
2.30.2


