Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290DC25B74
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 May 2024 10:38:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sCdAP-00040Q-Cb; Thu, 30 May 2024 06:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sCdAN-0003yo-Jy
 for qemu-riscv@nongnu.org; Thu, 30 May 2024 06:37:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sCdAL-00023v-8E
 for qemu-riscv@nongnu.org; Thu, 30 May 2024 06:37:51 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-354dfe54738so431060f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 30 May 2024 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1717065467; x=1717670267; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ix9YcMBkAGWhacciiXlNRjqjC3hlgKJfQIWB9MKqA6A=;
 b=KDhu/uJU0tl01DwRwTAcCurzy1uo3M0v6pfGosqroXsWFI/aVB7C/t6iascdGFpWV+
 6NELHYZlIiIeia2EqAvmhzRatNDW3eY/PZjPQhbt7YpX+7fTiVAUniAQzahVTk5vWjjA
 YzTk9e9wUlpfNkLQoyNW0azvwg8RcArKAKOcFvyK9HnUEX0kEFFU7BxBW1jh4S/qMadq
 3rMG/GO6eZm3lFddARBGDxCHatTSXSnR5l/lhgnlBE8rURR4ZSD7M6mtpHl/1CrMBAmV
 wX7JTlIbW4u0lnkmFYcShyU9vV0jf42n2EKj6HZ21THLA5gPyK4xq0gIhpxtMd61PChc
 RcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717065467; x=1717670267;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ix9YcMBkAGWhacciiXlNRjqjC3hlgKJfQIWB9MKqA6A=;
 b=HuKAIpIKukBh5alr2wJM7Zt6WJR3lyiWDO5J7a5hk3q05FuvDI6EsscJAZ7wPAqEu9
 9ZAHRcUGEQl4P5wl992iSSsn9yfGKE1PDMAn77EIudU8gkxRhJ7XOoqoCU8Pw8otsIb/
 cqW9iGsevdllYAWokNEHe5WsFcx3szgRmGHWn6ATVz9FPnWRkylpqiRNeDBXjZbxTgHC
 wD4RTjC0M6/tehQ4z+HEx3oPHifMEFt+MBQ9QV4GXbk+Ny2yOEKxu24Lzlk67KeQXcyw
 WQf6aViCPtxyI0+OS1G3dHhSoRkH8YH8c6WhdBJ+Mct+pdsUqUFgxTG4BCNsFabpA3oX
 QkRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgcZdxQgkltG9vO+EKFcYNMbxni2x/wvvfdszr/Ty7kyXaoew6l79pqGa33M1GgKtUcQ0ss57N58Zed6mGvYu/V3DCNrU=
X-Gm-Message-State: AOJu0YyITxsWLL5pwLuwnxv3+dw+eVF7uPhCMxxyWRshHog16WK6zEUI
 aMCxyBJYj5bUaBffDkrBFTvTQcz2mxLkOyBCZMbfnKQagH5zFFSfgLWYfs1567Gk4745LYfLnuh
 GvRM=
X-Google-Smtp-Source: AGHT+IE0+pkry5KGA9UGfMuiFv24hqY8pX6R/SZGjW55FP69zfFjYotPw++H9P4F+abboPjrQi3LXA==
X-Received: by 2002:adf:fd47:0:b0:349:8ba8:e26d with SMTP id
 ffacd0b85a97d-35dc008674amr1301017f8f.13.1717065467198; 
 Thu, 30 May 2024 03:37:47 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35579d7dba2sm16923930f8f.17.2024.05.30.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 03:37:46 -0700 (PDT)
Date: Thu, 30 May 2024 12:37:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Fea Wang <fea.wang@sifive.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [RESEND PATCH v2 0/5] target/riscv: Support RISC-V privilege
 1.13 spec
Message-ID: <20240530-0521d05b9924d724568bd6a2@orel>
References: <20240515080605.2675399-1-fea.wang@sifive.com>
 <4d2d56aa-5758-4320-a5ef-53ebb87ab494@ventanamicro.com>
 <CAKhCfseJgRzyeg1seuZ15SR=f78E5rnbgfrzY_VeRDhPMOAhwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhCfseJgRzyeg1seuZ15SR=f78E5rnbgfrzY_VeRDhPMOAhwA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, May 30, 2024 at 11:30:28AM GMT, Fea Wang wrote:
> Hi Daniel,
> thank you for your help.
> 
> I found that only the cover is without many maintainers. I used to send
> patches by git send-email --dry-run --to 'qemu-devel@nongnu.org,
> qemu-riscv@nongnu.org' --cc-cmd='scripts/get_maintainer.pl -i' patches/*.
> Do you have a better script for me?
> Thank you.

