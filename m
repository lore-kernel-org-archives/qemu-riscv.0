Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86652E65D19
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 03:24:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEKFf-0005VU-1S; Thu, 21 Nov 2024 22:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFe-0005Uk-8H
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:34 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFc-0003wh-B4
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:33 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2124ccf03edso16278985ad.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 19:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732245751; x=1732850551; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5dz25xLBEpscPUFsdwI6ZdGbDCjYWaBqQIsk/OC0sI=;
 b=YCPOTccKG4fCh5DtoSzE3vHMtnSw4cNd1mBioygJBq6QCMlbvQsvCDHo60JAZJABmx
 kdJwC8UjuAuh2MyU7UKmKy7xUBaNcQetsgGYifmPHrEwXDpQQaObNh/IZtllr7uWh99n
 MDQW/2/yMOcoB5ZDJesdmb4tIPQNs+9S0D04blu6s0rogSZtu0rtD+RYpKKxqt0oFG9r
 YeLC3D8rB75SJj1Bb5MirzHdIyKk+EWH3QPfiwgu2Lpez4XXWgrDNGoM0SnRKHDGxEAg
 YjENB1z+r6y7rWS7cdLzGMrfsMxr63bt4BMPGFhBqRMfLvjXqAsx357FALRzjnm383QJ
 h/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732245751; x=1732850551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5dz25xLBEpscPUFsdwI6ZdGbDCjYWaBqQIsk/OC0sI=;
 b=iSM5W0JsyyX1FqK5OHGSkE4VjFoqzWaRjQz5OvPaYhDM42RjW9ahV1LW5XNTlLh9N0
 tz9SXIVXMu3xq5AoWdX+Q4nr0PBHJG4V29zz1lmWUoFX+pUaLnuLV1Cmbu6mxUWxRJ/O
 4vQKbiMPNZIxzTU8Mi1VRWEp20ePK+eAsZiR+f1kwlBzn9ZWGU1539Jwx0565Il6WtYG
 9X6Q6KWH4RHoOKlGGyMqI0ETSnmN9jV1E1Vgyv4Is2MjaOJhIT6z9DS1G3EferKbX/aL
 za4g+DSnv15YuQvWGILinQfzp5FU8frWqxpJr/LP0rnrlGvZ1up6dWrvh6tiryLUrbjb
 /7vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCwjt15Vs7MzY7lyLIXtLYwQJIL2g/CncvPC8b2kioIf5Y43Kx8EYbDIQIbNwVpodBSewOqeQkvs2Q@nongnu.org
X-Gm-Message-State: AOJu0Yy4SQQHD2SRsGC84kZiSmQ4UAUz2Lk8kkC6mEmWOq56eFwNwPW0
 9YQSMz9aoiBlQncw+85XkR7d6haUsarT+gklGCaHdZCwsWATsz5mKcJsEshF7O4=
X-Gm-Gg: ASbGncuJzoLGEJGG8/XkNRT7fcYCPw/3xBfbEVcCUbjBgA/wIaFjHxwehcwQJcQsId/
 sxWo0rGj2q20pB5jvlPLi9o+T/Ve+xGHP/uXYEP/U7zK3W7O5F5eZxlEU0jLVUv5aPcs5BLBlah
 flb138nqrZ6njR0OIkuMbMw7AmlTpPvJqO50qH6tSnrawnZdMOpOX+YjXaYALXdEifrfGZS0bKJ
 NN6DME5KMYQShiNl5HYZtQUlAXEUdNOsdvbkLqZfXqSwQDNv5oXqT6NBiEnCvF1L5wuMimVpfNW
 AYmFNA==
X-Google-Smtp-Source: AGHT+IFdtxnVWwp1P7K81MudpUg34Yz++DiRVsHh96tjlIQYkHhO9QY3DDf08Er6V00Coz7P8yHRWA==
X-Received: by 2002:a17:902:e54f:b0:212:3f36:d985 with SMTP id
 d9443c01a7336-2129f82ea85mr17392975ad.53.1732245751038; 
 Thu, 21 Nov 2024 19:22:31 -0800 (PST)
Received: from fchang-1826.internal.sifive.com ([136.226.240.187])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc157f3sm5506905ad.203.2024.11.21.19.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 19:22:30 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Tommy Wu <tommy.wu@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v9 2/6] target/riscv: Add Smrnmi CSRs
Date: Fri, 22 Nov 2024 11:22:13 +0800
Message-Id: <20241122032217.3816540-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122032217.3816540-1-frank.chang@sifive.com>
References: <20241122032217.3816540-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Tommy Wu <tommy.wu@sifive.com>

The Smrnmi extension adds the 'mnscratch', 'mnepc', 'mncause',
'mnstatus' CSRs.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c      |  5 +++
 target/riscv/cpu.h      |  7 ++++
 target/riscv/cpu_bits.h | 11 ++++++
 target/riscv/csr.c      | 82 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f219f0c3b5..c404828ca0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1029,6 +1029,11 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
         riscv_trigger_reset_hold(env);
     }
 
+    if (cpu->cfg.ext_smrnmi) {
+        env->rnmip = 0;
+        env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
+    }
+
     if (kvm_enabled()) {
         kvm_riscv_reset_vcpu(cpu);
     }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 284b112821..a2cb471b3c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -486,6 +486,13 @@ struct CPUArchState {
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
 #endif /* CONFIG_KVM */
+
+    /* RNMI */
+    target_ulong mnscratch;
+    target_ulong mnepc;
+    target_ulong mncause; /* mncause without bit XLEN-1 set to 1 */
+    target_ulong mnstatus;
+    target_ulong rnmip;
 };
 
 /*
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 385a2c67c2..e69cf4f394 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -353,6 +353,12 @@
 #define CSR_PMPADDR14       0x3be
 #define CSR_PMPADDR15       0x3bf
 
+/* RNMI */
+#define CSR_MNSCRATCH       0x740
+#define CSR_MNEPC           0x741
+#define CSR_MNCAUSE         0x742
+#define CSR_MNSTATUS        0x744
+
 /* Debug/Trace Registers (shared with Debug Mode) */
 #define CSR_TSELECT         0x7a0
 #define CSR_TDATA1          0x7a1
@@ -633,6 +639,11 @@ typedef enum {
 #define SATP64_ASID         0x0FFFF00000000000ULL
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
 
+/* RNMI mnstatus CSR mask */
+#define MNSTATUS_NMIE       0x00000008
+#define MNSTATUS_MNPV       0x00000080
+#define MNSTATUS_MNPP       0x00001800
+
 /* VM modes (satp.mode) privileged ISA 1.10 */
 #define VM_1_10_MBARE       0
 #define VM_1_10_SV32        1
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9846770820..5d8d0d7514 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -597,6 +597,17 @@ static RISCVException debug(CPURISCVState *env, int csrno)
 
     return RISCV_EXCP_ILLEGAL_INST;
 }
+
+static RISCVException rnmi(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (cpu->cfg.ext_smrnmi) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
 #endif
 
 static RISCVException seed(CPURISCVState *env, int csrno)
@@ -4647,6 +4658,67 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mnscratch(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
+{
+    *val = env->mnscratch;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mnscratch(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnscratch = val;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_mnepc(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnepc;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mnepc(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnepc = val;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_mncause(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mncause;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mncause(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mncause = val;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_mnstatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnstatus;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mnstatus(CPURISCVState *env, int csrno, target_ulong val)
+{
+    target_ulong mask = (MNSTATUS_NMIE | MNSTATUS_MNPP);
+
+    if (riscv_has_ext(env, RVH)) {
+        /* Flush tlb on mnstatus fields that affect VM. */
+        if ((val ^ env->mnstatus) & MNSTATUS_MNPV) {
+            tlb_flush(env_cpu(env));
+        }
+
+        mask |= MNSTATUS_MNPV;
+    }
+
+    /* mnstatus.mnie can only be cleared by hardware. */
+    env->mnstatus = (env->mnstatus & MNSTATUS_NMIE) | (val & mask);
+    return RISCV_EXCP_NONE;
+}
+
 #endif
 
 /* Crypto Extension */
@@ -5154,6 +5226,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                         write_sstateen_1_3,
                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
+    /* RNMI */
+    [CSR_MNSCRATCH] = { "mnscratch", rnmi, read_mnscratch, write_mnscratch,
+                        .min_priv_ver = PRIV_VERSION_1_12_0               },
+    [CSR_MNEPC]     = { "mnepc",     rnmi, read_mnepc,     write_mnepc,
+                        .min_priv_ver = PRIV_VERSION_1_12_0               },
+    [CSR_MNCAUSE]   = { "mncause",   rnmi, read_mncause,   write_mncause,
+                        .min_priv_ver = PRIV_VERSION_1_12_0               },
+    [CSR_MNSTATUS]  = { "mnstatus",  rnmi, read_mnstatus,  write_mnstatus,
+                        .min_priv_ver = PRIV_VERSION_1_12_0               },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus,
                          NULL,                read_sstatus_i128              },
-- 
2.34.1


