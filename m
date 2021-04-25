Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1laniM-000412-CG
	for mharc-qemu-riscv@gnu.org; Sun, 25 Apr 2021 18:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1laniL-0003zu-EY; Sun, 25 Apr 2021 18:58:57 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:43553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1laniJ-00089y-Nx; Sun, 25 Apr 2021 18:58:57 -0400
Received: by mail-il1-x12d.google.com with SMTP id l9so2605350ilh.10;
 Sun, 25 Apr 2021 15:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2aW8epdkpVT1ZubfjL0HCSTTc/IKoMyTUez0iLaMi0c=;
 b=Uub/58WCiU8ejAA1bfZAWFA2AH2MT3MIyGmX+HUG4W4kM8/QfElpL4AMjmH6LW86ed
 Xzx4YsXTaM7SC8oGdj14Lh1OOcRxvZv/ONXs1ljC41Wo8gcPrTq4mNuKwZnT4yPbQcrW
 5ha3w5CneaEhkluTgDbvuZbuaRlnzzru9I0afdlQPfImsuqVuRwc/0PI76TCGwyiAImc
 UxKDdsefrn86+gA5dxpzZxq8o3XrXo2NVNr+xMhVIQR2OPiKOK7oNqKe3XJflsfAcXb8
 Y1W2NL3BsLMcbSc6NBr4SxUw6Pw42W657CMJoGQoFkyfeWhlJDz1gWiuCWmVxibwPKGW
 X6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2aW8epdkpVT1ZubfjL0HCSTTc/IKoMyTUez0iLaMi0c=;
 b=brRoeLndekWcN2TlrfOF2wBuq/4w+LOxO9kcxIt2Fy0YqwkhUQnDB5ysjF0C3fatu3
 XVdx3vFULI5xPHEZlF098Q/TQhVh07JsMCDOP8HbPX3fpQf2pSkT/L4JzpvAYBqvZkgi
 nw+DpeXMbDlZmwW/Hdbg4JEzpAEEd5CzA1/Od/VaOFCOp6hkstietsg6Cbqj5LPqWjUe
 x/jhT+pWs2E/nbk5EV8mno2sj2GSc6IhK4xYFRYaMr3ooMqom6iSp8JrhRAPQf6KvbWC
 3wCBy2PUvWHHdM/EAtMN26euPxvXw3Frrm6c+QyzkIKajmEBMyafEbn0m1dL10t0C3J6
 /oKw==
X-Gm-Message-State: AOAM533V0cw+0EdpPXmcPsvpauBMNpDytIOjTJoiEiAwnaEzgZ5pd5+s
 hMbhuCflabgeQcYpkPL6wc5S6mmSkg0tMz69rSOPC3AvBts=
X-Google-Smtp-Source: ABdhPJyGIFEWWbKO9eOSx5UCr4jCmC6zy0NSowEnGVSue/bRUCcXCO7y53lfkPgyspCMHu8+H+9agTDRwBoOGMEhQBk=
X-Received: by 2002:a92:d383:: with SMTP id o3mr11152348ilo.131.1619391534411; 
 Sun, 25 Apr 2021 15:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619234854.git.alistair.francis@wdc.com>
 <024ce841221c1d15c74b253512428c4baca7e4ba.1619234854.git.alistair.francis@wdc.com>
 <43dfcf5d-26b0-759d-296b-416d3566b2ea@linaro.org>
In-Reply-To: <43dfcf5d-26b0-759d-296b-416d3566b2ea@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Apr 2021 08:58:28 +1000
Message-ID: <CAKmqyKMXR=uMKsttPKJ7eNMx6F_96_GMsqvzYCPdUr9uk38GpA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] target/riscv: Fix the RV64H decode comment
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Sun, 25 Apr 2021 22:58:57 -0000

On Sun, Apr 25, 2021 at 3:14 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/23/21 8:34 PM, Alistair Francis wrote:
> > BugLink: https://gitlab.com/qemu-project/qemu/-/issues/6
>
> The issue got renumbered to 47, fwiw.

Thanks!

>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   target/riscv/insn32.decode | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index fecf0f15d5..8901ba1e1b 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -288,7 +288,7 @@ hsv_w       0110101  .....  ..... 100 00000 1110011 @r2_s
> >   hfence_gvma 0110001  .....  ..... 000 00000 1110011 @hfence_gvma
> >   hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
> >
> > -# *** RV32H Base Instruction Set ***
> > +# *** RV64H Base Instruction Set ***
> >   hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
> >   hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
> >   hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
> >
>

