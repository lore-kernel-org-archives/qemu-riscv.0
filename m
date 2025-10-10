Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20750CCD18A
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:52:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7FP3-00048l-Ly; Fri, 10 Oct 2025 11:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FP1-00047k-Ch
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FOs-0002Ss-8G
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:29 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso1359498f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760111477; x=1760716277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sg4JisjCTk0Mjc3r40DMEw7zNDBtKAgMlMWLURgC23w=;
 b=nifKTlAp7nZN5Pa+1E4TdVrwD6vV70zmDJV36/lwump0XdI17I4d4oJ14Gr//+yzDR
 d5urIcDhe6GqI5Y6XNYlLea1o2Qmnbg7J0FsVbew7gt0PTi0S3N7DxZqvROcDBqjM5lh
 eXIH0PgG4J/reJuF96kegrupSsKeXrQtfUO+GaPOV4V0ig0QT+q6lpyOJCs1CWBFtS2N
 +PpXcO7ebUaJR1tLlCIoB2p9RlhOKzBpVo0jX+Mk4gie4qqADtL+ObAUl6NdlE3Wa1NK
 62UdPtheEiMLzxMn0w7VY+K54f9kbH84DfWGidsgh95qkgppElPLW8Ei++qP/IUZHPAy
 fjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760111477; x=1760716277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sg4JisjCTk0Mjc3r40DMEw7zNDBtKAgMlMWLURgC23w=;
 b=oek4HfTXRLZUYczL9DGhcIP9A93GL76zfvJ3MQfblMnIJRf1fDJydmxh35PJQag8a/
 Iau2Rn3jQmNJqiafqN5zh0NbB18LuLlaNfkPKjYtbuSp3CucI8HCXgAjXCnLU/TTqBmO
 y7iFk5gaEc/YQ9le4xQiLODhTJmSdNxXfTvQbSysmAVEvphPgGqncgTQZOgV+6C38u4o
 /V/SV5b9yayxXVA6NQv3mdNP2lmj40FPeAF8K8XDSpHp9GELFNMPrR5dDhUHE9c1wfA1
 67sjlRYF6zyeFWGvkCjATygng19VTnfyKIupE2kYZsRRvfp4XwQWUqk0Qrhczz6iAKDm
 sMpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1ZaAu5e9QSA3CAT8ZKuod/MqMYetK80e8nclchJQBj39Tlxo7PpNiXJUbBqErnnCh3f6IusJUC6pY@nongnu.org
X-Gm-Message-State: AOJu0Yz96wVWmfIIljM8VpHuadTCPxBJxWmFfFfVY2WPFzjeV89AuYCX
 BxvP5jnh3+O6/QN7rrmyRPOAVgs2bIiMOdXETUXnNwxUe94PV4dSB4vxzdowIFwaWvU=
X-Gm-Gg: ASbGncuPyE3YKSwJVCtIFb5ZXBM8mPjynODoVh1dIKhjoCpQKGmx50q4pT/VWKm2Voo
 UCba4wPYusv4y+JBwDdKRjdGiWRQJaplnzQSOtHpgJ89gjF467RYS7clQIktMc5441D99W1qtIh
 2x0j9tGTWcQs+KfpqBgmU89MWatU3KTROZgHKO79GfyiSsX8xIFujP0nPtaV+EA1F8RvuhEuchL
 ky5SsfN1j2NtLRi1gAeS9FI5JvIJmR91cwwuc+75TS27A6SrnX0Lsm2bckbR4yOWJUO8J2z2XEV
 Ic2zuMeKgDpD/YZOti3lS4lvBwICKcD6WlxzmRlYD3SiSDRkX0O7j/Gr7/qAOKx8sKug1dCdbAr
 iIEkW7W1iprnBw31aZgHElTm63HYwulD7UZly2C8GMhmGhJqEyTZMecIEbnR30EABxokFbO1THZ
 FjrIljevKcutJ/sgnXhYk=
X-Google-Smtp-Source: AGHT+IEE4i5xbrSBoEw+CFbOCOIFA7O8dNSHSX48CSyj9jk+y2z6vHHxG9IpWHHT0sFq9NFhQ6Xyog==
X-Received: by 2002:a05:6000:438a:b0:3d9:70cc:6dd0 with SMTP id
 ffacd0b85a97d-4266e7dfae9mr7708756f8f.33.1760111477466; 
 Fri, 10 Oct 2025 08:51:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e8141sm4603507f8f.48.2025.10.10.08.51.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 08:51:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/13] target/riscv: Conceal MO_TE within gen_load_idx() /
 gen_store_idx()
