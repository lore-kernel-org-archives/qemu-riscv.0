Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mN8hS-0000z0-8w
	for mharc-qemu-riscv@gnu.org; Mon, 06 Sep 2021 03:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN8hQ-0000yT-6L; Mon, 06 Sep 2021 03:05:48 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:36597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN8hM-0004BC-KS; Mon, 06 Sep 2021 03:05:47 -0400
Received: by mail-il1-x12a.google.com with SMTP id x5so5911271ill.3;
 Mon, 06 Sep 2021 00:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1TrRfQEipbrUmRdu3jcRResEFDa88BM2RFTkQVTCGqA=;
 b=Nt/vIknjbq4qQmGoY+u+SqaSIhSxRsCIaYte7YnhQGZwgRR6m1vmIcw+h5mTwG5ExX
 y3qFSb5Sy8wZdwHqTLAmycWt3WNLFe006NEi46fULi/pjWvi6fMdm+8hlmaden3PnvLl
 j5TdN/26RN26wuOi4mwW8AGikjfAtzl89Bowwrtc51RPSYqPHGcabxV9mECZnbgggMni
 S2vX68/Vw5EqdhNIk19TisR8uXW05ERm+DfNvYM9qAZ8WurtDp3Rqgii+V9DkBTXLULM
 IyAwPOYPJnQbVI7kpqIOCWi3cWyZhGK5c0EBe9JrkFUXg51ENLAy3p4RRb7eQTGTWC+0
 u7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1TrRfQEipbrUmRdu3jcRResEFDa88BM2RFTkQVTCGqA=;
 b=ToHQe7N3lE+iRYNTANflZvcQc3YqRFxRkRHeicI9h0wAOlk03057YnT2SzNtFiwAsI
 Vq9YR+9U/vg8ujaM1SIzUzr+snUIhOEzkGWcbrIJ3ccEV5dtYsO3Ap2rqyzAYGE4povi
 1+CUr/0Mx8DkPPw6mR//TqjWrKbK133thVKi+DRADZ/YQ7ujZP2IZZbl5ZffsybcIdN1
 9LXai5gUS7bVc/mn88vLTxqPjBBRrFsWb6cpInMoQHFZQkstw1myAN4vaGEQKsHQgJdi
 wZ3xxZuGYW+AsXzeA0oKFvR/6ehXu1Vs1jFJkfysjmmjIMKDMcwRCUoqtgyNJ65/iIoV
 yV/g==
X-Gm-Message-State: AOAM532fNM633cz23oLuHQx21TS1lroNUunCnuRuWAbv2DJA1wZTA6fP
 MwOtoP3YfCiSh+FHxCYHTZbpKI5YIY9yV7zj330=
X-Google-Smtp-Source: ABdhPJyWLwQUu813Rc4nsul5GtDkZRFxn8KFOuEIBfRU6T/eHaDd3XItY4eKuaijOdIUO8pqBjPpxDznMrq4ai6TazA=
X-Received: by 2002:a05:6e02:13ea:: with SMTP id
 w10mr2336574ilj.74.1630911942666; 
 Mon, 06 Sep 2021 00:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210826151332.32753-1-ruinland@andestech.com>
 <CAKmqyKPY=Q61x7gf_0S1-B66VMpZCFx1r5ENJG0J5FNX6NLz0w@mail.gmail.com>
 <YTW6ADQMBcs5csXv@ruinland-x1c>
In-Reply-To: <YTW6ADQMBcs5csXv@ruinland-x1c>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Sep 2021 17:05:16 +1000
Message-ID: <CAKmqyKPu9MK0KRycXzcnb=pH_OjB1mCKzw8uhb2vSZAwxraAfg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] riscv: Adding custom CSR related Kconfig options
To: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 Dylan Jhong <dylan@andestech.com>, guoren@linux.alibaba.com, 
 ycliang@andestech.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Mon, 06 Sep 2021 07:05:48 -0000

On Mon, Sep 6, 2021 at 4:49 PM Ruinland ChuanTzu Tsai
<ruinland@andestech.com> wrote:
>
>
> Hi Alistair,
>
> Thanks for the heads up about the upcoming unification of RISC-V 32/64 targets.
> Yet I have several concerns and would like to have some brainstorming regarding
> such topics - -

No worries, I'm happy to discuss.

>
> That is, could you elaborate more about the "runtime check/switch" which you
> mentioned in the previous e-mail :
> https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg02154.html
> I'm not quite following the context.

