Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyI5B-0006vT-Mb
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 12:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyI59-0006q4-FR
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:59:03 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyI57-0002vb-Ry
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:59:03 -0400
Received: by mail-pg1-x52b.google.com with SMTP id p3so1609090pgh.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/405If9znH2nDBiwwUGt+7Wbc0uDgVSVGXkSO0lV39E=;
 b=AkF/ct3u9TAGRUWEk1N9IfzmjNhjiHhaeQzhJWscQdX29wvksZlx61WtKY4js9nAWE
 cligGstfIHl1whHhhsO0Vt/9V4YjXccVzRPOhLCW4BtMuL/mabjXotA4W0bt2LFQl7g0
 1OY6JPKew5dyaHbBXbOuVH8qo5fobd1jWdfheYadF9aaUOAN3nSjYRsbmJXz8vCYpAXx
 Aw3YpPrLj4wXAylnUclzDG7K3WBCdjHCUQ+GoHe590f+g68CY1d1HT7mXyQYz7inXU3t
 7ZIrvitMt3X1z36yK+hxMCZ+Jj/9DXHNiT2jInImje6lTDy/6TVSElVfBgVx/pcRvYqV
 tRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/405If9znH2nDBiwwUGt+7Wbc0uDgVSVGXkSO0lV39E=;
 b=p5eOShHNnXO/aORL5HM1VJyqKtsJgBFO94FuDx2YlCWzZs/HZEiHxJlzk103ePwSqA
 s7tyZ+qXk/HVVKthLjIpYBlZR1jy7QUA1t9aPRyELOKmcamj2+inKmTCJwcKDnf2MKQw
 6dDxy7ZRIvSXucfnk5hdPrFboMHrJTd4C53i+Y6gmubjRRs5zpuBCe/GqdNnI3qWqZoP
 3ZBLDNV1JQ+P7X08D4SqxoJ3sq5z0g75DiWW0EYVBeYShGo9OS3xf7wsExWE2C8ITsV1
 SjvE9fEXOjDnMpm4tVEl2wZIheaG3Lq7nnZJKDnRG1v1DYNQawnQQ+hpyP1/7KQsM7MZ
 ZqXw==
X-Gm-Message-State: AOAM531TZKBDKD2Y/EFq6j/2l+RBUeNhAs/129tP6P6U+zrMrt1vG0+G
 IPWEyx4s56i1FBzYN0Hx7dL/FQ==
X-Google-Smtp-Source: ABdhPJzmH4cceTfd6Otx7Ktru6vdaR8X+jflXNGqRI0Kr7/togmQ+YGCIvY17Mo2wFkd7kOKbm93Ig==
X-Received: by 2002:a63:a119:: with SMTP id b25mr680721pgf.10.1595437140328;
 Wed, 22 Jul 2020 09:59:00 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 x9sm178394pfq.11.2020.07.22.09.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 09:58:59 -0700 (PDT)
Subject: Re: [RFC v2 13/76] target/riscv: rvv-0.9: add vlenb register
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-14-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d47835e5-6eb2-9a91-f958-2aa145e5d693@linaro.org>
Date: Wed, 22 Jul 2020 09:58:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-14-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 16:59:03 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu_bits.h | 1 +
>  target/riscv/csr.c      | 7 +++++++
>  2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


