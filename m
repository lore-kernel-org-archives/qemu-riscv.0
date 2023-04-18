Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pogiO-0003bF-AR
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 04:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogiN-0003b2-5L
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:29:27 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogiK-0007Oe-HO
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:29:26 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id n203so16651417ybg.6
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681806563; x=1684398563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7mX+Bj0jEr5PxvBnFl7R7rdC3vWOEW5rSv9fIGu4QTw=;
 b=Azmnl59q4fGlJi40PQlw4+Lk9GzAb6nL7rFONCkqttsCwA/S4OQsCjD6FTB2cmrPc6
 BuBvjgACDQJOFf3n0p3a9qQx65Z7ZNFJKYnyPrvBzr4nDCP7NF7Hn44V9IovAArxNek3
 RqHJs4KYBselLyjNiXHzFOvlxKy5GBeRxsDJUg7R/TL8qlFXBCrsY5akv4pteUFxOFS5
 4lkyL7aaUR0pLqryfBLjVJL0hcDuusNt2sE3i5bVj6Ns+vukkwto8v1/VdPoA9KLoXZ7
 hgbQwz6mRMGAexO5lom4QtUnTdATsE9ZNnUUQXxGWwge/UEtZx9SWm+tanMCUQA4fbMA
 lvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681806563; x=1684398563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7mX+Bj0jEr5PxvBnFl7R7rdC3vWOEW5rSv9fIGu4QTw=;
 b=Q3ZPL7bNrSs88rzPcLZv03CDjmUqYT2kKQIM/vj/rm/sJ1ISSH5zGRJ39Kk9YzUTw0
 5pz4OeomfDFCtM33q++MBmJJsWHyWK+V/MaGnPb08w2brQJ/xC56juaJMarH4BRcXmzH
 rTyDJ21Kvv/hZcu8oJ5B/9jhpFgOLWcgrQERKcdgEKCk/oGzQVSXEkTo2le0SOFY40Kq
 ktkVACKzuHfGlvQqP/Uvn9LHnYlJZL+pxKoxRlriIuUnBHz2IIvi4BhlxdYp1ty+uXMC
 Yt+bYIcDWB+yVZc4Dm8nspm80zh9yCNR6diDc9UZoIV9cca+0CW8wAgn9VBUXXMSvryB
 M0og==
X-Gm-Message-State: AAQBX9fN2yaCE2H6jRTS83z8YGg5jiV/MP5uLvq0JE8aD7ZP+4HsaQB8
 Ov1OuCYqlDAnEd6EFm404Tx5OA==
X-Google-Smtp-Source: AKy350Zebgq93TLX0XQfVLljkqUahVOlLxnE9RM5CTTMuQ+jTKwWr+v2wV9nHWXaAWRQOa1YwxQ01g==
X-Received: by 2002:a25:6741:0:b0:b8f:5639:cb8a with SMTP id
 b62-20020a256741000000b00b8f5639cb8amr16931435ybc.9.1681806563318; 
 Tue, 18 Apr 2023 01:29:23 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 189-20020a8117c6000000b00545a08184b1sm3632502ywx.65.2023.04.18.01.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:29:22 -0700 (PDT)
Message-ID: <2f3af482-1dce-ff3b-47d3-db3142f4cc29@linaro.org>
Date: Tue, 18 Apr 2023 10:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 09/17] target/riscv: Add Zvbb ISA extension support
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 William Salmon <will.salmon@codethink.co.uk>
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
 <20230417135821.609964-10-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417135821.609964-10-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 18 Apr 2023 08:29:27 -0000

On 4/17/23 15:58, Lawrence Hunter wrote:
> diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
> index ac7d28c251e..322dcc0687f 100644
> --- a/accel/tcg/tcg-runtime-gvec.c
> +++ b/accel/tcg/tcg-runtime-gvec.c
> @@ -550,6 +550,17 @@ void HELPER(gvec_ands)(void *d, void *a, uint64_t b, uint32_t desc)
>       clear_high(d, oprsz, desc);
>   }
>   
> +void HELPER(gvec_andsc)(void *d, void *a, uint64_t b, uint32_t desc)
> +{
> +    intptr_t oprsz = simd_oprsz(desc);
> +    intptr_t i;
> +
> +    for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
> +        *(uint64_t *)(d + i) = *(uint64_t *)(a + i) & ~b;
> +    }
> +    clear_high(d, oprsz, desc);
> +}
> +
>   void HELPER(gvec_xors)(void *d, void *a, uint64_t b, uint32_t desc)
>   {
>       intptr_t oprsz = simd_oprsz(desc);
> diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
> index e141a6ab242..d0862004831 100644
> --- a/accel/tcg/tcg-runtime.h
> +++ b/accel/tcg/tcg-runtime.h
> @@ -217,6 +217,7 @@ DEF_HELPER_FLAGS_4(gvec_nor, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>   DEF_HELPER_FLAGS_4(gvec_eqv, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>   
>   DEF_HELPER_FLAGS_4(gvec_ands, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
> +DEF_HELPER_FLAGS_4(gvec_andsc, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)

The accel/tcg/ patch must be separate.
And I think "andcs" is the proper name.

> +static void tcg_gen_gvec_andsc(unsigned vece, uint32_t dofs, uint32_t aofs,
> +                               TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
> +{
> +    static GVecGen2s g = {
> +        .fni8 = tcg_gen_andc_i64,
> +        .fniv = tcg_gen_andc_vec,
> +        .fno = gen_helper_gvec_andsc,
> +        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
> +    };
> +
> +    g.vece = vece;
> +
> +    tcg_gen_dup_i64(vece, c, c);
> +    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &g);
> +}

This belongs in tcg-op-gvec.c.
The .vece member should be constant as MO_64.
See tcg_gen_gvec_ands from whence you copied this.

> +static void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
> +                               TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
> +{
> +    TCGv_i32 tmp = tcg_temp_new_i32();
> +    tcg_gen_sub_i32(tmp, tcg_constant_i32(1 << (vece + 3)), shift);
> +    tcg_gen_gvec_rotls(vece, dofs, aofs, tmp, oprsz, maxsz);
> +}

This could plausibly go into tcg-op-gvec.c as well.
To be followed up by proper backend support (which was omitted before because there were 
no users).


r~


