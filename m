Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvPge-0001ey-Nx
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 13:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54335)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@sifive.com>) id 1hvPgc-0001dW-A2
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:25:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1hvPgb-0007Nt-9J
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:25:18 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35001)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hvPgb-0007M1-3c
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 13:25:17 -0400
Received: by mail-pl1-x642.google.com with SMTP id w24so41798100plp.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 10:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Qia39A3RdeKMzCgJmI5iAQYq9gFiR+QJM6Y430p4Wx8=;
 b=CmVP0vSgzkVJm5GjoKJNhsNJiqjjNRHPEIpPQWY87w5WF3bJWMhCFTWHn5nwCJgxzQ
 EndnCSz8hFqDKaT0KR8ogieFEtQB/zZ4g8ier/JDCgs023FA2v9o95qziEpXdOM4lTxV
 0POfpte/EyVFqEwO/USd3fYSyUi/X4g2p0En4UW8o2RN5T57dBqrZTiHEnwJRpVIQdvv
 MRbc0519iGd4e+BnsZd7ZFTAokrnjzuikIXW03wvzNbLQuMqGEbqaBbhyu85KZmUKkut
 7gcPqF0cshkZ3WP9mdOuLLLyoSf5tn3mFD+XUsZ4F76u7bEEgDyl00xt4N1lRKKutxUd
 003w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Qia39A3RdeKMzCgJmI5iAQYq9gFiR+QJM6Y430p4Wx8=;
 b=Y+4mgcVgMrNYDqCRKo2sxsOxN49BOIEwp0Ih5vpiAE5IpdnioiUhqlWBiZ9YmQ2iqm
 DDMn3OouRZgPjV3UD66+a8hKL+Q34R/QZn3MrDLEJ5ykSwXY8rWMW1QYDWdUqZSGVoRW
 rPorpt9yTRfrqMmXdxouT2PEcFeLZPoPj1gT0evbEatCuyPdgMTARwirCjARvjDUl1sX
 SoArJh2MSOeiZAwewndVA6RLIB36FElVvcC5thpiwEiHZDe8U710G0wEZYCetg2U/1yR
 UEkA0lDwChnRCNJBIgpGMXmlcFKaENckWmlWhkbIuscsXie5t0Q+FPoF+UlBg6qWLR1g
 8+Vg==
X-Gm-Message-State: APjAAAUcCoMBK3mIRnAnH25qjYnYtYtGLsyRx3ckLLU5CvIfBpAp07sO
 xUBLMfkrj57cZv/V/LBertELydOIaPPJDg==
X-Google-Smtp-Source: APXvYqxkoomxIRUSdPFpwpyii3DyXZwp58FvrgerHVRBt7lfd/vU2ESWVsXt+eXUJgkSBVRC6lV5UQ==
X-Received: by 2002:a63:c84d:: with SMTP id l13mr8666342pgi.154.1565198715353; 
 Wed, 07 Aug 2019 10:25:15 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 67sm72433878pfd.177.2019.08.07.10.25.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 10:25:14 -0700 (PDT)
Date: Wed, 07 Aug 2019 10:25:14 -0700 (PDT)
X-Google-Original-Date: Wed, 07 Aug 2019 09:53:36 PDT (-0700)
In-Reply-To: <CAFEAcA9YeuvQPnvG1+Cdb+-JbsbKaRpa0Frv5zz+Vb3q0prAeQ@mail.gmail.com>
CC: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <Atish.Patra@wdc.com>, qemu-devel@nongnu.org,
 Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-21b84257-7bfd-4a52-b6f2-cefa6fcf703a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1] RISC-V: Ignore the S
 and U extensions when formatting ISA strings
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
X-List-Received-Date: Wed, 07 Aug 2019 17:25:19 -0000

On Wed, 07 Aug 2019 09:41:17 PDT (-0700), Peter Maydell wrote:
> On Wed, 7 Aug 2019 at 16:02, Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> The ISA strings we're providing from QEMU aren't actually legal RISC-V
>> ISA strings, as both the S and U extensions cannot exist as
>> single-letter extensions and must instead be multi-letter strings.
>> We're still using the ISA strings inside QEMU to track the availiable
>> extensions, so this patch just strips out the S and U extensions when
>> formatting ISA strings.
>>
>> This boots Linux on top of 4.1-rc3, which no longer has the U extension
>> in /proc/cpuinfo.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>> This is another late one, but I'd like to target it for 4.1 as we're
>> providing illegal ISA strings and I don't want to bake that into a bunch
>> of other code.
>> ---
>>  target/riscv/cpu.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index f8d07bd20ad7..4df14433d789 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -501,7 +501,22 @@ char *riscv_isa_string(RISCVCPU *cpu)
>>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>>      for (i = 0; i < sizeof(riscv_exts); i++) {
>>          if (cpu->env.misa & RV(riscv_exts[i])) {
>> -            *p++ = qemu_tolower(riscv_exts[i]);
>> +            char lower = qemu_tolower(riscv_exts[i]);
>> +            switch (lower) {
>> +            case 's':
>> +            case 'u':
>> +                /*
>> +                 * The 's' and 'u' extensions shouldn't be passed in the device
>> +                 * tree, but we still use them internally to track extension
>> +                 * sets.  Here we just explicitly remove them when formatting
>> +                 * an ISA string.
>> +                 */
>> +                break;
>> +
>> +            default:
>> +                *p++ = qemu_tolower(riscv_exts[i]);
>
>  *p++ = lower;  ?

Yes, thanks -- that's why I pulled the variable out in the first place :)

>
> thanks
> -- PMM

