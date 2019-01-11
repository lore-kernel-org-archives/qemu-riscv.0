Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gi3ub-0003pt-Kz
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jan 2019 16:00:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gi3uZ-0003or-JJ
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 16:00:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gi3uY-0000km-Dl
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 16:00:15 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36326)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gi3uY-0000kI-6I
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 16:00:14 -0500
Received: by mail-pg1-x541.google.com with SMTP id n2so6799129pgm.3
	for <qemu-riscv@nongnu.org>; Fri, 11 Jan 2019 13:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jXeu1JoYzkWFz4cNydQhpydqTsbeErMA60jTruWuT7o=;
	b=GOQuzW/bejH/i/WdVrrZXEPX4xgaXQGt6gAxNzJQzSwjRXDzsTXwwKS5K7dEjVkl6s
	x3FGNA/X5Te7k0dbZA1ZMhgM3YmEO+CnQ71LYxYtL1qo0ZXdJDt7JnXlGN8hUt/aWEhb
	JFuxieuVZTgG/ZkGeGVMLBlLya0cC2sm/Wso0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jXeu1JoYzkWFz4cNydQhpydqTsbeErMA60jTruWuT7o=;
	b=QZHMJ4/FaWWQpXZWiuNLcw3gLvAF9k7b+t0cWEH3nzBXwPqVrfz0R1toi7E6GaDz74
	w21isHxHnuthByGbgj578NPS+PBvPKzAk8bcHpAMksgDqu34rzUFukw8qORcOLdOwwRl
	2TGucCQ6uABfVk9VXh8ENgFLqwe8hqzcq4LvkfhsnUmMaHuHIytXYAPeET4flHs/G0EX
	Ty2KpVmJflGO58rCxUnr1/FDmkcqkADTefrW3CWXjims7XBH9pM6/B04HyanzBpuLHTl
	RrdyrJXxc5sH3xJYH67pntty61P8IpzrsgEGT+5tTx8z1RHcYnWP1niTAYw70FSxaJ+P
	a0yQ==
X-Gm-Message-State: AJcUukfTdWkMFTeawlqf0/Dw8Bs74ta6P2KFWkUmRIUpR9kiBWPzMWJH
	dPaumnl6d/UhzxExiL88mnR0hg==
X-Google-Smtp-Source: ALg8bN7F/ZQKliR6RjeuA25snrVzC6e4xS9UKbSKt4d6pfTOVHuRnS/9mvYRHWnt56/Jt6oTQv1gug==
X-Received: by 2002:a62:8e19:: with SMTP id k25mr16055315pfe.185.1547240412575;
	Fri, 11 Jan 2019 13:00:12 -0800 (PST)
Received: from cloudburst.twiddle.net
	(ppp121-45-206-188.bras1.cbr1.internode.on.net. [121.45.206.188])
	by smtp.gmail.com with ESMTPSA id
	b2sm146174706pfm.3.2019.01.11.13.00.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 13:00:11 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-25-kbastian@mail.uni-paderborn.de>
	<16797a6b-1b0b-1f83-1aef-5cc5a8ff90e6@linaro.org>
	<b0269eb1-9fa8-449e-68ee-adbc55d15e18@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <555073af-e1f7-34f8-e4fd-c917e810f081@linaro.org>
Date: Sat, 12 Jan 2019 08:00:04 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <b0269eb1-9fa8-449e-68ee-adbc55d15e18@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 24/35] target/riscv: Move
 gen_arith_imm() decoding into trans_* functions
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
X-List-Received-Date: Fri, 11 Jan 2019 21:00:16 -0000

On 1/12/19 12:10 AM, Bastian Koppelmann wrote:
> 
> On 10/31/18 11:18 PM, Richard Henderson wrote:
>>
>> Surely the shri and sari functions need the same shamt >= TARGET_LONG_BITS
>> check as slli.  Otherwise RV32 shri should definitely produce an assert in
>> tcg_gen_shri_tl.
>>
>> I did wonder about changing the decode of the shift functions such that only
>> the top two bits of the imm are reserved for secondary parsing of the shift
>> type, and the other 10 bits are passed down into trans_foo.  At which point the
>> TARGET_LONG_BITS check takes care of other illegalities.
>>
>> Which means that the parsing for slli and slliw are identical, and also that
>> for the far future when RV128 is a thing, we don't have to change the parsing.
> 
> 
> I don't quite understand this. Do you want to have one entry in the decode file
> for slli and slliw?
> 
> How is the parsing of slli and slliw identical with this change? As far as I
> see it, they are different at least in the opcode.

I meant in the extraction and validation of operands, I think.
I'm not really sure where else I was going with this.  It has
been two months and I don't have the decode in front of me.


r~

