Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAuB-0000f9-6G
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAu8-0000cX-DG
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:12 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAu3-0005Wv-PV
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:12 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t6so883665pgq.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfab06Gctg8S25gXF/eQcsR9GPuz6GUjCA85oRhG/tQ=;
 b=dYAgLoHtuMuLSAkdFpQxVswkrj+6G36pBL+6IXrz6rHOfGXbjoQ1GfEPMjQtzNscaI
 jZT7I2EPcVrZyzzvlz4Wli4DmsNPELPvlKN8sZjQVfwoxP8X/mS7XXiG6FuI2UCnvWTv
 4xmQsqOgc3pR+vePbAVLv0xj2CZ/aRB6HfGYR8s9w7VJcFz1clDTnAWbG9E5l4cRDEJS
 od2htY0oRkJZAEtedfPL1J7GOWBKiS2aImV2vCGVVJQIOsaLYW/MmYDtVW3G9GPmLtUy
 w+zbicvtP0WR3wBNWrqgY8axFaSpXquv1pTOuNhk7xdcAFmOloqNdoQYw+XN8r2OtVUC
 r6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfab06Gctg8S25gXF/eQcsR9GPuz6GUjCA85oRhG/tQ=;
 b=tMwKvo+k414D3slN/9TIffhbfliqQJHNkx58eF4h7GRDSRXAE3r8QUX39xI5GszEcB
 hj4FJrhqCi5zWmZec9qdiKvZ2ocquL312Pe8Bs8dxi5zNTVvPCKpPDUTbYyjOjteB8cw
 D+Q0NIfy2EeFWAlx2iOm3/x8pqfwMBC9wJtLBQ+G3T3GgMKjPv+BbD9OoTA1z7EEkW3i
 OJcvSsIIBKKtrC/Hb/N6MO7XwbIrkIzhCW66buUHztdQbaudSkVozbBLDdRjDEBN2cJX
 G8iW2TQcsdzNOL0EnI0bXT9SI2teTE9fwvzcwbVNwk1jT9SfCATBXGsllz7gxkmyA6Gf
 /UJA==
X-Gm-Message-State: AOAM532SJF2BqqtS37tiThYZXAqWovv9c42FE5t4OGlx69OxkSo1bmmf
 DUd0gP0025/V2exMNRy1t99cEA==
X-Google-Smtp-Source: ABdhPJweCMB3ZW+U4WNlCTqaZD/EOkBW9ctBVczhz2B1gyqrvNKiTJwtq4hOSVy2BbHzr8rB0QVYQw==
X-Received: by 2002:a65:6447:: with SMTP id s7mr26437260pgv.320.1595409546136; 
 Wed, 22 Jul 2020 02:19:06 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:19:05 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 22/76] target/riscv: rvv-0.9: stride load and store
 instructions
Date: Wed, 22 Jul 2020 17:15:45 +0800
Message-Id: <20200722091641.8834-23-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:19:12 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 129 +++-----------
 target/riscv/insn32.decode              |  43 +++--
 target/riscv/insn_trans/trans_rvv.inc.c | 214 +++++++++++-------------
 target/riscv/vector_helper.c            | 175 +++++--------------
 4 files changed, 184 insertions(+), 377 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3cbd66a887..db479f92cf 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -84,111 +84,30 @@ DEF_HELPER_1(hyp_tlb_flush, void, env)
 
 /* Vector functions */
 DEF_HELPER_3(vsetvl, tl, env, tl, tl)
