Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5em1-0001oy-OS
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 21:14:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRo-0001bu-3r
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:49:36 -0500
Received: from [2607:f8b0:4864:20::22a] (port=38482
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRl-0003YV-EX
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:49:34 -0500
Received: by mail-oi1-x22a.google.com with SMTP id s73so6159236oie.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Jan 2022 16:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OHcEqbEMZFsECN3bk5bVRgpiQ6HgzLUfEvGG9C9v8II=;
 b=4DdaBQx3cmOaXCeKV9DV/OYwkRfoVJCDoJYGaJg2bmArs2D5xkLzXHAfM481OFWgGp
 hWLYpJo1wJV6DCow7XXDzp0sNjg9zTFjGlULKh3qvVveIzp+ID6jwIQRte7C9UM6O1TE
 KvRev61onqFKOQhRltpptZK7lpSgu85P2Nt4/s6/bXk0BQW6fLQ+oK6TCSQKSyozhr0l
 XQYxxpzXq0AR8HyZktV17vQjusbfZw8rZDw2dUnbqFgt0DKMv/Q1dPXeBKndmVLMgruX
 qqKO4pIkJs333nZBZWA8NDtEmJ3hG3lTeJ3CrFZ4LEIFK+8Shn41JqQvXp19N5XqAqqD
 qieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OHcEqbEMZFsECN3bk5bVRgpiQ6HgzLUfEvGG9C9v8II=;
 b=wdS+48FnQLV9HJpjSFkZqC9mXW2j93r/ujcGjM/+jWsd7+bdYJ2A8S5EwIFIgzvKbG
 J42QXv07KivPM8lNVGJRlKRV7j1oL57Zh/4pYSMZD5z7PXEFKjqxw4zWZtRXawxuGPXz
 J0RFteVP9gHnqymtKv88fdXGzLMtI90euZxLz2FZUhtUnhh9JJnhPBEVTe1/YR9AzYii
 B2wyxEjan7FIf5TPEyAHt3K4Z1YPjpeKnrZovOJ1hRfb7lJ0BTo7dJYGMfiphtES9Rcw
 HhjCJrvSK7cbxBtKPKhcNwv6z5eCjac6V6SWTcScNaoPpQ0uBGCCxezrF6GBLiRXBIDO
 R/Yg==
X-Gm-Message-State: AOAM532K1+XIJ06EWe2ooCsuNac+Qm8CBRkwjsIhf7k7A3P8G+o2nQuD
 ywf02BeYucVJTWsCnGDCX9b3eg==
X-Google-Smtp-Source: ABdhPJynhM1YzcWKGE9GD8f3VQtYFHekeYx4wCtEvllZ1rrqQthI1vX565h21ccemVsJ5WwrD8yp8w==
X-Received: by 2002:a05:6808:2201:: with SMTP id
 bd1mr8165418oib.56.1641516572447; 
 Thu, 06 Jan 2022 16:49:32 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id e4sm678441oiy.12.2022.01.06.16.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:49:32 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v4 05/11] target/riscv: Implement mcountinhibit CSR
Date: Thu,  6 Jan 2022 16:48:40 -0800
Message-Id: <20220107004846.378859-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107004846.378859-1-atishp@rivosinc.com>
References: <20220107004846.378859-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Fri, 07 Jan 2022 00:49:36 -0000

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
index b353770596e8..6f2875fd9acd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -222,6 +222,8 @@ struct CPURISCVState {
     target_ulong scounteren;
     target_ulong mcounteren;
 
+    target_ulong mcountinhibit;
+
     target_ulong sscratch;
     target_ulong mscratch;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 1e31f4d35f5b..dbd9ce9a85a3 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -283,6 +283,10 @@
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
index e31c27e270a2..89d15b38be7c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -834,6 +834,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
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
@@ -2120,6 +2142,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
     [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
 
+    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",   any,    read_mcountinhibit,
+                                                       write_mcountinhibit },
+
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
     [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ad8248ebfda8..ea4a382c140a 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -205,6 +205,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-- 
2.30.2


