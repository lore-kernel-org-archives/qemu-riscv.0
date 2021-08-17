Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG7QU-0000mR-71
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 18:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mG7QS-0000lN-PH; Tue, 17 Aug 2021 18:19:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mG7QR-0008JH-77; Tue, 17 Aug 2021 18:19:16 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z9so290774wrh.10;
 Tue, 17 Aug 2021 15:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LogKhW2RI270HYTNdxSPOA16HdZ8QLDM/g96X5ZTl6A=;
 b=Jd10b8jdKprfIYiHSaE0nCDuPwCtwpR2NMEJe3pAqOZvl6tr6f1My1RcAQPjoOmlna
 5d0MzcaJRTVXSioP3H+ZVSWcAdsZ83Ul7q6WIByLm3cX+HsryqTCWh7Fa+ah/XVZgWw8
 ln/lKa06/yRXiAqRyAN+RYHoKxZ6lI1YTvG5cnUFCfEzjgvbtBIiYZnMU1ifTgZZCXrh
 ZR4PRdcKwILyWITqxUKAO45fepvTkcym/cc261nLhdjwwC63bdA2m2XB4izD9K9PqoRi
 +3T6uUjZ/IGEURr8sgXElK7KYr9I7oExYOpp9oyP1T96vmzbiPmn7jX/i2DAzqn4Ewh+
 mwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LogKhW2RI270HYTNdxSPOA16HdZ8QLDM/g96X5ZTl6A=;
 b=pBvBQW9H/PRNviNVL0sLnFxbRRnGkTnGYp+tHaRkgVg1+SFkmJfTa5qNfTEM1t32sS
 M32tsyxApdsZm+/G117ujK7XNHaScGt30ODDAy7BJ0yCPSBWG9NaqxrYHNyhsCKrhuWa
 w+J1lySbwYRaaH1hH5+b99mz3d0RiDUBNzUXFihPODs2wi7YCt43YJzMEkGN+JhBgG8n
 08T8bfaGBsAA7T2fqTP8RBfkkviCPrkubKEIGPzEsL6O7VnWY2NjICpufU00SSgIPCs5
 Jiyivjn9MhGe8U9eJFWcweqRW2+uwpzmsOqDX1reOm3iGbKbCBXLhm3kQkZZsB8PlqI3
 aCjg==
X-Gm-Message-State: AOAM5316oTkggJrkqdQspweAdi+UnHXaApeX07tqqKJDRX0l/Ni8F+2H
 Wqc48L9qtNI7NQxNNYSwIVw=
X-Google-Smtp-Source: ABdhPJxDhQen2SnZbwM62/QjB4pxUR4aN1dq5om3qQA32pqYaqEfCIq+3m4qi4IwLv8uBIEz/Fw3SQ==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr6709578wrw.412.1629238751813; 
 Tue, 17 Aug 2021 15:19:11 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k13sm2950757wms.33.2021.08.17.15.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 15:19:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 08/21] target/riscv: Move gen_* helpers for RVM
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 zhiwei_liu@c-sky.com
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4855b75a-8319-cf5f-098a-14299ea33cd8@amsat.org>
Date: Wed, 18 Aug 2021 00:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817211803.283639-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
X-List-Received-Date: Tue, 17 Aug 2021 22:19:17 -0000

On 8/17/21 11:17 PM, Richard Henderson wrote:
> Move these helpers near their use by the trans_*
> functions within insn_trans/trans_rvm.c.inc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 112 ------------------------
>  target/riscv/insn_trans/trans_rvm.c.inc | 112 ++++++++++++++++++++++++
>  2 files changed, 112 insertions(+), 112 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

