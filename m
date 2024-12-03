Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A79E77166
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 23:16:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIc6b-0001JD-78; Tue, 03 Dec 2024 18:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6X-0001HR-Op
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:53 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6U-0001If-8q
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:52 -0500
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7fcc8533607so2253132a12.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 15:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733267689; x=1733872489;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jgqE8QX3K8RGYv92OKL7ZgQ+ZbdwwR+hFk0G3kGMbpQ=;
 b=mZz18di7V0L8u8x9yicA2jJGRSDx+N07WwPQHHt3E34S/5fiZojwFvuzBtV2yOlTCG
 C5hJq24DQGSAprDisWY25OGuj7sonNHXdhdxIECjIAZ9FIoBthbbXdvAr5JgECp6AywY
 rrp5i84i00nGxVPK4U+3VBAs8KoLHBmhX3rxDE/1SXvnQg/3NjOp2j8AfmoUi0cLOJGe
 GSTJsmL/tr27Dzf8DnAO9oKupSFji+GQWu0Mu7fmj9Tc/0FwN7b+D1obtw/ugu9I7gT3
 G34gmBxrHS9YclIrl9As8gYngMxtZFmdytqpFy6LeLpHdGUuN5anHvGM8Tl3LNcWy0HL
 Ncbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733267689; x=1733872489;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jgqE8QX3K8RGYv92OKL7ZgQ+ZbdwwR+hFk0G3kGMbpQ=;
 b=bEUdGah88WUkjGyyQDL7m4YSOBvFM2njOPmNcX5ZOcQq11AjbvG/ufY06m8R4Uyhg5
 rBzwK66oVtPY0nYzroia+SdHzuZwB5nBlRd/WUGkcW/JW5Gx6wP7rs6AS1L4RLUOHSUP
 vcNejgO+nlO9mHB/y4HwwA1si+f1CcdvGqYsUsJDqAASUvk56CFXfZ8Sp4FmlwKhd1ML
 Lj1b9ZrLdTPj/NoIA2V6nD2SCob1FG/SmPrC59n3VA00U1KrgCwt3jhFTJnmiMhXTMT+
 Ra0RMl+pkBBLAtEJytbLkTTPxbworp2NL9CO1cgicjy8ZYmlhIUKv4HUILcW9csVVxFV
 h1gA==
X-Gm-Message-State: AOJu0YxN0IaC8d998edXhzLj2XN6xG5LdH+xPHihnM1mXq01vBraZkgf
 wdMszMeVYWg7UZx1l4Hl0o/qFD29VJiTjYi5GZiCvzKGKAwYM5HCVE0zw00Pi+Q=
X-Gm-Gg: ASbGncuW9/OZNB1Uum/EXvzarye5iDI5ur8Z2TezN1JJkYx0SN+jltFammqVgOP5GdD
 Ce+2XD6sc87Y0NAzvyTOt0Y3qn9WfCaS9ZbJ5JAlN2CzQ7QDntfW84KAEP4XC3y8nAd/3xuQT8Z
 VVabImkVte19Pdiy8WHgSOkwcApQhHNVQUuFQA1k9AJCFH8qY0Os+wPZ35BVArxEa6WazkTwCBP
 eRvztaVgNSvSYHpDPFd6iBDtqf5ZIRLwTNqYxTNRVeO0WwvZsehQCHzNcvMPH8=
X-Google-Smtp-Source: AGHT+IFWBjis/dBtbj3s0JEYepKf6+Zs9uSKO3+lV/qr4sKvdjSB9fPEtm0OIE1BN98ZaZfQv1tBwQ==
X-Received: by 2002:a05:6a21:3282:b0:1db:eead:c588 with SMTP id
 adf61e73a8af0-1e1653f3ca0mr6665023637.29.1733267688905; 
 Tue, 03 Dec 2024 15:14:48 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254180f78asm11032133b3a.133.2024.12.03.15.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 15:14:48 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 03 Dec 2024 15:14:41 -0800
Subject: [PATCH v4 03/11] target/riscv: Enable S*stateen bits for AIA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-counter_delegation-v4-3-c12a89baed86@rivosinc.com>
References: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
In-Reply-To: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

As per the ratified AIA spec v1.0, three stateen bits control AIA CSR
access.

Bit 60 controls the indirect CSRs
Bit 59 controls the most AIA CSR state
Bit 58 controls the IMSIC state such as stopei and vstopei

Enable the corresponding bits in [m|h]stateen and enable corresponding
checks in the CSR accessor functions.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 52e0139fc99c..c91a26a52ef6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -335,19 +335,42 @@ static RISCVException smode32(CPURISCVState *env, int csrno)
 
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
 
@@ -586,15 +609,38 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 
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
@@ -2030,6 +2076,12 @@ static RISCVException rmw_xiselect(CPURISCVState *env, int csrno,
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
@@ -2200,6 +2252,11 @@ static RISCVException rmw_xireg(CPURISCVState *env, int csrno,
     int ret = -EINVAL;
     target_ulong isel;
 
+    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_SVSLCT);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     /* Translate CSR number for VS-mode */
     csrno = csrind_xlate_vs_csrno(env, csrno);
 
@@ -2678,6 +2735,19 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
         wr_mask |= SMSTATEEN0_P1P13;
     }
 
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
+
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2758,6 +2828,19 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
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


