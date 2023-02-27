Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWEW-0001Q0-LU
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDC-0003Qx-HX
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:18 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD9-0002by-FG
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:08 -0500
Received: by mail-pf1-x432.google.com with SMTP id bd34so2803131pfb.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhL2WzjGmls46D+quq34ze/ulksmGA+cQwYE9pUognw=;
 b=IqZ+RBL/2YYgOsYsdvePHMAGCFEFsncU1Fp92DEasNpFqQ9VMjHTWrnkmbtD052KBO
 /Vv04Uz9AZxyCUNMVTIq4ylwpeiQ0sS49zirXicKzO3MCypmMwb1G2osdfm+DV+XMO9Q
 OWxaTZhT3asJurwFQHXz/TCD+Li/Lp85Hs2eeBYQGNyK50vTgUIE7s1xO8iiP2l5PNxf
 ap3OLGVCkLlDocjvNOqF3v0elqZOyTXUvUihJP+X4gpVvENMyFS1fFLuEw/4tlbQLZek
 jxuql4dIDxK6jm25kCDD462Ue/A/cFDuLWmYXFRfZ7PkZxwkeyt1WVOiP4Y7O/ocRoGP
 opDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhL2WzjGmls46D+quq34ze/ulksmGA+cQwYE9pUognw=;
 b=vs15vxYf/HKLINSMWCHJVHxz2EkH69OWyNR46vDQOoRRtWKmqS0bPCWZeaVoMpazW3
 etNNYDBpuBq9HABR0A+J7KsBoE4MiF7p36rUsYPrbLnH+jDq8jX0BlXAP6udz3milWhq
 k1RYtTSUNQliXTdwP711Pe3vaLGmk/OPUrOSfhUhluZtzcQsMwYgTi4pru+AStfkP7Sm
 VTjkS6VGmQfyBciO+CFpm0OCr+9oqk7izJ24OCTO1cSeUi3Y+MhSK7Gq3vBGWCPVP8pv
 QhF7gC/OW4lgTNaPdzDwdJXpZOCp4624cKOto9e4p2gw7ydj8t9uQs/Kuky/kOsTOHtW
 loeA==
X-Gm-Message-State: AO0yUKXe+nUapq7xV9zFHvTe/K18v4GzJJDzmeGzjT+RDFyhtZcArVp/
 NE5C3Kexh3fYiSKc0/tkFHI+xw==
X-Google-Smtp-Source: AK7set8aosRGl0tv7yt+NrwMTMskIu6/SkHD5TZMa7qceHG7LodJuDjP5NUygtWqWeMD/ihAuU6e0w==
X-Received: by 2002:aa7:99dc:0:b0:5e5:e066:2304 with SMTP id
 v28-20020aa799dc000000b005e5e0662304mr8267814pfi.31.1677476283963; 
 Sun, 26 Feb 2023 21:38:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 21/31] target/cris: Don't use tcg_temp_local_new
Date: Sun, 26 Feb 2023 19:36:51 -1000
Message-Id: <20230227053701.368744-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2023 05:38:20 -0000

Since tcg_temp_new is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         |  6 +++---
 target/cris/translate_v10.c.inc | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 905d01288e..a959b27373 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -1621,7 +1621,7 @@ static int dec_bound_r(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("bound.%c $r%u, $r%u\n",
             memsize_char(size), dc->op1, dc->op2);
     cris_cc_mask(dc, CC_MASK_NZ);
-    l0 = tcg_temp_local_new();
+    l0 = tcg_temp_new();
     dec_prep_move_r(dc, dc->op1, dc->op2, size, 0, l0);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], cpu_R[dc->op2], l0, 4);
     tcg_temp_free(l0);
@@ -2404,8 +2404,8 @@ static int dec_bound_m(CPUCRISState *env, DisasContext *dc)
             dc->op1, dc->postinc ? "+]" : "]",
             dc->op2);
 
-    l[0] = tcg_temp_local_new();
-    l[1] = tcg_temp_local_new();
+    l[0] = tcg_temp_new();
+    l[1] = tcg_temp_new();
         insn_len = dec_prep_alu_m(env, dc, 0, memsize, l[0], l[1]);
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], l[0], l[1], 4);
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index f500e93447..9660f28584 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -68,9 +68,9 @@ static void gen_store_v10_conditional(DisasContext *dc, TCGv addr, TCGv val,
                        unsigned int size, int mem_index)
 {
     TCGLabel *l1 = gen_new_label();
-    TCGv taddr = tcg_temp_local_new();
-    TCGv tval = tcg_temp_local_new();
-    TCGv t1 = tcg_temp_local_new();
+    TCGv taddr = tcg_temp_new();
+    TCGv tval = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
     dc->postinc = 0;
     cris_evaluate_flags(dc);
 
@@ -434,7 +434,7 @@ static void dec10_reg_bound(DisasContext *dc, int size)
 {
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     t_gen_zext(t, cpu_R[dc->src], size);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[dc->dst], t, 4);
     tcg_temp_free(t);
@@ -935,7 +935,7 @@ static int dec10_ind_bound(CPUCRISState *env, DisasContext *dc,
     int rd = dc->dst;
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, size, t);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[rd], t, 4);
     if (dc->dst == 15) {
-- 
2.34.1


