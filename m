Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAvm-000429-FF
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvk-0003vI-9z
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:52 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvi-0005rf-HB
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:51 -0400
Received: by mail-pl1-x630.google.com with SMTP id w17so644246ply.11
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WjHpOZhQo9fn4TvBmPBi/s1E299zigQx0QS5Nn+Jx2A=;
 b=hy4+5qHmG3bscVR9ymz9XSSLmdj3T8+hCXu0ILL+hfLWVIgUF+f9xdy0CPgaaj3OQT
 AkB1zyFu56xkSjMWlTOf4W1Cj7vmYnuKvZqYdQw8W1tKDmuoFJUHpM34rWCAOmIrV6Ps
 hnbjDKqyG5qSP6KJhWzpBr6569SPTIJ5j0MCjV+VeYQijiuWTUMMvI/53XInk3xw5eL+
 huhfigAz2JmizvNNY+owM1uhgcGLPxBDexL0x9q0q6s3tF89pzduZ9DbGrbvtavWtDWl
 uu7A3DgHLBRNeV25cZum01legBzINTX3vewyhSYQpis+2onH8dumDxW7lVDjxu5xvZs6
 HHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WjHpOZhQo9fn4TvBmPBi/s1E299zigQx0QS5Nn+Jx2A=;
 b=ghdD+Y/8V/pnA2f3gJllwJjC7t87usz9e0dZsPwCIIqRe1tGUIA1CGsBagxQB0Itbh
 D/eNW0IwqIkkH4JC49aEEB8XgX3qKi6ypNh3eKeBOKXRXkIUrenET5no1eIfOKQOi5GA
 WeBEYOldAO0ZH588QDqIqdGXBpAwvcGgyIM5drNYNY2yiIDUTyFR4dtI8eeLC8R55q2Z
 PGGncX0Ovzp2ZL7Y3zDQTr39GUQOy0JHoTNPXF1kPEbdq4TAwuzdcD+kFHAeLqYi6M32
 K7T2M9XxkQiXWdgadqT5XLkUcujFT+N9aeN1JbIw6ioUctIdz9Te3yeKmEc5iHs3wpNP
 h0lw==
X-Gm-Message-State: AOAM530nKrfhx0Op1/NVh/zom+Sxyj6pwCHmyP0HEjtl3aWwHaL71ELL
 TD6SXtsPewQFHz+mCOtOHn2SRw==
X-Google-Smtp-Source: ABdhPJzYx14Qs0LXm56kMmpSffBhJiqk1Zz6h5sgIhnC3Mu3NNONuWcS0CKa0G7YNZtszq8iyj3YIA==
X-Received: by 2002:a17:902:b682:: with SMTP id
 c2mr24830046pls.273.1595409649347; 
 Wed, 22 Jul 2020 02:20:49 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:49 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 45/76] target/riscv: rvv-0.9: single-width bit shift
 instructions
Date: Wed, 22 Jul 2020 17:16:08 +0800
Message-Id: <20200722091641.8834-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2020 09:20:52 -0000

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index d531c4edd1..3998011ef7 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1947,9 +1947,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.17.1


