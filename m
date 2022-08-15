Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNTWQ-0007GM-Dc
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 02:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oNTWO-0007FM-OG
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 02:24:20 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oNTWM-0007ke-VW
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 02:24:20 -0400
Received: by mail-pg1-x530.google.com with SMTP id bh13so5802755pgb.4
 for <qemu-riscv@nongnu.org>; Sun, 14 Aug 2022 23:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=o2xWr1+n7Kt42+dlH3e2BIes24KNG/pmkB6btjXvSkk=;
 b=PXrQlceKjUFu1FvIuox2GrH9nDHKLBMqFYZagtZzgHDZgPelqRhMzRPNknTyO/fwcF
 lBXzKQMy+054Q3P3jhOcx4gSL2s9BgCyjvBVbRRPMT3EYc3IDu+BG3/nrmPKkMrJUQdJ
 QSMrfXdLM9/xS48Ayy6yWxYkMyzsL3A5uHKO+qqSNUCsUKY1eNuG87++HQ2IHlQZPngx
 EEBqZxKHeeBf0C/BEPx900b/baeSNB4JgJ1wN3So8WaozIO3SOo4Kp2LDJBd99ur23FJ
 a79WGHpa8FPN01zYxpaCYNLz6346aOb6Ib24iJdmJPYFU+mA+bkNmZyykBwcHY7SBxhl
 0fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=o2xWr1+n7Kt42+dlH3e2BIes24KNG/pmkB6btjXvSkk=;
 b=lAIL0bDUW/Eb/9CxAxdfkmo9JYPpfefymjrAmW40taRCituNewLMOJYsr5cxVfZgSm
 yDEY9RsF8o5QMb9H/5SoaI6r1cgkL61/JznSMxX9Vz0m9Sb8XVsk4rMXqnNq1Z/2yVgP
 yK/FrDuk9U2NQKnjhf+bv4FC8a4DwF8hwyX9U1pSnaKDhdtg6MScQqQXV6yt0dYU2N/a
 nCw+dUr6F/CCNsU4Ercl4Z2e1bUYnaM9vWVdqyO4dNPiQZZ3weO1pRBbPs6U4wULcEV9
 f/5C501ubQAO7q/L6smkgLTe9gE7h/7ZjSA3iKv54qMevKglCDQyuQpW/IcQ9iMYGCk/
 QJcg==
X-Gm-Message-State: ACgBeo0DClMeOsRsuuy+8JpuSh0YK2FkMkpbUhZswzSBV+xOKctkwMl+
 VoW6hN/YU4tmmoCq2M1iy04mQRT+R6QZGVpnJQKOQg==
X-Google-Smtp-Source: AA6agR5TCi02SDuhcX7XAA8xi23yU7njS4ds1jDODTaRGzJ2xvMIQHOObRHDdbq8VA470ExHLlSTN/PZIiMCnBFZmsg=
X-Received: by 2002:a05:6a00:b82:b0:52f:518f:fe6c with SMTP id
 g2-20020a056a000b8200b0052f518ffe6cmr15141447pfj.80.1660544656924; Sun, 14
 Aug 2022 23:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
 <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
 <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
 <CA+tJHD6gNrtcrZ9bkDet8NuiR8mcSQfeN-Rk3dtm3LmeakKnvQ@mail.gmail.com>
 <CAFEAcA--QMVgw0ZH6S3=jHsazM-AJQX45Hm+aJ+EhDhDrzNubA@mail.gmail.com>
 <CAKmqyKPcr=umn4zUpxNFwBJ8MuuRkdwH5KpDgDiHHn8YMiaj4g@mail.gmail.com>
In-Reply-To: <CAKmqyKPcr=umn4zUpxNFwBJ8MuuRkdwH5KpDgDiHHn8YMiaj4g@mail.gmail.com>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Sun, 14 Aug 2022 23:24:05 -0700
Message-ID: <CA+tJHD4wsGD_EYrR9Lvpjh8dwFAx1eskxv9JS2mhxiLfFedFiA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=furquan@rivosinc.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 15 Aug 2022 06:24:21 -0000

On Sun, Aug 14, 2022 at 3:04 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Aug 13, 2022 at 8:20 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sat, 13 Aug 2022 at 01:53, Furquan Shaikh <furquan@rivosinc.com> wrote:
> > > I ran into a problem when I was testing a project (with a microkernel
> > > in M-mode and tasks in U-mode) that uses semihosting for debugging.
> > > The semihosting worked fine for M-mode but not in U-mode. As I started
> > > digging into this, I realized that this is because qemu restricts
> > > semihosting to only M and S modes.
> >
> > Right. We should fix this by having a generic works-for-all-architectures
> > semihosting config knob, because this is not a riscv specific problem,
> > and we already have issues with different target architectures
> > developing their own solutions to things.
>
> I agree with Peter here. I don't see a strong use case for a RISC-V
> specific fine grained control. A user can either enable/disable
> semihosting for privilege or usermodes (with Peter's patchset). That
> seems like enough configuration options, it is unlikely that someone
> will need semihosting only available to S-mode for example.

Sounds good. Thanks for the feedback. I can continue with the changes
that Peter has.

>
> Alistair
>
> >
> > I'll see if I can dig out the half-done patchset I had for this.

Let me know if you want to collaborate on this to get this to
completion. Thanks!

> >
> > thanks
> > -- PMM
> >