-DEF_HELPER_5(vlb_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlw_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlw_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlw_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlw_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwu_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwu_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwu_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwu_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsw_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsw_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsw_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsw_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_6(vlsb_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsb_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsb_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsb_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsh_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsh_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsh_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsw_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsw_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsbu_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsbu_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsbu_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsbu_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlshu_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlshu_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlshu_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlswu_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlswu_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssb_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssb_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssb_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssb_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssh_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssh_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssh_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssw_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssw_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse_v_d, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vle8_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle16_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle32_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle64_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle8_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle16_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle32_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle64_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse8_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse16_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse32_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse64_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse8_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse16_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse32_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse64_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vlse64_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vsse8_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vsse16_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vsse32_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vsse64_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlxb_v_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vlxb_v_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vlxb_v_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index bdd8563067..012c844f60 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -229,13 +229,26 @@ hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
 # *** RV32V Extension ***
 
 # *** Vector loads and stores are encoded within LOADFP/STORE-FP ***
-vlb_v      ... 100 . 00000 ..... 000 ..... 0000111 @r2_nfvm
-vlh_v      ... 100 . 00000 ..... 101 ..... 0000111 @r2_nfvm
-vlw_v      ... 100 . 00000 ..... 110 ..... 0000111 @r2_nfvm
-vle_v      ... 000 . 00000 ..... 111 ..... 0000111 @r2_nfvm
-vlbu_v     ... 000 . 00000 ..... 000 ..... 0000111 @r2_nfvm
-vlhu_v     ... 000 . 00000 ..... 101 ..... 0000111 @r2_nfvm
-vlwu_v     ... 000 . 00000 ..... 110 ..... 0000111 @r2_nfvm
+# Vector unit-stride load/store insns.
+vle8_v     ... 000 . 00000 ..... 000 ..... 0000111 @r2_nfvm
+vle16_v    ... 000 . 00000 ..... 101 ..... 0000111 @r2_nfvm
+vle32_v    ... 000 . 00000 ..... 110 ..... 0000111 @r2_nfvm
+vle64_v    ... 000 . 00000 ..... 111 ..... 0000111 @r2_nfvm
+vse8_v     ... 000 . 00000 ..... 000 ..... 0100111 @r2_nfvm
+vse16_v    ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
+vse32_v    ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
+vse64_v    ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
+
+# Vector strided insns.
+vlse8_v     ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
+vlse16_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
+vlse32_v    ... 010 . ..... ..... 110 ..... 0000111 @r_nfvm
+vlse64_v    ... 010 . ..... ..... 111 ..... 0000111 @r_nfvm
+vsse8_v     ... 010 . ..... ..... 000 ..... 0100111 @r_nfvm
+vsse16_v    ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
+vsse32_v    ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
+vsse64_v    ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
+
 vlbff_v    ... 100 . 10000 ..... 000 ..... 0000111 @r2_nfvm
 vlhff_v    ... 100 . 10000 ..... 101 ..... 0000111 @r2_nfvm
 vlwff_v    ... 100 . 10000 ..... 110 ..... 0000111 @r2_nfvm
@@ -243,22 +256,6 @@ vleff_v    ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
 vlbuff_v   ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
 vlhuff_v   ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
 vlwuff_v   ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
-vsb_v      ... 000 . 00000 ..... 000 ..... 0100111 @r2_nfvm
-vsh_v      ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
-vsw_v      ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
-vse_v      ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
-
-vlsb_v     ... 110 . ..... ..... 000 ..... 0000111 @r_nfvm
-vlsh_v     ... 110 . ..... ..... 101 ..... 0000111 @r_nfvm
-vlsw_v     ... 110 . ..... ..... 110 ..... 0000111 @r_nfvm
-vlse_v     ... 010 . ..... ..... 111 ..... 0000111 @r_nfvm
-vlsbu_v    ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
-vlshu_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
-vlswu_v    ... 010 . ..... ..... 110 ..... 0000111 @r_nfvm
-vssb_v     ... 010 . ..... ..... 000 ..... 0100111 @r_nfvm
-vssh_v     ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
-vssw_v     ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
-vsse_v     ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
 
 vlxb_v     ... 111 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlxh_v     ... 111 . ..... ..... 101 ..... 0000111 @r_nfvm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index ca2ae59bb3..d49891ad26 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -164,8 +164,42 @@ static uint32_t vreg_ofs(DisasContext *s, int reg)
 /* check functions */
 
 /*
- * In cpu_get_tb_cpu_state(), set VILL if RVV was not present.
- * So RVV is also be checked in this function.
+ * Vector unit-stride, strided, unit-stride segment, strided segment
+ * store check function.
+ *
+ * Rules to be checked here:
+ *   1. EMUL must within the range: 1/8 <= EMUL <= 8. (Section 7.3)
+ *   2. Destination vector register number is multiples of EMUL.
+ *      (Section 3.3.2, 7.3)
+ *   3. The EMUL setting must be such that EMUL * NFIELDS ≤ 8. (Section 7.8)
+ *   4. Vector register numbers accessed by the segment load or store
+ *      cannot increment past 31. (Section 7.8)
+ */
+static bool vext_check_store(DisasContext *s, int vd, int nf)
+{
+    uint32_t emul_r = s->emul < 1 ? 1 : s->emul;
+    return (s->emul >= 0.125 && s->emul <= 8) &&
+            require_align(vd, s->emul) &&
+            ((nf * emul_r) <= (NVPR / 4) &&
+             (vd + nf * emul_r) <= NVPR);
+}
+
+/*
+ * Vector unit-stride, strided, unit-stride segment, strided segment
+ * load check function.
+ *
+ * Rules to be checked here:
+ *   1. All rules applies to store instructions are applies
+ *      to load instructions.
+ *   2. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ */
+static bool vext_check_load(DisasContext *s, int vd, int nf, int vm)
+{
+    return vext_check_store(s, vd, nf) && require_vm(vm, vd);
+}
+
  */
 static bool vext_check_isa_ill(DisasContext *s)
 {
@@ -432,13 +466,15 @@ static bool vext_check_isa_ill(DisasContext *s)
 }
 
 /* common translation macro */
-#define GEN_VEXT_TRANS(NAME, SEQ, ARGTYPE, OP, CHECK)      \
-static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE *a)\
-{                                                          \
-    if (CHECK(s, a)) {                                     \
-        return OP(s, a, SEQ);                              \
-    }                                                      \
-    return false;                                          \
+#define GEN_VEXT_TRANS(NAME, EEW, SEQ, ARGTYPE, OP, CHECK)   \
+static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a) \
+{                                                            \
+    s->eew = EEW;                                            \
+    s->emul = (float)EEW / (1 << (s->sew + 3)) * s->flmul;   \
+    if (CHECK(s, a)) {                                       \
+        return OP(s, a, SEQ);                                \
+    }                                                        \
+    return false;                                            \
 }
 
 /*
@@ -492,40 +528,16 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
 {
     uint32_t data = 0;
     gen_helper_ldst_us *fn;
-    static gen_helper_ldst_us * const fns[2][7][4] = {
+    static gen_helper_ldst_us * const fns[2][4] = {
         /* masked unit stride load */
-        { { gen_helper_vlb_v_b_mask,  gen_helper_vlb_v_h_mask,
-            gen_helper_vlb_v_w_mask,  gen_helper_vlb_v_d_mask },
-          { NULL,                     gen_helper_vlh_v_h_mask,
-            gen_helper_vlh_v_w_mask,  gen_helper_vlh_v_d_mask },
-          { NULL,                     NULL,
-            gen_helper_vlw_v_w_mask,  gen_helper_vlw_v_d_mask },
-          { gen_helper_vle_v_b_mask,  gen_helper_vle_v_h_mask,
-            gen_helper_vle_v_w_mask,  gen_helper_vle_v_d_mask },
-          { gen_helper_vlbu_v_b_mask, gen_helper_vlbu_v_h_mask,
-            gen_helper_vlbu_v_w_mask, gen_helper_vlbu_v_d_mask },
-          { NULL,                     gen_helper_vlhu_v_h_mask,
-            gen_helper_vlhu_v_w_mask, gen_helper_vlhu_v_d_mask },
-          { NULL,                     NULL,
-            gen_helper_vlwu_v_w_mask, gen_helper_vlwu_v_d_mask } },
+        { gen_helper_vle8_v_mask, gen_helper_vle16_v_mask,
+          gen_helper_vle32_v_mask, gen_helper_vle64_v_mask },
         /* unmasked unit stride load */
-        { { gen_helper_vlb_v_b,  gen_helper_vlb_v_h,
-            gen_helper_vlb_v_w,  gen_helper_vlb_v_d },
-          { NULL,                gen_helper_vlh_v_h,
-            gen_helper_vlh_v_w,  gen_helper_vlh_v_d },
-          { NULL,                NULL,
-            gen_helper_vlw_v_w,  gen_helper_vlw_v_d },
-          { gen_helper_vle_v_b,  gen_helper_vle_v_h,
-            gen_helper_vle_v_w,  gen_helper_vle_v_d },
-          { gen_helper_vlbu_v_b, gen_helper_vlbu_v_h,
-            gen_helper_vlbu_v_w, gen_helper_vlbu_v_d },
-          { NULL,                gen_helper_vlhu_v_h,
-            gen_helper_vlhu_v_w, gen_helper_vlhu_v_d },
-          { NULL,                NULL,
-            gen_helper_vlwu_v_w, gen_helper_vlwu_v_d } }
+        { gen_helper_vle8_v, gen_helper_vle16_v,
+          gen_helper_vle32_v, gen_helper_vle64_v }
     };
 
