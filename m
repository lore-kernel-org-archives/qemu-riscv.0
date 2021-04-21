Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZ4GS-0007Py-Tw
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 00:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GQ-0007P7-Vx
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:59 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GP-0003Lf-B4
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:58 -0400
Received: by mail-pf1-x429.google.com with SMTP id a12so27454344pfc.7
 for <qemu-riscv@nongnu.org>; Tue, 20 Apr 2021 21:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LKTAYv1ZhXep+SFlA+lQrA8de8BbGJbbUnzR8R+sZJc=;
 b=OwuQD3OuL3zQBldVt7wnLw0gRiBryz1rrxNW1lp+iedgLXgFe+PCC6OC8XziuCKmQD
 wy9End4ELKPazXn1M9Re8eKTdtlzbauVDHlNmwzdEMy3TFfpyJVV4CNABpIPIGiK2D5t
 PuajS0E4cOd+jg3qG3V1i+CG78qsCjN2YyiosNYH8/uinnagueY6D1gQY5ckP7gjxXqp
 NSPcr0x3rVVlZw1VTYqWQzZ7V/Yjx+j3N4FnS2SDhkUfHI8hls/RuV2vjazZtakSWrAM
 u3rrkEKXy2UrbmIAJmOgsTN/S6Zx/Dff4kOLQ7TihdolOds2X0mRltxL6DZTqN2eaGrU
 tObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LKTAYv1ZhXep+SFlA+lQrA8de8BbGJbbUnzR8R+sZJc=;
 b=rdZWIEruHdRlN62pnP8p0aW0O1c5DcsidLdgtaMMHNCVHJMGFHUeN2ynhnJjTX1AIS
 lVycXZl6X9xQirFdcKLWRNKRH62Hh+H6FVo0r94RP2Wv8g67qI9JLGKA0GMZ6bbsgd+7
 IEqWLUOR7MXMYwdrW313Tx6HknD7hYN83GeFsK/7nGiKSMlF+mAS2uqmftFs/S6CBE7j
 ZaMedU2wsItA2h5Mya65IeegTVEpFujdrDGc/vGOiaUcI3Tcu8f2zvH0D+v3thT19Qqc
 l9lCKFsOnvbZ2D1HAEQ1SbGa0MO7DnjQOy1KxOZEkX+6l6GmSvsotGNbtrFR8kMFg6xR
 1N+Q==
X-Gm-Message-State: AOAM531x5Sccv7lhmE5OE6qa69n/8ya6a666/fjWErAoeJkAJ58ozUL8
 O9w5/iwIAc52iXM0nTFoXJTcSw==
X-Google-Smtp-Source: ABdhPJx3/V8Wwch5VzyFEKgssskNxsBSRdndKOTySkS1tUVM59hI7FXHBFpMJJ2wvmAVgHxKBQpqDQ==
X-Received: by 2002:a17:90a:7783:: with SMTP id
 v3mr8870958pjk.177.1618978495729; 
 Tue, 20 Apr 2021 21:14:55 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:55 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 15/17] target/riscv: rvb: add/shift with prefix zero-extend
Date: Wed, 21 Apr 2021 12:13:57 +0800
Message-Id: <20210421041400.22243-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Wed, 21 Apr 2021 04:14:59 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 target/riscv/translate.c                |  6 ++++++
 3 files changed, 33 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 2f80b0c07ae..01b28718af5 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -107,6 +107,7 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1add_uw  0010000 .......... 010 ..... 0111011 @r
 sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+add_uw     0000100 .......... 000 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -116,3 +117,5 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index ca987f2705f..d69bda2f7b3 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -390,4 +390,28 @@ GEN_TRANS_SHADD_UW(1)
 GEN_TRANS_SHADD_UW(2)
 GEN_TRANS_SHADD_UW(3)
 
+static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_add_uw);
+}
+
+static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
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
index 7e92cd87851..764e8f8cb0d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -755,6 +755,12 @@ GEN_SHADD_UW(1)
 GEN_SHADD_UW(2)
 GEN_SHADD_UW(3)
 
+static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


