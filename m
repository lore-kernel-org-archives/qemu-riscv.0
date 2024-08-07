Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB254C3DA7F
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 22:58:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbpbY-0007Mp-BL; Wed, 07 Aug 2024 18:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbpbW-0007JS-2F
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 18:58:02 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbpbS-0001KB-Ru
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 18:58:01 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1fc6ee64512so4191155ad.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2024 15:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723071477; x=1723676277; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W9Gpp5EGoJF312BO83kqM/H8vKDu3Q7UhGmUwUXlac0=;
 b=FGwWNvVhhkQwQ6h4CnwPrzNWWEscL1XTIV/6fRYNmOCeb/Z7uqmBC50szXKrnOqkfk
 vYhITA8liOk5d2syCVuzGEeMXNYAnoytC+9V4FLcNK7+DUlVWJvJA+F0j7rdkIBNPIj3
 /pXGFzFsA3dYEv/BXOH0x+H29r06IJE0amp5VdcTAC72ZZmdF2SlfJOsjcNCqM3XRjMp
 dkv71SbIWIdKVsoHIjmhgbj6opDSKX8luz4oYyXlG2A1Y1t3BZXy6VRhr2WZUbMjbNq+
 EkaOHDjScj8BYB85rCoIwjg8anmddtRKTm/ECuOeIVi7It/pSL6LFq45Lv390nhabCY5
 otMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723071477; x=1723676277;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W9Gpp5EGoJF312BO83kqM/H8vKDu3Q7UhGmUwUXlac0=;
 b=jTUWyvLotQjjuSBAHf87xOpNTxExATsv3IsrfL+8lU++fW+Ft1evnG3BemTV3bSJ6p
 Idv82lVLNO50r0yQJMF7K5No6CXaciN4MOtorz1KKPvwhpy82VRGZpTfuXNByEcz3E4f
 vPlKPg0IBMPDE7m8R89NM1usilJIrNuWlJyFys2Z3c/XHq6f6l/kKh1K2eFmVRnnMBHF
 j5GrNhfdpn3ty05JTyYAVYFR6itomwziFW7ICwYD2T06rM5KEZ/7HtinrbPfMI9aJaR1
 hdmswrSHhHTmVx/svnuZxaDsskcVYminLBQWv8q1NmRsUHdFSxCqWRzkm+9XvZ87lSJA
 oidw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvKSBIHaRvCmtJedCE5Px3m0Wo32+1lV4JPwFSUAMWWtUUwA0P8GVUIcmuTD3yx8OU9usKoHU7aB3KFB4lDfisunKdP5k=
X-Gm-Message-State: AOJu0YwTnclHtyyRAeXzLkaLxKmP4ik6sqYCgo8BXd2kvPp75nniMcTc
 yRRUdMJCRUtb82HscTZIYGhntpHXRTkwMkVaMAO/OYh/uoi61dgxA+OBI8U6hPw=
X-Google-Smtp-Source: AGHT+IE/p/23hX+ZpMTCjVpPK8ruOcEy2qBc5CVYRsD6w87Xi0v7RjoRrkFTFZpXzC7hNWUEkbIM9w==
X-Received: by 2002:a17:902:cecd:b0:1fd:d6d8:133e with SMTP id
 d9443c01a7336-200952478d4mr1744955ad.14.1723071476694; 
 Wed, 07 Aug 2024 15:57:56 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.4.111])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f56febsm112239085ad.88.2024.08.07.15.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 15:57:56 -0700 (PDT)
Message-ID: <eed6673a-0877-4e4e-8b86-7a7d7b770b7a@linaro.org>
Date: Thu, 8 Aug 2024 08:57:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/20] target/riscv: shadow stack mmu index for shadow
 stack instructions
To: Deepak Gupta <debug@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com
References: <20240807000652.1417776-1-debug@rivosinc.com>
 <20240807000652.1417776-16-debug@rivosinc.com>
 <26d37287-b4e3-42b8-818d-b96bcf128a75@linaro.org>
 <ZrPl4fFyLX5N2WUs@debug.ba.rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZrPl4fFyLX5N2WUs@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 8/8/24 07:23, Deepak Gupta wrote:
