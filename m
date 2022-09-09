Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWeHI-0007QW-Ls
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 09:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHG-0007Ky-If; Fri, 09 Sep 2022 09:42:38 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHE-0003Hz-SA; Fri, 09 Sep 2022 09:42:38 -0400
Received: by mail-pj1-x102a.google.com with SMTP id o23so281937pji.4;
 Fri, 09 Sep 2022 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Hce6YOD4G6yJWscv75mJR41gbJvGcOpIieu8G2xuK+g=;
 b=m/Yg5NgtMvqsXciQ04wCBpZnV5gMHMt+o/DGAmqLU3boVlPVMFFfKas+U/f2B0hEOO
 G1LjAfdyiL1wn94YUprINtEW4za3ncrPmgMrq4zYp/CG07irnVKsBnNvdoX4FNe/bUKd
 RZp9noNBDaW5PosMv4kyESpLiHZghiV/mQ0oYUpOfv3XSWXykmd/3xWLHCBqbT/2W/9z
 PxmiKxKt91FjLuApbzjdO/kfry/zwAGhY5TT5UEAK9U4CrrfD5HYOLIEK1tuErnAa7T6
 LWroAdd5xrp+lM9Yu9d5UqAeavmTgKG81lhmj8I6IBAE1wLTEyu5m/3lZHANIZIlRKOF
 2gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Hce6YOD4G6yJWscv75mJR41gbJvGcOpIieu8G2xuK+g=;
 b=m+hyGoEtkv0dPq6FNfWBUW3PrEuyTqGHMxGEQqUpUB+HwI5hSyF6981C28MkWimFsR
 s9+ffqDInz5nHTUyPMurFdqUqg2yAWspmkCUhXbvUKkPGBfZIkr7l2DcC3Z8FC8X3rjM
 xpdzlphffokNNQPFq8L19Z52dHvJZxjsOMJNf7qX+LlAVK0oZmfqGdnjD3KYytVzVXjz
 YpI53XttgL7+w1EGdDrWfO8gSFTPUCXntF9n/Q8YeqKGBRTfbMoFiI/v3/ZOTcHYWva0
 H2FEgidVEz0pD5ONnn404EPZqHNZBg1O1fJQJX1eOHx9LIiCfkwWPL3GfLJbw92k9iT8
 RVeQ==
X-Gm-Message-State: ACgBeo0VykbIbiTgKkRHOPwtIBtvEeYk+1EJuBwvRNfZwWbeNsI5laRO
 jWmN1uF47cDrUQnQPspqyMlrZjuGZ34=
X-Google-Smtp-Source: AA6agR5VhZYek0aINrlgBVOhp5m4cEWXymU9oir8PQ8Zs+Ht8Mxut8s2054dVm2vTEWiKzncpi11gg==
X-Received: by 2002:a17:903:24c:b0:172:7090:64a4 with SMTP id
 j12-20020a170903024c00b00172709064a4mr13724759plh.124.1662730954955; 
 Fri, 09 Sep 2022 06:42:34 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6306cd000000b0042a4612c07esm513172pgg.39.2022.09.09.06.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:42:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 5/8] target/riscv: debug: Introduce tinfo CSR
Date: Fri,  9 Sep 2022 21:42:12 +0800
Message-Id: <20220909134215.1843865-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909134215.1843865-1-bmeng.cn@gmail.com>
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Sep 2022 13:42:39 -0000

From: Frank Chang <frank.chang@sifive.com>

tinfo.info:
  One bit for each possible type enumerated in tdata1.
  If the bit is set, then that type is supported by the currently
  selected trigger.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 target/riscv/cpu_bits.h |  1 +
 target/riscv/debug.h    |  2 ++
 target/riscv/csr.c      |  8 ++++++++
 target/riscv/debug.c    | 10 +++++++---
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7be12cac2e..1972aee3bb 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -321,6 +321,7 @@
 #define CSR_TDATA1          0x7a1
 #define CSR_TDATA2          0x7a2
 #define CSR_TDATA3          0x7a3
+#define CSR_TINFO           0x7a4
 
 /* Debug Mode Registers */
 #define CSR_DCSR            0x7b0
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 76146f373a..9f69c64591 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -95,6 +95,8 @@ void tselect_csr_write(CPURISCVState *env, target_ulong val);
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
 
+target_ulong tinfo_csr_read(CPURISCVState *env);
+
 void riscv_cpu_debug_excp_handler(CPUState *cs);
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3d0d8e0340..e66019048d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3089,6 +3089,13 @@ static RISCVException write_tdata(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_tinfo(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = tinfo_csr_read(env);
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * Functions to access Pointer Masking feature registers
  * We have to check if current priv lvl could modify
@@ -3893,6 +3900,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
     [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
     [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
+    [CSR_TINFO]     =  { "tinfo",   debug, read_tinfo,   write_ignore  },
 
     /* User Pointer Masking */
     [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,  write_umte },
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index d6666164cd..7d546ace42 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -37,9 +37,7 @@
  * - tdata1
  * - tdata2
  * - tdata3
- *
- * We don't support writable 'type' field in the tdata1 register, so there is
- * no need to implement the "tinfo" CSR.
+ * - tinfo
  *
  * The following triggers are implemented:
  *
@@ -372,6 +370,12 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
     }
 }
 
+target_ulong tinfo_csr_read(CPURISCVState *env)
+{
+    /* assume all triggers support the same types of triggers */
+    return BIT(TRIGGER_TYPE_AD_MATCH);
+}
+
 void riscv_cpu_debug_excp_handler(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-- 
2.34.1


