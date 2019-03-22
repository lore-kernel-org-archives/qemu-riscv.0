Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h7Qwu-0007Q4-KA
	for mharc-qemu-riscv@gnu.org; Fri, 22 Mar 2019 16:39:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1h7QnV-0001Rm-St
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 16:29:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1h7QmP-0000kZ-1g
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 16:28:42 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:35549)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1h7QmB-00006b-9b; Fri, 22 Mar 2019 16:28:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3F97B21F0A;
	Fri, 22 Mar 2019 16:28:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Fri, 22 Mar 2019 16:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=Johshd3s8zyRHwaSQdEhy12b
	qDuRELwz9asTCJUN1wo=; b=HiyZa6UgoHlnlf+cKbyXozSM5U51yHUWcJLIkBeA
	Be8v376bdG5nO5k5VzT7I/uRWo3JiqyllhpQC4kWKdIAdKN4Ih/yFt1Lqsgx6pVV
	NWXpZys/inIbNbF0GnwuvDbD1XLb8ICT52iF5hc1DA/6Mth0GL5u8jDh8BY3EW4c
	oTI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Johshd
	3s8zyRHwaSQdEhy12bqDuRELwz9asTCJUN1wo=; b=6qRLwMp4Adq/HEY+LwfUFT
	UNjwrKW8s9WLotiwd8uDGSICKNY3lMYterW7Cbvur3uktcbyXGR1V6yT1yUY1G2U
	IIkdHjt18H345Sb6hfmypVT4ZWTILzhfnpP15pivOXabg2NYqHh6gCdOc8y2LTTC
	jezgm+zMgIIVjAIgIcnswUGGTFBMXJEZiBk1PxQ6zvOSB62DKLekWuzd+wPkGSId
	kuCu9DjqKjq+INotQmPYMnGuA6r68bFjcTFx8CvuVM6g+Q5lR1X9awNFhs/CGdsa
	rKrpqJFMAAO1F2a6fPr7y4OF0r+K0Oo8/buHLoj2R+2kJnTEI/YMz5J2A9aOX21g
	==
X-ME-Sender: <xms:aEWVXPcFjL4114BJcy98vT1du8PUaw3vkV22EXUkMdOsZmadb8MGAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrjedugddugedtucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepfdfgmhhi
	lhhiohcuifdrucevohhtrgdfuceotghothgrsegsrhgrrghprdhorhhgqeenucfkphepud
	dvkedrheelrddvtddrvdduieenucfrrghrrghmpehmrghilhhfrhhomheptghothgrsegs
	rhgrrghprdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:aEWVXMrBhN3iyRmDUuCVzQOCJLFnY-3OZX53ZfDq_cdL20jzAPulww>
	<xmx:aEWVXGBT3faQGSc7u85av-7qPIViS-AWHpuzsZHyAq8Yke8sJ-oJDg>
	<xmx:aEWVXMfSq0JRl2buOLtgjUr18uknKZjdq3J2Rk-s6KlZ132k58_aCw>
	<xmx:aUWVXLPMhpRsPEkupLi9TNYoVlNn2Hgy4T-J3MgX0X0HpKSkldwUMA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7174810315;
	Fri, 22 Mar 2019 16:28:24 -0400 (EDT)
Date: Fri, 22 Mar 2019 16:28:24 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Kito Cheng <kito.cheng@gmail.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-riscv@nongnu.org
Message-ID: <20190322202824.GA6740@flamenco>
References: <CA+yXCZBs2KDYzJz=--5SjyEJz8s8sn_jtvjDyrU0dJL+L+=MzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+yXCZBs2KDYzJz=--5SjyEJz8s8sn_jtvjDyrU0dJL+L+=MzA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.27
X-Mailman-Approved-At: Fri, 22 Mar 2019 16:39:31 -0400
Subject: Re: [Qemu-riscv] [PATCH] hardfloat: fix float32/64 fused
 multiply-add
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2019 20:29:52 -0000

On Sat, Mar 23, 2019 at 01:39:26 +0800, Kito Cheng wrote:
> hardfloat fused multiply-add might fallback to softfloat mode in some
> situation, but it might already changed the value of input operands,
> so we must restore those value before fallback.
> 
> This bug is catched by running gcc testsuite on RISC-V qemu.
> 
> Signed-off-by: Kito Cheng <kito.cheng@gmail.com>

Good catch!

I'll send a v2 shortly with some small changes.

Thanks,

		Emilio

