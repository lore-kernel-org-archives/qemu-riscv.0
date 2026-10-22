Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B3606A31A
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 20:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VR3eRCix
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJz8J-0002zc-1R; Thu, 22 Oct 2026 16:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJz7j-0002xj-Rx
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 16:10:53 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJz7b-0005rr-QV
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 16:10:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so1427935e9.2
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792699839; x=1793304639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iumkKdxbXinQWarJtWow+eRgQvhUYCIsnjsB/thj/6Q=;
 b=VR3eRCixaDGyYz1i1Txmq7pbEa0/RHKUP4ejhj07HKunwQCpmSY2nXnFF7oRkVWCkp
 0AOOur7bAD/J9iQOuVA0fRpv/HbwSV4dhG1dvCsEIDnw+fwI+duPMU/LtfpEy582Pi0Q
 gUlObXpypfjNSutesyodlrlckv2WeuXSRjQyLY0Ae7lFlL8swvaqhGKcys5D9c73cgSZ
 e8uMLyAqMAb1gRu3LUyZOPziRMaOdSHXRJvfdWfrDub+4C572JP+n8fs37noTO/gkgtd
 ToEC3lG0MDHdP16OV1bj4nGgRzsgDMyWEiruHrE703gFfKf5MfRLVjHNmj+8tO2T173f
 6sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792699839; x=1793304639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iumkKdxbXinQWarJtWow+eRgQvhUYCIsnjsB/thj/6Q=;
 b=Ta9Jki7S9ZQULaLECanojgGLlOMV4MhZZiF6GVPGL93Gl/UpGLmdnmtrWN3O79zDF2
 wIhAj2dWPofP3jfZMCPdjPs/5FFPBPZ0JTFxMmusXrew0Rl/Jnnhr2hudbijD8gXEb8T
 hLhtaeeX12lo8F83sIktvl+wZHh+mVBqQyhSAhkU7zv1eHztpvXCblLpVU+Su+FG8Wf2
 44/i06mdFA3sTdvZU+nBeA9aPLoz/MCIvYDk8cLf8pFaxkWfV4ryOjtooDMWk61S+lfR
 1X+ljF/PlL1/7TMvXtBhXZFEAsT4EbSK/3gfrMRrwZZ/IB2VM34rvGe89/9AIsiPuND5
 TmBQ==
X-Gm-Message-State: AFq9FYKphZFF0oW06gN2sGjVQSL1LT4OUR3DzplUWJUXHeln2lKXcbcg
 rrkJzQAa9o6iMKIYTjjusyCexWVRyq0ArNMF8/+JdzvHCoSLlTVir3/KdIdk1/iGU80=
X-Gm-Gg: AYBFou0xQmBMyWLTYJS1KI3DFKj46X2Jk+Qa8wTPJSFBgIksr772HzjrMObmFh63LSV
 Sp0Hcqg+N1KC8m9LA66B/O5r5oZdUBVzQYWm1lyi3F/U/SQPg1QOyz6z19nBjqd2NRt6mxR7mJ1
 astwwFHZ5f7ImHPbPT6v4xyRvsBzIhdpFj0h2FL3UFYgOyMdfXAAZfUc/nc2P8tfIgR6RFmvAle
 TKfJT+TtxmRqquvqUIGdu2dnIEvisJg6JEq/nn0Kfc9zhGL2sht2P+TQIUJd+nyCMcnGIvng793
 dt7zW6PIVRQI4gSfYyBdtjYNjBKpqnRoj3Ij13iAUw5Ty2yse8AJ4GNJ3QRSDap+aPe8MGp58Tf
 v/wQiYkB9wSzYkPgafLGwGx6S7FG4WJQe7RKgGzaBE2dmcZMq9HS+VRKjVTmv76dNRbCiZyBWy9
 1jpJnRgx0LadxKAVoQF02U0dzGf+yNreI0Cwl7DY6MGVpTSp4Hk2NPjKuu4VY8in98Q4d/XljtR
 P0otkwvnIoPtngGR+02Lp0xrG1RqKPD09yQHyDoRTF2h6a8JD9/lDEbr/q/FDTyFLmDhahYetYm
 Q/gj9zYoJ4Zeo8zx/LTEqoR2c0eVZWxdyAH5oFEEoHEKxiynqTBHDySNtQIJ
X-Received: by 2002:a05:600c:1910:b0:4a1:fc66:b62b with SMTP id
 5b1f17b1804b1-4a211ede211mr2573495e9.35.1792699839433; 
 Thu, 22 Oct 2026 13:10:39 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a21226047fsm603875e9.4.2026.10.22.13.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 13:10:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH] target/riscv: Use 1ULL for a value we're going to shift by 63
Date: Thu, 22 Oct 2026 21:10:37 +0100
Message-ID: <20261022201037.764619-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In prop_marchid_set() we set mxlen to either 32 or 64, and then
calculate
 invalid_val = 1LL << (mxlen - 1);

which shifts the signed value 1LL up into its sign bit when mxlen is
64, which Coverity complains about.

This is not UB for QEMU because we use -fwrapv, but it makes more
sense to use an explicitly unsigned 1ULL here when we clearly want to
be treating it as an unsigned value and the 'invalid_val' variable is
of type uint64_t.

Resolves: Coverity CID 1547552
Fixes: d6a427e2c0b24 ("target/riscv/cpu.c: restrict 'marchid' value")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 08a4d14ea1f..d47a69bea7d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2298,7 +2298,7 @@ static void prop_marchid_set(Object *obj, Visitor *v, const char *name,
         g_assert_not_reached();
     }
 
-    invalid_val = 1LL << (mxlen - 1);
+    invalid_val = 1ULL << (mxlen - 1);
 
     if (value == invalid_val) {
         error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
-- 
2.43.0