-    fn =  fns[a->vm][seq][s->sew];
+    fn =  fns[a->vm][seq];
     if (fn == NULL) {
         return false;
     }
@@ -541,46 +553,30 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
 
 static bool ld_us_check(DisasContext *s, arg_r2nfvm* a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_load(s, a->rd, a->nf, a->vm);
 }
 
-GEN_VEXT_TRANS(vlb_v, 0, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlh_v, 1, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlw_v, 2, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vle_v, 3, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlbu_v, 4, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlhu_v, 5, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlwu_v, 6, r2nfvm, ld_us_op, ld_us_check)
+GEN_VEXT_TRANS(vle8_v,  8,  0, r2nfvm, ld_us_op, ld_us_check)
+GEN_VEXT_TRANS(vle16_v, 16, 1, r2nfvm, ld_us_op, ld_us_check)
+GEN_VEXT_TRANS(vle32_v, 32, 2, r2nfvm, ld_us_op, ld_us_check)
+GEN_VEXT_TRANS(vle64_v, 64, 3, r2nfvm, ld_us_op, ld_us_check)
 
 static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
 {
     uint32_t data = 0;
     gen_helper_ldst_us *fn;
-    static gen_helper_ldst_us * const fns[2][4][4] = {
-        /* masked unit stride load and store */
-        { { gen_helper_vsb_v_b_mask,  gen_helper_vsb_v_h_mask,
-            gen_helper_vsb_v_w_mask,  gen_helper_vsb_v_d_mask },
-          { NULL,                     gen_helper_vsh_v_h_mask,
-            gen_helper_vsh_v_w_mask,  gen_helper_vsh_v_d_mask },
-          { NULL,                     NULL,
-            gen_helper_vsw_v_w_mask,  gen_helper_vsw_v_d_mask },
-          { gen_helper_vse_v_b_mask,  gen_helper_vse_v_h_mask,
-            gen_helper_vse_v_w_mask,  gen_helper_vse_v_d_mask } },
+    static gen_helper_ldst_us * const fns[2][4] = {
+        /* masked unit stride store */
+        { gen_helper_vse8_v_mask, gen_helper_vse16_v_mask,
+          gen_helper_vse32_v_mask, gen_helper_vse64_v_mask },
         /* unmasked unit stride store */
-        { { gen_helper_vsb_v_b,  gen_helper_vsb_v_h,
-            gen_helper_vsb_v_w,  gen_helper_vsb_v_d },
-          { NULL,                gen_helper_vsh_v_h,
-            gen_helper_vsh_v_w,  gen_helper_vsh_v_d },
-          { NULL,                NULL,
-            gen_helper_vsw_v_w,  gen_helper_vsw_v_d },
-          { gen_helper_vse_v_b,  gen_helper_vse_v_h,
-            gen_helper_vse_v_w,  gen_helper_vse_v_d } }
+        { gen_helper_vse8_v, gen_helper_vse16_v,
+          gen_helper_vse32_v, gen_helper_vse64_v }
     };
 
-    fn =  fns[a->vm][seq][s->sew];
+    fn =  fns[a->vm][seq];
     if (fn == NULL) {
         return false;
     }
@@ -596,15 +592,15 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
 
 static bool st_us_check(DisasContext *s, arg_r2nfvm* a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_store(s, a->rd, a->nf);
 }
 
-GEN_VEXT_TRANS(vsb_v, 0, r2nfvm, st_us_op, st_us_check)
-GEN_VEXT_TRANS(vsh_v, 1, r2nfvm, st_us_op, st_us_check)
-GEN_VEXT_TRANS(vsw_v, 2, r2nfvm, st_us_op, st_us_check)
-GEN_VEXT_TRANS(vse_v, 3, r2nfvm, st_us_op, st_us_check)
+GEN_VEXT_TRANS(vse8_v,  8,  0, r2nfvm, st_us_op, st_us_check)
+GEN_VEXT_TRANS(vse16_v, 16, 1, r2nfvm, st_us_op, st_us_check)
+GEN_VEXT_TRANS(vse32_v, 32, 2, r2nfvm, st_us_op, st_us_check)
+GEN_VEXT_TRANS(vse64_v, 64, 3, r2nfvm, st_us_op, st_us_check)
 
 /*
  *** stride load and store
@@ -652,24 +648,12 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
 {
     uint32_t data = 0;
     gen_helper_ldst_stride *fn;
-    static gen_helper_ldst_stride * const fns[7][4] = {
-        { gen_helper_vlsb_v_b,  gen_helper_vlsb_v_h,
-          gen_helper_vlsb_v_w,  gen_helper_vlsb_v_d },
-        { NULL,                 gen_helper_vlsh_v_h,
-          gen_helper_vlsh_v_w,  gen_helper_vlsh_v_d },
-        { NULL,                 NULL,
-          gen_helper_vlsw_v_w,  gen_helper_vlsw_v_d },
-        { gen_helper_vlse_v_b,  gen_helper_vlse_v_h,
-          gen_helper_vlse_v_w,  gen_helper_vlse_v_d },
-        { gen_helper_vlsbu_v_b, gen_helper_vlsbu_v_h,
-          gen_helper_vlsbu_v_w, gen_helper_vlsbu_v_d },
-        { NULL,                 gen_helper_vlshu_v_h,
-          gen_helper_vlshu_v_w, gen_helper_vlshu_v_d },
-        { NULL,                 NULL,
-          gen_helper_vlswu_v_w, gen_helper_vlswu_v_d },
+    static gen_helper_ldst_stride * const fns[4] = {
+        gen_helper_vlse8_v, gen_helper_vlse16_v,
+        gen_helper_vlse32_v, gen_helper_vlse64_v
     };
 
-    fn =  fns[seq][s->sew];
+    fn = fns[seq];
     if (fn == NULL) {
         return false;
     }
@@ -685,34 +669,24 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
 
 static bool ld_stride_check(DisasContext *s, arg_rnfvm* a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_load(s, a->rd, a->nf, a->vm);
 }
 
-GEN_VEXT_TRANS(vlsb_v, 0, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlsh_v, 1, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlsw_v, 2, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlse_v, 3, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlsbu_v, 4, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlshu_v, 5, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlswu_v, 6, rnfvm, ld_stride_op, ld_stride_check)
+GEN_VEXT_TRANS(vlse8_v,  8,  0, rnfvm, ld_stride_op, ld_stride_check)
+GEN_VEXT_TRANS(vlse16_v, 16, 1, rnfvm, ld_stride_op, ld_stride_check)
+GEN_VEXT_TRANS(vlse32_v, 32, 2, rnfvm, ld_stride_op, ld_stride_check)
+GEN_VEXT_TRANS(vlse64_v, 64, 3, rnfvm, ld_stride_op, ld_stride_check)
 
 static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
 {
     uint32_t data = 0;
     gen_helper_ldst_stride *fn;
-    static gen_helper_ldst_stride * const fns[4][4] = {
+    static gen_helper_ldst_stride * const fns[4] = {
         /* masked stride store */
-        { gen_helper_vssb_v_b,  gen_helper_vssb_v_h,
-          gen_helper_vssb_v_w,  gen_helper_vssb_v_d },
-        { NULL,                 gen_helper_vssh_v_h,
-          gen_helper_vssh_v_w,  gen_helper_vssh_v_d },
-        { NULL,                 NULL,
-          gen_helper_vssw_v_w,  gen_helper_vssw_v_d },
-        { gen_helper_vsse_v_b,  gen_helper_vsse_v_h,
-          gen_helper_vsse_v_w,  gen_helper_vsse_v_d }
+        gen_helper_vsse8_v,  gen_helper_vsse16_v,
+        gen_helper_vsse32_v,  gen_helper_vsse64_v
     };
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
@@ -721,7 +695,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
     data = FIELD_DP32(data, VDATA, VMA, s->vma);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    fn =  fns[seq][s->sew];
+    fn = fns[seq];
     if (fn == NULL) {
         return false;
     }
@@ -731,15 +705,15 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
 
 static bool st_stride_check(DisasContext *s, arg_rnfvm* a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_store(s, a->rd, a->nf);
 }
 
-GEN_VEXT_TRANS(vssb_v, 0, rnfvm, st_stride_op, st_stride_check)
-GEN_VEXT_TRANS(vssh_v, 1, rnfvm, st_stride_op, st_stride_check)
-GEN_VEXT_TRANS(vssw_v, 2, rnfvm, st_stride_op, st_stride_check)
-GEN_VEXT_TRANS(vsse_v, 3, rnfvm, st_stride_op, st_stride_check)
+GEN_VEXT_TRANS(vsse8_v,  8,  0, rnfvm, st_stride_op, st_stride_check)
+GEN_VEXT_TRANS(vsse16_v, 16, 1, rnfvm, st_stride_op, st_stride_check)
+GEN_VEXT_TRANS(vsse32_v, 32, 2, rnfvm, st_stride_op, st_stride_check)
+GEN_VEXT_TRANS(vsse64_v, 64, 3, rnfvm, st_stride_op, st_stride_check)
 
 /*
  *** index load and store
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9320eeabfd..74a22fb607 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -249,38 +249,20 @@ typedef void vext_ldst_elem_fn(CPURISCVState *env, target_ulong addr,
 typedef void clear_fn(void *vd, uint32_t vta, uint32_t idx,
                       uint32_t cnt, uint32_t tot);
 
-#define GEN_VEXT_LD_ELEM(NAME, MTYPE, ETYPE, H, LDSUF)     \
+#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
 static void NAME(CPURISCVState *env, abi_ptr addr,         \
                  uint32_t idx, void *vd, uintptr_t retaddr)\
 {                                                          \
-    MTYPE data;                                            \
+    ETYPE data;                                            \
     ETYPE *cur = ((ETYPE *)vd + H(idx));                   \
     data = cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
     *cur = data;                                           \
 }                                                          \
 
-GEN_VEXT_LD_ELEM(ldb_b, int8_t,  int8_t,  H1, ldsb)
-GEN_VEXT_LD_ELEM(ldb_h, int8_t,  int16_t, H2, ldsb)
-GEN_VEXT_LD_ELEM(ldb_w, int8_t,  int32_t, H4, ldsb)
-GEN_VEXT_LD_ELEM(ldb_d, int8_t,  int64_t, H8, ldsb)
-GEN_VEXT_LD_ELEM(ldh_h, int16_t, int16_t, H2, ldsw)
-GEN_VEXT_LD_ELEM(ldh_w, int16_t, int32_t, H4, ldsw)
-GEN_VEXT_LD_ELEM(ldh_d, int16_t, int64_t, H8, ldsw)
-GEN_VEXT_LD_ELEM(ldw_w, int32_t, int32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(ldw_d, int32_t, int64_t, H8, ldl)
-GEN_VEXT_LD_ELEM(lde_b, int8_t,  int8_t,  H1, ldsb)
-GEN_VEXT_LD_ELEM(lde_h, int16_t, int16_t, H2, ldsw)
-GEN_VEXT_LD_ELEM(lde_w, int32_t, int32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(lde_d, int64_t, int64_t, H8, ldq)
-GEN_VEXT_LD_ELEM(ldbu_b, uint8_t,  uint8_t,  H1, ldub)
-GEN_VEXT_LD_ELEM(ldbu_h, uint8_t,  uint16_t, H2, ldub)
-GEN_VEXT_LD_ELEM(ldbu_w, uint8_t,  uint32_t, H4, ldub)
-GEN_VEXT_LD_ELEM(ldbu_d, uint8_t,  uint64_t, H8, ldub)
-GEN_VEXT_LD_ELEM(ldhu_h, uint16_t, uint16_t, H2, lduw)
-GEN_VEXT_LD_ELEM(ldhu_w, uint16_t, uint32_t, H4, lduw)
-GEN_VEXT_LD_ELEM(ldhu_d, uint16_t, uint64_t, H8, lduw)
-GEN_VEXT_LD_ELEM(ldwu_w, uint32_t, uint32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(ldwu_d, uint32_t, uint64_t, H8, ldl)
+GEN_VEXT_LD_ELEM(lde_b, int8_t,  H1, ldsb)
+GEN_VEXT_LD_ELEM(lde_h, int16_t, H2, ldsw)
+GEN_VEXT_LD_ELEM(lde_w, int32_t, H4, ldl)
+GEN_VEXT_LD_ELEM(lde_d, int64_t, H8, ldq)
 
 #define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)            \
 static void NAME(CPURISCVState *env, abi_ptr addr,         \
@@ -290,15 +272,6 @@ static void NAME(CPURISCVState *env, abi_ptr addr,         \
     cpu_##STSUF##_data_ra(env, addr, data, retaddr);       \
 }
 
-GEN_VEXT_ST_ELEM(stb_b, int8_t,  H1, stb)
-GEN_VEXT_ST_ELEM(stb_h, int16_t, H2, stb)
-GEN_VEXT_ST_ELEM(stb_w, int32_t, H4, stb)
-GEN_VEXT_ST_ELEM(stb_d, int64_t, H8, stb)
-GEN_VEXT_ST_ELEM(sth_h, int16_t, H2, stw)
-GEN_VEXT_ST_ELEM(sth_w, int32_t, H4, stw)
-GEN_VEXT_ST_ELEM(sth_d, int64_t, H8, stw)
-GEN_VEXT_ST_ELEM(stw_w, int32_t, H4, stl)
-GEN_VEXT_ST_ELEM(stw_d, int64_t, H8, stl)
 GEN_VEXT_ST_ELEM(ste_b, int8_t,  H1, stb)
 GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
 GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
@@ -312,8 +285,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
                  target_ulong stride, CPURISCVState *env,
                  uint32_t desc, uint32_t vm,
                  vext_ldst_elem_fn *ldst_elem, clear_fn *clear_elem,
-                 uint32_t esz, uint32_t msz, uintptr_t ra,
-                 MMUAccessType access_type)
+                 uint32_t esz, uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
@@ -325,7 +297,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, base + stride * i, nf * msz, ra, access_type);
+        probe_pages(env, base + stride * i, nf * esz, ra, access_type);
     }
     /* do real access */
     for (i = 0; i < env->vl; i++) {
@@ -334,7 +306,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
             continue;
         }
         while (k < nf) {
-            target_ulong addr = base + stride * i + k * msz;
+            target_ulong addr = base + stride * i + k * esz;
             ldst_elem(env, addr, i + k * vlmax, vd, ra);
             k++;
         }
@@ -348,64 +320,37 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     }
 }
 
