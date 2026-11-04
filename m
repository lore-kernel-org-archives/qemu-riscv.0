Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336CC60C1682
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=eNlNaFwN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtY-0003pK-M0; Wed, 04 Nov 2026 14:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtW-0003mN-Pj
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:38 -0500
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtU-0002ak-Vv
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:38 -0500
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-3514b90bb89so2070682eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821416; x=1794426216; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5AX5eJ/pPbJ7vuc/TMSU+a639LFRMm0l50hu5KtjQYU=;
 b=eNlNaFwN6HdTGkHwkLIkD5F2gd2FWz13J5ZOeNhTCBpedvjBQlX77Ugxyix0v5W0rR
 Z4wYjJhoLHVc5xN6eJU7ZDoylW9GZjWb90isRg+pGJ3OzugY9iCfj7ez/7G8A/xsxdT2
 JxwpIHqQrKTLoq0tXgDE9k3H/rLSqBKhYcxk7Sb0eamsaOZC3YzlO+PS5M5G9mlyqsPG
 xJ2Ex09Dpjelnk+WxoekKSSbq5UxEwzoyXyBmnG56P2md3QWz20Inixvq06Imf31vBIc
 NwSX8W14eq4CqsIsAnR6c8wY46ouEdyyB/Az/tZ5wX3HIqUz1wPaSZX9TVeOfJU7HUSY
 Dk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821416; x=1794426216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5AX5eJ/pPbJ7vuc/TMSU+a639LFRMm0l50hu5KtjQYU=;
 b=DmIbD2M/ia2wPTWLKE9Med1pAKAtVpEcQpu3O5mLxMHcu7Jkuc2qGnMmgy/9cmLtvr
 phNe19gchiwX2sJ9uptILCJqtYfwn1yWXVVzmla+9nUZW6u6dzqM+oMZuXwah6Ls7xLz
 5p9uKYWrkCYPC3P/IBsD+H75Z2pgpvxZyilqADwDfe3FmqF1eRszPcgv4pyYcAMV52IY
 H/7gecAl1yiNiMkL54T5t6TEvDoIkyqTWKIorjLPOns2uztYPqFdo9Zaoblqe4lZjSuf
 eVgG/FU2PKvtg1KUqaBY1RAoLvfU+TsJDXr9zr9Jx63LpPeBRWjFzxc2ve33fNwGwwTE
 5GUA==
X-Forwarded-Encrypted: i=1;
 AKwUvByV5PH/VhTgZkp8A3qGKmfodEdAymr4h1bf3SJf17q8mSexsSS765g3845CFRuH9Lt63ORPoiUp78K5@nongnu.org
X-Gm-Message-State: APuU4Z/gTlK2mVWtmLgV6o81Rwo5gLJLxHdoA3B9BZ32A8CNidFRqtjM
 w3LnjKREPRT3aXePsaO9CE0O/BtmwZ3buej6PttNIjBJxvstBfQRD4mMgSxdawjh9xU=
X-Gm-Gg: AYBFou1y0FY2/orxmTKqXqrxBkUZcTb/oHWJjYTKfHr/XM11fdnURZdB0DPw9KrO3GF
 rAu3ubMOtExmdgMOJ8W37+lttV5g2a/k5nsBpnV5ax+UmrZddpCgAYkbZ4C5xHYWw50w+dd/TF8
 O3yLxCWU4Admy2n1gmpT4UwO/C21j0xT3D26ZzAuBZt7Myqtu4BolgpUV+giHHtsvHIgaxPP01q
 V/evNQ7IRtiQytzkau5iu8mQHHFPYKeSX1A+NsLRWjJgtwLIdkH8l8PpQJvcJYWyzHbEkMiA2uz
 Nj1SVXIRmaHNdnFxC/pH/xpiSwvPeirtuRRxQGnXmVNfs+BMjHV7yTqrKhZz3rGA8g2HFGmfw1p
 lcNhsBtnQUv6M0nBISE3tKfXJo8g+xMUouLJ5+dFZtL5Z7cqnlXnmxwfoCVS95p4QqmUJC/mvWi
 uwoPQl2YLyDQ1QlFjE7wffbd3UWIW7eaDCRKPyIjm5uO9eAJejVS1t2bDHuk65YhqExopkz8Y2c
 C4GWg6M7mXWdugT4AQkv6DRbGRlwkIjTKSOmjHIxetWzYqDx5INYDmGWW3TrSyh7Rm8kP1H28CX
 lpVaUODVGi91p9COJQuEZqVk9M73UEYSfyY5h67HG8qNkGV4mPZNYz+46hZGU/x6rU/SShMHOh6
 TsNW/BoJsGkHN3wtQ8zzq/gkaHpt5lw==
