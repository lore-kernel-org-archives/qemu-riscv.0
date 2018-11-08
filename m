Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKmWf-0005Zi-Oh
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 10:47:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKmWc-0005YY-JJ
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 10:47:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKmWY-0008S1-IN
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 10:47:18 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKmWY-0008RK-2k
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 10:47:14 -0500
Received: by mail-wr1-x444.google.com with SMTP id j17-v6so16634507wrq.11
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NrV6WMWp0Cu8FHzat6XQif2WSGbOnuTyPaL8TBno5EA=;
	b=KLeLEQ4p1Cv/iB3H3bQYb7/MXKtB+VKg52LdH4sf80oZTDOTQQNAVMvBLCgdJKlPhc
	tY7HwbRasm0djB7iLRKwOIVyxE6+ICSnsj36dI1mk7vHgUnfqGf5FXZ/O5L/vRwyeJwm
	GRok+0OU34ELJl6PUfnuu2SlplNETGvV1p+EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NrV6WMWp0Cu8FHzat6XQif2WSGbOnuTyPaL8TBno5EA=;
	b=cSXp9wT86a8OqErqP69wcTfgd7OfhRQTdWjgafGVndryu9/c02vV3y8r/IezxGeTyX
	3keQE2+wNQsRh1FMkIuyqmOFTwEwBPVgQH3xT08Vax+Y1W/Uk2CJ/Pk3FTamlTEsvN2c
	yfNQRpIZVy9UPZ9jOgZx97nLUDUOckwY4LHdT2o6fgf7PdCKuHze1cRQzI/8Owp+O7J5
	IOQQvCTm7uhUtY6nea9QPhA5w/bxiVsp+9gLAzPD5hKxqSFfEaXkH3zlB71K8piWjI8c
	Vd8t3A0qRhfdnbErtF8BSRA+2KilblAaESVe90te0ktmOsDuJcuBOhS6FlC1zapnD0i8
	m08w==
X-Gm-Message-State: AGRZ1gKhAnMoBhiSCLz8k/LyluF2UwA9abmK/xNld8al0Rovo+plnE+d
	5fR1jopo1v4TQh5hRNSkYusilA==
X-Google-Smtp-Source: AJdET5cX4uFfchFqneusetS+wGCmBe7SyXSUQ2/L9qnCPPdKPUR/lwwwIBAtk73r0WZp5mHgpc/bJQ==
X-Received: by 2002:adf:cd0c:: with SMTP id
	w12-v6mr4795307wrm.67.1541692033046; 
	Thu, 08 Nov 2018 07:47:13 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id k4sm6123535wrx.91.2018.11.08.07.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 07:47:12 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
	<20181108120628.29926-2-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a34ca91e-8e79-21a1-bf11-a55f7836386f@linaro.org>
Date: Thu, 8 Nov 2018 16:47:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108120628.29926-2-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/2] target/riscv: Fix
 FCLASS_D being treated as RV64 only
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
X-List-Received-Date: Thu, 08 Nov 2018 15:47:19 -0000

On 11/8/18 1:06 PM, Bastian Koppelmann wrote:
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/riscv/translate.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


