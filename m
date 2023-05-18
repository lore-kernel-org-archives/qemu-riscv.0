Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E35C7EE22
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 11:39:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzbyo-0000EP-0Z; Thu, 18 May 2023 07:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1pzbyl-0000CE-GF
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 07:39:32 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1pzbyi-0002W0-6R
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 07:39:30 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f50020e0f8so71933735e9.0
 for <qemu-riscv@nongnu.org>; Thu, 18 May 2023 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684409966; x=1687001966; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hpOmi46xQ4MApQ9wmEcpNEs40K4g7mIrpG+eIQXr1g=;
 b=Rwg+E2ykP7uQWb/9mJPWOcSnAYMgi1gsk4b2TIYaWJ/NheB3iMvSh5YCyLEKY8UBJQ
 W8AEjI/vml6Xra0CA5zbOgbpAF1roXPqLT5MjcK92LRfRXF+q8S+LWDEacHISPSirzZZ
 3Kj/iNzrez55coWskp9nb2AEpLmlH03sGPVhVbvGl+1rAX+SrWsKOVN9bAEw6mqMd4nr
 IIIt8lAk3rhL4ATAUB5hpx7XYpHDUtXnQkfPs7I2WTeypZmv7tHS6HNEJoOZvkkaRzpZ
 g2d06W+iHW9gqE9/M386yASzdmbN+spoc4kK90gdMrhwHEOreSBcdRN/QzAdXPzlIsbj
 ZOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684409966; x=1687001966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6hpOmi46xQ4MApQ9wmEcpNEs40K4g7mIrpG+eIQXr1g=;
 b=l6dM67v4qW0og37d1sjXVBICCV4zGw6TONkECqmwYJuGesj+Do8RD93r27NqRvDDQX
 XusB4vA5r1JkJoqHPScqUn5hYihbgt7nqyHM50ftpDg+d7CeC+L7VI9540TUgXrtxFL9
 rdsGLJSJojf/too/6mGZZlWcxiOB2101kKI9nMzJSfb7BjPub2NCgRTD9Xrf/kUHDrZw
 SrYdVbPGBbHOATMmQ3NaXRnQnwwJoQNJbBQgaU/dD1Rsr65QZkUR/ydd6rZobDvQfwhf
 671KG3AFKwIAiVaxhit4tnOxySjzrVb8/Yan+Z3Ff0dWN2BMxcLqUDawp1V4YBOIlJMi
 ToFA==
X-Gm-Message-State: AC+VfDyddZH372SPKfD3OWfqxAE2si1KR56NKDOtchoPyrM76SEAwfdw
 +pX+B9svL3nc0q1MKu2yOgSdPhv1qRWJiwAD4HY=
X-Google-Smtp-Source: ACHHUZ5TkVQDU4xp/HZ2GzRywz/ATw8maVSaQ42HdPmih5pHFXHR0DH3eQbyJKP/bpE0E7WNKlxiKQ==
X-Received: by 2002:a05:600c:35d1:b0:3f4:255e:e375 with SMTP id
 r17-20020a05600c35d100b003f4255ee375mr1288480wmq.9.1684409965879; 
 Thu, 18 May 2023 04:39:25 -0700 (PDT)
Received: from localhost.localdomain
 (cpc98982-watf12-2-0-cust57.15-2.cable.virginm.net. [82.26.13.58])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a1c7406000000b003f4272c2d10sm5083982wmc.1.2023.05.18.04.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 04:39:25 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH 1/6] target/riscv: Without H-mode mask all HS mode inturrupts
 in mie.
Date: Thu, 18 May 2023 12:38:33 +0100
Message-Id: <20230518113838.130084-2-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518113838.130084-1-rkanwal@rivosinc.com>
References: <20230518113838.130084-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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


