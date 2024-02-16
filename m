Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA16EC48BC4
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 13:58:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rayiz-0006YV-UX; Fri, 16 Feb 2024 08:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rayil-0006Lh-Hn
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 08:57:47 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rayij-0003gy-Ir
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 08:57:43 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d8ef977f1eso17690425ad.0
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 05:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708091858; x=1708696658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emRBlYfSXu9vP7I1QBtZCcEqJWprux2dWk/RvM2p2b0=;
 b=gANxoqyaQUtGX1fBHnnqHLB/nYhd3DDPMBO4dGoBfCWWg+XSUwxXdK6Y5wCPyDQyDa
 D800TjCiTUy7tVDN5VH+d4c0IFZqXRNp05SImi6n4LkhBQTEtm+TtCrl12B9MsgHtECo
 L3vTfTPrgLtyrpXq8GdHoTWR7lcuC9zhlKOiCzgxvrSBe0ap2+etGFO/IzKoMrsg2Wsy
 nDcPljChHHjdJ+rEIWmEddJTvxln47QjduL8t99+khbGkIghOpy/Z3pyIfB06NfSJndV
 S1b39oXXqp/16QR80yp9sJA8fOk3/5yZZX+Zauxw5pmK0b4WH7Ir4E2DKWbD+CiUZv2s
 PUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708091858; x=1708696658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=emRBlYfSXu9vP7I1QBtZCcEqJWprux2dWk/RvM2p2b0=;
 b=DaN3lmntZ23oZtfiSrFFm3RL8895xrhvnMO5pZwSnM8Ez3CbRqYkjqEq0oR7um6Nqa
 uqcVEfAO76zx3WKSPPnqquI9wOgGHHVTmrXCZeZi9Fp+CjlZ9xiKR/r8H821cbfgjU/7
 MGxwUiykICYIazfhQ0K9Ly4RPVAe33lIzBJWNoJAj1X6RNJYMwQ91dcZW6gshcrcOiMR
 NaE/5uz9X/Eef9cGIKSfucLwBYl971auBwSPPOHcS6XBQ4UNUtHZfuv83VJ0zutvqIow
 O0wALgZq5vZGsWqFvHbO7EmhDfrGiS7fxspqidcALvG1lV60gY4gBJ8r1vKXWKpaB9Kg
 7FDg==
X-Gm-Message-State: AOJu0YwNOc8fzHclGTFxZLcz1yD0i3QwQH9liH6N3UBAnrTOfgsPT05D
 KnIIcQwCfWU1EoXUjyLD9Md5roEkp8mQVopdj3pMWjl390AV84EZU4qZ3hdTQvE=
X-Google-Smtp-Source: AGHT+IEpFVh1teugTIhWzmpa0BmlHAKIRLToaSF+9jY/mbLwrUHXzGEomeIsmOx0mwyciZ864jGGNg==
X-Received: by 2002:a17:903:245:b0:1da:22d9:e7fd with SMTP id
 j5-20020a170903024500b001da22d9e7fdmr3501227plh.20.1708091858195; 
 Fri, 16 Feb 2024 05:57:38 -0800 (PST)
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 j18-20020a170902c3d200b001dbb06b6138sm889606plj.252.2024.02.16.05.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 05:57:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/3] target/riscv/translate.c: set vstart_eq_zero in
 mark_vs_dirty()
Date: Fri, 16 Feb 2024 10:57:19 -0300
Message-ID: <20240216135719.1034289-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216135719.1034289-1-dbarboza@ventanamicro.com>
References: <20240216135719.1034289-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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

The 'vstart_eq_zero' flag which is used to determine if some insns, like
vector reductor operations, should SIGILL. At this moment the flag is
being updated only during cpu_get_tb_cpu_state(), at the start of each
translation block.

This cadence isn't enough and we're facing situations where a vector
instruction successfully updated 'vstart' to zero, but the flag was
still marked as 'false', resulting in a SIGILL because instructions are
checking the flag.

mark_vs_dirty() is called after any instruction changes Vector CSR
state, making it a good place to update 'vstart_eq_zero'.

Fixes: 8e1ee1fb57 ("target/riscv: rvv-1.0: add translation-time vector context status")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1976
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/translate.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 177418b2b9..f9ff7b6173 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -652,6 +652,8 @@ static inline void mark_fs_dirty(DisasContext *ctx) { }
  */
 static void mark_vs_dirty(DisasContext *ctx)
 {
+    TCGLabel *vstart_zero = gen_new_label();
+    TCGLabel *done = gen_new_label();
     TCGv tmp;
 
     if (ctx->mstatus_vs != EXT_STATUS_DIRTY) {
@@ -669,6 +671,24 @@ static void mark_vs_dirty(DisasContext *ctx)
             tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus_hs));
         }
     }
+
+    /*
+     * We can safely make 'vl_eq_vlmax = false' if we marked
+     * VS as dirty with non-zero 'vstart', i.e. there's a fault
+     * to be handled. If 'vstart' is zero then we should retain
+     * the existing 'vl_eq_vlmax' - it'll be recalculated on the
+     * start of the next TB or during vset{i}vl{i} (that forces a
+     * TB end).
+     */
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vstart, 0, vstart_zero);
+    ctx->vstart_eq_zero = false;
+    ctx->vl_eq_vlmax = false;
+    tcg_gen_br(done);
+
+    gen_set_label(vstart_zero);
+    ctx->vstart_eq_zero = true;
+
+    gen_set_label(done);
 }
 #else
 static inline void mark_vs_dirty(DisasContext *ctx) { }
-- 
2.43.0


