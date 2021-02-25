Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFI8U-0007vo-E6
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 10:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lFFDx-0002zC-GP; Thu, 25 Feb 2021 06:54:29 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:42755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lFFDv-0007iq-H3; Thu, 25 Feb 2021 06:54:29 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D8270ED3;
 Thu, 25 Feb 2021 06:54:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 25 Feb 2021 06:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=y
 5MuuTzbBgkSDwOu+7glCkHuMq4hO2Zb9cND/yQiPcs=; b=V82IYMMAW5zFidZpG
 lJVDE4b2zggp7d5hS/nBARYajARWT5KLyoNWss57Ro9VjHGMoTcC9Ov839jj3eR4
 5ffk44QyiP9KtIRuk7uLhVEuxRf6LtnAxHNM13SivH7a1iYFmgWeQnkGN+LdcWe5
 DaUICDQJBger7Kc+vJ/kZgqOWrE2yG+Ts04gHqRY7NRVX5/JrGZtNPmOiDNUNu69
 eFiLqpsxWxm+jS7sfpOAJ+p9FI1jb89oUyLpJXG7LXkse9YqheK51FtnuCMeh1VG
 9b0G2iDEN6+V8ND3LGohzPm1El6LjtEBVrINLau4W2tsmXLgS+g9IMoM0uWtiq9j
 Vmjlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=y5MuuTzbBgkSDwOu+7glCkHuMq4hO2Zb9cND/yQiP
 cs=; b=Kh4TTtuc3cAtPPT6M72/k43Vwle3cFA0tMpGwsM/ZiT4yL/f20EXvHsSZ
 SmK8AeefMhUkITzak1Ge1G3JZTWq47436C9vBFz2EPjkXv2zGpaug4YCIiwJFsqt
 kdz9e90u4feHCnDmGrQAmbH4H08dM0+ev68x+CuJa+yo8UhbWsM5/F0p3cGd1hAf
 tJSMlzRvHrlGf2EW8+48ylhOKdBYBJWxRa+rwtMtOF8dKNObhSp8gPDxWxNTY2cQ
 szGDisa2frc5LiD4DUjsiRYfGLSEScKpYuAZhYdbIBdgoyzvbr9OLvxgERYztfWo
 yR8moVFggwtg7sASRkae16i1LvUKQ==
X-ME-Sender: <xms:7483YPNjtwXPwKqlZlhT2gFKJuRyVSIa9WFg8IZXiSdt-JQEqFpnxw>
 <xme:7483YJ_821h_C4HKhSvQBgEJzIMHKpHGt3HowO8bhpu10zSBsP9dE3ozPMvs1u2Jm
 Z3Pael1rGzPm0P8Lno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetshhhvghr
 rghhucevohhnnhhorhcuoegrshhhvgeskhhivhhikhgrkhhkrdgvvgeqnecuggftrfgrth
 htvghrnhepvdejffehtdetvdduvddvheeivdekveduvddvfeeiuedthfejteehveegieef
 leeknecukfhppedufedrjeefrddvtdeirdeiudenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrshhhvgeskhhivhhikhgrkhhkrdgvvg
X-ME-Proxy: <xmx:7483YOTBlTZBU1vKsEVLWKuJjU1-d5cSLB_HKdzRCGFFLrmFGrGbQA>
 <xmx:7483YDvSCYUuChPbei7b0W95zOEz21e1HTh8rVYaMPA-ZswBz-1VmQ>
 <xmx:7483YHdJt6zlF8XASacz50Abal5iTPlAtPAI4MJ1t5Om3nvEms-4oA>
 <xmx:8I83YO7LFUJTrXlmZ1RA7gw0l_fElfcGXC5T7SCyVMhFDB0EUQdUiQ>
Received: from talia.n4wrvuuuhszuhem3na2pm5saea.px.internal.cloudapp.net
 (talia.hrzn.ee [13.73.206.61])
 by mail.messagingengine.com (Postfix) with ESMTPA id 45A661080054;
 Thu, 25 Feb 2021 06:54:21 -0500 (EST)
Date: Thu, 25 Feb 2021 11:54:18 +0000
From: Asherah Connor <ashe@kivikakk.ee>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH] hw/riscv: Add basic fw_cfg support to virt
Message-ID: <20210225115418.6hnxmbjxfly5okmp@talia.n4wrvuuuhszuhem3na2pm5saea.px.internal.cloudapp.net>
References: <20210225101343.40301-1-ashe@kivikakk.ee>
 <a09c550e-2172-adfe-140d-45936b7edacd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a09c550e-2172-adfe-140d-45936b7edacd@redhat.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=ashe@kivikakk.ee;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 25 Feb 2021 10:00:52 -0500
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
X-List-Received-Date: Thu, 25 Feb 2021 11:54:29 -0000

Hi Philippe,

On 21/02/25 12:02:p, Philippe Mathieu-Daudé wrote:
> Hi Asherah,
> 
> You forgot to Cc the maintainers (doing it now):

Ah, my bad.  Thank you!

> What is missing here is why do you need this, what problem
> does this patch solve.

I would eventually like to use qemu ramfb on RISC-V (through UEFI) --
this is the first step in that direction.

I have continued on my side to add the ramfb device to the machine, and
it's another +7 -2 diff to a working ramfb on riscv :)  There may be
more after cleaning up, but all in all it seems a fairly low-impact
change with useful result for developers.

Best,

Asherah

