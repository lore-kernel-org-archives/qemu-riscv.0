Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTjy-0002NH-20
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjw-0002Iu-2H
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:28 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjt-0002ZR-Qk
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:27 -0500
Received: by mail-pf1-x431.google.com with SMTP id e3so1339332pfj.6
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y8Cl7Ad5sVJikJjeuJoLMz5GHxBKLNT+GwUS5o2r2j8=;
 b=jZ9hdwr7FFILDecToSnjoA0FbuR+IrlhAkB/tfNcgIWilhvD5WVc6lJBe0jD8XNdLw
 qUmvayZs2rSGXDPeX3LjBMaNci74ouDaaENiK7AayfAcouL9cP1ehGUkl11dJr6FxEVo
 y8lwfsqZbg+tTHq6drXJlP9uwUmnhg5OQ8GFo3NN/Bc1mr0h8VIosYAPaWkDW1hWKsCG
 QPQRzWsurDmSoytgCvvYQILZgSE4pnkClUDCl5A1PHPq5BGYuW8Qrj+m+nERVIYzMyRl
 0P9bMlLWzGR/vwIn0HV/ReFDwVQAUe4KaNdJ0IuNp+OWbjZ/ACH+KMH/HEB/7y181zAT
 0psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y8Cl7Ad5sVJikJjeuJoLMz5GHxBKLNT+GwUS5o2r2j8=;
 b=eI/SgGvGAtjInqnamL+WQXUjTAQPx5wSFITXm5on6/1Unw7g480ats6rAe85wVGtF0
 ehemLiGV/zB9kOCkw8H4jfStNWQ8VwUAW1R6X+CMHLcTXtvGqkCfAWG+mApkHMj+8lAp
 vjMw9XN9PzTJ4fWP3PNajb5zHrM0XJlgZnd9mwpPzh0OWp8vPSAz4rgOLMgdpvW+uFP4
 ngTgM8oPQ0MsxtEMt2pPyV7TUHQmvCvOl4oh92/6MJuvz2t6+Ksb7dWCQPFMee43ukRv
 uzfjB82P+6UCxuZ1K1kq0nBDERzZqqEAU4SIn4Fl1h3hs8Ev3m0orzN1uAIXibjUmRhI
 WMHA==
X-Gm-Message-State: AOAM530Z44pyMI+8W2qbvY8/3j1rKWJNT0/8z8VIte+dBAsnz57bVZxJ
 9+kj9/LJSFUxa/iwLpX+8luHVg==
X-Google-Smtp-Source: ABdhPJw1mLkXj0t+ocyW1JQm0saDkifGV2S0LSgjWrzYa3aZX667D5chSlt/oHx5pdTd3mACzdLgfw==
X-Received: by 2002:a65:50c8:: with SMTP id s8mr1060402pgp.68.1614309864404;
 Thu, 25 Feb 2021 19:24:24 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:24:24 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 54/75] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Fri, 26 Feb 2021 11:18:38 +0800
Message-Id: <20210226031902.23656-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 26 Feb 2021 03:24:28 -0000

From: Frank Chang <frank.chang@sifive.com>

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 49889a7706b..2188e92064f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2263,8 +2263,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.17.1