-#define GEN_VEXT_LD_STRIDE(NAME, MTYPE, ETYPE, LOAD_FN, CLEAR_FN)       \
+#define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN, CLEAR_FN)              \
 void HELPER(NAME)(void *vd, void * v0, target_ulong base,               \
                   target_ulong stride, CPURISCVState *env,              \
                   uint32_t desc)                                        \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      \
-                     CLEAR_FN, sizeof(ETYPE), sizeof(MTYPE),            \
+                     CLEAR_FN, sizeof(ETYPE),                           \
                      GETPC(), MMU_DATA_LOAD);                           \
 }
 
-GEN_VEXT_LD_STRIDE(vlsb_v_b,  int8_t,   int8_t,   ldb_b,  clearb)
-GEN_VEXT_LD_STRIDE(vlsb_v_h,  int8_t,   int16_t,  ldb_h,  clearh)
-GEN_VEXT_LD_STRIDE(vlsb_v_w,  int8_t,   int32_t,  ldb_w,  clearl)
-GEN_VEXT_LD_STRIDE(vlsb_v_d,  int8_t,   int64_t,  ldb_d,  clearq)
-GEN_VEXT_LD_STRIDE(vlsh_v_h,  int16_t,  int16_t,  ldh_h,  clearh)
-GEN_VEXT_LD_STRIDE(vlsh_v_w,  int16_t,  int32_t,  ldh_w,  clearl)
-GEN_VEXT_LD_STRIDE(vlsh_v_d,  int16_t,  int64_t,  ldh_d,  clearq)
-GEN_VEXT_LD_STRIDE(vlsw_v_w,  int32_t,  int32_t,  ldw_w,  clearl)
-GEN_VEXT_LD_STRIDE(vlsw_v_d,  int32_t,  int64_t,  ldw_d,  clearq)
-GEN_VEXT_LD_STRIDE(vlse_v_b,  int8_t,   int8_t,   lde_b,  clearb)
-GEN_VEXT_LD_STRIDE(vlse_v_h,  int16_t,  int16_t,  lde_h,  clearh)
-GEN_VEXT_LD_STRIDE(vlse_v_w,  int32_t,  int32_t,  lde_w,  clearl)
-GEN_VEXT_LD_STRIDE(vlse_v_d,  int64_t,  int64_t,  lde_d,  clearq)
-GEN_VEXT_LD_STRIDE(vlsbu_v_b, uint8_t,  uint8_t,  ldbu_b, clearb)
-GEN_VEXT_LD_STRIDE(vlsbu_v_h, uint8_t,  uint16_t, ldbu_h, clearh)
-GEN_VEXT_LD_STRIDE(vlsbu_v_w, uint8_t,  uint32_t, ldbu_w, clearl)
-GEN_VEXT_LD_STRIDE(vlsbu_v_d, uint8_t,  uint64_t, ldbu_d, clearq)
-GEN_VEXT_LD_STRIDE(vlshu_v_h, uint16_t, uint16_t, ldhu_h, clearh)
-GEN_VEXT_LD_STRIDE(vlshu_v_w, uint16_t, uint32_t, ldhu_w, clearl)
-GEN_VEXT_LD_STRIDE(vlshu_v_d, uint16_t, uint64_t, ldhu_d, clearq)
-GEN_VEXT_LD_STRIDE(vlswu_v_w, uint32_t, uint32_t, ldwu_w, clearl)
-GEN_VEXT_LD_STRIDE(vlswu_v_d, uint32_t, uint64_t, ldwu_d, clearq)
-
-#define GEN_VEXT_ST_STRIDE(NAME, MTYPE, ETYPE, STORE_FN)                \
+GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b,  clearb)
+GEN_VEXT_LD_STRIDE(vlse16_v, int16_t, lde_h,  clearh)
+GEN_VEXT_LD_STRIDE(vlse32_v, int32_t, lde_w,  clearl)
+GEN_VEXT_LD_STRIDE(vlse64_v, int64_t, lde_d,  clearq)
+
+#define GEN_VEXT_ST_STRIDE(NAME, ETYPE, STORE_FN)                       \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   target_ulong stride, CPURISCVState *env,              \
                   uint32_t desc)                                        \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     \
