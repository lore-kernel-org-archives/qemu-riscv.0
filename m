Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02383C56208
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 13:38:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wryIU-0002i3-FN; Thu, 06 Aug 2026 09:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vvisaev@gmail.com>) id 1wryIT-0002hq-Gh
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 09:38:09 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vvisaev@gmail.com>) id 1wryIS-0005zN-5J
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 09:38:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47fdd674e17so1420650f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786023486; x=1786628286; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=eH704TxnRusu+iEH09SDQ1XCsum28aO0uNmda66AhBM=;
 b=iCjkhuZj3ZLaNjaYlykcinfvZ1EFvNawxzNQA3qv9DD2U5eUm3TQk6Bk+ysVM7Gu57
 x6wjp+Ys6szCQISizxvmvUShf6ept6E2niT4aAyD3TSYzQRgCpYQONfi2YtmH/vNdlkV
 qEZDuUZqkrdR30YrsmGXbjJXVdvaov4+WeMzqR1j9GOKTNmThUCAI44izKJiQTuvoh86
 kj75gr3baEgITOVuuiTXfLxINK8qqatqICJV1IcG7iN+uCmIyx3tsCvqFJpXT8kvDZr8
 4LSJZidtuLt0eNRUhrW0pdUxXFzNOMei/nn2Aiyh0OswnHf1n79+xLpMiA0K3+duq7th
 TNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786023486; x=1786628286;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=eH704TxnRusu+iEH09SDQ1XCsum28aO0uNmda66AhBM=;
 b=H985pNZpr44YwIzarQXQHrDTt3dftTbBVIlnW680Xq/z4cKuL+FYMkhUbfM4CXurvV
 AeJ9EKJLIxw92gRGkyQFW7mzNFQYLcQAjkKT2LrGpZkqQwZrnP0DD6ZROBp38uO3A8/f
 4wNeUUE6SaBKGZORXrsoI2jwMOsTTgjnmaf5UMpWlJqoea/4QNSQzqfVfkgeqBziAqjt
 N1OiN066JrkGuBv/xKOBogfwA8sg6bRDTJroMC7Zuee90Td4wR84r+nwg6yoWdpR1tJt
 3Iv3v0cwYjpCR2teWptH0Ku0bhdADdivzTE2RmEilFyLQwSl0m1pzwkz7CuIGGa2Y++S
 3Yfw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrj5n09N1GcLDZNqlLKWNTLDeJYhqdf/ruQSFcQy71KPgnjXJkx93Yjcw2NGLVhWrLwbGIgDGQYl6Lz@nongnu.org
X-Gm-Message-State: AOJu0Ywgt/PzF7ICXH1gYkdIL7+sP09lqlIOxEWP7rbEK7HPKI+xNdJ8
 +yBH5+bzYnZATnJqbuhaXhL80DZ2pU2hb/Lk/ULtusJ8eNRb/QeQSJG4
X-Gm-Gg: AR+sD114dn9ZXkvVRvsyeCyGghfkXkoN+/J+c2KOSyBTX3DSJkInOFaSPh3vwggoPi+
 KSd+f91QQTvzKvUew66qlUNNLWRul1bp1P5hqe5ceaAo7mHjFeJ4LB1aF9OgzZSI1rAFuQZ8sjB
 gGXUQUDlq5fd0WheTwjB1xm0CG5o6BGmyQjVONbu7L4rTVR+gmTZfHzH7ZOpNoSqlJupZIopOFb
 ZUgiOZ+qQrv3km7ldoLyYAxmhrnGByatV1T/Bh2FH3ppaVq7jGwAe3dng35YETx1aRiiwxVYTW3
 LHWzRoMW59XBPCam0n8QgcFZ6chcfq+0cq3XGAost8VDHZ7mgdv258dOeqVHHUWpeaGx37uowjX
 Es5NrjXef4HbUtNqNxUtdjN+XQat4vOMSH2Yj/THShJjwge3UZQr84Oh1MQV0bdhmosH116qFvA
 sJrE2peqhdtdEnjkdJtzW1uXSc99fW+MXlbh2MeM5yeTw=
X-Received: by 2002:a05:600c:8116:b0:495:3da3:beb with SMTP id
 5b1f17b1804b1-4994e7b74a2mr226371315e9.10.1786023485677; 
 Thu, 06 Aug 2026 06:38:05 -0700 (PDT)
Received: from X1 ([178.66.48.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff79a7f07sm6837422f8f.8.2026.08.06.06.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 06:38:05 -0700 (PDT)
From: Vladimir Isaev <vvisaev@gmail.com>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-riscv@nongnu.org,
 Vladimir Isaev <vvisaev@gmail.com>
Subject: [PATCH 1/2] riscv: csr: do not drop C bit on misa write
Date: Thu,  6 Aug 2026 16:37:46 +0300
Message-ID: <20260806133755.45924-1-vvisaev@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=vvisaev@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

According to spec:
> Writing misa may increase IALIGN, e.g., by disabling the "C" extension.
> If an instruction that would write misa increases IALIGN, and the
> subsequent instruction’s address is not IALIGN-bit aligned, the
> write to misa is suppressed, leaving misa unchanged.

So attempt to disable C extension if next instruction is not aligned should not
change the misa.

Signed-off-by: Vladimir Isaev <vvisaev@gmail.com>
---
 target/riscv/tcg/csr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 36f2004bc5..58c206c1fa 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -2182,9 +2182,10 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     /* Mask extensions that are not supported by this hart */
     val &= env->misa_ext_mask;
 
-    /* Suppress 'C' if next instruction is not aligned. */
-    if ((val & RVC) && (get_next_pc(env, ra) & 3) != 0) {
-        val &= ~RVC;
+    /* drop write if RVC is cleared and next instruction is not aligned */
+    if ((env->misa_ext & RVC) && !(val & RVC) &&
+         (get_next_pc(env, ra) & 3) != 0) {
+        return RISCV_EXCP_NONE;
     }
 
     /* Disable RVG if any of its dependencies are disabled */
-- 
2.55.0


