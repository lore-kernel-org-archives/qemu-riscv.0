Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbRw-0005la-QA
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRt-0005i4-0j; Wed, 16 Dec 2020 13:22:53 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:39420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRr-0000MH-0x; Wed, 16 Dec 2020 13:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608142971; x=1639678971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMeTl7U3zpeMqNWLj+6YQlPe1gJ/9JEGsgefexrXroc=;
 b=Kt1dfjbmIoDG5pr12CuInjx3k+YsjNGPARaOGxsMO76VszSz/SeLg1ev
 4RpW1DYySX1Soc7wlTNteFoGbhdSfLEwMMW4C1VGvB2KU9NZdUnnlEnTV
 rXq/rzBzQ/y+YJ8sgBTSVVmqsxlCrrDZq7DBJafdiy5oLphAoB/D1+QFm
 7DD3zUOb/mvzpzc1gK8+cvMxPviDhBmvkTpORrNy28Hl8woofdSsjr446
 qapf1rvKLSp4B+A6Nvjjqwg0/Ztj6RoHN9j37VaR3exrD7E90H97+u6hd
 FIPj7YGywaiGoqewKG3n3krgF+6SxDj+Iy95g7SnF//tK1LeoMhUnoFdP g==;
IronPort-SDR: jvQrbNq7n3RK+yEOd53OjXHTfI1dDICkZMmbDFJLDtRb0erKz1lBveCLwxJlvvk8/RkcIz0XLh
 kyceFCogkAl3WS0UOB2yeLLeG3N5/hoXomoybekFe9nz6e9kPatpIj2w2oMiIebrR/42nKhFaP
 3KnmWSXFoyRMZ8AX1gCZtsE+IuKZeItDKxJ1FluPLdH9TAk37FlrjtoIRfdwTe+SPAo8odemVZ
 2FY/UkXq5Rzzaz+y4rulIXWQr2qVAqe/NCvGYZEfPjxXwuCqIlkhMbPr76flcOfKxFlSgSgYIm
 /oo=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="156514504"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:22:49 +0800
IronPort-SDR: zWM3iIqCNHHBlosiB+A1fWhxPiBj5IiSIJ/GM6GzoNTw1swGNND/tt2YFJUZ5SIPNhArnkJ4h7
 hRmbdDEVIF+E5OfsxqVwl0oF4YyMHmDram/vnh1GNAM9frVlt4fXV+S3R/8JHpkm4TDyfcT8yO
 42XGstWKARWkWOIhOKVTzJZfOwpiFXRhFlnYwtQJpEtdljGGR9nPeb14gdyWlLIQaWf2NBTtiL
 N9JgZgs8m72pAbZXZUgeB4KniaddHZYhNh4dPT+q4cwEMUi39+nNlIlgy7p678UzYdhe5q58Hk
 MH80WrvrjEamFuKaixe5kSyo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:08:06 -0800
IronPort-SDR: eVtGVJ2r9rgV4o9xoQNKzH59Xa4mLWEZZyHOpHKMwc7+xnSI+swF7D3P5Q/oy8gZPJy9Gkp/aU
 N23hUl47Mq6Ck2DBRflgj+hlgU8lVTGicmd32h270gUGFpScF1v+GOfKn0g15/Fs2iLy3Aok7j
 BIFfZWkI+vN33NZNcDyBi0oV1wQmTOcNC7tjUWlmGbR23fodlmZ5hwuUTZ5kBS3TljOtAjxXjd
 KBDHF3cCfTRKbIXS+pSWADpsYJvYoRDz1vhy9FY2qOpGpz1qEYwx8g3uE2Mzy4fJ4XWl8hw4Lb
 /oA=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:22:49 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 09/16] target/riscv: fpu_helper: Match function defs in
 HELPER macros
Date: Wed, 16 Dec 2020 10:22:48 -0800
Message-Id: <614c369cb0000d070873a647b8aac7e023cba145.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:54 -0000

Update the function definitions generated in helper.h to match the
actual function implementations.

