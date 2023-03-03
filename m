Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zV-0008MM-1k
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zJ-000895-Gg
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:01 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zH-0007nk-JZ
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:01 -0500
Received: by mail-pl1-x634.google.com with SMTP id p6so2053699plf.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832918;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0kQSpRL/F8639JcEBcyLWbpB+TpTlZt5SKgFo4+lBo=;
 b=KG+G/SDU8pbf5S8ALNdntgRYjJG1JQaT1GIVblIDdIBrMbbQzlZQyLVpq4tXYwv71K
 /n1NQsCDYM7Gl6Q5VsCobFTTHusNSn99xOhYbTGgIBXjvVwzWNl6SfX0b3YzeJ1QcEo3
 EuqwUPLaBfXOJ2HcgEFUxwCdEFCU6Jgu+H5fvl3SxeLPZhUuD73A0Kxjw0lG8iq9wagU
 tGilTqGZzi3LLLLYHKnEsVFjKT4nCYOUJnqkH+L+YLQJUcVjuSLYfWcg8Ideu9UQyaC2
 HOku3axy5ZmClumLp1f7h/8v5AXg+IVpFQA8osesHEntX7sKmQd7xiYWJu7wvcbT5+B7
 FIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832918;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0kQSpRL/F8639JcEBcyLWbpB+TpTlZt5SKgFo4+lBo=;
 b=qDoj/heRbbFWqTldlzvUxKzdszuD3tQ4AGDq931UVOmSI3HkCCniJwAKimc7qP7T48
 C9jWLAPUjbsJK8pSG35w2UPU4mrpnIim0bmOevTHKMObR3jQffrQF3VJpvSe1A9fiNVp
 y45Ur6MmJjCiyCQbGg1Lz+UvKYeG69OITAM0afsFnVRBzB5/GnIS0t5xpyQJKqJa+FGd
 tWy71NsyteGKgyTlX0uETBP7tiWBF4mbEoyQAxOF2ZOSl9bn7BvxfjmRqRaLfdCgagXW
 DhCapBaYJiiThM37U1B7vCYq/Hfi0HfztCnyOjv6ELHDk1JT0DtdUmIcJnqg9JNElzlh
 VPWw==
X-Gm-Message-State: AO0yUKUs1+B9HkjjylJ2abJFDfrJ4eXPkTck7kCKg8SN75NrBbOGwb6S
 kT/xB6e4VJpdy+kJbnlxD3p/TKshYUNZsk0m
X-Google-Smtp-Source: AK7set8cto3Imish7uUpye9lq04OTh2+jD7xG77Yfk/O7nnea47LmBCeRT2qJX2ycTU7sW0sB5ZwgQ==
X-Received: by 2002:a05:6a20:8c23:b0:bc:5a6:1b2a with SMTP id
 j35-20020a056a208c2300b000bc05a61b2amr1245249pzh.49.1677832918542; 
 Fri, 03 Mar 2023 00:41:58 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 s21-20020aa78295000000b0060c7f4f39b4sm1036701pfm.171.2023.03.03.00.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:58 -0800 (PST)
Subject: [PULL 30/59] target/riscv: Coding style fixes in csr.c
Date: Fri,  3 Mar 2023 00:37:11 -0800
Message-Id: <20230303083740.12817-31-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:01 -0000

From: Bin Meng <bmeng@tinylab.org>

Fix various places that violate QEMU coding style:

- correct multi-line comment format
- indent to opening parenthesis

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-7-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 62 ++++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cfd7ffc5c2..6a82628749 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -963,7 +963,7 @@ static RISCVException sstc_32(CPURISCVState *env, int csrno)
 }
 
 static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
