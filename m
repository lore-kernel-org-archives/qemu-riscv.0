Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2gM-0001dY-DE
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2gK-0001d9-Eq
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:20:24 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2g2-0004Uz-H0
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:20:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 ie17-20020a17090b401100b00246d4b282eeso1499188pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681176005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7/g5FXYIekeo/tjoBsMyH/ydJP6eFd1LKAan25E+aXE=;
 b=PPNbWnU1UnDXZB5Fnb6s+d4FW2kfrJ2DluLoaAI5NEaz9K4YHs5Xpt7OO4SFtPp8aw
 a6c33bgTniR8B9/q1vFG2Q13mbmy7Tu2XZ6ZNvsMGsTRW0Ngrx4QjnVtu4p1w+b+iQVz
 /O39Kz+vbj53v3TEpTa/IpOqpQTzuGQRsMyD82otlr1WYYJpsAS+DZGZ65Rq7jAdiiz8
 J1yXBXhZksz07f/QFGixSsVTjl2kanZ2HKJ0lTEo2C7/FYUWv1TmRMUNOG2KmKjwXpHA
 KgOPlRcG1dtSv5v12FMhkrgRjSKEUet11jJJzc7/IHtgljZsjmxEX24t/zQl5anlOgbz
 +sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681176005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7/g5FXYIekeo/tjoBsMyH/ydJP6eFd1LKAan25E+aXE=;
 b=PFtsOYuLeKBkKXGnse3/xwfk7GSmdGtdXtDDYwS5+VpdZBMHelOfqjfnbiclo/fpko
 qAooUhum9IKhXmeXQyhWxXHDzLdK4NzzpFgjDFCxBqDkJLKx0nf4sO2jEn/WVJGRwgOY
 ryFwzAZGZJOP69/OGjxrxuLR3uDS6pi4AkeTSL8IKrbeIqjoyvcXpf8+Olu1jXgyBq2y
 fo+o7e9DHHz5I96Hw6DibTo0dDUGdUB5J0Udktg4uNQfRBjVByWJIRA9XEKJdGZ9tgqo
 MApU42z+IZgmCzfkvh88jUtEnpO0MD5yIFFK1jxfvD1YhAMS07BHY2WppNjBoJlWUx2K
 XXxQ==
X-Gm-Message-State: AAQBX9fZzPCFlo45FuY74xIXnpwxwxW782i/Oo4T6Aem+ddeCOJttxEd
 DxODRQXU/4kD58jExWmQEOIyFQ==
X-Google-Smtp-Source: AKy350byxEIS+ramQulI+t21xjaTL5gmqB/e8zbipwmVz/KwHTp9+Za16uY1MiM9JUyDl3hj+OeiJg==
X-Received: by 2002:a17:90b:1d04:b0:23d:3913:bc26 with SMTP id
 on4-20020a17090b1d0400b0023d3913bc26mr15236109pjb.2.1681176004739; 
 Mon, 10 Apr 2023 18:20:04 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 c7-20020a170902b68700b001a064282b11sm8392638pls.151.2023.04.10.18.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:20:04 -0700 (PDT)
Message-ID: <c4e9dbac-cfec-ae70-436f-82f0d70b3539@linaro.org>
Date: Mon, 10 Apr 2023 18:20:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2] riscv: Add support for the Zfa extension
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>,
 liweiwei@iscas.ac.cn
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230331182824.4104580-1-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331182824.4104580-1-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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
X-List-Received-Date: Tue, 11 Apr 2023 01:20:24 -0000

On 3/31/23 11:28, Christoph Muellner wrote:
> +/*
> + * Implement float64 to int32_t conversion without saturation;
> + * the result is supplied modulo 2^32.
> + * Rounding mode is RTZ.
> + * Flag behaviour identical to fcvt.w.d (see F specification).
> + *
> + * Similar conversion of this function can be found in
> + * target/arm/vfp_helper.c (fjcvtzs): f64->i32 with other fflag behaviour, and
> + * target/alpha/fpu_helper.c (do_cvttq): f64->i64 with support for several
> + * rounding modes and different fflag behaviour.
> + */
> +uint64_t helper_fcvtmod_w_d(CPURISCVState *env, uint64_t value)

I am still of the opinion this should be moved to fpu/softfloat-parts.c.
The "other fflag" behaviour is very likely a bug in one or more of the three implementations.


r~