Some maintainers frown on that because they prefer the whole series,
even if only a few patches touch code they maintain. And, the cover
letter is quite important to get the context. Also, depending on
mail client and filter configurations, CC's that are per patch can
mess up the threading, making a mess of the mailbox. I tend to
use scripts/get_maintainer.pl to pull together a set of people/lists
to CC as an independent step, dump the contents into a file and then
do 'git send-email $(cat my-series.to-list) patches/my-series'

git-publish can help with that too by capturing the "to list" and
maintaining it for you.

Thanks,
drew

> 
> Sincerely,
> Fea
> 
> On Mon, May 27, 2024 at 5:21 PM Daniel Henrique Barboza <
> dbarboza@ventanamicro.com> wrote:
> 
> > Fea,
> >
> > Please try to also add all RISC-V QEMU maintainers and reviewers when
> > sending
> > patches. It will get your patches reviewed and queued faster. Otherwise the
> > maintainers can miss you your series due to high ML traffic.
> >
> > You can fetch who you want to CC using the get_maintainer.pl script with
> > the
> > patch files or any source file in particular, e.g.:
> >
> > $ ./scripts/get_maintainer.pl -f target/riscv/cpu.c
> > Palmer Dabbelt <palmer@dabbelt.com> (supporter:RISC-V TCG CPUs)
> > Alistair Francis <alistair.francis@wdc.com> (supporter:RISC-V TCG CPUs)
> > Bin Meng <bmeng.cn@gmail.com> (supporter:RISC-V TCG CPUs)
> > Weiwei Li <liwei1518@gmail.com> (reviewer:RISC-V TCG CPUs)
> > Daniel Henrique Barboza <dbarboza@ventanamicro.com> (reviewer:RISC-V TCG
> > CPUs)
> > Liu Zhiwei <zhiwei_liu@linux.alibaba.com> (reviewer:RISC-V TCG CPUs)
> > qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
> > qemu-devel@nongnu.org (open list:All patches CC here)
> >
> >
> > I added the extra folk in the CC for this reply so don't worry about it.
> >
> >
> > Alistair, please queue this series. It's already fully acked and I would
> > like to add
> > some bits on top of the priv_spec 1.13 support.
> >
> >
> > Thanks,
> >
> >
> > Daniel
> >
> > On 5/15/24 05:05, Fea.Wang wrote:
> > > Based on the change log for the RISC-V privilege 1.13 spec, add the
> > > support for ss1p13.
> > >
> > > Ref:
> > https://github.com/riscv/riscv-isa-manual/blob/a7d93c9/src/priv-preface.adoc?plain=1#L40-L72
> > >
> > > Lists what to do without clarification or document format.
> > > * Redefined misa.MXL to be read-only, making MXLEN a constant.(Skip,
> > implementation ignored)
> > > * Added the constraint that SXLEN≥UXLEN.(Skip, implementation ignored)
> > > * Defined the misa.V field to reflect that the V extension has been
> > implemented.(Skip, existed)
> > > * Defined the RV32-only medelegh and hedelegh CSRs.(Done in these
> > patches)
> > > * Defined the misaligned atomicity granule PMA, superseding the proposed
> > Zam extension..(Skip, implementation ignored)
> > > * Allocated interrupt 13 for Sscofpmf LCOFI interrupt.(Skip, existed)
> > > * Defined hardware error and software check exception codes.(Done in
> > these patches)
> > > * Specified synchronization requirements when changing the PBMTE fields
> > in menvcfg and henvcfg.(Skip, implementation ignored)
> > > * Incorporated Svade and Svadu extension specifications.(Skip, existed)
> > >
> > >
> > > Fea.Wang (4):
> > >    target/riscv: Support the version for ss1p13
> > >    target/riscv: Add 'P1P13' bit in SMSTATEEN0
> > >    target/riscv: Add MEDELEGH, HEDELEGH csrs for RV32
> > >    target/riscv: Reserve exception codes for sw-check and hw-err
> > >
> > > Jim Shu (1):
> > >    target/riscv: Reuse the conversion function of priv_spec
> > >
> > >   target/riscv/cpu.c         |  8 ++++++--
> > >   target/riscv/cpu.h         |  5 ++++-
> > >   target/riscv/cpu_bits.h    |  5 +++++
> > >   target/riscv/cpu_cfg.h     |  1 +
> > >   target/riscv/csr.c         | 39 ++++++++++++++++++++++++++++++++++++++
> > >   target/riscv/tcg/tcg-cpu.c | 17 ++++++++---------
> > >   6 files changed, 63 insertions(+), 12 deletions(-)
> > >
> >

