Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNhwb-0007mh-GI
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 12:30:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhwW-0007ew-42
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:30:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhwR-0005SC-Vd
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:30:08 -0500
Received: from mail-it1-x132.google.com ([2607:f8b0:4864:20::132]:37744)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNhwR-0005Rn-PG
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:30:03 -0500
Received: by mail-it1-x132.google.com with SMTP id b5so579847iti.2
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 09:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=z3AHXteJcucRHVWjB6r6yGu2lFrK1kCGGWnHpPT04fg=;
	b=UluJxkS5ejZOmhMTe1RfRcI3hpJ8kx8eMXgAIxBfew1QkJSpFqtkqpNRIhXUFGJXWn
	8lie3oqOvXABOU2iceObsinFLCboJ88pGgKlx+fa+MdkNoFk4cwad35iDLpzPKlni56f
	eqBn85CmPbsRXpDVW1M0yQvYrrGHm/t6e8Jmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z3AHXteJcucRHVWjB6r6yGu2lFrK1kCGGWnHpPT04fg=;
	b=DV1evQ5vustZCusZuwlNvKJhuEv7j2/3KbnUnbdWGbLRCt1QKbV4p8uThqQDN2NNzr
	oYQ5J7UsnJyHd3Yirhu2f9Hm/V6Ir/onpG52pbAw+aNt4cLvukEN4aZ2E4S/mqlZesc3
	8LNLX+8u0jxQxx7rk+U1RgCqSNLFbjqX+18kOHslJNaAbtRbBgLReMeBI6OGMkzV3E8P
	rqK1pfbtgEGo7pweQyb+ZI7PulFDg69rCQP6bBARgV9968z6tHDKGAP/s0RZUIWzhXXK
	jpUtxKpd3sTp6u6nHTVPZR1z16ebe1EioDCsaXJ+YEZpAsRfoYn8CTOSbKkbPquN572R
	TBiA==
X-Gm-Message-State: AA+aEWbwnMP2TFb6QGJmCj6sbeYWAAHUWCCByUD6klwU6tSJPo9KZm2z
	HPU65G2sYHh9MK3cp8fBpkuFxHgIA0SBOA==
X-Google-Smtp-Source: AJdET5c2TN7oY1ciunfk+rXJZlC4Rs75Wjqb9YzNZhc5ph55IKo48pp6NUk7kGxEh4c/AJpuIebMMw==
X-Received: by 2002:a24:bcc1:: with SMTP id
	n184-v6mr10641127ite.174.1542389403110; 
	Fri, 16 Nov 2018 09:30:03 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.13.118])
	by smtp.gmail.com with ESMTPSA id
	r65-v6sm8189201ita.8.2018.11.16.09.30.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 09:30:02 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<84be65cc6caa8421b04ac381f4623e21f80ee39f.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0876b1fe-49bf-a9b2-e531-f7fcc11e162f@linaro.org>
Date: Fri, 16 Nov 2018 18:29:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <84be65cc6caa8421b04ac381f4623e21f80ee39f.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::132
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 22/23] dias: Add RISC-V
 support
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
X-List-Received-Date: Fri, 16 Nov 2018 17:30:12 -0000

On 11/15/18 11:37 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  disas.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

