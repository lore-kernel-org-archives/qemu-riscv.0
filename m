Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyIZx-0000UK-29
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 13:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyIZv-0000TT-Jd
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 13:30:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyIZs-0007BE-Tl
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 13:30:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id d1so1336388plr.8
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H+N05Q6iH/7kKItLonUDpGJYS7Eiq7WvbdCHpHhINzs=;
 b=JSr4x+5m1U/ypd5X5CUc6NSr1MfYj89Uzf0NXzVpqOjtVEiSPvNpAUHW3NHuY7zE1Q
 d6+gRXti4Rhs4cZIRLZsWIxIZoLMvc8lSWFezZbisJ4IGHn5dRLGEGCPXNu7QK89LQuB
 Bu7K/6rqZz3FLTJ/aMFhBuZt17R+K2U5NwQ/6xt8T2p70FBmmN0NA0DSN4QpklTe+pfF
 1Cs9FSK3tI4NaK6H4WZisZ0MxejwJ32Zdgy8LOqH5kq0AGgATEt+uFuYSZTXy+SKE79B
 n4qUcWyeUX4edsjbYxw2JgD6Th28fypIQ056ojw5jKSoP4sKwyQcuaMUBBQwVJAdufS+
 Vuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H+N05Q6iH/7kKItLonUDpGJYS7Eiq7WvbdCHpHhINzs=;
 b=PUZqR7dyv/lQYxIR38C2zP41YKJnlid+1HEWXswLJTsQqswr3ZiSTSb6WIN97ZmdNZ
 7aeQXqy23ZjhRvlckO+iUPg74DcDNuAoDlsJiGFm3Dfd/zBQliGvAuet4EXyFjCRq9RP
 N7Cs4+2ARbb/FRV+jAwioKRlGmOKX9kLMUyxyJje4PNWzFLZPGDJ8XxSdZqOMEQpscCY
 r8HZT1H4gdirML5XQOENHqGJPjOxa9zHQXwDwyt+kib2ZV0Wkq9U28BXw/YOIpqgY6q+
 zjOj0Nufy62ENp6rbk7RxjG6WNdqh3oJLTyAMv1lmUuNbJYuc25gLKp5ua5XmRr1Lxqz
 cqXw==
X-Gm-Message-State: AOAM531FRdDE4Nk3o8jOB87mNeWUty8P+8qra9WhSwnuqGqoH7vY5sRZ
 yqUMlhD9y1kiSIQohnAGi/lAlA==
X-Google-Smtp-Source: ABdhPJyl35v5cBnVhifA7huu1ZKUDPTw+l5gMyelsaBINkonjrsFJ3yV5vcaiJyRzFAhY5npSAx8hw==
X-Received: by 2002:a17:90b:338d:: with SMTP id
 ke13mr470419pjb.60.1595439047284; 
 Wed, 22 Jul 2020 10:30:47 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 x10sm211365pfp.80.2020.07.22.10.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 10:30:46 -0700 (PDT)
Subject: Re: [RFC v2 15/76] target/riscv: rvv-0.9: add fractional LMUL
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-16-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0d9b56e-5d8a-83c9-59b0-88b842380487@linaro.org>
Date: Wed, 22 Jul 2020 10:30:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-16-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 22 Jul 2020 17:30:51 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
>  FIELD(VTYPE, VLMUL, 0, 2)
>  FIELD(VTYPE, VSEW, 2, 3)
> -FIELD(VTYPE, VEDIV, 5, 2)
> -FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
> +FIELD(VTYPE, VFLMUL, 5, 1)
> +FIELD(VTYPE, VEDIV, 8, 9)
> +FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
>  FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)

The ediv definition is wrong -- should be 8, 2.


> @@ -37,4 +38,10 @@ target_ulong fclass_d(uint64_t frs1);
>  #define SEW32 2
>  #define SEW64 3
>  
> +/* table to convert fractional LMUL value */
> +static const float flmul_table[8] = {
> +    1, 2, 4, 8,      /* LMUL */
> +    -1,              /* reserved */
> +    0.125, 0.25, 0.5 /* fractional LMUL */
> +};
>  #endif

Don't define data in a header file; only declare it.

> @@ -60,6 +60,9 @@ typedef struct DisasContext {
>      /* vector extension */
>      bool vill;
>      uint8_t lmul;
> +    float flmul;
> +    uint8_t eew;
> +    float emul;

Why are you adding floating-point values to DisasContext?

> +static inline float vext_vflmul(uint32_t desc)
> +{
> +    uint32_t lmul = FIELD_EX32(simd_data(desc), VDATA, LMUL);
> +    return flmul_table[lmul];
>  }

And in the helpers?  Are you planning on some sort of path through int -> float
-> int for computation?  That seems questionable.


r~

