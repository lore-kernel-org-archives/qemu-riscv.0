Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwtTz-0007fW-6G
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jan 2021 16:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtTv-0007dY-90; Tue, 05 Jan 2021 16:03:07 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:36487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtTt-0002JJ-K7; Tue, 05 Jan 2021 16:03:07 -0500
Received: by mail-io1-xd2c.google.com with SMTP id u26so696987iof.3;
 Tue, 05 Jan 2021 13:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n9gz2rwYqZFn9JTihht/vRAxKcKDlSeyKKpT50rTLt8=;
 b=hiYe8HY6LQCTryAtd+7jAwSmZSmOHZ6W23BW0NRex4ue0GRH7OsrilfiGiVznVH2Aw
 XbrszRXR3AXnd6dg6GMqKAVen3Z84vmt3cItKetaDqNQz+GIliW2voOfenhSD0M9xfwl
 7Ag5VBOgJ8Zsn+b/LJrQuD1IxnvsMyLXjYOIcYQcD62nbzCq0O8r2aro1wEl6sS/+ZCM
 6+wOW7ejCjAe77KVoRUXe/9HCiDSoAeK7BrFr/rrXvoC7TmEtsFdUEtoo0l/8tE9sPsY
 8Yz/Z3bi0k+XarxiCxivH5EqNwYSxfop17IuV3iQNm4IrWPqDE5GvMcVWultxYnCavnK
 w0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n9gz2rwYqZFn9JTihht/vRAxKcKDlSeyKKpT50rTLt8=;
 b=NCFBt7bgtWYzTWsrqhFDv/xlDSV87vhnXRu3IqmgnjuIaBovpSqIwRzU7kiqcaZVfK
 3YIsYgmEln+vDGx2SuByBS/pnBMTUD00QkZuBAwlwYkAreJ/Du0ZfGbtzP+kLXb3P3tg
 UQMl6faN4KwvLXRsPjSfLBx5DpvBRJSGymHeRql5QWajO+IPR8JvEr0+jwln7TY3qQLa
 FcnkcQxMF8LZ+eiqwAtMBo24bIZOmEnUkP81jDX7M/20fBx3iG/dAUyYxxIpuil+HCDc
 l2Hk7Df8MJ6jJB/fzfPivfc78QhHhNTC4huPYRcDNbipmlpdoImTqxQs/4ic7ckSCJEs
 q/oQ==
X-Gm-Message-State: AOAM5316vcN1r9BMtHxEOyJWLZhqbcezOMiOD5HdGVepbVlN6I4c2BaI
 HWwL7hDGfhSKSgo9Jr5SvwfZFFSD66ApVtn5eus=
X-Google-Smtp-Source: ABdhPJxG8mkZXzboNrEqSqojdJXOzgb+ZSf3UKKUVOft3LLaKWmzxNrTnafZqEj/pFqoLGecq+OMOcs0VT3/AzLjAhQ=
X-Received: by 2002:a5e:9242:: with SMTP id z2mr717089iop.175.1609880584240;
 Tue, 05 Jan 2021 13:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20201217214826.2094617-1-atish.patra@wdc.com>
 <CAEUhbmVc_SABW_0PKgDMY8t3zTujo4xUnNW3fz1YuWhqXWnV2A@mail.gmail.com>
In-Reply-To: <CAEUhbmVc_SABW_0PKgDMY8t3zTujo4xUnNW3fz1YuWhqXWnV2A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jan 2021 13:02:37 -0800
Message-ID: <CAKmqyKPSk4gc2vpqAQmFyhyZkJxvJSWCFRB6bzYsdQTO3UVPQw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Tue, 05 Jan 2021 21:03:08 -0000

On Mon, Jan 4, 2021 at 7:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Dec 18, 2020 at 5:48 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > Currently, we place the DTB at 2MB from 4GB or end of DRAM which ever is
> > lesser. However, Linux kernel can address only 1GB of memory for RV32.
> > Thus, it can not map anything beyond 3GB (assuming 2GB is the starting address).
> > As a result, it can not process DT and panic if opensbi dynamic firmware
> > is used.
> >
> > Fix this by placing the DTB at 2MB from 3GB or end of DRAM whichever is lower.
> >
>
> Fixes: 66b1205bc5ab ("RISC-V: Copy the fdt in dram instead of ROM")
>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  hw/riscv/boot.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> Tested-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>

