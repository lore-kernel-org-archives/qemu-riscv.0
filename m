Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855D7C3DA49
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 23:32:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWOy6-0002vD-JJ; Tue, 23 Jul 2024 19:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxo-00024o-6m
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:36 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxf-0007rz-9n
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:30 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1fd66cddd4dso12549415ad.2
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2024 16:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721777425; x=1722382225;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rtkfuDYbgn3SsrC+WRSqtlppsRiTPZyE6z1FNFDI/rs=;
 b=UE/yubEnoythtAqy6WOGITeXVgyPbhOaSF69IBwQOImfSx+3TxffZWH4GOXiMYV2V7
 hE/aucvRsXpVoWSfrq1xDrNt9cWcr71n5pBokH1tQBkIiq/qJfunsfn/Mf7vHzS4j7Nf
 oJqsg8+7H/5+EMFeG+2GsQ4hPZ/W4Gpr8fvLMm+8aBaADeTyH3qvdF3p15TOT/3kSSFG
 aydyRuDY6cqVYbcZQq9R+xU16NfBo0HWMWZbbmyeLTDOPwauolz4cDj0MMwnBrbsInpQ
 PN1egTbz/nnEPXmpW6k1hdjzVJzkhxJu+xmmpOx51/YrvBcL1FR2IChKD+9dTHn0rdzp
 a87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721777425; x=1722382225;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rtkfuDYbgn3SsrC+WRSqtlppsRiTPZyE6z1FNFDI/rs=;
 b=RWVFF/IygmRKWEevFUQeqmX9mpekATAr9kcXznlke3oWFLN3wLtexa9hcSGVPqYdoK
 5A58CL/Ni38Xw80vBzdAWA2ZAQP84jd+vrc48tySQsBtF4MjYOu5D836JlbvZYVbx1Jo
 2oxCu5F716LYCGi6PDua5K2dgPqYLejS9UOWZ3/jpWr6P6oQ2ggIedqfXGo0n4edriHK
 6NraYWruuY/jsWDIqb7jnXkRLuV/J6PDoaU2oZmf8I9kK1aXF1iL65t7VPUvem/GvxAR
 r0SFRLQfIzZ2yyN93+7MZgVBGSlBH5SyHy7XvxW70xYHl2n8g5GOBsPxXeuP3fn6im5B
 3xUw==
X-Gm-Message-State: AOJu0YweAZE6if95XjBYLb6za3wb457aN0ICxthVlEtJHRisEZrworAt
 IzRa13Z/oTmKsMC2GXHVF4iWbU6zqTJHJ9wDDoxS6u3Mygr+jzUZV8xtvdjOIm0=
X-Google-Smtp-Source: AGHT+IHLbaHCSUu/cyDKpIsG3L2t+NSbPjJVYU2lj4yVwiBncf8A369ERDrfeLSnwhUAJ6APheRl9g==
X-Received: by 2002:a17:90a:1608:b0:2c3:40b6:293b with SMTP id
 98e67ed59e1d1-2cdb51bda20mr637960a91.39.1721777425356; 
 Tue, 23 Jul 2024 16:30:25 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb74e894csm179217a91.41.2024.07.23.16.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 16:30:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 23 Jul 2024 16:30:03 -0700
Subject: [PATCH v2 06/13] target/riscv: Add select value range check for
 counter delegation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-counter_delegation-v2-6-c4170a5348ca@rivosinc.com>
References: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
In-Reply-To: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x634.google.com
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds checks in ops performed on xireg and xireg2-xireg6 so that the
counter delegation function will receive a valid xiselect value with the
proper extensions enabled.

Co-developed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4ae3931f0ada..da27ba1b7580 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2120,6 +2120,11 @@ static bool xiselect_aia_range(target_ulong isel)
            (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST);
 }
 
+static bool xiselect_cd_range(target_ulong isel)
+{
+    return (ISELECT_CD_FIRST <= isel && isel <= ISELECT_CD_LAST);
+}
+
 static int rmw_iprio(target_ulong xlen,
                      target_ulong iselect, uint8_t *iprio,
                      target_ulong *val, target_ulong new_val,
@@ -2245,6 +2250,17 @@ done:
     return RISCV_EXCP_NONE;
 }
 
+static int rmw_xireg_cd(CPURISCVState *env, int csrno,
+                        target_ulong isel, target_ulong *val,
+                        target_ulong new_val, target_ulong wr_mask)
+{
+    if (!riscv_cpu_cfg(env)->ext_smcdeleg) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    /* TODO: Implement the functionality later */
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * rmw_xireg_csrind: Perform indirect access to xireg and xireg2-xireg6
  *
@@ -2256,7 +2272,25 @@ static int rmw_xireg_csrind(CPURISCVState *env, int csrno,
                               target_ulong isel, target_ulong *val,
                               target_ulong new_val, target_ulong wr_mask)
 {
-    return -EINVAL;
+    int ret = -EINVAL;
+    bool virt = csrno == CSR_VSIREG ? true : false;
+
+    if (xiselect_cd_range(isel)) {
+        ret = rmw_xireg_cd(env, csrno, isel, val, new_val, wr_mask);
+    } else {
+        /*
+         * As per the specification, access to unimplented region is undefined
+         * but recommendation is to raise illegal instruction exception.
+         */
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (ret) {
+        return (env->virt_enabled && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return RISCV_EXCP_NONE;
 }
 
 static int rmw_xiregi(CPURISCVState *env, int csrno, target_ulong *val,

-- 
2.34.1


