Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLXVH-0000Sb-QQ
	for mharc-qemu-riscv@gnu.org; Fri, 18 Oct 2019 15:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iLXVD-0000S8-7g
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 15:01:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iLXVB-0007U4-VD
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 15:01:31 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iLXVB-0007T1-Oc
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 15:01:29 -0400
Received: by mail-pl1-x643.google.com with SMTP id s17so3274874plp.6
 for <qemu-riscv@nongnu.org>; Fri, 18 Oct 2019 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=encdaYOYfC8XLuPZ4BblADQ3/+oHllRKuIEmB/IctIs=;
 b=lQzCcZKS+YWL53Ij7HA/AGTHwbSUQz39C7pAFfw0MHQ9iTh7gD3Xr1hzSB6ogYBkZh
 k18uT9mYawokUI1kEZfWXlo6W+MJ9vS6uw8Da1pumRnM12z9z9+F14yLBwLDfwYyBf2+
 aqwtfdra2zhQJpficcYP4nFJKPlCZ7xUI76y8rjqnvM/NR7wWQsImS6WGLx1YFUqh5Ag
 oxZQnN1+qsPms1COXFzmhCjsOl7ZCajZH27CTXpxu2/JmKl+rn18YsO50xMGGn6XiY9T
 rjUEtS5J/iuzYVWukP3e5MOSZCgp4qtTSUEZD4pmCeSNR6hVZGydS66fxaQQ8buzzomD
 5zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=encdaYOYfC8XLuPZ4BblADQ3/+oHllRKuIEmB/IctIs=;
 b=JsWBxFeBQh7MBK0OT9YLUV+ti4E32f/eeT/brmbXXyL8+M4OLiDB3ffbuAsYGozUD0
 BmRvlYZCVqGotYp+F0oy6H5Qkg2cQoLsNlfox1cEFw2T91ym5uR9nNUKMyJWovlLUwmI
 LK4hF/t8dr8KXBj7V6LFyu5QrqYf3Tua+usbrrMu765hLh8cT+6Q0ih673Lqdx0ggt0V
 ZTmry4cSsaFO1iQ66su6F95ilyc6svGOg3qDGAH95rfX8yDb+SUQ1mcqcLCDaMRknV5T
 93F4ECHDHRyDrPX3U3IppTRLnJ8sTlEiGNjVXlU2L4y2on7drXhKfWWcqhq1Q9uh3//h
 RdlA==
X-Gm-Message-State: APjAAAXVkc4r25wjALvEHQoejx7u29Ab3pHQs3ub8sf/GZtNMH8MPO47
 0dJoYkoK4h7kdxi5aP4vp0XJwA==
X-Google-Smtp-Source: APXvYqwWZyvcelj2PfLWDFJd6mlwU3z3rXr/5jUfqeql3n+ofb3FjtK8i/qT8z8jfeQ0E2TJDTnRSQ==
X-Received: by 2002:a17:902:d689:: with SMTP id
 v9mr6916649ply.198.1571425288392; 
 Fri, 18 Oct 2019 12:01:28 -0700 (PDT)
Received: from localhost ([152.179.112.46])
 by smtp.gmail.com with ESMTPSA id r18sm6401448pgm.31.2019.10.18.12.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 12:01:27 -0700 (PDT)
Date: Fri, 18 Oct 2019 12:01:27 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Oct 2019 12:01:07 PDT (-0700)
Subject: Re: [PATCH] target/riscv: PMP violation due to wrong size parameter
In-Reply-To: <CACjxMEt-zOt8VktL_Ut-9vA0FdeO5jPf0XVeCzuT2OOnyehMmA@mail.gmail.com>
CC: fintelia@gmail.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 richard.henderson@linaro.org, Alistair Francis <Alistair.Francis@wdc.com>,
 diodesign@tuta.io
From: Palmer Dabbelt <palmer@sifive.com>
To: dayeol@berkeley.edu
Message-ID: <mhng-20e0918b-b63e-4054-bae9-b94145e22cbe@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Fri, 18 Oct 2019 19:01:32 -0000

On Tue, 15 Oct 2019 10:04:32 PDT (-0700), dayeol@berkeley.edu wrote:
> Hi,
>
> Could this patch go through?
> If not please let me know so that I can fix.
> Thank you!

Sorry, I dropped this one.  It's in the patch queue now.  We should also check 
for size==0 in pmp_hart_has_privs(), as that won't work.  LMK if you want to 
send a patch for that.

>
> Dayeol
>
>
> On Sat, Oct 12, 2019, 11:30 AM Dayeol Lee <dayeol@berkeley.edu> wrote:
>
>> No it doesn't mean that.
>> But the following code will make the size TARGET_PAGE_SIZE - (page offset)
>> if the address is not aligned.
>>
>> pmp_size = -(address | TARGET_PAGE_MASK)
>>
>>
>> On Fri, Oct 11, 2019, 7:37 PM Jonathan Behrens <fintelia@gmail.com> wrote:
>>
>>> How do you know that the access won't straddle a page boundary? Is there
>>> a guarantee somewhere that size=0 means that the access is naturally
>>> aligned?
>>>
>>> Jonathan
>>>
>>>
>>> On Fri, Oct 11, 2019 at 7:14 PM Dayeol Lee <dayeol@berkeley.edu> wrote:
>>>
>>>> riscv_cpu_tlb_fill() uses the `size` parameter to check PMP violation
>>>> using pmp_hart_has_privs().
>>>> However, if the size is unknown (=0), the ending address will be
>>>> `addr - 1` as it is `addr + size - 1` in `pmp_hart_has_privs()`.
>>>> This always causes a false PMP violation on the starting address of the
>>>> range, as `addr - 1` is not in the range.
>>>>
>>>> In order to fix, we just assume that all bytes from addr to the end of
>>>> the page will be accessed if the size is unknown.
>>>>
>>>> Signed-off-by: Dayeol Lee <dayeol@berkeley.edu>
>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>  target/riscv/cpu_helper.c | 13 ++++++++++++-
>>>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>> index e32b6126af..7d9a22b601 100644
>>>> --- a/target/riscv/cpu_helper.c
>>>> +++ b/target/riscv/cpu_helper.c
>>>> @@ -441,6 +441,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
>>>> int size,
>>>>      CPURISCVState *env = &cpu->env;
>>>>      hwaddr pa = 0;
>>>>      int prot;
>>>> +    int pmp_size = 0;
>>>>      bool pmp_violation = false;
>>>>      int ret = TRANSLATE_FAIL;
>>>>      int mode = mmu_idx;
>>>> @@ -460,9 +461,19 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
>>>> address, int size,
>>>>                    "%s address=%" VADDR_PRIx " ret %d physical "
>>>> TARGET_FMT_plx
>>>>                    " prot %d\n", __func__, address, ret, pa, prot);
>>>>
>>>> +    /*
>>>> +     * if size is unknown (0), assume that all bytes
>>>> +     * from addr to the end of the page will be accessed.
>>>> +     */
>>>> +    if (size == 0) {
>>>> +        pmp_size = -(address | TARGET_PAGE_MASK);
>>>> +    } else {
>>>> +        pmp_size = size;
>>>> +    }
>>>> +
>>>>      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>>>>          (ret == TRANSLATE_SUCCESS) &&
>>>> -        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
>>>> +        !pmp_hart_has_privs(env, pa, pmp_size, 1 << access_type, mode))
>>>> {
>>>>          ret = TRANSLATE_PMP_FAIL;
>>>>      }
>>>>      if (ret == TRANSLATE_PMP_FAIL) {
>>>> --
>>>> 2.20.1
>>>>
>>>>
>>>>

