Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4005C7EE2D
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 16:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6DLI-0005lZ-7t; Mon, 05 Jun 2023 12:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1q6DLE-0005kS-Lz
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 12:46:01 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1q6DLB-0005pF-MK
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 12:45:59 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b0338fac5dso4984695ad.0
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 09:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685983555; x=1688575555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0hwuqIhPLlgrN1NA6ds77nLaKe/3c4M1uIlZ0Jvevw=;
 b=UD1MTF1r7Z2duvmspN99wzENqJYr6ThU+gS2lXNcgGukPQIYbMy5lc/++lm4Y2yuzQ
 phkfLBu8ARvnf8kj0c7tsoGSsyFPu2IjDU7ijuixhLniR8XnmXONZvoiuyynGS19EBot
 hRuU/OsxZNPEGoe9UqIKctIsl58IJEtd5eDg+osOdBEVplBDV8UuuGD2ypivAc3YkTOi
 yQGnRVbx1k8W9f2pXqqNt2eBqyzn9tsTzbiBGEJL+CBuK/Tnfh53tYfPY1XsEdNR6idH
 m5cT43zDa3Hjk5ugjMNQCUmm8DnhEyHjJ1OE3ibqqWQRPZQP14UqjXcaJ0X5fXD/Zp33
 YFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685983555; x=1688575555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z0hwuqIhPLlgrN1NA6ds77nLaKe/3c4M1uIlZ0Jvevw=;
 b=VCYCXEN/hp/NEHylySrGl0P/OmHKWWPs/+Lvb10SlD7P3WEjjoS3P+1GUT9osPikVU
 BaNSug/R4TT1Td2Qz4DZfXHyIPUrhI0JwXg1abWoOUvlTVcIzBvmdXpoidFhGIMdZNoj
 Mjx+ny2gq3VjRBd1yxTqHRf8Tcm6eGGS+NZ+DPwWjvGBrIBse0fHgEj1xB82FyO5fHC3
 APqG3GpyDZo3lw5vwPp17fbhfGGZs5e9XDGm65jEFytZu646prDH3XM8TRpBkTZeuFt7
 TewAN3pHjGZKDJqZSp/FH8qSWQCQwBnjND27zFOC1WeZNW+4ij/bv8XOU2gg0kBp6ugX
 PNaQ==
X-Gm-Message-State: AC+VfDxHzQPxOa4DEePmjiZA3a4MKjIMeK2phYyWnk2ZE+rCR2aIOOes
 avWquFj5KHlfd56EnfI8PHCXM4iyp02XKc6Bh9GagA==
X-Google-Smtp-Source: ACHHUZ7nSqjmx5+w+ogYhIMg6/BZr9UpOcBZF+xT4QBUyEZjZtXEZciQN7ddD3VDOIWwIiPV5hcHJg==
X-Received: by 2002:a17:902:e851:b0:1b0:4680:60 with SMTP id
 t17-20020a170902e85100b001b046800060mr17836124plg.1.1685983554982; 
 Mon, 05 Jun 2023 09:45:54 -0700 (PDT)
Received: from saptrishi.. ([2405:201:d019:c279:7394:6066:fed1:a1d])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a170902ecc600b001b00dae8771sm6812652plh.201.2023.06.05.09.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 09:45:54 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH v3] target/riscv: Smepmp: Return error when access permission
 not allowed in PMP
Date: Mon,  5 Jun 2023 22:15:48 +0530
Message-Id: <20230605164548.715336-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605075150.367555-1-hchauhan@ventanamicro.com>
References: <20230605075150.367555-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On an address match, skip checking for default permissions and return error
based on access defined in PMP configuration.

v3 Changes:
o Removed explicit return of boolean value from comparision
  of priv/allowed_priv

v2 Changes:
o Removed goto to return in place when address matches
o Call pmp_hart_has_privs_default at the end of the loop

Fixes: 90b1fafce06 ("target/riscv: Smepmp: Skip applying default rules when address matches")
Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/pmp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 418738afd8..9d8db493e6 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -291,7 +291,6 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                         pmp_priv_t *allowed_privs, target_ulong mode)
 {
     int i = 0;
-    bool ret = false;
     int pmp_size = 0;
     target_ulong s = 0;
     target_ulong e = 0;
@@ -435,17 +434,12 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
              * defined with PMP must be used. We shouldn't fallback on
              * finding default privileges.
              */
-            ret = true;
-            break;
+            return (privs & *allowed_privs) == privs;
         }
     }
 
     /* No rule matched */
-    if (!ret) {
-        ret = pmp_hart_has_privs_default(env, privs, allowed_privs, mode);
-    }
-
-    return ret;
+    return pmp_hart_has_privs_default(env, privs, allowed_privs, mode);
 }
 
 /*
-- 
2.34.1


