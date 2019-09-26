Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDXJV-0000on-Rn
	for mharc-qemu-riscv@gnu.org; Thu, 26 Sep 2019 13:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDXJO-0000l1-RA
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 13:12:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDXJM-0007Mm-Fy
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 13:12:13 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45631)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDXJM-0007KP-9s
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 13:12:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id y72so2161835pfb.12
 for <qemu-riscv@nongnu.org>; Thu, 26 Sep 2019 10:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9SeAmBswGPUU/7s1XP2AkyYn8Y1JWganLEKiKSJadmw=;
 b=HOUa2Yg3NKZH23KPRP27i1SuQYGPZ0ioWma8hZRodfHbySuHPCAeela1Euern5q3ra
 Fz7qksFFNuCiBRxT3m+9l3nJxQMAUO5CfpSYeiI5E93O1tblteC0Q4XKWS9ag7mCsfS4
 ATGtHARHsrR8L1EnufpviMg5KfYZco+QKqOPcFoypHY8MW8SdspJPUSL1Dr32OUu0C0s
 xWs9W1brPzf+GqH2vkGXX3z9mAwfQAlkg30XaODDZdu12DKT10IPcScdBr3jbZ/SsPRM
 /fl4oDZY2MaCDxR7WeobbISX9f9Z+bBDTURjo7oh3PF7CBnkZjE+ivMuYISqSqAaGmrG
 +j2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9SeAmBswGPUU/7s1XP2AkyYn8Y1JWganLEKiKSJadmw=;
 b=X0j5ls3oRinVfsD2DQW/FRU8R4rN8eLKVX4XBuGNTz46QYEOmqXkbNfZQBVKhohNeX
 dCzY/QOzSJ+w8KtPwLg0oFpGL/wjPuaud8XrmVBfYrNEViRyEOB69tbR1CD05PAfwS7N
 sYNxIL1Ya6RYhEVHridhc0h82Y0wa97vYrBz4z+EWCwGXg+fAIdqRrF4991d0sTGb/Ze
 m5R0AuG0Y45dSaAWCcqMD8NpKrUV5ddBRNFJyOfo/6GjXLEXQeZVjkBJ6keiu5TYfizX
 FXd6s+74CDXVW2bLc/jLzET0B1LudjRwmnENfR/ivJjxyQi5u43du30O8Uqk+ANPjG/V
 8eSg==
X-Gm-Message-State: APjAAAUxC7CDf0jfUHcLNk57hLUApjo0nndbCgWUXIaL79H9UartxvJP
 Q2scPPkt9sPluNdaFLJ7xAsZzQ==
X-Google-Smtp-Source: APXvYqwuZdwdokxX7L2XLlS5TdmlGrJY1vSMMT7B6mTyEQmDtdAcjlg5kPy2z3STwqoZ2VqMANAWQg==
X-Received: by 2002:a62:8209:: with SMTP id w9mr4981825pfd.112.1569517869117; 
 Thu, 26 Sep 2019 10:11:09 -0700 (PDT)
Received: from [172.20.32.216] ([12.157.10.114])
 by smtp.gmail.com with ESMTPSA id c128sm4188974pfc.166.2019.09.26.10.11.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 10:11:07 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc@nongnnu.org
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
Date: Thu, 26 Sep 2019 10:11:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
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
X-List-Received-Date: Thu, 26 Sep 2019 17:12:17 -0000

On 9/26/19 12:50 AM, Peter Maydell wrote:
> On Thu, 26 Sep 2019 at 00:31, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> The 32 bit hosts are already a second class citizen especially with
>> support for running 64 bit guests under TCG. We are also limited by
>> testing as actual working 32 bit machines are getting quite rare in
>> developers personal menageries. For TCG supporting newer types like
>> Int128 is a lot harder with 32 bit calling conventions compared to
>> their larger bit sized cousins. Fundamentally address space is the
>> most useful thing for the translator to have even for a 32 bit guest a
>> 32 bit host is quite constrained.
>>
>> As far as I'm aware 32 bit KVM users are even less numerous. Even
>> ILP32 doesn't make much sense given the address space QEMU needs to
>> manage.
> 
> For KVM we should wait until the kernel chooses to drop support,
> I think.

Agreed.  I think this discussion should be more about TCG.

>> @@ -745,19 +744,22 @@ case "$cpu" in
>>    ;;
>>    armv*b|armv*l|arm)
>>      cpu="arm"
>> -    supported_cpu="yes"
>>    ;;
> 
> I'll leave others to voice opinions about their architectures,
> but I still have 32-bit arm in my test set for builds, and
> I'm pretty sure we have users (raspi users, for a start).

I'd really like to know what raspi users might be using qemu for.  Depending on
that answer, perhaps it would be sufficient for arm32 tcg to only support
32-bit guests.

For context, the discussion that Alex and I were having was about int128_t, and
how to support that directly in tcg (especially to/from helpers), and how that
might be vastly easier if we didn't have to consider 32-bit hosts.


r~

