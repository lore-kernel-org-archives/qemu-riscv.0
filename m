Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B247C3DA64
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 23:32:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWOy0-0002TX-64; Tue, 23 Jul 2024 19:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxd-00021T-Mu
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:30 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxb-0007on-45
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:25 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-7163489149eso869975a12.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2024 16:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721777421; x=1722382221;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T8to1DWCZWdUlgFa0/TKXbDihDuXgZx3Iusd/IEEBEY=;
 b=f1YEPCdzHAdC2jcR/ndAcL2LAuImsYe76rgARHFZhDMm1KR9NFf8ab9c7pLjPe0t3R
 VE2fyEcZwfF/0Z/EmeXnKjY8NIzd16KC12Rn/p0pkMm7Dl5y5oqxNAtUh+3Xy7G81FIm
 yaxORxvrvQvEdg4E1qnPIwEFlRm3sC/IbZOk5yKnPZ6G465lU2/pjYG8SCWlHCJSjqTu
 5XIIttnrYuGVpqeSYoTgjneoJAS9prwKl7n5Xg8qTgPmadBcAiV5S2tWKr6yeZnowM9G
 ZldIOK+67IunvzlTlCsTWNtSpbr4SvTBWQjw10w8Wi+J77QFjvmQ8OqJO29fIUrF56dG
 /DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721777421; x=1722382221;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8to1DWCZWdUlgFa0/TKXbDihDuXgZx3Iusd/IEEBEY=;
 b=CDAWTN55F3n1xigKlb1JHgPTkDHCaJcVgR/z5y3H/BrN8lA6RlYhjCt+lo97FrszF6
 i8SUm0fo8o1DqBarttTdQ/ZR5PbZT6DJNNa2UQ3wmJIj4TF9Yi2rNgjFKRnoMFNP/E8P
 V8LsVW+fV6D5TV/2MiqiXw0/dGLlybNv2aFbrG52o5nrtCUAX0aPs4WpozZVI3TpATHf
 ks5Vg9TsRApvnArYoG6/STgAB+GcmAjGeyKxkuEK3xXZJyfbET+rdGccvhl8ZsFgEVqs
 0ZsAedaJ9ZybPvj/rhe58oLM6ZE8Rwh6yBa7twl+Va6+2wFSxCIUF/eLLPqM++ib5gwG
 1ijQ==
X-Gm-Message-State: AOJu0YzJ7UdrIaOiM+wCkqqZz8zfGJ4pD57EoOqdfy60YqcGDGIKut+8
 VotfOCkO0d+YXDJu3AlvAVbBRwP5i4wCTCB11teJ25M9bmexEVWwcTyPex6umKw=
X-Google-Smtp-Source: AGHT+IHiZTDwswp7V8b+sTiNlXPvLCU6pmAwLgdWgRg3oyAWI9BstXVanapejSPzbNS1d6+6w+piKw==
X-Received: by 2002:a17:90a:9308:b0:2cd:3e23:fc85 with SMTP id
 98e67ed59e1d1-2cdae3166f8mr1527161a91.13.1721777420850; 
 Tue, 23 Jul 2024 16:30:20 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb74e894csm179217a91.41.2024.07.23.16.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 16:30:20 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 23 Jul 2024 16:30:00 -0700
Subject: [PATCH v2 03/13] target/riscv: Enable S*stateen bits for AIA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-counter_delegation-v2-3-c4170a5348ca@rivosinc.com>
References: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
In-Reply-To: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

As per the ratified AIA spec v1.0, three stateen bits control AIA CSR
access.

Bit 60 controls the indirect CSRs
Bit 59 controls the most AIA CSR state
Bit 58 controls the IMSIC state such as stopei and vstopei

Enable the corresponding bits in [m|h]stateen and enable corresponding
checks in the CSR accessor functions.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 88 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 58be8bc3cc8c..18b9ae802b15 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -316,19 +316,42 @@ static RISCVException smode32(CPURISCVState *env, int csrno)
 
 static RISCVException aia_smode(CPURISCVState *env, int csrno)
 {
+    int ret;
+
     if (!riscv_cpu_cfg(env)->ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (csrno == CSR_STOPEI) {
+        ret = smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
+    } else {
+        ret = smstateen_acc_ok(env, 0, SMSTATEEN0_AIA);
+    }
+
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return smode(env, csrno);
 }
 
 static RISCVException aia_smode32(CPURISCVState *env, int csrno)
 {
+    int ret;
+
     if (!riscv_cpu_cfg(env)->ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_AIA);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     return smode32(env, csrno);
 }
 
@@ -567,15 +590,38 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 
 static RISCVException aia_hmode(CPURISCVState *env, int csrno)
 {
+    int ret;
+
     if (!riscv_cpu_cfg(env)->ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
      }
 
-     return hmode(env, csrno);
+    if (csrno == CSR_VSTOPEI) {
+        ret = smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
+    } else {
+        ret = smstateen_acc_ok(env, 0, SMSTATEEN0_AIA);
+    }
+
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    return hmode(env, csrno);
 }
 
 static RISCVException aia_hmode32(CPURISCVState *env, int csrno)
 {
+    int ret;
+
+    if (!riscv_cpu_cfg(env)->ext_ssaia) {
+        return RISCV_EXCP_ILLEGAL_INST;
+     }
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_AIA);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     if (!riscv_cpu_cfg(env)->ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -1992,6 +2038,12 @@ static RISCVException rmw_xiselect(CPURISCVState *env, int csrno,
                                    target_ulong wr_mask)
 {
     target_ulong *iselect;
+    int ret;
+
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_SVSLCT);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
     /* Translate CSR number for VS-mode */
     csrno = csrind_xlate_vs_csrno(env, csrno);
@@ -2162,6 +2214,11 @@ static RISCVException rmw_xireg(CPURISCVState *env, int csrno,
     int ret = -EINVAL;
     target_ulong isel;
 
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_SVSLCT);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     /* Translate CSR number for VS-mode */
     csrno = csrind_xlate_vs_csrno(env, csrno);
 
@@ -2610,6 +2667,22 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
     if (env->priv_ver >= PRIV_VERSION_1_13_0) {
         wr_mask |= SMSTATEEN0_P1P13;
     }
+    /*
+     * TODO: Do we need to check ssaia as well ? Can we enable ssaia without
+     * smaia ?
+     */
+    if (riscv_cpu_cfg(env)->ext_smaia) {
+        wr_mask |= SMSTATEEN0_SVSLCT;
+    }
+
+    /*
+     * As per the AIA specification, SMSTATEEN0_IMSIC is valid only if IMSIC is
+     * implemented. However, that information is with MachineState and we can't
+     * figure that out in csr.c. Just enable if Smaia is available.
+     */
+    if (riscv_cpu_cfg(env)->ext_smaia) {
+        wr_mask |= (SMSTATEEN0_AIA | SMSTATEEN0_IMSIC);
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -2691,6 +2764,19 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
         wr_mask |= SMSTATEEN0_FCSR;
     }
 
+    if (riscv_cpu_cfg(env)->ext_ssaia) {
+        wr_mask |= SMSTATEEN0_SVSLCT;
+    }
+
+    /*
+     * As per the AIA specification, SMSTATEEN0_IMSIC is valid only if IMSIC is
+     * implemented. However, that information is with MachineState and we can't
+     * figure that out in csr.c. Just enable if Ssaia is available.
+     */
+    if (riscv_cpu_cfg(env)->ext_ssaia) {
+        wr_mask |= (SMSTATEEN0_AIA | SMSTATEEN0_IMSIC);
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 

-- 
2.34.1


