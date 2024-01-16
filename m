Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E15C47DA7
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 21:03:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqWa-0004l7-P7; Tue, 16 Jan 2024 15:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWY-0004km-NI
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:59:06 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWX-0007ea-2H
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:59:06 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5ca29c131ebso7750871a12.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705438743; x=1706043543; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G8YN9S+YZFfYDir8epG4VWw5LwfjHu3V8x0AxkZPGuI=;
 b=OLv6EH3wwajTi8F3FgWmAoql/2GTUnYLcPPTC6kQYRmOzakmRpjGxIV9s5xVpxgU/N
 Jzz9wFCIwCNAq2Xldo0bLuwtNGjDpZbzVPlkdj7D3Z3m/Y4EGHw6XQ84FTGNEJwJMA7k
 lL9K/q8xXhOsN/CKVqUYdldtQgsU8Rn8KUx3afNqhrnD04fPBKTNDqt8GYutes25RUyh
 3q8FVwZ3CdiLrQUbRTGm8F2W5SFQHb1T9+hmUAa1ZMAxvTM7elBXsBau3to7Wmpr4WrC
 PMPXV049mNMhJL2/n3SGvwlBbDgirlmmg0wj5qIJbCnEsIZuf2I1bm8NS/nEHiV5RcFj
 2+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438743; x=1706043543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G8YN9S+YZFfYDir8epG4VWw5LwfjHu3V8x0AxkZPGuI=;
 b=jAsFsDbnXhGzjJuR35+KlLax4ERWBFNoVRBvP8Ir61Z+WND/OM+qRlhiyywBqXiJ6W
 RIvRS1UB6MR5J4kUcW/4q0+wGXHqqc0DPwGyRkUMsRb3GTN3GgaUMo8Q0eH4qSbsHv0R
 QmN1Ho+KpcsIbIp81dpkrCJfL0vTwTg4xySQ44fPGay8G8+AQHvO5IMI4PdhSI6GxOcA
 +RSAs7QqAfpQ/K7nY216vBDnH9ZCzeflBohJ6STL6kaQB3BCo0lY7reLsGvKeTXWjCek
 fqXxJ4pGlwZ5TGlQKxkjvWU4XMRJYEBmXhe/+HYjAMMbd4P0tz33Tn9+NdQ4bnToDQpu
 noWg==
X-Gm-Message-State: AOJu0YyDKUn3rMwkFPIB2JmD7qdRxv5A3NajcVaKdTlBiG6BngzXlh3Z
 8YkhOuF8w7+uFuh+z30YvFQL5DiF/Dc1tg==
X-Google-Smtp-Source: AGHT+IGjf+XEXcUW88qznjawkJVjmGgl11sFBMuXxNAAR7RJ9gckFfa+SJO/SambF8FDLJxNBAN0pQ==
X-Received: by 2002:a05:6a20:9796:b0:199:93de:f61f with SMTP id
 hx22-20020a056a20979600b0019993def61fmr7908293pzc.34.1705438742982; 
 Tue, 16 Jan 2024 12:59:02 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sh2-20020a17090b524200b0028df5c748e4sm11326949pjb.44.2024.01.16.12.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 12:59:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 12/13] trans_rvv.c.inc: use vext_get_vlmax() in
 trans_vrgather_v*()
Date: Tue, 16 Jan 2024 17:58:16 -0300
Message-ID: <20240116205817.344178-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116205817.344178-1-dbarboza@ventanamicro.com>
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Use the helper instead of calculating vlmax by hand.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b4663b6e1f..9e101ab434 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3535,8 +3535,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
-        int scale = s->lmul - (s->sew + 3);
-        int vlmax = s->cfg_ptr->vlen >> -scale;
+        int vlmax = vext_get_vlmax(s->cfg_ptr->vlenb, s->sew, s->lmul);
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
@@ -3566,8 +3565,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
-        int scale = s->lmul - (s->sew + 3);
-        int vlmax = s->cfg_ptr->vlen >> -scale;
+        int vlmax = vext_get_vlmax(s->cfg_ptr->vlenb, s->sew, s->lmul);
         if (a->rs1 >= vlmax) {
             tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
-- 
2.43.0


