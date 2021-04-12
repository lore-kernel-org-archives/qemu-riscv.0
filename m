Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lVsbM-0006IT-JC
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 05:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lVsbC-0006ED-4C; Mon, 12 Apr 2021 05:11:15 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lVsb4-0002s7-JT; Mon, 12 Apr 2021 05:11:13 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id y2so12177535ybq.13;
 Mon, 12 Apr 2021 02:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jK0mqu1iQCLA8twMlWJbR5GVErLdXdDfQ3ktFDfnfzM=;
 b=oajyFagiHPUZV5pfU3xkf5ha4VI6R+43rpv7okqu1S6GAtNFr1DI55+xfU7vv5v/Eu
 cy4e+/7BWV6JPjne8uXdiIiDTPCS3tY34pslBM51Jb6xUvKhc/WLL4+HQRaQlv4t5kZb
 JcN3M3JgFjpNlv2GtHmZvZkBS43CeMyVjsgNIEeQbzYUSAZ2S0OtweQJ3M2Ju/4sYPJB
 qjy/c1ShJlvxwTaIDT4AM2HvpXM1fn+b0bzNbfxhJC9JRI+l6p7nU8iJ2UbCGSPJznLT
 aGECvuc5LVkdGonIMueud6sizoCj7wPfzwIQdYZDpMMzOYFECFTdjrgpuR3Jtm/4tgk3
 XedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jK0mqu1iQCLA8twMlWJbR5GVErLdXdDfQ3ktFDfnfzM=;
 b=GYid3xUKeKmWYoCSIUoi+70yxtq+pU+0ma2/AOLCPt2ndvMTQYv9ykNu2KLKWYolkP
 nS9wR3f58nlhKpNwdWVAyxjC2ObFF54ojor9OzrX8OFxIs1LB1bYU1bkYVgNA7Q98wtJ
 7NJkQNy9TdhLkHhI9OLx+Y/3I93qXRBcEP0PPePA7o7vWtSSXtNBE/wYFORbMOSQtR4e
 1pRZhdKGPoWjfT8Q2rH8L9hld2kqJNk8bjx04WwaH0dSKgbh3ii9QEzZ2MIijUtI60rT
 NIr3rIHYzszB8OeB0BJWgCn0cMh0OqvRCLD8jT6Jp5OGv/3+fsq4gzKB9sU5jWeytcDz
 /0+A==
X-Gm-Message-State: AOAM530WaD6KunDA/T+wHNkgKwGDnLQExmFdC4iHQbYMNmk4zBgtwXcw
 fb+qsw+64Zcpbs95dS3j49VRqbLwjhslill5z0o=
X-Google-Smtp-Source: ABdhPJw9OufcNVqXLo8YCka7WCa39AUQn8NyqJgp4S7EP22W/XtAxltgyP7dL/Ppy//JtzFQiWoB/9Urvsm6zY7AldA=
X-Received: by 2002:a25:cf8f:: with SMTP id f137mr1340856ybg.122.1618218665444; 
 Mon, 12 Apr 2021 02:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <aebf46ff114a04335f26cf7a2aae83be66dd5b42.1617393702.git.alistair.francis@wdc.com>
In-Reply-To: <aebf46ff114a04335f26cf7a2aae83be66dd5b42.1617393702.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Apr 2021 17:10:53 +0800
Message-ID: <CAEUhbmXfpFXeUcLuY8yscbWH3D=_DfDF0C0Hv0T1Nx6jyGgj=w@mail.gmail.com>
Subject: Re: [PATCH v1 7/8] target/riscv: Remove an unused CASE_OP_32_64 macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 12 Apr 2021 09:11:17 -0000

On Sat, Apr 3, 2021 at 4:04 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 6 ------
>  1 file changed, 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

