Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAxD-0007Io-SY
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxC-0007EX-0L
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:22 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxA-0006B8-4U
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:21 -0400
Received: by mail-pl1-x634.google.com with SMTP id q17so650088pls.9
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4XgiST/D1veYazbiKyuTtyHkuik09sRwXOirOKhMGKU=;
 b=Z4Mn2epS0YZiRIWRSSf3/xjIFt10VLEZ6VmNPaqCNnUkfYQ+CT+8uHwZqp1ZQGSDdy
 adzk1OSp356EcS2xGPky3ioo64mRvW9Sg8f0SNmZepZWPYbb/xWJs5cZ52pRcZUVVVPl
 2xdXZRQLTN472fA3N2amMPKW+zcc+TsCFsdPOnZw2pAMZQp6EuIz9uNo+FPJ7CnOWYAs
 T9SEYMlsYBOMoKpz1ALVqVtFZZW1nxgIKa2p5UxzRnZjByvCrAIGgrlYtE14+Eu9t+M/
 K1zHmlYD31gWyq90BNsNO+eT2PG29oY1Mo+g/o5D8RkcpZLg6RQVq5wytgx+8UV5q6lo
 SmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4XgiST/D1veYazbiKyuTtyHkuik09sRwXOirOKhMGKU=;
 b=enOu1QxX9pi5k6ru9jjwl+cmy16aORU02BJKNgy0mJyGZBzXkK2F30obtelmnOZDgS
 uKBEgvuLrMOnd2UE9BJA4Qsb5BPaJkivLUMBKUJDaJAjzQBfsIAkZ3+4oqGG5hro67so
 0dxr4+1kTicqWroPAJUObtAJN8vmdycsevylmnf9PAWjFwef5P4Gm5SCGgXVI0Ec0fay
 UB+lFxAFWHjONyww62eXZfcs02JYZt+USuy+lAgXOAYiJ7/1AREPKRFZde98/HRBinoa
 KP5RZDdVDNmJ5SSYpDfOq3Kw/zPUBwizjK53aAmxtfdaeDBJU9hojMLV8t6R3od4daOl
 LFnQ==
X-Gm-Message-State: AOAM530dYsQD3if0PAVo80UBiPVPvQf1993l22tXIV3iCz5cD5AXziFV
 adsfZ3evBAJhoHblumZwEiRvxg==
X-Google-Smtp-Source: ABdhPJyK0n3L4f4jPH8f8GXcHzz9UZhDPOZJ/vkfFJbme7psZQL9LpOwMYL8jIky4ZSG69wgE+hroQ==
X-Received: by 2002:a17:90a:800b:: with SMTP id
 b11mr9123268pjn.105.1595409738822; 
 Wed, 22 Jul 2020 02:22:18 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:22:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 67/76] target/riscv: rvv-0.9: remove integer extract
 instruction
Date: Wed, 22 Jul 2020 17:16:30 +0800
Message-Id: <20200722091641.8834-68-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:22:22 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.inc.c | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 47337abe52..bc0e44b8ab 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -590,7 +590,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index ea55428293..6249f9af5b 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3206,8 +3206,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -3309,27 +3307,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = tcg_temp_new();
-
-    if (a->rs1 == 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0);
-    } else {
-        /* This instruction ignores LMUL and vector register groups */
-        int vlmax = s->vlen >> (3 + s->sew);
-        vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
-    }
-    tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(a->rd, dest);
-
-    tcg_temp_free(dest);
-    tcg_temp_free_i64(tmp);
-    return true;
-}
-
 /* Integer Scalar Move Instruction */
 
 static void store_element(TCGv_i64 val, TCGv_ptr base,
-- 
2.17.1


