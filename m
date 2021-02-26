Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTfh-0006TL-UQ
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfg-0006Pq-5B
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:04 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfe-0000hI-5M
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:03 -0500
Received: by mail-pl1-x636.google.com with SMTP id a24so4535024plm.11
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2T2I9B8Qr2i8UewrvMYg5J+k8mGCyY+FDehGaTqquBY=;
 b=eUuBmnpbgQ6EmG2IOt7jmHtirURAAC2NLtCc34GFKtzGGUUdUYezRWOnz1luVhPq8r
 jRD69ts3URwk1jBsTd39EezOmdWUojbpXWRLLoSZjPwMzAixC075do4GDPowtIyPO1CY
 qhk0mG7dQErwMVWEFVXEBK7IcRL5BbarXAulxjPO0couq2yBr8NdsRNO+WYEAiSqL00r
 9B7AdfDBWEU6JTBqOZG2Ewzd9HVgvQT32GVauMTogzemRLFhxvY48zDmYJdrs082DIZq
 fxAvpErhWSollOkVSTYvWJm1Jg+ZpbHopAnAMQpJUfg+KnwW5wDrQut7rIcN0NyH3a0N
 ibeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2T2I9B8Qr2i8UewrvMYg5J+k8mGCyY+FDehGaTqquBY=;
 b=nLH5BtzQftROfdphyWUkCOhrFaPn2COF/AiVDt29HClmv69CrGkeHtRDS3BIgggQuh
 /+9ABqxJ3dmIjPhTGokh3j8PYIXm8dBTdrQancw0MZK1SjXzjk28mulyV/9Sxl/ZTgjZ
 dJURVZAD+zDLD9vRylFZmBd/Ya113IkimRTkv205Kv8Ph0hHMdG98Ffy+pZ0ZYN2fM+G
 OkigO+r0NoqdXiOSphFF7wxjLcVVHUXvU+6HHT7PPIZafmlEjDZthWlOZ+oBnFm2DkAF
 Wepze+Zln1A+/+g9yfMWZGQnRYQt9nkIKISxEw9AfGNe/c1gzpkZw87gfv185PhRWQN2
 6toQ==
X-Gm-Message-State: AOAM533K3+AmQuqCPWN+MdTtjcPGk3SZ0xLUc+uUSolB8AhnZyeh5Zqt
 GOlplTOOUTQtlS0EO2ReYh7qpQ==
X-Google-Smtp-Source: ABdhPJysNqmOAmrUu5wWnpsVLLLkqOaHdID6k+dkeeXEJdUkCNJLYf7prZqM8caKIx2xCYNLGFYLeA==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr1219338pjb.56.1614309600653; 
 Thu, 25 Feb 2021 19:20:00 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:20:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 07/75] target/riscv: rvv-1.0: remove rvv related codes from
 fcsr registers
Date: Fri, 26 Feb 2021 11:17:51 +0800
Message-Id: <20210226031902.23656-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Feb 2021 03:20:04 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove VXRM and VXSAT fields from FCSR register as they are only
  presented in VCSR register.
* Remove RVV loose check in fs() predicate function.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 89867a93643..5152bb84261 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -38,10 +38,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static int fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    /* loose check condition for fcsr in vector extension */
-    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
-        return 0;
-    }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
@@ -246,10 +242,6 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 #endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >= 0) {
-        *val |= (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return 0;
 }
 
@@ -260,13 +252,8 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
     env->mstatus |= MSTATUS_FS;
-    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-    if (vs(env, csrno) >= 0) {
-        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
-        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
-    }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return 0;
 }
-- 
2.17.1


