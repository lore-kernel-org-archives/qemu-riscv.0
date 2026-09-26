Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502A3C98332
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 11:10:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAQHl-00005v-OW; Sat, 26 Sep 2026 07:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQHY-0008OO-N6
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:09:33 -0400
Received: from mail-dl2-x0e.google.com ([2607:f8b0:4864:38::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQHU-0002om-Ro
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:09:27 -0400
Received: by mail-dl2-x0e.google.com with SMTP id
 a92af1059eb24-144ecebb6cbso610473c88.3
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 04:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420962; x=1791025762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LJ6zeY/HvEtrdYubqZsYdp9Ad3fveIhcW1xi8U7qNFg=;
 b=qEvtrD7XHliE0vSUhr4copSAyV20EtakElW0+SkNkIyW0S/81aZ1JhBaL+WZFnpEBO
 9ZaEMRhekS//Ji5SnxfmeAxBsT0WKojZ5L46Udnt5DbZBu/66q+Wkq+Y3S39SQk4M8Kp
 b0oFW4r0RuLbKt8iwkPx3HLqt0Jjb/+KIhycfrgGGHWW37Lc9X/ykI6TBoHIc5ksS7fx
 g72bZoWecyR4Ncr8fGO53bX1mP42wlXxx6TkV1bNsWgKWlKxl+Pkz9rYITgKXVX70lZR
 vjETDze3E+XqikaO73AE93ukLTEidJhQO9aU6FN87IFLN3CtnqX7GWCsDrR2rkpNqUSW
 NB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420962; x=1791025762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LJ6zeY/HvEtrdYubqZsYdp9Ad3fveIhcW1xi8U7qNFg=;
 b=T2g39eMO4NXwOCOKCP5QJEEKj2GLJmaX9ulyatEwVX2Jdy54z6B6FejXPsOl/NypD0
 QmPJRFrQzKEJkPvHVDzVDQexvHDlWzN87GfDEfdOClUseCBnG5FreCxa9ej1EhVZmK9P
 djc+BjK/1nssY7KLtKDAQCqMq+WPSwtoNiWZ4QzO2U1kUol8Ay8Hy+5M1r4cZKiIgpmT
 SlefHWeaDBtzOewKxtAEx6Fxc5h2BizckHz32uTjAzEesIpUBg9SNvK0WeLjFE/mxLft
 OEKPIWQ1uwOWZhqG5Jg/RFAxLPa36JI6YAUGFt97ptSjMisUgOIg6Zdl1SYn3de+FHnq
 /BJg==
X-Forwarded-Encrypted: i=1;
 AKwUvByM9rznmLU0wRH8NkV+FbEe+9kNoPaRvrm6NQ/FE4MVo8A8LYBVCJ5H5lQHg5A+RjuFxHVf4KDQ8B1z@nongnu.org
X-Gm-Message-State: AFuF++lMGFRp36iQ8W/bzT8490+iknRbzGFn3dbDrNBgrkRhC5WZKRTz
 elF44ONKI3hNDecNrW2voM1jO5yi/5pDa/72JaP1IbMPQ6CdTeOr9vws
X-Gm-Gg: AYBFou06ceAwlkUAZHVxaC1APktia3Pe3P3Kwv/nE373lAuwO6QAVBOhJpDAzbz0xlj
 KeWqyhzk+EOwHoE5bzENI2xr+B2ycuawkuRuC64LkLZKLMh51XpNnIFJ2fay3dNE+SoOi3+EL3s
 qeHAPlMs0HsKEaahmw6g6WrmXKLUd7Dp0sZfuIacz5Vj6L1BlibawyUm6Aj7ejDVrQeeQawjdLf
 ai7f8MbnhzMtTdbrBk/EHZv8o6ZMimiQCh80tuHd587nkIAUzQexohnWrJmhn2DbV6SJxZapca6
 L0zQcRMxqNVjHggxheN4AC5fZFC0D+Vxe/yDCl0QZZqgnZTCZalykRJpd8/OUGD5eyaBCKugPXP
 a9imBVoKuQ4X1rDUzuEW/F13bg7upQNhYm/ksuY39Pwmf+ydbDQJeWlbVPNPKl7iGvTJ2/kXrL/
 /mmGbM3YwOgvGts2QG1mDcTpKy8Pa3y87vPRyEpTinblIG/HVGjKTuFznUcsSdJMV2Y2fd+E9CS
 gMLxrV0J2yIB7aFhv5/K3mmLQdr+IY=
X-Received: by 2002:a05:701b:2314:b0:147:cd15:3f4 with SMTP id
 a92af1059eb24-147cd15078cmr865556c88.23.1790420960879; 
 Sat, 26 Sep 2026 04:09:20 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:09:19 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <17746591750@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>, Ani Sinha <anisinha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 9/9] target/riscv: uniquify TCG crc32, crc32c,
 and wfi helper names
Date: Sat, 26 Sep 2026 19:08:17 +0800
Message-ID: <20260926110818.1912-10-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926110818.1912-1-luoyonggang@gmail.com>
References: <20260926110818.1912-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

- ARM already exports helper_crc32, helper_crc32c, helper_wfi, and the
  matching helper_info_* objects. RISC-V used the same DEF_HELPER names,
  which collide in a combined qemu-system link.
- Rename the RISC-V helpers to riscv_crc32, riscv_crc32c, and riscv_wfi
  so the generated C symbols are unique without meson -D prefixes.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/helper.h                              | 6 +++---
 target/riscv/tcg/bitmanip_helper.c                 | 4 ++--
 target/riscv/tcg/insn_trans/trans_privileged.c.inc | 2 +-
 target/riscv/tcg/insn_trans/trans_xlrbr.c.inc      | 4 ++--
 target/riscv/tcg/op_helper.c                       | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index aab92bf132a..9aa68480f2d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -83,8 +83,8 @@ DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(xperm4, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(xperm8, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(riscv_crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(riscv_crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Floating Point - Half Precision */
 DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
@@ -134,7 +134,7 @@ DEF_HELPER_1(sret, tl, env)
 DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(mnret, tl, env)
 DEF_HELPER_1(ctr_clear, void, env)
-DEF_HELPER_1(wfi, void, env)
+DEF_HELPER_1(riscv_wfi, void, env)
 DEF_HELPER_1(wrs_nto, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 DEF_HELPER_1(tlb_flush_all, void, env)
diff --git a/target/riscv/tcg/bitmanip_helper.c b/target/riscv/tcg/bitmanip_helper.c
index d8d94bca7ba..5af3efe194d 100644
--- a/target/riscv/tcg/bitmanip_helper.c
+++ b/target/riscv/tcg/bitmanip_helper.c
@@ -117,7 +117,7 @@ target_ulong HELPER(xperm8)(target_ulong rs1, target_ulong rs2)
     return do_xperm(rs1, rs2, 3);
 }
 
-target_ulong HELPER(crc32)(target_ulong rs1, target_ulong sz)
+target_ulong HELPER(riscv_crc32)(target_ulong rs1, target_ulong sz)
 {
     for (target_ulong i = 0; i < sz; i++) {
         rs1 = crc32_table[rs1 & 0xFF] ^ (rs1 >> 8);
@@ -126,7 +126,7 @@ target_ulong HELPER(crc32)(target_ulong rs1, target_ulong sz)
     return rs1;
 }
 
-target_ulong HELPER(crc32c)(target_ulong rs1, target_ulong sz)
+target_ulong HELPER(riscv_crc32c)(target_ulong rs1, target_ulong sz)
 {
     for (target_ulong i = 0; i < sz; i++) {
         rs1 = crc32c_table[rs1 & 0xFF] ^ (rs1 >> 8);
diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
index a8eaccef67e..0df78e89745 100644
--- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
@@ -144,7 +144,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 #ifndef CONFIG_USER_ONLY
     decode_save_opc(ctx, 0);
     gen_update_pc(ctx, ctx->cur_insn_len);
-    gen_helper_wfi(tcg_env);
+    gen_helper_riscv_wfi(tcg_env);
     return true;
 #else
     return false;
diff --git a/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc b/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc
index 01da2b6ce1d..795231f0839 100644
--- a/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc
@@ -29,11 +29,11 @@ static bool gen_crc(DisasContext *ctx, arg_r2 *a,
 #define TRANS_CRC32(NAME, SIZE) \
     static bool trans_crc32_##NAME(DisasContext *ctx, arg_r2 *a) \
     { if (SIZE == 8) { REQUIRE_64BIT(ctx); }; \
-      return gen_crc(ctx, a, gen_helper_crc32, tcg_constant_tl(SIZE)); }
+      return gen_crc(ctx, a, gen_helper_riscv_crc32, tcg_constant_tl(SIZE)); }
 #define TRANS_CRC32C(NAME, SIZE) \
     static bool trans_crc32c_##NAME(DisasContext *ctx, arg_r2 *a) \
     { if (SIZE == 8) { REQUIRE_64BIT(ctx); }; \
-      return gen_crc(ctx, a, gen_helper_crc32c, tcg_constant_tl(SIZE)); }
+      return gen_crc(ctx, a, gen_helper_riscv_crc32c, tcg_constant_tl(SIZE)); }
 
 TRANS_CRC32(b, 1);
 TRANS_CRC32(h, 2);
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index b67c7718db4..bdfd42e7ccf 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -592,7 +592,7 @@ void helper_ctr_clear(CPURISCVState *env)
     riscv_ctr_clear(env);
 }
 
-void helper_wfi(CPURISCVState *env)
+void HELPER(riscv_wfi)(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
     bool rvs = riscv_has_ext(env, RVS);
-- 
2.52.0.windows.1


