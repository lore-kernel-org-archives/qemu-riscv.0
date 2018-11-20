Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gOzwb-0006dt-2I
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 01:55:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gOzwZ-0006dD-14
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 01:55:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gOzwV-0002UK-QE
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 01:55:30 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gOzwV-0002SS-IE
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 01:55:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id c126so1005842wmh.0
	for <qemu-riscv@nongnu.org>; Mon, 19 Nov 2018 22:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aHx1rpnenssEKf3CuckX5VfDDpHXmNnY16Ku3K2A+Oc=;
	b=S5kqamIMXVraqNiqxpHckBucY9aec4h8rndvoOEqbnsscjGxYz4HR+kBAG+JY0IpAr
	sOLoLB33nsKB9M49pQEYjCjnpeRfNizp8A0OSOwEhCrZLSYadYMd60BKGhwpGQnI50yw
	IK4L2HhNcLgBFbi4ig/3Xen2n9EE2vZPudNX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aHx1rpnenssEKf3CuckX5VfDDpHXmNnY16Ku3K2A+Oc=;
	b=WThw1FLjAk7Oa4POYg4uRtBFvmrW80yc9YHKJqWhvrQWt+TmzvMe6NOk4H1ehHSncy
	oDv9EILj+ZvGARNdDBYWOz6W/ftYmXEvijkVjBFwtrkVJiXOy1PH04EXSzgtWTny04OX
	btQj25W3TLhRT5Ds6Ml54DKbvx+CUDDgXX9H6D3MXx/JDZANtRuUNRiqNmoZ3m2PD51f
	0lYMDNYIdBLfVGIVlAlbfLnXwCtQclVyE4me5aAAAmFl+iva0Yt+yc6Mb4uJ7oNwqR58
	xGRazPPSwClIFVlMmXOCyXOih77wWCTzlLd3hLecDk9pl44bsyAlCLcwSqyeOfH4KGc5
	FFDA==
X-Gm-Message-State: AA+aEWbnRSG14L4s2PfwGVvpDGVMYI9LqeMuYFcP+fQhcvCf/8UjFxBF
	7g1XEATtWfFl8WmAcKuSsEbnEv+W1fGzYw==
X-Google-Smtp-Source: AJdET5f20kC4ZPmdvAXft1OKkrQPMnTXPfk3t8XQnHjFB8EFqWr2+oKvPB9R1tr4OdlTDo8XLqWlMw==
X-Received: by 2002:a1c:4a:: with SMTP id 71-v6mr975502wma.140.1542696925621; 
	Mon, 19 Nov 2018 22:55:25 -0800 (PST)
Received: from cloudburst.twiddle.net
	(134.red-79-147-188.dynamicip.rima-tde.net. [79.147.188.134])
	by smtp.gmail.com with ESMTPSA id
	y34sm24796345wrd.68.2018.11.19.22.55.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 22:55:24 -0800 (PST)
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<cd89e90aeb79ed438aaee6cfa02ca42a36d633b6.1542321076.git.alistair.francis@wdc.com>
	<2aa0f464-c9c4-3d59-81da-952279f56843@linaro.org>
	<CAKmqyKN9DQkZUp=+hRwC5AwaX+X0oYgt4=L2Pw8dWAauzS59QQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e04bac07-ad25-2715-1262-28e9324126a8@linaro.org>
Date: Tue, 20 Nov 2018 07:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN9DQkZUp=+hRwC5AwaX+X0oYgt4=L2Pw8dWAauzS59QQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 20/23] riscv: tcg-target: Add
 the target init code
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
X-List-Received-Date: Tue, 20 Nov 2018 06:55:31 -0000

On 11/20/18 12:04 AM, Alistair Francis wrote:
> On Fri, Nov 16, 2018 at 9:26 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/15/18 11:36 PM, Alistair Francis wrote:
>>> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L0);
>>> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_L1);
>>> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_RA);
>>
>> Why are these three reserved?
> 
> Do these not need to be? I thought we had to reserve them.

The return address, I presume, has been saved by the prologue.  I see no reason
why it can't be yet another call-clobbered register.

As for the other two... what are they supposed to be?


r~

