Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otefO-0007GJ-0b
	for mharc-qemu-riscv@gnu.org; Fri, 11 Nov 2022 19:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1otefM-0007G7-V5; Fri, 11 Nov 2022 19:46:37 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1otefK-0001N8-Bj; Fri, 11 Nov 2022 19:46:36 -0500
Received: by mail-qk1-x72a.google.com with SMTP id d7so1727033qkk.3;
 Fri, 11 Nov 2022 16:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hOWnhd9jB4qEfiDpej8jJQjB4Q/arkI6gFLu4bmVV+U=;
 b=e/AEuuVEfEXKDiz5l+KcJRJ/ZaDaFbn2ivZuOcw07WFXExk4vSnxRCQT45sMsj8p4C
 lYR3iigsPYZQ/bgmzkHyEyeMW+UoceCbs3uhNmYynZyihhoNFG5/DBKfbvZe4gWaJa6p
 2OFszsgWdctd8kIlLxIhI7cZnd4JqnvN9QLTUbpvNWA8doNqtSkvem43VdVWJGyi41QZ
 MW9Vm2jqmIexFUiidQJ+i0i3lOdXkYDnjsF8y2FdWTKrDhVGCmK1b04TxUIHnclqwM1E
 1K/zYtX5Jj/hoSK61xei5MSno1NffCq1DSz2CWyal+8J1VGWtPk7Kh80lIroZ8jNqhk/
 WdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hOWnhd9jB4qEfiDpej8jJQjB4Q/arkI6gFLu4bmVV+U=;
 b=SNBvQXCyjTGbehwYEtbnIscQ8SodA34FAIt2mKbCHtqX8TppEN+bJyHNnddKF1g0CV
 HYz1FxfqDP7geM9WFn1dgMwZtcZt7At3oUwEQGW7DpY8ActXz1Fgr7/ArIYGCpNgBas8
 TR+Op2FSz8WCAl2o8AsU7oB1dbVK+sZ+1x9HfPZkxxNwS9UlVdcfxT5aDB3m60lxFXdN
 jz53YIFg0aK3OculZ+JUZs+QMqPdb2oOjdKEU2J4U+g+iArUPf1IMG9w3RQy1QxAvFQ0
 j4ciGSH+0Is8bLtP7aJoZ86AYCu1+4r6YfHYCdPX3GFWzGrIyaY4MLjYnRUKwwacnERx
 vIdA==
X-Gm-Message-State: ANoB5plm/DqHrS4gRfo8SHuHRLH3ZD9jGP79arVt4xltzKjQVqSFXlR0
 1Ui03GMs1vFR9xcI27Vu4+7+cV/+0Pa+Xke63vo=
X-Google-Smtp-Source: AA0mqf7nx2r7EhBWoy7WWfiP5zQ2W9srtYNaExq47UzpM+1LtmbFU2liQEX4gL++nBpUfm7/Gj4jpC6NbiJ3qbDeito=
X-Received: by 2002:a37:b007:0:b0:6f8:cdc2:b7a2 with SMTP id
 z7-20020a37b007000000b006f8cdc2b7a2mr3269861qke.132.1668213992974; Fri, 11
 Nov 2022 16:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20221111201337.3320349-1-atishp@rivosinc.com>
 <CAEUhbmV5ZJ0YnrGEtqTJ9PCCdGsLjxpVnK2qHhc7H9XBDHDkhA@mail.gmail.com>
 <CAHBxVyEjk1WVDOi6jSz86gLXV50-aEnFmaYjDvQu7PSdng_NLQ@mail.gmail.com>
In-Reply-To: <CAHBxVyEjk1WVDOi6jSz86gLXV50-aEnFmaYjDvQu7PSdng_NLQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 12 Nov 2022 08:46:22 +0800
Message-ID: <CAEUhbmV9u_yJOvcVR8HwmSbtTe9Hk3LWb81zc=HAcDSWrhE5Sw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove the redundant ipi-id property
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 12 Nov 2022 00:46:37 -0000

On Sat, Nov 12, 2022 at 8:42 AM Atish Kumar Patra <atishp@rivosinc.com> wrote:
>
>
>
> On Fri, Nov 11, 2022 at 4:39 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Sat, Nov 12, 2022 at 4:14 AM Atish Patra <atishp@rivosinc.com> wrote:
>> >
>> > The imsic DT binding has changed and no longer require an ipi-id.
>>
>> requires
>>
>
> Sure. Will fix it.
>
>>
>> Could you please put a link here to the upstream imsic DT binding for reference?
>>
>
> It's not merged yet. Here is the latest version:
>
> https://lore.kernel.org/lkml/20221111044207.1478350-5-apatel@ventanamicro.com/

Thanks. Putting this link in the commit message helps a lot.

>
>>
>> > The latest IMSIC driver dynamically allocates ipi id if slow-ipi
>> > is not defined.
>> >
>> > Get rid of the unused dt property which may lead to confusion.
>> >
>> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> > ---
>> >  hw/riscv/virt.c         | 2 --
>> >  include/hw/riscv/virt.h | 1 -
>> >  2 files changed, 3 deletions(-)
>> >

Regards,
Bin

