Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7keu-00036f-Lx
	for mharc-qemu-riscv@gnu.org; Fri, 28 Feb 2020 13:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7keo-00032g-VH
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2020 13:46:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7ken-0005PH-NY
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2020 13:46:42 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43324)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7ken-0005KN-Hp
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2020 13:46:41 -0500
Received: by mail-pl1-x62f.google.com with SMTP id p11so1571491plq.10
 for <qemu-riscv@nongnu.org>; Fri, 28 Feb 2020 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lkO3eDsnSCHgk2ZSfYpnMjFYTTSFiLrheSd6RGfKT64=;
 b=ZojLvOytMuu+Z0xhZl5fF6z2jDwHrM42ahTeTJy86O8MR9rt0ziQu8a+nRgOtv0lZv
 K/OkvFCfpX1fC5zS98xovRp3N6lr/8+ELsV2RAwBcNwfI0hW1Ce8uoCGfcLM8TgWJQav
 dYgGqoupvAUQG3TNU3NeKbaKCsZzrcMaA10QkFv9pL/f758uKdgtKtKuLmEtBSe+m9ft
 pEo6rJoSdZZy2kDBU6ydV1ExlcNOEtFiv61r1lY3Pdmc12GPH5CpqgOHj9uyob76f/6K
 X96ygAIR1RxZwbl4zV6kY/oAl/AwGiEI/Ebc+rR1rOsbbWt5s+R+qlAsmWBznRQ2xODc
 Gt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lkO3eDsnSCHgk2ZSfYpnMjFYTTSFiLrheSd6RGfKT64=;
 b=GIXLH/a8pImTMRyonodCHT6ag+44RXpGRYvGWVKvboxhC2TvEk8tV9gq/q/x6ZMd6u
 OVs/+9WIjlGOPe3FaHG67rGqfyKZTo38Zgxy3tpJfDnIMCKlbI0zT9xzr4zHTEBGv1kR
 yJMcTDnXGWhBKCsdSEU5lSQRratr453V9Hi7Ybhtl6Mptbcu/jcKVuz3oskS7RBZifRK
 wkAPF7nMi9lMEo5zTWyyCgvCk+NWpczITLHP1yM8Cye3lwNf+M234LE64H2UPE4sY6gB
 O6QKot7xVJo06tWhcjUmOlrk4umFH+yt23KN12zCDM60XpO9b7CurEgzXphAyqWsTUH8
 3BzA==
X-Gm-Message-State: APjAAAWp9AlqEIxVhwwLJkhAZzVGvFDXmZhfwEVqqKPWaX7i/VXDUfPa
 /vT1S0b1NEd9VQzAW92ljn/QfencBEM=
X-Google-Smtp-Source: APXvYqzo+n98ff2PEV8rUSbp5XXgxtcE/PD3nZEOhyQO6asEmCU0fqjYbSe2xnZrX3UFu2n9x6VvSA==
X-Received: by 2002:a17:902:aa04:: with SMTP id
 be4mr5553328plb.41.1582915599846; 
 Fri, 28 Feb 2020 10:46:39 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 e12sm1727641pgb.67.2020.02.28.10.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 10:46:39 -0800 (PST)
Subject: Re: [PATCH v4 5/5] target/riscv: add vector amo operations
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 linux-csky@vger.kernel.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200225103508.7651-1-zhiwei_liu@c-sky.com>
 <20200225103508.7651-6-zhiwei_liu@c-sky.com>
 <03bf483e-d6bb-9de4-9934-12bfa7093ad3@linaro.org>
 <6d008841-4356-b0f1-ece2-df8323ad8254@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3a614d1-aa54-046b-2c14-b6e517f1fbf0@linaro.org>
Date: Fri, 28 Feb 2020 10:46:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6d008841-4356-b0f1-ece2-df8323ad8254@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62f
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
X-List-Received-Date: Fri, 28 Feb 2020 18:46:44 -0000

