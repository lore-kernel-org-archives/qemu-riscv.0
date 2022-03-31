Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZmYU-0005dE-3M
	for mharc-qemu-riscv@gnu.org; Thu, 31 Mar 2022 00:37:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nZmYL-0005X4-Ak
 for qemu-riscv@nongnu.org; Thu, 31 Mar 2022 00:37:04 -0400
Received: from [2607:f8b0:4864:20::1032] (port=53793
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nZmYJ-0002Fr-Es
 for qemu-riscv@nongnu.org; Thu, 31 Mar 2022 00:36:56 -0400
Received: by mail-pj1-x1032.google.com with SMTP id bx5so22894870pjb.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 21:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iTqjJDSb+/yzJWcdCCytDT/Tzm2iecGsUWNqI05lIbM=;
 b=LdCs/zdzdu0NVhz3rpsZ2tcb6nXb9WBEgVVzJm5oFhI3/jRhW6Pp8WDDIFNSMTRicf
 JwQZZdHAfVZR07+IbFdUlJTardVFobzGIBb099pFuw8DRfotc888aNL+Jt0uqsyVXEO9
 y/X2j45tGtCsdmcifgGNYJcCLRW8mONH8Sm6ASzjCqbcvU504WGViJZd0H/XAuIpWkIx
 Ijgrx7IvwCpALsgRPuAubUXBEONsjhonLYsMg28lCnJ978orIUxvQ/95mzGDofO8HdG8
 neErZ0yxk/3nsjggKKbcl8nT6rVL8smz/8mEKaeG2BhEPmRndDv3P21Lp7TKl+SLVA4T
 lsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iTqjJDSb+/yzJWcdCCytDT/Tzm2iecGsUWNqI05lIbM=;
 b=V57rAeTV2NbpmAneXj8Vvp9/pObkJEOAAuhEKYE4Kupx64RZ+SxhhVVSOroSekdzdt
 o49sE8qjgBDSwj20TFUFhU2UrMFCJffYEzc54EGmJEu2841XxgWTu6IlLAEiZy77iuWh
 MqIxVDsR7xHgefnOsFLlk9X//2TcgMaGHVJcS2+NrFD7X4Ul5zDYI1SgCrfsNQHjjNLD
 8iI8LdxP3NIZkWbT3NJMMzWDfHTiUFfdMJ8hqzUArInolDswd71ogZ/T3xxBzRcP81SZ
 NR5xAsWj3CL8t/ylu8LxykhHUphnJbfFXLJ86+TDH87fWspHoIzF20eslhnhArtCkX6A
 RoqA==
X-Gm-Message-State: AOAM531zyZu458hWBE7XTrPi/6Me52w4D4Z1vOrWbY58jqWp3sMKrTS4
 Bb3wb4Vmpy9c1CnXEPbDQFQxzg==
X-Google-Smtp-Source: ABdhPJzSgcV93Ew3ce/Bt7G9Wdrok5iwN3imE2N7LeRntdJXgZ5qFX0N7VstM01sz6q6KHpFWooByA==
X-Received: by 2002:a17:903:404b:b0:154:2b02:a496 with SMTP id
 n11-20020a170903404b00b001542b02a496mr38520661pla.73.1648701413674; 
 Wed, 30 Mar 2022 21:36:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 i9-20020a17090a2a0900b001c6e540fb6asm8106453pjd.13.2022.03.30.21.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 21:36:53 -0700 (PDT)
Date: Wed, 30 Mar 2022 21:36:53 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 21:36:41 PDT (-0700)
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
In-Reply-To: <CAKmqyKNzQELfs4SQhRJ_XDcFNvFyp5PLA-2qWfBciKN3nCDJHw@mail.gmail.com>
CC: idan.horowitz@gmail.com, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, 
 phantom@zju.edu.cn, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-252c93bc-7d59-4169-9dc4-3792ef995e4e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2022 04:37:04 -0000

On Wed, 30 Mar 2022 20:23:21 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, Mar 31, 2022 at 3:11 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>>
>> On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >
>> >
>> > Presumably you mean "revert" here?  That might be the right way to go,
>> > just to avoid breaking users (even if we fix the kernel bug, it'll take
>> > a while to get everyone to update).  That said, this smells like the
>> > sort of thing that's going to crop up at arbitrary times in dynamic
>> > systems so while a revert looks like it'd work around the boot issue we
>> > might be making more headaches for folks down the road.
>> >
>>
>> The opposite in fact, I did not suggest to revert it, but rather undo
>> the revert (as Alistair already removed it from the apply-next tree),
>> since my original patch fixes buggy behaviour that is blocking the
>> testing of some embedded software on QEMU.

Ah, sorry -- the QEMU tree I was looking at still had the patch in 
there, must have just been an old one.

> So, this is a little tricky.
>
> We want to apply the fix, but that will break current users.
>
> Once the fix is merged into Linux we can apply it here. That should
> hopefully be right at the start of the 7.1 QEMU development window,
> which should give time for the fix to propagate into stable kernels
> and not break too many people by the time QEMU is released.

If you think this is a Linux bug then that makes sense, but I think this 
is a QEMU bug -- I sent a patch, not sure if it went through as it didn't 
make it to lore.

I also think the bug will manifest without the TB exit patch, maybe in 
single-step mode and definately if we happen to exit the TB at that 
point for other reasons.  Assuming my reasoning is correct in that 
patch, we may also be hitting this as arbitrary corruption anywhere.  
I'd started to write up a "QEMU errata" Linux patch for this, but then 
convinced myself that just adding the sfence.vma was insufficient.

