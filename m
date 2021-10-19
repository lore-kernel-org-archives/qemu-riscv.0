Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcyFp-0002Hq-2L
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 19:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcyFm-0002E6-Ag
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 19:10:42 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcyFi-0006oL-9Z
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 19:10:40 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e65so18379020pgc.5
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 16:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2vhZdTVF0a1VHjMw19RVHedj9sqnUbq+s8FhCbp7Y+I=;
 b=aL8BsX9kDpGo82J3SvyeWnFwL8P9DjuPFl9STqEJfw8Bt0goVUrPanXc68TjDWEE3t
 p81HCDWzY2gjKVaNf+JkTzWVqgnZpVihEcvVSmwn2kNI8bz2bUzI2QyzZzW4pPqkUtbi
 /JiCeJou29JHKmKi0mMO5mzEN279DM8HdueGBE5vPX23hBD5TBKD0hcjteVtAvGGB8N+
 pZgUC2duvVDbj5Wtv5iuypMbGSKu9lMPb6iwooxBpAj4IbS156FgcQrIyUPl65QFuxTy
 LmFbz25vhrNRZ8i17KRMtd5A7gENyEMQpDjyhvgcJtdtU5hG6ZCzB5P9NPMTj6JquNkp
 QmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2vhZdTVF0a1VHjMw19RVHedj9sqnUbq+s8FhCbp7Y+I=;
 b=aEZnr4Nd5Bcq0R1ikF+qycOfPbc2cfczbh10zWvENvJv8049iV+dVhwbtu/3bNIRsx
 QWtx8UXeX36aavrlpMawe5zateoSCQpASJj2DromL64PgwPHOi2D//Ktf+YwgB7RdyRj
 CICs2izcaQhRLPpVJcXZAp5Da6u1PLTivC9eBsN6kQqfk8Tx3TjZWX/7h2BNlMW5XkKw
 KrCSrd6PK3ytw4lRKKdOt0Aui7OgQR+F9Pi7YtQRmoG6U5NelR5Iquc5lYMCpsMlg4mi
 dAoOWopSEdVDHdRnwmzimOrsS6GpbPAItwi6L/yDZ06CwNYg5aoA7PinPd8+MOjQ0ho4
 chYA==
X-Gm-Message-State: AOAM533df3vbqU0kT9BxERfa9okFW2e1snPR4KjCrstTRgA7OTzYProU
 9z7NmDmeiC3g+q8p8FdJ/wl3Wg==
X-Google-Smtp-Source: ABdhPJxb+CGMkMsJsqLnlbVZR9DvqH55uiScwuIgxTq83dLS5F33dqHsjtna6za9azUCbnq+jZnswg==
X-Received: by 2002:a63:7051:: with SMTP id a17mr31081068pgn.417.1634685036399; 
 Tue, 19 Oct 2021 16:10:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm4183359pjb.2.2021.10.19.16.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 16:10:35 -0700 (PDT)
Subject: Re: [PATCH v5 14/16] target/riscv: Align gprs and fprs in cpu_dump
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
 <20211019152438.269077-15-richard.henderson@linaro.org>
 <CAKmqyKPFnJpY8ef2NohQ1ckAJN7o=DXjWQQ2KANp_P5s+507eA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b587f74-b290-f2cb-8dbf-ce0049b90a55@linaro.org>
Date: Tue, 19 Oct 2021 16:10:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPFnJpY8ef2NohQ1ckAJN7o=DXjWQQ2KANp_P5s+507eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
X-List-Received-Date: Tue, 19 Oct 2021 23:10:43 -0000

On 10/19/21 3:10 PM, Alistair Francis wrote:
> On Wed, Oct 20, 2021 at 2:18 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Allocate 8 columns per register name.
>>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> This probably isn't required though as there is already a similar
> patch in my tree:
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Ah yes.  Just drop my version, I think.  I can rebase on your branch too, since I see a 
conflict with that patch.


r~

