Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ2U-0005o0-0C
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ2R-0005mq-3A; Fri, 02 Apr 2021 16:05:03 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:3920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ2K-0003aA-7L; Fri, 02 Apr 2021 16:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617393896; x=1648929896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=buI41Hrhk6Exmbz/ytWjjy8Bk4gHnHPmmc6o+SvFVJ8=;
 b=ZlsXqJxyLt1p+q5kOeWbaMjI6+OzoY9/5DSVeO7XTLEa7o+JassE1a9I
 pY3rnoslG/GFbyRE5FsQW/mG84dpa2ZrwHupudHxQqnSHrg9A8SyVJIsG
 TQEBHli6PR+7MK1uukny3buf/Xh9xh5f5eoLUk8uPYITiVJRIuGIPoYId
 uaJNgVbqCjZJ20tTTSDTErNiHHdeCufsWonE4I9fL5YA4X1TbayGpgrIY
 CFzAVsEXkrohqZ+UO10PPwbGfoLFgUuZASouXaV55Y8Qf4GZhQIas2tIn
 jw2uO/aKGLpSLc75BuPAssXYfcbZ9cFRZvBUR/dvwPjHaZal3qrYGQN0U g==;
IronPort-SDR: hGOs5rjdaTbVu4JFyEcl/cIzt5f3oXgywwQdHwF8QIfXfkLgCj883bNTvqAtHmVmBimkOJtefo
 ybr9HZvRkj58zBxpOxqj7mVAUXYqg+KzWi8xj3rpcJVQP8P2ZoChJ6U2zuA5FEdq08UG/aDvto
 Dltb/FvSuYEREGWAo/hENXJ7Rtn3N10HlO7YjMdbm/WM4JbazdSlrX5vF/V1LhJJhnwGN7ah27
 Cy8psq04tp0U3gKExJjnF3m5LdFhGx60i3t8Q0qgUgttYIm8LANkNjpxlaYMu4lCLNEvwp+KgP
 hJ8=
X-IronPort-AV: E=Sophos;i="5.81,300,1610380800"; d="scan'208";a="168175395"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2021 04:04:54 +0800
IronPort-SDR: vQVN3wDA02MVS/VCCsD01/bMYqO4Ju2bm9ep+q5iR39IEhlqOlPcWgHJLiaPtNH7oyY4+kHMVR
 Nn6JqZxTsWnX+mqVdvSfZDE8DcvTLihUMvmlRvKc4aCdbv2s3s6JFZ5UD7xWagZK+PZkNpDBOO
 0OfXF5U3NqqrVAudpeXA0Tx+n89+LPbptCnnYyIoxH2udp84J47csxMbMfsu4s6DZOYnPONGde
 ovmMnMqjni4lxjxch9qT/a9UGxFTPSgox2ACmYxI+TQX+yXEP/TT7VWHKVXARzi8eenM74lP3A
 i9r8W6Ndid/Jtq9jzGe2G/tW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 12:44:59 -0700
IronPort-SDR: Cs/mM9NPcxZF+w+pVKpmD5Bon0ZHmWDNE/BApkoZW4xl97wwnrlh9CVVwuuLw8neCW2sTDE+2g
 9/HOuANizWgHjueyk9MLRWffwuTDVMK5rrvxhNYdOyMdGAo+Iy03CoFiQ8jiAEyh/Op10vDl2z
 9M30xnJyQA1sISgr0IcyqIA3Zdsjh839Bun3Lu4zZAZrpDdSjUT9q7YPCC6nrGSIM14XwF8VRY
 MI2uMOut4Z6k6rNckVC8lR6/CEOT0MaRcTkS73hlALHdGrKZ2WRTqlKkPYttUwkPoxgQP8MZkt
 ois=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.80])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Apr 2021 13:04:53 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 7/8] target/riscv: Remove an unused CASE_OP_32_64 macro
Date: Fri,  2 Apr 2021 16:02:58 -0400
Message-Id: <aebf46ff114a04335f26cf7a2aae83be66dd5b42.1617393702.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617393702.git.alistair.francis@wdc.com>
References: <cover.1617393702.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
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
X-List-Received-Date: Fri, 02 Apr 2021 20:05:05 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9c6d998efa..4af55deaea 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,12 +67,6 @@ typedef struct DisasContext {
     CPUState *cs;
 } DisasContext;
 
-#ifdef TARGET_RISCV64
-#define CASE_OP_32_64(X) case X: case glue(X, W)
-#else
-#define CASE_OP_32_64(X) case X
-#endif
-
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 {
     return ctx->misa & ext;
-- 
2.31.0


