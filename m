Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSeLx-0004OG-Mq
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSeLo-0004Jn-O7; Thu, 16 Feb 2023 08:31:05 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSeLm-0002Wa-R1; Thu, 16 Feb 2023 08:31:04 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lf10so5148840ejc.5;
 Thu, 16 Feb 2023 05:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YA0WRd7XdjZEZkQ5yYVthD3I/pmg80hth4Ch/m1rXAI=;
 b=onxEJ8Z0TyJYB4VUwei8xO5aHe9xWI9n+DclNHq//uCjdMfpbo6cmo6VATAE3k2JqD
 QfNvz7nwAFTSGuqpSfTq/YuQkFzmAgK8gWHVe37YrvRjcwfg+6HFpmn4ykX1omk/bP7b
 0iQFtl0OLEOeEHT9Fn35k/IWcOKbVR5ySH6UMfMnifn2HaQOcYmwpRbbfFbCvyFCuMai
 AI9SLfLrg7bwYIQGN6o6w2yEjFd8aMRz7A7ZSNseY/Y2y7nhcF+ZNM91NbOujnQOTWGV
 B6lQlykAKtdo2EVvZBetmg2z/gIKJC7b6oIkgBfsK61Q14OlFDU4TlT3egG4qd4RymIA
 Horg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YA0WRd7XdjZEZkQ5yYVthD3I/pmg80hth4Ch/m1rXAI=;
 b=Remsb/7pWtomBWfkIQGN1mxbMBkEfwMSy7aRrHmHgIFGsAUPuNu840IFRn+l5BWSJO
 h5xv18ZJFqiCbEtXZRlIZEOtq2aPqTf0FonbHKT9zbB0sk7+UJG1tfSr9xR8Q1QTcvy0
 rbjNFLKVFiLPvRlGG4OTS7xsWix8vTJBAJB6dAsgQYInAHjX3yan6ZFTDkiJi+TcOptn
 yWHDqw4UrOIkPDN5d6lJN/KcrV0d/Wt4rN+/LppQSveGdVZu0Yu2dkz+bGhTfuncieEw
 6XQKA9oOMI0ElokoYwSYKdH02PevWwLJ0uc4D2yuPce3gFc5trQYitiWn2rIt1kj8iHL
 B30w==
X-Gm-Message-State: AO0yUKWamPwkBwtsgsu/KBStF6a9SisF3YORr1LerMEUOT58pHkERAQR
 lnBEQcC+3o8QJ7J9l4oChdm1rOs5twt+wPhaCmM=
X-Google-Smtp-Source: AK7set+YnUe1LyiYBHAM7c0kXFq3rEli3P3iXEZ9gfREED57JlsHL6PaD1vY0kOiNd1PXXzppnAvo9uHfDUoP8bG4zw=
X-Received: by 2002:a17:906:71b:b0:8b1:30da:b585 with SMTP id
 y27-20020a170906071b00b008b130dab585mr2827176ejb.6.1676554258930; Thu, 16 Feb
 2023 05:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
 <20230215185726.691759-3-dbarboza@ventanamicro.com>
 <20230216092922.sxxwuizbpj65zt4z@orel>
 <CAEUhbmUcbwCmTtBnXHcXsVY-WaO9RHG-FkYieppFeS6_NmCauA@mail.gmail.com>
 <20230216100758.b7ginht55nzqbehw@orel>
In-Reply-To: <20230216100758.b7ginht55nzqbehw@orel>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Feb 2023 21:30:47 +0800
Message-ID: <CAEUhbmVGO+ERoBxwVPK4cm4-wrrDc0nyuUoEhHGk6eeMMizedg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] target/riscv: always allow write_misa() to write
 MISA
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 13:31:10 -0000

On Thu, Feb 16, 2023 at 6:08 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Feb 16, 2023 at 05:33:55PM +0800, Bin Meng wrote:
> > On Thu, Feb 16, 2023 at 5:29 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Wed, Feb 15, 2023 at 03:57:18PM -0300, Daniel Henrique Barboza wrote:
> > > > At this moment, and apparently since ever, we have no way of enabling
> > > > RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> > > > the nuts and bolts that handles how to properly write this CSR, has
> > > > always been a no-op as well because write_misa() will always exit
> > > > earlier.
> > > >
> > > > This seems to be benign in the majority of cases. Booting an Ubuntu
> > > > 'virt' guest and logging all the calls to 'write_misa' shows that no
> > > > writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> > > > RISC-V extensions after the machine is powered on, seems to be a niche
> > > > use.
> > > >
> > > > Regardless, the spec says that MISA is a WARL read-write CSR, and gating
> > > > the writes in the register doesn't make sense. OS and applications
> > > > should be wary of the consequences when writing it, but the write itself
> > > > must always be allowed.
> > >
> > > The write is already allowed, i.e. no exception is raised when writing it.
> > > The spec only says that the fields may/can be writable. So we can
> > > correctly implement the spec with just
> > >
> > >  write_misa()
> > >  {
> > >    return RISCV_EXCP_NONE;
> > >  }
> >
> > Agree. Such change is still spec compliant without worrying about the bugs.
> >
> > >
> > > as it has effectively been implemented to this point.
> > >
> > > Based on Weiwei Li's pointing out of known bugs, and the fact that
> > > this function has likely never been tested, then maybe we should just
> > > implement it as above for now. Once a better solution to extension
> > > sanity checking exists and a use (or at least test) case arises, then
> > > the function could be expanded with some actually writable bits. (Also,
> > > I think that when/if we do the expansion, then something like the misa_w
> > > config proposed in the previous version of this series may still be
> > > needed in order to allow opting-in/out of the behavior change.)
> >
> > In QEMU RISC-V we have some examples of implementing optional spec
> > features without exposing a config parameter. Do we need to add config
> > parameters for those cases too? If yes, I am afraid the parameters
> > will grow a lot.
> >
>
> I agree, particularly for RISC-V, the options grow quickly. How about this
> for a policy?
>
> 1) When adding an optional, on-by-default CPU feature, which applies to
>    all currently existing CPU types, then just add the feature without a
>    config.
>
> 2) When, later, a CPU type or use case needs to disable an optional
>    CPU feature, which doesn't have a config, then the config is added
>    at that time.

This policy sounds good to me.

> While that policy seems reasonable (to me), I have a feeling the "applies
> to all currently existing CPU types" requirement won't be easily
> satisfied, so we'll end up mostly always adding configs anyway.

Probably this does not apply to machines that have fixed configuration
RISC-V processor. But let's see what happens.

> We can always change RISCVCPUConfig.ext_* to a bitmap if we feel like the
> CPU is getting too bloated.

Regards,
Bin

