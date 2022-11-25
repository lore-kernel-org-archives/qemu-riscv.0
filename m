Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyPTx-0003Nc-VR
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 22:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyPTs-0003N1-6A; Thu, 24 Nov 2022 22:34:26 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyPTq-0000aR-I5; Thu, 24 Nov 2022 22:34:23 -0500
Received: by mail-qk1-x731.google.com with SMTP id x21so1993830qkj.0;
 Thu, 24 Nov 2022 19:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PgdXKMFmy1SHMnG6algOewVt1nBPJcUXQUclSHGV9PU=;
 b=OizUFv10iAUT6bPwS2An2nZYeosXu/P+mJlAHoLbhOMUC7KJz6WlhFzs7An5zucI7S
 NDIF1VSyKnUYCDLfh5Bo2qtzngNkjOSco2xAcBsEqknjTsetT8eN+jip+Ru4ZqWEPOqQ
 ZMaHAhfEFuNX1DQ9yTyPaHNdvGmsGV5/zPZRtjkGlrBPkQQn8FeDJuHE2lPx9bgz3v58
 lHQDboiIXMzj6zuAkNmXHX2RkihzRZAAx7UZSIw1EkFeX8q9+XVj7+S1T/ZgO8tbk+4K
 4P3XURYiu75cuQGLux0tjH8IebZpgKuSHL/bPy8utCBqlQo/R7a6Hboh1Q+FGhTX32WR
 sCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PgdXKMFmy1SHMnG6algOewVt1nBPJcUXQUclSHGV9PU=;
 b=qlOC+FVaEfjltIolmdHPldgKGMIzh+xQnf/HRBOUOTXYrkKEISH7jZ8CJUDmeS8qS7
 0f3W4tDW1celzP22DphxNm4CGS/+quMmDZoqKeHq90ktU58s7PGwIG5hKYqN5Hb+glyw
 pHHg9xb+6Smn+grqZXTNr9MKE4rQRggPoxPUQ84DKicA/M4j97j1NW84zelT+k4Om2jB
 0RE9WB3k8K4PRDUS3jkuJIBG60Q+LlChcu0FgdQAwcb0dTGTJv+vir2iH/8C2BXyvCNz
 7P+8fNUJH/SxkIgIruyI0Empz/7K+glz3Io2bVn7jeUv8r7I3DDP7LXJAzaMr1HOuBsb
 KIfQ==
X-Gm-Message-State: ANoB5pkNMY3+tRPErlgLmS6ox4OeCnDiEYVLLcXCcxxNHbWnbu3P/gV9
 D3VBw5v23ry+zpsohJdi2tkf8ph+hZJHel90uT4=
X-Google-Smtp-Source: AA0mqf7SjqNUnpJpcJzpcaZ5pHYus/r5vBR4eRkzbErNnudgItLufc+i1fPxYzku+e7SVrYIGg/Z6BDUM+euwQ4TN5I=
X-Received: by 2002:a37:88c7:0:b0:6ec:537f:3d94 with SMTP id
 k190-20020a3788c7000000b006ec537f3d94mr15197674qkd.376.1669347260906; Thu, 24
 Nov 2022 19:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20221122154628.3138131-1-bmeng@tinylab.org>
 <CAKmqyKMxtFQ7==QrtY_sPvxCjW0U-sBnegoa5TKOLO-J8=R=Mw@mail.gmail.com>
 <CAEUhbmXFwhpFv=PwEJBfYsbiViuB=GE_4r6MCjfBQ+UpHgkhqA@mail.gmail.com>
 <CAKmqyKNoHFfABeWqatGSzTAkPr8FZubnOMwU-rFsSj91g2f37g@mail.gmail.com>
In-Reply-To: <CAKmqyKNoHFfABeWqatGSzTAkPr8FZubnOMwU-rFsSj91g2f37g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Nov 2022 11:34:10 +0800
Message-ID: <CAEUhbmUVL3qsyxJ8OATfM9mYGSB50bMZXpVkEBRV=O8_M0Y1zA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Dump sstatus CSR in riscv_cpu_dump_state()
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 25 Nov 2022 03:34:26 -0000

On Fri, Nov 25, 2022 at 7:58 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Nov 23, 2022 at 2:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair,
> >
> > On Wed, Nov 23, 2022 at 8:03 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Wed, Nov 23, 2022 at 2:07 AM Bin Meng <bmeng@tinylab.org> wrote:
> > > >
> > > > sstatus register dump is currently missing in riscv_cpu_dump_state().
> > > >
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1332
> > > > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> > > >
> > > > ---
> > > >
> > > >  target/riscv/cpu.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > index d14e95c9dc..80d76f0181 100644
> > > > --- a/target/riscv/cpu.c
> > > > +++ b/target/riscv/cpu.c
> > > > @@ -382,6 +382,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > > >              CSR_MHARTID,
> > > >              CSR_MSTATUS,
> > > >              CSR_MSTATUSH,
> > > > +            CSR_SSTATUS,
> > >
> > > I don't think we need this. mstatus contains all of the information
> > > already and there is limited space to print all of this information
> > > out.
> > >
> >
> > I am not sure what limited space restricts this? This is CPU state
> > dump, and printing sstatus CSR seems reasonable to me. We do the
> > similar thing in the gdb stub too.
>
> Limited space in that there is only so much text we want to dump to
> the screen. As new extensions are added this will continue to grow,
> and sstatus doesn't provide any more information then the mstatus
> register that we already show.
>

On a screen, yes, but we can log to a file so there is no size limitation.

> GDB is a little different as people can interactively probe the
> registers they are interested in.

The dump routine is one of the debug methods too. If gdb stub provides
$sstatus directly I think we should do the same for dump_state for
consistency. Otherwise we can just provide $mstatus in gdb stub and
let user figure out sstatus value.

Regards,
Bin

