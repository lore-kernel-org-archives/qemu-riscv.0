Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maagc-00017B-N6
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 05:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1maaga-00011t-7a; Wed, 13 Oct 2021 05:36:32 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1maagL-0008R1-4Y; Wed, 13 Oct 2021 05:36:31 -0400
Received: by mail-yb1-xb33.google.com with SMTP id q189so4961970ybq.1;
 Wed, 13 Oct 2021 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=99/hi7eAm+LRSl1naEGvTfK/cyxITkeXyE2jChzZPzs=;
 b=FFgg+nm85oy07wjt3P6vVQBJWkeEf0BDcXzkGYT2i3+9Tr/uYtkCWBC911/BZ127UG
 QypWY0LkKgmrxCtuBsbcC9UeShoX4ZF/PIYwjGJSzZezllO0t3KRg2Th/7wAGKzjxQCl
 E0jfmcILNkceMumcTUn6/7gW6lFL/90297CmsF1KAwFgPOkm5AH/++F0kr+ihdIGwclH
 ohBSGyqGC5x6h5qXrr2QxufiOgZ0SDQG+UUwFXrfd3NafQ0c+T7z9hCSxa86dac3QoQI
 Uzp0ulTDgiqwhoS+jJAXlLHzXEObbgiVJI/ArcUTLysTuGYMKat/T74WVGSKoDEt7w0b
 Owvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=99/hi7eAm+LRSl1naEGvTfK/cyxITkeXyE2jChzZPzs=;
 b=Dec7kiEM0jst0PyfgZFuseEg7Ix98Yer+ztSXRJd5kCzxpH6bqTcrAQeJ6Zbk0fh61
 iYY8gTS0FSZnfw9v0LtyLVYKLL5nmWyH6nf4pPAcVUnv0Y8HaRqK2zJjPHrt7Yf+YXgL
 6LLweUra29vyGA4Ev8aemurrddJ0VVPIv/BNcLq7E3Op6AexhUTKN7/RX0tYAHMkFtvP
 VvBY8GNczBRuA7SKVPAwsRW5Gkw6OTjBC5e/snDZjcLSF0ruRiURjbshvGTi0wdrdySd
 wYjNvpOf3dGg+G+p7t4CBOitivBn5hAsTojYYjRKRFvxaQjunoBcNmysE7+OG8dcsDTY
 sGvQ==
X-Gm-Message-State: AOAM530DST9llMm12AzGCY6AgfRMYZ5SEbNrAyZPk8eD52DpKP5ksR8X
 T+uEKKexyl2gi9O9bSDQg9o3O8N68yAqCD+4ais=
X-Google-Smtp-Source: ABdhPJxs8qeW6Ae93IFAzAb4k9Ytgn1mWRL0kRB0L0Gl68v7nZOxnylRrcdDU08N1fT/wHT5KFbTd7cwq0RXwZWLy4c=
X-Received: by 2002:a25:346:: with SMTP id 67mr31505656ybd.345.1634117775361; 
 Wed, 13 Oct 2021 02:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211003112855.960081-1-rpathak@ventanamicro.com>
 <CAEUhbmUsMrSvQHWWoFRzdUuOyxcaaw=L7h7tk0f5_wsd692=ow@mail.gmail.com>
 <CA+Oz1=YrvVA2q=Pg6_vwRmQgLgMEwxirTM-pgAkNcCk+Lj2TVw@mail.gmail.com>
In-Reply-To: <CA+Oz1=YrvVA2q=Pg6_vwRmQgLgMEwxirTM-pgAkNcCk+Lj2TVw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Oct 2021 17:36:03 +0800
Message-ID: <CAEUhbmUzuMXPs+vFRkKeQwsyQR+S3HqubmHbdztTPjEgE31nnQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: csr: Implement mconfigptr CSR
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, pathakraul@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Wed, 13 Oct 2021 09:36:33 -0000

HI Rahul,

On Fri, Oct 8, 2021 at 5:47 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> Hi Bin
>
>
> On Thu, Oct 7, 2021 at 11:07 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Sun, Oct 3, 2021 at 7:29 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
> > >
> > > mconfigptr is an mandatory CSR as per the priv spec.
> >
> > %s/an/a
> >
>
> Done
>
> >
> > as per the priv spec v1.12
> >
> > > This csr holds the physical address of the configuration
> > > data structure if this data structure is implemented
> > > Its an readonly csr set to zero making configuration
> > > data structure not supported.
> > >
> > > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > > ---
> > >  target/riscv/cpu_bits.h | 1 +
> > >  target/riscv/csr.c      | 1 +
> > >  2 files changed, 2 insertions(+)
> > >
> > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > index 999187a9ee..5dc4729ed5 100644
> > > --- a/target/riscv/cpu_bits.h
> > > +++ b/target/riscv/cpu_bits.h
> > > @@ -140,6 +140,7 @@
> > >  #define CSR_MARCHID         0xf12
> > >  #define CSR_MIMPID          0xf13
> > >  #define CSR_MHARTID         0xf14
> > > +#define CSR_MCONFIGPTR      0xf15
> > >
> > >  /* Machine Trap Setup */
> > >  #define CSR_MSTATUS         0x300
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index 23fbbd3216..2182943f54 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -1549,6 +1549,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> > >      [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> > >      [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> > >      [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> > > +    [CSR_MCONFIGPTR] = {"mconfigptr", any,  read_zero    },
> >
> > Not any, as we need to check the priv version >= 1.12
>
>
> To check the priv version, I am thinking of creating a generic
> predicate function
> which checks the env->priv_ver.?
> Generic predicate function for the priv version can be reused in other such
> scenarios also.

Sounds good to me. Thanks!

Regards,
Bin

