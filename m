Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZ2k-0008VW-Rz
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 02:59:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZ2i-0008U4-EH
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:59:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZ2h-00023P-Kx
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:59:56 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35626)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZ2h-00022h-F3
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:59:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id 96so6960725wrb.2
	for <qemu-riscv@nongnu.org>; Thu, 15 Nov 2018 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YrSJ+MNG5j9Z+Q6R3oM+rRWPWYA+qPHinzVfyYWqn9E=;
	b=AGvaWhFvWRY5wOS3mBXgUpl0ijWChE/dNpl3F3pF1GrrcdKxNNbyLKo3dpyz9bsk50
	bPnufxQQuA2AHQual9QrDATbN9Tt2MCHFq5l/UBJAKSRT8bBx1a0Y9gVx2PjFLX93YCm
	EyX3HEHsd7qSS7sr2SrOT+20TOHbr9wPVVf58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YrSJ+MNG5j9Z+Q6R3oM+rRWPWYA+qPHinzVfyYWqn9E=;
	b=jFzz8JyR6IapPZk5K0YpBEGmToLQysQtYtrUV5L0ecDu4iskiHM+ME5vZHyd9dUc/5
	37WOWgePAuOO0dVYitq2vllbhLGQUCmuwzmsd6xOjuAHY6m0vBS9QHjf1RYstPaaq3h3
	gUj4N2tw6HPfuVswZfw1VC5ocNwagoqUX5vTJpcv8dLBh6g1Xfnp6Xc7ucvt8E6pFUcc
	f77BW59OpC1d2eT/f4z1fBh6rg9+KHBUSDlPxPxVAarFFsuga2BD9yiPR/0+jw2PNnAh
	J+lzV29nnYB7DS6A7ZxQP/GYjB7TKzZm3n/byKgC3QfWaMpQop9coZXyfRo7BgnL4Ljl
	dSpg==
X-Gm-Message-State: AA+aEWa8jphqdEljbNN9vjK7EMCuZd8SiWoZdxBgyvlrLpE4ZkJAENC/
	LZ/tTRGMWKCu0HayDvm4T9x99g==
X-Google-Smtp-Source: AFSGD/XLQQL8EwFu93BrOwAackJzTDBP6rommqjXTYh+iAzM2QrV7Pysz6RDa1nLk3JdHk0CWUIFMQ==
X-Received: by 2002:adf:f449:: with SMTP id f9mr1359706wrp.40.1542355194433;
	Thu, 15 Nov 2018 23:59:54 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id
	x142-v6sm54258709wmd.20.2018.11.15.23.59.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 23:59:53 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<bc29bf08db9e3801a3e833f579d93ee2c86cc49d.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8b66282e-7a68-4f43-4f17-b00eacd1266d@linaro.org>
Date: Fri, 16 Nov 2018 08:59:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <bc29bf08db9e3801a3e833f579d93ee2c86cc49d.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::433
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 07/23] riscv: tcg-target:
 Regiser the JIT
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
X-List-Received-Date: Fri, 16 Nov 2018 07:59:57 -0000

On 11/15/18 11:34 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 45 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)

I think this whole patch should be merged with the prologue.  They are
interrelated and it's hard to verify this without the other.

Also, FRAME_SIZE isn't defined yet, so this patch isn't even self-contained.


r~