-                     NULL, sizeof(ETYPE), sizeof(MTYPE),                \
+                     NULL, sizeof(ETYPE),                               \
                      GETPC(), MMU_DATA_STORE);                          \
 }
 
-GEN_VEXT_ST_STRIDE(vssb_v_b, int8_t,  int8_t,  stb_b)
-GEN_VEXT_ST_STRIDE(vssb_v_h, int8_t,  int16_t, stb_h)
-GEN_VEXT_ST_STRIDE(vssb_v_w, int8_t,  int32_t, stb_w)
-GEN_VEXT_ST_STRIDE(vssb_v_d, int8_t,  int64_t, stb_d)
-GEN_VEXT_ST_STRIDE(vssh_v_h, int16_t, int16_t, sth_h)
-GEN_VEXT_ST_STRIDE(vssh_v_w, int16_t, int32_t, sth_w)
-GEN_VEXT_ST_STRIDE(vssh_v_d, int16_t, int64_t, sth_d)
-GEN_VEXT_ST_STRIDE(vssw_v_w, int32_t, int32_t, stw_w)
-GEN_VEXT_ST_STRIDE(vssw_v_d, int32_t, int64_t, stw_d)
-GEN_VEXT_ST_STRIDE(vsse_v_b, int8_t,  int8_t,  ste_b)
-GEN_VEXT_ST_STRIDE(vsse_v_h, int16_t, int16_t, ste_h)
-GEN_VEXT_ST_STRIDE(vsse_v_w, int32_t, int32_t, ste_w)
-GEN_VEXT_ST_STRIDE(vsse_v_d, int64_t, int64_t, ste_d)
+GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
+GEN_VEXT_ST_STRIDE(vsse16_v, int16_t, ste_h)
+GEN_VEXT_ST_STRIDE(vsse32_v, int32_t, ste_w)
+GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 
 /*
  *** unit-stride: access elements stored contiguously in memory
@@ -415,8 +360,7 @@ GEN_VEXT_ST_STRIDE(vsse_v_d, int64_t, int64_t, ste_d)
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
              vext_ldst_elem_fn *ldst_elem, clear_fn *clear_elem,
-             uint32_t esz, uint32_t msz, uintptr_t ra,
-             MMUAccessType access_type)
+             uint32_t esz, uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
@@ -424,12 +368,12 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t vta = vext_vta(desc);
 
     /* probe every access */
