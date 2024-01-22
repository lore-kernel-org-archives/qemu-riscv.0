Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDF4C47DD9
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:12:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRwtx-0006cP-Cs; Mon, 22 Jan 2024 11:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtv-0006c3-Tu
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:55 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtu-0005NF-G1
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:55 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so1463350a12.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 08:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705939913; x=1706544713; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoumEW5HsIW4QWE94CfwPjvE1lhjv4Qgw5NHfZpjqhU=;
 b=NKPkNv1C7x8F6cIdH+cHNBu1/iHDZD150dk4QHd/EYEsvu0nGrzMRV73V/I66xEy+T
 5EG2MW4j6RcEcg9xu2XUy6uXDoa10oXPFR7JZ/KnAjDILWjpzG14vVj51ZwvbWHEF3ue
 7a5zI0fti67NQugbtGxLkLaxZ+Q65Y37D7/ekxQp8QguyLVlWlcQYTKjYdRUkTxsiHud
 Q4lW6cVBeHFR9AEzVkmJU9+J4wShSKfY4KYvlYcyvdKjDQeScPDBBpE4sKehp1xIXWZx
 jiUlIdl6Vm7KF+/iBKHqT8wZNy/7Ipbmn3KlQcsgy8VveSVuQ/CP8YEOKPh4+QPTSLVJ
 VOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705939913; x=1706544713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MoumEW5HsIW4QWE94CfwPjvE1lhjv4Qgw5NHfZpjqhU=;
 b=AXKrTQo+oA9pb8kXpqWZHoKE+4+4VEEiS9mDZB8L/J9JNEdxry5aB6Tp1VmjgLxgJI
 zTds4OXA7aW9xalyTQWWO+tLbwcKJDeVRBwD7YAldx+M0z0Je9MKItMIZP03uQIwuRXw
 Pfk8jcgngt9QFtorFW3E99QZDfAQIKwAdHtTzAyYy1sZUZ4QezpmghN2I5LXwMU2ilj9
 sV4s8BV9M2pfRrfolLyyMvBeS+X6OjcRzTWjE2BXXlN3hJtsNZiGXjp0WOnC+xRedLUK
 CIAhJDrlARWbBcZ/nCtTUSAUU8+JnqJ2bIK5MymmG9Pjhf6GrdgHcelB/TGCqfPJc34c
 yX9g==
X-Gm-Message-State: AOJu0Yy+OYoLRdaagn9fEL8UWaQEzG+5ZDlZW+sMkDziP/3MLYfVwLJI
 isM3jBwnlYHM9WL323/ND7M0iYtFSgR9nJT/PKqj4ulsXL4KkCW5YHYrphmTB8Q=
X-Google-Smtp-Source: AGHT+IGxcaR7KNIDvvgNwS2yu+y3viUgylCkKOjmMv4Y7F9/GundpI/W4QnOULIjCTZJ9FrcKjI7BA==
X-Received: by 2002:a17:90a:ba87:b0:290:10b:4585 with SMTP id
 t7-20020a17090aba8700b00290010b4585mr1538023pjr.54.1705939913042; 
 Mon, 22 Jan 2024 08:11:53 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 db3-20020a17090ad64300b0028e245501e7sm9866446pjb.4.2024.01.22.08.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:11:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 12/13] trans_rvv.c.inc: use vext_get_vlmax() in
 trans_vrgather_v*()
Date: Mon, 22 Jan 2024 13:11:06 -0300
Message-ID: <20240122161107.26737-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122161107.26737-1-dbarboza@ventanamicro.com>
References: <20240122161107.26737-1-dbarboza@ventanamicro.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


