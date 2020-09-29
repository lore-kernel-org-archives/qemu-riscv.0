Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKzW-0007rC-Mb
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzU-0007mr-RE
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:44 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzT-0002TR-3s
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:44 -0400
Received: by mail-pj1-x102b.google.com with SMTP id h23so2059384pjv.5
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FDNEElnbfbey3h8JolMyZXvxCw96pO61KijM7A08tgI=;
 b=JLY+9fEuo3fC40nuV2aiU06UWVLn9n/4txssaIWl3OAYUUMqsj1/PmSfC6s2YGNyrg
 wQDjOTtkp8DKitegHyxtrHKUjjFGSwOubDLsO0rnqBuOmneLk6/zsbloKVY0DjQR/YGJ
 Dgxu5+e7m/HSPL321d/i+vnoh/24NwZuTFKKGL7zfpMw00Vsc3Q0NfLD9I4itf169Cn0
 yafx7RYNbQJv0NE709d2wgIZXFRgyHe8uCOBiC9FXS07txQHJDZw25l3QYo5p+DuhB1q
 FN8p7JYxG8x+qdlO6cEJk/scMQSTVzr9mZnRHldkEBr4lxIb4MxJxGc2YwMoDWZqDHlt
 z5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FDNEElnbfbey3h8JolMyZXvxCw96pO61KijM7A08tgI=;
 b=ZWdpAGQTQxeLxAelrlFTLJUhF1wOFVJdgqSc/EEtzZVljnIkE5Pg4bj4sl10oGoyCa
 y1w8aB5o5l0kU5HpVcaO/RNB6f3APnTB5m5s57g/gr2ur1SZoSWxF27VaKiTvE8Ajit7
 b+Noi83sSS9GQ4pE7gIkFZ5nUd/4M5uLv31s83W93gbgtBBUCJqkuNlEsHSzWuYuiC2l
 r4N0V/UrVOAStXHoy7OT2Aydc/uoibmVEldkfl69ULrKeBhVuEVo/N0G89ZTeROzA0UT
 Q4tkJgkX8W9nssdhLjabMEnKtiL1Fj26O28Aj27HfUMu5iDaRt00xBeTopR4cg4ulrJP
 1q0g==
X-Gm-Message-State: AOAM533cYrIzMInoEXC6cLGrIxYcnB2NLFaNAE99MTGv4onsV+jpck/6
 IQfajVMR2rKIMZcx509XyeHMWA==
X-Google-Smtp-Source: ABdhPJwTv7IVfeRZMt8fyKCxJzRbOHT5t/gWMeJM1ceXB35XMnIqF8Co0hl+su+gl2VOlTaJxcTsVA==
X-Received: by 2002:a17:90b:3241:: with SMTP id
 jy1mr5249713pjb.10.1601406521503; 
 Tue, 29 Sep 2020 12:08:41 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:08:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 57/68] target/riscv: rvv-1.0: remove integer extract
 instruction
Date: Wed, 30 Sep 2020 03:04:32 +0800
Message-Id: <20200929190448.31116-58-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:45 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index db84c0d1c9..c3d9ef4fe1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -607,7 +607,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9225780145..37c97f8c61 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3083,8 +3083,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -3186,27 +3184,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = tcg_temp_new();
-
-    if (a->rs1 == 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0, false);
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


