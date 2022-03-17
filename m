Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUzK3-00027Y-T3
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 19:14:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUzK0-00026s-EW; Thu, 17 Mar 2022 19:14:20 -0400
Received: from [2607:f8b0:4864:20::d29] (port=40868
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUzJy-0000bb-Nj; Thu, 17 Mar 2022 19:14:20 -0400
Received: by mail-io1-xd29.google.com with SMTP id x4so7644738iop.7;
 Thu, 17 Mar 2022 16:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UnsVjflfcmGg02Z1z/+1wvaeaxQFtcxm/Bz93+wUHo4=;
 b=JEMt7iQtOtaK7uR6Ke/vytsr9EqXubICYmexQfR3WYM4qYy1mY6WV/jCrnPLoC2rza
 BTmHCymh3HcjcWBLeuDfeqy3gFOcKoXM0xLPelqCGDjvd4IQR7FAag/F420ujUJqUr7P
 +uqCljRQFaOHwXfXithYQTw5Sut6zf06PHyb/XuY0RdCfl9IXpDjygempIOxvKDbKSpP
 8YcBt+xxB5gsfl9LEe7gGiTlymL7p8slc2iFZsEZDK/b/aoKF+uSPwhvp789sQwBJahw
 L35BxYuLJYN9TpQdngpoO17+aIIRLch+vQA32UOmC/CuHVyPYEZ1hmEXILx5sSKjE09Y
 bixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UnsVjflfcmGg02Z1z/+1wvaeaxQFtcxm/Bz93+wUHo4=;
 b=b4pyv4H9VBjcEQA+x2c2zPmDK/z5YKVA+j0ws+tq2npRdui339pe3LYDRM2g/dKwXh
 SItAmz9hWKyiwl80OwjmHOC7d2f32OdrS85mmKL34QWPFG8zmAGTS68aZMLSgtbeFopp
 hPFqwTLrFqdrMSndnTq3fBoM3+4SzZGlQsKfprCo4YErkCrVM6azuDxudcFShki1Q3aw
 HG1t7l2WxpARyDScZZkXDyRVHAE/KPVBRA43KUZiYgofEDsWtBOG1A93UYGUIAMH6HYU
 GjekM8Vmvl1r4IsSxjmda7oL6a8WihRcRJf1X3u8kxRlxno7VWiiJKdB86rOXnr4m833
 2BYw==
X-Gm-Message-State: AOAM530sNqhN4jVfwQH0kiLr6odRfzp1pj3QGfsf4IWVJtFNFDp0Pb0b
 65qWtXrgKRWWhqJ9E89FUAyxHC1TRg/rBMHCOVA=
X-Google-Smtp-Source: ABdhPJyyixkHMxxcpaGCkz4FTiWCL+Raj+Nd/VWZu7wjOGeQrSd6mv85oRilL7uNnCiy/LQKO7UaPoiSlJJL5CeUjTs=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr3427142iov.93.1647558857044; Thu, 17
 Mar 2022 16:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220317061817.3856850-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220317061817.3856850-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Mar 2022 09:13:51 +1000
Message-ID: <CAKmqyKPH62JfMTCDwWWUvCr2mZ7ZtyyXVYpQ5sTf1LaP2EFcKA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] target/riscv: Allow software access to MIP SEIP
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 17 Mar 2022 23:14:21 -0000

On Thu, Mar 17, 2022 at 4:18 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The RISC-V specification states that:
>   "Supervisor-level external interrupts are made pending based on the
>   logical-OR of the software-writable SEIP bit and the signal from the
>   external interrupt controller."
>
> We currently only allow either the interrupt controller or software to
> set the bit, which is incorrect.
>
> This patch removes the miclaim mask when writing MIP to allow M-mode
> software to inject interrupts, even with an interrupt controller.
>
> We then also need to keep track of which source is setting MIP_SEIP. The
> final value is a OR of both, so we add two bools and use that to keep
> track of the current state. This way either source can change without
> losing the correct value.
>
> This fixes: https://gitlab.com/qemu-project/qemu/-/issues/904
>
> Alistair Francis (2):
>   target/riscv: cpu: Fixup indentation
>   target/riscv: Allow software access to MIP SEIP

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h |  8 ++++++++
>  target/riscv/cpu.c | 30 +++++++++++++++++++-----------
>  target/riscv/csr.c |  8 ++++++--
>  3 files changed, 33 insertions(+), 13 deletions(-)
>
> --
> 2.35.1
>

