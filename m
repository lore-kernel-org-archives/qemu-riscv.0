Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzBj1-0005kY-CL
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 23:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzBiz-0005gS-AX
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 23:56:09 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzBiw-0003Bf-Lf
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 23:56:09 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 30so638584pgr.6
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 20:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k/4rWe3H6tDSDiGM27nyBODT+TsqmhPLwnSBt/O2TOI=;
 b=PAJIkHfqc7Gc4N9I+IZD6R5+ghEDqtj9QOtQwq1sEewP3phZMeAGAG8efwWdX90CcB
 3DeMa0Y20smtA91is6UEokTWyR/16PTpgWVLGk+OSmqRqxQY3E+PzEogdLAdeMli7KxN
 6dhXGmlEHlXu8n+zKvR9yVuJu2DDbqKg6CXnQsun6YFiP8z0ntie6Ou8iSOc3a9b2bGp
 uk12yPTdu11mPgON38+LHisq0Dy3qNT8BM70+LRLwdYSbDpV29ds0bl2hMKodEbFO67D
 3aFJwmitQhhUnd5K21VjT+OEHY57i/REdcpp1oluR7D4asJGQogX2110eMVeNQn+vSfZ
 GfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k/4rWe3H6tDSDiGM27nyBODT+TsqmhPLwnSBt/O2TOI=;
 b=XDuE3fl5N95JP6iUPYFa84qzJzSJ4CknfceyUdTF2ofPi4KNSvNCdCGU3ka2aNBQNT
 N4N7fBt9xPC8RFhPXsfuSjhrDTtjjq3O+Vl06k25K4y/URAIAsahm4nAuwfQWzLP8FDv
 K6JGhvO0mhSkaBgXKeohrst0rVE0SkFmosIU1q7D/l9UfdG3S4aV1uL9EA8iZoLS2lb2
 WdIjWQSx9NgmxEvNnuGF3RZcGlCONQXcoJt6hj3WlTIMwQPziITRhtvdyzhlAOzVN49Z
 kZREuiQMlyMUMxHSxMp4xfUVZ7C2zmiMso4dZAiyCScs97HhITvYYFYMY6ZS4QJHw6lG
 Q2LA==
X-Gm-Message-State: AOAM530S+19eDUgANSZukZxst13DLweAA2eKpu9V05bPO1PMj6P0BnjV
 +Wq8O7w6t5aC230bnlCaAUteKg==
X-Google-Smtp-Source: ABdhPJzFzSwUQ4/5YTFd0tzKXts9RfWR86yDlLGbVRgCI73jIYOJIZngmd2k3je6rQQURVHm9avhrw==
X-Received: by 2002:a63:947:: with SMTP id 68mr2912167pgj.279.1610427365244;
 Mon, 11 Jan 2021 20:56:05 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u25sm1372904pfn.170.2021.01.11.20.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 20:56:04 -0800 (PST)
Subject: Re: [RFC v3 09/16] target/riscv: rvb: single-bit instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-10-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa04ac6c-fc2a-a17e-946e-232eae97347a@linaro.org>
Date: Mon, 11 Jan 2021 18:56:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-10-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 12 Jan 2021 04:56:09 -0000

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  8 +++
>  target/riscv/insn32.decode              |  9 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 90 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 61 +++++++++++++++++
>  4 files changed, 168 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

