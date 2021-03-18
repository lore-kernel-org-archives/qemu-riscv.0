Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lN1zy-0003HI-Fl
	for mharc-qemu-riscv@gnu.org; Thu, 18 Mar 2021 19:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lN1zv-0003GW-Sj; Thu, 18 Mar 2021 19:24:12 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:60591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lN1zu-0006JV-58; Thu, 18 Mar 2021 19:24:11 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8133A5C009B;
 Thu, 18 Mar 2021 19:24:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 18 Mar 2021 19:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=aEspSainJZNlTv4pelDLcLl9UiN
 NfO3DI8lSDd+TPiI=; b=lNXBN2xvFrYb28/SdEliKE+hg0ZDZVjYmkNtkGcbWOd
 nS+wcjDizHvNeUiyIZQUzLQOdPRNsmRx27SsjgGGEz3K2fuPE1H+grVLk6YPgt7f
 /ZdAZp5h+lQnpofVrJI0rcnVNYuJtAlKHLbw1S57EfFGzQM1p+3odgeDnb7DUYUv
 MxlTNYBf8MFgshyIScU+4CtB31WsafmLhNQSGWiEXFNfI/QMueHcrQ6axqz3RKnG
 HYoSg9UVch3XZyw8GIrBaPImkjIqb6mIBIkMUHRacWTQQN4+XYuvBWQn9PPEWwxD
 xxhaGx/W1SPK6MlhuaAOMZ5s8mCJTUNmjkzpde4z1sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aEspSa
 inJZNlTv4pelDLcLl9UiNNfO3DI8lSDd+TPiI=; b=r11lrIxDyHo7KvWETbmIGG
 COJT3BRd3Absb7hRsdE5JMHiVe/Q9Hqk5oxySefFgv9SXAU5jYGdlVio5mlkgwei
 4D0P/DWpAeWWkXA48ZDoOH3TLujTskBC6+ZPXdi1NB9CjbeGMPaOawE+9ke/wPYH
 X0nXoWFYKEKT/N52r8OwSK3WWTEEA57MPkAsTWrmh1cudlSuU49dlarg6IEtLAE2
 SPbY0CPALQKds1f9xWLluf04GGat2bqNGuaMzAU6hbqY02OdDckHTfFboXUAlHcf
 01Qr8BwtMmt8ky+A7mykrsQ45QfAeVe/OF54TvDBY7Zv4QDie0JMIB7RJsWcpEcw
 ==
X-ME-Sender: <xms:FuFTYAnrWEP9-ei88eMJDgNCcNp9lA_k3UM_PAUGlUL4rGRuC4T7_Q>
 <xme:FuFTYP1ESFJ3aibyVD2NJVOpRtJSp3QRz_Scnu3eYAdc59OWQVevdTfMBhbpxpLsh
 CD4jMRAfEBHBOQicQs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetshhhvghr
 rghhucevohhnnhhorhcuoegrshhhvgeskhhivhhikhgrkhhkrdgvvgeqnecuggftrfgrth
 htvghrnhepleegteefleekteefffejffduieevjeetieeivdejgefgieejteefkeevleev
 hfejnecukfhppedufedrjeefrddvtdeirdeiudenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrshhhvgeskhhivhhikhgrkhhkrdgvvg
X-ME-Proxy: <xmx:FuFTYOoFXe2QyYNnrjf6B0qjjNeQZJAl-ePEpspAXtAMIENRRPtqug>
 <xmx:FuFTYMksh0jGNNxORXRgPFJLzJXn6X7J8GWLapT6g5x1Tfk89fj74w>
 <xmx:FuFTYO1rWid8BeLwC2sJjOD3R-tfUDtZlHKxiMZgvx1voFBDVSG15g>
 <xmx:F-FTYK9T0nPFk6Y3NvWothLXA0fzufKUR4kNCYoasIsmjKSSMJS1hg>
Received: from talia.n4wrvuuuhszuhem3na2pm5saea.px.internal.cloudapp.net
 (talia.hrzn.ee [13.73.206.61])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2D53108005F;
 Thu, 18 Mar 2021 19:24:03 -0400 (EDT)
Date: Thu, 18 Mar 2021 23:24:01 +0000
From: Asherah Connor <ashe@kivikakk.ee>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/2] hw/riscv: Add fw_cfg support to virt
Message-ID: <20210318232401.ptnbgswl5amagatw@talia.n4wrvuuuhszuhem3na2pm5saea.px.internal.cloudapp.net>
References: <20210228111657.23240-1-ashe@kivikakk.ee>
 <20210228111657.23240-2-ashe@kivikakk.ee>
 <CAKmqyKNh32DwhD6-2-+8YeHMMqTs9bjU7EMubPh=UM3PsYZ8Cg@mail.gmail.com>
 <CAKmqyKNUQaqQypxapfaV=8+NLf9pn76ZBwxTTExQA5VTY_ZSJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKNUQaqQypxapfaV=8+NLf9pn76ZBwxTTExQA5VTY_ZSJw@mail.gmail.com>
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
X-List-Received-Date: Thu, 18 Mar 2021 23:24:12 -0000

Hi Alistair,

On 21/03/18 05:03:p, Alistair Francis wrote:
> I'm guessing the failure is because of "hw/riscv: migrate fdt field to
> generic MachineState" which moved the fdt element to the MachineState.
> 
> The fix should just be to change s->fdt to mc->fdt.

Yes, looks like it.  I'll fix it up and retest locally before sending
out the new version.

> Sorry that the patch stopped compiling while in the RISC-V tree.

On the contrary, thanks for bringing it to my attention.

Best,

Asherah

