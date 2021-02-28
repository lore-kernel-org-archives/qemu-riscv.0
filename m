Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGK4Y-0003Qa-61
	for mharc-qemu-riscv@gnu.org; Sun, 28 Feb 2021 06:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lGK4V-0003Pj-WC; Sun, 28 Feb 2021 06:17:12 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lGK4T-0000Vm-Mx; Sun, 28 Feb 2021 06:17:11 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D691B5C00A6;
 Sun, 28 Feb 2021 06:17:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 28 Feb 2021 06:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=nra8hiQIuKZRI2KMnDvTqIy5if
 X4xFGYUgTK33GNiAg=; b=m/zAD2raVTfEldrxQmk4Y+mTP0W7Mt/KAqx5L4Q+IQ
 9HxRPHimx/+CaI0b0wI6xN6TIlr+gdKMrCIXB60ZeOjr2QBBfJIAtOvD2nAWnvij
 SU2jH77jwxRqr/LN8lIANsh4AIsupZuVLF+kQCFPmZcvp5hIxRp/EWrWLgPARQi3
 Js2mSXhbqAItW7jPZYRXSvSD3x7yhTdUUdjiHQhk9Z+MApGppbn9M/glkq6wRUmF
 cTVPHC6l2SFiE+uZXtWAwQ4LI0DuouwHy1wTosFujxUH9LQ858WgDuxBr8zb6GP2
 U/y3g5xiPP1mGfDwnXmxko0xsL0l8RlHEuYjA1qD72CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nra8hiQIuKZRI2KMn
 DvTqIy5ifX4xFGYUgTK33GNiAg=; b=M0wPlsRzkesgHhnXwEHSuoEsyQTNS8XFh
 PHUOeTcd5/hCeUK3b3p64vWSjp5W3xzf2fFbidTwA5+oWSsnrHVSHEEZyVnYa1zB
 IgSuxygBSC+DdCCV3Od3saiUmT20lf98uF3u/X6D8AB+MgDKksgwyv55AT1hQ8GA
 70LrS+rB4++2RqmyqVnZStVHCZjsNHZfiFbR3ZQUXt9wLCWDXnXsvtcBl7IIig/0
 HZhcFWHApLTGEtw437jt1Hsdzq7SeEAsqXPWBoVBMrdwOhhw8PqN/AKmwEKhyMOE
 eV9/WWx2UoBxeGdTHx94fcmNma5+0unAFLHm3NO9FS1r+S2iA/Svw==
X-ME-Sender: <xms:sXs7YK_wRIjB7UHN-rKLKH5UznsAu9eoKKDEPPMrHFK2hFM3z8sY0g>
 <xme:sXs7YKvQ4eBCyn21UsyKoHL_Ztg21cSo_oBpAhblh_ZmOU3nzvsS5uKZPYMKIUKEW
 p8MpEZ0QdF09TW5ZZs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleeigddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehshhgvrhgrhhcu
 vehonhhnohhruceorghshhgvsehkihhvihhkrghkkhdrvggvqeenucggtffrrghtthgvrh
 hnpeejjeejleehvdeutdegueeikeffvdetvdefjeeuffeutedtiedthffgkeeifeeifeen
 ucfkphepudduledrudekrdefuddrudefheenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrshhhvgeskhhivhhikhgrkhhkrdgvvg
X-ME-Proxy: <xmx:sXs7YADTo0DRF-26UlL3LgnzaVgldXHaezBE2QnkiUIOYyY5Vimc2w>
 <xmx:sXs7YCdDNn6jkbff9Mo84bu9wDs1JLtLsAT7EcV7W1diu1frwGJruQ>
 <xmx:sXs7YPNlp3PUYoJJ1oVaSjS0Y5LdgKlABJwEwRTeXeoZ8o4UO1y7WQ>
 <xmx:sns7YK37EXGpCLKIXeY7OitQHcckF_hkDbCKLG-OlSO61t0iYGB3qg>
Received: from ravenlin.tomodachi
 (119-18-31-135.77121f.mel.static.aussiebb.net [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id 207A91080054;
 Sun, 28 Feb 2021 06:17:02 -0500 (EST)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Asherah Connor <ashe@kivikakk.ee>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
Subject: [PATCH v3 0/2] hw/riscv: Add fw_cfg support, allow ramfb
Date: Sun, 28 Feb 2021 22:16:55 +1100
Message-Id: <20210228111657.23240-1-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=ashe@kivikakk.ee;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 28 Feb 2021 11:17:12 -0000

This is version 3 of the series to bring fw_cfg support to riscv's virt
machine, including ramfb support.  It is tested as working against a
modified U-Boot with ramfb support.


Changes in v3:
* Document why fw_cfg is done when it is.
* Move VIRT_FW_CFG before VIRT_FLASH.

Changes in v2:
* Add DMA support (needed for writes).
* Add ramfb as allowed on riscv virt machine class.

Asherah Connor (2):
  hw/riscv: Add fw_cfg support to virt
  hw/riscv: allow ramfb on virt

 hw/riscv/Kconfig        |  1 +
 hw/riscv/virt.c         | 33 +++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  2 ++
 3 files changed, 36 insertions(+)

-- 
2.20.1


