Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG1p-0004FH-Gd
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG1o-0004DA-1g
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:54:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG1l-0002Ld-47
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:54:39 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q2so17616412pgt.6
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Smy+5rqb5WGxuJIU2pW6Mp+GWH/x3miPFyppY8NPDhM=;
 b=LgXPP5AGS/KpnoQ0z6W+wl6L0NEpKBAVROIZ0nUPI2w+Ujy1lQffUzcMRCXI7zqO+r
 fqatD0H+b7tZb4NIN1rgSTHWCKr6wd4HCoC01Lu49hEeRFRUqeBu7AWx9GHNKMPDc8EX
 uDfQpmMREeUtbSDuVqDaUpX6am0z2soCdR2h4xSbk7VVmK2jDKMJcBYYphKm/pvth3ym
 I1Ap9bU94QhQVRTUMaYmjwW/IRV/BRN95MCCjdGY81xolDgmuyBRRXnV+1RUOjQ7mn1l
 GadMpGsDJRQ7sEFEnVSfBxItKR2MLhYJsbx2Ko4aeBM4Ck1LeHebKv8stEpCqkO/7Yd0
 rVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Smy+5rqb5WGxuJIU2pW6Mp+GWH/x3miPFyppY8NPDhM=;
 b=oh5HZjMt6KnlAIGRiQjWNWacCRN5pcyOYDFtVIT2Zrk71oy4uhmcCecAanHiIetvFx
 twv8rAOOdADTZDmBCxlovBDY6/CYbAdnjQfH/xWcSTnPF0Zfij1Jt1LfY3DjyiqbUvzL
 5J3BopC86a2I0XwkqpbJduiE+vjOfUadtvY7i3rsIqfkNtLiLlaz6S9JTMs/oJnMfNeU
 Xa2Oil+PVI0axHWzI4lVHX6eHOGlRgSqhBMjQx06djeN4Ai3lavwPoDgvDw6rGX1B8yA
 UTvvKbtd+3xPQIyafijTRz8PXewoG1ub8NPf8k2J/bsP3NPPT1arzWFs8R6C5OkTOd5v
 xcng==
X-Gm-Message-State: AOAM532ytokFo8NrC8XR+LjSX8Dd3MpXFffcFK2+Rg5kvFjRVJVV4eFz
 E4wA3Px5ba0ZTLYZe8H9gTkMUg==
X-Google-Smtp-Source: ABdhPJwXN/egaAzFcCCKb2i4Ns2Sarl/yQnzBif/Mf0+gs3c6s1hmSLV+aTFSttmjIZgE4/aiKLyrg==
X-Received: by 2002:a65:689a:: with SMTP id e26mr34121278pgt.193.1629748475527; 
 Mon, 23 Aug 2021 12:54:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k25sm16783781pfa.213.2021.08.23.12.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:54:35 -0700 (PDT)
Subject: Re: [PATCH v4 15/21] target/riscv: Reorg csr instructions
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-16-richard.henderson@linaro.org>
 <CAEUhbmXw1yHj42wubAg0zA5WO_3mXg2dYudD7G8ofLPgQ33JWQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <682775b2-7aa1-c962-1b15-3c03283df605@linaro.org>
Date: Mon, 23 Aug 2021 12:54:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXw1yHj42wubAg0zA5WO_3mXg2dYudD7G8ofLPgQ33JWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
X-List-Received-Date: Mon, 23 Aug 2021 19:54:40 -0000

On 8/22/21 9:54 PM, Bin Meng wrote:
> On Sat, Aug 21, 2021 at 1:43 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Introduce csrr and csrw helpers, for read-only and write-only insns.
>>
>> Note that we do not properly implement this in riscv_csrrw, in that
>> we cannot distinguish true read-only (rs1 == 0) from any other zero
>> write_mask another source register -- this should still raise an
>> exception for read-only registers.
>>
>> Only issue gen_io_start for CF_USE_ICOUNT.
>> Use ctx->zero for csrrc.
>> Use get_gpr and dest_gpr.
>>
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/helper.h                   |   6 +-
>>   target/riscv/op_helper.c                |  18 +--
>>   target/riscv/insn_trans/trans_rvi.c.inc | 172 +++++++++++++++++-------
>>   3 files changed, 131 insertions(+), 65 deletions(-)
>>
> 
> When testing Linux kernel boot, there was a segment fault in the
> helper_csrw() path where ret_value pointer is now NULL, and some CSR
> write op does not test ret_value.

Thanks.  It would be really nice to get an acceptance test in...


r~


