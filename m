Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9wvW-0004yy-3Y
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 17:26:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9wvU-0004yg-7Y; Tue, 18 Jan 2022 17:26:04 -0500
Received: from [2607:f8b0:4864:20::134] (port=44971
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9wvR-0003De-Rm; Tue, 18 Jan 2022 17:26:03 -0500
Received: by mail-il1-x134.google.com with SMTP id i14so492067ila.11;
 Tue, 18 Jan 2022 14:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rpCM3/8uvKgeTIWSKgenaW9yOYCKRvAQlLPIOSrfZXs=;
 b=PptUPsZyvT3JFM5NM/ybFACDL0cpVTwm0jdNpe9oly0gPK+cq2jMhVFGQ3xw3wa/iU
 HtE9/AALaGFcW25B31GxIOTSvH5n8702zUIlEc+JXNyLd1ZGd0VrV2knHtG1g0gpEgmE
 3+8+A3V/0saWWA8Ep7Ed7dfxaIVhNvs33fkG65VFTAF6lPTyBnSfl8XhOTvxINbdAkHd
 p0cknWhYIawwuE0UbtIUWtmnhh4LSkcBK8y8wDDRvM8rYMObDI8dzV10RGkBNJFO1IDB
 8my2UzxBK3Yn4MKjMOrTt4wFSMOSmBw+l6cCvftu/+HjYKjN7yF7on7KP0XcrgM4FuKe
 LyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rpCM3/8uvKgeTIWSKgenaW9yOYCKRvAQlLPIOSrfZXs=;
 b=V14DhIjmpFS4VOhVfID6UK1oN8NiPsfclWheZ6vizZhfxzk4OGKQ2wPzftvVbmIlIT
 TKz8fIzfqiD+7DVS0xdz9tx6fdAN7hpCTT0aLUAleKz87qF2TY6zvadYEiCPmnRjB4B0
 BypI9HzjaXetaZNn6/58VsvS7JWiG0aIZg8UuR4/XLXJORwxlo3iNDw+t3468ofeA0wZ
 hqKQGcN4h8WFoF+auLCOY+q5Me19AEtgqpeMMZ+k+wB9ikpjR40CFxowce0XyVPvAnlE
 FbWpvoFTRFMZBf2SJXK7MgEMsyCp7xYhsS0shlJ4r8cOh7hPjKuAcxlIwxc50CZPpzmd
 S47Q==
X-Gm-Message-State: AOAM531G87/aE898Vq3FMZVOQhCh98+1cOXMXfeG2xuRVIUiy0TGaIFm
 /QPljwhIkirlVudNoiGuupTItNStR+vgYlUGUtk=
X-Google-Smtp-Source: ABdhPJzrkKNq6JVAq2rRXaPWKBEN4ize3x4zhoZY61DtRIe59Af+TWR6BHUNTCsuQNKQUF2m/Hlf1LvSMBmMKKcgcP8=
X-Received: by 2002:a92:3012:: with SMTP id x18mr14152129ile.221.1642544759566; 
 Tue, 18 Jan 2022 14:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20220118014522.13613-1-frank.chang@sifive.com>
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 08:25:33 +1000
Message-ID: <CAKmqyKNMX1QTJghKyMwn7CXsydE3znWbuJ97k4dDuFb1ks_Syg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Add RISC-V RVV Zve32f and Zve64f extensions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Tue, 18 Jan 2022 22:26:04 -0000

On Tue, Jan 18, 2022 at 11:50 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> In RVV v1.0 spec, several Zve* vector extensions for embedded processors
> are defined in Chapter 18.2:
> https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#zve-vector-extensions-for-embedded-processors
>
> This patchset implements Zve32f and Zve64f extensions.
>
> The port is available at:
> https://github.com/sifive/qemu/tree/rvv-zve32f-zve64f-upstream-v2
>
> Zve32f can be enabled with -cpu option: Zve32f=true and
> Zve64f can be enabled with -cpu option: Zve64f=true.
> V is not required to be enabled explicitly.
>
> Here's the inclusion diagram for the six standard vector extensions
> quoted from Nick Knight <nick.knight@sifive.com>:
>
>       V
>       |
>     Zve64d
>       |
>     Zve64f
>    /      \
> Zve64x   Zve32f
>    \      /
>     Zve32x
>
> Changelog:
>
> v2:
>   * Replace hardcoded TARGET_RISCV32 macro with get_xl().
>
> Frank Chang (17):
>   target/riscv: rvv-1.0: Add Zve64f extension into RISC-V
>   target/riscv: rvv-1.0: Add Zve64f support for configuration insns
>   target/riscv: rvv-1.0: Add Zve64f support for load and store insns
>   target/riscv: rvv-1.0: Add Zve64f support for vmulh variant insns
>   target/riscv: rvv-1.0: Add Zve64f support for vsmul.vv and vsmul.vx
>     insns
>   target/riscv: rvv-1.0: Add Zve64f support for scalar fp insns
>   target/riscv: rvv-1.0: Add Zve64f support for single-width fp
>     reduction insns
>   target/riscv: rvv-1.0: Add Zve64f support for widening type-convert
>     insns
>   target/riscv: rvv-1.0: Add Zve64f support for narrowing type-convert
>     insns
>   target/riscv: rvv-1.0: Allow Zve64f extension to be turned on
>   target/riscv: rvv-1.0: Add Zve32f extension into RISC-V
>   target/riscv: rvv-1.0: Add Zve32f support for configuration insns
>   target/riscv: rvv-1.0: Add Zve32f support for scalar fp insns
>   target/riscv: rvv-1.0: Add Zve32f support for single-width fp
>     reduction insns
>   target/riscv: rvv-1.0: Add Zve32f support for widening type-convert
>     insns
>   target/riscv: rvv-1.0: Add Zve32f support for narrowing type-convert
>     insns
>   target/riscv: rvv-1.0: Allow Zve32f extension to be turned on

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                      |   6 +
>  target/riscv/cpu.h                      |   2 +
>  target/riscv/cpu_helper.c               |   5 +-
>  target/riscv/csr.c                      |   6 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 219 ++++++++++++++++++++----
>  target/riscv/translate.c                |   4 +
>  6 files changed, 205 insertions(+), 37 deletions(-)
>
> --
> 2.31.1
>
>

