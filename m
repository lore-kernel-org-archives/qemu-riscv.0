Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhUfP-0003ed-G5
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUfN-0003by-Ol
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:35:49 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUfM-0003mN-8P
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:35:49 -0400
Received: by mail-qt1-x82e.google.com with SMTP id f1so15325203qto.9
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NIOEmJMXFSVvT6/HSMYdC+jxaCT+NWrSKzzLgEdMcWk=;
 b=FNZWXDScSsvzOsdJr9bdzI2Uh5bQJ+GeV6Ww7UAo5j/jZOtJVVlI+oWE4FBLbID3bw
 IgKHHQB6RtI4iRHO6J5b+SF3j8Xhr9NMUH/XouD+5uQ6skjVlSZ36BSUFolERMuzo0fb
 8iCSwOxVRky2tFK3gniDHwY8r/KVVfiSnoyLy+QlMUK1GOU0q76AZZMKlp/bM4Kzza1h
 O8NCpqdO8BCyGVpJ+Mm0Ys1mJqAgUxJEWOKJiWOMeXI+i3rQp5LY1icIVw2D1IPkRgAX
 Hs8qiSmu5l4R9h6rrYdBkjW16jtsm8PGoU61lYt2FNLhv54xJrBh3xlltwSayBTWyp+i
 Mc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIOEmJMXFSVvT6/HSMYdC+jxaCT+NWrSKzzLgEdMcWk=;
 b=KEGk40hmO/PaCPRDFZJcsWzEOrdaift0sl4+FkIRk8/mlafL23ateKWDb2/j01OC+h
 ietiyiuDPggMVa354r66o1kSE6Hi9LSVNAeOKRtA3rbMPf7pfSmkec3QG7Sda80bRsPh
 amDkCwyjMCzkV6fNrBAmMwES/bAYPRS4l+av/mvsWiACB5CV9xV1whcVdLknAjSe/H6x
 EKY1YfshVqZjosWoN15DX4qGMcYyFAMY8sYOZ/cC4Pk4P7GjhD35qlht6+8Hs1WGaqGA
 MnqzMGqi9p+KNBB++9pTI0NP6RijNlQLV5ND3XPUbHr2fJpgClItEyvKIGqku7r/oktd
 NhPA==
X-Gm-Message-State: AOAM531R7muh5VyLvfA0rgZ6U1xXYUBdBXMkJbqmKTq0BLd/x2NQNo5t
 qcvSzk1bVlCOTMeZSRf8VXehw6R1QXEqfw==
X-Google-Smtp-Source: ABdhPJyO46ADAFw1DWGnaDMhvUaJ4DeW2ARvc9Dt8dzU1amUi+H9bRTXZfoGVLBZ0e9rJpddsWnk5w==
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr8186714qtp.414.1635762947273; 
 Mon, 01 Nov 2021 03:35:47 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h68sm9912364qkf.126.2021.11.01.03.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:35:47 -0700 (PDT)
Subject: Re: [PATCH 03/13] target/riscv: Ignore the pc bits above XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c98ffca-202d-2c16-fcae-201003c05849@linaro.org>
Date: Mon, 1 Nov 2021 06:35:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 10:35:50 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> The read from PC for translation is in cpu_get_tb_cpu_state, before translation.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Could perhaps be sorted to patch 2, then riscv_cpu_synchronize_from_tb and 
restore_state_to_opc could assert that the pc is properly extended.


r~

