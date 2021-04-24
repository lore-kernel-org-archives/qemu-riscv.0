Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la93g-00085h-6R
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la93e-00082p-Sz; Fri, 23 Apr 2021 23:34:14 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:7403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la93b-00043T-Hm; Fri, 23 Apr 2021 23:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619235251; x=1650771251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RQcILOF1kLcOwUcABbfqKxgfDlarpcavDVVrkqxubPw=;
 b=Yvq+TMHt+VmJne0n5HGIeHjLCI0vmgHmcvmzwCmv7GK9Y6t+EL1XvzwF
 pirz8+cKEFbLopUWhl2rqaXyrs/udcUCnYoc7JwnNIfnTeV6+f1dXYCsy
 YGPRH4Rs+4CQn0Xad9rH2HGYCdMhmDr97h/oPTSSTtIvQRN9wB707zFbs
 gBxTn6x6KlX8O3t2PT7Wrt0XA8h+xXui1PbqXZITO8bc0tpBLyy76iCFw
 S8E/aM5HqJqZ/G87G1LxEs7oHh95dMJtYk7nhSTpjUZkYcGaavIGWOPrt
 90Blqba9csXmGPcWfF13klp6XyjBt5hsJ2br9GEBBHVcTvbajmsfvFxzu g==;
IronPort-SDR: yMTfLXwGy2qLtThoViO4kmyZyD+sY4c0IZZVns77az82ubUms+hE+ZUCa2eVu4JQw+XiaH67RC
 OOy1tnWyszQbyKuTUAPK6jqhpLru3OymKnZ7OCm1a9jf7XE5QBh0Psbi84UoUFan4EjSK+3Bgz
 7b7NSIGtdx2ShCzZBxh1wEh3+QgH+WUZUxLW3EiPicVT2rJkZ9/VUsmlDRJtVmLoq5chir5UDA
 YRS71q/DTn4UEpxsIqqeWZ3LOuMzB4ChbhVh5rKBnRNXvVPg8p4FrNdkMC7sTfKFGm+SoB5eSm
 86U=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="166115875"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:34:09 +0800
IronPort-SDR: ceJgXuJEKT5hAEmwtkP7zrlTNPrONgZY74SZbfigdHH3x7QcKrZ9rkb4p2pUFZ2FZrmwO/XxHx
 4elsHCZZ80g7MTjZXwUF/3O6lqpNPG0RrYxv1bbopIqiA8hBICxrO8AAYH1zQoWCR+Ca61cF2y
 XnNI3b7S84hGP2L+susdBhtcxkgoz12YnqVjkI75ORVgy1uI+C/WVDEBVPO+3itCUBTRoHRcIG
 WJfVG9+SL+t14ha2kb5FjrMzn6RfTA1rSz7CBGZNH2sJI1trVqzOeRyCbs8An67gtMw6KaGXRd
 l3NhSjfRTw6zuyIfA5s2/chs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:13:11 -0700
IronPort-SDR: 7eBFnDyrzQahbXy99DLTDO2FmPZaAtoEbzntW+w5rrSDz/Sb8CYxPUJhIPHKwITa0isJe0NJGc
 fOykx9+r1vUNbSoLXRYlA6IaF5QPbx3pln+0BXgexnksORuXI5uR61dYaSxAc08KskvUHI++GO
 Uta1gIQX9yKs2CRNV7s4aNpyJ8ls1K9KUPcY3FmmEkMlt0K3i5IgSXP1aY+gXbKsQ4DSaNYfbS
 VPcicqHtUQEpXrGkc+L2LB5W/fAUkJkdf+QYBpqnDuzgQ2jWZgoTZFQGB9BlD+S9YBkSlN+vF4
 8wg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Apr 2021 20:34:07 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 07/10] target/riscv: Remove an unused CASE_OP_32_64 macro
Date: Sat, 24 Apr 2021 13:34:00 +1000
Message-Id: <4853459564af35a6690120c74ad892f60cec35ff.1619234854.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1619234854.git.alistair.francis@wdc.com>
References: <cover.1619234854.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7413b051c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Sat, 24 Apr 2021 03:34:15 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a596f80f20..a1f794ffda 100644
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
2.31.1


