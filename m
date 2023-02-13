Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRVQ1-0002St-CF
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 04:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pRVPR-0001Ob-5L; Mon, 13 Feb 2023 04:46:06 -0500
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pRVPM-0003XI-3k; Mon, 13 Feb 2023 04:46:04 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VbZAQeK_1676281551; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbZAQeK_1676281551) by smtp.aliyun-inc.com;
 Mon, 13 Feb 2023 17:45:52 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, frank.chang@sifive.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: Fix vslide1up.vf and vslide1down.vf
Date: Mon, 13 Feb 2023 17:45:50 +0800
Message-Id: <20230213094550.29621-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 13 Feb 2023 09:46:31 -0000

vslide1up_##BITWIDTH is used by the vslide1up.vx and vslide1up.vf. So its
scalar input should be uint64_t to hold the 64 bits float register.And the
same for vslide1down_##BITWIDTH.

This bug is caught when run these instructions on qemu-riscv32.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/vector_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 00de879787..3073c54871 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -5038,7 +5038,7 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
 
 #define GEN_VEXT_VSLIE1UP(BITWIDTH, H)                                      \
-static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
+static void vslide1up_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
                      void *vs2, CPURISCVState *env, uint32_t desc)          \
 {                                                                           \
     typedef uint##BITWIDTH##_t ETYPE;                                       \
@@ -5086,7 +5086,7 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
 GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
 
 #define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)                                     \
-static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
+static void vslide1down_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
                        void *vs2, CPURISCVState *env, uint32_t desc)          \
 {                                                                             \
     typedef uint##BITWIDTH##_t ETYPE;                                         \
-- 
2.17.1


