Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E69C61DFD
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 19:55:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x185Y-0004CZ-Ec; Mon, 31 Aug 2026 15:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgamblin@baylibre.com>)
 id 1x17EV-0001PU-KO
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 14:59:51 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tgamblin@baylibre.com>)
 id 1x17ET-0000CO-Vx
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 14:59:51 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-90e9143643cso8149726d6.2
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1788202789; x=1788807589; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J9GtGsBAQ9mS/SzBobD8ZOX7tnyIv8clzprzMF5QKwA=;
 b=mHzQHtwTHQYnVt6m+6KdCU+kXujviMvR8K3BMOWKK/0q1/XZsfHesLdrPtQA9WF0cR
 jwshAteTnXCUZqBtwHlnhuIJFpbm0C1IUr60I3EYHwrgKgwTB+xUt+nqOAdQhpBsEb6G
 tTVD9ZhnMLtthJ2YXLx2Rf5aF5cM1o1bnojHVajtcGel4oUZlSQ5A8MGg1MD7t/gU155
 zw0WIEPqaWc3Ni1eNoIVU6sQsVDC7ySbs/EVBCYI+Q+C7mAvb0qo/i++NhKCO7vAZCWZ
 PK2Dq0+exH1gDFCDYyvFcJJ1F4s9EWyVT4J6uuC6qPfHUQuBcMLoa7nRaoAGEQjKjll3
 UM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788202789; x=1788807589;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J9GtGsBAQ9mS/SzBobD8ZOX7tnyIv8clzprzMF5QKwA=;
 b=cc/qI0KIne673ru9cKMFNWmiLSxioxW2Xvx9y15XF31fFWEkGQCP1x+91D2zRXyu3/
 Pcluui3njN9koRIwDntdBDUz+1qYiLIHIfdK77ZjEWHfW47FnYu0tC9F1LY+z8Xsg9eQ
 pfsmo7OUKhlje6TkcIdm1ik4txF7nX8oy5f605hI8LJzeqX81h11hox6h+c+czYSh86o
 n4hjRh3HhibpspPSYNDbTvKCzRN6X5EFjJMFPPN9vTEMT9NZyWfgUt1mDepXQmK12Y5L
 DCkwBxfZyNb84AfP0gnFX2AKKhXKl3/jjuMQCprfMxG1Unqg65xFZLBL2WRs5OT3Bf6y
 C+VQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxMaFjYXtqALBgt0ZbTNWuAoz13c8qPAHSVrd/8YQ635OAx4aQ5V3OAZab+9TiLHADcIAtmBpmgkoEQ@nongnu.org
X-Gm-Message-State: AFuF++kYYXI/N9KJkUZZ5NPL1gqX+ZYetofDS/2tlKDnZ9kMxx0rm407
 RTbsDRtE1xSMnGoTMEkz2x95Q7QZIvcKWDZ5gmUUh4j2g6rdimTShcsauS7Iw7mL8pqy2KmYG0w
 Uy6trLIA=
X-Gm-Gg: AYBFou1eLZs1pVidruE4TWx1V008JL01VjZEJHSxARMAWod6un+XyZ+3VPkIzKhwRq0
 7awulszkJA07NLXcfe604FOFqg1kqpnHyvIqGmO9X39vKdOEr4XLmmhFSfBKz4KV2+YeZdTjEJv
 2DeW0E085o+7QS3QLhztRcEpQSwcoRYDp2bRH7MWSkIIVmofMjJL52klCgi1I2oInFouPvv3Xc+
 5PsHlVWKvvLQGDURI59H0aQ3r7C2LYDmRyDa6pvBqbgR1qFaYg5iadygvMpB3277/QNPyvNNycr
 f7zSZk/gZcEvk2jo1UY7VdFHnivSn0QgGUtmp2BBkBGkIlh1M0RVsji6EZMVdzXq95+RPmHNYrr
 VuUXJsWx0s+gaSvjepMcbslVPRrq+XDnzvSEaTCYErzkcbD94740gBq7AsXX7VDcNHVO/YxzW07
 tpr2c4NkkZOJTXC5MeCHstPTzZIf0xNEVxrWWauEbBxt7STc25LJ8EOH0InfgdevlJMhWtUsD2Y
 w==
X-Received: by 2002:a05:6214:5990:b0:90e:8424:4068 with SMTP id
 6a1803df08f44-90e842442c5mr189085796d6.24.1788202788876; 
 Mon, 31 Aug 2026 11:59:48 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90ce44f5695sm90952986d6.26.2026.08.31.11.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 11:59:47 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 31 Aug 2026 14:59:41 -0400
Subject: [PATCH 3/3] target/riscv: use a targeted TLB page flush for
 sfence.vma with a vaddr operand
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-riscv_tlb_page_flush-v1-3-4fc6af95673a@baylibre.com>
References: <20260831-riscv_tlb_page_flush-v1-0-4fc6af95673a@baylibre.com>
In-Reply-To: <20260831-riscv_tlb_page_flush-v1-0-4fc6af95673a@baylibre.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=tgamblin@baylibre.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 31 Aug 2026 15:54:34 -0400
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

sfence.vma unconditionally called helper_tlb_flush(), regardless of the
rs1 (vaddr) and rs2 (asid) operands, forcing a page-table walk on the
next access. Use helper_tlb_flush_page() whenever rs1 != 0, falling back
to the existing full flush for rs1 == 0. This makes RISC-V behaviour
more similar to ARM's equivalent (tlbi_aa64_vae1_write), which already
does tlb_flush_page_by_mmuidx() instead of a full flush.

Pass get_address(ctx, a->rs1, 0) to gen_helper_tlb_flush_page() rather
than get_gpr(), so that the address being passed matches the current
addr_xl width regardless of '-cpu' input. Otherwise, the raw register
value can carry garbage above that width and never match the address the
TLB entry was actually filled under, so the flush silently misses and a
stale mapping survives.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 target/riscv/tcg/insn_trans/trans_privileged.c.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
index a8eaccef67..8655fa332e 100644
--- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
@@ -155,7 +155,11 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
 {
 #ifndef CONFIG_USER_ONLY
     decode_save_opc(ctx, 0);
-    gen_helper_tlb_flush(tcg_env);
+    if (a->rs1 == 0) {
+        gen_helper_tlb_flush(tcg_env);
+    } else {
+        gen_helper_tlb_flush_page(tcg_env, get_address(ctx, a->rs1, 0));
+    }
     return true;
 #endif
     return false;

-- 
2.55.0


