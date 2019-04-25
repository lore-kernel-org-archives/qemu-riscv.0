Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJWks-0008SZ-Gq
	for mharc-qemu-riscv@gnu.org; Thu, 25 Apr 2019 01:17:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJWkq-0008SH-Nc
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 01:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJWkp-0005yo-Vb
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 01:17:04 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35335)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJWkp-0005xD-Nf
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 01:17:03 -0400
Received: by mail-pg1-x536.google.com with SMTP id h1so290590pgs.2
	for <qemu-riscv@nongnu.org>; Wed, 24 Apr 2019 22:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZKURaLeNgBOzj1amxwM2BTMUcr6ImtlWOy5zQpEOH0c=;
	b=iyQIYV4s+s6ebjTYDE4bB1+J4uKJ8yG7vsTPatoMYioMTXRfkbEmfWG+KaM7fT2ljc
	pB2ICHRzyIDjzQfBPASvExqd9NJ7zO9+iubb+BnSs6zuNorzRix/nH41ZnblWVkkNCqu
	SgbSDcbLRidX77othLz160BA6B0JhVslIKMHfVJuJGcbJ2qzf8SYS6oHOWhorKOMatjS
	YC6TAd7euMCnK7Jbcs53ixck4wdrUje2Lpjj7gMs5ue5MB3Mi0HxWH4bolnSRoiYwEpR
	JvHQrfrZ10ZDED/kB2nOzcr8LLiRuxtF/5Evw2rK45+SVQVwZHlIeXuhS6AFF1slZ5ep
	l9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZKURaLeNgBOzj1amxwM2BTMUcr6ImtlWOy5zQpEOH0c=;
	b=rGtWdDRKUOjHm8ijVWlEI6cu6wJQABPmxktMTPLPun/G8e/0znDHX1HSIr35gYrGKA
	KoX1le/Ul6zMflj9Jym7ZHBA77Aed+0kY/bc9miLxsXYUjzpaJmCJHUCGksPX50wHV5m
	mo9dyxbi2swQy+1NE9vZa2TC+NGzPiL0TWbC0IUp/d7ZNIXWMD2WpWuHyeC91DXGJ0uZ
	JIRTvsmAyHY5uqqiA8sC2P16x6TPfut5H1/0pXyksvYyJV+H+CUXyDKyJ1aq9eguTYGP
	qs39ojHAQ5u61XJjf7CLY6Z712ZePZspVMyC+83eKxP+/IuUp76gsZKrGv4aRMF0TjXZ
	pj0A==
X-Gm-Message-State: APjAAAVfujKCUZYPvSjCUZogdi6OUjUJf6BLNlyO7yZ247Mn37KDeNeO
	y9tpp3hKSsA47wGTOpuHM55u9VeHLn4=
X-Google-Smtp-Source: APXvYqw5Nj5S+jR+gmWfTdpR5uaqFlMAudKh4G6KPj8Q4MHxeaazDHk5e+SGFj4Z4fmiSoIfZF03kA==
X-Received: by 2002:a63:7d03:: with SMTP id y3mr33776591pgc.8.1556169421522;
	Wed, 24 Apr 2019 22:17:01 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	j67sm42895171pfc.72.2019.04.24.22.17.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 22:17:00 -0700 (PDT)
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, Alistair Francis
	<Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
References: <mhng-4fc40e41-5464-469e-9334-1edc4f8294e3@palmer-si-x1e>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <73a7ce8a-1d73-95f7-84a6-f0960a397c22@linaro.org>
Date: Wed, 24 Apr 2019 22:16:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <mhng-4fc40e41-5464-469e-9334-1edc4f8294e3@palmer-si-x1e>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::536
Subject: Re: [Qemu-riscv] [PATCH for-4.1 1/8] target/riscv: Name the
 argument sets for all of insn32 formats
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
X-List-Received-Date: Thu, 25 Apr 2019 05:17:05 -0000

On 4/24/19 8:31 PM, Palmer Dabbelt wrote:
>>  # Argument sets:
>> +&empty
> 
> If I understand decodetree correctly, this isn't used until patch 5.
> Otherwise,
> 

I think it's used as early as patch 3, but I haven't looked in detail to be sure.


r~

