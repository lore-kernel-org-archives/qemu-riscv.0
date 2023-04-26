Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prf2E-0003Su-TO
	for mharc-qemu-riscv@gnu.org; Wed, 26 Apr 2023 09:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prf2C-00030I-8T
 for qemu-riscv@nongnu.org; Wed, 26 Apr 2023 09:18:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prf25-0002A6-Vf
 for qemu-riscv@nongnu.org; Wed, 26 Apr 2023 09:18:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so152057735e9.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Apr 2023 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682515084; x=1685107084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d+9NRtRRe1F92I0Fp1msG2G1Ckza8Pe6D2HmQb3l4Kk=;
 b=dCFJ2XLyy+KfMBjIVaWFqd/E8IYymhq0nmtJHXHxVPWINgnZxYFpLyXBGYvaqwuM/m
 XAM0ToDUiko0ICwM0h1MczqkX/1oTi6ngxHeaFkrss3zQYWKvMfmc/2UKigzfmqTs5cq
 SnoVaE31GxKAgpoAfhSCxgGrQCRJRU7yJemNP7JJ7lctb4nEixXAs/yoLL2DRejVR9yh
 RyJV44OC/CaK7e1zAG1owv9PKJukCmbJP0+ct/hvU5AAvIoYeXbpOhULdNgk92GlKerv
 oQVfoT0jXZCS5LkGxFmXXtlSKzgXHgIsj67BMPZwIMupZUcrDtz4KETrWjwyVl1jef6N
 QvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682515084; x=1685107084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d+9NRtRRe1F92I0Fp1msG2G1Ckza8Pe6D2HmQb3l4Kk=;
 b=IJA6tihBZLCva+9LfrJ4XlYwgOprNYyoW1L52iIMa9kf2e9HPhDcx1ryvvXzsXMxeh
 16WiibWv9pJj7tuQNmYUclSrzumD4khMi5M1kc1XzkXVnmNJt7skCm/kv4Xk3mEFsTZL
 5YMnkFxBlpc99kx4qEwPx25k6hE5QPZlTwjTXEmbFA1nOZSuym1RRPBS1dlZtU4eWDEj
 I/fI8H57kdif7ASQ7vy60zyaWiYpKyGNB/H5ugUgCwlXdUCU88UK/x18n/NAChaaegn+
 jp76JIHVwogKJ4qWng3KsTdSDlbo6PGnLIm8U1u0VeQv/ZKpJzJc2k5Q1IgBSwjEiGNx
 Qe/Q==
X-Gm-Message-State: AC+VfDyd8v7phTiSB5zQOmb2Vky01rCBke3opKj2Ckv4D5+p6N9ampqA
 U+2TIwHkPJNCIKW0/qayRkWmhA==
X-Google-Smtp-Source: ACHHUZ6JSWDhYo7QgbpenMv/hFfbFpDsvCPdXHF5nJ3zvFo4FHwdGwx4XdQ5O0s79sCRXaBunAKCKw==
X-Received: by 2002:adf:e710:0:b0:2fe:c8b5:b5da with SMTP id
 c16-20020adfe710000000b002fec8b5b5damr1786537wrm.13.1682515084404; 
 Wed, 26 Apr 2023 06:18:04 -0700 (PDT)
Received: from [172.23.2.237] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b002efb2d861dasm15865834wrj.77.2023.04.26.06.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 06:18:04 -0700 (PDT)
Message-ID: <87674a24-5df1-568b-025c-f88cdf5ada9d@linaro.org>
Date: Wed, 26 Apr 2023 14:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 34/57] tcg: Move TCGLabelQemuLdst to tcg.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 26 Apr 2023 13:18:12 -0000

On 24/4/23 07:40, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c          | 13 +++++++++++++
>   tcg/tcg-ldst.c.inc | 14 --------------
>   2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c


> +typedef struct TCGLabelQemuLdst {
> +    bool is_ld;             /* qemu_ld: true, qemu_st: false */
> +    MemOpIdx oi;
> +    TCGType type;           /* result type of a load */
> +    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
> +    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
> +    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
> +    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
> +    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
> +    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
> +    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;

Missing "qemu/queue.h" in header, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +} TCGLabelQemuLdst;=

