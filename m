Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGDK-0006lJ-7X
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDI-0006hP-Rr
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:44 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDH-0008Kk-5x
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:44 -0500
Received: by mail-pj1-x1031.google.com with SMTP id u4so1301403pjn.4
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y8Cl7Ad5sVJikJjeuJoLMz5GHxBKLNT+GwUS5o2r2j8=;
 b=fRnJ9G+/kXb0cV5Gh7aweM/yZldnacQIs4zycqbfBqF0lI+rlFd7nAVP0l6ixfKsKc
 IYwll+CMTOqBJADEFQ15+2EfLvapOG5tUUBSoUUGQDCrpki8or5SSRrNuiN4s/LQrqfs
 dhd52dZFtYVC9uCoRolIv418yBs8Ke7C2rEIXocgNDiG59TDOw9nB/8Ch4Sswc9rg+9k
 GQRgbrvZGSYyMHgWIq0aqimldCwRU0TD9EbFvM+klvJyp01RfnfE8K1MJceWBC8e/021
 lKIM5Of25CqJOwbcB+dIMXLLaVtb8NmmzXaymcM+cRgb+POhLhfBiPxjCeRluxdx2ABC
 FiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y8Cl7Ad5sVJikJjeuJoLMz5GHxBKLNT+GwUS5o2r2j8=;
 b=hwviQ9gGJMrABdkKxReF52aKhrCkc1NUPronKYQtUYqAYTBYXZgrQ5W7aTPW3X6yMw
 vU44rtYl5wGM/XBWrhj05pvcVb6phz1st8p1ccgvo00+MKVGWd7RdKA6ZfAosuAiuK5q
 FIXPJxtm8Bo1WpNjyANPAQWVKSCiBjAelNkuYz61DE+orLnM4enzmtqJVt1lA/cXZCiy
 IyfZO03QCdh6YpCx5D2nII2Cbr+EOh9xF0lp+C/lnEKoKTIb18VApIb9PLDq5KiUye5R
 oUUrYsXPkpLHw206jZ6YBb0VLGIXBMkOwD3euSOvzZM2WLgnK547E+OnmqBCWP5yDT+K
 sToQ==
X-Gm-Message-State: AOAM532WBdDDIBXU5f83/q+mhUOVKKNzyFwtmMZJe0MuFe9zSBzGchT+
 CwkrOwQ+201NsZz73/SoiOafuA==
X-Google-Smtp-Source: ABdhPJzKQ1+L9qM3IJlzK0flMr0imcJ/FOmLcmDdDK8DuJUS8G6RUBu/LmQ+HOgAHxalwZh1uw4aGQ==
X-Received: by 2002:a17:90a:8d84:: with SMTP id
 d4mr3762177pjo.56.1610444622055; 
 Tue, 12 Jan 2021 01:43:42 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:41 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 54/72] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Tue, 12 Jan 2021 17:39:28 +0800
Message-Id: <20210112093950.17530-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:43:45 -0000

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


