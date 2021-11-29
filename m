Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWyF-0000ul-1N
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:04:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyB-0000pK-S4
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:44 -0500
Received: from [2607:f8b0:4864:20::436] (port=39525
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxs-0008Qi-MN
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:04:37 -0500
Received: by mail-pf1-x436.google.com with SMTP id i12so15302153pfd.6
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ua2R+2dkAoBHDORfNb7qNaS3lWgdeuZeqFSpPuYBQcM=;
 b=PcrOQAeSypH1NCbP/BQ8aAzmU21+tbZDy4FLF3yGb3ATnbt/SGa6wXcERW07nRROf5
 5AyZOkijWz3dWu1vcPN4dDt6Q/jdGzzE1Pw+clWNi/cn93yeuXrF1QNpEwCOKJDcbtLM
 MA+KA/UxTbQfNtC4ag7hhL0mRpnk9JKZ5okl4usSJOCAsXcdKNLysnn1IeFFnnATldP1
 idFTDWOG3dqJHmiMGfeRJxR2UqZB45Wazh+Ke27LdIhQNwsioiL4dTIwKEuqX6++7xnP
 D33r/nxu4GnJhwm11kfRTvWWulqCd4zUfjSCD0fnqf6uskbH0DWoJkV6c5oGEM4WGMvb
 05nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ua2R+2dkAoBHDORfNb7qNaS3lWgdeuZeqFSpPuYBQcM=;
 b=VJDOh08qf69lzkyxlhYzMmjjoRJtHJGsSvegFNalbaqnw8bqkLT7mdNjArpGzFCwKr
 SaSrV+iyte2iHpuL3pGncYaF6O4gt3jVETiD/j1LjGyudaEa3ZpZEy+DNWLCkU6BuLj0
 5BIyOsHZWdj+H+EHQYFDxsE4TQXxsfpYPzVTDJZjDqMaJ0gCNj6uUpQjNPqZckERwW1m
 VYP2RkI9I3c9oa9+jWNJ6Aq4m3eTLA55JsTa30PTqpgi9XpqQQ9EvrU75QYhyKfObZGJ
 fKvsO25hawMkaryFUDMkCs0WnejFkN8b3X8CL/nLfrKQY3Iqr5ukBCaj+a3fsA7G16SR
 H3pA==
X-Gm-Message-State: AOAM533dKz+22SkgYsYrjbyFahb0wsxn31DcjYvWB+PWTiWezXVOO9Wa
 m+ABt4imx4rn7FAxVg3MzJP/AQ==
X-Google-Smtp-Source: ABdhPJxeYt2XTGPO3emnkj+EW8k22qjpMOT4wdhQ5zsUwP4GmpYdiKksTp05io9Y8SvWx856Suh3IQ==
X-Received: by 2002:a63:c142:: with SMTP id p2mr18936626pgi.576.1638155062103; 
 Sun, 28 Nov 2021 19:04:22 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:21 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 08/77] target/riscv: rvv-1.0: remove rvv related codes
 from fcsr registers
Date: Mon, 29 Nov 2021 11:02:28 +0800
Message-Id: <20211129030340.429689-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:04:44 -0000

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


