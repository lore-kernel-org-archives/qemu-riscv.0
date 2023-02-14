Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRwHI-0001Uw-Dh
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 09:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pRwHH-0001UO-1I; Tue, 14 Feb 2023 09:27:27 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pRwHF-0003SK-AX; Tue, 14 Feb 2023 09:27:26 -0500
Received: by mail-pj1-x1036.google.com with SMTP id bx22so15250705pjb.3;
 Tue, 14 Feb 2023 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dLbXMsDEqCXQNQVDFhpatbYKsJzSr77aU36NNtRbtU=;
 b=miFthHyQNir+c4HqpNYeuSh5riXN5ZDcg0BwtYgQZJFIr20+9vxXu4emKS3D/DfAh1
 SQ9I+H683BSeizRLAHco/p2hNcpjTJ6R7tT4f6j5LOrIZu80yfkWUefUjKVJ8Lqqm6ze
 cDUEEo8FtDHzhXIAO0MjKxw4TcY0dIRiEoUmJMimXiHWlruU6DZDMUscoR8a4/R/BGcc
 epU1QBmclGvxc6qi35+bgPIOFyuOhbi5H43HrQPhiWK8PJFhti86wZ8crmWMlLs0b+6E
 0ypQx2UctCCbGG58ryLdjhTv3TUAZNKro78ImnXrkRJ+Mv+t72D8bdbQ0tzEYPwpEBRa
 UIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0dLbXMsDEqCXQNQVDFhpatbYKsJzSr77aU36NNtRbtU=;
 b=h819Y22JaxEAAJ3FULE07cH91ADDxZkvpXI0ieCs/VnP9oOfWEwAho4MPBDJWWL2B3
 pBroelM71BNjPCPp265XFt2uikcTSvS5EBBwN0BvvoYG74aj7At1niPttPA/7xD7xLE0
 nXtEJlgOHGhChHP9mgYaKXHcCHAfG7ecCloSngcgqJRCysb7jqe0tdz/fmjGgxJm+Y67
 Otyq3KpAxCZ9DDTvfvZgEQL76Cwsqk9+mviFZwduUUgq3k4bqeJQtA8TAXfqCLfiHtWN
 n2W1y+GkVIh1aOwwps9z34TsPyNnbrtnqQyAyZmEI41NeQinJpCX41Sx8I2yNidCgc7c
 693w==
X-Gm-Message-State: AO0yUKVXvTqfFDDQLa1zzrSh8Hz8Q09JtRtQcgy/3K2YBn+pBFuw5S8R
 CbS+6bA3XsPGFIxMk6qwNmNhxJGG+sk=
X-Google-Smtp-Source: AK7set+vMyq4ODaI6NaDgr8g5iCOWSPNfbvRh9qahsKQ9PCtMiEeQRK/8U0FqMKFDbQNUOOM0VOEtQ==
X-Received: by 2002:a05:6a20:a10f:b0:bf:ca3:6896 with SMTP id
 q15-20020a056a20a10f00b000bf0ca36896mr2889622pzk.2.1676384843109; 
 Tue, 14 Feb 2023 06:27:23 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a639e1a000000b004f1cb6ffe81sm8799108pgd.64.2023.02.14.06.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 06:27:22 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 18/18] target/riscv: Move configuration check to envcfg CSRs
 predicate()
Date: Tue, 14 Feb 2023 22:27:17 +0800
Message-Id: <20230213180215.1524938-19-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 14 Feb 2023 14:27:27 -0000

At present the envcfg CSRs predicate() routines are generic one like
smode(), hmode. The configuration check is done in the read / write
routine. Create a new predicate routine to cover such check, so that
gdbstub can correctly report its existence.

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

 target/riscv/csr.c | 98 +++++++++++++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 37 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 37350b8a6d..284ccc09dd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -41,40 +41,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
-#if !defined(CONFIG_USER_ONLY)
-static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
-                                       uint64_t bit)
-{
-    bool virt = riscv_cpu_virt_enabled(env);
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
-        return RISCV_EXCP_NONE;
-    }
-
-    if (!(env->mstateen[index] & bit)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    if (virt) {
-        if (!(env->hstateen[index] & bit)) {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
-
-        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
-    }
-
-    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
-        if (!(env->sstateen[index] & bit)) {
-            return RISCV_EXCP_ILLEGAL_INST;
-        }
-    }
-
-    return RISCV_EXCP_NONE;
-}
-#endif
 
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
@@ -318,6 +284,32 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
     return umode(env, csrno);
 }
 
+static RISCVException envcfg(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    riscv_csr_predicate_fn predicate;
+
+    if (cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    switch (csrno) {
+    case CSR_SENVCFG:
+        predicate = smode;
+        break;
+    case CSR_HENVCFG:
+        predicate = hmode;
+        break;
+    case CSR_HENVCFGH:
+        predicate = hmode32;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return predicate(env, csrno);
+}
+
 static RISCVException mstateen(CPURISCVState *env, int csrno)
 {
     RISCVCPU *cpu = env_archcpu(env);
@@ -1946,6 +1938,38 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
+                                       uint64_t bit)
+{
+    bool virt = riscv_cpu_virt_enabled(env);
+
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(env->mstateen[index] & bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (virt) {
+        if (!(env->hstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+
+        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
+        if (!(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -4087,11 +4111,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
     [CSR_MENVCFGH] = { "menvcfgh", umode32, read_menvcfgh, write_menvcfgh,
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
-    [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
+    [CSR_SENVCFG]  = { "senvcfg",  envcfg, read_senvcfg,  write_senvcfg,
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
-    [CSR_HENVCFG]  = { "henvcfg",  hmode, read_henvcfg, write_henvcfg,
+    [CSR_HENVCFG]  = { "henvcfg",  envcfg, read_henvcfg,  write_henvcfg,
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
-    [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
+    [CSR_HENVCFGH] = { "henvcfgh", envcfg, read_henvcfgh, write_henvcfgh,
                        .min_priv_ver = PRIV_VERSION_1_12_0              },
 
     /* Smstateen extension CSRs */
-- 
2.25.1


