Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyI0E-000387-Ey
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 12:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyI0D-00037R-Cj
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:53:57 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyI0A-0001pn-VC
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:53:57 -0400
Received: by mail-pf1-x435.google.com with SMTP id s26so1590822pfm.4
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 09:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v02qBny/fBifeAWxA7VPDDvDbBoPApIkv4BMUuzXBqg=;
 b=LGj20X/siigpsn0RhYNdZVGP3MeKLD5+yU0se0y64yQkOmnsQ4zgH6dNqnmIzsqsxw
 Q2c4UCDw5ARGwkyxjA5q/m/2KIA2uBVsfR++ctz47TK5VYnbpmraKY4osv++bB6fiQBl
 n/1R6DjhYW5ITvb0le1Kgh3T8jCMdwNtmkHg71SqOejUmHtwWb5A06hsGGHE467FOWWS
 1pLdLKUmGVQ6XHOrpccjAL83ooEg8jdeKy9LjBodxk8kVOAb/9AanaFhxnjLz8fNDVzT
 neLIXWe+Sq/kzavgWChE/90+pAgDKVQZfHzU3gU9qN1ER0pNEM8ybI7aaB6gf4RYqORd
 8pYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v02qBny/fBifeAWxA7VPDDvDbBoPApIkv4BMUuzXBqg=;
 b=F+mGOK4kN7kJS6sGOCQ3Q6YKrppR5O0J3LTQ4XX/jYN4PFERROHx6urjC9lllW174J
 484qpBZL0Klw5fuoWIXC5Nzh9mDqqzcXhGakBt23fwIyAcIHnb4JC7ba9jss4QEaq4TN
 zpHMioBXDTwcVAzlRbmtjf8fOK9Kf+sC4Zc6QIGg0SVlCtOK6DtOxuZhWyENK0S8hHbK
 SE5V9kdDKCGpGrr9bdssgEFwP94QuH7pHjWWFfjgRZSQej6JmHw81b/f3q5jbPhDomNd
 5KFHDqU7dBKE2eI16XATm/Y3EUuMm0SaAkGVqWgi3IUcMkDGqECvQcO9LazltAWEXILA
 4dMQ==
X-Gm-Message-State: AOAM533LmZbL3FD9U/mF1o2XbsyTuapS1d37z+y9LBYU9oLAQ3a63fob
 Ev5JdPfVqXr3NJG2BuUOUAFe/A==
X-Google-Smtp-Source: ABdhPJwuorP8VaPy5ozHNAS3P0FRtqgThvj8LRe9CB6Z5Nv0iss2iKrRxZzXLDCytLaFq/B+4B0vHg==
X-Received: by 2002:a63:4543:: with SMTP id u3mr610129pgk.398.1595436832805;
 Wed, 22 Jul 2020 09:53:52 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 137sm123506pgg.72.2020.07.22.09.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 09:53:52 -0700 (PDT)
Subject: Re: [RFC v2 10/76] target/riscv: rvv-0.9: add translation-time vector
 context status
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-11-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bb5342f-fafb-cf31-d478-d0d61f18239f@linaro.org>
Date: Wed, 22 Jul 2020 09:53:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-11-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 22 Jul 2020 16:53:57 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 69 ++++++++++++++++++++-----
>  target/riscv/translate.c                | 33 ++++++++++++
>  2 files changed, 90 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


