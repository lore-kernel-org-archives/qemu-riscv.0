Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGK5a-0004UV-Mc
	for mharc-qemu-riscv@gnu.org; Sun, 28 Feb 2021 06:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lGK5Y-0004S9-Q1; Sun, 28 Feb 2021 06:18:16 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lGK5U-0000wA-UM; Sun, 28 Feb 2021 06:18:16 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 712FB5C00A6;
 Sun, 28 Feb 2021 06:18:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 28 Feb 2021 06:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=2LAfAFEnShA9COqwpQVLGNoxMdB
 DjcGMIC6YMibWXyI=; b=K4mfPaSFyO0fQVFMQh0bWGaaT/voiJ68ofi+Td6BVk+
 3go6yF0ulbNOuAMY+UvkM2kmntBjvSr88+BdgEI8eNzdpa1fEfZXLVRDLR86PgSo
 hMj7WH+mLq1IJyxuiWVBoCFsf+HHyLtqyhRRQ6cOUWz6UuumfsOMSfx5/hJBwaJz
 qBEmA28Ir4dsZarAe5leTzVDAYwVGMzp6M3qQoaxh9SX0BMKZh0grRCvBe+3eqq0
 g+SsJwehW9BVzPLfWw/gPw/QjiYLdRPWwdqCUpmaaioORtTNCTcL3v1zQveau+DX
 w90iOT7IygUHePLwRI1cp+C9SHtRqv3hz1Eq/Wg59cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2LAfAF
 EnShA9COqwpQVLGNoxMdBDjcGMIC6YMibWXyI=; b=CB7OzrgjUOCA+6tXlujXiq
 h4UVTBsZxFM7Gs+aUZksyzPRF+u2hTBfp86lWsC3XokngOzneQcBR+4y00r7OQ98
 L7nRgI7YsvEIsMlo1j1DvBzIKZe2UD3M30HFopB46LR8rIY5oBzMzhQKbUo5IebU
 J4MOUwJimuhrcwMcTuHRe0R86ZqN6ZYY6c9TLODEuj9zxRTpZBVy3oeQOZqglSbV
 +SCwzafCeUi4lmHfJNUu5NMI2Qhsx6sjT4SGhHdB2bZ1pmwt64q7dwUTyn2cBNXA
 MFYKU0D7ReVjxF0L++MgDMGxU6CeK8FYLXyNwQznef13lZpZT6Rg2Ub563o0bAqw
 ==
X-ME-Sender: <xms:83s7YFn6clVUlXa5WhLCwYJ1kOgWm63_gW_WsgVaMkI9sqbxAGcuWw>
 <xme:83s7YA2q4u6xJwbgMFD2ozm8H3RwLXHiWjtVaTW47ZmVUNyAqPC1dqfTaHTPsAg1s
 qgrvqdU1EKxMGzvH68>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleeigddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehshhgvrhgr
 hhcuvehonhhnohhruceorghshhgvsehkihhvihhkrghkkhdrvggvqeenucggtffrrghtth
 gvrhhnpeelgeetfeelkeetfeffjeffudeiveejteeiiedvjeeggfeijeetfeekveelvefh
 jeenucfkphepudefrdejfedrvddtiedriedunecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheprghshhgvsehkihhvihhkrghkkhdrvggv
X-ME-Proxy: <xmx:83s7YLptplyK7lBRG1AzZXQ4P78z12vy3oRlbKT5Q446p5fwLJii-Q>
 <xmx:83s7YFlAzbFogwp_yZl0dNlWYAZ_bYWlhaUXTKhli7si3echndxXXA>
 <xmx:83s7YD0ghNh8XlnBVaLw2AMMffFFeIqHcbmHIVqG1FcputDCzV_3lg>
 <xmx:83s7YOSPtH24i5E4MOsUQ97uxJOnRoprhfSRwTWrcixlUPMZcmqTEQ>
Received: from talia.n4wrvuuuhszuhem3na2pm5saea.px.internal.cloudapp.net
 (talia.hrzn.ee [13.73.206.61])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E4F21080054;
 Sun, 28 Feb 2021 06:18:08 -0500 (EST)
Date: Sun, 28 Feb 2021 11:18:06 +0000
From: Asherah Connor <ashe@kivikakk.ee>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 1/2] hw/riscv: Add fw_cfg support to virt
Message-ID: <20210228111806.s6pyxk3iyhvfatzh@talia.n4wrvuuuhszuhem3na2pm5saea.px.internal.cloudapp.net>
References: <20210226035447.1252-1-ashe@kivikakk.ee>
 <20210226035447.1252-2-ashe@kivikakk.ee>
 <CAEUhbmWBPGNQ0J9P3OzV60BW23YCatbU9PZ0whs2ut4bXLPU4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmWBPGNQ0J9P3OzV60BW23YCatbU9PZ0whs2ut4bXLPU4A@mail.gmail.com>
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
X-List-Received-Date: Sun, 28 Feb 2021 11:18:17 -0000

Hi Bin,

Thanks very much for your review.

On 21/02/28 02:02:p, Bin Meng wrote:
> I guess this is put here because riscv_load_fdt() is trying to touch
> the device tree, and creating fw_cfg has to be done before that?
> Maybe a comment is needed to prevent whoever later wanted to move the
> codes around?

Done!

> > -    VIRT_PCIE_ECAM
> > +    VIRT_PCIE_ECAM,
> > +    VIRT_FW_CFG
> 
> nits: insert this before VIRT_FLASH

Done.  I've included your Reviewed-by: on the unmodified commit in the
series; I hope this is the correct thing to do.

Best,

Asherah

