Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nHhNg-0007nY-5n
	for mharc-qemu-riscv@gnu.org; Wed, 09 Feb 2022 02:27:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHhNf-0007lC-3u
 for qemu-riscv@nongnu.org; Wed, 09 Feb 2022 02:27:11 -0500
Received: from [2607:f8b0:4864:20::62d] (port=40617
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHhNd-00015G-Cx
 for qemu-riscv@nongnu.org; Wed, 09 Feb 2022 02:27:10 -0500
Received: by mail-pl1-x62d.google.com with SMTP id y17so1474211plg.7
 for <qemu-riscv@nongnu.org>; Tue, 08 Feb 2022 23:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q6gzRXNOf+PUBICx0GG5V7D9iWjFTVqZPaDs27uYGJw=;
 b=sU5mWEmgVoy4xQgqTfTRCAufaD2tugSTl6nsV59/McIRrPbnFM/1rJzFj6jr0rjY1o
 NZcMykicrtGzgcLjeb7nhKoFP5reffOFT0jiWKlElfh67H5Cactw2MgImOTD+heu/dL4
 BOP1Xx7j0WiIBeNKS3JFDJMqQZ9iNwzHNkLRu1BhctZkGbS+JlMHGGb8XJAJe+2agDsP
 NwSJ3cmlN9hXqOCGWbTU/RlVua/BqRQ41SM2Yy0gXrLXKVVX+sGoXjxDW1IQ4GubTrhK
 9UuS3moLzjTUFVt1yBErySPh+MsoK/fXrejyDwUVqTca3ovx9snakNyW9VB12MU7NdOq
 uhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q6gzRXNOf+PUBICx0GG5V7D9iWjFTVqZPaDs27uYGJw=;
 b=B24VU3W9ReIlPHqgsYfL0Qrn0iQg5fB1bvwLRYwfr1QEn31GU8g0SYcEuwKEgHSzHK
 St9RiRCPWxZ4wXA14k7+jXhRWGBNBkx8lsHwYozxw3WBb56mHM5VbuD2tbZZMx9jiuHp
 0k3V6NcyIpzGI1zh2whX9IfsNGqaeVPwEtFOCmt9XXdb7AxkcRUkUBS9wZLQ9a//3KCM
 UCb02HBd7VgVwzWxO4t+19ZozQ6GA0LFMh1uA9xXrlgL/XOo0Am8EoiVKck86kYglDJM
 rPk7hOw0sb4DFIIn6cxyZROKdQUEr3yhGqrBNwmipbj/2mF7FyXG/3LzktCCc6YSVt3Z
 dkyw==
X-Gm-Message-State: AOAM532PvUphWJR+yjCqEWPCwUoSiQMvIeMkLIxhIw44i9z0ZIjvtkyh
 WvQLmrCvx3zFlHyc5YxoKUQ3Hw==
X-Google-Smtp-Source: ABdhPJwLnjNs20nxUxIZPxOq22x1qbOnuIa59n5rYrkQ/ASUTbY86aQVnOXwL5IHO7aNQlkf/+OdSQ==
X-Received: by 2002:a17:903:2cc:: with SMTP id
 s12mr872724plk.130.1644391624868; 
 Tue, 08 Feb 2022 23:27:04 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id w19sm19584814pfu.47.2022.02.08.23.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 23:27:04 -0800 (PST)
Message-ID: <8c4538cc-fe1b-1352-9feb-8aaacfdf2ed7@linaro.org>
Date: Wed, 9 Feb 2022 18:26:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/riscv: Call probe_write() before atomic operations
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 bmeng.cn@gmail.com, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
References: <20220209054825.345376-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209054825.345376-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 09 Feb 2022 07:27:11 -0000

On 2/9/22 16:48, Alistair Francis wrote:
> Note that this only fixes the fault for memory regions. I/O and
> non-existant regions will still trigger a load fault.
...
> +void helper_atomic_check(CPURISCVState *env, target_ulong address,
> +                         int width, int mmu_idx)
> +{
> +    probe_write(env, address, width, mmu_idx, GETPC());
> +}

Note that you could use probe_access_flags, whose return value is a mask.  If it includes 
TLB_MMIO, you know that the physical address does not contain ram, but you still do not 
know if it is unmapped or true mmio, since unmapped gets unassigned_io_ops.  It's probably 
not *that* hard to find out one way or another, but it might also be reasonable to set a 
flag to communicate with your do_transaction_failed hook.


>   static bool gen_amo(DisasContext *ctx, arg_atomic *a,
>                       void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
> -                    MemOp mop)
> +                    TCGv_i32 width, MemOp mop)
>   {
>       TCGv dest = dest_gpr(ctx, a->rd);
>       TCGv src1 = get_address(ctx, a->rs1, 0);
>       TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +    TCGv_i32 mem_idx = tcg_constant_i32(ctx->mem_idx);
> +
> +    gen_helper_atomic_check(cpu_env, src1, width, mem_idx);
>   
>       func(dest, src1, src2, ctx->mem_idx, mop);
>   
> @@ -105,55 +108,64 @@ static bool trans_sc_w(DisasContext *ctx, arg_sc_w *a)
>   static bool trans_amoswap_w(DisasContext *ctx, arg_amoswap_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, tcg_constant_i32(4),
> +                   (MO_ALIGN | MO_TESL));

The width is already stored in the MemOp argument that you're passing around.
I think you should do

     TCGv_i32 width = tcg_constant_i32(memop_size(mop));

there in gen_amo, and not change the callers at all.


r~

