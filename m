Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82455C48BF6
	for <qemu-riscv@archiver.kernel.org>; Sat, 24 Feb 2024 17:55:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rdwF8-0007jU-Er; Sat, 24 Feb 2024 12:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rdwF5-0007jA-6E
 for qemu-riscv@nongnu.org; Sat, 24 Feb 2024 12:55:19 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rdwF3-00026W-M6
 for qemu-riscv@nongnu.org; Sat, 24 Feb 2024 12:55:18 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-21e95f4ed73so748503fac.0
 for <qemu-riscv@nongnu.org>; Sat, 24 Feb 2024 09:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708797314; x=1709402114; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0LZwywSDNVmU/E2ApvsR183plB/EzqBTLoLxPlmQo6E=;
 b=mr/7menqwjRJzVNT181fWKAryVNcOpo4AOUd2QgHneRaq09A2Z3TubKvar6FWXgRND
 YEUfhJQ+cNGKDgqa8Wd9+9liyHFZaeJQqtYz/zvNzQGxAksqaYte27O6snADVzvdqVPE
 HbhU9z84hFTJuXf9ri0XCwLoGm/9/4kgXhFFxPFe6DooXjZOJzmxzaLUDgLv5jTM8JIs
 WXPB8Hw+IvsWpj0BJpH4oOLOt9vG8iuwTmpJJZWMwXsu+nUUc4sf1ADlfyWEkN/zW6Ly
 sCGRx0Ds5CjGKkuBZn8SasGzmXo1tYq6jhnatR+qVLUVCF/und+LGUo+SDQ9oOAbCggJ
 FT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708797314; x=1709402114;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LZwywSDNVmU/E2ApvsR183plB/EzqBTLoLxPlmQo6E=;
 b=sgsv+usGNtqCkD+MowKBNCEkjsKzfQwADPY1OVSLcYh4H6bGj3MwssuNwpALq/LEbS
 6EjM7cJhM3AvQFp1RS/Z6sCvQfIRriWRS1rRQtRwbtRC+DRrM++wKO1RvQuK93aUuNrl
 CJtM5WInv2Riz7EATjZsmU2rg+VKrfJoGue40U5C4ccl7dK/ftzFeWeniHysae6lX7ZN
 0NVHcWPA+aLjPX7REztE67pQK0cHwYu66bCXfrl9QyGib8fJnahkh5d0nfS7rnaZeRT3
 fGCg8tGMbsU9LQ3biYKxgJEhjAmyFHKKSW2c9qiq59yqHckW7daQ5Sd7O4Vtwcd3MNwf
 hIwQ==
X-Gm-Message-State: AOJu0Yy9xkeochPxggJ9klcZjcrhfJuJCBjkETHdz/whyVIFvAi9yqek
 hqDp4BGRdXUb7jjwIDzvncQ9TgZ569HqaGzzdGJZo6IuKYW3MGAISSI/DK+q0cY=
X-Google-Smtp-Source: AGHT+IFo/X1CP8BuF98t90kU8Usvh8cmJSSguHZeye27nWvgI1BXGT4JwZdNikF80fBcxUs8cJwMag==
X-Received: by 2002:a05:6870:d24f:b0:21e:449c:254f with SMTP id
 h15-20020a056870d24f00b0021e449c254fmr3619386oac.23.1708797314262; 
 Sat, 24 Feb 2024 09:55:14 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 ei29-20020a056a0080dd00b006e507a98254sm95725pfb.206.2024.02.24.09.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Feb 2024 09:55:13 -0800 (PST)
Message-ID: <ac4ed35e-c4f7-40eb-8a6a-09a5157916b7@ventanamicro.com>
Date: Sat, 24 Feb 2024 14:55:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix shift count overflow
To: "demin.han" <demin.han@starfivetech.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20240224130235.340584-1-demin.han@starfivetech.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240224130235.340584-1-demin.han@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 2/24/24 10:02, demin.han wrote:
> The result of (8 - 3 - vlmul) is negtive when vlmul >= 6,
> and results in wrong vill.
> 
> Signed-off-by: demin.han <demin.han@starfivetech.com>
> ---
>   target/riscv/vector_helper.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 84cec73eb2..ced0aca633 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -53,10 +53,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>            * VLEN * LMUL >= SEW
>            * VLEN >> (8 - lmul) >= sew
>            * (vlenb << 3) >> (8 - lmul) >= sew
> -         * vlenb >> (8 - 3 - lmul) >= sew
>            */
>           if (vlmul == 4 ||
> -            cpu->cfg.vlenb >> (8 - 3 - vlmul) < sew) {
> +            (cpu->cfg.vlenb << 3) >> (8 - vlmul) < sew) {
>               vill = true;
>           }

Please add a new var:

uint16_t vlen = cpu->cfg.vlenb << 3;

And use it in the 'if' to be more readable:

            if (vlmul == 4 ||
                vlen >> (8 - 3 - vlmul) < sew) {
                vill = true;
            }


Thanks,

Daniel


>       }

