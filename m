Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhUpv-0008CC-GN
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUpi-000888-7b
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:46:33 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:39915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUpg-0005w1-FK
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:46:29 -0400
Received: by mail-qv1-xf35.google.com with SMTP id k29so10901819qve.6
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uLm6eU17Tsse/uNTiLZC1F9/W+U4Z7RCU8VIDvM49NI=;
 b=DsIlxiUf3IpuohFeryMexpUZaZpJfq9cRUr0VgzN+U82+0+gjbroQJTg5NIAkAtRXw
 mULIqs6NGe9M0bOXFZC5ujOsJwq7kWnaXnMpL0ex7lRDD1s75oLl/Wkzky06RGd6rVMT
 3yXju0nGIzCxyTIKpZQnJKF/dWRNFiAN/NOyEMGyNFafDazz2zU9PEtK8Sd7Bx5af6NJ
 40pWUclcj3A3RRGJCDt2nCKidmf7W9If6saLPoRvcBiVcFEx+RKYB3sj6HobK3++AzAD
 yLuVzXCbWqhFzVn73Aj4myogw55dCiL7ZY0hXMaFVr9qZH43HQeUlrn8hXtzMNgBemqo
 lrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uLm6eU17Tsse/uNTiLZC1F9/W+U4Z7RCU8VIDvM49NI=;
 b=oD6f8Iz9rwIXsQ2Et2PMD1AdGrQAOSwUo5aJBo4cOgo5VL+EkJ9fRixVdCiZHUUcng
 4aceG2HPKDPzdbmtIhGwMNJvAl2vsb1LQNOMhmVAq5frXWbjbCqqojPt6lle3F///IF8
 S3zPzHmmNyVvnhfGQj5IqQpzofkSbwyP7dfLu8RyCNf6rNnA0OcMhs4bSJt1jwj6hcmu
 /MXP9aJIJMZbu8vI8tjXhTPjLGNukxKGgP5SZi0tePZk4TZ6mU9GBUA5uH0daKY4j1xG
 sZG+AzBsqUf7vR+OvOfV5drozJQWFC+jM5ZczKuXd0JC7ZcMPniDtJ0lgli56tLc3k+C
 pebg==
X-Gm-Message-State: AOAM533ckCcSt9eQUY2dxALUtYDZusgtGl/Ze759hJHDJUgB8Xj9WTK1
 yYviCfnKAgr+pNxLMqrN4vXdIQ==
X-Google-Smtp-Source: ABdhPJy/TuWu7QWag3nXE/BbtD5Xg0vnJpPM0rkRxwdQYvcaHUqmS42QVPLMWozU/fJIBlvW5nxwXQ==
X-Received: by 2002:a05:6214:234d:: with SMTP id
 hu13mr17382390qvb.7.1635763587274; 
 Mon, 01 Nov 2021 03:46:27 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y6sm1289011qkp.116.2021.11.01.03.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:46:26 -0700 (PDT)
Subject: Re: [PATCH 05/13] target/riscv: Calculate address according to ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-6-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a6ceb4fb-6a29-066b-23dd-114494d19e59@linaro.org>
Date: Mon, 1 Nov 2021 06:46:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-6-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
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
X-List-Received-Date: Mon, 01 Nov 2021 10:46:34 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>   static bool trans_fld(DisasContext *ctx, arg_fld *a)
>   {
> -    TCGv addr;
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv addr = temp_new(ctx);
>   
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVD);
>   
> -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> -    if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> -        tcg_gen_addi_tl(temp, addr, a->imm);
> -        addr = temp;
> -    }
> +    tcg_gen_addi_tl(addr, src1, a->imm);
>       addr = gen_pm_adjust_address(ctx, addr);

No change here,

>   static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>   {
> -    TCGv addr;
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv addr = temp_new(ctx);
>   
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVD);
>   
> -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> -    if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> -        tcg_gen_addi_tl(temp, addr, a->imm);
> -        addr = temp;
> -    }
> +    tcg_gen_addi_tl(addr, src1, a->imm);
>       addr = gen_pm_adjust_address(ctx, addr);

Or here.

>   static bool trans_flw(DisasContext *ctx, arg_flw *a)
>   {
>       TCGv_i64 dest;
> -    TCGv addr;
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv addr = temp_new(ctx);
>   
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVF);
>   
> -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
> -    if (a->imm) {
> -        TCGv temp = temp_new(ctx);
> -        tcg_gen_addi_tl(temp, addr, a->imm);
> -        addr = temp;
> +    tcg_gen_addi_tl(addr, src1, a->imm);
> +    if (ctx->ol == MXL_RV32) {
> +        tcg_gen_ext32u_tl(addr, addr);
>       }
>       addr = gen_pm_adjust_address(ctx, addr);

But you did here.

(1) OL is wrong, use XL.
(2) The address adjustment should be done in some common routine.
     Probably rename gen_pm_adjust_address to make it more generic,
     then add the XL truncation there.


r~

