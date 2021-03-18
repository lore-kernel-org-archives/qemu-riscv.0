Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lN2Pq-0007yO-Sb
	for mharc-qemu-riscv@gnu.org; Thu, 18 Mar 2021 19:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lN2Po-0007xp-Tv; Thu, 18 Mar 2021 19:50:56 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lN2Pn-00028b-48; Thu, 18 Mar 2021 19:50:56 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id F1F725C01BD;
 Thu, 18 Mar 2021 19:50:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 18 Mar 2021 19:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=ijy07SyVrS3d5iGhjM9ihIJBFn
 pZdzVF92m89uqHOJI=; b=DmG0QFqB01/wFZa03cI3XspBLFFYnMn+x5reLHImBW
 4azQ8fV5A01+EGNTyfh7XYbjyypSpoV4LWilrC5b/898cmdBRfAaJ67kUosdV8rc
 WIL65xt3vOC+7ph7aU8rMw0xOtX4RK4DqW+8Em94OyiTQuvvn9MxoU6mzEgmryu7
 I0cd6mCXTZxPVcbu9xxPEFufbqOACnhRDkme4jl4id4ICvaRR/Q3EUs6syBoRye0
 fB3/yjlg4D0CytpTzYF64OsrtCHcCdosXPB73LTGrUXeAJ4Ca68it/Z9q1eDvuq7
 +QuvmdKSt4k8qLIoMVTrznwdgpd4DTdcpw8qdDuGIidw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ijy07SyVrS3d5iGhj
 M9ihIJBFnpZdzVF92m89uqHOJI=; b=b1G3Bica5uCucNZvBqtr4DtTKsmr7M3p5
 LMvFFNQhs38QQN2N5oo9x84P8GwjPfoAQMuKP7GP1B6z0kXxqnW44T6erKrh4ysy
 EeLBZagd4uNLXA0KSYm3Zix23ERg26MUxSE/H2TFtqUFup/AYctLOVKVP8X5aC1c
 c6hlDtmAmcpPkUz3HG0aT1VYqtoT+ACwH+1pq4dKARRN7yZFUk7ThTZ1okzrFsfS
 vKPkBj9vfClgWie489LK6MQYTumgCagcAAlx/J9qw0g/zj2vmCo3xsw18beujQAv
 CoyCa3DQTvpnEJSE/hIT9Hx+EH7S4rNhnGtuPAB52RJu2bJ89/+Lg==
X-ME-Sender: <xms:XOdTYDD-xlKq4Wvq07TYUM7UGcIxw-Y54iqHQb6rVBSlDcJuTLxaDg>
 <xme:XOdTYJh2T0Ol_rUyG6nJdBPoekD3ryWGf9rLJ72_3ahUEFeISZWlo8JQJIKXp7i0b
 fNaJtehuQqWx_aIe5c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetshhhvghrrghh
 ucevohhnnhhorhcuoegrshhhvgeskhhivhhikhgrkhhkrdgvvgeqnecuggftrfgrthhtvg
 hrnhepjeejjeelhedvuedtgeeuieekffdvtedvfeejueffueettdeitdfhgfekieefieef
 necukfhppeduudelrddukedrfedurddufeehnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheprghshhgvsehkihhvihhkrghkkhdrvggv
X-ME-Proxy: <xmx:XOdTYOlm4igbQKt3eFXwYiNMNMBzR5kBjhFvNcGmLodZDiTWX6Aalw>
 <xmx:XOdTYFyTigIqymUgw_yfILaA78v_l6q2VxuvwScWfpCptlGSLmqf_g>
 <xmx:XOdTYIQqeXJdURx8vCEB804uZUIiVNmacMFtzRxwpPa6M0LOuAaHvQ>
 <xmx:XedTYNJl-GlYZRiFfpIFCNxSVaaQvcd3h_xwfVYJwWKhYvAYifmRbw>
Received: from ravenlin.tomodachi
 (119-18-31-135.77121f.mel.static.aussiebb.net [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE0FA108005F;
 Thu, 18 Mar 2021 19:50:49 -0400 (EDT)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Asherah Connor <ashe@kivikakk.ee>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
Subject: [PATCH v4 0/2] hw/riscv: Add fw_cfg support, allow ramfb
Date: Fri, 19 Mar 2021 10:50:39 +1100
Message-Id: <20210318235041.17175-1-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=ashe@kivikakk.ee;
 helo=out1-smtp.messagingengine.com
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
X-List-Received-Date: Thu, 18 Mar 2021 23:50:57 -0000

This is version 4 of the series to bring fw_cfg and ramfb support to
riscv's virt machine, adapted for the latest master.  It is still tested
as working against a modified U-Boot with ramfb support.


Changes in v4:
* Adapt for changes made in c65d7080d8 "hw/riscv: migrate fdt field to
  generic MachineState".

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


