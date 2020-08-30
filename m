Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCB2y-00069A-9d
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 20:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCB2x-00067Z-DL
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 20:18:11 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCB2v-0006hQ-NH
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 20:18:11 -0400
Received: by mail-pf1-x435.google.com with SMTP id y206so2576695pfb.10
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 17:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ms7mOU8z63Af1AeL2eZnqji8xkbpsjvppZVJEXUAR8w=;
 b=N6adRlqGJOdClqJFGfSMG8ygekmeqOaABtbaw0/y/7gsJ3nbQScZ+c59ZUPhy3aroY
 GewgGkamRB56ZxpU70QKDTWnOKxSyno5MpvFRIDdNyeeQYuWGTgKcp4OfxcBd40oVYs5
 tfpVmWOGBshzvGc5VjsmWVda1WFTwiZET2+TR2sWEYRFb3me5tbgnsrJhNNG2ecQbd3R
 qezpOGb1SZmdvcr9F/GpFK6WiTLQOqOGWV9sIyv3DRlgFJLdEMzZWqhYPghl71YGzGcM
 0W/yZNOVEkvfPaudPUqLwAyGUEpwRKlNSP+3baChO+QXtTPll8Gp8DCERlLGttIsA28O
 xY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ms7mOU8z63Af1AeL2eZnqji8xkbpsjvppZVJEXUAR8w=;
 b=IjwmOBK2atQu33xjW6NaMVf/1s4RZLohfctiq0kPgnK8MpoOlTCEiwRnQ4fuAT9fzn
 JjLUKCFF8WQ8gtI35V54LQJHJE8l5RPuykDzAVqM2BEQSZwJ152xeMnfTnNlfQgwinYF
 LyZZNcmYa8qlIfQwe3OHR9XeEokMiyDTLVfeo1K3x4IovQZFlTqj3z0qF/H2XNONJoA2
 0cpQGG0Q2UK3qCs+i8+hKaiOWlA7lHFfAtfUmqJFDgcu3ZDl17vjbFQdK3QMg+tN8iVm
 fqlhfZ+ttCsF1Yg47bHh2JfLJpUqUqzUapTmwCim0bOkDLfm2CT+nWHhV5XfitAf0NsU
 3QgQ==
X-Gm-Message-State: AOAM530a+d5RdvVrJuTV3dVKEPMKw15mET8tAWQREe3zOsis7L87MS/L
 4B/iRAiBlaZYsk18p00tB0lo2zVqMPThZg==
X-Google-Smtp-Source: ABdhPJwKYItyEHrR5ruQ4ylzOWnD8drdJ0ZeTDFRX+KPEb1GXWX5v20cCQ9B8mAJi116tBP/4BCH+A==
X-Received: by 2002:a63:c74d:: with SMTP id v13mr3723273pgg.98.1598746688516; 
 Sat, 29 Aug 2020 17:18:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f17sm3029918pjp.46.2020.08.29.17.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 17:18:07 -0700 (PDT)
Subject: Re: [RFC v4 65/70] target/riscv: add "set round to odd" rounding mode
 helper function
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-66-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b4b103f-a601-c3c0-594e-b570d8ac56fc@linaro.org>
Date: Sat, 29 Aug 2020 17:18:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-66-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sun, 30 Aug 2020 00:18:11 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> helper_set_rounding_mode() is responsible for SIGILL, and "round to odd"
> should be an interface private to translation, so add a new independent
> helper_set_rod_rounding_mode().
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/fpu_helper.c | 5 +++++
>  target/riscv/helper.h     | 1 +
>  target/riscv/internals.h  | 1 +
>  target/riscv/translate.c  | 5 +++++
>  4 files changed, 12 insertions(+)
...
> @@ -44,6 +44,7 @@ enum {
>      FRM_RUP = 3,    /* Round Up */
>      FRM_RMM = 4,    /* Round to Nearest, ties to Max Magnitude */
>      FRM_DYN = 7,    /* Dynamic rounding mode */
> +    FRM_ROD = 8,    /* Round to Odd */
>  };

This needs a comment, or a rename, to indicate that it is private to qemu.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


