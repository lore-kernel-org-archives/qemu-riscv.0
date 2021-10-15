Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHFs-0001CN-7r
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHFp-00014x-EK
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:03:45 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHFn-00042N-Do
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:03:45 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e7so7796327pgk.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIpc+XW9CKzkr2HKhQaSqCj0U7EZ7YO7P+lWNbbiRkk=;
 b=GB6Q7ogX76uJkxosnQbXumpMwRBG3e2U9DveJu+RWNxQMVKsS52vdlh9NefRR0xAYc
 p3pRixmW1WrBz5QdDYAvlBbAfK6YlyaVkMwJdSUuwVZn8zUeKQtb+vCKB/GxyqWqRMOF
 oNHlEaiU2HxgmbmIftpDeOzKs4ZRDA5FTz5IrcM7maTfs/qnlUfQ3/l7uEj/bmCGzZS+
 9LN7iKVWmkl5YYyZ/0A0ut2wO+JJg3cpvwWjnysyBea/s19/uV9s43Ya7P670m+2jWDG
 YFp6tF7KW/8TbM45QygVL3Whn8H++z/vldgJ8xjWEzzzwLuZU3l+QjbwCGInwmqP2fBu
 Zn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIpc+XW9CKzkr2HKhQaSqCj0U7EZ7YO7P+lWNbbiRkk=;
 b=nXoHjyRMpP1UoKfeCva72y2tAeaKmnDFwt2DsCUbF4MjURu6h6MWy3ZjOe8Sv9yasV
 VcrRf2nd/Unk74Cr+sK7IpYei2qDamFgoqA3szS+b/GZ8bN7LKBzlSHk3GRvSiEvcDEU
 FBIBeG2NcnsEbqJHbKRKZBFlFGDjULvUhO/7tUvYFGCgNrokmyNigeYCIothUOV5Wiza
 0ohafNSHOkzAKxqbZQ3+x0wh+gh18+lOh2meBkqYRMfNy5JNeWlDvDyj0WoSS6MCLwz4
 yrxCOS3tJFF5Pi3EvadKvmcXrmq8T2YJ28G3nrU0lMgNlkkT4wV43ZxA77q6AV+JfPZy
 qU2g==
X-Gm-Message-State: AOAM532plZOrbHCpN+1wJy3VzV5oQBJ73AyFvdfXEATvKZBCXIhsBc3X
 1auw1vQHZaEt24Zuykgt7hIrbw==
X-Google-Smtp-Source: ABdhPJx0RPvTYhyutyWxVqDHO6G0sM1izlGlaOWcsly1QOnphnEgfpgkJowk8KdjHWEPf0dvlc3wWw==
X-Received: by 2002:aa7:8882:0:b0:44c:9270:1cba with SMTP id
 z2-20020aa78882000000b0044c92701cbamr10256349pfe.26.1634281422085; 
 Fri, 15 Oct 2021 00:03:42 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id w15sm4209553pfc.220.2021.10.15.00.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:03:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 5/6] target/riscv: zfh: half-precision floating-point
 classify
Date: Fri, 15 Oct 2021 15:03:05 +0800
Message-Id: <20211015070307.3860984-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015070307.3860984-1-frank.chang@sifive.com>
References: <20211015070307.3860984-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:03:45 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/fpu_helper.c                 |  6 ++++++
 target/riscv/helper.h                     |  1 +
 target/riscv/insn32.decode                |  1 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 ++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 12e84aed41e..f90f7dca59c 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -470,6 +470,12 @@ target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     return float16_eq_quiet(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fclass_h(uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return fclass_h(frs1);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(rs1);
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9c89521d4ad..d25cf725c57 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -89,6 +89,7 @@ DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3906c9fb201..6c4cde216bc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -754,6 +754,7 @@ fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
 feq_h      1010010  ..... ..... 010 ..... 1010011 @r
 flt_h      1010010  ..... ..... 001 ..... 1010011 @r
 fle_h      1010010  ..... ..... 000 ..... 1010011 @r
+fclass_h   1110010  00000 ..... 001 ..... 1010011 @r2
 fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 8b469348ce9..837a8002b7f 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -371,6 +371,18 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
     return true;
 }
 
+static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fclass_h(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
-- 
2.25.1


