Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kW7Yu-0007Df-EP
	for mharc-qemu-riscv@gnu.org; Fri, 23 Oct 2020 20:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW7Yr-0007C1-7h; Fri, 23 Oct 2020 20:37:33 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:36774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW7Yo-0001mm-8E; Fri, 23 Oct 2020 20:37:32 -0400
Received: by mail-io1-xd42.google.com with SMTP id u19so4087068ion.3;
 Fri, 23 Oct 2020 17:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUPaDzjwip3gqAOWaDlVyXRqP5E8rvfi/0vb2jasy+g=;
 b=Lw0IfgDc+TNGAVXzxPAkMMEaPrAS3sKXq1lPjm79mXs2euVHVPlEiJqzFcwcBPEZ8A
 yeaWlZ8zrTYvFgwUo89T5MBcznLPna4fFsYT6iW5SmzRhTWZ68icyxI8zfPrRkCpMLbo
 TSolSyfmuMgdiDLgTD8N16cm/ifFDEOn3tdKXTz/htaQT9xUEIWmvAHx7B4s15EOuNsh
 kLrBo6MeS3UK79/QgpAop9ydXEhk92xmVZuFcHKCvCzbuu13xmAO9zOVyk/5RnbgAXRT
 a1nuw39hrIlXxc0Q2NXQwEiAGZs8ANQhkedzI9BPfnQYJ0xZYDmy7xi6u0C88Drc0aI+
 MOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUPaDzjwip3gqAOWaDlVyXRqP5E8rvfi/0vb2jasy+g=;
 b=CA6p4VItG5sBXcQ/5t1V0CO+9uCnLCuMAgYtQdD34KoZNkwaZ0OSaoFwzXlvQjNSME
 lmtQANf7TM/FJR2weEO534QleZoyk8MVB1qI2IEvhPHbvtVMi9sOCRtmqrKKW3ZgvZLr
 430GswZ97ef8Wpgvbu2tGIQpOw6ePYu6XLi3bpwPlPqfXO00fE5OMFJyjx7o4Rre/Gwn
 oOPb2noIBf5yF/aPhvqxl3jbw6i7pcmNyoT+Zxi23x7CK2wBnV8xWy/oi/iq7yJkObV4
 uDoeMOPWLhSD/pc8Lqs+dmQktsV7F59vDPScI1BsuZaXlva1f2CUO2XQG0r9oJ26NNmH
 PiJg==
X-Gm-Message-State: AOAM530i7ABesBJxgiXYvkMJQhBSErGiQ6hhj98U1B6PaULrdnV+Csxq
 DvMiqfvFK2Dv19hC7m1SZYgRVyTKTBfm1qcTNkI=
X-Google-Smtp-Source: ABdhPJwWaF+TIrGvf4i5TJjl/0ms5lxVQfhTN43f5o9bt9UPT7nucBptBru7Tjfiwmv+GjkWdA2rYv4MIDLMP0lhkDI=
X-Received: by 2002:a6b:c9c9:: with SMTP id z192mr3666549iof.175.1603499848043; 
 Fri, 23 Oct 2020 17:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201022080440.10069-1-space.monkey.delivers@gmail.com>
In-Reply-To: <20201022080440.10069-1-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Oct 2020 17:25:41 -0700
Message-ID: <CAKmqyKO1AdNOynNLDBFR0=x3mbcRn4No_iw7DA8anGOnPwmwVw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] RISC-V Pointer Masking implementation
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, kupokupokupopo@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Sat, 24 Oct 2020 00:37:34 -0000

On Thu, Oct 22, 2020 at 1:04 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Hi,
>
> Added missing sign-off on the first patch.
>
> Thanks
>
> Alexey Baturo (5):
>   [RISCV_PM] Add J-extension into RISC-V
>   [RISCV_PM] Support CSRs required for RISC-V PM extension except for
>     ones in hypervisor mode
>   [RISCV_PM] Print new PM CSRs in QEMU logs
>   [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
>     instructions
>   [RISCV_PM] Allow experimental J-ext to be turned on
>
> Anatoly Parshintsev (1):
>   [RISCV_PM] Implement address masking functions required for RISC-V
>     Pointer Masking extension

Thanks for the patches!

I don't know a lot about the J-extension, so it will take me some time
to read into it before I can review this.

Maybe you can convince Richard to review it for you :P

Alistair

>
>  target/riscv/cpu.c                      |  30 +++
>  target/riscv/cpu.h                      |  33 +++
>  target/riscv/cpu_bits.h                 |  66 ++++++
>  target/riscv/csr.c                      | 271 ++++++++++++++++++++++++
>  target/riscv/insn_trans/trans_rva.c.inc |   3 +
>  target/riscv/insn_trans/trans_rvd.c.inc |   2 +
>  target/riscv/insn_trans/trans_rvf.c.inc |   2 +
>  target/riscv/insn_trans/trans_rvi.c.inc |   2 +
>  target/riscv/translate.c                |  44 ++++
>  9 files changed, 453 insertions(+)
>
> --
> 2.20.1
>
>

