Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpYcx-0003Bp-Uf
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 10:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYct-0003BM-B0
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 10:22:03 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:46192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYcq-0005gw-KI
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 10:22:03 -0500
Received: by mail-oi1-x234.google.com with SMTP id q205so15111724oig.13
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 07:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aXWm9veIz1PbuRQV/3MNpniXVJe0w/tw/oqyZnnLnFA=;
 b=TfJ8kNFQrRHaPcZUPLoLypuA8V2cCmkqZCb1P11pwzAVCArQD4d9AURdIvArgVWh5d
 IKn2AlLfrWrnJOGaQMOGXG/g+093hP8UOtvHCuxoD9rKjoTDMttrdtYYge6UPraj2Isk
 /374ioSYYBrvLRfQ0sauLi/TiynGMZg4FPpwi1BIU6wh2dCMtfIo0a1B0cpX3JSmUMqT
 1XICkpMcWWP1mtaOyINnQ7WOnqR6WUQskXJ2356aD3Cw93pdu9K+22BxO9sVWpIfXZOB
 t6o7ySf4/qeWH1oKn3lq/zQHxf7IixvNQPQltpH7lN1Ghy8xoub6Y6LGYnsmhkuSeHvo
 67KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aXWm9veIz1PbuRQV/3MNpniXVJe0w/tw/oqyZnnLnFA=;
 b=rIrYKnSRakE6Vb4fIwqiKrS8AEzy3ceS/394Ce6VUn6ejuhXW+2+PAyqoyPRApFb6O
 1IJd6H5e0vH+cHIhfALG4X8mMZCGk490yyJM8PZ7bnNyaIrLvnuNQIxchaqFSy99Tnwd
 G098zcobhCRjcr6afG4BjyzSEttHOucqeY4OPKqDDKPW5Od8AkriSwS6McMWYnxVXqjB
 NrR6nLq+Rh+Os9+PCWQIdszJgui36uVjLKtNsJm+lKjfw4UrhULzOZGL0ftQeOL5nywm
 I3CPukxOMUCMBMUZmvcUeSF187P+8dy8c9SdPMC5cO1+Dna5re8cIYpTeFCwzsJaw5GY
 qn7A==
X-Gm-Message-State: AOAM533WlVub7fBGfmIHvPGDmYkJlEPxHv/D3DcdKpI6Tca4uGVKTyjo
 RMeZgdzZ9q1MZmkNH2tiww9uSA==
X-Google-Smtp-Source: ABdhPJyTFMq8aGEYpT6IZFIZW6f/p3VpCWs6zTk2B4x4GSt7rUf8pHBH84j0xSA2TH9IeeR20Efr6g==
X-Received: by 2002:aca:f3d6:: with SMTP id r205mr2299754oih.152.1608132118541; 
 Wed, 16 Dec 2020 07:21:58 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q21sm508877oog.30.2020.12.16.07.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:21:57 -0800 (PST)
Subject: Re: [RFC v2 02/15] target/riscv: rvb: count leading/trailing zeros
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-3-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29339dfc-e9c4-20ee-8c26-63921083571b@linaro.org>
Date: Wed, 16 Dec 2020 09:21:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 16 Dec 2020 15:22:03 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  4 +++
>  target/riscv/insn32.decode              |  7 +++-
>  target/riscv/insn_trans/trans_rvb.c.inc | 47 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 42 ++++++++++++++++++++++
>  4 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static void gen_ctzw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ori_i64(ret, arg1, MAKE_64BIT_MASK(32, 32));
> +    tcg_gen_ctzi_i64(ret, ret, 32);
> +}

One nit: use clzi_i64(ret, ret, 64).

Most hosts, including x86_64, naturally return the register width for zero.  If
you use something else, like this, then tcg will generate an extra comparison
and conditional move.

In this case you know that zero is impossible, because you just set all of the
high 32 bits, but that knowledge won't be present in the expansion of ctzi.


r~

