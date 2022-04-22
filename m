Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhjRT-0006ru-RJ
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 22:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhjRS-0006qE-72; Thu, 21 Apr 2022 22:54:42 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhjRO-0006r2-3U; Thu, 21 Apr 2022 22:54:41 -0400
Received: by mail-ej1-x62e.google.com with SMTP id r13so13691464ejd.5;
 Thu, 21 Apr 2022 19:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LFlPpuqm9znghyTB1ipCpCAtLAi+DOiCIhrnGfLOPM4=;
 b=jB0klZZdtMlPdEp9/hpQafjNaqiYN1dv2zRhOvnhfK9NxkE7uGfyNz2QI7+pUoD40b
 kzBKHifZ9gZB7399ZFfDpexhpQblYU4e9fjWlkkYsHG7CxRO0WFa5hKZlG7e8jo83cxW
 R1uqCLgl+yVgPB4D4buYU66J5d6Z14PoUwISMCQffWgX2URKqhbYHaN+f9zykaWRPz6+
 zYP3yZva/4fFIkwO50FZSpVIp3sBTqHJd2OJAJM+5mdFb5wf+iQ5a8GgLNjXpfoQfj2N
 FyoZ3sxohOTuzAkbJL4lJkO3DveIl4e02nbqu+TBzAsNyHe49IVouhwbusk7bPsL1QRa
 44SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LFlPpuqm9znghyTB1ipCpCAtLAi+DOiCIhrnGfLOPM4=;
 b=qHuV6U7UiI+fYnmT/+bLotbKirebVgxfjuyI/N58JKiXtTy1hL9T++/9IkLsFlaDcE
 kyEpy4zErmhSeiQxNDQrtMU8osOmdsyqQ71bs9AI47qNCCzEpRFIqEFvhMUYWdlK4Q6K
 Ok/YSImpuU886bRHuXle3WlomMGnOQDiJOjHVh6Y/tEyQDRJ8zHAJc/IyxiVHlt/K4jS
 IDZZT5fkXIwh2l6qgBpEMPm4H0uw/SqBIXLVtJnlig+JhlMhaoZRL3weJVCRue/De3pT
 OV+KGJOGS76maG76j171zEbGGkmtUVtga248T2OYOGNRp4oDy231gGLBIBoyrEeaqLIq
 28Qw==
X-Gm-Message-State: AOAM530WIqMjHlnpLt7Rl382gPYJ/GlneEP3raMkgoK8YDZTHGJnJdUW
 +SWStAUzTFtaQTS5i0v7kwg8yeIlubN+EjqTUpM=
X-Google-Smtp-Source: ABdhPJxIANeLMcincbFDUHFh+t3BXOUnr3HQstHAwhHJqDKFtD9sh8/maYUXkODmetDBtwY5lpYOVBI13WIRbTMlzS4=
X-Received: by 2002:a17:907:94cc:b0:6f2:72ff:6e2f with SMTP id
 dn12-20020a17090794cc00b006f272ff6e2fmr530906ejc.27.1650596070160; Thu, 21
 Apr 2022 19:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
 <20220404173417.2946065-1-ralf.ramsauer@oth-regensburg.de>
 <CAEUhbmXZo=RSGSOoJQRTfsRF8z3gEntgKZDNmptLsvja-z6u+w@mail.gmail.com>
In-Reply-To: <CAEUhbmXZo=RSGSOoJQRTfsRF8z3gEntgKZDNmptLsvja-z6u+w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 10:54:18 +0800
Message-ID: <CAEUhbmUTSX3EYu7=-S-o-iYxZzVbpkZWeLqnDTB-R9mUn20HDA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Fix incorrect PTE merge in walk_pte
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Huber <stefan.huber@oth-regensburg.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Konrad Schwarz <konrad.schwarz@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Fri, 22 Apr 2022 02:54:42 -0000

On Fri, Apr 22, 2022 at 10:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Apr 5, 2022 at 1:34 AM Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de> wrote:
> >
> > Two non-subsequent PTEs can be mapped to subsequent paddrs. In this
> > case, walk_pte will erroneously merge them.
> >
> > Enforce the split up, by tracking the virtual base address.
> >
> > Let's say we have the mapping:
> > 0x81200000 -> 0x89623000 (4K)
> > 0x8120f000 -> 0x89624000 (4K)
> >
> > Before, walk_pte would have shown:
> >
> > vaddr            paddr            size             attr
> > ---------------- ---------------- ---------------- -------
> > 0000000081200000 0000000089623000 0000000000002000 rwxu-ad
> >
> > as it only checks for subsequent paddrs. With this patch, it becomes:
> >
> > vaddr            paddr            size             attr
> > ---------------- ---------------- ---------------- -------
> > 0000000081200000 0000000089623000 0000000000001000 rwxu-ad
> > 000000008120f000 0000000089624000 0000000000001000 rwxu-ad
> >
> > Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> > ---
> >  target/riscv/monitor.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> > index 7efb4b62c1..9dc4cb1156 100644
> > --- a/target/riscv/monitor.c
> > +++ b/target/riscv/monitor.c
> > @@ -84,6 +84,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
> >  {
> >      hwaddr pte_addr;
> >      hwaddr paddr;
> > +    target_ulong last_start = -1;
> >      target_ulong pgsize;
> >      target_ulong pte;
> >      int ptshift;
> > @@ -116,7 +117,8 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
> >                   * contiguous mapped block details.
> >                   */
>
> Please also update the comments above to mention the new case you added here.
>

Otherwise,

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

