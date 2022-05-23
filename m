Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntHpp-0004K3-D2
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 19:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpo-0004HZ-MW
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:36 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpn-0000O8-0h
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:36 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 oe17-20020a17090b395100b001df77d29587so612280pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 23 May 2022 16:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dq3AsKzhmTYW0tA0YoLO/eJ29e5Y/pkFqc/1LVLFraE=;
 b=3C34eaCyigYOkdD65FlDbvkYzpM9trPLaEqMfj0j3D3ooPHmSCpbNrjWDlt/rGZm1u
 me5aaFSKBtTCB1vAW9OUmNaQ3xcnFROdaqnRSP4/FuDPG3ZDYC4bqJZpuhVp4RTOicQQ
 TeMyn2DB8VAG8TMBlcQFLXessN/io7Q5tOx0yrs/Q4pu14gUzvmzZlchgqVUfulCulrp
 mUdykRRbrFYdzv3+ncM/0LtSwOyPkxVsMfVT9W8nvJvlsY4xpVk/kUU0pSeSr690/zgw
 A3b2zlz25MHAmaNA9FNBdsZEF1ueR1FiRNY7b1DBSuwioR9GLKBpw40yzjzSqQWyXMyZ
 tnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dq3AsKzhmTYW0tA0YoLO/eJ29e5Y/pkFqc/1LVLFraE=;
 b=PySBCi4HdKImrd8+tqIJYKM9AfTJFdlmdDd/bKFOImaZUV7AvGQ3y3gVaPY//C1yvL
 oEI/VcNcmRzuRptf8zH7Gic5PdIqGKnYXUYC+1fRoFLMCNUiLg1b6romdQTt/59t8p5E
 7qNIORw8IcOhWNIcOJhOl30t9SMnbXhppxhPxUmLmspDLeIeizaQDbNVjaKwu2O6zA1o
 pnzjTimnG6Nkw9GBAGQ0GjIfEN6vQJ54I++EK5A9aWq49EM5ANLzCjGmtaGzvuTbvv4b
 k4mV3rAcHZJGHzNduROUCrO4nuKG335NbGnTCm6QvuQOSxeBiwUb6oEo7es40+n/WvoW
 OB9A==
X-Gm-Message-State: AOAM531nB1A5SeFUqxWti+u0hN318eCrsxZUYaWcZ7YcKkIQgzT4mi6E
 9gknY7C6hKevzXNBjnlZo81/a2zArSv+xQ==
X-Google-Smtp-Source: ABdhPJwTvA0wBvRIRvoC+12HUAR4TZ1YHMbulwqAvB1SNKR97lwLm1GVa80DCvJGG1WHbxXlA04Ocg==
X-Received: by 2002:a17:90b:380f:b0:1e0:aa6:9e24 with SMTP id
 mq15-20020a17090b380f00b001e00aa69e24mr1511239pjb.232.1653349892632; 
 Mon, 23 May 2022 16:51:32 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 pl15-20020a17090b268f00b001df4b919937sm257084pjb.16.2022.05.23.16.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 16:51:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v9 05/12] target/riscv: Implement mcountinhibit CSR
Date: Mon, 23 May 2022 16:50:50 -0700
Message-Id: <20220523235057.123882-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523235057.123882-1-atishp@rivosinc.com>
References: <20220523235057.123882-1-atishp@rivosinc.com>
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
X-List-Received-Date: Mon, 23 May 2022 23:51:37 -0000

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
index 7cbcd8d62fc1..45ac0f2d2614 100644
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
index 4d04b20d064e..b3f7fa713000 100644
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
index 7e14f7685fb9..ea1cde68610c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1475,6 +1475,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
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
@@ -3741,6 +3763,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


