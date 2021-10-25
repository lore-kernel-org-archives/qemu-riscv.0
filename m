Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf6I0-0004XL-L1
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 16:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf6Hz-0004UH-61
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 16:09:47 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf6Hx-0002kP-F3
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 16:09:46 -0400
Received: by mail-pf1-x42f.google.com with SMTP id k26so11893388pfi.5
 for <qemu-riscv@nongnu.org>; Mon, 25 Oct 2021 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AfELcrlQOVyKyV5lgWK/m1/Yz/sIigvP3XBFHJRaEUQ=;
 b=OZn72RcAfaLfhM4sPfuTNMjDwy5HeCSplz8NSPRGS9Nbzq9c/riDTvxuaUREPY+1mB
 kJN6wCsKm88jXoLFnrsddOmt+yYqHwfg2ete+rXtJqCDYtPN2CLbwxMojCZaV9C2GyYo
 IBnArGz8ac/I4kjcmEPDTE3V2gPuoW12El/bn2VcwkIdOjSRaSaRl+bJoJlIPZJhvx+D
 V4cJs2030wMz6libiniHLa/V1B+j+FfFJ8z1u6aMPsKnC36Y6GazS3fKPdzYLX1+K/dm
 5+QWdRivL3alcbAuoJM4KIY8KnnHVl5JjoqodLSlHKnz6IpKgL69QZAb2JOEQ1ZZpei8
 OH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AfELcrlQOVyKyV5lgWK/m1/Yz/sIigvP3XBFHJRaEUQ=;
 b=g2HPTQAxyY4L5x34UfNwpahhqpurKyinDT5iP6fz0TQGTHkdgOm4wH6ZjA/xlV45FD
 ysB2pdZbeoukqSm7ySQQjATk2wcsE2dI4kIfUo50GH8hFeqmwPyqki6d8J40o4e/l1Mp
 QloRGIPu/SguFKAIOw/20UCA4JcLfeeB+oTsVEbCtcM+F3l1C8raBRmwdeIpBwCootTx
 RmgsXloalO66LbWsuK9OyWgDCYvTMUTaRYPdL9vdgAsdXHNkKkvKnOjR4YUVfW8vAa4R
 lw8Wl/qohOCbq4hJYFu41NHSurrqMqmwYLMH1jmBN2cF5hDF1SF+VUIMttAwCmN+wPTu
 DSPQ==
X-Gm-Message-State: AOAM533fzikbV4Hk7PzUWFbyE21svJgE+59x9SkOnJzz1FSQYcfWmXhs
 biKCVb47XOBPWzwDRemXoJtLog==
X-Google-Smtp-Source: ABdhPJzLAb5vs3Ga/n8p4JohpK18oxrkBLYSWFlV8AEOmwY6z1HNH7Mf1q++QjB18i8zuTkyaFSKsQ==
X-Received: by 2002:a62:7f81:0:b0:47b:e52c:1896 with SMTP id
 a123-20020a627f81000000b0047be52c1896mr11804628pfd.37.1635192583810; 
 Mon, 25 Oct 2021 13:09:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s20sm20905531pfk.131.2021.10.25.13.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:09:43 -0700 (PDT)
Subject: Re: [PATCH v4 01/17] exec/memop: Rename MO_Q definition as MO_UQ and
 add MO_UO
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-2-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1ea56c7e-abcd-87d3-e600-0304395c0f5c@linaro.org>
Date: Mon, 25 Oct 2021 13:09:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-2-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Oct 2021 20:09:47 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> -    MO_LEQ   = MO_LE | MO_Q,
> +    MO_LEQ   = MO_LE | MO_UQ,

Again, I mentioned that this would require renaming as well...

> -    MO_BEQ   = MO_BE | MO_Q,
> +    MO_BEQ   = MO_BE | MO_UQ,

... and this...

> +    MO_TEUQ  = MO_TE | MO_UQ,
>       MO_TESW  = MO_TE | MO_SW,
>       MO_TESL  = MO_TE | MO_SL,
> -    MO_TEQ   = MO_TE | MO_Q,
> +    MO_TEQ   = MO_TE | MO_UQ,
> +    MO_TESQ  = MO_TE | MO_SQ,
> +    MO_TEO   = MO_TE | MO_UO,

... but you only did MO_TEQ to MO_TEUQ.

Please split the renames from the additions.


r~