Also remove all compile time XLEN checks when building.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h     | 24 ++++++++----------------
 target/riscv/fpu_helper.c |  8 --------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 939731c345..e3f3f41e89 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -27,16 +27,12 @@ DEF_HELPER_FLAGS_3(flt_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(feq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_w_s, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_wu_s, TCG_CALL_NO_RWG, tl, env, i64)
-#if defined(TARGET_RISCV64)
-DEF_HELPER_FLAGS_2(fcvt_l_s, TCG_CALL_NO_RWG, tl, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_lu_s, TCG_CALL_NO_RWG, tl, env, i64)
-#endif
+DEF_HELPER_FLAGS_2(fcvt_l_s, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_lu_s, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_wu, TCG_CALL_NO_RWG, i64, env, tl)
-#if defined(TARGET_RISCV64)
-DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, tl)
-#endif
+DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_1(fclass_s, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Floating Point - Double Precision */
@@ -54,16 +50,12 @@ DEF_HELPER_FLAGS_3(flt_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(feq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_w_d, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_wu_d, TCG_CALL_NO_RWG, tl, env, i64)
-#if defined(TARGET_RISCV64)
-DEF_HELPER_FLAGS_2(fcvt_l_d, TCG_CALL_NO_RWG, tl, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_lu_d, TCG_CALL_NO_RWG, tl, env, i64)
-#endif
+DEF_HELPER_FLAGS_2(fcvt_l_d, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_lu_d, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_d_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_d_wu, TCG_CALL_NO_RWG, i64, env, tl)
-#if defined(TARGET_RISCV64)
-DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
-#endif
+DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Special functions */
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index bb346a8249..7c4ab92ecb 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -223,7 +223,6 @@ target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
     return (int32_t)float32_to_uint32(frs1, &env->fp_status);
 }
 
-#if defined(TARGET_RISCV64)
 uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
 {
     float32 frs1 = check_nanbox_s(rs1);
@@ -235,7 +234,6 @@ uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
     float32 frs1 = check_nanbox_s(rs1);
     return float32_to_uint64(frs1, &env->fp_status);
 }
-#endif
 
 uint64_t helper_fcvt_s_w(CPURISCVState *env, target_ulong rs1)
 {
@@ -247,7 +245,6 @@ uint64_t helper_fcvt_s_wu(CPURISCVState *env, target_ulong rs1)
     return nanbox_s(uint32_to_float32((uint32_t)rs1, &env->fp_status));
 }
 
-#if defined(TARGET_RISCV64)
 uint64_t helper_fcvt_s_l(CPURISCVState *env, uint64_t rs1)
 {
     return nanbox_s(int64_to_float32(rs1, &env->fp_status));
@@ -257,7 +254,6 @@ uint64_t helper_fcvt_s_lu(CPURISCVState *env, uint64_t rs1)
 {
     return nanbox_s(uint64_to_float32(rs1, &env->fp_status));
 }
-#endif
 
 target_ulong helper_fclass_s(uint64_t rs1)
 {
@@ -336,7 +332,6 @@ target_ulong helper_fcvt_wu_d(CPURISCVState *env, uint64_t frs1)
     return (int32_t)float64_to_uint32(frs1, &env->fp_status);
 }
 
-#if defined(TARGET_RISCV64)
 uint64_t helper_fcvt_l_d(CPURISCVState *env, uint64_t frs1)
 {
     return float64_to_int64(frs1, &env->fp_status);
@@ -346,7 +341,6 @@ uint64_t helper_fcvt_lu_d(CPURISCVState *env, uint64_t frs1)
 {
     return float64_to_uint64(frs1, &env->fp_status);
 }
-#endif
 
 uint64_t helper_fcvt_d_w(CPURISCVState *env, target_ulong rs1)
 {
@@ -358,7 +352,6 @@ uint64_t helper_fcvt_d_wu(CPURISCVState *env, target_ulong rs1)
     return uint32_to_float64((uint32_t)rs1, &env->fp_status);
 }
 
-#if defined(TARGET_RISCV64)
 uint64_t helper_fcvt_d_l(CPURISCVState *env, uint64_t rs1)
 {
     return int64_to_float64(rs1, &env->fp_status);
@@ -368,7 +361,6 @@ uint64_t helper_fcvt_d_lu(CPURISCVState *env, uint64_t rs1)
 {
     return uint64_to_float64(rs1, &env->fp_status);
 }
-#endif
 
 target_ulong helper_fclass_d(uint64_t frs1)
 {
-- 
2.29.2


