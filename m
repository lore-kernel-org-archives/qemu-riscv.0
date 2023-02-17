Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT4u0-000421-Ll
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 12:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT4ty-00041M-Fb
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:52:06 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT4tw-0000kj-Pe
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:52:06 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1718b32f589so1604502fac.5
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fLO8uE4MwE+TjjxJWP0Hx1dDkzg54x+hJsFSWNmd2eI=;
 b=EO7Ct7aRpDH51zzos8g8cUwkuyRfxoNTqosiGXPJFad+xgY6QV09eGE+LEz8/BCjtc
 MpAnYeVJ5UbWi3yKGOcLmbPxAkxfA+pWJsDgDwV2Rukpt8VQzY2uGLYLGxg09X+gEnDY
 1HfpEhmTb2r09PrJm1T88oHxn2GFVavpHxVwrBWqlk2GwKDN/WoC/A1TKeDKxQqzOw/o
 68ZEN7j7OijJgSwHMd0tzYGL7TA2IWv5+iz//Qz2AZ2yqEkeG3ArY5FRj1ltEd6GtOmz
 wo49Xpizdhgu49THxcK2ZigiYbZUFGD8VAgEkqREI0rJUHAB9Oi/KW2rDTsFfZhLDw/f
 3Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fLO8uE4MwE+TjjxJWP0Hx1dDkzg54x+hJsFSWNmd2eI=;
 b=sFi8ZogvUrU3NK0mB842kT6XMwsvb5SDPVvh3EZ7f/y14PrHt12YK5UcNvVSFOiLlR
 aPW4x/0syiWFTU3ugMhQTLxSDun90ooq2OG/f26d93PgNxwafb5yhy+3490gg5d+2S8Q
 NYlNdNkx6836F/Lj6yOXEln3otilUfntDt3U/30367USXFsRiU7RM/IWwHD1Jl/1ytGB
 MxEPj9ZkJayWI2eyN/EYCgfPrRAaiNFbVw7OsWuDO2IjdYk93cgFBYyosEd/kIXFcusf
 /ldee6ZfAN0PFUMDbUzsrxN1OOsr4A2QJvG/Hwggy6B4Agu58bFWQjXPJr0fn8rmZWrG
 KAWA==
X-Gm-Message-State: AO0yUKWPNMuZkkxauYQR5tzgr1HcW3MU7uVErQIawtAsY0XzSFcQbcPf
 m6Z+dkMJm1uHBHiZS8T81pcqZA==
X-Google-Smtp-Source: AK7set8Mk+dAYnw/IBBfAi+t+X4eiy/KI1ApI262rHeAonq8qiHymHV3J9zZO+etRxeqaWx7Oqk+iQ==
X-Received: by 2002:a05:6870:479e:b0:16d:cc37:3d7b with SMTP id
 c30-20020a056870479e00b0016dcc373d7bmr763687oaq.36.1676656323103; 
 Fri, 17 Feb 2023 09:52:03 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 du25-20020a0568703a1900b0016a310dc4a9sm1892399oab.9.2023.02.17.09.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 09:52:02 -0800 (PST)
Message-ID: <4c3202fc-654c-8c6c-c754-1d156c2de2a6@ventanamicro.com>
Date: Fri, 17 Feb 2023 14:51:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] [PATCH] disas/riscv Fix ctzw disassemble
Content-Language: en-US
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com
References: <20230217161027.56859-1-ivan.klokov@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230217161027.56859-1-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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
X-List-Received-Date: Fri, 17 Feb 2023 17:52:06 -0000



On 2/17/23 13:10, Ivan Klokov wrote:
> Due to typo in opcode list, ctzw is disassembled as clzw instruction.
> 
> Fixes: 02c1b569a15b ("disas/riscv: Add Zb[abcs] instructions")
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> v2:
>     - added fixes line
> ---
>   disas/riscv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ddda687c13..54455aaaa8 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1645,7 +1645,7 @@ const rv_opcode_data opcode_data[] = {
>       { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>       { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>       { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>       { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>       { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
>       { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },

