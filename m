Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzaQ6-0002Am-Io
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 03:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzaQ4-00028H-1p; Tue, 21 Dec 2021 03:22:48 -0500
Received: from [2607:f8b0:4864:20::b32] (port=40584
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzaQ1-00032M-85; Tue, 21 Dec 2021 03:22:46 -0500
Received: by mail-yb1-xb32.google.com with SMTP id 131so36462600ybc.7;
 Tue, 21 Dec 2021 00:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SuZti6/PTCbJBsoedGEEdZM7bLs6cFAFs9T5DZ1nT4Y=;
 b=i3blVLT06Yx6ox6CB/HDamsvmRb4/St9cG8d15hNttzJJV6028ZXuZNKHig8oTI0P3
 u+KveGA+1clNmEm7FUeLnlTsV33PyLIXp9dhGOK5CQ8YhI18lTgYFKZPKNCZ8Ils3E15
 wjoxLM5auPEVSew2sK034xmoMBpTkrv8ub69wP39Ttp26/LPt6tkvxRP7BEdr7KRgS9c
 s7Si/Chon755s1gq4qMdLpg68rXLZRBXRoVPMT6QY8yKUHWLKMlw2Evl4GEQSS2GcBQm
 AwREIB5CgpTYHK6AurOkY/p1LAwPMZsGsJtBeeCUsthgjwXOqc4K7+8BzDt2dg7Iu77o
 fAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SuZti6/PTCbJBsoedGEEdZM7bLs6cFAFs9T5DZ1nT4Y=;
 b=j6mFt3Cw7G6jdBOJz3Pk8Ud6dZwwEHXLqWuviApDeGA2KXVr4rX+aedDdwK+hc23Gs
 h6Cqsb+d8XnQzUtnSufLqY683sJDFWQ1RlU3HWOUOVSZn0w78eUZrDhNJQriN14yurk9
 HnpeHS7xOhmlx1JkjUWf1c5xCZIPitkuQqmkDxDqO6KPOZBV0ZlYwSdozh9dLJ8XWMsx
 ZScTeRr9R3atBdbJMAGzD9rHcrYRlgJzXyy9VTsafXYO1FTnVrWTrMvYjMcxGGagPcSC
 ymn2Mk6jEsKofi29kbEvSxlTsW9Ibz7maYcDKvpDOfKfaK3i5fxxUjiD5U2zKWrRZulr
 mw4Q==
X-Gm-Message-State: AOAM532Za2yEOOX9REmdnJJNHffDJ5mnDO14lxUUFi5OK9YVJtTfSp2d
 A30YcHhMT9RoC7DGOmKj5Th9wC3MqXuF/ISzShY=
X-Google-Smtp-Source: ABdhPJxL+MWiM/ZdULqkWmI8DITBci/GFh7UghQCQLFkNKDews+b5ayoB/KqLFeNcnIvKehQQzjS9FTsxbs/g4s89OE=
X-Received: by 2002:a25:324d:: with SMTP id y74mr2990799yby.526.1640074964115; 
 Tue, 21 Dec 2021 00:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-5-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-5-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Dec 2021 16:22:33 +0800
Message-ID: <CAEUhbmV4FE=hhRAi70joe5wJ=gGjm_JTAhH-GZSf9_-RMi2Fhg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] hw/intc: sifive_plic: Cleanup remaining functions
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 21 Dec 2021 08:22:48 -0000

On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> We can remove the original sifive_plic_irqs_pending() function and
> instead just use the sifive_plic_claim() function (renamed to
> sifive_plic_claimed()) to determine if any interrupts are pending.
>
> This requires move the side effects outside of sifive_plic_claimed(),
> but as they are only invoked once that isn't a problem.
>
> We have also removed all of the old #ifdef debugging logs, so let's
> cleanup the last remaining debug function while we are here.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 109 +++++++++---------------------------------
>  1 file changed, 22 insertions(+), 87 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

