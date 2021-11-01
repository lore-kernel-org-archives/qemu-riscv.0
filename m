Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhaVY-0004I9-VA
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 12:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhaVX-0004Hs-Ki
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 12:50:03 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhaVW-0003ZN-4K
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 12:50:03 -0400
Received: by mail-qk1-x732.google.com with SMTP id bj20so5844447qkb.11
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cnVVlCM/DuoejXr/6T0xpnZSN1GZx/4+tEgAyUYCK2s=;
 b=kE2wHwplGVYcfcmipmgqCAIZ7EHwxaN49tVBGaT5dwsLgHbImFwOPiLHaO0dwCxpQ0
 zKpSeETM23GfYcaA59ElNtdqGsmnd3+KabfNBUGaCV6CfEbEKq3pjHiZ8CRI9qvwc/JQ
 wYT95mMHb6NHL9dZUE6qkUmJS/ivD5z57pH8IxtYQIJttwdXPCQWo3bBpMsTgsbUunFb
 cLV7aUfiaD5O0nZBPjcjSGyc+IY6aoix8IPDgNO7UV95gC2AGsWdAiP3If1iLxEIjqj4
 liYrU0mBOIbsqkggHj4v6T0DgAT4tQJ4PnIjeqzKeM3RfP6erHi02WyA4bwdhzo7RL/+
 rYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cnVVlCM/DuoejXr/6T0xpnZSN1GZx/4+tEgAyUYCK2s=;
 b=YIDM34rsRlWUjtlUBM1QcjCJXhNeTHO0IU45tE+Bp6QOXT8SdkI6xakMPn5yV99LWB
 90E9CA4FoguWxnirhtnBChaDmfNd060d0m7UEeDffl2vnsMjZbLaZ6y2QL7MRCBBhAsf
 O5h3grKhF9jmgjXrFVcZ9BzZ2EN5LBRfnwtahpMC3aTBW7JL720Tbl+G8JFo1WGvmDVU
 RVWEucNZXUJO5qskJUupg+uhwXbAB9OV8AB3+qwZ+WkqKvGnHwhVjwbh8VBl2HI39fwT
 YslFLwvDLPN5HPbnmb3sndSxvs2AdPLG72vZdiEzCxVI8PydRfNxSKJLJ7AMcd/uPG6a
 Ro+A==
X-Gm-Message-State: AOAM530JYOvUNZeqqDf3cwCqYfQixnB9e1AIS1AS3ejYJpoiO3dWjK/w
 4f0vkxLVoHn7bEEDWzMeY2ZWBA==
X-Google-Smtp-Source: ABdhPJxaRpPChttKjk9UJBJ9ZiNVsPnUUpe1wiih0vQSZDrXWLBWJeqnzin8NBSgifJbjNlh7yHwiw==
X-Received: by 2002:a37:b1c1:: with SMTP id
 a184mr23707680qkf.177.1635785400972; 
 Mon, 01 Nov 2021 09:50:00 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id e18sm8181273qtw.12.2021.11.01.09.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 09:50:00 -0700 (PDT)
Subject: Re: [PATCH 12/13] target/riscv: Don't save pc when exception return
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-13-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0c03c2e-3ac0-e101-23fe-308b7cfb7b5f@linaro.org>
Date: Mon, 1 Nov 2021 12:49:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-13-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
X-List-Received-Date: Mon, 01 Nov 2021 16:50:03 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> As pc will be written by the xepc in exception return, just ignore
> pc in translation.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/helper.h                          | 4 ++--
>   target/riscv/insn_trans/trans_privileged.c.inc | 7 ++-----
>   target/riscv/op_helper.c                       | 4 ++--
>   3 files changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

