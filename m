Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscq-0006hh-MW
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqff-0006AD-Ei
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:23 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfd-0006zv-RQ
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:23 -0400
Received: by mail-pg1-x529.google.com with SMTP id m22so2367297pgv.9
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QsDIouMcLmhjC1OHMDRAz89GdLgHmksZmjP0cqoOa0o=;
 b=eAoofTdXU5H9pwvAB3Fl7M+erCBTMNPG+QhFHvb88xvcP+hV7RLga10zd9smjosxJI
 Vo4rQTaxR2QD0byK73QGsQGpHfA9jCSN+7NNMjmXsmi7++HeJAWRZp0hLckt663COu3q
 lbn2gDhL2W7ffA49Q+XsOHTcxfBya44CD/UTdWbC0Mig8FZQC0cZ2W9d43jHlLzF9d7W
 BxW1djqWhDc13ICLVja42KujfysTgs8JAaPm0OQ4n47FtSefMjwfc4sj6g4+cpj6RCI6
 +oGXRy8OzvGquCaGln9RZLFYblrcVhSqC6yqIxsAMZrXXoZPIsAkUomtXTk0MlSGMNT7
 Sv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QsDIouMcLmhjC1OHMDRAz89GdLgHmksZmjP0cqoOa0o=;
 b=nAfPg7y1tyZ1q7o/TstacrXPC3Hw2BvZvmNjqdjYHXXMUxN+ftj0nTQRdsgssnfHcE
 q/dKhpIvU9sEFFYT7KJ14ZH3xHg+BLpVuypk88fw+TgndPWdOZNRSEL7Z4og8HGNWtGC
 FKNZYSiou7hUiukGsrSobeCCqokmQ9tSalCaGg39vc1prZsLiyWNEK5X6LpSJ49/PLcB
 LTdMdg59qwNB6/LZdkNnkC+n5uMRP5W023n/aLUT/lRIe6YvYyYQ87AYR6Kcjf1mOH0W
 EAgboonuzYqJrJ+8beROYkbVBJrzzJ54Sl6rQ2+0M0n0LxbN6dXOGoVMtrlRtutf+FQp
 B2pQ==
X-Gm-Message-State: AOAM531al7ArJamijdINWbsmh0wRZfRVslz5028Lr8X0aoSFob42xFqD
 nUXFU+RWLM/D10Qsp9V1nYT2qw==
X-Google-Smtp-Source: ABdhPJzhmxwKw5pdw9xdu5GF9j5xoAY+L3Ge+Sce6BELSAJGx0QlZ34G6sbkForpz2tt6DYX7A7ZhQ==
X-Received: by 2002:a63:d911:: with SMTP id r17mr55932370pgg.202.1594378460674; 
 Fri, 10 Jul 2020 03:54:20 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:20 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 56/65] target/riscv: rvv-0.9: remove integer extract instruction
Date: Fri, 10 Jul 2020 18:49:10 +0800
Message-Id: <20200710104920.13550-57-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:23 -0000

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
index 2490fc5732..fb2c119e13 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2959,8 +2959,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -3062,27 +3060,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
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


