Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVXFv-0002su-Pm
	for mharc-qemu-riscv@gnu.org; Wed, 29 Sep 2021 06:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVXFu-0002qh-Bx
 for qemu-riscv@nongnu.org; Wed, 29 Sep 2021 06:56:06 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:42499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVXFp-0003Kb-Mn
 for qemu-riscv@nongnu.org; Wed, 29 Sep 2021 06:56:06 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso2302560otu.9
 for <qemu-riscv@nongnu.org>; Wed, 29 Sep 2021 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dPQO6ibacWp/r8r6sqYb9wSJOhUvdZMWyTtk37qqhxs=;
 b=N4JNIus2yZ31AJ3P+eK7RnDdc3U1MPrfmbq5M+rWGp9Kwle4D1Kd6COk/G7w3b/01u
 tXnZXU3ywpwXpJujkcW6W296zJCE8uB+V8okxEVPLqhnxZeyyFmmmEY8h8wILmNRHLFJ
 sd9W3tTgpswmdKen8JPlKNZsNOH+k5csacXQHSDLrjO66mcwZE+oF2nP1I1UKG3FZwoR
 TZLGFpHV8pDybdG75NBX0LVTqtERk6Cg6rbXQv/s8ptRKj8wGtX6hsFWx8RFk8iwk5li
 CEY32uh4A0ftOBzFaOa+ICUvOZsklvzouBOn4A5CQJPpQLWmweeG157mYSzJxrykKgmU
 78zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dPQO6ibacWp/r8r6sqYb9wSJOhUvdZMWyTtk37qqhxs=;
 b=nHkADJlLf3gHKn8/jxDPBmaLBQgEtMzxo8y5WYUZk3rq5wbvCx8fBKOx/Gvk2lylty
 o3rVQqv5GELSZ1kyMFWZkY8lNL/Y+d5ECKRVCMXSSAzFumzYG7+wHP+/UizHKkQogkF+
 FOEW2wpB/dx/7xQaONx8wIMqBnHib2vPYi0KyL4tVG/9IOeQc3sfi02aAvgSxvGX8JHO
 KQtGEjv7dpKQRPmy2rsWww4tTvACyfkhjFgQ8lFynhA1xs1Xg97YnhfqoTEQlEMikJMM
 YXIb6RsW4b2f915spescLXbtGnmQv4U+Av0UqPWp23dOa/CRP5ae1+zhZglcFsZtJyXP
 pSqg==
X-Gm-Message-State: AOAM532L6A4crUGQjn3kSHYy7TZeaEntJ4/jgwYmLQel2lAWBjlru6qx
 gtazPSbjxZIpKH10yz9lh588pg==
X-Google-Smtp-Source: ABdhPJyYSVG1SP1vu8IkWUBAOSGDRR7lja5UqjFuaWa+Xn4E6sq7RigqPkRYhoGAANeQW6aL8PF5FA==
X-Received: by 2002:a05:6830:2706:: with SMTP id
 j6mr9724373otu.380.1632912960252; 
 Wed, 29 Sep 2021 03:56:00 -0700 (PDT)
Received: from [192.168.60.34] ([172.58.171.180])
 by smtp.gmail.com with ESMTPSA id l25sm382299oic.54.2021.09.29.03.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 03:55:59 -0700 (PDT)
Subject: Re: [PATCH v12 3/7] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the h-mode
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>
References: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
 <20210928190036.4114438-4-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cfb0d0d1-981b-4762-d563-4ed0f5279f4d@linaro.org>
Date: Wed, 29 Sep 2021 06:55:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928190036.4114438-4-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
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
X-List-Received-Date: Wed, 29 Sep 2021 10:56:06 -0000

On 9/28/21 3:00 PM, Alexey Baturo wrote:
> +    switch (env->priv) {
> +    case PRV_M:
> +        cur_bit_pos = M_PM_CURRENT;
> +        break;
> +    case PRV_S:
> +        cur_bit_pos = S_PM_CURRENT;
> +        break;
> +    case PRV_U:
> +        cur_bit_pos = U_PM_CURRENT;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    pm_current = get_field(env->mmte, cur_bit_pos);

Nit: If you have a look at what the get_field macro does, you'll see that you always want 
to give it a constant, so the compiler can fold all of the arithmetic into a constant 
bitfield extract.  It is not a win to pull the field argument out into a variable like this.

For this reason I prefer the hw/registerfields.h interface -- it is more difficult to misuse.


r~

