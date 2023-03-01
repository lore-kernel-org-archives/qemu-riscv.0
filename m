Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXU7B-00055g-3A
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 16:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXU72-0004vk-7A
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 16:35:49 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXU70-0000EU-Cz
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 16:35:47 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so654717pjg.4
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 13:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677706544;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=RYm87ZaHZpoCXIBQulR3+oCtpOGObVhM5PQCe0RTOec=;
 b=qR1inA57EXxm6iAEnS+uve6RI1NPk3c+O37PCcyRLT75QlBv59zvuI8TapsUhv/meN
 B5c5y7TS3pZzGtI9LhFUC0bv/w2yZOJ3RTOK1Afpn1UwsfodpFXYqWBsbK2fCAR+WI6X
 1OAxVovXuZidPDpj20NYsSbRW5r2hMunOtKBYMiPbdriPgJ+7RMjnYRkkscoRZXaFS3R
 tkfBz7ais+D5Ps54Hf/LpXKgqQ7ZC0v9HdW5WAHOSI5Cv8tHL3mgvXVvIBjaBxbOWJ3s
 UR9uditQEICKxlS/VG3fzd4OGP14sqDPPLVR1X8BDsbxEBwt3Zt97k8MzL0gwZQXD81p
 YbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677706544;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYm87ZaHZpoCXIBQulR3+oCtpOGObVhM5PQCe0RTOec=;
 b=LwvLGY3IcOF8YmBbDMPmWAhpxOvX37ynptvcTEdwzdY3LxWIBQurVI69vUHIQItfL9
 ngbV0pXrl3eGBDb9OkZPj1ew8AYSRLzSiP7SpQ1NcOoiIyPUhtgFbxmwAisKD8JvUO2K
 C0bNvZlwcfp0Wl1nb8HV9A6LzWnAL3tOrGMiUBKKlT1FKnaEs6vnccsun5tt1Ov6jXG1
 5JgPnfBaCMi5B6IJvKtfn8Wn/CZruntzOI0dMCzIkaf/I/zuhRDuEtf0WF5zMaXIlUFT
 4sbVLd/k+Ua/tDLQZzMhVknysBBuH9wYepw4E1oBqbsNzFTTc5FeQY2rfSKczp1PSrpK
 855Q==
X-Gm-Message-State: AO0yUKWzAuJaqxmChFRbWaQu0QY4T1xE8n3IDx/PnEfhjBCyeHdWeGtm
 bwRd2btceelu7cU/tAs/GELk6Q==
X-Google-Smtp-Source: AK7set+1Ym3/CzGbWRnfcKwbomzUU8Oxb0qVxrq6u/gWPiMmIAMMRYQx6MatwNsnXMmNMHjQlCPm3A==
X-Received: by 2002:a17:90b:1d86:b0:237:99b8:4eef with SMTP id
 pf6-20020a17090b1d8600b0023799b84eefmr9062168pjb.9.1677706544241; 
 Wed, 01 Mar 2023 13:35:44 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 o21-20020a17090ab89500b00230da56ddecsm224176pjr.27.2023.03.01.13.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:35:43 -0800 (PST)
Date: Wed, 01 Mar 2023 13:35:43 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 13:34:53 PST (-0800)
Subject: Re: [PATCH v7 1/4] tcg: add 'size' param to probe_access_flags()
In-Reply-To: <ab0f0f50-f8c4-05a2-5f37-bb7e5c4ace82@linaro.org>
CC: dbarboza@ventanamicro.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <mhng-f919c36d-64f1-4239-890f-02cde5364076@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 01 Mar 2023 21:35:53 -0000

On Thu, 23 Feb 2023 16:10:59 PST (-0800), Richard Henderson wrote:
> On 2/23/23 13:44, Daniel Henrique Barboza wrote:
>> probe_access_flags() as it is today uses probe_access_full(), which in
>> turn uses probe_access_internal() with size = 0. probe_access_internal()
>> then uses the size to call the tlb_fill() callback for the given CPU.
>> This size param ('fault_size' as probe_access_internal() calls it) is
>> ignored by most existing .tlb_fill callback implementations, e.g.
>> arm_cpu_tlb_fill(), ppc_cpu_tlb_fill(), x86_cpu_tlb_fill() and
>> mips_cpu_tlb_fill() to name a few.
>>
>> But RISC-V riscv_cpu_tlb_fill() actually uses it. The 'size' parameter
>> is used to check for PMP (Physical Memory Protection) access. This is
>> necessary because PMP does not make any guarantees about all the bytes
>> of the same page having the same permissions, i.e. the same page can
>> have different PMP properties, so we're forced to make sub-page range
>> checks. To allow RISC-V emulation to do a probe_acess_flags() that
>> covers PMP, we need to either add a 'size' param to the existing
>> probe_acess_flags() or create a new interface (e.g.
>> probe_access_range_flags).
>>
>> There are quite a few probe_* APIs already, so let's add a 'size' param
>> to probe_access_flags() and re-use this API. This is done by open coding
>> what probe_access_full() does inside probe_acess_flags() and passing the
>> 'size' param to probe_acess_internal(). Existing probe_access_flags()
>> callers use size = 0 to not change their current API usage. 'size' is
>> asserted to enforce single page access like probe_access() already does.
>>
>> No behavioral changes intended.
>>
>> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
>> ---
>>   accel/stubs/tcg-stub.c        |  2 +-
>>   accel/tcg/cputlb.c            | 17 ++++++++++++++---
>>   accel/tcg/user-exec.c         |  5 +++--
>>   include/exec/exec-all.h       |  3 ++-
>>   semihosting/uaccess.c         |  2 +-
>>   target/arm/ptw.c              |  2 +-
>>   target/arm/sve_helper.c       |  2 +-
>>   target/s390x/tcg/mem_helper.c |  6 +++---
>>   8 files changed, 26 insertions(+), 13 deletions(-)
>
> Queueing to tcg-next.

Unless I'm missing something, that's not in Peter's tree yet?  I Ack'd 
the cover, it's fine with me if you want to take these via the TCG tree.  
Doing some sort of shared tag for the first one works for me too, I've 
also got some other stuff in the RISC-V queue.

Thanks!

