Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB79C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 20:40:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvL8T-00084R-3r; Sat, 15 Aug 2026 16:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8R-00082q-Kt
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8O-0008AE-RX
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:43 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso3293657a91.1
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826259; x=1787431059; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=p1tuew/8yZ3WUepEtCLWv5OHi9k/pwAQkc4Skx4oIwo=;
 b=LNzjA/LnIYLGqFRYhQh5V2Qe3RnNvKD1fu/1bp0yoaaGjapKvB3Z+s89K6y58rHEQg
 HVAUdRAfaoHbaSQIyvvKWWyg7AMB7zmBW6+rgUsZvgL9t5zAofrc6nA5z/fOftvL3foU
 NsIBhFIsqdJytK8hb+8A6HXK5liyz2AT08scQNwuC+aTzgcH4gkq1yfyN5QdkwXe3S4V
 UcGZVmDCkhpFXr9NzG8ed12rI+IDZFn4W+IOwmrIXXmvyYKqzdyy+q8Q+WgGDD6q5Ofx
 XnUZyz6smiR9RdelNEVDx3UzFkX0sqxTkF42t+fH2xj5qPjd+WbmkUbF7EISbUfNeNDS
 qWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826259; x=1787431059;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=p1tuew/8yZ3WUepEtCLWv5OHi9k/pwAQkc4Skx4oIwo=;
 b=ro/x/+oMC9plVo1o+BcSUMtEXXEiiFG+nkvLhrKBiUEeZprffJpKnves0WJ8X7qORC
 RpeuyE1CovnylIrnG0DdujT1cv4KOcCwG2Q49jQ3pMQSBadWtusnidCniFRDMfIoW38a
 xcJVRGA0eC5HRkbVd/1kf4A0eXUc505xzI4yg03L/xOgCr6uIHJ3/JPRyAKMxmnridE+
 zUupT2hVsMK4LUY75UU2eAZOwDVCOnVGjhxtJi3KTkL+qO0nnwhkiLy83vPpyw0NQ99+
 /StmMjhS+bU8N2rwp7QRgtE5sOgkQukVzZgNGZWeuRbnBlUZmhwWVrLiFahAM11VZZsD
 ZdNw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqihzcH5Xxd4xT/+cGPUs8SreKTmLa5svuWM0jsxkDnDdoKrB26cKUyLMDz9ose2q4uPrygrY6AegKN@nongnu.org
X-Gm-Message-State: AOJu0Yw63tLZf1y1eJjZxX1u56Sri3Grw7VQRONC65Qzxxx63/hDPap6
 C0jZQkVFg/woKab7obivRXjKQKA/CXS41oQqKun7EAjC6FnWLmMJV/axxeKxqkqG5Is=
X-Gm-Gg: AR+sD12D2ajsVWyJhkf3AIglSZDQtxLnLUxmtYblX8IkKRWUQZyt1vmXQ76wTyjmX6K
 BKIfyAOqqKwS/sVXeKM/qdtRl7PXrxMdQJSe0FdgQ7nvQ79igrNtcFeoC8sA1t8SboYmi2okbcm
 BsX7gw35MLZo3+bGn5rwE7YUrVn5ZlBw7G/dMlxNRaDcohdqFVaeX8AlE5NQPn9SvdubCVX7CrK
 y83GTvw5HLa71oq6O4pNF4uGBkGHjOAOeNfKRbwKqwsVUWpKpCfP4OaxgXKM/iNzl4woUwvptyX
 Poj1ZES3EI+6j4Yhb8dtumFgQZjsYX+z1P1ms4uD7885nDBEhrTQMb6RY0O3WdLku5uemxg5rMb
 eSn2fwbBFzAoKNQ4rQRKkJ8+N1tTWSeAA/x0FVv0JspPeALa67N5yIOAUoNEYBd0trknpz2P2b6
 nnDwEmBNg7hBiq3JoqG6Ld0q60qqhDNlakGS1AZQbakYanRThI75QWzAl1owe+ZwR71wf07N91J
 aJFPxzpSDvwjYFd0Joj
X-Received: by 2002:a17:90b:2b8e:b0:38e:4f41:83df with SMTP id
 98e67ed59e1d1-3933b8aa611mr17329444a91.15.1786826259247; 
 Sat, 15 Aug 2026 13:37:39 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [RFC PATCH 02/18] target/arm: Simplify invalid page test in
 allocation_tag_mem_internal
Date: Sat, 15 Aug 2026 13:37:14 -0700
Message-ID: <20260815203730.1468365-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mte_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index a1d8618ddb..e3952fcabf 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -132,10 +132,10 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
      */
     flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
                               ra == 0, &host, &full, ra);
-    if (probe && (flags & TLB_INVALID_MASK)) {
+    if (unlikely(flags & TLB_INVALID_MASK)) {
+        assert(probe);
         return NULL;
     }
-    assert(!(flags & TLB_INVALID_MASK));
 
     switch (full->extra.arm.pte_attrs) {
     case 0xf0: /* Tagged */
-- 
2.43.0


