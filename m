Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1WjS-00071x-Cv
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 11:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1WjR-00070o-Bn
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 11:14:01 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1WjP-00055H-Ij
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 11:14:00 -0400
Received: by mail-pl1-x62a.google.com with SMTP id bh1so4507563plb.12
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ffm5PrqksEbgTX34yqN99Fp2zUkRKm0ERVamtWSCfq4=;
 b=dyiHvQyHLYJpcSrol4DOO2TanBt9FO2oZYI1JCA8r1BTEOrT93LnkESXjFc8SLO1gH
 Bn4VgBuBcKaul1gFQAJBg6z1JXspa2D6tqLjFzDRHtitXha/ZhUMUfLTTDoIOwrmAiEE
 YHJgye/RgzTi04TGLNSDmaClK34VgDZuitMOeqEGzwcbdWwg+iOkkVekBaf3LnjjbEzB
 t8yOTTpHsU+lif+37WAeW8RdM4Ms7yJ20qH9gltDN/Nar53V2aoXsAADsGKX1wujsSmL
 Pr7I65zXKRmauZ5BbZt2fRvTmCQ98U6r/aUaNGSOSvUYSJk6/4NjnkaCOfNmGpT8GWD8
 xd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ffm5PrqksEbgTX34yqN99Fp2zUkRKm0ERVamtWSCfq4=;
 b=Znm5s1SMwAnOgkvUDSzFMKLhlcw3RAju1BKSAziIHog7puQm1BfwxdmHgil2ivHi4e
 yg0ljz4yFQkufk8LMff7DJkyxyvfARSiL6Dt5Mac8SAjYEDCYcDAFmxnqFbfi/VieOZA
 EubwBGmqGpp2daB6aEhhNjo+03LFNDGsKSgOq78AgD2djZPLz9bPgq2TGz0v8zjXBL62
 xxJvbXsC/aLzb1XRw/nR5kI/PkdIE2bPNDq/iha5+SWOD1d2j903UFESoBSN3SRlm3Na
 IN9QhsPdLdBs3zdPwIIEcYPtLybbdkhHlrE68q0jKiUwum3J3K+Qk4Zd59kejz7HImqX
 Ulzw==
X-Gm-Message-State: AOAM530UxBkwYaJ1eUEwzfzRwhDVJIhZ8BMV8JjjtpKD5WfnY7LJrIdu
 9W14QPAQEnmqENmdUXRzPFidTg==
X-Google-Smtp-Source: ABdhPJwkS0eOrhYNlrMVNmwllfXIOB6gKwbLfhGyvJbWrJj0bUG9YvQhjQDEqhZn0mbS2nVh9FaaPQ==
X-Received: by 2002:a17:90a:a783:: with SMTP id
 f3mr4449405pjq.142.1596208437755; 
 Fri, 31 Jul 2020 08:13:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z67sm11701637pfc.162.2020.07.31.08.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 08:13:57 -0700 (PDT)
Subject: Re: [RFC v2 56/76] target/riscv: rvv-0.9: widening integer reduction
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-57-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <554ad8ad-6638-7cb3-f06c-110baef2218f@linaro.org>
Date: Fri, 31 Jul 2020 08:13:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-57-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 31 Jul 2020 15:14:01 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
>  /* Vector Widening Integer Reduction Instructions */
>  /* signed sum reduction into double-width accumulator */
> -GEN_VEXT_RED(vwredsum_vs_b, int16_t, int8_t, H2, H1, DO_ADD, clearh)
> -GEN_VEXT_RED(vwredsum_vs_h, int32_t, int16_t, H4, H2, DO_ADD, clearl)
> -GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD, clearq)
> +GEN_VEXT_RED(vwredsum_vs_b, int16_t, int8_t,  H2, H1, DO_ADD)
> +GEN_VEXT_RED(vwredsum_vs_h, int32_t, int16_t, H4, H2, DO_ADD)
> +GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD)

This patch can't be split from the previous, because it won't compile.  I'm not
quite sure where we are here with whether the patch is actually required or
not, with respect to VTA.


r~

