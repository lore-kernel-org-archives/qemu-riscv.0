Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSYp-0008To-Rk
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSYn-0008Or-BM; Tue, 13 Apr 2021 19:35:09 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSYj-0004Xq-Pq; Tue, 13 Apr 2021 19:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618356905; x=1649892905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4fAfgPIZ3lbd3Ui7he7G0ZKZKdIXrGhC9Q5XFmRKFUI=;
 b=LV3mhX7ffeNTw+M06g4i6Hr+1iS3WQGM3vpGHC6uKz2uDJ2/+gnmKChK
 KRUJuqJ1HN2FxR2bj+a9Bt+qW/VbXTGsW08eaEGR6OkAcawUNebZp8D+Y
 1gRiP4OrRMTXjipirrLsucFZR0ESyS3J9s+aHjsFYL6W6drWk5X8FxBNx
 LHIZOesUGIY0VG/nvg2D+4Tucwqiyuy2DLxpRD55uYtK4yEvRP0Yrg6P0
 BWxJniY1Da8J2cFJuEyb6pqseGrvOfzh3ZVUlxpOH3P9CmMmyREcOr1M0
 PxpfThrRvcfFAyULgNmwADXwt1rHXZIVRcH3Rqu7L2y41mLt5rxukszTS g==;
IronPort-SDR: zJ2bzFqaKssS383/lCn/1rABm4b3+fpWLgpWt4chkDqkuKoOv+r6Omu8Apdl4B2glbHZSqEIme
 stKjzS5BkRCXn62gz4VEMJuJL3Omm04LO+Wg5eq/z8Q0SRDM5MMJFv7S4QNbGQsQIhyXG2uYh3
 eZUs9xFa6R2A0NKrXFFTQCzV34Gw9XOWgCohKHiIq2CBWjcn06zFyRFOZiwQd+ESyTvMkJsMXU
 XruOgH2EAh5NCcfljT+/QXnFufvL95HGr3YqS2yn/7T3OQNMZ/GrBqOouX1Wpnh3zWvXCsGIzP
 zH8=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="164258326"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:34:51 +0800
IronPort-SDR: +WLG5/CfVfrz2+HXXotQruCZA0zcN0kU2hhbPIR4hJAYMLJqft71jC7IeC0RGL74VMX/m+mWGK
 VxtEzuul9gKFbkAaVAjHBeIcmGoPdZkmL9QrOiqMsc498ASAoJdEe8j1lZTbql/necwJVSDK5s
 lgrcXewG4/GBp49PXAfVoJNKFn6hKRxsIN+4fA2Kthd8nxpOVkp67m9sqJhYAWL4UPf4/Imzmi
 ywGo6Bghzfn0LMw5hhln/Ld3ONLCOXnbumogfHA4aZHNvsMCcPYIQXLZSx4QiurSGMulNYDeiB
 /H6u3FNq23g2KDddRyzeekxB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:13:49 -0700
IronPort-SDR: DdBt2xFP/iPh8TqWBjXIKSVkCGIUIQsl0iCbzEb5TMzF4H7I0V09YpH5+ihF7kbWhHd/GA/XMb
 Ex/tYHG9AmXE26K49QVlszWKqNPa9Cv/v75Mq3MuhIXOcPAODx5zBz5b5PNyNykNv7cJr8C793
 39bDrZA+1goGC1z/Hy9ECPvfPsbaO6i0Ri0idSWgH+AdXpqjx8Zud+P5OyH25n4cZwllhwzDHU
 II6dGlWBP+WsP7CumKBkqysXCwq0iTfeOmiOWs/E69Cqt/XAgzhgte13bZqI3QGL4DO52yzNu4
 caw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Apr 2021 16:34:19 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 7/9] target/riscv: Remove an unused CASE_OP_32_64 macro
Date: Wed, 14 Apr 2021 09:34:17 +1000
Message-Id: <89944e8caeecd85d7136ea53e7b2bbe8aab18222.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618356725.git.alistair.francis@wdc.com>
References: <cover.1618356725.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 13 Apr 2021 23:35:09 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 74636b9db7..ba8fb2cda3 100644
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


