Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsco-0006b3-F0
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqbm-0004fu-MX
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:22 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqbl-0006Bq-4S
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:22 -0400
Received: by mail-pl1-x641.google.com with SMTP id 72so2111390ple.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AsV8nXeGOBZSH3zrEUqd9iliNzH/znlE74D2q/iZRbA=;
 b=X0TvECITlTscM7iRht7vlTbX7C3v9epS6TobLqLs4OsS2IL/nwdryPzDPhS31TF79f
 8lbSuAD4EicxB5MU6k4xiaF5IltPLL/FP+/FxxoXky/X/DafKCOf4DqXHUK4crDRvTFp
 IEutbjTaaSIECZaevcqJVrt/yAx09ZPD5FXlik5GkcqkdCBrW7OaBXAcAp9JUE3U+rhk
 jvY6qVTj3DHYZsgTxoS/hfxCUw1nqlqIRFGoy4VV+rjmLJ3Rxty6CDp4c+7mXO0cGJb8
 17rvfXGNYh/9qbtGJRjc59+Rb1D6CDJgI7iwOzsUlU9Z6oq2lsVm52yCaHRMMX+Z8/PP
 8mHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AsV8nXeGOBZSH3zrEUqd9iliNzH/znlE74D2q/iZRbA=;
 b=NGJfrblOrxqXUkkjDhW9rXrcgEnETF9/XCI8iCbDLPKgJoSnKEPJgLIupcpR/kzpNH
 kOmd7IJtcX+Eiga/rJQRRqYYluqaio0S8GlGW9tMHTPh5nexgq5qYE1kxrwXWXC4fl02
 8RBF3AMYCa4vqc1TpD2nV8aHTdorW/OEddRhWz7EZsaicJiQrZcb9YVs462tjXaimxga
 5+ovHIvMsP6p0YkLU083ucllqwZ+lFFld5VGatF/4wtccMS+7oECU0tnh9KKPjODkByt
 1PgiMs4yf37ZJmqBszulgq4+rB6xUpa7IwiOXNs8J5yKNkPPzx4pa976j5/JeHSgHcak
 Y+6g==
X-Gm-Message-State: AOAM533CqLWPQVX26gODvRwq+WlxszZWSJjyHuAeurwQNWgTLc5HkPpF
 foNeTGmcrReRJofnG4JafwySrg==
X-Google-Smtp-Source: ABdhPJyqBV2GNVo3MYqQICD7F6n5XpiD6VILRGJQBE5LY+5g5uUk7G/cjSMF8SWNGU3bAil7ENBaoA==
X-Received: by 2002:a17:90a:2d83:: with SMTP id
 p3mr5215771pjd.124.1594378219752; 
 Fri, 10 Jul 2020 03:50:19 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:50:19 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 01/65] target/riscv: fix rsub gvec tcg_assert_listed_vecop
 assertion
Date: Fri, 10 Jul 2020 18:48:15 +0800
Message-Id: <20200710104920.13550-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x641.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:58 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:50:23 -0000

From: Frank Chang <frank.chang@sifive.com>

gvec should provide vecop_list to avoid:
"tcg_tcg_assert_listed_vecop: code should not be reached bug" assertion.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index dc333e6a91..433cdacbe1 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -958,22 +958,27 @@ static void gen_rsub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 static void tcg_gen_gvec_rsubs(unsigned vece, uint32_t dofs, uint32_t aofs,
                                TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
 {
+    static const TCGOpcode vecop_list[] = { INDEX_op_sub_vec, 0 };
     static const GVecGen2s rsub_op[4] = {
         { .fni8 = gen_vec_rsub8_i64,
           .fniv = gen_rsub_vec,
           .fno = gen_helper_vec_rsubs8,
+          .opt_opc = vecop_list,
           .vece = MO_8 },
         { .fni8 = gen_vec_rsub16_i64,
           .fniv = gen_rsub_vec,
           .fno = gen_helper_vec_rsubs16,
+          .opt_opc = vecop_list,
           .vece = MO_16 },
         { .fni4 = gen_rsub_i32,
           .fniv = gen_rsub_vec,
           .fno = gen_helper_vec_rsubs32,
+          .opt_opc = vecop_list,
           .vece = MO_32 },
         { .fni8 = gen_rsub_i64,
           .fniv = gen_rsub_vec,
           .fno = gen_helper_vec_rsubs64,
+          .opt_opc = vecop_list,
           .prefer_i64 = TCG_TARGET_REG_BITS == 64,
           .vece = MO_64 },
     };
-- 
2.17.1


