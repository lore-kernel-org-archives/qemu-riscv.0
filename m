Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7QM-00049k-Cs
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7QK-00047v-TY
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:26:04 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7QJ-00009b-Bw
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:26:04 -0400
Received: by mail-pj1-x1032.google.com with SMTP id s2so1075808pjr.4
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GHmFgHDgWgCLIYeotRnGnQC29SLhmslWyqT3sF8MxZQ=;
 b=Vvia6TUdMZ+uBn9P5y2BR2qidkVGv6ql7n35UlTRoByFnUbYajeT4i8QpMOPErAOAl
 qHo/H+HBv8QrfcRjHFLgHjXZhMbqJ5gSPpr50YKIhMaKlaU5cvtYqigvpSoVyK3J+A3h
 3os+UuHEO0zxBstQRYkAUsdneLKaDt06hvwh1DgJh3Z9KuzEdpRBSEXFlCFYSsv3vP6Q
 vRTS/jQoK5pYfFTHJBmXO3VVz+eCnD5v90KmebTE4ZOjUqK+RD/NFD2mQZDFYXN/b51Q
 +eoMpEgfvQuRcnIeK2ryA8VmqELmP2cd4tphVzvexq9PdFCcgw40yyPoPLO5RrCw1D4O
 L4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GHmFgHDgWgCLIYeotRnGnQC29SLhmslWyqT3sF8MxZQ=;
 b=sNzoFl9s5g3pLS1y/XPI9PQCNwUSmcZbCFE7xbZ7gDBHowJ3is7uXBPhEC+CD8vQAK
 H4aNqWEFKxzDVydVjR/FsGU87UY7yW8r08wN+Bvmvvh2sYIO5z/JPHbNRtFAOov/G6aF
 7x+dY+OumwIAhmyEQgP7XuW5/eKXq5zDdlAetmJD/H5vXUxP/ExjOM3+oXEQMq5ggrb6
 Ct8rbz7hkEps6cLYif44tFCpm8ie7x+ZCcZfef7V2RIn/it2z7vnyqQzF9KVOwI9S5R4
 Qh8SnFcr/5C3DMGFVBOO/t2e0uIQ6XkxsNnF6P+Z3fnrzkKS8jX9qmTJGHhBRwfaKl82
 /yzw==
X-Gm-Message-State: AOAM531opPjsEjn0MoMz0/K6h8gynUbOEqsw1mkaAlWS0+B0Mu5/pv4X
 /vFOLem4rkXZMtF4WLFRUgd+n6T0USfteQ==
X-Google-Smtp-Source: ABdhPJwhse6GmCi1Oh4gEH72T85scdBlj4uHqb9vLm9zwo5P8yWPL/F7jC9zknJ0hSipFNCwxEhb5g==
X-Received: by 2002:a17:90a:f2c1:: with SMTP id
 gt1mr4393340pjb.70.1598732761841; 
 Sat, 29 Aug 2020 13:26:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id fv21sm2757943pjb.16.2020.08.29.13.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:26:01 -0700 (PDT)
Subject: Re: [RFC v4 51/70] target/riscv: rvv-1.0: mask-register logical
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-52-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d753bdc-e432-2796-7259-d1936316a0f6@linaro.org>
Date: Sat, 29 Aug 2020 13:25:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-52-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Sat, 29 Aug 2020 20:26:05 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 3 ++-
>  target/riscv/vector_helper.c            | 4 ----
>  2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

