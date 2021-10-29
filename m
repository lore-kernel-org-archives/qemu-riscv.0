Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNnK-0008Dj-63
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnG-0008Aq-BT
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnC-0006el-5G
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:20 -0400
Received: by mail-pj1-x1033.google.com with SMTP id in13so4395389pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ftvjvCQfoklWOqLL2y7YTSZ6nmoxZ3vi2iOlXpfe2XA=;
 b=G0ZeAlLtw8j601DweL0bw7VEgLzBJaH8q55tBSZc7I8dep1Pp+NV2cKWb/Wbq7fiBx
 LLMMa0TGoX3DLgTmTJbjd6aO7JSMIYBVpGOzL7qwDR1oCAh8kyJ0bhUZJzF6SWUYjAVM
 PXSXmBvN7XD81HIMJUbxooidcl9xf7B9iRKjDDmRLiqSkU17xheRQpUI8ZaMoXAzRvoJ
 t0SrzgiZyn7rV+udn8BdcIPEDA1b87wp2EzVmdzXyINWD2xle6VlQ8mtBAsMMkuZ6PIz
 OjkUHatVE8Bi8Am28C4q6xWvOn50KdPOkpqRAZIf2xyjvy8kXv6ZZWOKGjibg9yKMD1U
 zlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ftvjvCQfoklWOqLL2y7YTSZ6nmoxZ3vi2iOlXpfe2XA=;
 b=C4FQkzVHJeddhDKmCaeJviwD7gyVhD2OwS6lVYYhi/HVTuZgubOOO7npcwoO6KFgiK
 ZkQ8ARKAFK4s82kRhlc9DvoGAVcLNqGDa/uLehUC8Gsm+Pft9M9rD4wmh3l3vmMJCwJY
 ECh11dE6qkokqJolxEw55aR2to2m9VDtNcbeOP1/L+HsZkm1xugHO0PqXLEa3Hkh51T3
 Y4Ayp+Ha4dOHpIUzcaejOPM9R26zIzM18wdu2N0dCWY0vW8HDiF6jXee/EfyUdOURSeh
 hsNGoxwhaPltIo47vjYDDQX6MVtBm9eAApP8S08ND58Hm8+AD6jDDo63nTYdYcuFsFYb
 5TvQ==
X-Gm-Message-State: AOAM5318mL6W0FAn+oGepNzC7Vism+v20Nq0WWdQfFOxuqnpqTZ6bnyP
 ziuztel3YjuWQOUzvbxNQxMyQw==
X-Google-Smtp-Source: ABdhPJySvqk0QUH1u0Smx5SU0/2HAoUP8IA95Ocm5lRqYwnSzg/YMWOEhzqhdOHsS7tRI48dJxZNDA==
X-Received: by 2002:a17:90a:640a:: with SMTP id
 g10mr12136189pjj.198.1635498196820; 
 Fri, 29 Oct 2021 02:03:16 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:03:16 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 58/76] target/riscv: rvv-1.0: remove integer extract
 instruction
Date: Fri, 29 Oct 2021 16:59:03 +0800
Message-Id: <20211029085922.255197-59-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:03:22 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 82484fda751..20b3095f56c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4c5f813ccf9..1ce5a10b6a8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2840,8 +2840,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -2941,27 +2939,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = dest_gpr(s, a->rd);
-
-    if (a->rs1 == 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0, false);
-    } else {
-        /* This instruction ignores LMUL and vector register groups */
-        int vlmax = s->vlen >> (3 + s->sew);
-        vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
-    }
-
-    tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(s, a->rd, dest);
-
-    tcg_temp_free_i64(tmp);
-    return true;
-}
-
 /* Integer Scalar Move Instruction */
 
 static void store_element(TCGv_i64 val, TCGv_ptr base,
-- 
2.25.1