-                                    target_ulong *val)
+                                     target_ulong *val)
 {
     *val = env->vstimecmp;
 
@@ -971,7 +971,7 @@ static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
-                                    target_ulong *val)
+                                      target_ulong *val)
 {
     *val = env->vstimecmp >> 32;
 
@@ -979,7 +979,7 @@ static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+                                      target_ulong val)
 {
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -996,7 +996,7 @@ static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+                                       target_ulong val)
 {
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -1020,7 +1020,7 @@ static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
-                                    target_ulong *val)
+                                     target_ulong *val)
 {
     if (riscv_cpu_virt_enabled(env)) {
         *val = env->vstimecmp >> 32;
@@ -1032,7 +1032,7 @@ static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+                                     target_ulong val)
 {
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -1055,7 +1055,7 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+                                      target_ulong val)
 {
     RISCVCPU *cpu = env_archcpu(env);
 
@@ -1342,7 +1342,8 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
 
     /* 'E' excludes all other extensions */
     if (val & RVE) {
-        /* when we support 'E' we can do "val = RVE;" however
+        /*
+         * when we support 'E' we can do "val = RVE;" however
          * for now we just drop writes if 'E' is present.
          */
         return RISCV_EXCP_NONE;
@@ -1361,7 +1362,8 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         val &= ~RVD;
     }
 
-    /* Suppress 'C' if next instruction is not aligned
+    /*
+     * Suppress 'C' if next instruction is not aligned
      * TODO: this should check next_pc
      */
     if ((val & RVC) && (GETPC() & ~3) != 0) {
@@ -1830,28 +1832,28 @@ static RISCVException write_mscratch(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_mepc(CPURISCVState *env, int csrno,
-                                     target_ulong *val)
+                                target_ulong *val)
 {
     *val = env->mepc;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_mepc(CPURISCVState *env, int csrno,
-                                     target_ulong val)
+                                 target_ulong val)
 {
     env->mepc = val;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_mcause(CPURISCVState *env, int csrno,
-                                     target_ulong *val)
+                                  target_ulong *val)
 {
     *val = env->mcause;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_mcause(CPURISCVState *env, int csrno,
-                                     target_ulong val)
+                                   target_ulong val)
 {
     env->mcause = val;
     return RISCV_EXCP_NONE;
@@ -1873,14 +1875,14 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
 
 /* Execution environment configuration setup */
 static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                   target_ulong *val)
 {
     *val = env->menvcfg;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                    target_ulong val)
 {
     uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
 
@@ -1893,14 +1895,14 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                    target_ulong *val)
 {
     *val = env->menvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                     target_ulong val)
 {
     uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
@@ -1911,7 +1913,7 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                   target_ulong *val)
 {
     RISCVException ret;
 
@@ -1925,7 +1927,7 @@ static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                    target_ulong val)
 {
     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
     RISCVException ret;
@@ -1940,7 +1942,7 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                   target_ulong *val)
 {
     RISCVException ret;
 
@@ -1954,7 +1956,7 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                    target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
     RISCVException ret;
@@ -1974,7 +1976,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
-                                 target_ulong *val)
+                                    target_ulong *val)
 {
     RISCVException ret;
 
@@ -1988,7 +1990,7 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+                                     target_ulong val)
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
@@ -2031,13 +2033,13 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_mstateen_1_3(CPURISCVState *env, int csrno,
-                                      target_ulong new_val)
+                                         target_ulong new_val)
 {
     return write_mstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
 }
 
 static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
-                                      target_ulong *val)
+                                     target_ulong *val)
 {
     *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
 
@@ -2058,7 +2060,7 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
-                                      target_ulong new_val)
+                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
@@ -2066,7 +2068,7 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_mstateenh_1_3(CPURISCVState *env, int csrno,
-                                      target_ulong new_val)
+                                          target_ulong new_val)
 {
     return write_mstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
 }
@@ -2103,7 +2105,7 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_hstateen_1_3(CPURISCVState *env, int csrno,
-                                      target_ulong new_val)
+                                         target_ulong new_val)
 {
     return write_hstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
 }
@@ -2142,7 +2144,7 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_hstateenh_1_3(CPURISCVState *env, int csrno,
-                                       target_ulong new_val)
+                                          target_ulong new_val)
 {
     return write_hstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
 }
@@ -3335,7 +3337,7 @@ static RISCVException read_mseccfg(CPURISCVState *env, int csrno,
 }
 
 static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
-                         target_ulong val)
+                                    target_ulong val)
 {
     mseccfg_csr_write(env, val);
     return RISCV_EXCP_NONE;
-- 
2.39.2


