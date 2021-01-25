Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4BXl-0004Cn-7J
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 18:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BXj-0004Bx-2k; Mon, 25 Jan 2021 18:45:11 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BXh-0002bQ-H6; Mon, 25 Jan 2021 18:45:10 -0500
Received: by mail-io1-xd2b.google.com with SMTP id e22so30212819iog.6;
 Mon, 25 Jan 2021 15:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TgpK4kuseZ/PQbDIFOqfo3voqxVrh1veilec0TRSFdg=;
 b=RA5hak+lLJllSNUJj75KyK1tWl8fMfJ1wfLzrHqy7E81MfSrkBrbjt20rKIBFuj+jQ
 inKfyg2gGPlO7LSUvmOrcYr7eyYfCFm0fojpKVhTf6xT8WjHp0Om3+QlQCzSDkBnBk2L
 gyZ2gFkL9NzasXLuLEQ8MkipoCVBaemRaP6FDhVgLzshhME+TOVXAUzJDo2+Tx9dz39g
 npXRZdt4Z9xJaPIWs1gWFwIQtXhr7zuUxNwRv5t2Vc5bOQA4Ocz2erKZ7GkI780anwgE
 cuuXMmNdsfVB4VA8yq20IS3/rO6Npxuk50TnWqJSbiBBEoGroHzwztrEcqlJclk8kV2/
 HMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TgpK4kuseZ/PQbDIFOqfo3voqxVrh1veilec0TRSFdg=;
 b=F2B+0dquQqFLfWpM2skJvgSWoenB6Z9T5zcvOLaR2D0cDjj/J78eUgKrbrzB37epO+
 l/FXGofovXZ7iowtJYrjXHNS/ddyLFsLEpiIq31pY0GqU4uov0jmy42bV4s5gARdBaQJ
 3sEY/FlaUH4tGUKrfwH2ytmqmmAV9CizdpaWcajQBbSBhyGExR0SLC8Wa2AHYlva1gon
 w6UALOPQFlexvQvRb4sqjTdhghKaduvlOPY8vkady2O0rxSapszDETH+PBv19dmPGtTz
 5GPiGjO30qoNsyUWzIIEwKLLKvVPNdEA0hR/Gq7/czLMZttIjCdiiBeYNsR7wmDVq0/M
 nKgQ==
X-Gm-Message-State: AOAM531lNRKQpK5CRGT3Ol+B5HtxeINk4TEckQ2JyhMofX07JBcdcCU1
 u2K/g+tzH3pN3bHdsHIayMWHlFtb2aYzz3pvxqVpWSPiBjA=
X-Google-Smtp-Source: ABdhPJy/UsRC5KA61FJMG/5iZoACW74siioH5p5BrXa+WTlDBgM3TztgBnP034xjC5vdnz+ihS9HYt8LfnrE51kqwtA=
X-Received: by 2002:a02:5148:: with SMTP id s69mr2718483jaa.8.1611618307866;
 Mon, 25 Jan 2021 15:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-7-laurent@vivier.eu>
 <2bb1378d-1ccb-d373-1de2-9add2f5e8a23@vivier.eu>
In-Reply-To: <2bb1378d-1ccb-d373-1de2-9add2f5e8a23@vivier.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jan 2021 15:44:40 -0800
Message-ID: <CAKmqyKMjunx2kD6u+11QbT56Lr_ruMxbAu58-UckD7oy-15OXw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] goldfish_rtc: re-arm the alarm after migration
To: Laurent Vivier <laurent@vivier.eu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Mon, 25 Jan 2021 23:45:11 -0000

On Sat, Jan 23, 2021 at 7:06 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Is there someone to merge this?

Do you mean just this patch or the whole series?

Alistair

>
> Thanks,
> Laurent
>
> Le 20/12/2020 =C3=A0 12:26, Laurent Vivier a =C3=A9crit :
> > After a migration the clock offset is updated, but we also
> > need to re-arm the alarm if needed.
> >
> > Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/rtc/goldfish_rtc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
> > index 0f4e8185a796..e07ff0164e0c 100644
> > --- a/hw/rtc/goldfish_rtc.c
> > +++ b/hw/rtc/goldfish_rtc.c
> > @@ -211,6 +211,8 @@ static int goldfish_rtc_post_load(void *opaque, int=
 version_id)
> >              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> >      s->tick_offset =3D s->tick_offset_vmstate - delta;
> >
> > +    goldfish_rtc_set_alarm(s);
> > +
> >      return 0;
> >  }
> >
> >
>
>