> On Wed, Aug 07, 2024 at 12:43:31PM +1000, Richard Henderson wrote:
>> On 8/7/24 10:06, Deepak Gupta wrote:
>>> Shadow stack instructions shadow stack mmu index for load/stores.
>>> `MMU_IDX_SS_ACCESS` at bit positon 3 is used as shadow stack index.
>>> Shadow stack mmu index depend on privilege and SUM bit. If shadow stack
>>> accesses happening in user mode, shadow stack mmu index = 0b1000. If
>>> shaodw stack access happening in supervisor mode mmu index = 0b1001. If
>>> shadow stack access happening in supervisor mode with SUM=1 then mmu
>>> index = 0b1010
>>>
>>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>> ---
>>>  target/riscv/cpu.h                            | 13 ++++++++++
>>>  target/riscv/cpu_helper.c                     |  3 +++
>>>  target/riscv/insn_trans/trans_rva.c.inc       |  8 ++++++
>>>  target/riscv/insn_trans/trans_rvzicfiss.c.inc |  6 +++++
>>>  target/riscv/internals.h                      |  1 +
>>>  target/riscv/translate.c                      | 25 +++++++++++++++++++
>>>  6 files changed, 56 insertions(+)
>>>
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index 6da94c417c..3ad220a9fe 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -615,6 +615,19 @@ FIELD(TB_FLAGS, FCFI_ENABLED, 28, 1)
>>>  FIELD(TB_FLAGS, FCFI_LP_EXPECTED, 29, 1)
>>>  /* zicfiss needs a TB flag so that correct TB is located based on tb flags */
>>>  FIELD(TB_FLAGS, BCFI_ENABLED, 30, 1)
>>> +/*
>>> + * zicfiss shadow stack is special memory on which regular stores aren't
>>> + * allowed but shadow stack stores are allowed. Shadow stack stores can
>>> + * happen as `sspush` or `ssamoswap` instructions. `sspush` implicitly
>>> + * takes shadow stack address from CSR_SSP. But `ssamoswap` takes address
>>> + * from encoded input register and it will be used by supervisor software
>>> + * to access (read/write) user shadow stack for setting up rt_frame during
>>> + * signal delivery. Supervisor software will do so by setting SUM=1. Thus
>>> + * a TB flag is needed if SUM was 1 during TB generation to correctly
>>> + * reflect memory permissions to access shadow stack user memory from
>>> + * supervisor mode.
>>> + */
>>> +FIELD(TB_FLAGS, SUM, 31, 1)
>>
>> This is already encoded into the mmu_idx as MMUIdx_S_SUM.
> 
> This is where I need some help / suggestion and clarifications.
> 
> `riscv_env_mmu_index` is the which does mode --> mmu index translation and that's
> where `MMUIdx_S_SUM` is set.
> 
> Although above function assumes following things
>     -- Only loads ands stores are supposed to do read and write.
>     -- Translates env/priv --> mmu index
> 
> In case of shadow stack, we need to hold following true:
> Shadow stack are not writeable via regular stores but are allowed to be readable.
> Shadow stack are writeable only via shadow stack instruction.
> Shadow stack instructions can't operate on non-shadow stack memory.
> 
> This let me to create a new mmu index (as you saw in patches). This mmu index is only
> setup by shadow stack instruction and thus has to be known at translation time

All good so far.

> There is no way of telling in `riscv_env_mmu_index` about whether mmu index is requested
> for regular load/store or some other instruction (in this case shadow stack instruction).
> If that is available then I think I can use `riscv_env_mmu_index`.

What you miss is that the result of riscv_env_mmu_index is stored

   ctx->mem_idx

So that takes care of U, S, SUM, M, VS, VU, etc.  All you need at
this point is to or in your shadow stack bit:

   ctx->mem_idx | MMU_IDX_SS_ACCESS

(Perhaps SS_WRITE is a better name, since read access is never prohibited?)

Note that you can do this without ifdefs -- user-only will happily accept and ignore the 
mmu index.  Also note that user-only will *not* be able to restrict access to the shadow 
stack pages in the way the spec describes.  We rely on the host mmu for read/write 
permission for user-only.  For now -- changing that is a long term goal.


> Question:
> I see that `riscv_env_mmu_index` could be called from a bunch of places in (like
> `accel/tcg/ldst_common.c.inc` as well. Does it exclude loads, stores which calculate mmu
> indexes during translation (like shadow stack load, stores) ?

It means you cannot use the legacy interfaces for the shadow stack.
The current interfaces:

  *        cpu_ld{sign}{size}{end}_mmuidx_ra(env, ptr, mmu_idx, retaddr)
  *        cpu_ld{sign}{size}{end}_mmu(env, ptr, oi, retaddr)
...
  *        cpu_st{size}{end}_mmuidx_ra(env, ptr, val, mmu_idx, retaddr)
  *        cpu_st{size}{end}_mmu(env, ptr, val, oi, retaddr)

take the mmu_idx as a parameter.

But as it happens, the shadow stack instructions are simple enough to implement all 
inline, so you won't need to call the out-of-line load/store functions from cpu helpers.


r~

