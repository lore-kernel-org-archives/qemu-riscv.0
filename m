Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0253DC44501
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 16:19:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whUzU-00011t-OR; Wed, 08 Jul 2026 12:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUzT-00011O-43
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:15 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUzR-0006uf-Ks
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:14 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2c7c61b5292so16977235ad.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jul 2026 09:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783527552; x=1784132352; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wOTSrgzdmW81FbSSZ8dvQUirGsFshJAMK+kjjwsYBAg=;
 b=GA/tMHgF4Pcv1EIfc8ce7hzA5W8ydLqqPWNj91QmS1QNA/eJneSYm2rjdv0zYQtNZI
 rTl1hnlZQcBWAabvU5bOPtGtWnAvm25Y72J9vGYfeH0V9bKWmrnMKoRYw3SJmFwbDQpR
 VrC42fDHNtVeGfAdBUK/XLJ1MJKq+VNEjAlyNs7MJ+adZwelu/qoCMhsEZxyK4nix/wp
 HD/yVOqREXbL/nmCz87e4JAJSnU7QqrtlWsrfNosVUkq1yZqRZiryvZWZgGmV2RSmS1V
 JY1Mr0s4pEOgs2RE6snI148MNpyAdndVqHMvevwnhr2mV/tGZwHt9ubecXPjTZOSYMBt
 DLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783527552; x=1784132352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wOTSrgzdmW81FbSSZ8dvQUirGsFshJAMK+kjjwsYBAg=;
 b=c5LKy+T2N/u5eyF8I+8iOWl0rlWwK74vs5wxWdfiQrsJtfawxlBUXAPBUGGHBVp0U4
 pleB1E1yunoA3eauh8A1aAcZEE1s7fv2Sr5OTk7LMIkf6sHVlLWgBHcnOIUgVz0AoPeU
 u3vI+FueDzkGa1nxbalrQzNw/AF22HwoW+JMipGUeF0YbFn0PYPUgy/ppzSVeV09W75+
 t6/5z37GtpjT9K3/yEFuIxVPfeMCLJE44GvRgIUTrwzeI7DCkOd43enpZzbVpdshFRuU
 cQHd7CYszxrbPQOdqYSKKOpPOEWd6un/QcEi2Pf8bBCt9cU8Y6xMO6AC970Yg8cQOsGt
 66xg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrWgW+V0R3pqzYbq6M4Vlnd8SgqITgKyo0p8+oKcANtX64GFibkhjAD+v4nm6LE53+MZOlrZwA1/WK3@nongnu.org
X-Gm-Message-State: AOJu0YzzgrTHglHxB47YppkEAkBtuDoVlTDllghde28D2H5WfBqn2Vem
 TXjcmVxR7b6m4UVeJENxGQFqBCtfPCg6p4Ct4WIom0qKe8vqsJqt/uf1GYc/NvfdlyU=
X-Gm-Gg: AfdE7ckqndxTThPTs1wEL84NauA/c4T6EwOJQ+aQkSWS5Hn/w9D0sb2zAM0jLoPztMu
 soMs5fAQDCUI0Bin7LgBq0Q5kK3m/kwN2x1YkAR42ynYfWc9Q59z2aijWjiUxUBg129It3SrFjc
 fRKaklXUb68llxRp0UjpPgkPNHORFc691jBv9qfsV6UBqHtZ5LLHnXK/O5b+/IFz64TH9eN+Zwb
 c88kzVebuMcqAKaPgWois3cPs5l9ujdRLXf4wtfOH9KBQWM7Rgs+3fVdNaAsACV1D7ujEX1HxbZ
 FF/PXM7xczpiyyuXSba6hP54exdQFUOkdZP6F/IA1OYYvAu5X4vyAsjKi7HgmKhXJV/eRFTFy0c
 OEim1jAMmY+ReP+i5hmamhXfgmFLpbi/ef/lHr+vhIzU3oHjp2YUdmAEp00cX6wsFZVMEpmqfH2
 QwKu/LlvX0OqzHm7cQ4ttkz1HVuACjXWmxJNBdjM5Y4YNWyUPf7pHhkTQmu3q8BYD+qMk5sEIqV
 DuTtsX5D779TeuI
X-Received: by 2002:a17:902:ecc4:b0:2c8:1c05:16bb with SMTP id
 d9443c01a7336-2ccea3488damr31135865ad.24.1783527552282; 
 Wed, 08 Jul 2026 09:19:12 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bdb56fsm30789265ad.15.2026.07.08.09.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 09:19:11 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 2/9] target/riscv: rvv: Fix NOP_UU_B vs2 width
Date: Thu,  9 Jul 2026 00:18:52 +0800
Message-ID: <20260708161859.1124848-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708161859.1124848-1-max.chou@sifive.com>
References: <20260708161859.1124848-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/tcg/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index e321ca2616..944f176b74 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -5019,7 +5019,7 @@ GEN_VEXT_V_ENV(vfwcvtbf16_f_f_v, 4)
 
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
-#define NOP_UU_B uint8_t,  uint16_t, uint32_t
+#define NOP_UU_B uint8_t,  uint16_t, uint16_t
 #define NOP_UU_H uint16_t, uint32_t, uint32_t
 #define NOP_UU_W uint32_t, uint64_t, uint64_t
 /* vfncvt.xu.f.v vd, vs2, vm # Convert float to unsigned integer. */
-- 
2.55.0


