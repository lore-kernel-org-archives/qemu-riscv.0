Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGcAC-0006eG-GB
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 03:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGcAA-0006bh-IU; Thu, 19 Aug 2021 03:08:30 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:34311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGcA4-0006rN-Tl; Thu, 19 Aug 2021 03:08:29 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id a93so10510393ybi.1;
 Thu, 19 Aug 2021 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0aE9iU6gcKim13qwuiiAHv7mg820huTePzmOy8nziVA=;
 b=CJTIV/8+3etuDaRhjcshjdhFtfPokrnMy/RC+uf54djkubODmzK3a8Svpstq8biTmb
 ClANcB/DcXN59qMxeQzYmtkm6eENmmMKtvs1KoAds4kF2UR7WGIA8vedSrwSz5bNWwIM
 Si7hTJN6Wq8mVaF8w6nlrKbagFQwDdq0p4QBupUjfrSYMDODT7yOdoPR1DhZRunNYRAe
 h40flMWVNiGT6ad3Uk5O1mZU/1WDdFK4DAQ1IG+TfSZCljydLIV9eatplx0KjABQrEGl
 FpYE3CmdNsofePincYHJQ4HZYV0qwhhitdz1cyseLBrtxVaJENjAm7bhXUs/6DVK08gG
 jw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0aE9iU6gcKim13qwuiiAHv7mg820huTePzmOy8nziVA=;
 b=TU1D5UWKt+oMHD9fQEWS6SPUfHLl5kteYgetHhwiQ5sbHCSeWmKXDZauvoEvrV98TZ
 kQrcUTO9c2W/H8O25ntMJG5M2vEcGLlgxTGrmTIoHEYvlSfp6MQEnr8tPO/QeD7JrgBh
 r/cv/pkYigGksQpiWA4ozBqZ8hGyF10N0oIuK4uosAMDHPTCuyYW2NHacvhlO/lNuuyV
 KoY6UEbY4wXXm7WL+iV3swkdKvyZKFOyeTarQWSVwMi9kxoFxTRqTIevla/VYoB86wxv
 IJOWVYFEgWd6uw5CSNpaEUi7TeHDg5MqXGZAT9MnkDUj/ErsedxYc9im/nADaJRGuG0b
 nU2w==
X-Gm-Message-State: AOAM531Hz2ueR4kBrK2gzzp4NqYFTLl/HtpNxuXMVANv0CF0cq/Hzt35
 lSrKvOUNuWBeN9n+r7xj1A0Y22LTbngzgAj4t7c=
X-Google-Smtp-Source: ABdhPJzjbSl13j0hqiUD4lM34YOY5/RFea3rtyUs/2gRVet0jJQ+08WzErSwxXkEIfTcHkriRal4PGGLA2rvnjgiRcw=
X-Received: by 2002:a25:2646:: with SMTP id m67mr16368473ybm.122.1629356903659; 
 Thu, 19 Aug 2021 00:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-16-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-16-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 15:08:12 +0800
Message-ID: <CAEUhbmU3+54eu-pOo=sU6nmECziV3ZmauRRnLb3CQLWwmEQHDw@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] target/riscv: Reorg csr instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 07:08:30 -0000

On Wed, Aug 18, 2021 at 5:27 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce csrr and csrw helpers, for read-only and write-only insns.
>
> Note that we do not properly implement this in riscv_csrrw, in that
> we cannot distinguish true read-only (rs1 == 0) from any other zero
> write_mask another source register -- this should still raise an
> exception for read-only registers.
>
> Only issue gen_io_start for CF_USE_ICOUNT.
> Use ctx->zero for csrrc.
> Use get_gpr and dest_gpr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/helper.h                   |   6 +-
>  target/riscv/op_helper.c                |  18 +--
>  target/riscv/insn_trans/trans_rvi.c.inc | 172 +++++++++++++++++-------
>  3 files changed, 131 insertions(+), 65 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