Yep, so something along the lines of this in `riscv_csrrw()`

if (cpu == "MyCustomCPU") {
    my_custom_csr[csrno].read();
}

So we check if using the CPU then apply extra CSR accesses.

> If we don't have a way to toggle which (vendor) cores, which will be used,
> during compile time, it means that we have to build all the vendor code and
> link them all together; and we might have the chance to encounter collision on
> csrno between different vendors.

I don't see how they will collide as we will only act on 1, based on
the CPU we are using.

>
> Secondly, I'm not quite sure about how we're going to merge decode tree files
> across RV32 and RV64. Vendor-designed custom instruction would have a different
> encoding scheme on bitfields for RV32 and RV64. Currently, we (Andes) are using
> different decodetree sources for gen32 and gen64 in `target/riscv/meson.build`.

Ok, so custom instructions are a whole different problem. I think we
should leave that for now and focus on CSRs.

A quick look though and I suspect we could do a similar CPU check in
decode_opc(). Dealing with the decodetree will be problematic though.

> I'm preparing the patch to demonstrate such hiccups.
>
> As far as I know, there's no control flow logic for decodetree to parse
> decodetree files differently. (e.g. ifdef XLEN == 32 then blah, blah).
>
> To meet in the halfway, maybe after the grand unification on RV32/64, we can
> still confine vendor custom logic (i.e. instrucions and CSRs) to be toggled by
> whether a certain vendor cpu model is selected ?

I honestly don't see a scenario where that happens. The maintenance
overhead and confusion of changing the CPUs at build time is too high.

I also don't think we should need that for CSR accesses. Custom
instructions are a whole different can of worms.

>
> By the way, I'm wondering how our friends from T-Head (Guo Ren ?) regard this
> issue ? AFAIK, they forked QEMU from v3.2.0 and applied their vendor features
> on top of it for quite a while.

I'm not sure.

Alistair

