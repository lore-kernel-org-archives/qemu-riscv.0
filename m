Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf8Xa-0000SG-VS
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 18:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mf8XY-0000OX-U4; Mon, 25 Oct 2021 18:34:00 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mf8XU-0006zt-4K; Mon, 25 Oct 2021 18:34:00 -0400
Received: by mail-il1-x132.google.com with SMTP id i6so14758856ila.12;
 Mon, 25 Oct 2021 15:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbbH0wA7I6yT0zpY8GTQpovQ8CHyTZ5SdSKH5oWuVak=;
 b=A8qzEUwKNwPSzmuMaLQ19uVqyXRXZZS0wm7mcKjHB3WZT9Z/U+WtK6TjQZkAMWHAHL
 ulg3Ve6igWiBxBuo62olFRz0MPciPTZHD83yvhDMZ7B4EWoXrwRoARRAnJ6mhqqQ97cz
 12o4bHpq/9A4fJtz5xsUcwn/0nOuz6HJsHdZj00ePzuU5WzzYE7IVP7sR70v5gBRNI4G
 EWRvA2oXvvp/rGmsTSjvHsMQQ2L+78uXYOy2H1xVDAk8EkXs08SkTKgxIsLP/+X611Ii
 9kTAcYQpnnPceQWLLrYo32Q9FoOAHwDLevX32Lu17a0u9waSja4p/+dSTnNXDSftnlSP
 1FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbbH0wA7I6yT0zpY8GTQpovQ8CHyTZ5SdSKH5oWuVak=;
 b=UexJ4dgAk8oQeVtDInhFC7bqX2rYokhexohHT4oz+OEsLoZ0f+UYBepSNkbQv0moGU
 tBgqDiOYVHnRcElXpYZMLbtnxSHfV50iiI302CrnCAAD8UCZBmMmf35DamU2Jk74ctmK
 xf8tSP+9s7IbUuxPilhx+gj561xGb3dTHQ8qO6gOU4e5oddIRRqA+oqscEYSKE7VKteX
 CbCPglJEWPX0NMXiDibvo8+IvGVEZxodYXWXzsHX8YWqhTcbL6WGs7nFI+VY2cwg2vJZ
 QlEPaE5JKOcBAlk00qugNg3rYKj+9JqB1hVZyX5ZpypgO3H3kN5Fxp+D04z3iVtQKQbi
 5hHQ==
X-Gm-Message-State: AOAM531fbXgBdoBtB0fszslcGugXaG1aSPQaIdeMa+dD5eJOK2VGIM4H
 bOLbZZ5LuJlai6aPHsPKxD61hlFwmhVDDCl21Ug=
X-Google-Smtp-Source: ABdhPJwvz8CaC6FkV0NhUSVaIl0RDJPCQ1PG5I8em8Ye1fVu9uEV2FHulqAEJ5PYM4mqeWYCfFeunOxDEVUuED5fNkk=
X-Received: by 2002:a05:6e02:1be4:: with SMTP id
 y4mr2250461ilv.74.1635201234644; 
 Mon, 25 Oct 2021 15:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040657.262696-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmVGDtkBAC1cTEno_cCcC_RW30_0xMGS+z5uLOiiwJw9Sw@mail.gmail.com>
In-Reply-To: <CAEUhbmVGDtkBAC1cTEno_cCcC_RW30_0xMGS+z5uLOiiwJw9Sw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 08:33:28 +1000
Message-ID: <CAKmqyKOgnfJiKObyFNKLD=xWN3if0t0EEEMScFGg-iOaFCS_sg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: opentitan: Fixup the PLIC context addresses
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 22:34:01 -0000

On Mon, Oct 25, 2021 at 2:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Oct 25, 2021 at 12:07 PM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Fixup the PLIC context address to correctly support the threshold and
> > claim register.
> >
> > Fixes: ef63100648 ("hw/riscv: opentitan: Update to the latest build")
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/opentitan.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

