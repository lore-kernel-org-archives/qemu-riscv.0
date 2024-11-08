Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E880D5E149
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 09:12:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t9L2H-0003ZR-QN; Fri, 08 Nov 2024 04:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t9L26-0003YE-8s
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2024 04:11:59 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t9L23-0003Re-PI
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2024 04:11:57 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so2925651e87.2
 for <qemu-riscv@nongnu.org>; Fri, 08 Nov 2024 01:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731057113; x=1731661913; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6KVl+v+LdtZ3Nb1iatS08kRPIRMi9Ov6Rl9pQy3IEXo=;
 b=PlG27JPetE+Y9XQbIfCdPOV40jJUZR0jyEU2dT3Be4bkemYEoaSd7eKoSD5VH21dB4
 Ec2T8UpHEIOKEGpyjl0kE5vgAB4b9f4/K2CR7KOVwmfQRVbFUlVX9xXP9SQ0FxiHerqU
 AJaK2HMxYaddpXZmk/IOVFawHiG0wGGw4r2/Ee//mIhSOi8L0kuZa2bwm/Fo3OQFf9Lg
 K7GLayFNy8W8aoiJjeM+UTNYWypLXRHNKqlP42Cblj2Yq22FYtyq/g5C8vmBPZ6+OybY
 ieVugKqaAlfHlNl5Tj44JoWAbDrVU5WMfxiGuX1mJhAYoJ0rx5Zn25pKXozDgbBq1Tp3
 ltHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731057113; x=1731661913;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6KVl+v+LdtZ3Nb1iatS08kRPIRMi9Ov6Rl9pQy3IEXo=;
 b=umdrzsB1Ce4ulP9VIAVd2Mp5NVrOqdYu4hF9c49ps602yQavDNVVoJD4mG2wNl3ii0
 FHy9v7mLc0VvV5XbH6snauYO+FTMnV4yeHvcNJBbVwCbrwT6dIVQGb0wsMAKK3kjrzGZ
 UGoS/FWw8Dcy7179/F10YEbE5IKrxRpWrQ8XhHZsNY1cQRaVbyzBlDDuSmE69ijxKzD0
 0CBLYggFMHFjbSNSfvGFtXssQI2gQfzezupqXTS8ndCggbYlKbbxxWQvQIyK89gBMx67
 m/Hqv480cdJaRZcUG1p1CnU+07GVX4de+KSs4s7MqBaKVi8SHAtvUsggryFe1ev01lOG
 KFYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbMcEFyjjMnEMwfrad834r2o1Zmpxjx9PL1pU8i2P4TNcYM00Nf+Hl+LS821ptwVf0zzSZ5NwDTP+R@nongnu.org
X-Gm-Message-State: AOJu0YwKPn4vlNwvxsNRySLbv5asMJgo556FW5tSBGAvHmbDjB/rIFXc
 nHc3ekfw02zWhABUl37H3Io0JdD3XgMR/FSLcOj0cQAQwkcLjNTwWzlteUI9JlQ=
X-Google-Smtp-Source: AGHT+IEkI8S4VbJmJxdETUGITZnNslcOn1qTC5q0dJ6Dg8u17W4E7CQr3s/9V5JCDXFl0no34lYRbw==
X-Received: by 2002:a05:6512:b17:b0:535:6951:9e1c with SMTP id
 2adb3069b0e04-53d862c6dffmr1825077e87.15.1731057111176; 
 Fri, 08 Nov 2024 01:11:51 -0800 (PST)
Received: from [172.20.146.106] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a979sm207605866b.71.2024.11.08.01.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 01:11:50 -0800 (PST)
Message-ID: <230f448b-07f4-413c-9be6-e10a8e55be73@linaro.org>
Date: Fri, 8 Nov 2024 09:11:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC v4 2/2] target/riscv: rvv: improve performance of RISC-V
 vector loads and stores on large amounts of data.
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Paolo Savini <paolo.savini@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>
References: <20241029194348.59574-1-paolo.savini@embecosm.com>
 <20241029194348.59574-3-paolo.savini@embecosm.com>
 <7a046c99-c4e7-4395-8dc9-9139e9bfba06@linaro.org>
 <96e7601d-14aa-4741-8f6a-ae4a1c397a44@embecosm.com>
 <54c99505-21ef-422c-a7fe-a2d7dabc3d6c@linaro.org>
 <6b06b532-c53f-4b5b-b65d-d54d7c746ffc@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <6b06b532-c53f-4b5b-b65d-d54d7c746ffc@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/7/24 12:58, Daniel Henrique Barboza wrote:
> On 11/4/24 9:48 AM, Richard Henderson wrote:
>> On 10/30/24 15:25, Paolo Savini wrote:
>>> On 10/30/24 11:40, Richard Henderson wrote:
>>>>     __builtin_memcpy DOES NOT equal VMOVDQA
>>> I am aware of this. I took __builtin_memcpy as a generic enough way to emulate loads 
>>> and stores that should allow several hosts to generate the widest load/store 
>>> instructions they can and on x86 I see this generates instructions vmovdpu/movdqu that 
>>> are not always guaranteed to be atomic. x86 though guarantees them to be atomic if the 
>>> memory address is aligned to 16 bytes.
>>
>> No, AMD guarantees MOVDQU is atomic if aligned, Intel does not.
>> See the comment in util/cpuinfo-i386.c, and the two CPUINFO_ATOMIC_VMOVDQ[AU] bits.
>>
>> See also host/include/*/host/atomic128-ldst.h, HAVE_ATOMIC128_RO, and atomic16_read_ro.
>> Not that I think you should use that here; it's complicated, and I think you're better 
>> off relying on the code in accel/tcg/ when more than byte atomicity is required.
>>
> 
> Not sure if that's what you meant but I didn't find any clear example of
> multi-byte atomicity using qatomic_read() and friends that would be closer
> to what memcpy() is doing here. I found one example in bdrv_graph_co_rdlock()
> that seems to use a mem barrier via smp_mb() and qatomic_read() inside a
> loop, but I don't understand that code enough to say.

Memory barriers provide ordering between loads and stores, but they cannot be used to 
address atomicity of individual loads and stores.


> I'm also wondering if a common pthread_lock() wrapping up these memcpy() calls
> would suffice in this case. Even if we can't guarantee that __builtin_memcpy()
> will use arch specific vector insns in the host it would already be a faster
> path than falling back to fn(...).

Locks would certainly not be faster than calling the accel/tcg function.


> In a quick detour, I'm not sure if we really considered how ARM SVE implements these
> helpers. E.g gen_sve_str():
> 
> https://gitlab.com/qemu-project/qemu/-/blob/master/target/arm/tcg/translate-sve.c#L4182

Note that ARM SVE defines these instructions to have byte atomicity.


r~

