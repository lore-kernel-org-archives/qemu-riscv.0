Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmluU-0008DX-Rm
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluP-00086Q-9s; Tue, 08 Dec 2020 17:56:37 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluN-0004Ed-0A; Tue, 08 Dec 2020 17:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468194; x=1639004194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MHa1GnDebIQgBXx8Add4PvqiAFA7dwxIKpm/+VpY/2Q=;
 b=R2kfSA9QgLWGwKBcNJhR5S1jlBPT9PQcpYj/AXn0pym5/jUUsAjj6k0+
 VzbREtRqZzGOFKH0TQz0SGmUp1QKj49nS6xXSwRBNEhgiGZBjn9QWu+Ls
 8/LflvG0iVvKVn1Po57CyK5UVHvdW4hnPK9BOdvKBXn0+RbXLzlJEGzUo
 PXIORxpl5eazLDBUdXFzpdTqQ1922F8k6MxnjoCL35FQdYrPMXe4gEi0O
 urH7WDqeZ1+8n+WtdPeshCyqTv2leZiAZsda9WV26e7NHtXFGiVquF/l9
 NvFKa/dQ7kurNHZzknwXicpUcfaKkGFdRq/ccc1Q+Q/iLm7p9wjP0DHKI Q==;
IronPort-SDR: bQqAri7I+hNvNuOYgRGay9FNwLQ/0aPXFvbHQd6TolzMRK81evgWBi72lyrLqVdvk41Vw9XTM7
 BHNP+TPeJERuuQLMpi48xIc2Y3b/BT67yQkVm0WMP/yKzDBJsrr+TThDOLKAiHdCl2vfhO9jw7
 posJq4+2jmLNEMF8DZV0G5hScFtzsfT5WoxPfmhQx03tnsNMp4iAsQvjy3/XL+/XZIGSEZgDIL
 G1K/jSI1tUTX3Xdg5qd30nYFlNP8qOkAcIkuiJ47lknvS0Y22qqp/2QILsQkzBGVksmwG50A8h
 tI0=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="154713826"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:33 +0800
IronPort-SDR: 3rJfl0/mdK+DtoA0m/gJ7vT+VuuNIyRKfi/pQldn2/PsZHWw6yTu9lHIccov9aND6eH/FeHOfa
 +8HQkixgO0XH5a5q0ieJirvCJ+zVBtOQE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:42:01 -0800
IronPort-SDR: RtMsNJo4DVQ5Dkmow1G+M+EvzEW02my6ACrSFD+O60e6isK8eSr4YUvlERpT4SbuECT9Lc+eA+
 6Zna2s/4Kqhw==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 14:56:34 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 09/15] target/riscv: fpu_helper: Match function defs in
 HELPER macros
Date: Tue,  8 Dec 2020 14:56:33 -0800
Message-Id: <1b78dbf9afd11bc9e47ce112a0096521a744133c.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:38 -0000

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


