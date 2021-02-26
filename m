Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFUDo-0005sK-Vy
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:55:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lFUDm-0005nd-Re; Thu, 25 Feb 2021 22:55:18 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lFUDl-0001GR-13; Thu, 25 Feb 2021 22:55:18 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B725E5C00B4;
 Thu, 25 Feb 2021 22:55:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 25 Feb 2021 22:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=BDcvrC+yXQQQgWbS7S0zznNhfF
 peAjVX+wpeCV+dUTE=; b=A5kqGrjY0KRmTAc3m3Rbqe4Rcnjz10vPrlIgyTw1MQ
 OO7afCqJcEcl6ZYISCNJ/q1t9cjmRrsCdCrTHd3RXUpDFyHfGcr/IvcHzIqOSqsk
 G+pJRYlYfZkEloipOr3jtRHqEvuW2+y6eofjvaZxjLKMlyRKLbZS7GE8lcXh1RAW
 rE4APViEX4zSdKxMXzOYFc2Ix7PdU1GfhfXsiYUMaNYlmAb5nd3cmpSiwn3U6T5M
 uiX10F1UjE5k4eL+sobkg+FxOWNr0nc1c0wKVVyFmxi+wacsRZc7dL399LpbnCjg
 /PBR6N7ZSaad8/0agGZIfeojteLxwIAQhLom4wQRTc1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BDcvrC+yXQQQgWbS7
 S0zznNhfFpeAjVX+wpeCV+dUTE=; b=tGzLwBxJNl3XUksKsCekp23V5peZ08Vki
 r0sSwnMPS2gPBwSgS/QG+WoZ9TGYWA8xM2TTM0HM9011s0Fujg+rIiYWgbTWZS/+
 YLo0mugohAdo+kBOmljr1JpZOzSO+h4J3yeufRy6obTMkxOuKLC1EkMcDDj/LhBq
 +aIQQmJ4rn9YZXmCtMYvcComdoli6k2vHdAHeOtflpjErF9NAUd/DS8JroAOiq40
 v1LpRrQN/UOXq9AWomuYbuDDyj9dGEeVmIDcMyZpEd5RwQrzkszH1lMfFbO3mPWw
 6uH7foPJLKZGav9vrLAxnlFlJtI3xiGAf2fEq+59wXMSdPxV37V/g==
X-ME-Sender: <xms:InE4YMMPwvYFvVZSRvduJ98DOJD1aQglR1M_HdJmK7i_V9UN1fXYEw>
 <xme:InE4YC8EhFRgFvWNc-GQqsBlFMn05O0ZnJNu6dyuBnC0qh1rX22piuJL34NU3SuRz
 lygOn2C8jtzdoj4SeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehshhgvrhgrhhcu
 vehonhhnohhruceorghshhgvsehkihhvihhkrghkkhdrvggvqeenucggtffrrghtthgvrh
 hnpeejjeejleehvdeutdegueeikeffvdetvdefjeeuffeutedtiedthffgkeeifeeifeen
 ucfkphepudduledrudekrdefuddrudefheenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrshhhvgeskhhivhhikhgrkhhkrdgvvg
X-ME-Proxy: <xmx:InE4YDRarCwjUmgFIH72ZCb9QVz9ioaoxTt7TSswErafFDqzZufocA>
 <xmx:InE4YEuMQGPiKggZRQEyrWXezcwOtZKSSi4P2HAP3p1bU7elGROMSw>
 <xmx:InE4YEfi7tvoZIw6tFGZZfMlBvpRvXxGKkzuoVxcpmJOFgMb4JRhbQ>
 <xmx:I3E4YD7zqYlgrJGl7dcvR9ACkZIOJ42Ziq3M3IxRYHX7noebMCEi-A>
Received: from localhost.localdomain
 (119-18-31-135.77121f.mel.static.aussiebb.net [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id 03A36108005F;
 Thu, 25 Feb 2021 22:55:11 -0500 (EST)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Cc: Asherah Connor <ashe@kivikakk.ee>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
Subject: [PATCH v2 0/2] hw/riscv: Add fw_cfg support, allow ramfb
Date: Fri, 26 Feb 2021 14:54:45 +1100
Message-Id: <20210226035447.1252-1-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=ashe@kivikakk.ee;
 helo=out5-smtp.messagingengine.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:55:19 -0000

Here's version two of the series to bring fw_cfg support to riscv's virt
machine.  We add support for the DMA interface, as this is needed for
writes.

The ultimate goal is to add ramfb support, in the second patch.  It
works well!

Changes in v2:
* Add DMA interface support.
* Add ramfb as allowed on riscv virt machine class.

Asherah Connor (2):
  hw/riscv: Add fw_cfg support to virt
  hw/riscv: allow ramfb on virt

 hw/riscv/Kconfig        |  1 +
 hw/riscv/virt.c         | 30 ++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  4 +++-
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.24.3 (Apple Git-128)


