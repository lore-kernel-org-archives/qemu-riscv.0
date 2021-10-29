Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNkB-0004pz-It
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNk1-0004kb-3L
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:00:01 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjz-0004XS-F2
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:00:00 -0400
Received: by mail-pl1-x633.google.com with SMTP id t21so6397589plr.6
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ua2R+2dkAoBHDORfNb7qNaS3lWgdeuZeqFSpPuYBQcM=;
 b=QpltkP8BH4ObMsPpXwDOSw83dPrkG6AlW8l+a1375ljRaLLM+C6IuNrJLd+vcvyJ9a
 u1B/QgacW2Ecm276Cd0K/PozKJtbxPCr09DlpPfIBBrgCZYtIMilfbfAk8a70e1B2ab8
 rdFCBqp6sRqmX9BMZ4ARLJgYsIDkQDpT1u+8e6d7lszCRJ/eGy+qTJPlLJenTV+ihfjI
 7ehqvuROtTY9wIqxqIilZmK9xXeWi0fst7ez8rf/rsxf0aG/qRfdE9/nDoVT6MH1w4Ym
 BPz2qVZCaZVKkMkj0Z3Q0BrTSXYK6D9ztdmwKyitnevjIO5TT+eBAvmDr67Jmpp05SUI
 J+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ua2R+2dkAoBHDORfNb7qNaS3lWgdeuZeqFSpPuYBQcM=;
 b=TJygwv066ut+fT11m9ecmgwEitofb1Bi67iGq002/GT+JivetwTM3g4loDKPKV/4D+
 eFsWx5yucBxG8LGUQgS1tZd9aYWZZ3HWwV0ZPxINPzGtp43zirMPkMc/VIG3UwekxGLm
 8qfnnGEc7q+gVqPcIBVXKOarZgBhsifCZbutFbh5t+yhAf8rLeX2qDv6aHlsYvIilgEI
 Trjm+xKZsjZB6qd5qM62Sdk7A1c7VM+kxe6FHKy+7vjTh3r9zJQyPcEb7Ua89vUH6mG0
 oiXyfB4OPdPc7EASj2tzn/Wlb0XMwhJpRUGldnfPH1QKe2ilDQJR4k/n11XQ5097xhCs
 2Ytg==
X-Gm-Message-State: AOAM533R/9+eZRnpWY73LTmyl6jGEL8zsm28FobT+B9Wnj9IVpddwaVz
 c/k7qA8fpK1BBgLx/D6U5PzPGQ==
X-Google-Smtp-Source: ABdhPJxBLui/yYXjBTS57bdDbFK8IVga9ZLH3gpSPo/SkjJuL9r1OV9eCJ1FqoebkxyUm46GqI0raQ==
X-Received: by 2002:a17:90a:9906:: with SMTP id
 b6mr18244270pjp.180.1635497998107; 
 Fri, 29 Oct 2021 01:59:58 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:57 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 08/76] target/riscv: rvv-1.0: remove rvv related codes from
 fcsr registers
Date: Fri, 29 Oct 2021 16:58:13 +0800
Message-Id: <20211029085922.255197-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:00:01 -0000

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
index bc149add6ce..c522260986c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -38,10 +38,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    /* loose check condition for fcsr in vector extension */
-    if ((csrno == CSR_FCSR) && (env->misa_ext & RVV)) {
-        return RISCV_EXCP_NONE;
-    }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -261,10 +257,6 @@ static RISCVException read_fcsr(CPURISCVState *env, int csrno,
 {
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >= 0) {
-        *val |= (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return RISCV_EXCP_NONE;
 }
 
@@ -273,13 +265,8 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
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


