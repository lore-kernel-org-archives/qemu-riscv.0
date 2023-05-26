Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2499EC77B73
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 16:24:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2aDn-0000e0-Ao; Fri, 26 May 2023 12:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aDl-0000d7-Vm
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:23:18 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aDk-0005Ld-7o
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:23:17 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f60b3f32b4so6742945e9.1
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685118193; x=1687710193; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hpOmi46xQ4MApQ9wmEcpNEs40K4g7mIrpG+eIQXr1g=;
 b=mjhupp1AptINVFXNzJ4GwFGT8b4guaQrcW/Oo1cHGxfXmfQQ3XPC81Beu3CtYCfDBl
 AI531RSkNK3maxRKyF0H2KfgMSVQhjsq4r6fN2332+GqpYcclaH5pwrkwnct+TAFoV8i
 JJxrj0X2URSg6ptKUGs/mlqfAmGOriaPDSpS3jI3lkwSjEASZZ6CoUmeOXecs0Psj7qx
 JWEScEIevK1AV8Wo5ORJQ8LQT9gR5+w77o77QdgWSwt7OYlTvC01trh0UkF1UjYcc605
 6/b3hU3iF8D1kg74bpG7qWz/pXGiQ20j1zlrNvEfzOSvf83rx5hIx/YYI/cVlATyQF63
 kQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685118193; x=1687710193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6hpOmi46xQ4MApQ9wmEcpNEs40K4g7mIrpG+eIQXr1g=;
 b=fTN0rA7Q0pZC6bMRsTEhyMqWhy6JgUjzWJw8cc7ZvCwyINCK82B+iO/wAdryPit2eS
 pGwy+9gXzSBZbBCEURp6hmFRFFSmLZcSpqgmCtnsn0al6R+UeaGd2KuZ1gAMZJwDqg4A
 KMa7i1/OsKxVX6s9KtJiUvaMYavWogUVgQRWssZV1c5ewflWqT/qWscrsYo20U3WS1Hp
 VYLOR5+LuF27JqP26rohwaqBDOrNbZGlZtHp9HFBIswcxGce6ENZnr0xh/+qOzUTn9ab
 aTLsv/hiNyONeSfYHJc/KJUXSIui3JzOv8Qh5wKNwzcmOSl8suc6cZUmyGDmJ1vx+5NO
 mYQw==
X-Gm-Message-State: AC+VfDxk4iDjEeyfJNnZIhNRZRn0eL3A5DwuBddN5OsXjQQSo0GvoT8z
 8WS4GjYtZZvngVROWY7a/ckyDtxOPG2EhUJesQY=
X-Google-Smtp-Source: ACHHUZ6yam9H3DnZGqmrhNOt1bDW14tw8jIuhz8a1uODORxhqLIgxiaGjKKdd/n+yoUsey2lvKQkXQ==
X-Received: by 2002:a05:600c:d0:b0:3f6:7fb:b60e with SMTP id
 u16-20020a05600c00d000b003f607fbb60emr1656650wmm.35.1685118193263; 
 Fri, 26 May 2023 09:23:13 -0700 (PDT)
Received: from localhost.localdomain
 (cpc98982-watf12-2-0-cust57.15-2.cable.virginm.net. [82.26.13.58])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c294b00b003f6129d2e30sm9312090wmd.1.2023.05.26.09.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 09:23:12 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v2 1/6] target/riscv: Without H-mode mask all HS mode
 inturrupts in mie.
Date: Fri, 26 May 2023 17:23:03 +0100
Message-Id: <20230526162308.22892-2-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526162308.22892-1-rkanwal@rivosinc.com>
References: <20230526162308.22892-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4451bd1263..041f0b3e2e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1522,7 +1522,7 @@ static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
     env->mie = (env->mie & ~mask) | (new_val & mask);
 
     if (!riscv_has_ext(env, RVH)) {
-        env->mie &= ~((uint64_t)MIP_SGEIP);
+        env->mie &= ~((uint64_t)HS_MODE_INTERRUPTS);
     }
 
     return RISCV_EXCP_NONE;
-- 
2.25.1


