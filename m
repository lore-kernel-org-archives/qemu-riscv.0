Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOlAt-0004gv-W3
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 13:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlAs-0004aj-Ao
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 13:55:10 -0500
Received: from [2607:f8b0:4864:20::431] (port=43737
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlAp-0004KH-S0
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 13:55:10 -0500
Received: by mail-pf1-x431.google.com with SMTP id d187so11821700pfa.10
 for <qemu-riscv@nongnu.org>; Mon, 28 Feb 2022 10:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Or2xiGpiNifEKCSrXGFoxQ+YLaNl0sjN2ZWHBffEPMk=;
 b=w80k9fn2YdTDRl/3+9evnr/T1HhX8DFaImKeig0CMr2JbqGk9zoWPAsVgHV0KnWmLJ
 U8kIHLQRJqCP20QLRoEK7zqMLjFw6Y+2ZtqJoo0vFO5AZHHuxz5lVigHWA4CCPuRQwR7
 BxWafHvDjax17j7WO2QliSSEj8uotCAd5z++E4EKYFFgpBJ2Nr2IiN7kIlosjPNJiVmV
 7/SrTM+TGGzcQgCy5hw5H3XUQMTb4BKtRc6uZQjHhRAsS47ag+kqXjQxYMlx1Qpt13t0
 OumCjxoC8u6sRzmUWsscOINPNB6Ztx9eWokYimgk/i1wzRDaEMTrkBtSwpcwX8motIGP
 mmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Or2xiGpiNifEKCSrXGFoxQ+YLaNl0sjN2ZWHBffEPMk=;
 b=RJwlVwlBa7q/2P3D1WcBkp2LJpkhWCCQCfUWTu6Y+w8Nay+ELK1ucxCNPZS5WRfD4m
 xP3GTf4ssUOa3LkseItHN0NIb+9jEFvKcujmllw7Hk74YPno3v1770B6tq057fk861V0
 6AlvT4yENlLjs6wdJlPDax7Ki6ijC4RWNiywLE6KJGsufcw5zOWxitF4jc7/Dg95yBqa
 sjCSVxlpjQZTpCgxawR0OyloBNxmPjjCWMljKbcVuP1Vlivs9eUwgvReUaJvtiUjCB07
 J2v96Kx54ylbylPvpx0qs3ZhynAgPfW6li7dFd5BeJrF1aFzj0YqKmFA+FUxHwbp9O6o
 GxoA==
X-Gm-Message-State: AOAM532sq1QZtlpTJP7OY3149NrGNK2rIAxLJrZCwhxoEHyzbx+rGGIW
 P2248MD0Y/0SyPLHwHKYkadD0w==
X-Google-Smtp-Source: ABdhPJz8DBj4PHmV6j8rlFDmozAkDmH5/QLex4yrJ0eo5oLIoRE/r5IndJme0km/FfNOmuP67qKUXA==
X-Received: by 2002:a65:5548:0:b0:375:9f78:62ae with SMTP id
 t8-20020a655548000000b003759f7862aemr16738292pgr.390.1646074506524; 
 Mon, 28 Feb 2022 10:55:06 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a056a00158500b004f0f12b320asm15240547pfk.6.2022.02.28.10.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:55:06 -0800 (PST)
Message-ID: <2e7ad1d1-e941-4399-5aba-aafc96e5e206@linaro.org>
Date: Mon, 28 Feb 2022 08:55:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 03/14] target/riscv: rvk: add support for zbkc extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 18:55:10 -0000

On 2/28/22 04:47, Weiwei Li wrote:
>   - reuse partial instructions of zbc extension, update extension check for them
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/insn32.decode              | 3 ++-
>   target/riscv/insn_trans/trans_rvb.c.inc | 4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

