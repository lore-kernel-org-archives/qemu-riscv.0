Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAsZ-0005Io-Gf
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsX-0005E9-MG
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:33 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsV-0005E0-0J
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:32 -0400
Received: by mail-pf1-x441.google.com with SMTP id u5so857538pfn.7
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AsV8nXeGOBZSH3zrEUqd9iliNzH/znlE74D2q/iZRbA=;
 b=WKZHXpsKzctP/i1YhVCpIyBr6v9tYK32nFXo0WeWDDOxvbUqE4YiKto45Ic5fT6129
 fNDa5WnmJQRX/dx9OiL76ax7d9ZfgQTYvA51NF21D7ah40Me40NjZGK/4NRHjHFiLoR8
 tNYNBmEQih4w/pOWs3Krrvbl2k3pr+FX+LM6GZkwDZgFJKqjurXp7i4u0npL/+BFomZn
 +TMv1Ycamgaa7zJQ1RGs128IB1yyqnSE71wXH4Fae2FoiyiQczHrwt5ZNIwc85domgZX
 hN0qm0YTkJrz1Qup4PxoxYVl64cQWdA4M9IxQVpXHjviTHrQ2T08FmN4PMUkJrxU3/eM
 doxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AsV8nXeGOBZSH3zrEUqd9iliNzH/znlE74D2q/iZRbA=;
 b=CZK0N3V5U3Yexya+D2Vb7AIWL3crrM2qRSUtHqw02lFWMlYCZi3EVY9miiqr6EJcAR
 MIsONIZcg/oXn6Mkj6AYKrpXEbsJIwIjjETAXcDvNYdDdeiHRj6ZRVevB6xluqpPeFNJ
 i7tkH4/VzjPa+nTHp1+CHZamRRhHZrj2anrwIHL4GxCQFo8HVr5t95mfndpAzr1uDumr
 4nQFkUnNsTmN+m9ke2DR+M3+o6R8zDnV2ix420jalwAmGG2K1GpMdX7xb6M+TYNtDZGq
 g72JnUYj+zwUgrbjaM6Wsom7Oa2lYVK5qsncFfInTYsru4g7HfCRtDUc5fknGEqpMrnC
 Pm5Q==
X-Gm-Message-State: AOAM533fmTzqjLma7XsbvF3yirneQx5OxHLa33V2dIeLzyZWHtC0Gi9B
 JWsiXlPERs0ClteNwSY6rCAauQ==
X-Google-Smtp-Source: ABdhPJyI4As6fp/k4k7+8FrEN9ZQiZEWwCBdbAoemoFTg47dew3fMqoijIlSKNznVHT8RVMdZ/377Q==
X-Received: by 2002:a62:6285:: with SMTP id w127mr27143261pfb.12.1595409449760; 
 Wed, 22 Jul 2020 02:17:29 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:17:29 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 03/76] target/riscv: fix rsub gvec tcg_assert_listed_vecop
 assertion
Date: Wed, 22 Jul 2020 17:15:26 +0800
Message-Id: <20200722091641.8834-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:17:33 -0000

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


