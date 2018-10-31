Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHu5m-00020p-MV
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 13:15:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHu5i-0001xl-IW
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHu5g-0006rn-2d
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:15:38 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35917)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHu5e-0006ei-Ra
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:15:35 -0400
Received: by mail-wm1-x341.google.com with SMTP id a8-v6so15209286wmf.1
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 10:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=43pHISfOzFEa9vjE+GNq/PCZsg69BIO7vx5KMAgAyI4=;
	b=HPVQx4IaPCW3GbuBrGj7Aa4A09OTcPEGeishjpLHRVbdNKzac+vyf32SY7jo1jGG7D
	Z2UnZR16zMsCyKyvT6EcBunVfJSl8jXGMvgQNAK1dlblTJCS10PczGqBa0bSJJf08fW9
	r10qaT7mpP4erYQguLZ7mXW3m0zNqAm6/fXCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=43pHISfOzFEa9vjE+GNq/PCZsg69BIO7vx5KMAgAyI4=;
	b=QXfuFwm2dy0DGODLiq6ICypAoTwtHUGCc08PMqYMrS4smK4TQMOn4ELH33NKT1ZC6T
	rvwHsfVI0m22pu0pTgaz2M+KwwEWsa4feDW9bdz0U/CfZmmKRMLo7cdY0pjqY/xyFQHD
	OVD77UVkV5eyzf115ldvX12WazX0/3dwIuMvCbbnAJzQ5k6RSua2Ykg1xXa84amCmIhs
	oIMM8O7sHiHUax6TvBbQTL0n8Y3p9oCzV0IXfCf64z9ySgbBHfT1SBdSmF1Rg4ff1bvM
	upEdUfGeCn1v8T6GRRHtujNtOJxm8i40joHciVZ0SW4VpLjIbkUQQwc71jbO/PC3/T6y
	A62g==
X-Gm-Message-State: AGRZ1gJViBQay1622+MRxn721vTF+uM53/ydW0UUqIlfRrshvaoDmnli
	SzJeB5Aiq1+zL+rPhtc2DIty+gxqQn8=
X-Google-Smtp-Source: AJdET5cD8K9jgoYkBm0P8eBtRZbn+qs1qX8t4KUVT224BuhUZEpupAaq7A40ov5B2oLGzwRqgInGEg==
X-Received: by 2002:a1c:838a:: with SMTP id
	f132-v6mr3225328wmd.51.1541006116937; 
	Wed, 31 Oct 2018 10:15:16 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	m2-v6sm23458746wrj.80.2018.10.31.10.15.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 10:15:16 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-7-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fcac4eb9-8389-9c11-b935-d2642e59e207@linaro.org>
Date: Wed, 31 Oct 2018 17:15:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-7-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-riscv] [PATCH v3 06/35] target/riscv: Convert RVXI
 arithmetic insns to decodetree
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
X-List-Received-Date: Wed, 31 Oct 2018 17:15:41 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> we cannot remove the call to gen_arith() in decode_RV32_64G() since it
> is used to translate multiply instructions.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
> v2 -> v3:
>     - moved 64-bit only insn to insn64.decode
>     - dropped insn argument of trans_foo functions
> 
>  target/riscv/insn32.decode              |  25 ++++
>  target/riscv/insn64.decode              |  13 ++
>  target/riscv/insn_trans/trans_rvi.inc.c | 168 ++++++++++++++++++++++++
>  target/riscv/translate.c                |   9 --
>  4 files changed, 206 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

