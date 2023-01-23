Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJnyI-0000xi-Ao
	for mharc-qemu-riscv@gnu.org; Sun, 22 Jan 2023 22:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380dee0ef=alistair.francis@opensource.wdc.com>)
 id 1pJnyF-0000xM-Oo
 for qemu-riscv@nongnu.org; Sun, 22 Jan 2023 22:58:12 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380dee0ef=alistair.francis@opensource.wdc.com>)
 id 1pJnyC-0003tv-Qs
 for qemu-riscv@nongnu.org; Sun, 22 Jan 2023 22:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674446288; x=1705982288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FxoK4IQ1hDzxmuW2EbFKJk8WcNRVQ67PURdzoxUFdNg=;
 b=NiB/hyVIMFL9SHGtPyJtvAswQWoUC6pQJyPqdnL4yOOTv2AgWP5XM+Tj
 2Wd0Pz6iikw9EwJeO1y9Xm1QgP7TMnaD4APasuV73K9sb57HZnr7YSChw
 9zPMUvjKY7e9S6WkO7/zsd81loxoH/geP0htrUmeCmFc1kSLc9+btqtvf
 rsKnDc93pZ6ayDXrH0JrObtW4UMpnGxha04F9RC2VmUkc987jrSk47QMu
 qPJFwESHyD91CUqB4bT85f/XTbl+W6AaZQZ+OV+gHNFG63/QbJIhh7Zl3
 2XXO/7xkomIxoA2CO4aWqd3ku8SIa4akM0jIc0jPTHj0R8+RluNevPSSZ Q==;
X-IronPort-AV: E=Sophos;i="5.97,238,1669046400"; d="scan'208";a="221590459"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2023 11:57:59 +0800
IronPort-SDR: QAQ0t6PtdTWSGsbsfK84IwPjLnhTKzrOChPpaKIpQLZuuvKEDwGamEP9VAtXgrQYHrobV8NjKf
 yRFZPh9EQVGPQao7ZzQt6Vx2ffttbfJegjW51ra3qkMSlId/dzHlR4NRrngKCimfCevW70EVoE
 V7IItmXDNS4boZpg5msfZ2HgtN8K3W2SuXV/e7MbnWQlOBQ+WfcKSgftz/KRdF1RmKfamqsD/N
 eZj1+1b6y366w40RK3IFmhPwfNJwmkSSOKkobdb4eHyXCbP/S5POEWCCBdo1xLxuimATxjc0eG
 A7c=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 19:15:34 -0800
IronPort-SDR: 1X5iyY6H0xuB+0vtjfJu/FHVl5jCNBJolVQbY458apmHMPZUeNp6cxGMRnrDjGY52alaVb6mrd
 ukwPxoqUO8gCTFeDOsMgqjx9OqewZKY6DLLU+Mf5g3hATO5Hgt3aYFCVu2ZM+e6yundFB102ug
 osBe+z+M5nX1YglP5gIb84V+BmrBpALPXr4ebrttfsklPtijllkOe1KXSXsok7HCDnBoqyvoVi
 ONj6lSGWdvyyZ1dvFVbqKIodbho4/9t/7rhH0vviosDSZch5qxAc0NtGgXb7SDxR18IcLArLkY
 ma0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 19:58:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P0bsz4qgXz1Rwrq
 for <qemu-riscv@nongnu.org>; Sun, 22 Jan 2023 19:57:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1674446279;
 x=1677038280; bh=FxoK4IQ1hDzxmuW2EbFKJk8WcNRVQ67PURdzoxUFdNg=; b=
 O8ZBnFfizlsLksWmzz47DQp8qVOQm6KqCCMZpR9VjTGDSQnjfJQiDRZ5q9zTifKe
 RHsTHcAzudE45YCuTHbfWQTGLz1OI2bTT3jdeIbQsIbCGs1RquLJUmoYluIh4n3J
 su0huP612kZC3rQvpqmW+0h56gVlTUS5qR4MCgl+nekBeGZpXDPMmFRBT1exPK20
 aG4DB5b2ZbBGZpvGQRKtdTumi8eca78SQAWLZlFdd8SxtHY5rRlYybcU8EobvAqp
 /0B6mHqr3A23S+7KvYh9esofS1EcHLsXME+W3dJkV5WlSy6X15qSO6BEUAZDc6jS
 KGmKqSAF+fvtHdQRfea/wQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HYAQ1Jd_ys_0 for <qemu-riscv@nongnu.org>;
 Sun, 22 Jan 2023 19:57:59 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P0bsx0BLQz1RvLy;
 Sun, 22 Jan 2023 19:57:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com, bmeng.cn@gmail.com
Subject: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
Date: Mon, 23 Jan 2023 13:57:54 +1000
Message-Id: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=380dee0ef=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 23 Jan 2023 03:58:12 -0000

From: Alistair Francis <alistair.francis@wdc.com>

If the CSRs and CSR instructions are disabled because the Zicsr
extension isn't enabled then we want to make sure we don't run any CSR
instructions in the boot ROM.

This patches removes the CSR instructions from the reset-vec if the
extension isn't enabled. We replace the instruction with a NOP instead.

Note that we don't do this for the SiFive U machine, as we are modelling
the hardware in that case.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2594276223..cb27798a25 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine=
, RISCVHartArrayState *harts
         reset_vec[4] =3D 0x0182b283;   /*     ld     t0, 24(t0) */
     }
=20
+    if (!harts->harts[0].cfg.ext_icsr) {
+        /*
+         * The Zicsr extension has been disabled, so let's ensure we don=
't
+         * run the CSR instruction. Let's fill the address with a non
+         * compressed nop.
+         */
+        reset_vec[2] =3D 0x00000013;   /*     addi   x0, x0, 0 */
+    }
+
     /* copy in the reset vector in little_endian byte order */
     for (i =3D 0; i < ARRAY_SIZE(reset_vec); i++) {
         reset_vec[i] =3D cpu_to_le32(reset_vec[i]);
--=20
2.39.0