>
> Cordially yours,
> Ruinland ChuanTzu Tsai
>
> On Thu, Sep 02, 2021 at 12:25:20PM +1000, Alistair Francis wrote:
> > On Fri, Aug 27, 2021 at 1:16 AM Ruinland Chuan-Tzu Tsai
> > <ruinland@andestech.com> wrote:
> > >
> > > From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > >
> > > During my modification on my previous patch series for custom CSR support, I
> > > believe this issue deserves its own discussion (or debate) because it's _not_
> > > as simple as "just put those options in Kconfig".
> > >
> > > The obstables I've encountered and the kluges I came up is listed as follow :
> > >
> > > (1) Due to the design of top-level meson.build, all Kconfig options will land
> > > into `*-config-devices.h` since minikconf will be only used after config_target
> > > being processed. This will let to the fact that linux-users won't be able to
> > > use custom CSR code properly becuase they only includes `*-config-devices.h`.
> > > And that is reasonble due to the fact that changes on cpu.c and csr.c is a
> > > target-related matter and linux-user mode shouldn't include device related
> > > headers in most of cases.
> > >
> > > So, modify meson.build to parse target/riscv/Kconfig during config_target phase
> > > is without doubts necessary.
> > >
> > > (2) Kconfig option `RISCV_CUSTOM_CSR` is introduced for RISC-V cpu models to
> > > toggle it at its will. Yet due to the fact that csr.o and cpu.o are linked
> > > altogether for all CPU models, the suffer will be shared without option.
> > > The only reasonable way to seperate build the fire lane which seperates vendor
> > > flavored cpu and spec-conformed ones, is to build them seperately with options
> > > toggled diffrently, just like RV32 and RV64 shares almost the same source base,
> > > yet the sources are compiled with differnt flags/definitions.
> > >
> > > To achieve that, miraculously, we can just put *.mak files into `target`
> > > directoy, because that's how `configure` enumerates what targets are supported.
> > >
> > > (3) The longest days are not over yet, if we take a good look at how the minikconf
> > > is invoked during config_devices and in what way *.mak presented its options
> > > inside `default-configs/devices`, we can see that *.mak files there is formated
> > > in `CONFIG_*` style and the minikconf is reading directly during config_device
> > > phase. That's totally different from *.mak files presented in
> > > `default-configs/targets`. To make the parsing logic consistent, I
> > > introduce a rv_custom directory inside which contains minikconf-parsable
> > > mak files.
> > >
> > > With this patches, ones can build a A25/AX25 linux-user platform by :
> > > $ ./configure --target-list=riscv64-andes-linux-user,riscv32-andes-linux-user
> >
> > Hey! Thanks for the patches
> >
> > I'm not convinced that we want this though.
> >
> > Right now we are trying to head towards a riscv64-softmmu binary being
> > able to run all RISC-V code. That include 32-bit cpus
> > (qemu-riscv64-softmmu -cpu r32...) and 64-bit CPUs. We shouldn't be
> > splitting out more targets.
> >
> > It also goes against the general idea of RISC-V in that everyone has a
> > standard compliant implementation, they can then add extra
> > functionality.
> >
> > In terms of Kconfig options. It doesn't seem like a bad idea to have
> > an option to fully disable custom CSRs. That way if someone really
> > wants performance and doesn't want custom CSRs they can disable the
> > switch. Otherwise we leave it on and all custom CSRs are available in
> > the build and then controlled by the CPU selection at runtime. If that
> > ends up being too difficult to implement though then we don't have to
> > have it.
> >
> > Thanks again for working on this.
> >
> > Alistair
> >
> >
> > > $ make
> > >
> > > P.S. The pacthes from :
> > > https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00913.html
> > > is needed. A clean-up and modified version will be sent out soon.
> > >
> > > P.P.S.
> > > I know these parts won't be easy to digest, and the further iterations will be
> > > needed, so I didn't ask my colleagues to sign-off for now.
> > >
> > > Cordially yours,
> > > Ruinland ChuanTzu Tsai
> > >
> > > Ruinland ChuanTzu Tsai (2):
> > >   Adding Kconfig options for custom CSR support and Andes CPU model
> > >   Adding necessary files for Andes platforms, cores to enable custom CSR
> > >     support
> > >
> > >  Kconfig                                       |  1 +
> > >  .../devices/riscv32-andes-softmmu.mak         | 17 ++++++++++++
> > >  .../devices/riscv64-andes-softmmu.mak         | 17 ++++++++++++
> > >  .../targets/riscv32-andes-linux-user.mak      |  1 +
> > >  .../targets/riscv32-andes-softmmu.mak         |  1 +
> > >  .../targets/riscv64-andes-linux-user.mak      |  1 +
> > >  .../targets/riscv64-andes-softmmu.mak         |  1 +
> > >  .../targets/rv_custom/no_custom.mak           |  0
> > >  .../rv_custom/riscv32-andes-linux-user.mak    |  1 +
> > >  .../rv_custom/riscv32-andes-softmmu.mak       |  1 +
> > >  .../targets/rv_custom/riscv32-linux-user.mak  |  1 +
> > >  .../targets/rv_custom/riscv32-softmmu.mak     |  1 +
> > >  .../rv_custom/riscv64-andes-linux-user.mak    |  1 +
> > >  .../rv_custom/riscv64-andes-softmmu.mak       |  1 +
> > >  .../targets/rv_custom/riscv64-linux-user.mak  |  1 +
> > >  .../targets/rv_custom/riscv64-softmmu.mak     |  1 +
> > >  meson.build                                   | 26 +++++++++++++++++++
> > >  target/riscv/Kconfig                          |  6 +++++
> > >  18 files changed, 79 insertions(+)
> > >  create mode 100644 default-configs/devices/riscv32-andes-softmmu.mak
> > >  create mode 100644 default-configs/devices/riscv64-andes-softmmu.mak
> > >  create mode 120000 default-configs/targets/riscv32-andes-linux-user.mak
> > >  create mode 120000 default-configs/targets/riscv32-andes-softmmu.mak
> > >  create mode 120000 default-configs/targets/riscv64-andes-linux-user.mak
> > >  create mode 120000 default-configs/targets/riscv64-andes-softmmu.mak
> > >  create mode 100644 default-configs/targets/rv_custom/no_custom.mak
> > >  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
> > >  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
> > >  create mode 120000 default-configs/targets/rv_custom/riscv32-linux-user.mak
> > >  create mode 120000 default-configs/targets/rv_custom/riscv32-softmmu.mak
> > >  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
> > >  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
> > >  create mode 120000 default-configs/targets/rv_custom/riscv64-linux-user.mak
> > >  create mode 120000 default-configs/targets/rv_custom/riscv64-softmmu.mak
> > >  create mode 100644 target/riscv/Kconfig
> > >
> > > --
> > > 2.32.0
> > >

