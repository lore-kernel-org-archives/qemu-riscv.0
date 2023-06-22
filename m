Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDCDEB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 16:19:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCN0x-0002Er-6c; Thu, 22 Jun 2023 12:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qCN0d-0001J5-9a
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 12:18:13 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qCN0a-00058G-Vc
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 12:18:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b525af07a6so37185625ad.1
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687450687; x=1690042687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0kiv9pO98oPtKQ5Bfc+3IlYT+Xx00DtpI/UiyKMWmE=;
 b=kBdrNbtQey4VgUkVJHxObm0E90sxOzlc3bhYK9BdAte7BaSwtgjeQ6DC2C6oiyBWqk
 MI8cK247/fI1X4Si5mLmY0P8/HO2SqIJ15a+KuCSLRpnKByQv+4IIwA1F5cwe/i8lbyJ
 ekE8vNKlxzMW87g/C9HTOec/KXiqWoC/+r0gA6AZhquzu3MF3Y8lk+VMav8ThYOXjK6b
 faMURH2DMrmJ0y0ZEQD1auTn8YSxsql2vEi0B0tSJ4rVPqQ/ZkEcqcbam9bnbtmmsYUY
 2BJFNkXo4bbgoBFZY3xwlB1nN+17GadrJBieIMr5ILPXPH2mAvohhS0r2Mg/PyMLWsFs
 r98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687450687; x=1690042687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0kiv9pO98oPtKQ5Bfc+3IlYT+Xx00DtpI/UiyKMWmE=;
 b=dCDBqyhugE55/VLstdQRdhGDQojo8Bi30o3zibuIasyCs4V/5969wYHf8Mk2oV9DxP
 /fQxFgpQUeAj/aOPSj+SHBeIPWeYW0/9e5hWubd+1FFZA6zOydOk/7dyu2zdnbgQ46Zf
 gJaRKpNIHRAqRhDFpB3DpwJp3/Y0OU8LQhnWDTsxwy1cglYxskxn1b0U2vBdVKe4AsHF
 pkpzJ943WLfXmqq5bqgw78AWIkkyVehLJz4fv5UuUx9GnH3Fgb/17sJ/5vCUqrZv+HK6
 r6aw404KTsHB7dYumr8kj/5ZsgvGHzZr5YF38bO3+0PRgkgzdh1OTAdjmDWL0EZqFFSx
 8zDA==
X-Gm-Message-State: AC+VfDxNY5xCUv5ATggLG9pxBf7p1mGAjrRb32d45gzABkug76hwDoEE
 AxwOb/0N0OjMIuIBBr+PTeK4nQ==
X-Google-Smtp-Source: ACHHUZ4HVqTN5aQTIOFwWrFM7i5OeEE9Htu9OE0Tdq4Dox3zocumDupXzJmvQj6tDYFusCU3rJqfow==
X-Received: by 2002:a17:902:7487:b0:1b0:307c:e6fe with SMTP id
 h7-20020a170902748700b001b0307ce6femr13075964pll.10.1687450687346; 
 Thu, 22 Jun 2023 09:18:07 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 c1-20020a170902d48100b001b3f039f8a8sm5609683plg.61.2023.06.22.09.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 09:18:07 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 08/17] tcg: Fix temporary variable in tcg_gen_gvec_andcs
Date: Fri, 23 Jun 2023 00:16:24 +0800
Message-Id: <20230622161646.32005-9-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230622161646.32005-1-max.chou@sifive.com>
References: <20230622161646.32005-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x633.google.com
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

The 5th parameter of tcg_gen_gvec_2s should be replaces by the temporary
tmp variable in the tcg_gen_gvec_andcs function.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 tcg/tcg-op-gvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 95a588d6d2..a062239804 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2774,7 +2774,7 @@ void tcg_gen_gvec_andcs(unsigned vece, uint32_t dofs, uint32_t aofs,
 
     TCGv_i64 tmp = tcg_temp_ebb_new_i64();
     tcg_gen_dup_i64(vece, tmp, c);
-    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &g);
+    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &g);
     tcg_temp_free_i64(tmp);
 }
 
-- 
2.31.1