X-Received: by 2002:a05:7301:2a24:b0:36d:48e:82de with SMTP id
 5a478bee46e88-36d049e0895mr5101557eec.12.1793821415401; 
 Wed, 04 Nov 2026 11:43:35 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:35 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 25/38] target/riscv: rvv: Implement Zvqwbdota16i
 instructions
Date: Thu,  5 Nov 2026 03:41:40 +0800
Message-ID: <20261104194155.679241-26-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend the vqwbdotau.vv and vqwbdotas.vv instructions to support
both 8-bit (Zvqwbdota8i) and 16-bit (Zvqwbdota16i) batched
dot-product operations.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/helper.h                       | 4 +++-
 target/riscv/insn32.decode                  | 2 +-
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 5 +++--
 target/riscv/tcg/vector_helper.c            | 2 ++
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e48b9b4edec..84571a999f4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1400,9 +1400,11 @@ DEF_HELPER_6(vfwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfqwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfqwdota_alt_vv, void, ptr, ptr, ptr, ptr, env, i32)
 
-/* Zvqwbdota8i - 8-bit Integer Batched Dot Product */
+/* Zvqwbdota8i/Zvqwbdota16i - 8/16-bit Integer Batched Dot Product */
 DEF_HELPER_7(vqwbdotau_vv_b, void, ptr, ptr, ptr, ptr, i32, env, i32)
 DEF_HELPER_7(vqwbdotas_vv_b, void, ptr, ptr, ptr, ptr, i32, env, i32)
+DEF_HELPER_7(vqwbdotau_vv_h, void, ptr, ptr, ptr, ptr, i32, env, i32)
+DEF_HELPER_7(vqwbdotas_vv_h, void, ptr, ptr, ptr, ptr, i32, env, i32)
 
 /* SiFive Custom int8 Matrix-Multiply */
 DEF_HELPER_5(sf_vqmaccu_4x8x4, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index bf325229100..8a06547a570 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1109,6 +1109,6 @@ vfwdota_vv  100100 . ..... ..... 001 ..... 1110111 @r_vm
 vfqwdota_vv     100110 . ..... ..... 001 ..... 1110111 @r_vm
 vfqwdota_alt_vv 100111 . ..... ..... 001 ..... 1110111 @r_vm
 
-# *** Zvqwbdota8i 8-bit Integer Batched Dot-Product Extension ***
+# *** Zvqwbdota8i/Zvqwbdota16i Integer Batched Dot-Product Extension ***
 vqwbdotau_vv  101110 . ..... ..... 000 ..... 1110111 @r_vm
 vqwbdotas_vv  101111 . ..... ..... 000 ..... 1110111 @r_vm
diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index bc12bcb9b72..650affc045b 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -4315,7 +4315,8 @@ static bool vext_vqwbdota_check(DisasContext *s, arg_rmrr *a)
     int32_t sew = s->sew;
     int32_t vd_eew = sew + 2;
     return vext_zvbdota_base_check(s, a, vd_eew) &&
-           (s->cfg_ptr->ext_zvqwbdota8i && sew == MO_8);
+           ((s->cfg_ptr->ext_zvqwbdota8i && sew == MO_8) ||
+            (s->cfg_ptr->ext_zvqwbdota16i && s->sew == MO_16));
 }
 
 typedef void gen_helper_zvbdota_int(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr,
@@ -4325,7 +4326,7 @@ typedef void gen_helper_zvbdota_int(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr,
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
 {                                                                        \
     static gen_helper_zvbdota_int * const fns[2] = {                     \
-        gen_helper_##NAME##_b, NULL,                                     \
+        gen_helper_##NAME##_b, gen_helper_##NAME##_h,                    \
     };                                                                   \
     if (CHECK(s, a)) {                                                   \
         TCGv_ptr dest, src1, src2, mask;                                 \
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 5ea073b6d76..683b14f28f3 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -6197,3 +6197,5 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,                  \
 
 GEN_VEXT_ZVBDOTA_INT(vqwbdotau_vv_b, 32, 8, uint8_t, H4, H1)
 GEN_VEXT_ZVBDOTA_INT(vqwbdotas_vv_b, 32, 8, int8_t, H4, H1)
+GEN_VEXT_ZVBDOTA_INT(vqwbdotau_vv_h, 64, 16, uint16_t, H8, H2)
+GEN_VEXT_ZVBDOTA_INT(vqwbdotas_vv_h, 64, 16, int16_t, H8, H2)
-- 
2.56.0


