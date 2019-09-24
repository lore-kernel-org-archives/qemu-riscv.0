Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCr3O-0004fh-Dm
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 16:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iCr3L-0004ek-FP
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 16:04:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iCr3J-0000Vb-H0
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 16:04:51 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34678)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iCr3J-0000Uz-A3
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 16:04:49 -0400
Received: by mail-pl1-f195.google.com with SMTP id k7so844601pll.1
 for <qemu-riscv@nongnu.org>; Tue, 24 Sep 2019 13:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/rSgQcrRsIlsdxJKOZJom9LnTWOg9fHERF3t38GzndI=;
 b=BOYSTzzE0uLrNiNsR5sI3wvmmB7PM1E15RkHHnZzDE3TVHjp2m4WNWocplERW3+tTy
 PPtK6w/RW1Gf2E6CgxAVDAUIJe7xZCQALdM5l/sPa3djSEWK2aqnavUCmd8VRrI9Hs75
 3iuXEGiSqkdW4DDig7cAkG5Nhw8WNVNrFlKRWWUuMnf4eKt9i3YUZI0r9muJLGrEDfGc
 rDCjOs3LtOMwUpaJEcD3UbvOkiffZLFqE2zGL4ew+62bpJLmQTFRVpYPoI9OaOWMZL8/
 tRaoDzHFru4BlAdj0ZrqpF+jvISEYPP2Jhpx84x2OfePWW7YTqeqnEEDFKvIkUJSsBfL
 HtkA==
X-Gm-Message-State: APjAAAWzw2XatuKfaLwlJ1wj3dMehERyRbM80ta4cT09PTqzMiQdbaxY
 khCHQdAbtnFceKmvHoQEVHcHSw==
X-Google-Smtp-Source: APXvYqzTWzT+/VxpflvcKQyYMNSWEXgmaY0QX0hoFv/RVz1Xb4cfn0PcA7n6tv9c06XRoqwRZip8QA==
X-Received: by 2002:a17:902:56e:: with SMTP id
 101mr4973233plf.90.1569355487301; 
 Tue, 24 Sep 2019 13:04:47 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v44sm3533668pgn.17.2019.09.24.13.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 13:04:46 -0700 (PDT)
Date: Tue, 24 Sep 2019 13:04:46 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Sep 2019 13:04:44 PDT (-0700)
Subject: Re: [Qemu-devel] [PATCH] atomic failures on qemu-system-riscv64
In-Reply-To: <CAKmqyKP+HNfzh5kCKkGDtfr=pDRwcjL+dUQ79NZEk+jMZ3q=_Q@mail.gmail.com>
CC: joel@sing.id.au, richard.henderson@linaro.org, me@carlosedp.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, marco@decred.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-a172dfe8-dd34-427f-89dd-ca65da3145fb@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.195
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
X-List-Received-Date: Tue, 24 Sep 2019 20:04:53 -0000

