Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi9KQ-0000yT-29
	for mharc-qemu-riscv@gnu.org; Wed, 03 Nov 2021 02:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi9KL-0000xS-HV; Wed, 03 Nov 2021 02:00:49 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:39696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi9KJ-0003pK-MD; Wed, 03 Nov 2021 02:00:49 -0400
Received: by mail-io1-xd36.google.com with SMTP id r3so14678iod.6;
 Tue, 02 Nov 2021 23:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pTFah1HpzlM8+BaaQOB17u3tK9W0TCQRw8tVgAakA3s=;
 b=oMfjwCX+LqcZR8yU/DWdf2p55jHBXKX3TBnkJudVd/e3XB7AmbAef1plmngwA+J94c
 mZ+p+5svkIgTBAfmvpRUlUalG7eYtzadozB5hXWgng9aJI3b4AWQncwgox40szXRSyuN
 liRnNyoc40sTbk7UjjN719vbbgUlBe+VJ8l0jzejSRUhSpFiORD5XT88BfX57ZUO8Wb8
 c3nzF+CQIeiPZ8mTZzKJDAT44sWsr8dPoodpCC45R5OZRTL0khfxG8ycP15EZ4YYWfR/
 +Ck1TUwwNjPEj1O1aFFKopGuskA7Ff63W0/bLpRe95ZpNSGZS5Y8HgZI00qA136uXjH+
 gwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pTFah1HpzlM8+BaaQOB17u3tK9W0TCQRw8tVgAakA3s=;
 b=bC44A2HZkrG6rhpuJNyq2IAnFrnMpmUojlpeyYO8qRRRJlWKTYO3a0PjZb9+Y/woAF
 N1gFwO+4398vRbKXqTdDJovrSiIRPhdjiE6ofNZpYaCtOqlEn4e2JCh04rbxvaH3RYQi
 HBMBJWMRMs9t1/ip7pjqH2yej8VGUnwHgnH0s1OoUKdin/4dJTq3X26GL/eZpO5VErgO
 PghnV2RG42zdQANm5OVXyIc/+j5oTy2VZMTIz0r1tg+9CjAVrRc+nfB0qnoTQXvm2paE
 SZFQHAl9qynjyVq2jMZoDgJHxNMkoLPIIDM7NYSk5F0qVs27EE8e9ZoxWBHOkb2kHTCx
 CN9w==
X-Gm-Message-State: AOAM5335eoJIfHuNqI3Dg2Xk4hCcEMSNd1n6jPrpm+OaWXwhNO22N/yh
 +tqDtKauZq+wFUoWnepUJQbDqZ6NoWOXytU/jCI=
X-Google-Smtp-Source: ABdhPJz0CpHCGlUY5ov+IFoKtD4kcD2lIletZZDP+HxWs2MKyeTzNhVclP/lPG/mUMCbciY7m8gos1LYL/b8HqsAo+U=
X-Received: by 2002:a05:6638:329e:: with SMTP id
 f30mr29283255jav.63.1635919245187; 
 Tue, 02 Nov 2021 23:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211030135513.18517-1-bin.meng@windriver.com>
 <20211030135513.18517-8-bin.meng@windriver.com>
In-Reply-To: <20211030135513.18517-8-bin.meng@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Nov 2021 16:00:19 +1000
Message-ID: <CAKmqyKNnQ9G8K7b4t32JhBdyEisn2=++g1R2kxssYMTSu08iSg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 03 Nov 2021 06:00:50 -0000

On Sun, Oct 31, 2021 at 12:02 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This is now used by RISC-V as well. Update the comments.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v1)
>
>  include/hw/core/tcg-cpu-ops.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 6cbe17f2e6..532c148a80 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -92,6 +92,7 @@ struct TCGCPUOps {
>      /**
>       * @debug_check_watchpoint: return true if the architectural
>       * watchpoint whose address has matched should really fire, used by ARM
> +     * and RISC-V
>       */
>      bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
>
> --
> 2.25.1
>
>

