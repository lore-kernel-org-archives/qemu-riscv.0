Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZTK-000542-5p
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 03:27:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZTH-00051t-F7
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:27:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZTG-0004CB-Hi
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:27:23 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZTG-0004BD-AR
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:27:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id r63-v6so21276976wma.4
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 00:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2DpurdEbyLNuM/1Py8+WVIUS19xTvR6r2x1I6YTz/z8=;
	b=PzTQfhaQRKLi5uz2tm0E3VOP/qWniyrGs1t4W6gUemeX/nnOaXFGsbkyIqcUZfNkpe
	s7BeybyERpJRpLfl8BuBfBKKVew0ZOpLwsPlghnL2nP8NwFmgWFbCTFvN/1wIEYGXJB2
	iasVUGK0DUoMqcLwk+pwmi9XOmCgodfaY57CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2DpurdEbyLNuM/1Py8+WVIUS19xTvR6r2x1I6YTz/z8=;
	b=rYXmcUt+9N1CdMrN3couWOVClQGASIBUUGKlbjFHkD7xGSoLiRK/MvKGOU+44L1tcX
	PyDGlWNwjD798F4P+40tukwojH2C8gnzhFjawQj9vaglXM6k7oDoHhfsJkxpspH/A6jg
	e6iBdTzJtjDUQLgpBc89MR7iI2ja6/3ytoSlsUNW3h8J8tJd1A/qkZ4lAOpGGVyvLGXR
	BY5ouJY+JQITBgsuRt3da9Is482xnCojxJfljONgbeHJORxb0EqcWva6RB2P+Qi8wDrg
	eLZUretDa9yNtihP21p3Vo3iwLxTPXvcxZ/+uZ+9uJwMBPLDKXgQo6zlnLlAuPpq5Sod
	MUuA==
X-Gm-Message-State: AA+aEWa5+dMeYcoe3We4W03/Lcd4JGYFUxY5BXuQjP8RRlOr3S59gCX0
	RtPZkUUpnOE6DddDQEkiVq0Fbw==
X-Google-Smtp-Source: AFSGD/Wtc1M4B3Il12gkUIHIhz8miNTB3ppZkdInOGKxdWc7LZQAtcLn0FFq4+KMlxSK1QtTWWHyqQ==
X-Received: by 2002:a1c:f506:: with SMTP id t6mr357964wmh.18.1542356841262;
	Fri, 16 Nov 2018 00:27:21 -0800 (PST)
Received: from cloudburst.twiddle.net
	(74.red-37-10-255.dynamicip.rima-tde.net. [37.10.255.74])
	by smtp.gmail.com with ESMTPSA id
	x142-v6sm54389881wmd.20.2018.11.16.00.27.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 00:27:20 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<94fae434261439eed18b5ecffd2e8c959f80cdc0.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0b6aa808-7be5-cfc7-1ed7-6f5ad1a72e42@linaro.org>
Date: Fri, 16 Nov 2018 09:27:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <94fae434261439eed18b5ecffd2e8c959f80cdc0.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::329
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 10/23] riscv: tcg-target: Add
 the instruction emitters
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
X-List-Received-Date: Fri, 16 Nov 2018 08:27:24 -0000

On 11/15/18 11:35 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 40 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



