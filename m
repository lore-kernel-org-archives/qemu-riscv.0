Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zv-0001Q5-4J
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zk-0000EF-0Q
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:28 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zi-00087i-3R
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:27 -0500
Received: by mail-pf1-x432.google.com with SMTP id ay18so1095200pfb.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832944;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5m2PUYsFAY3FX5JhuJCzoKPCRU6d188hHgGxLD/laJI=;
 b=nhf/5s+myYaLMgZbWaXTsTdJTllY1FCYFj1uZ8e6KuUf9Wq+GtQ/+i7Nz527lhzacH
 BpKsR7bR0siaUr4a8iYpO5taQi5O0+kx3PHD0kBCRqY2N9jwCQWqKUBbBQM7ZbVo1I5I
 5tV3Fw6b0U9c9ITpgdd4J/YFFcETT5Yhj7eCTTT0yGwg2gmErCbBcNAA/QmNTYi/rFWZ
 LImwanIKnNK1xbe7NGGLZ3xHTf8EfPstjnoG85ZRCiOuC6gyQf3OOT2RCJloD/bcS9R+
 e5f8vCjmCYJKH7NuBjO3jAAZHr01IPZ93M9qQJgOQ2VncJplUvqiQfbUlge5l+tbWpzj
 wHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832944;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5m2PUYsFAY3FX5JhuJCzoKPCRU6d188hHgGxLD/laJI=;
 b=H0lo7BdYj6nUk4o7q9tZYHDUTOvhlLGsCAZ2zvE3T7PJDyT+KGdfxkGm92bbiMkIDa
 RSePMLJ5SHY7BdIrkTqUk/B5XOvErK3kYr83in0BSQ+Hd0/3ZTpLetgBd9SAxp2bxxEE
 bW/jrbynG3D64JG6UI2liTL8yvRwM6cDfQMKmWsVRDIdB6g7kcnTgs6PDdv7tYPmtAMI
 UCzFhXv2pZLxTEkswUGS6aUpOmGCLc2WX7gCRfMaBaB9TqMOVln0As0/5BVXa01WWjZ8
 BakheFajdWcnR7Q82m8NOz202nLPGa5dWWucsAzD2vrY7PDip0zZ10NHfgJcqwYERZex
 i/5w==
X-Gm-Message-State: AO0yUKVV4quKxHnYzTXbndVFihe9OTo5OR9V2OLUmjJLTy+aEiNx6a0q
 MsnEC3glf4yeX5gYYogUd+/kSI8QqOSqbm1b
X-Google-Smtp-Source: AK7set9MGRj/+RwCy0oNoz1f5sSPCuAwPG0YXKDf0DpeoKpab3me/go0x3NTm1wAxORiavrrUJG79g==
X-Received: by 2002:aa7:9f1a:0:b0:5a8:ae60:eb4a with SMTP id
 g26-20020aa79f1a000000b005a8ae60eb4amr1206329pfr.28.1677832944362; 
 Fri, 03 Mar 2023 00:42:24 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 r9-20020a62e409000000b005a54a978c1bsm1042607pfh.7.2023.03.03.00.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:23 -0800 (PST)
Subject: [PULL 50/59] target/riscv: Add csr support for svadu
Date: Fri,  3 Mar 2023 00:37:31 -0800
Message-Id: <20230303083740.12817-51-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:28 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add ext_svadu property
Add HADE field in *envcfg:
* menvcfg.HADE is read-only zero if Svadu is not implemented.
* henvcfg.HADE is read-only zero if menvcfg.HADE is zero.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230224040852.37109-4-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.h      |  1 +
 target/riscv/cpu_bits.h |  4 ++++
 target/riscv/csr.c      | 17 +++++++++++------
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 31537fc05f..3991eab5e5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -450,6 +450,7 @@ struct RISCVCPUConfig {
     bool ext_zihintpause;
     bool ext_smstateen;
     bool ext_sstc;
+    bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8b0d7e20ea..fca7ef0cef 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -747,10 +747,12 @@ typedef enum RISCVException {
 #define MENVCFG_CBIE                       (3UL << 4)
 #define MENVCFG_CBCFE                      BIT(6)
 #define MENVCFG_CBZE                       BIT(7)
+#define MENVCFG_HADE                       (1ULL << 61)
 #define MENVCFG_PBMTE                      (1ULL << 62)
 #define MENVCFG_STCE                       (1ULL << 63)
 
 /* For RV32 */
+#define MENVCFGH_HADE                      BIT(29)
 #define MENVCFGH_PBMTE                     BIT(30)
 #define MENVCFGH_STCE                      BIT(31)
 
@@ -763,10 +765,12 @@ typedef enum RISCVException {
 #define HENVCFG_CBIE                       MENVCFG_CBIE
 #define HENVCFG_CBCFE                      MENVCFG_CBCFE
 #define HENVCFG_CBZE                       MENVCFG_CBZE
+#define HENVCFG_HADE                       MENVCFG_HADE
 #define HENVCFG_PBMTE                      MENVCFG_PBMTE
 #define HENVCFG_STCE                       MENVCFG_STCE
 
 /* For RV32 */
+#define HENVCFGH_HADE                       MENVCFGH_HADE
 #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
 #define HENVCFGH_STCE                       MENVCFGH_STCE
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b86c1aa6fa..be71c50f09 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1890,7 +1890,8 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
-                (cfg->ext_sstc ? MENVCFG_STCE : 0);
+                (cfg->ext_sstc ? MENVCFG_STCE : 0) |
+                (cfg->ext_svadu ? MENVCFG_HADE : 0);
     }
     env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
 
@@ -1909,7 +1910,8 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 {
     RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
     uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
-                    (cfg->ext_sstc ? MENVCFG_STCE : 0);
+                    (cfg->ext_sstc ? MENVCFG_STCE : 0) |
+                    (cfg->ext_svadu ? MENVCFG_HADE : 0);
     uint64_t valh = (uint64_t)val << 32;
 
     env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
@@ -1959,8 +1961,10 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
     /*
      * henvcfg.pbmte is read_only 0 when menvcfg.pbmte = 0
      * henvcfg.stce is read_only 0 when menvcfg.stce = 0
+     * henvcfg.hade is read_only 0 when menvcfg.hade = 0
      */
-    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) | env->menvcfg);
+    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE) |
+                           env->menvcfg);
     return RISCV_EXCP_NONE;
 }
 
@@ -1976,7 +1980,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
     }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
-        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
+        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE);
     }
 
     env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
@@ -1994,7 +1998,7 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) |
+    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HADE) |
                             env->menvcfg)) >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -2002,7 +2006,8 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
 static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
+    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE |
+                                    HENVCFG_HADE);
     uint64_t valh = (uint64_t)val << 32;
     RISCVException ret;
 
-- 
2.39.2