Date: Fri, 10 Oct 2025 17:50:37 +0200
Message-ID: <20251010155045.78220-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010155045.78220-1-philmd@linaro.org>
References: <20251010155045.78220-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All callers of gen_load_idx() / gen_store_idx() set the MO_TE flag.
Set it once in the callees.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/insn_trans/trans_xthead.c.inc | 34 ++++++++++++----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 7e69906e5bf..70c563664ab 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -745,6 +745,7 @@ static bool gen_load_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
     TCGv rd = dest_gpr(ctx, a->rd);
     TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
 
+    memop |= MO_TE;
     tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
     gen_set_gpr(ctx, a->rd, rd);
 
@@ -762,6 +763,7 @@ static bool gen_store_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
     TCGv data = get_gpr(ctx, a->rd, EXT_NONE);
     TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
 
+    memop |= MO_TE;
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
 
     return true;
@@ -771,32 +773,32 @@ static bool trans_th_lrd(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_SQ, false);
+    return gen_load_idx(ctx, a, MO_SQ, false);
 }
 
 static bool trans_th_lrw(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_SL, false);
+    return gen_load_idx(ctx, a, MO_SL, false);
 }
 
 static bool trans_th_lrwu(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_UL, false);
+    return gen_load_idx(ctx, a, MO_UL, false);
 }
 
 static bool trans_th_lrh(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_SW, false);
+    return gen_load_idx(ctx, a, MO_SW, false);
 }
 
 static bool trans_th_lrhu(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_UW, false);
+    return gen_load_idx(ctx, a, MO_UW, false);
 }
 
 static bool trans_th_lrb(DisasContext *ctx, arg_th_memidx *a)
@@ -815,19 +817,19 @@ static bool trans_th_srd(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_store_idx(ctx, a, MO_TE | MO_SQ, false);
+    return gen_store_idx(ctx, a, MO_SQ, false);
 }
 
 static bool trans_th_srw(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_store_idx(ctx, a, MO_TE | MO_SL, false);
+    return gen_store_idx(ctx, a, MO_SL, false);
 }
 
 static bool trans_th_srh(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_store_idx(ctx, a, MO_TE | MO_SW, false);
+    return gen_store_idx(ctx, a, MO_SW, false);
 }
 
 static bool trans_th_srb(DisasContext *ctx, arg_th_memidx *a)
@@ -839,32 +841,32 @@ static bool trans_th_lurd(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_SQ, true);
+    return gen_load_idx(ctx, a, MO_SQ, true);
 }
 
 static bool trans_th_lurw(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_SL, true);
+    return gen_load_idx(ctx, a, MO_SL, true);
 }
 
 static bool trans_th_lurwu(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_UL, true);
+    return gen_load_idx(ctx, a, MO_UL, true);
 }
 
 static bool trans_th_lurh(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_SW, true);
+    return gen_load_idx(ctx, a, MO_SW, true);
 }
 
 static bool trans_th_lurhu(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_load_idx(ctx, a, MO_TE | MO_UW, true);
+    return gen_load_idx(ctx, a, MO_UW, true);
 }
 
 static bool trans_th_lurb(DisasContext *ctx, arg_th_memidx *a)
@@ -883,19 +885,19 @@ static bool trans_th_surd(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
     REQUIRE_64BIT(ctx);
-    return gen_store_idx(ctx, a, MO_TE | MO_SQ, true);
+    return gen_store_idx(ctx, a, MO_SQ, true);
 }
 
 static bool trans_th_surw(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_store_idx(ctx, a, MO_TE | MO_SL, true);
+    return gen_store_idx(ctx, a, MO_SL, true);
 }
 
 static bool trans_th_surh(DisasContext *ctx, arg_th_memidx *a)
 {
     REQUIRE_XTHEADMEMIDX(ctx);
-    return gen_store_idx(ctx, a, MO_TE | MO_SW, true);
+    return gen_store_idx(ctx, a, MO_SW, true);
 }
 
 static bool trans_th_surb(DisasContext *ctx, arg_th_memidx *a)
-- 
2.51.0


