Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWMe-0000Yq-Bv
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMM-0007oJ-G6
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:47:39 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMK-000721-0d
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:47:37 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so5039725pja.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jpkfH5p2t23I+xxdw6uRxaIWCvz9AwC1FPMX8AE4Sw=;
 b=Lro8BsseqHGybYNgGZTW5kKipHMTdLqzlo09sIqP0ssDcJsIbE8jcI5suoLiMdvSbr
 yOnfrtnvistm/rh7rf0Hm/4aVGCdcfrjUXvn5HYHtL9+dv1r1NkEMz6cWfwSK9YFzjee
 4mn/+XfgEJy1Wr0JUDSQHcLBvWJ1RQfsDgq/R3D1bDtKS6AUhgfm0hwlmJpw0v/lN/IB
 YuklpKgOsGfxlUr27BzY1CnEz5R1vBD4PogSBJV82UmGhIy7QtpdAQH/fGLTj3I3E6+U
 VVRMRbYRaL1pweVZAdQtWH3ue5vyBcfUMYG+/eWGyf50H3Gyu0H+9XgAwjphCFekT5z4
 B6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jpkfH5p2t23I+xxdw6uRxaIWCvz9AwC1FPMX8AE4Sw=;
 b=P1BgYXQTAXCTqSULBKkj8RCBI9fiHN5Ugjprx66qC2qPMRNxXpnqYpPwH8qHU2QfXd
 BuPqo4MwoRTslK+tseG0KmSIOE8iJ0kznWXrjZss4jjkmqiVPWs/huUPbF+Id+pMHRUQ
 6INvzE+/xhjDAEo3P020tL2cav/FbfmDNxHSFYbHXx3f8WVtVx4L+r9yRih5lvfwxHU1
 cnNVpLMTHYgJ3b7+TduwxeEJT11W2WcGvLksX9VilV0vQwAkDcgg4VqQHVkCIlTZrZQO
 8idTfWFOnvCHi6AsucC0i18QAbSu3xgJctnDvEqdm1I2/q/fBTUi2JaA2t0Yzbd/RAGr
 cUlg==
X-Gm-Message-State: AO0yUKXJDMcgvoKDyGKYk0DmZRg9Rc48SF4rJDAwohXN11f+mRaWsyQz
 pNVIKRceflj472SWjAb7rk3zsA==
X-Google-Smtp-Source: AK7set+SOT0ufkt/KDXXg8B+iRmNjGqkv/klDuIpiRWC/Sod/SLO+1jG5yiyGIeG9lwYSnQfgGBBHA==
X-Received: by 2002:a17:903:41cd:b0:19a:a9d8:e47f with SMTP id
 u13-20020a17090341cd00b0019aa9d8e47fmr30574088ple.36.1677476853562; 
 Sun, 26 Feb 2023 21:47:33 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 41/70] target/ppc: Avoid tcg_const_* in power8-pmu-regs.c.inc
Date: Sun, 26 Feb 2023 19:42:04 -1000
Message-Id: <20230227054233.390271-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:47:42 -0000

All uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/power8-pmu-regs.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 42f2cd04a1..d900e13cad 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -177,7 +177,7 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
 
 void spr_read_PMC(DisasContext *ctx, int gprn, int sprn)
 {
-    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+    TCGv_i32 t_sprn = tcg_constant_i32(sprn);
 
     gen_icount_io_start(ctx);
     gen_helper_read_pmc(cpu_gpr[gprn], cpu_env, t_sprn);
@@ -210,7 +210,7 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
 
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+    TCGv_i32 t_sprn = tcg_constant_i32(sprn);
 
     gen_icount_io_start(ctx);
     gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
-- 
2.34.1


