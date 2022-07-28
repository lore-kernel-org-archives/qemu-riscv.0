Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGwn9-0006ve-Vr
	for mharc-qemu-riscv@gnu.org; Thu, 28 Jul 2022 02:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oGwn3-0006sw-ND; Thu, 28 Jul 2022 02:14:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oGwn2-00010b-6E; Thu, 28 Jul 2022 02:14:33 -0400
Received: by mail-pj1-x1029.google.com with SMTP id pw15so892993pjb.3;
 Wed, 27 Jul 2022 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wzd0pNzcxOSKWAk2DzlCN66ipMk3PvixLCdbzZS9SUo=;
 b=PxXKC3BMibjsp/elIqj0/zWzXiLquzE2xO3ldLaG6zse9A0zsb2QThAzh3bUoJzwWQ
 4wxN5sfTiZ0WcaoWAJu/rcWV/4Ykq8bieVUwlwqpV0KfkpysMfnxTCqXHZ9tNetbrTyn
 KL1uJ9oICZO1Rhqvm4aWpUDy1b1W6YqCajfkQ7LpR2Ep/MOBnavtTuLdi/ttqxp0pHKY
 Dg8j51dHVmnXqAhCj7M4P1TnT3TfcgzsK4FbYm2tAE3//GpQKgaXm6MERZ9Il2MBuhRz
 J/60DtUkCwUnVw2pN6A5sDLf4T6UkaMbAz+iEnmYNQK9+na7WgBnzMkixwi62c1w0lYA
 ZI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wzd0pNzcxOSKWAk2DzlCN66ipMk3PvixLCdbzZS9SUo=;
 b=6CFOZ4UqHVGS957Rl0wNjS5FtFrTucJP+FUkOlf6Rqc39lTgoTOQmyQ11Ekljvb56g
 PX495c14+9Xw/p9KczneUbXmrENpIeUJFbTEthF/QXcYs+51R53MhjGpF+rLlQJXEqWO
 NpRv3P5/QCt/8/B4wiAepSnvz7Y78LN3bpKSA1xZ8wal2i41LGkku7ddOQy59KbEH0lG
 /DtgPt+N+MLbmg+55k80+9Daql9oyz/Z+vSzRYvOCOalmSXbAvZkoOItivcwwFrHxsge
 drBPQmHp7iuJovPNcI15VCz0J0G0PoVCNf9HU/AkhGFFpKFAjOtOOiWfXyqlXE9+nfYz
 YSRg==
X-Gm-Message-State: AJIora81zCkJfmqh+RhzzIvn5mX8dhFKGZM8kIP4QViiQeOJucTOsnfo
 iQgPdTMf4/nRuCzJyrsDX+YzaibHnCZ0sacYIEc=
X-Google-Smtp-Source: AGRyM1sFhr57ke7pNNlU/LPJAFvgEFKpOR0DtUIUtfZ8Sol8SN/uD/WsNGAmkK/yOOYDGjyvzNOf+SeBWP4etFNElmc=
X-Received: by 2002:a17:903:2285:b0:16d:6c38:d351 with SMTP id
 b5-20020a170903228500b0016d6c38d351mr18815764plh.121.1658988870207; Wed, 27
 Jul 2022 23:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220727142037.rzm4o4huq22vagcp@hetzy.fluff.org>
 <CAEUhbmU_3+-A8vAnnCmZ_qYaWv=0QFjkMeBwH+sZ60t+ivHGFw@mail.gmail.com>
 <831aebc7-ab6c-7cb8-b890-26270657bd69@codethink.co.uk>
 <CAEUhbmX5TsSaRbxKWNcTFtx2QRg-T9pbasWfCou9Y-Mgt0K=Vw@mail.gmail.com>
In-Reply-To: <CAEUhbmX5TsSaRbxKWNcTFtx2QRg-T9pbasWfCou9Y-Mgt0K=Vw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Jul 2022 16:14:03 +1000
Message-ID: <CAKmqyKNONG=U-p-XAf3Qu8igXyvzUjVO3iKHXZYhccxycpwuFw@mail.gmail.com>
Subject: Re: fu740 target
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Ben Dooks <qemu@ben.fluff.org>, 
 Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
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
X-List-Received-Date: Thu, 28 Jul 2022 06:14:34 -0000

On Thu, Jul 28, 2022 at 1:03 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jul 27, 2022 at 10:44 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >
> > On 27/07/2022 15:38, Bin Meng wrote:
> > > On Wed, Jul 27, 2022 at 10:24 PM Ben Dooks <qemu@ben.fluff.org> wrote:
> > >>
> > >> Is anyone working on adding a sifive-u74 core to the list of supported
> > >> CPU types? I was looking at full emulation of the Unmatched but at the
> > >> moment the best we have is sifive-u54 and I think that misses at least
> > >> two CSRs the sifive-u74 has.

I don't know of anyone working on supporting it.

There previously was some work towards supporting vendor CSRs in QEMU.
We are open to the idea, it just has to be done correctly.

> > >>
> > >> Does anyone have plans to add the sifive-u74, and if not, would a plan
> > >> to add gradual support for it like adding CSRs 0x7c1 and 0x7c2 so we
> > >> can run an Unmatched U-boot SPL against it.

We are happy to have support added if you would like to send patches :)

> > >
> > > Adding 0x7c1/7c2 would be a vendor-specific CSR approach?
> >
> > Part of the FU740 feature disable controls
>
> Yep I know that. I was asking if you use a vendor-specific CSR
> approach in QEMU to handle such cleanly.
>
> >
> > >>
> > >> If not, is there a definitive U54->U74 set of public differnces around
> > >> we could use to start from? I'd like to be able to run a full Unmatched
> > >> image using qemu at some point to add to the current real-board testing
> > >> we're doing.

We (QEMU) would love that as well. Hopefully SiFive or someone from
the community can work towards that.

Alistair

> > >>
> > >> (I have a basic addition of the type and the two CSRs as a couple of
> > >> patches if that would help as a start)
> > >>
> > >
> > > I am not aware of anyone doing U74 modeling in QEMU, but SiFive folks
> > > (+Frank) may have one downstream as I see they posted several bug
> > > fixes in the existing U54 model.
> > >
>
> Regards,
> Bin
>

