Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxh3F-0001AW-17
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 23:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oxh3D-0001AI-Sz; Tue, 22 Nov 2022 23:07:55 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oxh3B-0001u7-My; Tue, 22 Nov 2022 23:07:55 -0500
Received: by mail-qv1-xf35.google.com with SMTP id e15so11456365qvo.4;
 Tue, 22 Nov 2022 20:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jbZyuMIHpXIHOd6u13l4k8Ufs0cHNeSzmAi3IWpxSt0=;
 b=a2RFgrAJ//OPV4OUOYDAXcEmBoffp9WjreKBB1Sy3gmIL299rmhcMkyGtXaeBeXs14
 dghsFv10OOafRIjTOTndueWmx3vxaJfTGrseLqj0BRfC4Q/MHwBjzZfgTg8QjPLvSwz9
 HFhsXsjPymn+vE5WbYTm02pFVGtFu7xvl7zbug4h8lFN+6ypxxk53fhRqX2YEuWm3qgT
 TMojnpyy/SYhw7KtmkbSWC8i7HElF3nXVuAbAsXcn3CsiDxSdEcJiiQqrbv/nEsKeOSl
 cred4B9dB8kzM8trBHqjcEXBE/6wVCqkMnKLU0NOOfQJLkTxY2D6ks9PrD+zKQGAxZLN
 fkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jbZyuMIHpXIHOd6u13l4k8Ufs0cHNeSzmAi3IWpxSt0=;
 b=n82JikMCHI5a1UGaEtAtY9juOXjj6jyQn2MZE1kuE5aU1DbLZ258/lPhddkJEeJaIz
 bTqJ3W0AZ13fuOBIK99vv9VzBIiuQCCHKlFnBgIUZqwlnFjWY8WlK5j3gOTStOiPR0A1
 kUfDXkIBGudx/y1IyGamNC0Fq9hwmbMtN42BvVshayCPoI4Q4Hu1sDLkYKuyd7lr62Vu
 wdImbHoIIR6Gpogallq8z0sOYZpeuYxAwFj/zuZQvvBwlb+wo6Y7iv/Yu7PGhnzZ3J+h
 Vs33E2iVfwBptEzLHJQunXKIN5vdfR9Dy1VWjCCLAsjbodaRXPkOhegflooRaH2/YEL3
 L3Rg==
X-Gm-Message-State: ANoB5pnqc0OdXHZcKt55Ui7tFrrb+//maqpcjuFYy18422Q+Ljy5qp+u
 tn5GR2YrDWA/HHtMxS9W7LAVFOrgjy0mil9QI9w=
X-Google-Smtp-Source: AA0mqf6aloAbHswbY9PnLnlWgk08TeKfanWSII7xN3Y1xxhuHu2f3TAZI8GHezhiIh7zTpp/4Cr9gMrF7fNSx9dmk/0=
X-Received: by 2002:a05:6214:3b0b:b0:4c6:c42b:e0ba with SMTP id
 nm11-20020a0562143b0b00b004c6c42be0bamr3255060qvb.51.1669176467303; Tue, 22
 Nov 2022 20:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20221122154628.3138131-1-bmeng@tinylab.org>
 <CAKmqyKMxtFQ7==QrtY_sPvxCjW0U-sBnegoa5TKOLO-J8=R=Mw@mail.gmail.com>
In-Reply-To: <CAKmqyKMxtFQ7==QrtY_sPvxCjW0U-sBnegoa5TKOLO-J8=R=Mw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 23 Nov 2022 12:07:35 +0800
Message-ID: <CAEUhbmXFwhpFv=PwEJBfYsbiViuB=GE_4r6MCjfBQ+UpHgkhqA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Dump sstatus CSR in riscv_cpu_dump_state()
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf35.google.com
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
X-List-Received-Date: Wed, 23 Nov 2022 04:07:56 -0000

Hi Alistair,

On Wed, Nov 23, 2022 at 8:03 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Nov 23, 2022 at 2:07 AM Bin Meng <bmeng@tinylab.org> wrote:
> >
> > sstatus register dump is currently missing in riscv_cpu_dump_state().
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1332
> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> >
> > ---
> >
> >  target/riscv/cpu.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index d14e95c9dc..80d76f0181 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -382,6 +382,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> >              CSR_MHARTID,
> >              CSR_MSTATUS,
> >              CSR_MSTATUSH,
> > +            CSR_SSTATUS,
>
> I don't think we need this. mstatus contains all of the information
> already and there is limited space to print all of this information
> out.
>

I am not sure what limited space restricts this? This is CPU state
dump, and printing sstatus CSR seems reasonable to me. We do the
similar thing in the gdb stub too.

Regards,
Bin

