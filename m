Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvamw-0003uu-4C
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamq-0003m2-N0
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:49 -0500
Received: from [2607:f8b0:4864:20::102c] (port=41569
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamp-0006Fh-9T
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:48 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso6906902pjb.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R06wcFNGC4oKgJLCj0pYuJH5LhlhHgIoftURvgt5oNA=;
 b=ldnc0cPtKiseP3VPGgLbwWAL1LoWeTnqi8PB+JJbhe5Zbky2SClXOviQMFfrV3JoN2
 Q7CEedf933gzODeZW2tXZQuTpf1WzlHsXvEf82ak9n+U6LyCkM/ZZsCHEM3lkN4AjFbQ
 4OVU76dV8tBXkSO20jasndgfwBvfbRHlSdpQ0GPBKBFb2Ern73JwDEpuRIamQYOof9jD
 oD27uOVSD1PhHwVyTT/QZmzxXHizJBclQA3QEqiGvr8ruiusclQ6XA6kNAmtd74FQ4vn
 PInwiTe+HtIThD3GJJmw5TlNAgZ5iHEZ/cYwnl2tny27fJEqccM8JTN8K7IHf/6tGSb7
 lYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R06wcFNGC4oKgJLCj0pYuJH5LhlhHgIoftURvgt5oNA=;
 b=f0/JkheR3tdPb7DuYuIDw4uOz0bkJi2qcHGi7+nJfCXOJTbTk7RUAiydYW9NuSvzIR
 pCLiqpK33F9k+C746OiF7s32gCxl4LwhTdn2znzuG1/YRXkYb+P+69xiL/Hx0KzTtYe7
 XO2iOD2ghr2/YzyjAvNutyoq+Bra538TNZG4l4hyRqO5D+7On5IZghrwf05O9N8Vn/OH
 PHoU9AwJv+6nsbjyyHKTm7TmgqOscC8RlRaCD0h4PjbJCJe2KDUhPBtoaEFbAv8+/LCa
 4cRwaWNuPR2ZWlTBlnt3Rm2DlDyhqGaJr7wbEbYOE2epATP0tyCNJnEQ73wNUWe6aIcL
 vUVQ==
X-Gm-Message-State: AOAM531MwAO0n3OsOvmtWIw24MVgWZkIeicWOT2c7LGHcAP3vuDh6mNc
 DtangMsiJ1eIcPWWOYi4sGkW0A==
X-Google-Smtp-Source: ABdhPJzetmBbuoveqRI3dVXAtv7P6lNFlxnnhxUuQLs2yb3ht2Hhy6GJPpA5AcxILl/ibF6JtscApA==
X-Received: by 2002:a17:90b:3890:: with SMTP id
 mu16mr21961773pjb.186.1639123065114; 
 Thu, 09 Dec 2021 23:57:45 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 08/77] target/riscv: rvv-1.0: remove rvv related codes
 from fcsr registers
Date: Fri, 10 Dec 2021 15:55:54 +0800
Message-Id: <20211210075704.23951-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:57:49 -0000

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
index bc149add6c..c522260986 100644
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
2.31.1


