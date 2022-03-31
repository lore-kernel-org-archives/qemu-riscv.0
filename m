Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZiG6-0005MG-5n
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 20:01:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiG2-00059z-FO
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:46 -0400
Received: from [2607:f8b0:4864:20::633] (port=44588
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiG0-0005VZ-Jn
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id j8so11741519pll.11
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 17:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xbGwjstWaIxAAQlaAtNpNCMeXbJHUqbcG4xt8oQ7u2E=;
 b=aeV9sHSGU0kXYgjgSWv61aadyVnBCKKUkeh3ba59GituHUfbjL3c7eGqCMRfN14KTA
 x8ioGtQW8SxcCgKwE7T8j5jv8nsUsxT13xcqCUfVRpUpyqMx9BG/Nd3uUc0R4glQR12T
 sLwj3NJy9Yn7YzeiKfZf08RLpiz5jTMn1lGhWDKqEDR+xp5/XfnYGVQKnLVF3ATXwrBL
 8UZC+HKMzjHmFA/X4frLBCTRBvQbk9ab+kJJp2Pfx9/T69Zpi1qPKRULaMLDG0NoJP2e
 khJxtMX6sYrZr0QpQq/Z0xXcVGRqqyOA/0FbwwNtz8CGlxhdf6g8VBwFSBTAIOhd2fbV
 QDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xbGwjstWaIxAAQlaAtNpNCMeXbJHUqbcG4xt8oQ7u2E=;
 b=2isir7JCjg1qplGIW/vnJYiLhNIc5A387qJxJOuaUitykxd3ilZIB749TAxMD0iLRo
 q9HhVg4FoC5nt58Dx1TzOP2sDpFf7nyF4RGgjzoPcSrPOc10rQ/PWmzodYB1GcoStaEO
 jJ6wwpNQdV/pbcbbA1UETmloP8Rylm7RmO8SZMiR07Iuu4pXjqudp6NM8dWAeSlpWIyx
 UUW+DgakYrGZ8abrko2GxXLkev32Y3djCidYJgopuSU/TAIzvcffA1X+O8YQdjw2vMSE
 eqc6ATUWPNz2DsVsVZQRxwLu4yeixixf8oUS0CV1wEJ3bEyAKAqOJPyUe/I2G6vA//oW
 /cHQ==
X-Gm-Message-State: AOAM533blPe6O8ArJHSQSCN01BrqsszqP/qp0eu/q/0MxpWkRQyLCxFH
 +eD4ZBk+pxVx/dRwrGj1NDqK/w==
X-Google-Smtp-Source: ABdhPJxSiruHKt0/gqZ55YHlCeLbk/rtvVQo8oZ2OkcIwger+KrUp4NQgoqYzznHmdvmbhHn+kWOrw==
X-Received: by 2002:a17:90b:1bc6:b0:1c7:69d:e80f with SMTP id
 oa6-20020a17090b1bc600b001c7069de80fmr2683665pjb.202.1648684903300; 
 Wed, 30 Mar 2022 17:01:43 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v7 05/12] target/riscv: Implement mcountinhibit CSR
Date: Wed, 30 Mar 2022 17:01:19 -0700
Message-Id: <20220331000127.2107823-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Thu, 31 Mar 2022 00:01:46 -0000

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
index 47319dbce4b9..be826a19f68e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -269,6 +269,8 @@ struct CPUArchState {
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
index e2d17b619877..bc093406a1d5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1403,6 +1403,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
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
@@ -3629,6 +3651,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
     [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
 
+    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",   any,    read_mcountinhibit,
+                                                       write_mcountinhibit },
+
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
     [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 2a437b29a1ce..87cd55bfd3a7 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -330,6 +330,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-- 
2.25.1


