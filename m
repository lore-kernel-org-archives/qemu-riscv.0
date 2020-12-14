Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouY8-0001Vu-6i
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouY5-0001Pu-W9; Mon, 14 Dec 2020 15:34:26 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:60606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouY3-0007ui-01; Mon, 14 Dec 2020 15:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978062; x=1639514062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MHa1GnDebIQgBXx8Add4PvqiAFA7dwxIKpm/+VpY/2Q=;
 b=ZSv70RzQBMBx0Gk5/bTTPVP44NxlWFA5LrTd8PxbElcAAJF9gtsHdFiz
 zNC5GDwmp0x53tV7O2bqhrbyJsZgQZEGyhC85vg0RS3fu4yg0xzReIcAJ
 mBgl7WVUWSUxbm5lYSj8BDO6LHNGkOBlsKu15+PKm6fRJud/ViRE7qZs1
 oiVaSMvzJo4PUUfRu58wHnq1AncbgNYhzu1Sfg5lip2vwzrdNbL9Ry04Z
 mE4s/b04Bi2aTsjYboD4zr35TG5SgzDCKasJq2tONG/PaAP5AMRiWZvEn
 RIlx067Ulul2CXjYHY4E1A8qMmYpNlnxKZ1BuFlhDQU41YD5ALl/c0nha g==;
IronPort-SDR: IKzdtg3qjYDTbUGeFK2OFcWbl1UUrO5Df1XupgAVaZZq2SU7o6B6L0CMlcYbC9TvCLOW9pEFXt
 d6F7t0L5ZmmnRKgBlEodtz/XqxO38VugJx2b5n+fWIJT0b4Yoer1TTHnw7krChjDz28gS1dHMe
 O1YmexFEBDEBBi5FPl8UBpGmm0jzHaPWjf6IjCo+qT3WiO9VQ3LO5CChPgi/PC90UfbXmXcEx7
 ThnWRrGfOzjCtBdWyXOmQxDs8gLi36JwRKVFhZS46QWQVeEQLN8PPvI7mg/55E51OQshmmClJT
 WhE=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="159586000"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:21 +0800
IronPort-SDR: b5DFg4K7ZAild6MVn8Ud66Yg6aSRpHAinHp3b1WQTEGbH9zca1OKanSmy1wTSRkcvLks2SkfPE
 xkIGPiJlhqPT49ORL6j7+VXW4dsaivdRtgUskIQPWUGhGBLejzukqpl1G03HS9Dl2ktUYnR9an
 ZXwuXVT4NTKdutsg2qz5mtQdRZZmoApdkzABC8qyIT/I7tl2mN+f3taF/E950mPoo7kolYQR2d
 mZMeuNYrIVODzkpakdxvmKJa/SBvI0An/xyWEVs6J5zD43uRAsV7/l3Y118cyHPQ4RU3CxNqVB
 8fnbC48UJ+UhevpsNWwa+/hU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:18:05 -0800
IronPort-SDR: GybwWlQROHU/OeIpKpIQojx9wrvN7Qk88RdUFM6UmVUV4g22Ht2Dmd5sIJwiBS7pSeb3wk80Hh
 IMUHQAmPSpzifEVZwXIzSubKppYosI2P2Ge0EODAmPY40md1XQqNpEEzmLvkivZsQoPXZY92QA
 +u3BCavD8SeWpRn37K9ZH5cnynnYpifBM9ktkXJZL0zQ/SsTzRKNvlKRXJ4fWIzXpNk1Tj20Af
 qOZg/Uyx50iXCtlAfafjFKCNN6s7GsFOT7I83j5JUF/Thx7J1vZ1EOX6fc5Ql7b76CgunPLUn5
 gGQ=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:34:21 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 09/15] target/riscv: fpu_helper: Match function defs in
 HELPER macros
Date: Mon, 14 Dec 2020 12:34:20 -0800
Message-Id: <2cffe9cb8055c9451872b3a08192e19fec12fb1a.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:26 -0000

The helper functions defined in helper.h specify that the argument is of
type target_long. Let's change the implementation to match the header
definition.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index bb346a8249..507d7fe7fa 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -224,13 +224,13 @@ target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
 }
 
 #if defined(TARGET_RISCV64)
-uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
+target_ulong helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
 {
     float32 frs1 = check_nanbox_s(rs1);
     return float32_to_int64(frs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
+target_ulong helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
 {
     float32 frs1 = check_nanbox_s(rs1);
     return float32_to_uint64(frs1, &env->fp_status);
@@ -248,12 +248,12 @@ uint64_t helper_fcvt_s_wu(CPURISCVState *env, target_ulong rs1)
 }
 
 #if defined(TARGET_RISCV64)
-uint64_t helper_fcvt_s_l(CPURISCVState *env, uint64_t rs1)
+uint64_t helper_fcvt_s_l(CPURISCVState *env, target_ulong rs1)
 {
     return nanbox_s(int64_to_float32(rs1, &env->fp_status));
 }
 
-uint64_t helper_fcvt_s_lu(CPURISCVState *env, uint64_t rs1)
+uint64_t helper_fcvt_s_lu(CPURISCVState *env, target_ulong rs1)
 {
     return nanbox_s(uint64_to_float32(rs1, &env->fp_status));
 }
@@ -337,12 +337,12 @@ target_ulong helper_fcvt_wu_d(CPURISCVState *env, uint64_t frs1)
 }
 
 #if defined(TARGET_RISCV64)
-uint64_t helper_fcvt_l_d(CPURISCVState *env, uint64_t frs1)
+target_ulong helper_fcvt_l_d(CPURISCVState *env, uint64_t frs1)
 {
     return float64_to_int64(frs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_lu_d(CPURISCVState *env, uint64_t frs1)
+target_ulong helper_fcvt_lu_d(CPURISCVState *env, uint64_t frs1)
 {
     return float64_to_uint64(frs1, &env->fp_status);
 }
@@ -359,12 +359,12 @@ uint64_t helper_fcvt_d_wu(CPURISCVState *env, target_ulong rs1)
 }
 
 #if defined(TARGET_RISCV64)
-uint64_t helper_fcvt_d_l(CPURISCVState *env, uint64_t rs1)
+uint64_t helper_fcvt_d_l(CPURISCVState *env, target_ulong rs1)
 {
     return int64_to_float64(rs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_d_lu(CPURISCVState *env, uint64_t rs1)
+uint64_t helper_fcvt_d_lu(CPURISCVState *env, target_ulong rs1)
 {
     return uint64_to_float64(rs1, &env->fp_status);
 }
-- 
2.29.2


