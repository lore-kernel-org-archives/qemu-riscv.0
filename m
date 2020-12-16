Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpMBM-000159-Br
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 21:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBJ-00011U-Au
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:04:45 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBH-0001CV-Js
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:04:45 -0500
Received: by mail-pj1-x1033.google.com with SMTP id l23so688127pjg.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 18:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iZK+rKAjOqv0UzEWB+rVOqX+wmO1H/CoTR7mTkztrw4=;
 b=LRrIBYVOjZ4gaQJ9swG7s9vZqnEnf+CPIsVrsobVI/1QhkuXTUlvscH3OF0kb3kGeE
 znFDs6tabotuq2W4ES9JZ6Shu31/ebF6/v5gyi09Qykylrt43CE894I7Dcmxua5fVYUU
 b5odlXFRoUIUeTmDcmsNO3Y5NHErq5by4+OQV6c+0Zqq5UDii/9gIfL+E4ENPilGNG7U
 JvwF86ThQr9pIOg7lzcLLZrx3AcpwpeF68TPKJr3kYhJXh8W+YR8sySoT3WVsxAjhXoF
 G8Gu/EywIMk8atme1WsfFuz6A+N0HvcmUjcpX32lupzFKIrKeV4+UwmuIpVB/isGU5q4
 UD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iZK+rKAjOqv0UzEWB+rVOqX+wmO1H/CoTR7mTkztrw4=;
 b=IX2X5hIGmMsvbsgMvMADN6KrH8uHrRzRTonGyf5LkuW9IOjvC0X5ksZbDSZ6BYL2so
 j274/DhNbIJ3oCZQEsd7js7uGfxjfCc92ADNX5w7pdmA2iTxkRhiRpY8Fwi+3g1SGRPZ
 5c0cv6BjXzaTR11u7GfffQxgx0NUaLwXsL4RfKY8EIyKk4G4NG+GFpxL9qvlz5roFD4o
 f+A5PXTDNNL1KCYy/tuQMtd3J7WBrAqG5dN3fiG0lXBJavKRsSQeQF9rzlZ94UQTN5Kt
 46nWoOfpm6+BtDbo2Oz7Jz0416Wf6rVFD5akWG5B5/9jgaqH65Z3xwrRu4Q9r3F+EYc8
 EMsQ==
X-Gm-Message-State: AOAM5304kpsAcExZB2tqQPvgln9eViQaTuAojHT2uihxp9t6RI5pLDXB
 DhV9Y1IhrwkB4TKxUHJk9+pVzQ==
X-Google-Smtp-Source: ABdhPJzXNBfhMClpQSOvbpzqiCtsZCyMMscbthuhjJuBb+BEmIH5oa7XUf0rsGLHweOmDVMYqs7cwg==
X-Received: by 2002:a17:90b:384c:: with SMTP id
 nl12mr1221689pjb.72.1608084282334; 
 Tue, 15 Dec 2020 18:04:42 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:04:41 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 14/15] target/riscv: rvb: add/sub with postfix zero-extend
Date: Wed, 16 Dec 2020 10:01:39 +0800
Message-Id: <20201216020150.3157-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
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
X-List-Received-Date: Wed, 16 Dec 2020 02:04:45 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 22 ++++++++++++++++++++++
 target/riscv/translate.c                |  6 ++++++
 3 files changed, 31 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 1059cab5aa4..f819028266c 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -107,6 +107,7 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1addu_w  0010000 .......... 010 ..... 0111011 @r
 sh2addu_w  0010000 .......... 100 ..... 0111011 @r
 sh3addu_w  0010000 .......... 110 ..... 0111011 @r
+addu_w     0000100 .......... 000 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
@@ -116,3 +117,5 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+slliu_w    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 07fe662b005..323ca5eccee 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -441,4 +441,26 @@ GEN_TRANS_SHADDU_W(1)
 GEN_TRANS_SHADDU_W(2)
 GEN_TRANS_SHADDU_W(3)
 
+static bool trans_addu_w(DisasContext *ctx, arg_addu_w *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_addu_w);
+}
+
+static bool trans_slliu_w(DisasContext *ctx, arg_slliu_w *a)
+{
+    TCGv source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt < 32) {
+        tcg_gen_deposit_z_i64(source1, source1, a->shamt, 32);
+    } else {
+        tcg_gen_shli_i64(source1, source1, a->shamt);
+    }
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f9385bbcd4f..84e55880234 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -955,6 +955,12 @@ GEN_SHADDU_W(1)
 GEN_SHADDU_W(2)
 GEN_SHADDU_W(3)
 
+static void gen_addu_w(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


