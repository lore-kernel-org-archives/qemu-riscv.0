Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZBYr-00020r-Jh
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 09:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBYp-00020F-Ip
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 09:11:31 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBYn-0000GA-9P
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 09:11:31 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f11so8942057wrv.8
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 06:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o2J+WpL6f5/gX8dQgrpUvb62UwCJ7P8wIM58S091AtQ=;
 b=cbtfAAN2ENRlH4NcZdWMJ5vb7vnThZKHrwKx39aM82Tc0lYjZEICyEr/A1Czvlsk6u
 2IGDE/09m44PkzGnZfv8lQXKzla0kpWR+HKuCr7RBk/J6/sReVPCY+QNYEXILYbUIM53
 Vmf4rWP+Po29hJEvmWfbVwe/Hf7EVVIVztGZ8vWGPA7tCQusK3MrkzsV/wFnov+jqYLo
 tN7hJ/0kvn2xdfjdLsDMOKNKNmnLDHzThnha/NLhUJGUEf/q8RVNTe7kAP0DvBFPW/ud
 1x0HbY3TwCaeOCXpGmx5GZyPMslOy5zqiGZiY8gBJwWmz59vvh9dJXNf4uF72+fNiX/I
 9Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2J+WpL6f5/gX8dQgrpUvb62UwCJ7P8wIM58S091AtQ=;
 b=ks3ehcvptn0iIwXoKNBL5JPqLVvBl1GiePBNmL1eQbpVw5yPugIG317ajvgiJQgUvP
 mrLCFOVDwL5AOfS0dtZJxWuSyXQg/kroiCWSU2Wzgv76Hyze+5QKZL4EtRDvIuM25QWu
 HCxhSm5rGZsgOqaMXGl+FFX31I7nMjFXpLlqcQlNFat7r59+lNucthTw6zTd2T0NcCu3
 lDYl0tr16cgB3iaiODbuQJJ/KSxUc9SMj/5p4MaoJwin0WrkszGhIjhaUHx89S/iSj3w
 HwWpX6Ds0+H6miKd2hvnmihBU8UPJDv3tzAeJ2q8Y+gsrvujuH74kgI5hTJAnmMe12lN
 rz+w==
X-Gm-Message-State: AO0yUKVrjj3TrHTLumajMCYg59a5vaPi1Pf6qugxYs8XHVwZ/koTH1QK
 SUjmmEwE7rhKSq7Mg4/5X5ES4A==
X-Google-Smtp-Source: AK7set+bdHMdPl6c+7t2IMGJ1bzwGQdkU84vq/LlhIm3grQATa/TlKVyXppTE8lUlzpBp3SxOMoDXQ==
X-Received: by 2002:adf:ee12:0:b0:2cb:3b68:3c1c with SMTP id
 y18-20020adfee12000000b002cb3b683c1cmr6669275wrn.14.1678111885048; 
 Mon, 06 Mar 2023 06:11:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w7-20020a5d6087000000b002c567b58e9asm10143135wrt.56.2023.03.06.06.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:11:24 -0800 (PST)
Message-ID: <69d3e5e4-a563-61a6-c3e0-8a6ef026ac8f@linaro.org>
Date: Mon, 6 Mar 2023 15:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [Qemu-devel] [PULL 11/29] target/riscv: Convert RV32F insns to
 decodetree
Content-Language: en-US
To: Palmer Dabbelt <palmer@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peer Adelt <peer.adelt@hni.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20190312131526.14710-1-palmer@sifive.com>
 <20190312131526.14710-12-palmer@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20190312131526.14710-12-palmer@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 14:11:31 -0000

Hi Palmer, Bastian,

(old patch)

On 12/3/19 14:15, Palmer Dabbelt wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> 
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>   target/riscv/insn32.decode              |  35 +++
>   target/riscv/insn_trans/trans_rvf.inc.c | 379 ++++++++++++++++++++++++
>   target/riscv/translate.c                |   1 +
>   3 files changed, 415 insertions(+)
>   create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c


> +static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
> +{
> +    /* NOTE: This was FMV.X.S in an earlier version of the ISA spec! */
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    TCGv t0 = tcg_temp_new();
> +
> +#if defined(TARGET_RISCV64)

Just noticed this while reviewing Richard's "tcg: Remove tcg_const_*'
recent series, shouldn't be this #if condition inverted?

> +    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
> +#else
> +    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
> +#endif
> +
> +    gen_set_gpr(a->rd, t0);
> +    tcg_temp_free(t0);
> +
> +    return true;
> +}


