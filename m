Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZSq-0004ld-RW
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 03:26:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZSo-0004l1-Rd
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:26:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZSl-0003nQ-3g
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:26:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZSk-0003iQ-SF
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:26:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l9so11036511wrt.13
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 00:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hcV/1j3IFZVuD09Nx30tYKcyTGstCbw7DqofcIdmpSI=;
	b=a9ZWxjl2TMadfv+NcQS+s+nJlHBWojuHHv2vckOo/Zy+HR6Yf/EfW1bzlaVHOG0/bw
	40vXwxHbEhIZj0JK6TBFbYTGEcLsRY76D3JrJZcBBE9357ACkil1wNsrtB2KtZdRHDid
	74SVnL15YJ1VKiSY+gtUKmozw1/LuIeiQVx8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hcV/1j3IFZVuD09Nx30tYKcyTGstCbw7DqofcIdmpSI=;
	b=ka57hODFOf727wgGuxSneKI3a5jX+UliPuTPKIDI4HwsBRVdW29Ejuy+wPyOAOGSGa
	saFl3eClFIMEXDn1Kla+hcmtk74BnwUlMLuuQGZgkLQufAhEu+AT3nJasyGUT/T/a6Jr
	DYrPebE6DMy+NsNFGkiOJ3aRNoVaqT78CGfcsJoVZ1IBdk/z2QQO4QLPHX+QZfUjiVGW
	mdrKH5rPYfjkymngjSSV70BzZFBN0WK290ekGOVOTD6xw7muNoB8+KTD9LNXXquHlxAd
	A4Eiu0pC2j14fGYa0GzG+ERxvN0tW/fvcvigWFY3juhVEn+5X0FP2wTN+zc+HqLh+S4H
	Vacw==
X-Gm-Message-State: AGRZ1gJwlx8l2mYLWMlnK94fTJcpuT/itce47DNDUev0YRfRjhM2CF5P
	+Trlj7fQM6MySROPiONLyjx7hg==
X-Google-Smtp-Source: AJdET5coHJzCHXMZ/wcj+en8DmtEe/QW/4CEng72EqCn9a5XrxU7EvF2OK/ncblpv/zEsKbd4p+Icg==
X-Received: by 2002:adf:9d4a:: with SMTP id
	o10-v6mr8212639wre.94.1542356793389; 
	Fri, 16 Nov 2018 00:26:33 -0800 (PST)
Received: from cloudburst.twiddle.net
	(74.red-37-10-255.dynamicip.rima-tde.net. [37.10.255.74])
	by smtp.gmail.com with ESMTPSA id
	j125-v6sm20026934wmb.12.2018.11.16.00.26.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 00:26:32 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<2d6d038f9949b5b39feb48e322be881f31a7f4e1.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a5b5dda4-77df-6e28-509f-3a0ab696f390@linaro.org>
Date: Fri, 16 Nov 2018 09:26:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <2d6d038f9949b5b39feb48e322be881f31a7f4e1.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42d
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 09/23] riscv: tcg-target: Add
 the immediate encoders
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
X-List-Received-Date: Fri, 16 Nov 2018 08:26:55 -0000

On 11/15/18 11:35 PM, Alistair Francis wrote:
> +static int32_t encode_simm12(uint32_t imm)
> +{
> +    return ((imm << 20) >> 25) << 25 | ((imm << 27) >> 27) << 7;
> +}

I'm not fond of triple shifts like this, as it makes me count.
I'd be ok with a formulation like

    return ((imm & 0x1f) << 7) | ((imm & 0xfe) << (25 - 5));

but perhaps best as

    uint32_t ret = 0;
    ret = deposit32(ret, imm, 7, 5);
    ret = deposit32(ret, imm >> 5, 25, 7);

Similarly with encode_sbimm12, encode_uimm20 (which is a simple &), encode_ujimm12.


r~

