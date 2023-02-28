Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWxS5-0000Kt-R9
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 05:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxRz-0000Js-BK; Tue, 28 Feb 2023 05:43:16 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxRv-0002hk-DJ; Tue, 28 Feb 2023 05:43:13 -0500
X-QQ-mid: bizesmtp75t1677580974tlrhbd44
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:42:53 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
X-QQ-FEAT: ILHsT53NKPiUQCgNiBTgegFpxCkBwghMFOA/s+MvGmwhppJEhmfz7xSQzbiUi
 f80wu4S73G2cl/43O0VSTdlSsCDi+lE5TJ5i887ujAAfglDpiTp5rZkPJrZdB4KCslV3WeD
 yv3Bk9OPzHWHqcnCLTjFo0iW6NudrGgoMBqANFKhOxUYIW4eCKAUMwy5VMBoAGX8ny4IoeZ
 zoU+VVcJYycciTKJjlD44cUIJkMFWkOsRvRQz09EbMaliu9P1t2R6DMB2utwq32Vq7XKRSD
 PibYCE8A5fm7FBrSrN6zffwSLaNsBEuVC4+oko3vtStGSLb9oNI8fm2wnMVYAD0qO5yuBpX
 QNSklVZ3IY0oDmkW9kCuVW19p6GHK4/sQCEccAW0ebLzgFRdx0=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 02/18] target/riscv: Add some comments to clarify the
 priority policy of riscv_csrrw_check()
Date: Tue, 28 Feb 2023 18:40:18 +0800
Message-Id: <20230228104035.1879882-3-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 28 Feb 2023 10:43:19 -0000

The priority policy of riscv_csrrw_check() was once adjusted in
commit eacaf4401956 ("target/riscv: Fix priority of csr related check in riscv_csrrw_check")
whose commit message says the CSR existence check should come before
the access control check, but the code changes did not agree with
the commit message, that the predicate() check actually came after
the read / write check.

In fact this was intentional. Add some comments there so that people
won't bother trying to change it without a solid reason.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

Changes in v2:
- Keep the original priority policy, instead add some comments for clarification

 target/riscv/csr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 75a540bfcb..4cc2c6370f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3776,11 +3776,12 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     int read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
 
-    /* ensure the CSR extension is enabled. */
+    /* ensure the CSR extension is enabled */
     if (!cpu->cfg.ext_icsr) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* privileged spec version check */
     if (env->priv_ver < csr_min_priv) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -3790,10 +3791,18 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* read / write check */
     if (write_mask && read_only) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /*
+     * The predicate() not only does existence check but also does some
+     * access control check which triggers for example virtual instruction
+     * exception in some cases. When writing read-only CSRs in those cases
+     * illegal instruction exception should be triggered instead of virtual
+     * instruction exception. Hence this comes after the read / write check.
+     */
     RISCVException ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
-- 
2.25.1


