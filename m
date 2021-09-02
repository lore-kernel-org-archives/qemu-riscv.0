Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLf8Y-0001SF-WD
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 01:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLf8W-0001R7-Sx; Thu, 02 Sep 2021 01:19:40 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:44807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLf8V-0005ZZ-4e; Thu, 02 Sep 2021 01:19:40 -0400
Received: by mail-io1-xd34.google.com with SMTP id g9so920664ioq.11;
 Wed, 01 Sep 2021 22:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kkaUL69H9dhMTpvuFyDJwthvyJoDxIwcEHhsFYy+H5A=;
 b=kKnbKtPamjzDTpWeEl4zxGZctbVNlAA9NW0RscRg2HkQSIRIS20ovantkuG1Eitb9i
 PjtP8MB0s1i67p4V19cMD7d30lUbwDNDnYkJpZjfLmxDeOFBUKwVVzrz0KgyrqDyBBeK
 lepxma+jEJasqiqKKNPtoHNmsHa/lMRFVikLk/xiAfUcizhzkwzuiYY8qQLrCbMMzT1x
 p6/zzWsjJQLTXx877E+p4lQ0g+v8osGl1yoBI1pOszwqKltTGoGYN7hXy0QarM/pD/NI
 J38iTb99LEJW1kF+LAFTFEJLtw+GfO6YgFwvT6bSer3J3XvLjk4pj9xy/LZN+5SlwuHl
 sFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kkaUL69H9dhMTpvuFyDJwthvyJoDxIwcEHhsFYy+H5A=;
 b=CZ0b2eoPj7bxdyjUuRKt/CYEvklPEswnKlH5l5XfxdynPAhwEP7eqTHUT8ceLUmD6J
 gZcgqifPOXAWY9zg8AszM6XZHbyKVG4eJZf8O1yfAkYzyvliit+ymGiCVMFWaXgYq76F
 3D4dlqXs3PdCEF3lkmatUDLVfHrRNc+xnrwhkczr0r8p+lh4taYqcuHdWEXsJZ+EZK1O
 pKomkoeeXqQR9hmSqUspIVupOjRoIU99rQmkQevohNPo/lLbhG91TEbAMttXr1M17DFq
 UXm0Rzd4GJd6ewAxfS4SLcXk3wVOnOqQhXcWcqu1NnEAtFgU4pu4ix6OUCtsy2Q/BQ0c
 EIww==
X-Gm-Message-State: AOAM533YYkV5t64OlkjBklSRmadumPBfSbXtFmXEfhgHa5I/uzgOAjo2
 jY/1Zr19rFtAmmJuTE/S+Xo2zKMki/gv/d8sOt4=
X-Google-Smtp-Source: ABdhPJxFfhOLv4FG8S6Q3ZX8tXRPhDG9h4jVSFsXTVdEP2H1A9R0IqkDoNorrsVYjtBDtUqBs6WlsxSWCumWT0Gg/Rc=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr1310562jag.106.1630559977539; 
 Wed, 01 Sep 2021 22:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <28c908de60b9b04fa20e63d113885c98586053f3.1630543194.git.alistair.francis@wdc.com>
 <CAEUhbmU793C3a+7heXuG+=JiiVK47Q5F1pCzrEOTOD3=WTH=SA@mail.gmail.com>
In-Reply-To: <CAEUhbmU793C3a+7heXuG+=JiiVK47Q5F1pCzrEOTOD3=WTH=SA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 15:19:11 +1000
Message-ID: <CAKmqyKNMM7PbX_wF32fmOc-7g9_9MAE42LLCEmL7X0sGmwPiNA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv: Update the ePMP CSR address
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 05:19:41 -0000

On Thu, Sep 2, 2021 at 11:57 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Sep 2, 2021 at 8:40 AM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Update the ePMP CSRs to match the 0.9.3 ePMP spec
> > https://github.com/riscv/riscv-tee/blob/61455747230a26002d741f64879dd78cc9689323/Smepmp/Smepmp.pdf
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu_bits.h | 4 ++--
> >  target/riscv/cpu.c      | 1 +
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