-    probe_pages(env, base, env->vl * nf * msz, ra, access_type);
+    probe_pages(env, base, env->vl * nf * esz, ra, access_type);
     /* load bytes from guest memory */
     for (i = 0; i < env->vl; i++) {
         k = 0;
         while (k < nf) {
-            target_ulong addr = base + (i * nf + k) * msz;
+            target_ulong addr = base + (i * nf + k) * esz;
             ldst_elem(env, addr, i + k * vlmax, vd, ra);
             k++;
         }
@@ -448,13 +392,13 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
  * stride = NF * sizeof (MTYPE)
  */
 
-#define GEN_VEXT_LD_US(NAME, MTYPE, ETYPE, LOAD_FN, CLEAR_FN)           \
+#define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN, CLEAR_FN)                  \
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
                          CPURISCVState *env, uint32_t desc)             \
 {                                                                       \
-    uint32_t stride = vext_nf(desc) * sizeof(MTYPE);                    \
+    uint32_t stride = vext_nf(desc) * sizeof(ETYPE);                    \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   \
-                     CLEAR_FN, sizeof(ETYPE), sizeof(MTYPE),            \
+                     CLEAR_FN, sizeof(ETYPE),                           \
                      GETPC(), MMU_DATA_LOAD);                           \
 }                                                                       \
                                                                         \
