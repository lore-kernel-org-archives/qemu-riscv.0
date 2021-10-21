Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdg65-00014X-DD
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 17:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdg5r-0008U2-9Q; Thu, 21 Oct 2021 17:59:23 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdg5b-0001iB-Ba; Thu, 21 Oct 2021 17:59:22 -0400
Received: by mail-io1-xd31.google.com with SMTP id r134so2825479iod.11;
 Thu, 21 Oct 2021 14:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+S47ashz3Eq8axIWyy7qRagrFYmVvZ7flf1dYIBy8hE=;
 b=WLsZzGlcwV/358aiR8zgeS7zM7t77vtl34avamreSuDqbtEqm/P+9yXtgzMkdfeVmY
 Rlxc6SoHtDwsG38IREEm1pIquWYsDA55Vneb45/msGgR2WGEG98ZhuGyh7lCrUvTKcDv
 GKY4U6SVe6zmCt+H2EuQSJiNtL9GMJ+bPU6WH5QMIhggrOBHA3efhv94tzXpNPprkJQ9
 nE6kqPMV1EzH1rid/YXeDlg+Es93+KHEbEMlrHcHHQo1DtFIsAFovQCgKCYBOHAS8b+i
 xDo6OyYplNzGcZ4klreo/jKv1YwmH0bG8TmmXjoCJuSN/hK7LjMl9ZMqOiw35My/iCnw
 8jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+S47ashz3Eq8axIWyy7qRagrFYmVvZ7flf1dYIBy8hE=;
 b=lQJ7nCf8IZ2iXyjIrTAoAf1sXQa5EAtzp5jXI7jwrtJQu+fJkLrvxjmJcZydy/Ikim
 lUG1/lxWtr/WjfWALlno0IvSPbf++L2X4qedFwmnySteK4jnwXcYfjJB//CqOEFTuF8N
 O4Z8v1JOQzHyYdU6Vz2rPQbyXuUrHvTAErsC0Omd76mUtUH3KBf+PnAgg4NcH4a8u7j0
 +3MjtJIERZmywgMyIiNXq4BKgFClj4YUnMNKbfybS+IMyHhmGpnK71jgzY+sG1PIrIad
 WCurMf3qqm9Jn8BV0sgSiCNhjOtx9V52Q9AVfKbu9ovr3YzR09KoZxIfSZonZ1aa0vLC
 r5Eg==
X-Gm-Message-State: AOAM533eaMQqsRuwLMJy4QWEGpCtV/K3dtyVeaakURsxN5dwqp2CHOm7
 q8+lsilrC3kNC+jExvvUSQ7MfAzNoDrl3p72Ad8=
X-Google-Smtp-Source: ABdhPJyvLekulkitDDw2ezIxl9tZbtEgogu7JERIIvcK/SuBP3a2A/CIiFjR3iasRc6S+U6KyEXazTcKdlf0EN2cH54=
X-Received: by 2002:a05:6602:2bf7:: with SMTP id
 d23mr5771135ioy.187.1634853545251; 
 Thu, 21 Oct 2021 14:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
 <4200da222a65c89ed1ba35f754dcca7fdd9f08d6.1634524691.git.alistair.francis@wdc.com>
 <CAEUhbmUuTNYFDy=84xxQbtp7hy=TwGmLXK6YATa076tGW7Ddug@mail.gmail.com>
In-Reply-To: <CAEUhbmUuTNYFDy=84xxQbtp7hy=TwGmLXK6YATa076tGW7Ddug@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Oct 2021 07:58:39 +1000
Message-ID: <CAKmqyKNG1q2a1jrNUH0-3VBxapdFDp8VK4t2Y23NoaCYpEshjA@mail.gmail.com>
Subject: Re: [PATCH v1 5/9] hw/intc: sifive_plic: Cleanup the irq_request
 function
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 21 Oct 2021 21:59:24 -0000

On Thu, Oct 21, 2021 at 5:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Oct 18, 2021 at 10:39 AM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/intc/sifive_plic.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied this and earlier patches to riscv-to-apply.next

Alistair

