Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nnzSt-00082a-8m
	for mharc-qemu-riscv@gnu.org; Mon, 09 May 2022 05:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=121c34684=alistair.francis@wdc.com>)
 id 1nnzSr-00082G-FP; Mon, 09 May 2022 05:14:01 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:3082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=121c34684=alistair.francis@wdc.com>)
 id 1nnzSo-0007Wg-Nr; Mon, 09 May 2022 05:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1652087639; x=1683623639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oBp6MLr1KtU5iibrj7MTfx6IWLD9UfqISb2frPqdNzo=;
 b=ATk4xpN7pmV3+57fF3N4oPUMLXJJcuBl+l0zfTxuJLqtNtyFNa0/3DXm
 oSjpCTLfVa2p80bNbOq3qvaJx0QJZpQz+cDMUsHvDpspaZzd84pBt5dkh
 7UDsP+FTd0oGRjG3U3hswL78ljy+36+sl1dDtYVNo4ri1La/Kl77AoCpu
 3CTsfC0i5QIwIaJy2nbx+dqGW2mdZo6MhUXZH87aYxS35wLmQMmtOxuJO
 yOkmFrXdBR9IeDzyuF6Rns7luCjnOC4KV2IwCXbaCAttICEuYOjEy31QF
 59DqFW6kn2r0OhfDVS/cNFGr+dps991Xo8VtFINWigahrTrIR81mTjU0d Q==;
X-IronPort-AV: E=Sophos;i="5.91,210,1647273600"; d="scan'208";a="200723933"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 May 2022 17:13:53 +0800
IronPort-SDR: GvcSFVHffTZGff00hfo2h0aj2eV6V5oxZyKKzcjVXD5l4EUukdipFTbVYs59JbRIPbR7rP2iP5
 wyk9wt3aTclJrn/tAW3ktj+9myR08FRkrLgIM5y+wI0ddHOffXYPHoh1lj/sEYry0U9ApJdnco
 dckFH14cvSlMRXqLkDkYiEtZuE+hniDZJAjLU2CVsYCjKE6j2h6RqgFEb+gBtlx03Cs8jOcoBs
 /w8M2dQ02tp7pnu5balSaSXyI89uyvSxUG00GLxTHkcbh40RtGj8x/XfpCQe3nY2iV9DRhUkLV
 hHiF3QO2jyiRdwZ7hLh6dbJq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 01:43:17 -0700
IronPort-SDR: Zl6wqMNbS1gZN0EPK0jcc9vhgX+Y6TrrDkRyiTdC2+tlk0ac6vgFMaUssrfjPvylArrA2wvVW9
 etQGKNkjnvzrMd1yw41sjrL6tGN6zmViMZvbnSqCwSLgHVWfqxAK6GerdjD4df+5Uj/uL1HZBY
 2f7f3Agx2s+ekNVl5rqM7zjojiwjYf6w1lpvjUEowY9kzn/ooz8lbN0RDbKhl232l+KDwIQHTb
 c+8z/NXvx2BipZxtmHNkRsDa7owL4hyjIvLxMFSIIP3ewtSL0KmAj32oUVIxr3dvMxhnpY5B7Z
 0uM=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.123])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 May 2022 02:13:49 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, bmeng.cn@gmail.com,
 alistair.francis@wdc.com
Subject: [PATCH] MAINTAINERS: Add myself as hw/core/uboot_image.h maintainer
Date: Mon,  9 May 2022 11:13:39 +0200
Message-Id: <20220509091339.26016-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=121c34684=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 May 2022 09:14:01 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 662ec47246..9ba30cec8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2173,6 +2173,7 @@ Generic Loader
 M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
 F: hw/core/generic-loader.c
+F: hw/core/uboot_image.h
 F: include/hw/core/generic-loader.h
 F: docs/system/generic-loader.rst
 
-- 
2.34.3


