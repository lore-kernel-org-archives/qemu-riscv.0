Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mh24L-0006ol-A9
	for mharc-qemu-riscv@gnu.org; Sun, 31 Oct 2021 00:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh24K-0006oW-3G
 for qemu-riscv@nongnu.org; Sun, 31 Oct 2021 00:03:40 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh24I-0006R7-N6
 for qemu-riscv@nongnu.org; Sun, 31 Oct 2021 00:03:39 -0400
Received: by mail-pl1-x630.google.com with SMTP id t11so9429820plq.11
 for <qemu-riscv@nongnu.org>; Sat, 30 Oct 2021 21:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=teHXYUAqCvzPzfjbpPG9KoCo+p9x1lmKawwuj4y/KXo=;
 b=ipBOchWLfkqgfkF1lKG0xXUXIFEUEWW1YQyEvpuSwsb6E31Z+g9nU4mp56FsdyhKqz
 s+PR+p/DaZx815kmc8X8U17IqtZ8Pla1AWX5KJxqJ/dHVF8QkMCJSgJ/GDjpTojZY1mU
 SnkFUWRAek2Uxi1BszRw5VtUD7FZVusvvG0cuaFqqLitpo9IsWm0YQpzpqiA3GQn0ECl
 /9UmIy0dAWAjinHXADVueOC3MCnd37PiVMv2SAGmEADRS3zwilCrXcISSqa0vQTEnbp5
 kDJ6/jAMU4NB9pp/VHXCOLIj9qiW1pNK/DhKF/9kM2nM3kxo9mrWtV17NKzCR6vfBppg
 ppIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=teHXYUAqCvzPzfjbpPG9KoCo+p9x1lmKawwuj4y/KXo=;
 b=3BaEC/ZH0e1SvflSNw3w/TAx9ude3gdgzty8Z9/gZ8sG2SE7rIMsotw5ehEiDo2psh
 ybRoAaV90ooRHntnuR0RdkcELkRl0LCJaDIv+4o4vRzdQoUhMWCpL45oxQe0eghyOP7o
 7xcFGzgEs0+RPpga+gXTjoMpctTw58idHdbI1bzqeCRL784XwEpTb4sQJ1xuKe3e8tCZ
 2YImd5xW4TG+GMQorA1DYuROXx2nMFfO4MCx/PsiZ/AUA2HzZQsRbQBrD6h4nMhIR8oo
 YU5poZDzVJWO8b1M6xK9jkBf3k/dpBmjPReqn6sN3v+XaezC0+7OR+QsS7YivyUV0M9c
 WK5w==
X-Gm-Message-State: AOAM533JZbkInH6asNdaXIwWnuq7e/heL0xKaY8XMvPZkRRMmkFHC5gn
 qryJuq45GV3SXOuM9O+jwWyYFg==
X-Google-Smtp-Source: ABdhPJxSmlzIbNd3jSer2SmwNCqHut8qyPbHEn6Ssd332hgOIK7m+XilD01ax3vqABmKWuuBoUSmTQ==
X-Received: by 2002:a17:90a:c7d7:: with SMTP id
 gf23mr4333844pjb.204.1635653016530; 
 Sat, 30 Oct 2021 21:03:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p16sm11848368pfh.97.2021.10.30.21.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 21:03:36 -0700 (PDT)
Subject: Re: [PATCH v4 11/17] target/riscv: support for 128-bit shift
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-12-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1cbc85e2-8c83-c8f9-651c-9b49bfd923f0@linaro.org>
Date: Sat, 30 Oct 2021 21:03:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-12-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 31 Oct 2021 04:03:40 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> +    if (get_xl(ctx) < MXL_RV128 || max_len < 128) {

Only the second test is required; the first is redundant.

>   static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
> -                      void (*func)(TCGv, TCGv, TCGv))
> +                      void (*func)(TCGv, TCGv, TCGv),
> +                      void (*f128)(TCGv, TCGv, TCGv, TCGv, TCGv))
>   {
> -    TCGv dest = dest_gpr(ctx, a->rd);
> -    TCGv src1 = get_gpr(ctx, a->rs1, ext);
>       TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>       TCGv ext2 = tcg_temp_new();
>   
>       tcg_gen_andi_tl(ext2, src2, get_olen(ctx) - 1);
> -    func(dest, src1, ext2);
>   
> -    gen_set_gpr(ctx, a->rd, dest);
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, ext);
> +
> +    if (get_xl(ctx) < MXL_RV128 || get_ol(ctx) < MXL_RV128) {

Again, only one test; probably better pulling out max_len, like we did above, since now we 
query OL twice.

> +}
> +
> +

Careful with the extra lines.


r~

