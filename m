Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357F7C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 11:50:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q68in-0000Mg-0e; Mon, 05 Jun 2023 07:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1q68iY-0000E3-QP
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 07:49:47 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1q68iW-0003Dz-Vk
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 07:49:46 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b02750ca0dso2969395ad.0
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 04:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685965783; x=1688557783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=316QhbECLQVQvDEcbvaJgAMUNnlmjGDDN6lAPQzxncQ=;
 b=PLkPaO9hvXIzPMJAebl1jRwAtOHmUViM76krP+guxGkZn3ks4igN2MRha9KFEeIIgH
 IaP1HTOJGa9E0TGJLri3wjNqN0r7fITfZ2sTjGGnKltWOKWWU9qSepESWMV+A7xeiI/y
 0uaoH0hbFU9si7/AgiMzkUEjrZcwPBcoTTtTJgwKHkjYMyBgV4V2UQUBPM26+ow+Hw9j
 Ns0IsVYMSoHUHtj/vvM864QFJcZj8Uqj0QPW9os5aUbieg89Vt6JG2VSZEkOQfarfkkO
 F8nbp1pedyYIaLTN/575EbvTIDhhvNgSFtdRdhhGkLxiVL7JxG8rsf+Qx2i7b6UCwfHM
 ladQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685965783; x=1688557783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=316QhbECLQVQvDEcbvaJgAMUNnlmjGDDN6lAPQzxncQ=;
 b=bGb1c/pR/tKKgJMi3RsZyseDXOp6yNNrkqm814Kr90O85Vg4KWrileQg3HdF/dfRmS
 y329Nhha6BdshxkfqnY32bMFmsemp9fB/YxRtrKox/vpHF9AwNYn8y8Khft2cwsWk9Ha
 LivtxXnvie0gqjHPPFGxV1XNFwC+Nju7xyXaRoQiAmIK0e6qcP5Agbi/elQSqjKjKZFl
 /S2ASYwT38AlKdpWad70QPzTd98zjzYZmP2bTv70nG1UIXPshQwHdlvmTrAbNeuo36cX
 B5hmgMKwJsqDFaDP2F+bpd/S+Q+OqrLTwQDIOnA756gFEkO1VORci1JflPyNhzmPXuv9
 womA==
X-Gm-Message-State: AC+VfDzFa10JcZGx/qA4x99qFWKyA3iKfRMZ+lgx7ctWeC7776pOJZF3
 yK1P6A86Up/pb+mbWQMGJXEHifRKYTVgglAnOccbTQ==
X-Google-Smtp-Source: ACHHUZ6a+EfYtVs/q4AdE7TfAUuSmRe0epBVPfRAU76bzyQJvrma0HKwe39EPVX6cXy6mg+5/424NA==
X-Received: by 2002:a17:903:22c4:b0:1a6:e00b:c3e5 with SMTP id
 y4-20020a17090322c400b001a6e00bc3e5mr17693605plg.4.1685965782828; 
 Mon, 05 Jun 2023 04:49:42 -0700 (PDT)
Received: from saptrishi.. ([2405:201:d019:c279:7394:6066:fed1:a1d])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902968a00b001b03f208323sm6426900plp.64.2023.06.05.04.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 04:49:42 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH v2] target/riscv: Smepmp: Return error when access permission
 not allowed in PMP
Date: Mon,  5 Jun 2023 17:19:34 +0530
Message-Id: <20230605114934.2649023-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605075150.367555-1-hchauhan@ventanamicro.com>
References: <20230605075150.367555-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x62e.google.com
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

v2 Changes:
o Removed goto to return in place when address matches
o Call pmp_hart_has_privs_default at the end of the loop

Fixes: 90b1fafce06 ("target/riscv: Smepmp: Skip applying default rules when address matches")
Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/pmp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 418738afd8..976b199156 100644
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
+            return (privs & *allowed_privs) == privs ? true : false;
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


