Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D369C5DF88
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:07:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUn-0006HZ-UL; Fri, 21 Aug 2026 00:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUS-00066F-9Y
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:24 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUQ-0003Dm-IB
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:24 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-38e347638adso519314a91.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285061; x=1787889861; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l5FefkHt4+mIAwzFGxwVE4fW9WR3b86gApc4aXRCX/Q=;
 b=wSmtlPo7Y553S78PRnPNI9Cg6g/VCrLZK2reD7jzrLfgNFmv9Kc35bPDPi5W7r2xrx
 3wFR1qDcjNrva5ROdQBElUIMCCgomHPZFTizTsxBeaLYAdKGE5sKV3GSrGB27Gah8jM5
 cjw9EPXcXMH8souX+CHGURp1dSTe3vlKQG6onvZOgEF2gOAkRw566Yfxzf9CpAZ7ZXfI
 nYs1uOSSgL630vfVEcwZ6eJ9LluIQY/DQ13PdBGJvzFgSZ1lQbzBRPOOP530oVDUh7CR
 mWqiny4qHh/W7WfaByvD0fMsPBqvLNBInksVFH4RshoYjrYN11FPx5pN26TyMXuzFF/W
 EhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285061; x=1787889861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=l5FefkHt4+mIAwzFGxwVE4fW9WR3b86gApc4aXRCX/Q=;
 b=ivtPM7NQAz6ihc7Y+Lvi/SS5/djwW+W9rCcobfXnODYUGVijMHVAnYo7sjZB3W8wF7
 lVpxZZSnV3u+NEL+muc0fmJd/rLVIxZdiqSavilL13djQ3DbwO060Hky0mFTHHLBMhRT
 9KhHULXO+ux8Dim1us1AlVAfbwYTPofdTFhMZssG5meciwq5E2cA0Ujx3IVHTbmxYjBE
 9ff5kiIKt1KftgXM0pbhZXJSZG/KqmwlAKj7FE5iYY+cdxFbpOUPRoVY8K7P47K2PGWP
 mGdbRJ2uo/Pwk71W02wq5K1QS72HGMLf3phvWTfoZr892Bf+yqwwXKNk3joklr/qYTCb
 yiAA==
X-Gm-Message-State: AFuF++ms8iROa546Bup031pA3qrEq0NPoXkvmMb87xwwys9G7plm35Iw
 ua8uftixOcCREH9+l803FzcMH0tIQLMM9NO0AxFggm51whLsdkEuFm7DQUPA10PtfaM=
X-Gm-Gg: AR+sD11z6zttQ07FcIPL9cARhBPj9wRibXrjHSGcspLCuXS2O2rMUjQd9szFHBbgPNk
 n9/z4c2r0Ye+3c1h1xCF2p3YKF0KN1WIY8oTROLtvWLSYakQN0Zj8T5I/MMVw7wkxz8L01N1LQc
 qiMEiB1WNGh2AO0G6yFnJEARjf3t3iVLlOwY9GdCjIz2CibvThipAddqwZcAlGLJ1fKgmzl+kxB
 ZXUg9ZUPU/jPXglaF7f9ZKX1vnnLSm69iYegxDicRLc8BNm4GMyzVodseBLH0OoKPTqXAweigdj
 Dxy37xBBX4WwB2XLKCrjrQqjJMMAPX4CyxPHxYxAxRk+yaUSXdyAZ0LZKlEdoAY1/tE45Lb0gh4
 FQ/uFocDqLy5/+5KHEJ1+drtNJB7T2jkhVUV1l414bFns9gMTdhf/nv79sbbGPhGkTvTDjUvb2f
 r0FKeajzGksJMwnNn6mpyM+gc/L22S6p2aRn72y+Tuc/OwdK5FtslPryzEd2vv/Sr5IDY=
X-Received: by 2002:a17:90a:da8c:b0:381:a766:efcc with SMTP id
 98e67ed59e1d1-395c3865a2emr6346970a91.14.1787285061064; 
 Thu, 20 Aug 2026 21:04:21 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 13/23] target/riscv: Remove unused VDATA,WD
Date: Thu, 20 Aug 2026 21:03:54 -0700
Message-ID: <20260821040404.268123-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/internals.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 5d84e4de96..9e4da39ea0 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -94,7 +94,6 @@ FIELD(VDATA, VTA, 4, 1)
 FIELD(VDATA, VTA_ALL_1S, 5, 1)
 FIELD(VDATA, VMA, 6, 1)
 FIELD(VDATA, NF, 7, 4)
-FIELD(VDATA, WD, 7, 1)
 
 /* float point classify helpers */
 target_ulong fclass_h_bf16(uint64_t frs1);
-- 
2.43.0


