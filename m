Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mklDh-00034Z-5D
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 05:52:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklDZ-000345-72
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 05:52:37 -0500
Received: from [2a00:1450:4864:20::329] (port=37843
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklDW-0001Mc-UH
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 05:52:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso4253458wmc.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Nov 2021 02:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YpTGcEYrGLKa63VNOgeGYvAG5xpP1H+0F9QMIi78Y20=;
 b=BUHJj91HeByc88VZnM4LMB2p6wiEP/iQaI2Lc8JUsBqfgDt47V5hHP3UC4xq+Ev7+v
 OyG3gNo+pvv63sbZT8BWJpmiRrU587PE7bz27Al3gcZEKz3mM0xA6K4rOkfQ2YteiAtg
 Dwzr/dPRq2LCC2lhtAf7ALc/QUI0wIrfy4SDIopPoRMBslZV20Egv0lFM8sNwtklZaNA
 MAigrkvFZfRRGzXZMROM1M5zNZRYyjzrQC3tvoI3AoJJFRE1GkdCB52LC8BMAQxfUuN0
 /Fz9UUf9QvmUEv/cnMbx+vWLIYapGkeYycDe7R1H4njW1Fbs0gSZ35qysez/zs7D3onb
 Kn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YpTGcEYrGLKa63VNOgeGYvAG5xpP1H+0F9QMIi78Y20=;
 b=1lEPmkEcKH+9k27m/R4n0avz4BgMJl8hBCMOEp5Cp5GhGVLmmmuRjw3SecBNIBpi1W
 73dIswkRwI38cbGCYaGwxS4J/C4aDeajE853tuMx6j19+5S3fA9e7+tQDxq5SDNUTcWv
 VsI21p5sPJecy8a5hwlgwV5xIkDEggNrMhXCenCNpxfiuRcsxCo2ovnIGPm5gYq4f4cN
 hLwhBoiH5LWT6ozt8o1E+jZIQqJ+4RrFP+JDPVVUKIR4U1g5FJl3e7QgDZmkaZaw5JWC
 HdLXoCRwo+eiEGP7GTpQxi8gqI9HARCb9Ko+WIq6WzyDaVOMuefaIf1+HcJFZZz1CVU3
 L1yA==
X-Gm-Message-State: AOAM53084g0yCPRPqJbz/m918wvPGHRyobXUm4saaZlkHzP4TseyGO+7
 eUm9sXkgmNJ/euQfzufC8UNGTg==
X-Google-Smtp-Source: ABdhPJyKZyh262dn3MTR5D3mAM33yZ807lm26QB19bjVp7bR31ZhQZ1Q4LXEEMKThP2YJTM8huLtbQ==
X-Received: by 2002:a1c:1f94:: with SMTP id
 f142mr15799896wmf.192.1636541553225; 
 Wed, 10 Nov 2021 02:52:33 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id r8sm27879525wrz.43.2021.11.10.02.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 02:52:32 -0800 (PST)
Subject: Re: [PATCH v2 05/14] target/riscv: Calculate address according to XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-6-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7dace3b5-1320-20b3-703c-bbdf7e745fb9@linaro.org>
Date: Wed, 10 Nov 2021 11:52:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-6-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Nov 2021 10:52:38 -0000

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/insn_trans/trans_rvd.c.inc | 23 ++---------------------
>   target/riscv/insn_trans/trans_rvf.c.inc | 23 ++---------------------
>   target/riscv/insn_trans/trans_rvi.c.inc | 18 ++----------------
>   target/riscv/translate.c                | 13 +++++++++++++
>   4 files changed, 19 insertions(+), 58 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 64fb0046f7..29066a8ef3 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -20,19 +20,10 @@
>   
>   static bool trans_fld(DisasContext *ctx, arg_fld *a)
>   {
> -    TCGv addr;
> -
> +    TCGv addr = get_address(ctx, a->rs1, a->imm);
>       REQUIRE_FPU;
>       REQUIRE_EXT(ctx, RVD);

It would be better to leave the address calculation after the REQUIRE checks.

> +static TCGv get_address(DisasContext *ctx, int rs1, int imm)
> +{
> +    TCGv addr = temp_new(ctx);
> +    TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
> +
> +    tcg_gen_addi_tl(addr, src1, imm);
> +    addr = gen_pm_adjust_address(ctx, addr);
> +    if (get_xl(ctx) == MXL_RV32) {
> +        tcg_gen_ext32u_tl(addr, addr);
> +    }
> +    return addr;
> +}

I suspect the extend should come before the pointer mask and not after, but this is is a 
weakness in the current RVJ spec that it does not specify how the extension interacts with 
UXL.  (The reverse ordering would allow a 64-bit os to place a 32-bit application at a 
base address above 4gb, which could allow address separation without paging enabled.)

I do think we should merge gen_pm_adjust_address into this function so that we only create 
one new temporary.


r~

