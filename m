Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9Iy-0001EE-EW
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Iw-00018C-0g
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:06 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9It-0002EM-KU
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:05 -0500
Received: by mail-pj1-x1033.google.com with SMTP id j13so710413pjz.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9102JJGn5s0jPf0QgEtHstboWaDBY9brqgO7As23bC4=;
 b=YJF7EA4Drm6YSRYCXnxvoMq28wOJLX/xIELn1lW3VIMGVPR6BMq0K/Oons4D0K3pO3
 em2Ao+RrfLt1yeyyaSGdcBbF9nLJArhEGU33u/1otfecAT80CX9ZKkWl9w70zDHCFldj
 MzhN8HuQh+3RNJQzRBmVh28prSMDGE6OqhBo5VVE3lEfX1Ueso/eG7auuSEoSle+5hag
 iFRNhhlmq6AsrqJCZiMrbu9MqLwiLZepeNtxoKTHGM/knGuJW3jKAKlQEDWRjMDAZTJv
 OckMRzq7ce8m/F8ntu4P+1fc6VwwlfIOoIeqqyhIBFP7vQxwg7ijipQghlLp0bnST8VH
 g7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9102JJGn5s0jPf0QgEtHstboWaDBY9brqgO7As23bC4=;
 b=UErVgYpebk7eNfB2ixrSEojFfTGC3PXekilvWpyT84L87DJ6DgkVm6yY7PoWaRS6GX
 2fiH+Ul7JcqzpF4hoyQ0OzSw0aBZZjgL5eqBmePfBesWn/qVgz9zRqm9XIPQQkBgdbEi
 bFkEfFQ5eLaMjYnl5tjP5W9R/SMmb9GWlfpwYuuDmvmWyUgku88TY24/XADi4Q92DqOR
 mAjOJCbEfgPokNbEsFntVLAieWv9OxlXWY+YYlp1wec+Lxjw/SNdd4lD7BRwKByQuGlY
 5fbzSdI45ZJflPMjsw9pQbii0/hXXaT6CAKuXSnE7byMaqVsuLaZXcCH84LjagJK6+El
 l4WA==
X-Gm-Message-State: AOAM5332Si8F0pJ/9PxGwrVhjCEqdmKcFMEoZwk8ycptYti+1t7wKD7W
 BIGzOQeGrv3ctMgpxI6g7d8hcA==
X-Google-Smtp-Source: ABdhPJymAtleudeSZoKbjgO8qffqXfBADzlpDT3d7IQYdLqAOln0BUy9TKlD1LtNK4MGsp1vLGOFHg==
X-Received: by 2002:a17:90a:f288:: with SMTP id
 fs8mr1889985pjb.184.1610418062386; 
 Mon, 11 Jan 2021 18:21:02 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:21:01 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 11/16] target/riscv: rvb: rotate (left/right)
Date: Tue, 12 Jan 2021 10:19:52 +0800
Message-Id: <20210112022001.20521-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
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
X-List-Received-Date: Tue, 12 Jan 2021 02:21:06 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 36 +++++++++++++++++++++++++
 target/riscv/translate.c                | 36 +++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 8c3ed33077e..8f9ba21b352 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -100,9 +100,12 @@ binvw      0110100 .......... 001 ..... 0111011 @r
 bextw      0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
+rorw       0110000 .......... 101 ..... 0111011 @r
+rolw       0110000 .......... 001 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
 binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
+roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0ea92312372..6d1b604c800 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -617,6 +617,8 @@ binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
 slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -624,3 +626,4 @@ binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
+rori       01100. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 44f9f639240..8a46fde4767 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -179,6 +179,24 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
     return gen_shifti(ctx, a, gen_sro);
 }
 
+static bool trans_ror(DisasContext *ctx, arg_ror *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rori(DisasContext *ctx, arg_rori *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rol(DisasContext *ctx, arg_rol *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotl_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -278,4 +296,22 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     return gen_shiftiw(ctx, a, gen_sro);
 }
 
+static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rorw);
+}
+
+static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_rorw);
+}
+
+static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rolw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 678c3dca81f..eee69e6bba9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -828,6 +828,42 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


