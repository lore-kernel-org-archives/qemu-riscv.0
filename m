Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbX8i-0008Fc-13
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 20:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbX8g-0008F4-Mn
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 20:01:26 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbX8f-0004EW-00
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 20:01:26 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso2891252pjw.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 17:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Py53g1TniXvYWUshbYzrsRdA1gpd0i/2Fr+CP9u+g0=;
 b=MYmvR7xCY4hj+FZpItiA09uYlH7UTg6PQSICOosKYInDBrLU1KG8Yqm5YVDvr7ZkIF
 KCHWHahvTcKLzc4VKTJD7Fz54J49GvVXU8dMmpeTDxIJSg/hXCZw4gNB2LlLUmP7kvY5
 IBlir0TAJcqQB+MIee2a4iRYaSAfGkIuAYo8aAMxxRGEtgo30MDA3+s1PCOsEFyBqrQD
 Dr8zrHHV2zov/Qr52iTSSYBMGxWS6F3OedXYmKMpgLyG3YY4katTFrxsTIjGkt3ttDsk
 cxW8VtUkr0sjEE8oeCtz5KdznnKg+pUPc6ZZhlBL6zPMXSsO7PRp086BnzPzIZ9AjS7G
 TAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Py53g1TniXvYWUshbYzrsRdA1gpd0i/2Fr+CP9u+g0=;
 b=RFXarPFlLXlSx0lrZQUr8q/ck53UMJwAHoS6gkYa/AG5TeyCWA7pDhVLfW8a3KOsaz
 RDskBClS+jQbkPMqGd63NoSPB8wlnLsS0oDl0nsqUhE3P/1n75wzO3e5XRk9w9CPziGC
 UD5Sb4339ikNVux0eCL8eD+ODZnFSAxtZ39fAYJDbCYk2/6Za3ua48X2aNSCGas1TCla
 Wf/v1Wk3MCB9uGLpzydj2Udv54i7fMMe5VTvFm2IQ79iUIdMBIB7Rbh7tuqPWsidPhDo
 +fIPebdcJgYHTzkB79m+/OIF8Oytu5Onx6mveLe9BkH6p84XvOY3TTOSKtvpmPFW0kta
 DJrA==
X-Gm-Message-State: AOAM5310nIz8raNsqkHDfDIbtUfKBLUEn2dQuklxYbiDIEo9mIfKBiyZ
 Ni2ahQxBxQxSK7QwhLODzu4Vkw==
X-Google-Smtp-Source: ABdhPJw1CfKCww+sUfjLh7PY/4bwutFfWVnjE827Kl0m+mqZMGh4lBBrO3gCyIYsIGXoQQCEpbxwTw==
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr17145431pjv.54.1634342482996; 
 Fri, 15 Oct 2021 17:01:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x7sm12039041pjl.55.2021.10.15.17.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 17:01:22 -0700 (PDT)
Subject: Re: [PATCH v13 6/7] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
 <20211015192931.227387-7-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c66f7198-362e-8311-b063-e88b018044b1@linaro.org>
Date: Fri, 15 Oct 2021 17:01:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015192931.227387-7-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 00:01:26 -0000

On 10/15/21 12:29 PM, Alexey Baturo wrote:
>   FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
> +/* If PointerMasking should be applied */
> +FIELD(TB_FLAGS, PM_ENABLED, 10, 1)

Merge error.

> +    if (riscv_has_ext(env, RVJ)) {
> +        int priv = cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MASK;

cpu_mmu_index has already been computed.
You want

     int priv = flags & TB_FLAGS_PRIV_MMU_MASK;

> @@ -118,16 +125,6 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>      tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
>  }
>  
> -/*
> - * Temp stub: generates address adjustment for PointerMasking
> - */
> -static void gen_pm_adjust_address(DisasContext *s,
> -                                  TCGv         *dst,
> -                                  TCGv          src)
> -{
> -    tcg_gen_mov_tl(*dst, src);
> -}
> -

You might as well place the function correctly in the previous patch.
Drop the silly alignment of parameters.

> +    int priv = cpu_mmu_index(env, false) & TB_FLAGS_PRIV_MMU_MASK;
> +    ctx->pm_mask = pm_mask[priv];

Using cpu_mmu_index within the translator is incorrect.  You want

     priv = tb_flags & TB_FLAGS_PRIV_MMU_MASK;


r~

