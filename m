Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXatD-0002Qq-CK
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 22:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXatB-0002Qe-8u; Tue, 27 Oct 2020 22:08:37 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXat7-00011p-B9; Tue, 27 Oct 2020 22:08:36 -0400
Received: by mail-yb1-xb44.google.com with SMTP id s89so2951761ybi.12;
 Tue, 27 Oct 2020 19:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TtWdI4BUamPhrqWFsdlo5xLm0qcr+/avcPZnxVFwIaI=;
 b=JnGegJh5Sj0WApfsFeOjFW3qM9qgjiH2FIvPgaCij9siA+9SIf6480ozZ1tnY/qOlC
 vjG9JRiPeRPWiFv80KoQF/6SeHChMEBB/1FipDUtk1kAufHERF9H1VB9hkIp/azitXLe
 W6ssPWDvsng+2Mmr6VZKEWBPd/A+Moe6QgIC0t4QM4cdkt9/uDMAjgVXLCBoMv8H7VKq
 +Ed3oB4AuEv7QWXZs3WwSkkd1mZtvfpiqjN5LBPxmQ9v1ktw0k2TUwvJE/KJcetRODyo
 mVG6gg0dcW0oQUAR2f0A33cuIMu3C2JZGBB1nZkGOphWy7UKP1DUwu+xBg+R/fije8Kt
 SkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TtWdI4BUamPhrqWFsdlo5xLm0qcr+/avcPZnxVFwIaI=;
 b=smIpYRKN/A3V+czGg0UTL5Vs+kPhvT4Uvhy+olyzwzFadIRDC5VjflhoFgNVfYeL70
 /Q9pKbzBCzRlAvR+igREMjYdQ6jnvSN2aTYruouIBgeTYXTteqgIfAm5DkojRJQ6ZQ7h
 nY8Gu1UTCUYZmnkzLGy2E06wOFYwl5Ejma+5NJWOwTWTk/VAKZdxwGaCAXApoPBjObI1
 IBTtSc3aR1b/7PVJwl+ZMzVgkuGJP3qb2ywEcCkkkidZyC+rav9CQCWqgcByh8Mw9dM/
 xAEc3FsLnBTaIolZbRjEYhbZgyYq336wj2bYjwWlZL3GwoiUgw4rsBP32xehTGT/bLHX
 Os9Q==
X-Gm-Message-State: AOAM530aItL8STJGa6lOrbFwLYcieZgqKSRfZNUCRESFhOWAqy1fkBzd
 v3FDdfu+HglLK2lPO6LgQPKvNrmmACV8ZiJ/yoI=
X-Google-Smtp-Source: ABdhPJxSnT7zmT9G92Y2200UZ+Cymqr95p7SKotGfEJ/pOT1MdO7ggJN1nXCBjdb3qVueLDroSCChrlDEZJa0rGIU/s=
X-Received: by 2002:a25:c1c1:: with SMTP id r184mr6691457ybf.517.1603850911103; 
 Tue, 27 Oct 2020 19:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201027141740.18336-1-bmeng.cn@gmail.com>
 <20201027141740.18336-8-bmeng.cn@gmail.com>
 <CAKmqyKNVUgV6Go6RdogLxhE5hOBr7aboe1indWTEaodep4MJLg@mail.gmail.com>
In-Reply-To: <CAKmqyKNVUgV6Go6RdogLxhE5hOBr7aboe1indWTEaodep4MJLg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 28 Oct 2020 10:08:20 +0800
Message-ID: <CAEUhbmXEEigdUie4ZW-HezEDZp4hHpz3htPvck53EneB9bQ9wA@mail.gmail.com>
Subject: Re: [RESEND PATCH 7/9] hw/riscv: microchip_pfsoc: Map debug memory
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Ivan Griffin <ivan.griffin@emdalo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 28 Oct 2020 02:08:38 -0000

Hi Alistair,

On Wed, Oct 28, 2020 at 1:42 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Oct 27, 2020 at 7:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Somehow HSS needs to access address 0 [1] for the DDR calibration data
> > which is in the chipset's debug memory. Let's map the debug memory.
> >
> > [1] See the config_copy() calls in various places in ddr_setup() in
> >     the HSS source codes.
>
> Really? This is reserved memory that they just read and write to? That's crazy.

Yes, that's crazy.

>
> If we really need this can you add a comment saying that the
> documentation is wrong (again) and that this needs to be here.
>

I will try to only map 256 bytes to see how that goes.

> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/riscv/microchip_pfsoc.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >

Regards,
Bin

