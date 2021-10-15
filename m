Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHvr-0005nP-PC
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvq-0005i6-4m
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:10 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvo-00028Z-Dg
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:09 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n11so5889200plf.4
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dtJp5Hea85xPCj3R+zBlvDQ1v7RUWI0MTIhIOIWmhE0=;
 b=j3uM21YHJcZIKCnffLna8D6cEyNsuqrKC/24FZiaLOx0HamMe8G9ufd7MzZ0CTV+cu
 xjfXpOQj0ZSyhIddy4WdaZALmYFdexrX7hCCWnAz4ltQXBKSwh/NDl2BCvhRlhBy42mY
 jmNDEKQ90ZKmUG1uOWaqAHZ9WbBGizorkAmqv1yrXXmKE0FQwt1Is67nQJgHgZ2zBJvx
 8qHxmnS5opE4nMt85Mzm2K8qzn+1G2tBJzr0RDLBOyiLnAzxheJ/SxFiXIdX/BVDiriC
 M9HqeQtiZUQP4eGNVJF6snB43NY5Em9WQGF9KXgTaON2ccrGqLXze1VDESCl5SifgwF9
 Dg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtJp5Hea85xPCj3R+zBlvDQ1v7RUWI0MTIhIOIWmhE0=;
 b=x9x43j3ybjgb8JWOvzSgXwmMK3Cdj4gctlSnRwPUglrI/6BOxPJuvC0KupHeXC965H
 hYp/GEuuX9wutaJYgoyLjscHs3lcMRLGjpsJS1s+Zc3XI2N8I9kUbcLoAQ+NuoX1eetw
 Ga8bErZzLpjqTzaM0AAHtf9jfhlXXRS3wwimIgCLkt6Ws8S09Ay8p26FIDtQfTkW1MtW
 uHDRohG6D1tsUGVtzMIL5GYyhvTjcRf/dxEfWG+ocDJa028O2V89bc85YZTayXV8a9qJ
 /3Yn/h3QByGX76ARMd7XKegDNVkrBt+Kr/WwTVGcQBkQCAXTZXkE8QR488YgMZVb5xEF
 Dubg==
X-Gm-Message-State: AOAM532C6ZOqhMkbgFp1WM9FSwYZzEfTxIZ15cg8cjD1AAI4l/xf+Qqg
 as+WmHNMvkkHwHR3ErnumjOf7nupjpYrjg==
X-Google-Smtp-Source: ABdhPJynXUXXIRCZRybpZEUZRrW1lrlINoIKQRAR2Ng8KmyAgvRr3oZKRUvZwQb1P+iqKAP2skiSCw==
X-Received: by 2002:a17:90a:5515:: with SMTP id
 b21mr11776046pji.239.1634284027084; 
 Fri, 15 Oct 2021 00:47:07 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:47:06 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 08/78] target/riscv: rvv-1.0: remove rvv related codes from
 fcsr registers
Date: Fri, 15 Oct 2021 15:45:09 +0800
Message-Id: <20211015074627.3957162-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:47:10 -0000

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
index 2734c223369..c71f3f34e88 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -38,10 +38,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    /* loose check condition for fcsr in vector extension */
-    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
-        return RISCV_EXCP_NONE;
-    }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -251,10 +247,6 @@ static RISCVException read_fcsr(CPURISCVState *env, int csrno,
 {
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >= 0) {
-        *val |= (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return RISCV_EXCP_NONE;
 }
 
@@ -263,13 +255,8 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
 {
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |= MSTATUS_FS;
-    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-    if (vs(env, csrno) >= 0) {
-        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
-        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
-    }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return RISCV_EXCP_NONE;
 }
-- 
2.25.1