On 2/28/20 1:19 AM, LIU Zhiwei wrote:
>>> +#define GEN_VEXT_AMO_NOATOMIC_OP(NAME, ETYPE, MTYPE, H, DO_OP, SUF)      \
>>> +static void vext_##NAME##_noatomic_op(void *vs3, target_ulong addr,      \
>>> +        uint32_t wd, uint32_t idx, CPURISCVState *env, uintptr_t retaddr)\
>>> +{                                                                        \
>>> +    ETYPE ret;                                                           \
>>> +    target_ulong tmp;                                                    \
>>> +    int mmu_idx = cpu_mmu_index(env, false);                             \
>>> +    tmp = cpu_ld##SUF##_mmuidx_ra(env, addr, mmu_idx, retaddr);          \
>>> +    ret = DO_OP((ETYPE)(MTYPE)tmp, *((ETYPE *)vs3 + H(idx)));            \
>>> +    cpu_st##SUF##_mmuidx_ra(env, addr, ret, mmu_idx, retaddr);           \
>>> +    if (wd) {                                                            \
>>> +        *((ETYPE *)vs3 + H(idx)) = (target_long)(MTYPE)tmp;              \
>> The target_long cast is wrong; should be ETYPE.
> "If the AMO memory element width is less than SEW, the value returned from memory
>  is sign-extended to fill SEW"
> 
> So just use (target_long) to sign-extended. As you see, instructions like
> 
> vamominud
> 
> have the uint64_t as ETYPE.  And it can't sign-extend the value from memory by
> (ETYPE)(MTYPE)tmp.

Casting to target_long doesn't help -- it becomes signed at a variable size,
possibly larger than MTYPE.

In addition, I think you're performing the operation at the wrong length.  The
text of the ISA document could be clearer, but

  # If SEW > 32 bits, the value returned from memory
  # is sign-extended to fill SEW.

You are performing the operation in ETYPE, but it should be done in MTYPE and
only afterward extended to ETYPE.

For minu/maxu, you're right that you need an unsigned for the operation.  But
then you need a signed type of the same width for the extension.

One possibility is to *always* make MTYPE a signed type, but for the two cases
that require an unsigned type, provide it.  E.g.

#define GEN_VEXT_AMO_NOATOMIC_OP(NAME, ESZ, MSZ, H, DO_OP, SUF)
static void vext_##NAME##_noatomic_op(void *vs3,
    target_ulong addr, uint32_t wd, uint32_t idx,
    CPURISCVState *env, uintptr_t retaddr)
{
    typedef int##ESZ##_t ETYPE;
    typedef int##MSZ##_t MTYPE;
    typedef uint##MSZ##_t UMTYPE;
    ETYPE *pe3 = (ETYPE *)vs3 + H(idx);
    MTYPE a = *pe3, b = cpu_ld##SUF##_data(env, addr);
    a = DO_OP(a, b);
    cpu_st##SUF##_data(env, addr, a);
    if (wd) {
        *pe3 = a;
    }
}

/* Signed min/max */
#define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
#define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))

/* Unsigned min/max */
#define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
#define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)

GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_d, 64, 32, H8, DO_MAXU, l)
GEN_VEXT_AMO_NOATOMIC_OP(vamomaxud_v_d, 64, 64, H8, DO_MAXU, q)


>> The missing aligned address check is the only remaining exception that the
>> helper_atomic_* functions would raise, since you have properly checked for
>> read+write.  So it might be possible to get away with using the helpers, but I
>> don't like it.
> Do you mean write my own helpers to implement atomic operations?
> 
> What's the meaning of " but I don't like it. "?

I don't like re-using helpers in an incorrect way.

>> But I do think it would be better to write your own helpers for the atomic
>> paths.  They need not check quite so much, since we have already done the
>> validation above.  You pretty much only need to use tlb_vaddr_to_host.
>>
>> If that gets too ugly, we can talk about rearranging
>> accel/tcg/atomic_template.h so that it could be reused.
> Good idea.  Perhaps use tlb_vaddr_to_host instead of atomic_mmu_lookup
> to define another macro like GEN_ATOMIC_HELPER?
>> Alternately, we could simply *always* use the non-atomic helpers, and raise
>> exit_atomic if PARALLEL.
> Yes, it's the simplest way.
> However I prefer try to define something like GEN_ATOMIC_HELPER in
> vector_helper.c.

I'll think about this some more.
In the short-term, I think non-atomic is the best we can do.


r~

