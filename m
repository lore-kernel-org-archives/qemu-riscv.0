Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGbdH-00010f-5V
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 03:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oGbdB-0000wd-IC; Wed, 27 Jul 2022 03:38:59 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oGbdA-0002cp-2B; Wed, 27 Jul 2022 03:38:57 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so1348457pjk.1; 
 Wed, 27 Jul 2022 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LX17CtWsqt96TYr5jR3j26tlDpI48XDK2jiZyD2rGHM=;
 b=ZyOfazL5cpj/45AMl1pHrrRJahixo+Gb3mL5x043mNc9N1xpAxjIx0yqeSMzjo4/YS
 eTyzj+2CZAtOM3webWqr5+fij9/cTVb1Ev4aw4CUN8Nk5tctKfqAM4b192z1gLvzynxd
 VaR9bkSmq0Pkaokx9TCJXMAx75oN/zjp4AV5sxlBC9vJB/pT+f1jC8Dm2AVfoFgQD5W9
 YX9QVxTZ8rviNtAesj6VRb+GAAKf9pvN7hRYKRGtBnAg5eR0Fa5KVqcclEOV92oZV/AN
 spi+M5q/1cDLzuTe152KmzNHZIq9PMGXKuwyG43AaYeQ6wqaAmivdmKPZ73rIcSH/Vi/
 YF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LX17CtWsqt96TYr5jR3j26tlDpI48XDK2jiZyD2rGHM=;
 b=VzWD5tRmSimViLN1cym1k46vJPS/KvffRJ8TjVhBdgZcxJpk6wqueWnGNAspycX1vx
 H28obL0//jMxpbaU9i9Js7EYyprwjnJSQ8SGoaSPDHRc5UGi4/+8s+KATTUNi66nsl7+
 C2PRAH6wxAzBLtp+0AHGp+I7zoUS59K3gdeHNteUdwhxB9tl0aZtyFy1XOFnqMiSFySC
 qNuU2YCGAbwhsI/mgenK15MTzb60R2J7DI4tVz9XBmUqc6buWxAquqqhOLMWkjWxMUb1
 pxbAC3gz3mlz9GIah8gRFUq7Fzrfi1NE9iRI2JGS7F/DUJYGxO0prg0yS4EdFg/u1bMM
 TEAg==
X-Gm-Message-State: AJIora+cDhWEF09euQ3udlCctIgZNKi3Euyj8F2/umEb1BKjBHpuheAv
 8F+LFK+k5Mk2c4WJBUUJPybwzicjRTDssJ/Fjzw=
X-Google-Smtp-Source: AGRyM1vAnQR7G93RvhIcP98PC4kwyFucpuXmARqLmTERthKe3shzEXL+Hc31VilWWvPhlHIqFtdsUaX4JGIEJQbAWN0=
X-Received: by 2002:a17:903:2285:b0:16d:6c38:d351 with SMTP id
 b5-20020a170903228500b0016d6c38d351mr14190976plh.121.1658907532789; Wed, 27
 Jul 2022 00:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090335.671105-1-atishp@rivosinc.com>
 <CAKmqyKODh+im_v2NJhRcYgeaYmvDS9BXW++RaOzEb9oQD53zKw@mail.gmail.com>
 <CAHBxVyHP8HYytR4ifBZhSOkEPX+u1tGdoVu5jk+FanWbHgD0-w@mail.gmail.com>
In-Reply-To: <CAHBxVyHP8HYytR4ifBZhSOkEPX+u1tGdoVu5jk+FanWbHgD0-w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Jul 2022 17:38:26 +1000
Message-ID: <CAKmqyKMXyNDyw782UDpi-frfDSjuGUKd1JPNhXNbeeiY1OhW3w@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Fix multi-socket plic configuraiton
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 07:39:01 -0000

On Tue, Jul 26, 2022 at 8:30 AM Atish Kumar Patra <atishp@rivosinc.com> wrote:
>
>
>
>
> On Sun, Jul 24, 2022 at 6:14 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Sat, Jul 23, 2022 at 7:22 PM Atish Patra <atishp@rivosinc.com> wrote:
>> >
>> > Since commit 40244040a7ac, multi-socket configuration with plic is
>> > broken as the hartid for second socket is calculated incorrectly.
>> > The hartid stored in addr_config already includes the offset
>> > for the base hartid for that socket. Adding it again would lead
>> > to segfault while creating the plic device for the virt machine.
>> > qdev_connect_gpio_out was also invoked with incorrect number of gpio
>> > lines.
>> >
>> > Fixes: 40244040a7ac (hw/intc: sifive_plic: Avoid overflowing the addr_config buffer)
>> >
>> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>
>> Can you share the -cpu options that causes the segfault? I'll add it
>> to my test case
>>
>
> "-cpu rv64 -M virt -m 2G -smp 4 -object memory-backend-ram,size=1G,policy=bind,host-nodes=0,id=ram-node0  \
> -numa node,memdev=ram-node0   \
> -object memory-backend-ram,size=1G,policy=bind,host-nodes=0,id=ram-node1 \
> -numa node,memdev=ram-node1"
>
> You also need to enable  CONFIG_NUMA in kernel.

Thanks!

Applied to riscv-to-apply.next

Alistair

