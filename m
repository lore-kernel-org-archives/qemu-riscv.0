Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg166-0000DD-0u
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 02:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41817)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg163-00008q-WC
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:07:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg163-0002nG-1g
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:07:55 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg162-0002mY-Rn
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:07:54 -0400
Received: by mail-pg1-f193.google.com with SMTP id n2so657963pgp.11
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 23:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gMkqqZE5Gc5VDmbZ8EedR3Q0d0rIRldtlW1sU8A/ZSU=;
 b=nfHnx+oB9/kSHFWMBYTMNpNC2QrMmw4TsbdxiM0XaIgdEJoxogt0bdxNjprH29ovRv
 APRE4k9SoK2hJWpUjhqJRBhaEZcYJy7ouSdlUrgieWZkRoMkDKIllj5C/MRb4y6plL92
 MOxYfL2GuAd62AMpm/sqW4lYKl6BWHzVCKVogTovE0O7mQuoeRr1gdhj2F+tMKLi4gFp
 R0+UK2ivvMJsdgvYmpdOyAJNxdYuP+w1gX70lp1SXTMS24XUEFO/V2GJk6GncwlVLfOD
 BXCxaf1sA9Snp8LZbRBhIWHGgUvmR9wSmtmD6F2LsH9QmH78BKawLlViBh0hq/Yz3sy0
 dY7A==
X-Gm-Message-State: APjAAAU09VuMpeu+dp8H2FR19F5ZS84VJjkybsKLwhkAX9WmOlVvCKAr
 dQnfkSFrEKuAQhkGVr1ryU+3lw==
X-Google-Smtp-Source: APXvYqzyUEOF0KjqBeit16NPwVVDqK09I9VYSxQagN4SyN+WqLi+lMpjIJJxPshQLv7N8qc77DEKOg==
X-Received: by 2002:a63:78c3:: with SMTP id t186mr1243506pgc.340.1561529273724; 
 Tue, 25 Jun 2019 23:07:53 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id t26sm14694754pgu.43.2019.06.25.23.07.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 23:07:53 -0700 (PDT)
Date: Tue, 25 Jun 2019 23:07:53 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Jun 2019 22:37:11 PDT (-0700)
In-Reply-To: <8ec410f8-d2a0-69ef-e3b7-925ef09717df@linaro.org>
CC: joel@sing.id.au, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 me@carlosedp.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, marco@decred.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-cc180208-aea2-48b3-b008-2adf3d59f150@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] atomic failures on
 qemu-system-riscv64
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 06:07:57 -0000

On Tue, 25 Jun 2019 08:39:21 PDT (-0700), richard.henderson@linaro.org wrote:
> On 6/24/19 8:08 PM, Joel Sing wrote:
>> From 8ef31a2ce8ef1cbeee92995a0b2994f480e9bb6d Mon Sep 17 00:00:00 2001
>> From: Joel Sing <joel@sing.id.au>
>> Date: Tue, 25 Jun 2019 02:44:24 +1000
>> Subject: [PATCH] Clear load reservations on qemu riscv target
>>
>> This prevents a load reservation from being placed in one context/process,
>> then being used in another, resulting in an SC succeeding incorrectly and
>> breaking atomics.
>>
>> Signed-off-by: Joel Sing <joel@sing.id.au>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>> +    /* Clear the load reservation - otherwise a reservation placed in one
>
> Excepting this line, which will fail checkpatch.pl.
> Needs to be formatted as
>
>     /*
>      * Clear the load...

Thanks.  I fixed that one up as I pulled the patch in.

>
>
> r~

