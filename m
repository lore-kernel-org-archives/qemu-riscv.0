Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o7X14-0007gV-Bg
	for mharc-qemu-riscv@gnu.org; Sat, 02 Jul 2022 02:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o7X13-0007gH-CT; Sat, 02 Jul 2022 02:54:05 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o7X11-0005mO-HA; Sat, 02 Jul 2022 02:54:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so224211pjo.3; 
 Fri, 01 Jul 2022 23:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6zxFYznBYJg035FIi/KaFMQDD3HfuRZesSTkP6SrKeE=;
 b=E3aKDX0rVCaj+NCf6dlE5BqpRvowV1ul2Kx20PbDEVQ5kQvaE/T3lRXQuIsQ3r3XS/
 23ts+110wN9AtU6gQL+r3na4NEZsCEfmo2V1a1GkOZpSCaA5/XFPcJ1yXzYbbQzeXccK
 zeprWt0Ml9DwZXU5KgwmZ5dtFhDMNWdgAHxOS2WEzN7/TZC0RRFA0v0RRWyIn9bNd1xi
 oh7ZE9lyxdqBRrAUZJs+EPTWQYAf9qv85EfrYU4/AfskYG+bP4BW7MF8XMP0np9q16Km
 urk74+xT8YOZFPWKva2oQ6oSEem1MCI6+N/pVYmiqQKIxJG5/T2j9l31eQVuCZtnn90V
 TITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6zxFYznBYJg035FIi/KaFMQDD3HfuRZesSTkP6SrKeE=;
 b=66FkDDuyPIravDe1x4yNACNun4/wJCnd4H6Xh4dXMin9E53tanNEqXkRpTMI9wK7zC
 L9Jg7gaIrIS+az1nGecXKg/XUmSJC++Q9HkUXuRndLjOz7NO8yZZ3YMWtEP44Dh93Mnw
 fjyP3a91S3+2z47127LEUYjbv6RckoVfaim3cWQa6M+qKrJdWz107/hxMIF9ldM+n2Yb
 QfjV8Y4EYepJ96iHepaXaC2l+a8nMsbgxMlV+RcEv/mRKWV6H6Jj2yK79qZnH97sX4k+
 4GNAE8EGRZwO5G8BdsMkE0oZzA6Xi+lJsXipwyINEj/JRJVdt34RSgsPBHWnd701CtAp
 7uOA==
X-Gm-Message-State: AJIora8I/gNlL7AKs+p8x5Whxxpe3OIa8D8N/HxtH61F6aBgeSqG45o6
 Qndnp1wNBgybhj8fQfxpZEcecAV5lB+8sArKVws=
X-Google-Smtp-Source: AGRyM1tW2io0A3GOtNQfT0RY9KC0CI/gUIVhBNj2pRLplQ050E3sYCVIrXrtllBEQ3FTCbKnwZF43/oReMCndaumm1A=
X-Received: by 2002:a17:902:b289:b0:16b:940d:18bb with SMTP id
 u9-20020a170902b28900b0016b940d18bbmr21956227plr.83.1656744841351; Fri, 01
 Jul 2022 23:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
 <20220629233102.275181-2-alistair.francis@opensource.wdc.com>
 <CAEUhbmV=j3jxUh+UiTGKtSZeXwBdhu+xeO3J_NFZT593TUPVHg@mail.gmail.com>
In-Reply-To: <CAEUhbmV=j3jxUh+UiTGKtSZeXwBdhu+xeO3J_NFZT593TUPVHg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 2 Jul 2022 16:53:35 +1000
Message-ID: <CAKmqyKNg70sAUf6QrFmb=t2_bV3WodJbnSeju6UPzR0dBpLUag@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Fixup MSECCFG minimum priv check
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Sat, 02 Jul 2022 06:54:05 -0000

On Fri, Jul 1, 2022 at 10:32 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Jun 30, 2022 at 7:31 AM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > There is nothing in the RISC-V spec that mandates version 1.12 is
> > required for ePMP and there is currently hardware [1] that implements
> > ePMP (a draft version though) with the 1.11 priv spec.
> >
> > 1: https://ibex-core.readthedocs.io/en/latest/01_overview/compliance.html
> >
> > Fixes: a4b2fa433125af0305b0695d7f8dda61db3364b0 target/riscv: Introduce privilege version field in the CSR ops.
>
> The format is
>
> Fixes: 12 digits commit id ("commit title")

Thanks! I meant to come back and fix this up but then forgot

Applied to riscv-to-apply.next

Alistair

>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/csr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 6dbe9b541f..6379bef5a5 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -3561,7 +3561,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >
> >      /* Physical Memory Protection */
> >      [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
> > -                                     .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +                                     .min_priv_ver = PRIV_VERSION_1_11_0 },
> >      [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
> >      [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
> >      [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
> > --
> >
>
> Other than that,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

