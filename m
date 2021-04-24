Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la94F-00005N-It
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la94D-0008TI-Lo; Fri, 23 Apr 2021 23:34:49 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:7434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la94B-0004MR-Ou; Fri, 23 Apr 2021 23:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619235286; x=1650771286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d14N0Y5Ry5uhxuNORztBbIKTQXqP1sBkSSfyZAQ6cWo=;
 b=jXHkX4CT0fVTydKP/IX/WxbXpyVRh0s+XCuzPymvYk9QOxBYDNToQSte
 szfPj3K45vXrExLXonMpPLMxc+JS9tvSze7WBVhZy3PrarS9WIM4KVfN6
 aysjBmeL3C/+AASgdai3xqAR7gh7Kt0MyHLg7vkrL38VB392kcI1qqnNP
 pUAWBxH3IYp+eQeFF1ducw8IyWNzhyKGk0AV/nBgAZ+xR/Lb9QpKY2W/E
 dAXvOvt8J35jM3XpDJvJym3dgU0ltKI85RveunV0QMdjjbnTUPzWCd0xF
 lEL2hXo7bthNkOvfltKLL2fhuscY1IYraapD9guhTy1UOmmJG5zEukymX w==;
IronPort-SDR: k6Z8bndjOdtBv9wPYrHx3AJtfArFTFvuVmBR2Vvm+oKDJR1JCOiOEDSNAkqTXxODSTu85axeWe
 vP13pvEOPf2USzBsvUWR9fQXF++7CAuLLSNqjpnVeDZjtLwDfTJAN0pBpY2DmhGpCP/7rJ/pHy
 hwQa8QD7peWwro4GoTTu4Y+iuNvUKAP3f1KNk3lllk8RLmrzbtzY77Sdr12wjJ3Iqt1lQDAB5w
 cDXfnKPFeIAUEn+UG+th09nClGyM9kT5177cfqeSdih3cRMdoT67DsTPyFa4M7SiYs0j8qM49W
 qGc=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="166115916"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:34:44 +0800
IronPort-SDR: NZcYKUXM12/l2WC2pjR54IbXAvHjkvF2bc8/L48FyaQKQfTaJzvJsRR7+a43WNc6MEytKv1AWQ
 DpPLwbnOKi9PRk8+dKxhaOpSCub4ReDidLDF9HCX3Kfe0Vuf55kkz39ePD4TdVMMjFkUfxn5E4
 netT8+ccJpmFLPdHUr6eoYzBXXp2GmyWpa3AvhzPYQrXHLSOG0ZWym7ZldSOCbj0MfZAP1hwHX
 w+TqhmkLCdtzOE5vw0yOpujjV13pTUm8YFoVYxejByAML5Uq48jr5cDdndssrVJDk/9HV2VThe
 TlHaB/XNy+h/dmUc8/w79fZs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:15:19 -0700
IronPort-SDR: G2+MruUYzI7ksEsGf60WKZkbvOi+ZWIMkEmjA1CiTjNMge9QRTnJSf/zWh2LdbTvxyGTByv4bP
 /o+Xqt9H7zBzd7/FP4p4hxM1AqB25XPBrh2vOvboYe14Jx+IOiqZlf7ike3uTRREdHYKK3lWiS
 IASV7Zgdr49/d3W/5/piV8NQ02NGq9Mches4Zy+Izy8V9b+RiTOuFdh5sf99nuXwJGj5x47MVD
 Ybr2gn9a/wVh/vWtIhQZhybL3/x/nMiecAgzfeq+z67GxYiS4dwwW7jhFkKRJGNiLqEX1y6oEc
 OkM=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2021 20:34:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 10/10] target/riscv: Fix the RV64H decode comment
Date: Sat, 24 Apr 2021 13:34:37 +1000
Message-Id: <024ce841221c1d15c74b253512428c4baca7e4ba.1619234854.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Sat, 24 Apr 2021 03:34:50 -0000

BugLink: https://gitlab.com/qemu-project/qemu/-/issues/6
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fecf0f15d5..8901ba1e1b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -288,7 +288,7 @@ hsv_w       0110101  .....  ..... 100 00000 1110011 @r2_s
 hfence_gvma 0110001  .....  ..... 000 00000 1110011 @hfence_gvma
 hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
 
-# *** RV32H Base Instruction Set ***
+# *** RV64H Base Instruction Set ***
 hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
 hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
 hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
-- 
2.31.1