On Tue, 24 Sep 2019 11:29:25 PDT (-0700), alistair23@gmail.com wrote:
> On Mon, Jun 24, 2019 at 11:21 AM Joel Sing <joel@sing.id.au> wrote:
>>
>> On 19-06-17 16:52:44, Richard Henderson wrote:
>> > On 6/16/19 12:19 PM, Joel Sing wrote:
>> > > +    /*
>> > > +     * Clear the load reservation, since an SC must fail if there is
>> > > +     * an SC to any address, in between an LR and SC pair.
>> > > +     */
>> > > +    tcg_gen_movi_tl(load_res, 0);
>> > > +
>> > >      gen_set_label(l2);
>> >
>> > This clear needs to be moved down below label l2.
>> > Otherwise, with lr / sc / sc, the second sc could succeed in error.
>>
>> Indeed, thanks.
>>
>> > FWIW, other targets have used -1 as the "invalid" load reservation, since the
>> > architecture does not require address 0 to be unmapped.  This should be quite
>> > visible in M-mode with paging disabled and ram at offset 0.  Often, other
>> > targets require alignment for the lr/sc address, though I don't see that for riscv.
>>
>> I've switched to -1 as suggested. Regarding the alignment for reservations, the
>> specification does require this, although I do not recall seeing any enforcement
>> of this by qemu itself.
>>
>> New diff follows.
>>
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
>> ---
>>  target/riscv/cpu.c                      | 1 +
>>  target/riscv/cpu_helper.c               | 9 +++++++++
>>  target/riscv/insn_trans/trans_rva.inc.c | 8 +++++++-
>>  3 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index d61bce6d55..e7c8bf48fc 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -281,6 +281,7 @@ static void riscv_cpu_reset(CPUState *cs)
>>      env->pc = env->resetvec;
>>  #endif
>>      cs->exception_index = EXCP_NONE;
>> +    env->load_res = -1;
>>      set_default_nan_mode(1, &env->fp_status);
>>  }
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index b17f169681..6a07b12e65 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -113,6 +113,15 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>>      }
>>      /* tlb_flush is unnecessary as mode is contained in mmu_idx */
>>      env->priv = newpriv;
>> +
>> +    /* Clear the load reservation - otherwise a reservation placed in one
>> +     * context/process can be used by another, resulting in an SC succeeding
>> +     * incorrectly. Version 2.2 of the ISA specification explicitly requires
>> +     * this behaviour, while later revisions say that the kernel "should" use
>> +     * an SC instruction to force the yielding of a load reservation on a
>> +     * preemptive context switch. As a result, do both.
>> +     */
>> +    env->load_res = -1;
>>  }
>>
>>  /* get_physical_address - get the physical address for this virtual address
>> diff --git a/target/riscv/insn_trans/trans_rva.inc.c b/target/riscv/insn_trans/trans_rva.inc.c
>> index f6dbbc065e..fadd88849e 100644
>> --- a/target/riscv/insn_trans/trans_rva.inc.c
>> +++ b/target/riscv/insn_trans/trans_rva.inc.c
>> @@ -61,7 +61,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, TCGMemOp mop)
>>
>>      gen_set_label(l1);
>>      /*
>> -     * Address comparion failure.  However, we still need to
>> +     * Address comparison failure.  However, we still need to
>>       * provide the memory barrier implied by AQ/RL.
>>       */
>>      tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
>> @@ -69,6 +69,12 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, TCGMemOp mop)
>>      gen_set_gpr(a->rd, dat);
>>
>>      gen_set_label(l2);
>> +    /*
>> +     * Clear the load reservation, since an SC must fail if there is
>> +     * an SC to any address, in between an LR and SC pair.
>> +     */
>> +    tcg_gen_movi_tl(load_res, -1);
>> +
>>      tcg_temp_free(dat);
>>      tcg_temp_free(src1);
>>      tcg_temp_free(src2);
>> --
>
> This patch causes boot failures when booting systemd built with musl on RV64.
>
> It could possibly be a musl bug, but I wanted to throw that out here
> first to see what people think.

Looking at the musl port, I see at least one bug in their atomics jumping out 
at me:

diff --git a/arch/riscv64/atomic_arch.h b/arch/riscv64/atomic_arch.h
index c9765342..41ad4d04 100644
--- a/arch/riscv64/atomic_arch.h
+++ b/arch/riscv64/atomic_arch.h
@@ -14,7 +14,7 @@ static inline int a_cas(volatile int *p, int t, int s)
                "       sc.w.aqrl %1, %4, (%2)\n"
                "       bnez %1, 1b\n"
                "1:"
-               : "=&r"(old), "=r"(tmp)
+               : "=&r"(old), "=&r"(tmp)
                : "r"(p), "r"(t), "r"(s)
                : "memory");
        return old;
@@ -31,7 +31,7 @@ static inline void *a_cas_p(volatile void *p, void *t, void *s)
                "       sc.d.aqrl %1, %4, (%2)\n"
                "       bnez %1, 1b\n"
                "1:"
-               : "=&r"(old), "=r"(tmp)
+               : "=&r"(old), "=&r"(tmp)
                : "r"(p), "r"(t), "r"(s)
                : "memory");
        return old;

It's a shot in the dark as to whether that'll fix your bug, but I could at 
least see a mechanism for it: before we yielded load reservations on context 
switches then that backwards branch would never be taken, so we wouldn't notice 
if tmp was allocated into one of the same registers as the inputs.  Even if it 
doesn't fix your issue it's still a bug so I'll send the patch out, just LMK so 
I can indicate how important the issue is.

This should manifest on hardware, but it looks like we managed to drop that SC 
patch.  I'll go send the patch out now...

>
> Alistair
>
>> 2.21.0
>>
>>

