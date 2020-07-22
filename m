Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAw6-0004sd-CD
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAw3-0004m7-W0
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAw2-00060a-5B
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:11 -0400
Received: by mail-pj1-x1035.google.com with SMTP id k71so873629pje.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=luapOFzm51xYRtzAj/W9SIi2lVG0a4XONIdVgpZBqII=;
 b=abQtfsOlpyA8C700Pth9hYwSb9dnPwgWP6K6Mzm6RLt2FH7ohMq6TXaRzksnPC2MnR
 IjRzFJY/TuDqyMnLXg/3fpwTiROsp8AdRhWkho5SnPTNwjk/+2c4ZO5rvKPDjarAn8HA
 ZCQ9xR9dw00gVLZGoqfq/hXSgDwr7lQR86QFqZlZbubnxat8K7XqnShPyuegnGyZZKBq
 q9pkrHFnGlSw99UsBBPHITg7N7AbOvVTgjFRGyKg2OvjbVBC2uCYHLWgnvUcFHyCmYcC
 F1HXzyfG1EieM1YSs6RLOdUwQ6JhFnu6ZEhkl1ZJY2G6PScXI1+uy3zXJwpLfEUkfijl
 QSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=luapOFzm51xYRtzAj/W9SIi2lVG0a4XONIdVgpZBqII=;
 b=EkPBSwwf98noZg2zKlrHjtoQzV94Jc2VaMJwjWgrqpQiZtNwcC96Df0RBIxkFIuYzq
 bt3Drk9rEwVunq//8O+N8kiHEo9B+h2EA58ZM6h6TbSpDDW2rHjqB6DdS1jx6sC24Fup
 CdT88bn2aum6BJecwaztJB3nqK64hBszi1LPaSofz5FMGAmipNvj62tKxfLnlVcuV1h0
 RCGPgv7/2dbWg6naYFIA6Am9luu01XO5/9yoQmsZ52yRskPRTLrp2xexE0dHC6X8Jn3C
 h+0xxbsEAhzca8gYdGCYVB8xyAm06Az0hNX8vzccgNGW9+fUTZgjNvsWOvb3fQaKOZ7B
 ZbLA==
X-Gm-Message-State: AOAM531noJjwpxcv/Veq82K6ocpAW2gl4USTt5Q3Q8GMSTohNLDUN/aC
 nK/b3oLsB770teTw8H0HZKwuCg==
X-Google-Smtp-Source: ABdhPJxkxMPLAgYECMJKHdSBA6RtbOlCibPEKbKxQHoJ6zSSB5UsJYvthCZcx68j1zrxwzjMCKs55g==
X-Received: by 2002:a17:90a:800b:: with SMTP id
 b11mr9119062pjn.105.1595409669044; 
 Wed, 22 Jul 2020 02:21:09 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 50/76] target/riscv: rvv-0.9: single-width saturating add and
 subtract instructions
Date: Wed, 22 Jul 2020 17:16:13 +0800
Message-Id: <20200722091641.8834-51-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:21:12 -0000

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 956ee90745..3018489536 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2374,7 +2374,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.17.1