@@ -462,39 +406,21 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, LOAD_FN, CLEAR_FN,                \
-                 sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_LOAD); \
-}
-
-GEN_VEXT_LD_US(vlb_v_b,  int8_t,   int8_t,   ldb_b,  clearb)
-GEN_VEXT_LD_US(vlb_v_h,  int8_t,   int16_t,  ldb_h,  clearh)
-GEN_VEXT_LD_US(vlb_v_w,  int8_t,   int32_t,  ldb_w,  clearl)
-GEN_VEXT_LD_US(vlb_v_d,  int8_t,   int64_t,  ldb_d,  clearq)
-GEN_VEXT_LD_US(vlh_v_h,  int16_t,  int16_t,  ldh_h,  clearh)
-GEN_VEXT_LD_US(vlh_v_w,  int16_t,  int32_t,  ldh_w,  clearl)
-GEN_VEXT_LD_US(vlh_v_d,  int16_t,  int64_t,  ldh_d,  clearq)
-GEN_VEXT_LD_US(vlw_v_w,  int32_t,  int32_t,  ldw_w,  clearl)
-GEN_VEXT_LD_US(vlw_v_d,  int32_t,  int64_t,  ldw_d,  clearq)
-GEN_VEXT_LD_US(vle_v_b,  int8_t,   int8_t,   lde_b,  clearb)
-GEN_VEXT_LD_US(vle_v_h,  int16_t,  int16_t,  lde_h,  clearh)
-GEN_VEXT_LD_US(vle_v_w,  int32_t,  int32_t,  lde_w,  clearl)
-GEN_VEXT_LD_US(vle_v_d,  int64_t,  int64_t,  lde_d,  clearq)
-GEN_VEXT_LD_US(vlbu_v_b, uint8_t,  uint8_t,  ldbu_b, clearb)
-GEN_VEXT_LD_US(vlbu_v_h, uint8_t,  uint16_t, ldbu_h, clearh)
-GEN_VEXT_LD_US(vlbu_v_w, uint8_t,  uint32_t, ldbu_w, clearl)
-GEN_VEXT_LD_US(vlbu_v_d, uint8_t,  uint64_t, ldbu_d, clearq)
-GEN_VEXT_LD_US(vlhu_v_h, uint16_t, uint16_t, ldhu_h, clearh)
-GEN_VEXT_LD_US(vlhu_v_w, uint16_t, uint32_t, ldhu_w, clearl)
-GEN_VEXT_LD_US(vlhu_v_d, uint16_t, uint64_t, ldhu_d, clearq)
-GEN_VEXT_LD_US(vlwu_v_w, uint32_t, uint32_t, ldwu_w, clearl)
-GEN_VEXT_LD_US(vlwu_v_d, uint32_t, uint64_t, ldwu_d, clearq)
-
-#define GEN_VEXT_ST_US(NAME, MTYPE, ETYPE, STORE_FN)                    \
+                 sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);                \
+}
+
+GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b, clearb)
+GEN_VEXT_LD_US(vle16_v, int16_t, lde_h, clearh)
+GEN_VEXT_LD_US(vle32_v, int32_t, lde_w, clearl)
+GEN_VEXT_LD_US(vle64_v, int64_t, lde_d, clearq)
+
+#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                           \
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
                          CPURISCVState *env, uint32_t desc)             \
 {                                                                       \
-    uint32_t stride = vext_nf(desc) * sizeof(MTYPE);                    \
+    uint32_t stride = vext_nf(desc) * sizeof(ETYPE);                    \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  \
-                     NULL, sizeof(ETYPE), sizeof(MTYPE),                \
+                     NULL, sizeof(ETYPE),                               \
                      GETPC(), MMU_DATA_STORE);                          \
 }                                                                       \
                                                                         \
