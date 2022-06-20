Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3QdF-00019p-35
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 19:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd5-00011h-Bh
 for qemu-riscv@nongnu.org; Mon, 20 Jun 2022 19:16:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd1-0006Rc-Vy
 for qemu-riscv@nongnu.org; Mon, 20 Jun 2022 19:16:22 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r66so5549036pgr.2
 for <qemu-riscv@nongnu.org>; Mon, 20 Jun 2022 16:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/5xZ4kX4iVL92BGb5ChzIDMpHJo0nazCLQsvRO2DD/w=;
 b=EF3Eb71Tg69Qb5sIep2kKwyEOcObJ6vJuWUsEg9VTyH0atvpNWa3j3XjbPPSG00/YC
 sRDVF4AQnFtzUwxieJ4sbFglp7wnd73nMMrpM7ziq3MH+sn/lsOXqK6hF/qK4wrU3ijP
 Hab+PLft15bmZGy/vZ7ZbVyEpj7pd3+gqb/z4JCbzqLBq3nfLqxmhncE+qeNEDb6EYS7
 xz2KedH6JtH//lgjux4YL4G7nzMg4SiQHlfyzV1isuXUu7gpim/tcqTidBKCoeYdKxm9
 xF7MFs9BflAmXoIkdfHLwkp0Rx6s1lAWLAPbvFHSq7V824SCzqjYdec9QANJk5hyqrhg
 OQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/5xZ4kX4iVL92BGb5ChzIDMpHJo0nazCLQsvRO2DD/w=;
 b=avMqt+ECVIpFOUlIaiBDtwf4KdLfBQbvualGpjWsxT7bO0K9eqaYRUGZG2TYIWDzfz
 xafExKym2AJkB2aurGbzHug2+4Ie+oLraGcC969elYbt8QX0A7uvnFYI2vXKLjBIrR9O
 uCYzBb2rDIllO4EvpsnEuFmjd1EBpKcLdGuU7paxwMDs3kXqlmKCc6yfktLj8h2cZAkR
 +IFZo45TX8w4VhTs+yQ0K6zDmELmhiEqgNVlOI+qlSPzzklkgo75kcH2CTBBFjeuvH6Z
 cwnZ+h6A2wyRHGNfzR83afMsb/U1F3cVAs3xKBUb6ofhmCiaSpQkLimWrqfPDvYnQTcO
 Ajag==
X-Gm-Message-State: AJIora8+rTAhSfQbgie21HXtliWg3B0HUmJWUFk+5jBhhTKZgAa840T+
 paYe8SBoiyMhFQw/h+gb6rldCQ==
X-Google-Smtp-Source: AGRyM1uL5wrErCx0G3BA+rWAgUxHsQcTBz0FVmskW44jbSqtH7C2tPKU8j6oNT7kxQp1HKKOX3OYLA==
X-Received: by 2002:aa7:9885:0:b0:525:2b50:a423 with SMTP id
 r5-20020aa79885000000b005252b50a423mr4358677pfl.14.1655766979313; 
 Mon, 20 Jun 2022 16:16:19 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902a40200b0015e8d4eb285sm9191008plq.207.2022.06.20.16.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 16:16:18 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
Subject: [PATCH v10 05/12] target/riscv: Implement mcountinhibit CSR
Date: Mon, 20 Jun 2022 16:15:55 -0700
Message-Id: <20220620231603.2547260-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620231603.2547260-1-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52f.google.com
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
index ffee54ea5c27..0a916db9f614 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -275,6 +275,8 @@ struct CPUArchState {
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
index b4a8e15f498f..94d39a4ce1c5 100644
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
@@ -3745,6 +3767,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


