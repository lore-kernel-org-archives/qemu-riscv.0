Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKQjE-0003g5-Et
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 16:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKQjD-0003f4-2J
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 16:21:15 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKQjB-0006jx-J7
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 16:21:14 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 207so12120593pfv.5
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 13:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rYGKGO1HsVl+R3QDbx/CEvCzK1aj3hBceg6yCyxSRPo=;
 b=hU4qo4sQkj9t3FAYiv65Be7Boa93RjXxc8bf8Wd6Mzq46BOz86wAZhgfNek7BVs7Lq
 3FfNuCE+6fKsUu+6qvJjmV/b5MpPBRs66vcnCa6dfvz/KipXu6KA6WH/jVZYACfJ9ihY
 9IV6drRNmos5d55QYBMCm9OhccLUtux0BHgvk/FUJgLQ3CSjx9I7z1kqxCS+i4x5czb+
 ZQ2L+vYaZlSka8C8qlWkqq4CcNqqL/BL5+8+NK/Oo8qiYjTPogKnFT8iDw2Rnmm3gGAX
 dP1rr7k8DyEW8MhIw2WLKlB8Qvibez/WcM/m76P72nJlSlgRaFaJNUCuOV5u718jUotw
 Bbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rYGKGO1HsVl+R3QDbx/CEvCzK1aj3hBceg6yCyxSRPo=;
 b=WONx/9HfDq24CtFlwIn7Y09eCH1rpB50q0pJHKT0UoZrrxjZ+BTMMJ8AyaCUeWoU+m
 CW9HuU9fIK9b2wBxjrwnBR9Tb15WhD+FX+WfMjSEjpBGCGyfOhJCuDM6Ydgm+fPR1cDo
 WpGw6emJibaE8D54hKnjC3/hd4Xwh0Y0xhOAbyb4CrggInJhv8spdf/6bciO47x3SN7w
 740BkbCPZEhWjTPwUmrobO0rhBwKEmvhGloDSy/IeLEvrpHbQ+x6DrIs7zlbzgmTyDfI
 7PNVR1zgf2KnI9G+88WLlHwRYbiNGt+lCFx0WlQFQoKpEaBAtjBSl+tWQCYbbX3uFv9E
 xw3A==
X-Gm-Message-State: AFqh2kpa3AIZx0L3jOGbwt8yuMGYzTnFsYAAmTro1Ce3vD3FfB2PuaN7
 GtSSW2dlgI/n3i/G5dhc0TjKxA==
X-Google-Smtp-Source: AMrXdXuwxHFP1TsjkmqE+jTV72EW5dTbC5iSrBgKjKVpIeWzk7Ba9pFcsJ7vlyx02zgI4pKyWA52KA==
X-Received: by 2002:a05:6a00:1d23:b0:58d:a91d:e9f8 with SMTP id
 a35-20020a056a001d2300b0058da91de9f8mr25464968pfx.18.1674595272021; 
 Tue, 24 Jan 2023 13:21:12 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p186-20020a62d0c3000000b0058abddad316sm2033267pfg.209.2023.01.24.13.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 13:21:11 -0800 (PST)
Message-ID: <3d864ae7-5430-8db9-f91c-fd24f428b04d@linaro.org>
Date: Tue, 24 Jan 2023 11:21:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 09/14] RISC-V: Adding T-Head MemIdx extension
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-10-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230124195945.181842-10-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Tue, 24 Jan 2023 21:21:15 -0000

On 1/24/23 09:59, Christoph Muellner wrote:
> +/* XTheadMemIdx */
> +
> +/*
> + * Load with memop from indexed address and add (imm5 << imm2) to rs1.
> + * If !preinc, then the load address is rs1.
> + * If  preinc, then the load address is rs1 + (imm5) << imm2).
> + */
> +static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
> +                         bool preinc)
> +{
> +    TCGv rd = dest_gpr(ctx, a->rd);
> +    TCGv addr = get_address(ctx, a->rs1, preinc ? a->imm5 << a->imm2 : 0);
> +
> +    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
> +    addr = get_address(ctx, a->rs1, !preinc ? a->imm5 << a->imm2 : 0);

First, you're leaking the previous 'addr' temporary.
Second, get_address may make modifications to 'addr' which you don't want to write back.
Third, you are not checking for rd != rs1.

I think what you want is

     int imm = a->imm5 << a->imm2;
     TCGv addr = get_address(ctx, a->rs1, preinc ? imm : 0);
     TCGv rd = dest_gpr(ctx, a->rd);
     TCGv rs1 = get_gpr(ctx, a->rs1, EXT_NONE);

     tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
     tcg_gen_addi_tl(rs1, rs1, imm);
     gen_set_gpr(ctx, a->rd, rd);
     gen_set_gpr(ctx, a->rs1, rs1);


r~

