Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOOrL-0007pa-Pl
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 14:05:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOrK-0007nf-9Y
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:05:30 -0500
Received: from [2607:f8b0:4864:20::52e] (port=45909
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOrH-0000ul-Rg
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:05:30 -0500
Received: by mail-pg1-x52e.google.com with SMTP id z4so9581500pgh.12
 for <qemu-riscv@nongnu.org>; Sun, 27 Feb 2022 11:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7SpCVqRmagiShxj+GTma6iQom7dIl4JKkPCq0Ks/rc8=;
 b=ONlYOklZ536PguyB39C2qP58YtmDYzOtz5kGKl6Bos40mg2rTKp9DoAqQsVltYlPJL
 TCRkaBAzcune11B3y1HqIXw5xZ/5ctFRx5YnoCP+pB9aX6PZePoCfJ86EPdxaLbGjkxi
 VgClGY4rvRIGxjoatqP2sRwzRyqDKi4KdwpqxvANqE7r3PhX99gqVVo7hDTZDyL+qWuU
 UJdomycsbfElLFiyLSiwcq6j5LJHfGJWLaQw/12AnmvCLHRIq8sJC9I2XSXcdoHZ4nzi
 rSvkcO6EuDu+zAfGvwj/LB7hmh5rBSPkrDDT4WkjGpwZEKN0mquDnduBy7YE104EXQgH
 ij3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7SpCVqRmagiShxj+GTma6iQom7dIl4JKkPCq0Ks/rc8=;
 b=dRn8TOS/mAIgpJLVUaGNMs0YSMEYlhpfcEIHE4Uo10gEDSWqfTuqXzz8xePraZK2Jf
 fB2uug+AGT5MzBJ8izVmVXC4lQftZ4lK5j6snKN5k4QTfgdRXa0acQwxHDMQb7GbTu51
 rdtTAj65cW9ExpC0WPb92GjrF1D14PwldVQ/+gtlsFM8UfmrBsfFizm98xahARUl7zzG
 O6ImJwPD4DfE1bmh+2pUYOJ9O/ofjMWN6n7g5Q0aIcn0xxgmsbkdwAzyRuGFZQs3kxmJ
 sUUYZQZ/Gz5Y/Mq6OHbMjAoz1xRd1GqdC9w5mAcFl4PR56XDYlLsFb20j2ma1dgXtSeX
 DGzw==
X-Gm-Message-State: AOAM532O4fE98gisRu8+g4TvjCvNP4Eiqqzn5YXgSkTB5A7yP1533xGI
 kCndaD2HtUeSgbhLs0oJRq/i2A==
X-Google-Smtp-Source: ABdhPJwhZ/j/ATtL+cC6AtdoLgq9wUasLYebV6y4UaFFaqAj2HOuJdIIO3LsRRTldEkEbPe/P/b4ZA==
X-Received: by 2002:a63:595e:0:b0:378:b203:a74e with SMTP id
 j30-20020a63595e000000b00378b203a74emr615925pgm.328.1645988726379; 
 Sun, 27 Feb 2022 11:05:26 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056a00248f00b004f10a245b83sm10623252pfv.73.2022.02.27.11.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 11:05:25 -0800 (PST)
Message-ID: <71666709-7115-81ec-2db0-bd0db525796b@linaro.org>
Date: Sun, 27 Feb 2022 09:05:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 06/14] target/riscv: rvk: add support for zknd/zkne
 extension in RV32
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
X-List-Received-Date: Sun, 27 Feb 2022 19:05:30 -0000

On 2/27/22 04:25, Weiwei Li wrote:
> +#define AES_SHIFROWS_LO(RS1, RS2) ( \
> +    (((RS1 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
> +    (((RS2 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
> +    (((RS2 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
> +    (((RS1 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
> +
> +#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
> +    (((RS2 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
> +    (((RS1 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
> +    (((RS1 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
> +    (((RS2 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))

Unused.  Whcih is good, because it shifts an unknown type by 56.


> +DEF_HELPER_3(aes32esmi, tl, tl, tl, tl)
> +DEF_HELPER_3(aes32esi, tl, tl, tl, tl)
> +DEF_HELPER_3(aes32dsmi, tl, tl, tl, tl)
> +DEF_HELPER_3(aes32dsi, tl, tl, tl, tl)

DEF_HELPER_FLAGS_3, with TCG_CALL_NO_RWG_SE.

> +static inline target_ulong aes32_operation(target_ulong bs, target_ulong rs1,
> +                                           target_ulong rs2, bool enc,
> +                                           bool mix)
> +{
> +    uint8_t shamt = bs << 3;

Just thinking it would be better to pass in shamt, since bs is otherwise unused.

> +    mixed = (mixed << shamt) | (mixed >> (32 - shamt));

This is broken for shamt == 0.  This is intending a rol32(), I assume?


> +static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
> +{
> +    REQUIRE_ZKNE(ctx);
> +
> +    TCGv bs = tcg_const_tl(a->bs);
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    gen_helper_aes32esmi(dest, src1, src2, bs);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    tcg_temp_free(bs);
> +    return true;
> +}
> +

tcg_constant_tl, which then need not be freed.
You should create a common helper for these 4 functions, so that you do not replicate so 
much code between them.


r~

