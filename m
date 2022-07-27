Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGiNR-0002Ur-At
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 10:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGiNP-0002TA-Oi; Wed, 27 Jul 2022 10:51:07 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:36684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGiNN-00085p-8C; Wed, 27 Jul 2022 10:51:06 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id i13so13065045qvo.3;
 Wed, 27 Jul 2022 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+QUn1RdrP7aoA+6z3z6YJAlszPm4BddVrir0So4cuI=;
 b=Ms+whUOL1U2EmI/rEcLlzZHeRbHHmG433BFr9Qpw4cG2yv5Mv1bJeggbgBNxK89Cbo
 BwOOw+yz+Un50iC3+ug+xWo6EEr0t8Lme6AOW8IuNO4nRgSSaVQph5wtpU2tcNQ5tH5N
 r3LgdbfnzfDOi5FnNi3M0BP0qAvjSMjadIaYIPHr99dS+2ssI/qtUl+iBtlBBjBseEG4
 OEpSNRAReCx2E5IYdpogF+6bNcAAVxOQhBgo2SVeWRG5jjg9BJqworer1Epw+uEz3Ai6
 XUGMQvx1q+3foQO/dLWAqkXJvg7Dg9s5BiWUCr0TGH41FVtXLl1s2I/agIIWCwcZiifU
 8rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+QUn1RdrP7aoA+6z3z6YJAlszPm4BddVrir0So4cuI=;
 b=ERYJ6l5PwHM0NfNh+OmTP5sV7tOOb7IOiEs94y23PcIEfOfD6o8hGxijbk6xu9a9t8
 7XpOXF7EWZ8e1zXhtkvhN81cEk9Lg3bZO0G9UnUOuhM9ViPg207eikTo4zC1SNeJpX3U
 le3Nb0vrHQo7nLRw8zheYjATd0cYdnledRESO9nE+8oT12VF9iZ5o/tDxN3dEHgAdLKi
 kGnGv/7S8EIEHFYwfB6I8xvJaHe2gxJueiFoMJwmVlWunO8+Yh1MHgTj94y5jspdNROB
 SYNSWn+lGJb81YYIYjI/TyhPpgXxuciAfenrXSXzPH6ir9f+B9Odj5EOOmto2nvh7Eug
 iquQ==
X-Gm-Message-State: AJIora/4CSrumjA+cr/+3I39RI9dxx5+clP8CzuC8GNmw8KxqzaKhyVl
 mxU77RxbBR6Gyv4OcslQg7YvxPgMYU137SG76Yo=
X-Google-Smtp-Source: AGRyM1u0FLSwdiQ8p7cZxDk+1K/toDjIwiSYgAQ0vQl8db2n5EcAfWF4O8NVrK8D0KqEQj+oOPg0PNB6S0+TE7e5WoM=
X-Received: by 2002:a05:6214:5195:b0:474:454a:cfe7 with SMTP id
 kl21-20020a056214519500b00474454acfe7mr13824755qvb.85.1658933462454; Wed, 27
 Jul 2022 07:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220727142037.rzm4o4huq22vagcp@hetzy.fluff.org>
 <CAEUhbmU_3+-A8vAnnCmZ_qYaWv=0QFjkMeBwH+sZ60t+ivHGFw@mail.gmail.com>
 <831aebc7-ab6c-7cb8-b890-26270657bd69@codethink.co.uk>
In-Reply-To: <831aebc7-ab6c-7cb8-b890-26270657bd69@codethink.co.uk>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 22:50:51 +0800
Message-ID: <CAEUhbmX5TsSaRbxKWNcTFtx2QRg-T9pbasWfCou9Y-Mgt0K=Vw@mail.gmail.com>
Subject: Re: fu740 target
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Ben Dooks <qemu@ben.fluff.org>, Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 27 Jul 2022 14:51:08 -0000

On Wed, Jul 27, 2022 at 10:44 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 27/07/2022 15:38, Bin Meng wrote:
> > On Wed, Jul 27, 2022 at 10:24 PM Ben Dooks <qemu@ben.fluff.org> wrote:
> >>
> >> Is anyone working on adding a sifive-u74 core to the list of supported
> >> CPU types? I was looking at full emulation of the Unmatched but at the
> >> moment the best we have is sifive-u54 and I think that misses at least
> >> two CSRs the sifive-u74 has.
> >>
> >> Does anyone have plans to add the sifive-u74, and if not, would a plan
> >> to add gradual support for it like adding CSRs 0x7c1 and 0x7c2 so we
> >> can run an Unmatched U-boot SPL against it.
> >
> > Adding 0x7c1/7c2 would be a vendor-specific CSR approach?
>
> Part of the FU740 feature disable controls

Yep I know that. I was asking if you use a vendor-specific CSR
approach in QEMU to handle such cleanly.

>
> >>
> >> If not, is there a definitive U54->U74 set of public differnces around
> >> we could use to start from? I'd like to be able to run a full Unmatched
> >> image using qemu at some point to add to the current real-board testing
> >> we're doing.
> >>
> >> (I have a basic addition of the type and the two CSRs as a couple of
> >> patches if that would help as a start)
> >>
> >
> > I am not aware of anyone doing U74 modeling in QEMU, but SiFive folks
> > (+Frank) may have one downstream as I see they posted several bug
> > fixes in the existing U54 model.
> >

Regards,
Bin

