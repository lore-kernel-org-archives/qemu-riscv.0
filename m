Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnHbi-0007h4-8u
	for mharc-qemu-riscv@gnu.org; Wed, 17 Nov 2021 04:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mnHbe-0007gW-3F; Wed, 17 Nov 2021 04:51:56 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=36464
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mnHbc-0004uU-SG; Wed, 17 Nov 2021 04:51:53 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id d10so5803010ybe.3;
 Wed, 17 Nov 2021 01:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUd+dxKhK4/g1mihP8BghPoezC8tMq0xVX8p9hGJ0Ew=;
 b=KsFA/jDxdtU87s0TNfHb6Es+Ydu1hG0+88g2ffwx0x6hJTzEuH+1O3dzsNm6l6yS/5
 0Qwt+xAxI17jMPuE61XSWFEW7UhtklfpDeuD+EC2yZO901Em8cWLIltcmuI82tFDZuVp
 Y9lFCMTCbxlpC1mALgKqQ12zOomoi6FfombXWcp5jUXl672ALkRwM1tT4SouL+EImlWI
 utxmfr2bm/SHebs7JSA5lgDyhSipqg4hjIPSqWnNy0lwAdhobS/IC+8upOYbcDBD5PvF
 x8aQpYEbjXVshFyuCWYdMVrx+Bpenfhv+HAb6yxNtKOTtzAeOrFkMLbvj8iIQIkSmRCN
 NQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUd+dxKhK4/g1mihP8BghPoezC8tMq0xVX8p9hGJ0Ew=;
 b=QtkLvgA3SlKuhAwdUe19laM13V+tHc1WV6lNY+QeiLbZdHsNEPUjhAM2HkeTu0+AVe
 cdpgZVi4Y+DzR3kuMBY6LYkp5kQq/v0yx2+VyNItSeUOctHihfB/3Hpc2fWIuGuP717g
 bRXevac3wuO527oOP2Zl7GTgsUT8AVqLHT6byB3EiXuWLp+UkdBKFhnZvL/fSkJ74OFt
 4dH+YLT3fY1o1iMAVqMgQe32CAD/ROx6eGFJgLI5jVDlLRGBwfWBpt7PpFZc7HA8X3tT
 CwgF6a+2ZY/xbdErN7spO3DLQ/9H2foPY7JbBrYTdyeKDqWI3zU3inyEM1UxDzOEsYF6
 tegw==
X-Gm-Message-State: AOAM533wyhSuFPVGxrER3xxyoMxwItxhHmWw+iKVqJF/A4cUhLET/prS
 GqLQur0sqXwJR3OYE18qNCfz4ccaMX6zLmroHNo=
X-Google-Smtp-Source: ABdhPJyEGeoevXfR3yeENkEeSmHdP6vpKg4bnDcS/rMOgh54sOwg6AhxgxPJUFlJmKjmDKlHy5z1pRhk3SyUoyo1QIo=
X-Received: by 2002:a25:d57:: with SMTP id 84mr15088016ybn.345.1637142711492; 
 Wed, 17 Nov 2021 01:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20211030135513.18517-1-bin.meng@windriver.com>
 <20211030135513.18517-7-bin.meng@windriver.com>
 <CAKmqyKOXtJMETp0MF_dza7mDz8KgLkEC4iHt4VFubDnsjdFPrQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOXtJMETp0MF_dza7mDz8KgLkEC4iHt4VFubDnsjdFPrQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 17 Nov 2021 17:51:40 +0800
Message-ID: <CAEUhbmXxuo-S2sifmyUNS25GPMtr44HGMi8BBqQPgNpNRdcTaQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] target/riscv: cpu: Enable native debug feature on
 virt and sifive_u CPUs
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 17 Nov 2021 09:51:57 -0000

On Wed, Nov 17, 2021 at 8:58 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Oct 30, 2021 at 11:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Turn on native debug feature on virt and sifive_u CPUs.
>
> Is there a reason why it's only these 2 machines? Could this be
> enabled by default for all CPUs?
>

Yes, I think so. I only enabled these 2 as I did not check all
hardware specs like OpenTitan, etc.

Regards,
Bin

