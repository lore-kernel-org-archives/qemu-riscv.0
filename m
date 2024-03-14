Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3850C54E5D
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 17:58:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkpKj-0005Ru-Fy; Thu, 14 Mar 2024 13:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkpKh-0005R2-5k
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 13:57:35 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkpKU-0005Vt-73
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 13:57:23 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1dddad37712so12112635ad.3
 for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2024 10:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710439041; x=1711043841; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XS98Xl+fS3QA1FZdZkWPOU14YNjACn0BlbuXtjillU=;
 b=Y/xdXF3t1gHnNK7jb1fzsaCrhXuYSbJzPZUwuajeInQhvHWqglUz3HfqASl+67nAau
 ueWHLPYvhoFZxKNPVZz7xhtDWoInu5xC38yp1xQoCm8BZ94YlD5I9VzbgB4CtSnfhvCv
 x1kM+Pft/Z/RNTgZfbCrx90/CN8JejhHWqWVSShkchXG0flAjGYMuHYpgUZzPeCgJuen
 2MZS89Dii3mWgd0KWn9KRf00gmM0VfqMlaxGQJFRw4gdo8QkLoHOMGMOYZQLAXlqxQr6
 BozpE5szdRgUHudtYuTSVP8Vga55xt0XYLa4UTrkSTkZZgzhKrSM0o5+2JXKyuUd/Gvn
 YW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710439041; x=1711043841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/XS98Xl+fS3QA1FZdZkWPOU14YNjACn0BlbuXtjillU=;
 b=Uw0qHGV/K8biz/FnwgNYM3CnomzcfAcZP/n3auUg2wiClA7DbteTN7TF9FHKirLwnB
 UUNd7ofZYXFVfAUix8bTJFlvW40cN+xe7FwL5rlvdm2wiSw2Lxh3qbdBVW2+b+y0q/2P
 tgNegwuDMOjgYsIZUHYIYIzamforSVfhA0YeIYhD9t1tx4+abFazCAgSCWipPXBu6t6q
 a5JAIUkbAtN5r+fd8Ivft4ZXDwvlnTF5DV0DsWyBB1rBpnE9kCFaBKe3kDtYuXf9PUTE
 2LzjbOPAmt8rCiDdrf3ZYqsganEy50dFkJW5EmmYagRKtP8MAILEpB0MMGLwOiNitOUS
 MlHg==
X-Gm-Message-State: AOJu0Yy2ERh6vuJjoqn/0iUNuZqnuP8ASiGOY9VKrb6GYSVlxC/oZNEf
 Kv7JJCsS3vG9eGCW6e+euq3zj+VVrgv4j/FT4hNlCz5kq9CKAytMUnijig2E9wo=
X-Google-Smtp-Source: AGHT+IGSz4VAM18xr8RRBZ2flJsS83R27mUFEOIvDfrehxo9XKdMGVeRoURFJDcbZl2T7CVunyqd2w==
X-Received: by 2002:a17:902:728c:b0:1dc:cf38:3a77 with SMTP id
 d12-20020a170902728c00b001dccf383a77mr2293128pll.55.1710439040811; 
 Thu, 14 Mar 2024 10:57:20 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a170902c94700b001db717d2dbbsm1991776pla.210.2024.03.14.10.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 10:57:20 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for 9.0 v15 03/10] target/riscv/vector_helper.c: fix 'vmvr_v'
 memcpy endianess
Date: Thu, 14 Mar 2024 14:56:57 -0300
Message-ID: <20240314175704.478276-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240314175704.478276-1-dbarboza@ventanamicro.com>
References: <20240314175704.478276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

vmvr_v isn't handling the case where the host might be big endian and
the bytes to be copied aren't sequential.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Fixes: f714361ed7 ("target/riscv: rvv-1.0: implement vstart CSR")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/vector_helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ca79571ae2..34ac4aa808 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -5075,9 +5075,17 @@ void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
     uint32_t startb = env->vstart * sewb;
     uint32_t i = startb;
 
+    if (HOST_BIG_ENDIAN && i % 8 != 0) {
+        uint32_t j = ROUND_UP(i, 8);
+        memcpy((uint8_t *)vd + H1(j - 1),
+               (uint8_t *)vs2 + H1(j - 1),
+               j - i);
+        i = j;
+    }
+
     memcpy((uint8_t *)vd + H1(i),
            (uint8_t *)vs2 + H1(i),
-           maxsz - startb);
+           maxsz - i);
 
     env->vstart = 0;
 }
-- 
2.44.0


