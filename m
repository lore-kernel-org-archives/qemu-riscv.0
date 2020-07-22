Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyHRs-0004NK-8S
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 12:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHRq-0004K4-Oh
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:18:26 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHRn-00046r-OU
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:18:26 -0400
Received: by mail-pl1-x642.google.com with SMTP id o1so1245151plk.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YFbJtf+CWRuJjCYVVs58KiD6YIYaIJ2Jgoffj9BqBZs=;
 b=SzOxPDfIIsM8njGBz12plZUz3qDAawbhWqAl+g2/IVeTkXXiw8dOCowMICATnhlLbX
 X/c0Ys7xfI6yXKHvx1n78q9u5b7/0YoAX2SHv/dGeQheiysbgHHYcSVItZ60K74sE0Iw
 zQh16qIhhRFX6b9rNM3TNHj+MSJllQbt87kaurkZix0duMJarAuAxHyuenACQHIDCR0C
 qKhrFYoJUw6/P72HWqNvamHflYD/Ja0sOZPsL9C+vctl9ul0L8ez9GRg9FeXRfsZJbLz
 D+gzIXyHH/+nBg8vkJnscrDVDdOBivoa748OGYMbdeYws//ZQGcnYpFsNG1pBTsqajeh
 Irig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YFbJtf+CWRuJjCYVVs58KiD6YIYaIJ2Jgoffj9BqBZs=;
 b=nS2O8RrrCCmycUj1cibjFFPlHhbMTbTD5WCN2tMkjmDyTgtslRG/euEs7+il41iNXJ
 1YL1UF7AKQ2J5y/s0GcwHU4GNeygjFB4i7ntnweNHrff4t3Hd7ZyEEZr77ZjUdwRlHo/
 uCSv0jwMp3g/oiRccrFoF29QTLPIa036/GpzgIVsrQ2nfCVMkCmG5J+jYj5LY5BxGcKD
 hbYRxkQv/ff5dn+aBZoS/K4B+8+mLVm1DmmVMbSb9HTATFeugmiyRQbpWK5kakLkJjgr
 LV60NH5DbvV+45c5cZZW+bXEy24ZHtugbd+sBOnGd1/j+cAnppKpuyAaQpF7c6zvPsUs
 s6YA==
X-Gm-Message-State: AOAM533krqKNN2h1EcYAdl0COEuHJmnp4YKIrRwitXq52VD0MdO4q2E+
 6YSBrha4PjRm9VatJevJq9bxvQ==
X-Google-Smtp-Source: ABdhPJzXoxlee68xLMKdNuUSVt2d2zMCgO9JRYwxjQI1xnU1YNovMqzqtcIuPsifz+j9BEMyGV750w==
X-Received: by 2002:a17:90b:1296:: with SMTP id
 fw22mr206796pjb.20.1595434702221; 
 Wed, 22 Jul 2020 09:18:22 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 y19sm64390pgj.35.2020.07.22.09.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 09:18:21 -0700 (PDT)
Subject: Re: [RFC v2 03/76] target/riscv: fix rsub gvec
 tcg_assert_listed_vecop assertion
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-4-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7db64384-920d-b96e-ee95-5f5ec989bd2f@linaro.org>
Date: Wed, 22 Jul 2020 09:18:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-4-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 16:18:27 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> gvec should provide vecop_list to avoid:
> "tcg_tcg_assert_listed_vecop: code should not be reached bug" assertion.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 5 +++++
>  1 file changed, 5 insertions(+)

It would be handy if you would rebase on master when you re-post, since this
patch and the 4 following were merged to master on July 14.


r~