@@ -502,22 +428,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, STORE_FN, NULL,                   \
-                 sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_STORE);\
-}
-
-GEN_VEXT_ST_US(vsb_v_b, int8_t,  int8_t , stb_b)
-GEN_VEXT_ST_US(vsb_v_h, int8_t,  int16_t, stb_h)
-GEN_VEXT_ST_US(vsb_v_w, int8_t,  int32_t, stb_w)
-GEN_VEXT_ST_US(vsb_v_d, int8_t,  int64_t, stb_d)
-GEN_VEXT_ST_US(vsh_v_h, int16_t, int16_t, sth_h)
-GEN_VEXT_ST_US(vsh_v_w, int16_t, int32_t, sth_w)
-GEN_VEXT_ST_US(vsh_v_d, int16_t, int64_t, sth_d)
-GEN_VEXT_ST_US(vsw_v_w, int32_t, int32_t, stw_w)
-GEN_VEXT_ST_US(vsw_v_d, int32_t, int64_t, stw_d)
-GEN_VEXT_ST_US(vse_v_b, int8_t,  int8_t , ste_b)
-GEN_VEXT_ST_US(vse_v_h, int16_t, int16_t, ste_h)
-GEN_VEXT_ST_US(vse_v_w, int32_t, int32_t, ste_w)
-GEN_VEXT_ST_US(vse_v_d, int64_t, int64_t, ste_d)
+                 sizeof(ETYPE), GETPC(), MMU_DATA_STORE);               \
+}
+
+GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
+GEN_VEXT_ST_US(vse16_v, int16_t, ste_h)
+GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
+GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
 
 /*
  *** index: access vector element from indexed memory
-- 
2.17.1


