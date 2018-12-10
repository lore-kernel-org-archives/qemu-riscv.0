Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWPMS-0004N4-62
	for mharc-qemu-riscv@gnu.org; Mon, 10 Dec 2018 12:28:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWPMP-0004JI-CB
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:28:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWPMM-000228-7x
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:28:49 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:43407)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gWPMJ-0001wn-KR
	for qemu-riscv@nongnu.org; Mon, 10 Dec 2018 12:28:46 -0500
Received: by mail-ot1-x32e.google.com with SMTP id a11so11170014otr.10
	for <qemu-riscv@nongnu.org>; Mon, 10 Dec 2018 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jMG8cJCwCSNmm1eE4ZcPmm8lbhAOM7UoXye3U9u20Pg=;
	b=Q3TPjTQgeWP9fP6Yjrzf6cwXXyofVYbQaA/V81vr4dtGreTf/f+3b63Bw6gWLOAUei
	QtFYsOmUzNfiA3nbnXVhWp2Uv4h5bALdor0keeiUlJV8Bw8J4I6ofWot/5dklh/Zdy6v
	VzCa8hSBQGD6UtGxSVTTxV2iGzAGf06HTv6Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jMG8cJCwCSNmm1eE4ZcPmm8lbhAOM7UoXye3U9u20Pg=;
	b=TXeDWfSqoGT8mXsnnnp756UzFf9Ow4r9rhw32HMZSZ91jIdqYxQzC8QxBc5y3Rokks
	5Q+uEkr+4lqhxF1lKQ9MWVOHi/g3d79yCCLozwKyfNnBZ08IDr3jHeHPD0W313kE2jgl
	gYpwL2DfBAds4QnCjRCARlL7sV0MVpJu9XquF/xEWZBSP6vJCk3qXAK2uUbP3Hum+mlu
	PLzsF8UhZI19J8ttGMWPSOjuCNIJFoThbhzkSAVHa52/yalKDpJA0kkDshNoz7jZA6N7
	zI6fo5moTsIThmwbet3w2Wu2ZxpRVagD1FKpD5avt/cFilCaE/1olRpxZXmogA1SQ8my
	V7zw==
X-Gm-Message-State: AA+aEWaMo5bo6sUh2fLGDNg83L/uL+5h8vACd8ns4fiBUWBpJnCt+iEA
	Uno56qfgNs6pwh0K/snQmN6z1w==
X-Google-Smtp-Source: AFSGD/UE6H+D+PEoXyXLTTtr8NSELQwnfWu+M5wtNCuBLQECtl5Pyik2g22f+hYXo57x4FKe7x+4rw==
X-Received: by 2002:a9d:7c1:: with SMTP id 59mr10113188oto.191.1544462920717; 
	Mon, 10 Dec 2018 09:28:40 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	k207sm6068937oih.58.2018.12.10.09.28.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 09:28:40 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<d579b3cc437a3b81025d42fee40faaf3c0196470.1544229872.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e8644f57-1a43-df55-7539-47029d8b076e@linaro.org>
Date: Mon, 10 Dec 2018 11:28:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <d579b3cc437a3b81025d42fee40faaf3c0196470.1544229872.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32e
Subject: Re: [Qemu-riscv] [RFC v3 15/24] riscv: tcg-target: Add the add2 and
 sub2 instructions
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
X-List-Received-Date: Mon, 10 Dec 2018 17:28:51 -0000

On 12/7/18 6:48 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 55 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

