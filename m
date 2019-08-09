Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hw7H9-0008EV-Kg
	for mharc-qemu-riscv@gnu.org; Fri, 09 Aug 2019 11:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53493)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hw7H7-0008Cr-Jg
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hw7H6-0001Qb-Mk
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:57:53 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:45519)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hw7H6-0001OU-FO
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:57:52 -0400
Received: by mail-pg1-x541.google.com with SMTP id o13so46050683pgp.12
 for <qemu-riscv@nongnu.org>; Fri, 09 Aug 2019 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KvAh0kj7MJYjB42/ASlKSiUOycmdDr5QG3FtOZH9hMQ=;
 b=Lp5zxZLi/lClKwWSiaorzYrdEOyt4ksDRCzqeNRYaTv3NC2L8aSsd8a1r+dIRKGdbO
 kdB6yj9DkMU09auxqM6P9opMzpDYvvDeD5U/WDQHDnOiiQVQgYqcBUAfDdEx0frYGBNw
 0JzIZfDTrkMrx0OYXvCYwJMC56i08s2JAc8Qm5XvLO1efZNx6hUMBbE0NK5bvDicSxUz
 FWF62NNyPKmxH4Ie4DbAnBUgqHaej2nYBAfQ7g9SdyaEL/fwBZTMqFfCVEz/NdashtBW
 zNpioDtrgr4c87R5WbarjVrww0Y3jsFg91Smqm+THT7olDQnaJSRQU7qjQYFNTL08k1D
 5nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KvAh0kj7MJYjB42/ASlKSiUOycmdDr5QG3FtOZH9hMQ=;
 b=Vs7NW5IU4wpOjahH7BvfSMgNz5IaMpXE4Ydw5kWa5bY/H+X7LtbOsMPoCTzBczup9W
 02epMAOW9rgsyWycOaoR0JGC2RlVov6FznjbMPTVWW5aQEOcYJgu+R3S0iMyd85Spp2d
 uFltNn7hAoCVlQXspUv2p6xlb0l7ufWgSjbeaPCKpFrZU/Wwgb6Ta+OVPCOVrv6BD4Wi
 622+a29f4ppCiLHYZyoe6JFu3ttqshEuLiCh0ERQ6dX2cT/pAbJSrzCvRminzD0N9iqo
 pirNlvyXZ6lSW/+M6dKsR1Rv8vN/+xqgedJWV6oFqu+k22ydi5P1SqsYllCw97efGZs3
 eedQ==
X-Gm-Message-State: APjAAAWauvQa/JRYum0RHpwXqBPSuZeu2nCKU9BcmZRo3t3+LhxRlq6I
 84L+ca2Zt1ksS8e6iZyZyf7bNw==
X-Google-Smtp-Source: APXvYqx8i7jcSgJ8jpuZ05hnbOcCw6Lq2Qs1ZyCwoZVfO3greXreaQuEFC3kTLTRirhgCr5DItuYOA==
X-Received: by 2002:a17:90a:c58e:: with SMTP id
 l14mr10075608pjt.104.1565366270313; 
 Fri, 09 Aug 2019 08:57:50 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i17sm2930603pfo.28.2019.08.09.08.57.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 08:57:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20190809154153.31763-1-richard.henderson@linaro.org>
 <20190809154153.31763-2-richard.henderson@linaro.org>
 <CAFEAcA_4jCdh94MUbmA9wAxQ7UajC_8TxEeD0tLpZRfn7jMiiw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <935866af-9a2f-1d35-c583-6f26ee00087a@linaro.org>
Date: Fri, 9 Aug 2019 08:57:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_4jCdh94MUbmA9wAxQ7UajC_8TxEeD0tLpZRfn7jMiiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [PATCH 1/3] decodetree: Allow !function with no
 input bits
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
X-List-Received-Date: Fri, 09 Aug 2019 15:57:54 -0000

On 8/9/19 8:52 AM, Peter Maydell wrote:
>> @@ -195,7 +195,10 @@ class MultiField:
>>      """Class representing a compound instruction field"""
>>      def __init__(self, subs, mask):
>>          self.subs = subs
>> -        self.sign = subs[0].sign
>> +        if len(subs):
>> +            self.sign = subs[0].sign
>> +        else:
>> +            self.sign = 0
>>          self.mask = mask
>>
>>      def __str__(self):
> Is this change to MultiField left over from the previous
> implementation ? I was expecting a zero-length MultiField
> to now be a bug in this python script (ie we should never
> try to create one).
> 

Oops, yes.

The error is emitted here:

> +    if len(subs) == 0:
> +        if func:
> +            f = ParameterField(func)
> +        else:
> +            error(lineno, 'field with no value')

and tested:

> +++ b/tests/decode/err_field6.decode
> @@ -0,0 +1,5 @@
> +# This work is licensed under the terms of the GNU LGPL, version 2 or later.
> +# See the COPYING.LIB file in the top-level directory.
> +
> +# Diagnose no bits in field
> +%field


