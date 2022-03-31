Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZlPc-0006nT-Rd
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 23:23:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZlPb-0006n8-LE; Wed, 30 Mar 2022 23:23:51 -0400
Received: from [2607:f8b0:4864:20::d30] (port=38538
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZlPa-0001Rj-65; Wed, 30 Mar 2022 23:23:51 -0400
Received: by mail-io1-xd30.google.com with SMTP id 9so24011391iou.5;
 Wed, 30 Mar 2022 20:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yqXJLbSTChe0Sf0lABIwluUF9NPq+42ebG5usKX7e3U=;
 b=a9Bd31rfNvaps8dSKPTYB4cGbmTLW2DxWLgshGUin8Qm2qjGmDxYoh5a1HJD7nxVxH
 B9lPSXVRD8p4wVTNJAvu6hbgf7sFGRN4gwfigF179e5csvWcvHNSnzAc9MOTlKAHOxWO
 tmFHwyu5M5iInyd7x9P/P8FP70Gxr38xRxvncUmWdKtF/7b/7FmIXR/To//4Y0Jlr6st
 +hXwBtTIYKBqjVk7MXjkzTQAQLp6AtssB2kt41z3PnIUYl9UfMz+PCVKf5i4bEKrFO+f
 kRCEVGrRvoGhq4QwkWvUNim7Ix4iJpTiG6TvADL0MKODIyhpFe4iYTpVJG8GcclCTQwt
 jvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yqXJLbSTChe0Sf0lABIwluUF9NPq+42ebG5usKX7e3U=;
 b=6Z4let9ZcMFi5yB4P12gZ+keo8hfZKaR7lCziS4KFSkxId1EcJb7LdiUXuB6IysX2i
 ZbwKmE6flEQ+4DWDVWZxQNcGqthR/n+UNi7/Y45ZdjAK9bgTyja5HGzN8I8ZR5qTFLsK
 5BPmnRLy1Y728Uc+AhmVkL3A3ktVQGKYy1vAQ+Ylh0Q2vhxGquU+3hAr1JWkL9Qm/rE2
 oIzAKHCHDRUJZ4H7LtKUJeoCXl9464F7QrO6EIjAzETam1LlwD8EpMsOqTNTpUDzqHOS
 oyOjusDtQszYnhIXiG3wx++6+qTaypqPK0zJcu1aCr0TE1iGV9JYWKMEvMrKZWWXPXUH
 eydQ==
X-Gm-Message-State: AOAM531mvoiPn7zUf5xH/CXiyvYhm6j0xDt3cSGsWvZGI62vu7dTkj13
 SIngEl/AOwk4uS5bduVmxqM62NBqB5aeoO/ZsjU=
X-Google-Smtp-Source: ABdhPJzGzrJ2GVzoQoSPEVYm3yY1Ed6FM0OkhSoy+2rSNGNTGw6D++3AAnAOTVROFyIVD2cE+S32K33POY5zOZEd+AU=
X-Received: by 2002:a02:a88f:0:b0:323:6ce5:fb36 with SMTP id
 l15-20020a02a88f000000b003236ce5fb36mr1859806jam.21.1648697027785; Wed, 30
 Mar 2022 20:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <621d67f0.257cf.17fdad5aa33.Coremail.phantom@zju.edu.cn>
 <mhng-496f47ba-62ce-4d29-b75e-99410775b504@palmer-ri-x1c9>
 <CA+4MfELoEGOW_+kFiOu1t7MD-nEFg7rcc34By+ukh=1qF=5iig@mail.gmail.com>
In-Reply-To: <CA+4MfELoEGOW_+kFiOu1t7MD-nEFg7rcc34By+ukh=1qF=5iig@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Mar 2022 13:23:21 +1000
Message-ID: <CAKmqyKNzQELfs4SQhRJ_XDcFNvFyp5PLA-2qWfBciKN3nCDJHw@mail.gmail.com>
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, phantom@zju.edu.cn, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Thu, 31 Mar 2022 03:23:51 -0000

On Thu, Mar 31, 2022 at 3:11 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> >
> > Presumably you mean "revert" here?  That might be the right way to go,
> > just to avoid breaking users (even if we fix the kernel bug, it'll take
> > a while to get everyone to update).  That said, this smells like the
> > sort of thing that's going to crop up at arbitrary times in dynamic
> > systems so while a revert looks like it'd work around the boot issue we
> > might be making more headaches for folks down the road.
> >
>
> The opposite in fact, I did not suggest to revert it, but rather undo
> the revert (as Alistair already removed it from the apply-next tree),
> since my original patch fixes buggy behaviour that is blocking the
> testing of some embedded software on QEMU.

So, this is a little tricky.

We want to apply the fix, but that will break current users.

Once the fix is merged into Linux we can apply it here. That should
hopefully be right at the start of the 7.1 QEMU development window,
which should give time for the fix to propagate into stable kernels
and not break too many people by the time QEMU is released.

Alistair

>
> Idan Horowitz
>

