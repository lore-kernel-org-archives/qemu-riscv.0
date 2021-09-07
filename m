Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNY8Z-0004fJ-Vo
	for mharc-qemu-riscv@gnu.org; Tue, 07 Sep 2021 06:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathakmailbox@gmail.com>)
 id 1mNY8V-0004Yt-FV; Tue, 07 Sep 2021 06:15:27 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:41596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathakmailbox@gmail.com>)
 id 1mNY8P-0005Dh-MF; Tue, 07 Sep 2021 06:15:26 -0400
Received: by mail-il1-x12c.google.com with SMTP id l10so9400528ilh.8;
 Tue, 07 Sep 2021 03:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=epCtH3nBky/XQSm39g1QeOUYAEd2Q0eiAte09ycHg4I=;
 b=ggIpXdVM8NsZdpPCHfd86YviF2rpC3919vXWELGceByAekE0bcO48Kal+iz5xfyXl0
 5KDHPdW6kvO9US83sfQoUy7yGPNmMXelImUtvXyYih2EYmsUxz0eNIk5GmxxThH6vUxr
 rl7XOGLqitEh0LSguhv7/M8a8O9bduQCWn+IicwE7OgXzaKN0FJB3ww7f/lBmRVN27jz
 svoXix7elPmWG105ui98pK0+nhA0n2MthEy+mFz0UfNZI0viLs+BKhIoqH7NMDmV+DRx
 UWIUvnQ2q1T9CR3qfrNx0AX381VtFhtBB7Q1z1JKJFrMA9bcdbPpS3kaartOOjBr0QYN
 hC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=epCtH3nBky/XQSm39g1QeOUYAEd2Q0eiAte09ycHg4I=;
 b=Q532v25qZcgV6ElXpBjoRf+wobDi2kLMgqpEeF5HSpgX3D0unK5RJ3W69BX+4qVyxc
 8RUpyfrv4MAxjTlANgOr1lGgfE9hiMxVNLdAg5gX4VqMaMt/pS6/wYb/yCePDpv7pdng
 EeuLTyYmnz0JBBk5lvXVQVVQbs7+bp3bikOK16jO5Ym3951S7h1ETRhm6xiRwVEzT+kI
 XmNTNECJnzNQDIVjiTP3zObw/7Krv87a+m8e1AWD0tIkDVg2KG8iB90NGRsOoXkp32U8
 HAk1HqRiEy9ZhqgoAU6dAZ0eRa5MPSh3cBGiHW/VkEawaoePvqCZeZBRmdmhTJYIamHB
 /qqA==
X-Gm-Message-State: AOAM530X7isAnWecr1CyZSVi7b0vKid2uiF93VwyFhHk+iUnUd2mS9AW
 r/+Joh45M+x88tsp0y89ft4YWEY5wuFzUrSaVS8=
X-Google-Smtp-Source: ABdhPJwn0h1HA83mScAAIa4vnV6GJEXT1OU2uf/YiC7V3SU6ZnSvuV+7frEMuCDrX/Sx9hMEDTdGn5blAQE0OSgHCyw=
X-Received: by 2002:a05:6e02:6ca:: with SMTP id
 p10mr11528228ils.269.1631009719890; 
 Tue, 07 Sep 2021 03:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210826151332.32753-1-ruinland@andestech.com>
 <CAKmqyKPY=Q61x7gf_0S1-B66VMpZCFx1r5ENJG0J5FNX6NLz0w@mail.gmail.com>
 <YTW6ADQMBcs5csXv@ruinland-x1c>
 <CAKmqyKPu9MK0KRycXzcnb=pH_OjB1mCKzw8uhb2vSZAwxraAfg@mail.gmail.com>
 <YTXFGWBhpJ3gdxxb@ruinland-x1c>
 <CAKmqyKM2erOYCOqbT7rKmbQig5HC2Q_3hk2xHBDMbFG9ipx06A@mail.gmail.com>
 <YTcdJBgP5PY+56wU@ruinland-x1c>
In-Reply-To: <YTcdJBgP5PY+56wU@ruinland-x1c>
From: Rahul Pathak <rpathakmailbox@gmail.com>
Date: Tue, 7 Sep 2021 15:45:08 +0530
Message-ID: <CAMSwOgoDU+jNL4hqmhW-C2foH7m5CTG21J+hdijJ_=G0018wJQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] riscv: Adding custom CSR related Kconfig options
To: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Cc: Alistair Francis <alistair23@gmail.com>, guoren@linux.alibaba.com, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 Dylan Jhong <dylan@andestech.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 ycliang@andestech.com
Content-Type: multipart/alternative; boundary="000000000000fab80205cb650aa3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=rpathakmailbox@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 07 Sep 2021 10:15:27 -0000

--000000000000fab80205cb650aa3
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

One clarification: The unification of architectures is also going to allow
multi-arch CPUs (RV32/RV64) in a single machine instance? Or it's just
limited to only one in the runtime.

Rahul

On Tue, Sep 7, 2021 at 1:37 PM Ruinland ChuanTzu Tsai <
ruinland@andestech.com> wrote:

> Hi Alistair,
>
> Thanks for the comment.
>
> On Mon, Sep 06, 2021 at 05:55:25PM +1000, Alistair Francis wrote:
> > On Mon, Sep 6, 2021 at 5:37 PM Ruinland ChuanTzu Tsai
> > <ruinland@andestech.com> wrote:
> > >
> > > Hi Alistair,
> > >
> > > So glad to hear from you.
> > >
> > > On Mon, Sep 06, 2021 at 05:05:16PM +1000, Alistair Francis wrote:
> > > > On Mon, Sep 6, 2021 at 4:49 PM Ruinland ChuanTzu Tsai
> > > > <ruinland@andestech.com> wrote:
> > > > >
> > > > >
> > > > > Hi Alistair,
> > > > >
> > > > > Thanks for the heads up about the upcoming unification of RISC-V
> 32/64 targets.
> > > > > Yet I have several concerns and would like to have some
> brainstorming regarding
> > > > > such topics - -
> > > >
> > > > No worries, I'm happy to discuss.
> > > >
> > > > >
> > > > > That is, could you elaborate more about the "runtime check/switch"
> which you
> > > > > mentioned in the previous e-mail :
> > > > >
> https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg02154.html
> > > > > I'm not quite following the context.
> > > >
> > > > Yep, so something along the lines of this in `riscv_csrrw()`
> > > >
> > > > if (cpu == "MyCustomCPU") {
> > > >     my_custom_csr[csrno].read();
> > > > }
> > > >
> > > > So we check if using the CPU then apply extra CSR accesses.
> > > >
> > > > > If we don't have a way to toggle which (vendor) cores, which will
> be used,
> > > > > during compile time, it means that we have to build all the vendor
> code and
> > > > > link them all together; and we might have the chance to encounter
> collision on
> > > > > csrno between different vendors.
> > > >
> > > > I don't see how they will collide as we will only act on 1, based on
> > > > the CPU we are using.
> > >
> > > AFAIK, we need to put CSR number into `target/riscv/cpu_bits.h`, and
> they are
> > > exposed to the global and let others to use it. With my current
> design, which I
> > > have sent out by RFC patch series v3, I introduced an abstraction
> layer,
> > > `custom_cpu_bits.h`, which will toggle diffenet set of custom CSR
> number.
> > >
> > > If we teardown the Kconfig, all symbols will be exposed and then it
> could have
> > > a high chance to collide with each other.
> >
> > I guess this depends on what you are trying to do.
> >
> > We could have non public CSRs. So each CPU could have it's own custom
> > version of `riscv_csr_operations csr_ops[CSR_TABLE_SIZE]` which is in
> > it's own C file. We then just add a switch case to CSR accesses and if
> > using CPU "customcpu" then we check the `custom_cpu_csr_ops` table.
> > NOTE: That we can do something smarter than a switch, but you get the
> > point. We can implement a read/write function for every element in the
> > array, with the default just triggering an illegal instruction.
>
> One thing I would like to discuss here.
>
> Firstly, I'm not quite sure how the picture of non-public CSR looks like.
> Is it suggested that non-standard CSR number shall not be exposed ?
>
> I know that we should focus on custom CSR part, yet I need to make sure
> that if following logic is permitted to appear in
> `target/riscv/trans_insn` :
>
> trans_vendor_A_insn_blah(...) {
>     riscv_csrrw(env, CSR_VENDOR_A_CUSTOM, r, n, write_mask);
>     }
>
> As far as I know, csr number is not presented as a C++ enum, which we
> can access via csr::custom::vendora::foobar, so it's a globally exposed
> macro with possiblilty of collision.
>
> IMHO, the key is that are we permitted to have a uniform interface to
> access
> CSR, either standard or vendor designed ones, in other parts of QEMU.
>
>
> > I guess that assumes that each CSR access is self contained. For
> > example if changing a custom CSR changes a core part of the
> > target/riscv code this won't really work.
> >
> > On the other hand I'm not convinced we want vendor changes to affect
> > the core target/riscv code. Ideally all vendor code can be kept in
> > it's own file and it's fully self contained. That won't work for
> > everything, but it should work for enough use cases. We can even have
> > a custom vendor state that the vendor code can use (it can also change
> > the CPU state).
> >
> > Does that make sense?
>
> In general, I agree with the point that vendor code should be
> self-contained.
> Yet I have doubts that with the current design of CPU model, are we able to
> unify the targets and in the meanwhile to keep things tight and neat ?
>
> The execution flow will be bonded to have a shared instruction decoder/
> translator and a shared handler for CSR (i.e. riscv_csrrw). It's not like
> we
> get to choose what decoder we want to use or which CSR table we will be
> using at xxx_cpu_init(). If we choose to use runtime check/diversion of
> all of
> these parts, the overhead might be tremendous.
>
> Surely we should be focusing on CSR part for now, and just as you said, CSR
> is not that perforamnce-centric.
>
> Yet if we take a look at `configs/targets`, still we're having 6 MIPS32/64
> linux-user targets, 4 ARM32/64 linux-user targets and 4 PPC32/64 linux-user
> targets.
>
> I guess it will be a very long journey to merge all the variants.
>
> >
> > >
> > > >
> > > > >
> > > > > Secondly, I'm not quite sure about how we're going to merge decode
> tree files
> > > > > across RV32 and RV64. Vendor-designed custom instruction would
> have a different
> > > > > encoding scheme on bitfields for RV32 and RV64. Currently, we
> (Andes) are using
> > > > > different decodetree sources for gen32 and gen64 in
> `target/riscv/meson.build`.
> > > >
> > > > Ok, so custom instructions are a whole different problem. I think we
> > > > should leave that for now and focus on CSRs.
> > > >
> > > > A quick look though and I suspect we could do a similar CPU check in
> > > > decode_opc(). Dealing with the decodetree will be problematic though.
> > > >
> > > > > I'm preparing the patch to demonstrate such hiccups.
> > > > >
> > > > > As far as I know, there's no control flow logic for decodetree to
> parse
> > > > > decodetree files differently. (e.g. ifdef XLEN == 32 then blah,
> blah).
> > > > >
> > > > > To meet in the halfway, maybe after the grand unification on
> RV32/64, we can
> > > > > still confine vendor custom logic (i.e. instrucions and CSRs) to
> be toggled by
> > > > > whether a certain vendor cpu model is selected ?
> > > >wtih  the d
> > > > I honestly don't see a scenario where that happens. The maintenance
> > > > overhead and confusion of changing the CPUs at build time is too
> high.
> > > >
> > > > I also don't think we should need that for CSR accesses. Custom
> > > > instructions are a whole different can of worms.
> > >
> > > IMHO, custom CSR and custom instructions are two sides of a same coin
> in some
> > > way. Let me explain it with an example - -
> > >
> > > Andes has a custom instruction called `EXEC.IT`, which is a 16-bit
> long com-
> > > pressed instruction. By executing such instrcution, an instruction
> table
> > > reside in a particular address specified by a custom CSR called uitb
> will be
> > > fetch, decode and execute. By doing so, the code size could be reduced.
> >
> > Hmmm... This is a much more complex use case than I was expecting. I
> > have been thinking more about custom CSRs to set a timer or control
> > the interrupt controller.
> >
> > Something like what you described is going to be a lot more work.
> >
> > In your case though I think we can still focus on the CSR aspect
> > first. Once that is sorted we can then look at the instruction part.
>
> Just like the mentioned question above , I'm wondering if we can assume
> riscv_csrrw() to be a general interface for accessing all the CSRs ?
>
> Cordially yours,
> Ruinland ChuanTzu Tsai
>
> > The main aim should be that all (or almost all) vendor code lives in
> > it's own file.
> >
> > Alistair
> >
> > >
> > > The problem is that we have different address encoding on RV32 and
> RV64.
> > >
> > > And just like you mentioned, in our in-house core, we apply the same
> logic on
> > > decode_opc() to decode custom instructions first. If such
> decoding/trans
> > > procedure fails, the original decoder will be invoked.
> > >
> > > >
> > > > >
> > > > > By the way, I'm wondering how our friends from T-Head (Guo Ren ?)
> regard this
> > > > > issue ? AFAIK, they forked QEMU from v3.2.0 and applied their
> vendor features
> > > > > on top of it for quite a while.
> > > >
> > > > I'm not sure.
> > >
> > > Sorry for the confusion, I was trying to ping Guo Ren :-D
> > > I CC'ed him in the previous e-mail.
> > >
> > > Cordially yours,
> > > Ruinland ChuanTzu Tsai
> > >
> > > >
> > > > Alistair
> > > >
> > > > >
> > > > > Cordially yours,
> > > > > Ruinland ChuanTzu Tsai
> > > > >
> > > > > On Thu, Sep 02, 2021 at 12:25:20PM +1000, Alistair Francis wrote:
> > > > > > On Fri, Aug 27, 2021 at 1:16 AM Ruinland Chuan-Tzu Tsai
> > > > > > <ruinland@andestech.com> wrote:
> > > > > > >
> > > > > > > From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > > > > > >
> > > > > > > During my modification on my previous patch series for custom
> CSR support, I
> > > > > > > believe this issue deserves its own discussion (or debate)
> because it's _not_
> > > > > > > as simple as "just put those options in Kconfig".
> > > > > > >
> > > > > > > The obstables I've encountered and the kluges I came up is
> listed as follow :
> > > > > > >
> > > > > > > (1) Due to the design of top-level meson.build, all Kconfig
> options will land
> > > > > > > into `*-config-devices.h` since minikconf will be only used
> after config_target
> > > > > > > being processed. This will let to the fact that linux-users
> won't be able to
> > > > > > > use custom CSR code properly becuase they only includes
> `*-config-devices.h`.
> > > > > > > And that is reasonble due to the fact that changes on cpu.c
> and csr.c is a
> > > > > > > target-related matter and linux-user mode shouldn't include
> device related
> > > > > > > headers in most of cases.
> > > > > > >
> > > > > > > So, modify meson.build to parse target/riscv/Kconfig during
> config_target phase
> > > > > > > is without doubts necessary.
> > > > > > >
> > > > > > > (2) Kconfig option `RISCV_CUSTOM_CSR` is introduced for RISC-V
> cpu models to
> > > > > > > toggle it at its will. Yet due to the fact that csr.o and
> cpu.o are linked
> > > > > > > altogether for all CPU models, the suffer will be shared
> without option.
> > > > > > > The only reasonable way to seperate build the fire lane which
> seperates vendor
> > > > > > > flavored cpu and spec-conformed ones, is to build them
> seperately with options
> > > > > > > toggled diffrently, just like RV32 and RV64 shares almost the
> same source base,
> > > > > > > yet the sources are compiled with differnt flags/definitions.
> > > > > > >
> > > > > > > To achieve that, miraculously, we can just put *.mak files
> into `target`
> > > > > > > directoy, because that's how `configure` enumerates what
> targets are supported.
> > > > > > >
> > > > > > > (3) The longest days are not over yet, if we take a good look
> at how the minikconf
> > > > > > > is invoked during config_devices and in what way *.mak
> presented its options
> > > > > > > inside `default-configs/devices`, we can see that *.mak files
> there is formated
> > > > > > > in `CONFIG_*` style and the minikconf is reading directly
> during config_device
> > > > > > > phase. That's totally different from *.mak files presented in
> > > > > > > `default-configs/targets`. To make the parsing logic
> consistent, I
> > > > > > > introduce a rv_custom directory inside which contains
> minikconf-parsable
> > > > > > > mak files.
> > > > > > >
> > > > > > > With this patches, ones can build a A25/AX25 linux-user
> platform by :
> > > > > > > $ ./configure
> --target-list=riscv64-andes-linux-user,riscv32-andes-linux-user
> > > > > >
> > > > > > Hey! Thanks for the patches
> > > > > >
> > > > > > I'm not convinced that we want this though.
> > > > > >
> > > > > > Right now we are trying to head towards a riscv64-softmmu binary
> being
> > > > > > able to run all RISC-V code. That include 32-bit cpus
> > > > > > (qemu-riscv64-softmmu -cpu r32...) and 64-bit CPUs. We shouldn't
> be
> > > > > > splitting out more targets.
> > > > > >
> > > > > > It also goes against the general idea of RISC-V in that everyone
> has a
> > > > > > standard compliant implementation, they can then add extra
> > > > > > functionality.
> > > > > >
> > > > > > In terms of Kconfig options. It doesn't seem like a bad idea to
> have
> > > > > > an option to fully disable custom CSRs. That way if someone
> really
> > > > > > wants performance and doesn't want custom CSRs they can disable
> the
> > > > > > switch. Otherwise we leave it on and all custom CSRs are
> available in
> > > > > > the build and then controlled by the CPU selection at runtime.
> If that
> > > > > > ends up being too difficult to implement though then we don't
> have to
> > > > > > have it.
> > > > > >
> > > > > > Thanks again for working on this.
> > > > > >
> > > > > > Alistair
> > > > > >
> > > > > >
> > > > > > > $ make
> > > > > > >
> > > > > > > P.S. The pacthes from :
> > > > > > >
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00913.html
> > > > > > > is needed. A clean-up and modified version will be sent out
> soon.
> > > > > > >
> > > > > > > P.P.S.
> > > > > > > I know these parts won't be easy to digest, and the further
> iterations will be
> > > > > > > needed, so I didn't ask my colleagues to sign-off for now.
> > > > > > >
> > > > > > > Cordially yours,
> > > > > > > Ruinland ChuanTzu Tsai
> > > > > > >
> > > > > > > Ruinland ChuanTzu Tsai (2):
> > > > > > >   Adding Kconfig options for custom CSR support and Andes CPU
> model
> > > > > > >   Adding necessary files for Andes platforms, cores to enable
> custom CSR
> > > > > > >     support
> > > > > > >
> > > > > > >  Kconfig                                       |  1 +
> > > > > > >  .../devices/riscv32-andes-softmmu.mak         | 17
> ++++++++++++
> > > > > > >  .../devices/riscv64-andes-softmmu.mak         | 17
> ++++++++++++
> > > > > > >  .../targets/riscv32-andes-linux-user.mak      |  1 +
> > > > > > >  .../targets/riscv32-andes-softmmu.mak         |  1 +
> > > > > > >  .../targets/riscv64-andes-linux-user.mak      |  1 +
> > > > > > >  .../targets/riscv64-andes-softmmu.mak         |  1 +
> > > > > > >  .../targets/rv_custom/no_custom.mak           |  0
> > > > > > >  .../rv_custom/riscv32-andes-linux-user.mak    |  1 +
> > > > > > >  .../rv_custom/riscv32-andes-softmmu.mak       |  1 +
> > > > > > >  .../targets/rv_custom/riscv32-linux-user.mak  |  1 +
> > > > > > >  .../targets/rv_custom/riscv32-softmmu.mak     |  1 +
> > > > > > >  .../rv_custom/riscv64-andes-linux-user.mak    |  1 +
> > > > > > >  .../rv_custom/riscv64-andes-softmmu.mak       |  1 +
> > > > > > >  .../targets/rv_custom/riscv64-linux-user.mak  |  1 +
> > > > > > >  .../targets/rv_custom/riscv64-softmmu.mak     |  1 +
> > > > > > >  meson.build                                   | 26
> +++++++++++++++++++
> > > > > > >  target/riscv/Kconfig                          |  6 +++++
> > > > > > >  18 files changed, 79 insertions(+)
> > > > > > >  create mode 100644
> default-configs/devices/riscv32-andes-softmmu.mak
> > > > > > >  create mode 100644
> default-configs/devices/riscv64-andes-softmmu.mak
> > > > > > >  create mode 120000
> default-configs/targets/riscv32-andes-linux-user.mak
> > > > > > >  create mode 120000
> default-configs/targets/riscv32-andes-softmmu.mak
> > > > > > >  create mode 120000
> default-configs/targets/riscv64-andes-linux-user.mak
> > > > > > >  create mode 120000
> default-configs/targets/riscv64-andes-softmmu.mak
> > > > > > >  create mode 100644
> default-configs/targets/rv_custom/no_custom.mak
> > > > > > >  create mode 100644
> default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
> > > > > > >  create mode 100644
> default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
> > > > > > >  create mode 120000
> default-configs/targets/rv_custom/riscv32-linux-user.mak
> > > > > > >  create mode 120000
> default-configs/targets/rv_custom/riscv32-softmmu.mak
> > > > > > >  create mode 100644
> default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
> > > > > > >  create mode 100644
> default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
> > > > > > >  create mode 120000
> default-configs/targets/rv_custom/riscv64-linux-user.mak
> > > > > > >  create mode 120000
> default-configs/targets/rv_custom/riscv64-softmmu.mak
> > > > > > >  create mode 100644 target/riscv/Kconfig
> > > > > > >
> > > > > > > --
> > > > > > > 2.32.0
> > > > > > >
>
>

--000000000000fab80205cb650aa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<div><br></div><div>One clarification: The uni=
fication of architectures is also going to allow multi-arch CPUs (RV32/RV64=
) in a single machine instance? Or it&#39;s just limited to only one in the=
 runtime.</div><div><br></div><div>Rahul</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 7, 2021 at 1:37 P=
M Ruinland ChuanTzu Tsai &lt;<a href=3D"mailto:ruinland@andestech.com">ruin=
land@andestech.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi Alistair,<br>
<br>
Thanks for the comment.<br>
<br>
On Mon, Sep 06, 2021 at 05:55:25PM +1000, Alistair Francis wrote:<br>
&gt; On Mon, Sep 6, 2021 at 5:37 PM Ruinland ChuanTzu Tsai<br>
&gt; &lt;<a href=3D"mailto:ruinland@andestech.com" target=3D"_blank">ruinla=
nd@andestech.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Alistair,<br>
&gt; &gt;<br>
&gt; &gt; So glad to hear from you.<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Sep 06, 2021 at 05:05:16PM +1000, Alistair Francis wrote:=
<br>
&gt; &gt; &gt; On Mon, Sep 6, 2021 at 4:49 PM Ruinland ChuanTzu Tsai<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:ruinland@andestech.com" target=3D"_bla=
nk">ruinland@andestech.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Alistair,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks for the heads up about the upcoming unification =
of RISC-V 32/64 targets.<br>
&gt; &gt; &gt; &gt; Yet I have several concerns and would like to have some=
 brainstorming regarding<br>
&gt; &gt; &gt; &gt; such topics - -<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; No worries, I&#39;m happy to discuss.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; That is, could you elaborate more about the &quot;runti=
me check/switch&quot; which you<br>
&gt; &gt; &gt; &gt; mentioned in the previous e-mail :<br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.nongnu.org/archive/html/qemu-d=
evel/2021-08/msg02154.html" rel=3D"noreferrer" target=3D"_blank">https://li=
sts.nongnu.org/archive/html/qemu-devel/2021-08/msg02154.html</a><br>
&gt; &gt; &gt; &gt; I&#39;m not quite following the context.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yep, so something along the lines of this in `riscv_csrrw()`=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; if (cpu =3D=3D &quot;MyCustomCPU&quot;) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0my_custom_csr[csrno].read();<br>
&gt; &gt; &gt; }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So we check if using the CPU then apply extra CSR accesses.<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; If we don&#39;t have a way to toggle which (vendor) cor=
es, which will be used,<br>
&gt; &gt; &gt; &gt; during compile time, it means that we have to build all=
 the vendor code and<br>
&gt; &gt; &gt; &gt; link them all together; and we might have the chance to=
 encounter collision on<br>
&gt; &gt; &gt; &gt; csrno between different vendors.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t see how they will collide as we will only act on=
 1, based on<br>
&gt; &gt; &gt; the CPU we are using.<br>
&gt; &gt;<br>
&gt; &gt; AFAIK, we need to put CSR number into `target/riscv/cpu_bits.h`, =
and they are<br>
&gt; &gt; exposed to the global and let others to use it. With my current d=
esign, which I<br>
&gt; &gt; have sent out by RFC patch series v3, I introduced an abstraction=
 layer,<br>
&gt; &gt; `custom_cpu_bits.h`, which will toggle diffenet set of custom CSR=
 number.<br>
&gt; &gt;<br>
&gt; &gt; If we teardown the Kconfig, all symbols will be exposed and then =
it could have<br>
&gt; &gt; a high chance to collide with each other.<br>
&gt; <br>
&gt; I guess this depends on what you are trying to do.<br>
&gt; <br>
&gt; We could have non public CSRs. So each CPU could have it&#39;s own cus=
tom<br>
&gt; version of `riscv_csr_operations csr_ops[CSR_TABLE_SIZE]` which is in<=
br>
&gt; it&#39;s own C file. We then just add a switch case to CSR accesses an=
d if<br>
&gt; using CPU &quot;customcpu&quot; then we check the `custom_cpu_csr_ops`=
 table.<br>
&gt; NOTE: That we can do something smarter than a switch, but you get the<=
br>
&gt; point. We can implement a read/write function for every element in the=
<br>
&gt; array, with the default just triggering an illegal instruction.<br>
<br>
One thing I would like to discuss here.<br>
<br>
Firstly, I&#39;m not quite sure how the picture of non-public CSR looks lik=
e.<br>
Is it suggested that non-standard CSR number shall not be exposed ?<br>
<br>
I know that we should focus on custom CSR part, yet I need to make sure<br>
that if following logic is permitted to appear in `target/riscv/trans_insn`=
 :<br>
<br>
trans_vendor_A_insn_blah(...) {<br>
=C2=A0 =C2=A0 riscv_csrrw(env, CSR_VENDOR_A_CUSTOM, r, n, write_mask);<br>
=C2=A0 =C2=A0 }<br>
<br>
As far as I know, csr number is not presented as a C++ enum, which we<br>
can access via csr::custom::vendora::foobar, so it&#39;s a globally exposed=
<br>
macro with possiblilty of collision.<br>
<br>
IMHO, the key is that are we permitted to have a uniform interface to acces=
s<br>
CSR, either standard or vendor designed ones, in other parts of QEMU.<br>
<br>
<br>
&gt; I guess that assumes that each CSR access is self contained. For<br>
&gt; example if changing a custom CSR changes a core part of the<br>
&gt; target/riscv code this won&#39;t really work.<br>
&gt; <br>
&gt; On the other hand I&#39;m not convinced we want vendor changes to affe=
ct<br>
&gt; the core target/riscv code. Ideally all vendor code can be kept in<br>
&gt; it&#39;s own file and it&#39;s fully self contained. That won&#39;t wo=
rk for<br>
&gt; everything, but it should work for enough use cases. We can even have<=
br>
&gt; a custom vendor state that the vendor code can use (it can also change=
<br>
&gt; the CPU state).<br>
&gt; <br>
&gt; Does that make sense?<br>
<br>
In general, I agree with the point that vendor code should be self-containe=
d.<br>
Yet I have doubts that with the current design of CPU model, are we able to=
<br>
unify the targets and in the meanwhile to keep things tight and neat ?<br>
<br>
The execution flow will be bonded to have a shared instruction decoder/<br>
translator and a shared handler for CSR (i.e. riscv_csrrw). It&#39;s not li=
ke we<br>
get to choose what decoder we want to use or which CSR table we will be<br>
using at xxx_cpu_init(). If we choose to use runtime check/diversion of all=
 of<br>
these parts, the overhead might be tremendous. <br>
<br>
Surely we should be focusing on CSR part for now, and just as you said, CSR=
<br>
is not that perforamnce-centric.<br>
<br>
Yet if we take a look at `configs/targets`, still we&#39;re having 6 MIPS32=
/64<br>
linux-user targets, 4 ARM32/64 linux-user targets and 4 PPC32/64 linux-user=
<br>
targets.<br>
<br>
I guess it will be a very long journey to merge all the variants.<br>
<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Secondly, I&#39;m not quite sure about how we&#39;re go=
ing to merge decode tree files<br>
&gt; &gt; &gt; &gt; across RV32 and RV64. Vendor-designed custom instructio=
n would have a different<br>
&gt; &gt; &gt; &gt; encoding scheme on bitfields for RV32 and RV64. Current=
ly, we (Andes) are using<br>
&gt; &gt; &gt; &gt; different decodetree sources for gen32 and gen64 in `ta=
rget/riscv/meson.build`.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Ok, so custom instructions are a whole different problem. I =
think we<br>
&gt; &gt; &gt; should leave that for now and focus on CSRs.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; A quick look though and I suspect we could do a similar CPU =
check in<br>
&gt; &gt; &gt; decode_opc(). Dealing with the decodetree will be problemati=
c though.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I&#39;m preparing the patch to demonstrate such hiccups=
.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; As far as I know, there&#39;s no control flow logic for=
 decodetree to parse<br>
&gt; &gt; &gt; &gt; decodetree files differently. (e.g. ifdef XLEN =3D=3D 3=
2 then blah, blah).<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; To meet in the halfway, maybe after the grand unificati=
on on RV32/64, we can<br>
&gt; &gt; &gt; &gt; still confine vendor custom logic (i.e. instrucions and=
 CSRs) to be toggled by<br>
&gt; &gt; &gt; &gt; whether a certain vendor cpu model is selected ?<br>
&gt; &gt; &gt;wtih=C2=A0 the d<br>
&gt; &gt; &gt; I honestly don&#39;t see a scenario where that happens. The =
maintenance<br>
&gt; &gt; &gt; overhead and confusion of changing the CPUs at build time is=
 too high.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I also don&#39;t think we should need that for CSR accesses.=
 Custom<br>
&gt; &gt; &gt; instructions are a whole different can of worms.<br>
&gt; &gt;<br>
&gt; &gt; IMHO, custom CSR and custom instructions are two sides of a same =
coin in some<br>
&gt; &gt; way. Let me explain it with an example - -<br>
&gt; &gt;<br>
&gt; &gt; Andes has a custom instruction called `<a href=3D"http://EXEC.IT"=
 rel=3D"noreferrer" target=3D"_blank">EXEC.IT</a>`, which is a 16-bit long =
com-<br>
&gt; &gt; pressed instruction. By executing such instrcution, an instructio=
n table<br>
&gt; &gt; reside in a particular address specified by a custom CSR called u=
itb will be<br>
&gt; &gt; fetch, decode and execute. By doing so, the code size could be re=
duced.<br>
&gt; <br>
&gt; Hmmm... This is a much more complex use case than I was expecting. I<b=
r>
&gt; have been thinking more about custom CSRs to set a timer or control<br=
>
&gt; the interrupt controller.<br>
&gt; <br>
&gt; Something like what you described is going to be a lot more work.<br>
&gt; <br>
&gt; In your case though I think we can still focus on the CSR aspect<br>
&gt; first. Once that is sorted we can then look at the instruction part.<b=
r>
<br>
Just like the mentioned question above , I&#39;m wondering if we can assume=
<br>
riscv_csrrw() to be a general interface for accessing all the CSRs ?<br>
<br>
Cordially yours,<br>
Ruinland ChuanTzu Tsai<br>
<br>
&gt; The main aim should be that all (or almost all) vendor code lives in<b=
r>
&gt; it&#39;s own file.<br>
&gt; <br>
&gt; Alistair<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; The problem is that we have different address encoding on RV32 an=
d RV64.<br>
&gt; &gt;<br>
&gt; &gt; And just like you mentioned, in our in-house core, we apply the s=
ame logic on<br>
&gt; &gt; decode_opc() to decode custom instructions first. If such decodin=
g/trans<br>
&gt; &gt; procedure fails, the original decoder will be invoked.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; By the way, I&#39;m wondering how our friends from T-He=
ad (Guo Ren ?) regard this<br>
&gt; &gt; &gt; &gt; issue ? AFAIK, they forked QEMU from v3.2.0 and applied=
 their vendor features<br>
&gt; &gt; &gt; &gt; on top of it for quite a while.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m not sure.<br>
&gt; &gt;<br>
&gt; &gt; Sorry for the confusion, I was trying to ping Guo Ren :-D<br>
&gt; &gt; I CC&#39;ed him in the previous e-mail.<br>
&gt; &gt;<br>
&gt; &gt; Cordially yours,<br>
&gt; &gt; Ruinland ChuanTzu Tsai<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Alistair<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Cordially yours,<br>
&gt; &gt; &gt; &gt; Ruinland ChuanTzu Tsai<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Sep 02, 2021 at 12:25:20PM +1000, Alistair Fran=
cis wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Fri, Aug 27, 2021 at 1:16 AM Ruinland Chuan-Tzu=
 Tsai<br>
&gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:ruinland@andestech.com" targ=
et=3D"_blank">ruinland@andestech.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; From: Ruinland ChuanTzu Tsai &lt;<a href=3D"m=
ailto:ruinland@andestech.com" target=3D"_blank">ruinland@andestech.com</a>&=
gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; During my modification on my previous patch s=
eries for custom CSR support, I<br>
&gt; &gt; &gt; &gt; &gt; &gt; believe this issue deserves its own discussio=
n (or debate) because it&#39;s _not_<br>
&gt; &gt; &gt; &gt; &gt; &gt; as simple as &quot;just put those options in =
Kconfig&quot;.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; The obstables I&#39;ve encountered and the kl=
uges I came up is listed as follow :<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; (1) Due to the design of top-level meson.buil=
d, all Kconfig options will land<br>
&gt; &gt; &gt; &gt; &gt; &gt; into `*-config-devices.h` since minikconf wil=
l be only used after config_target<br>
&gt; &gt; &gt; &gt; &gt; &gt; being processed. This will let to the fact th=
at linux-users won&#39;t be able to<br>
&gt; &gt; &gt; &gt; &gt; &gt; use custom CSR code properly becuase they onl=
y includes `*-config-devices.h`.<br>
&gt; &gt; &gt; &gt; &gt; &gt; And that is reasonble due to the fact that ch=
anges on cpu.c and csr.c is a<br>
&gt; &gt; &gt; &gt; &gt; &gt; target-related matter and linux-user mode sho=
uldn&#39;t include device related<br>
&gt; &gt; &gt; &gt; &gt; &gt; headers in most of cases.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; So, modify meson.build to parse target/riscv/=
Kconfig during config_target phase<br>
&gt; &gt; &gt; &gt; &gt; &gt; is without doubts necessary.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; (2) Kconfig option `RISCV_CUSTOM_CSR` is intr=
oduced for RISC-V cpu models to<br>
&gt; &gt; &gt; &gt; &gt; &gt; toggle it at its will. Yet due to the fact th=
at csr.o and cpu.o are linked<br>
&gt; &gt; &gt; &gt; &gt; &gt; altogether for all CPU models, the suffer wil=
l be shared without option.<br>
&gt; &gt; &gt; &gt; &gt; &gt; The only reasonable way to seperate build the=
 fire lane which seperates vendor<br>
&gt; &gt; &gt; &gt; &gt; &gt; flavored cpu and spec-conformed ones, is to b=
uild them seperately with options<br>
&gt; &gt; &gt; &gt; &gt; &gt; toggled diffrently, just like RV32 and RV64 s=
hares almost the same source base,<br>
&gt; &gt; &gt; &gt; &gt; &gt; yet the sources are compiled with differnt fl=
ags/definitions.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; To achieve that, miraculously, we can just pu=
t *.mak files into `target`<br>
&gt; &gt; &gt; &gt; &gt; &gt; directoy, because that&#39;s how `configure` =
enumerates what targets are supported.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; (3) The longest days are not over yet, if we =
take a good look at how the minikconf<br>
&gt; &gt; &gt; &gt; &gt; &gt; is invoked during config_devices and in what =
way *.mak presented its options<br>
&gt; &gt; &gt; &gt; &gt; &gt; inside `default-configs/devices`, we can see =
that *.mak files there is formated<br>
&gt; &gt; &gt; &gt; &gt; &gt; in `CONFIG_*` style and the minikconf is read=
ing directly during config_device<br>
&gt; &gt; &gt; &gt; &gt; &gt; phase. That&#39;s totally different from *.ma=
k files presented in<br>
&gt; &gt; &gt; &gt; &gt; &gt; `default-configs/targets`. To make the parsin=
g logic consistent, I<br>
&gt; &gt; &gt; &gt; &gt; &gt; introduce a rv_custom directory inside which =
contains minikconf-parsable<br>
&gt; &gt; &gt; &gt; &gt; &gt; mak files.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; With this patches, ones can build a A25/AX25 =
linux-user platform by :<br>
&gt; &gt; &gt; &gt; &gt; &gt; $ ./configure --target-list=3Driscv64-andes-l=
inux-user,riscv32-andes-linux-user<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Hey! Thanks for the patches<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I&#39;m not convinced that we want this though.<br=
>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Right now we are trying to head towards a riscv64-=
softmmu binary being<br>
&gt; &gt; &gt; &gt; &gt; able to run all RISC-V code. That include 32-bit c=
pus<br>
&gt; &gt; &gt; &gt; &gt; (qemu-riscv64-softmmu -cpu r32...) and 64-bit CPUs=
. We shouldn&#39;t be<br>
&gt; &gt; &gt; &gt; &gt; splitting out more targets.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; It also goes against the general idea of RISC-V in=
 that everyone has a<br>
&gt; &gt; &gt; &gt; &gt; standard compliant implementation, they can then a=
dd extra<br>
&gt; &gt; &gt; &gt; &gt; functionality.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; In terms of Kconfig options. It doesn&#39;t seem l=
ike a bad idea to have<br>
&gt; &gt; &gt; &gt; &gt; an option to fully disable custom CSRs. That way i=
f someone really<br>
&gt; &gt; &gt; &gt; &gt; wants performance and doesn&#39;t want custom CSRs=
 they can disable the<br>
&gt; &gt; &gt; &gt; &gt; switch. Otherwise we leave it on and all custom CS=
Rs are available in<br>
&gt; &gt; &gt; &gt; &gt; the build and then controlled by the CPU selection=
 at runtime. If that<br>
&gt; &gt; &gt; &gt; &gt; ends up being too difficult to implement though th=
en we don&#39;t have to<br>
&gt; &gt; &gt; &gt; &gt; have it.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Thanks again for working on this.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Alistair<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; $ make<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; P.S. The pacthes from :<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.gnu.org/archive/html=
/qemu-devel/2021-08/msg00913.html" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00913.html</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; is needed. A clean-up and modified version wi=
ll be sent out soon.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; P.P.S.<br>
&gt; &gt; &gt; &gt; &gt; &gt; I know these parts won&#39;t be easy to diges=
t, and the further iterations will be<br>
&gt; &gt; &gt; &gt; &gt; &gt; needed, so I didn&#39;t ask my colleagues to =
sign-off for now.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cordially yours,<br>
&gt; &gt; &gt; &gt; &gt; &gt; Ruinland ChuanTzu Tsai<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Ruinland ChuanTzu Tsai (2):<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0Adding Kconfig options for custom=
 CSR support and Andes CPU model<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0Adding necessary files for Andes =
platforms, cores to enable custom CSR<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0support<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../devices/riscv32-andes-softmmu.mak=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../devices/riscv64-andes-softmmu.mak=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../targets/riscv32-andes-linux-user.ma=
k=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../targets/riscv32-andes-softmmu.mak=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../targets/riscv64-andes-linux-user.ma=
k=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../targets/riscv64-andes-softmmu.mak=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../targets/rv_custom/no_custom.mak=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../rv_custom/riscv32-andes-linux-user.=
mak=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../rv_custom/riscv32-andes-softmmu.mak=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../targets/rv_custom/riscv32-linux-use=
r.mak=C2=A0 |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../targets/rv_custom/riscv32-softmmu.m=
ak=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../rv_custom/riscv64-andes-linux-user.=
mak=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../rv_custom/riscv64-andes-softmmu.mak=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../targets/rv_custom/riscv64-linux-use=
r.mak=C2=A0 |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 .../targets/rv_custom/riscv64-softmmu.m=
ak=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 26 +++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 target/riscv/Kconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 +++++<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 18 files changed, 79 insertions(+)<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 default-configs/devi=
ces/riscv32-andes-softmmu.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 default-configs/devi=
ces/riscv64-andes-softmmu.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 120000 default-configs/targ=
ets/riscv32-andes-linux-user.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 120000 default-configs/targ=
ets/riscv32-andes-softmmu.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 120000 default-configs/targ=
ets/riscv64-andes-linux-user.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 120000 default-configs/targ=
ets/riscv64-andes-softmmu.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 default-configs/targ=
ets/rv_custom/no_custom.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 default-configs/targ=
ets/rv_custom/riscv32-andes-linux-user.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 default-configs/targ=
ets/rv_custom/riscv32-andes-softmmu.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 120000 default-configs/targ=
ets/rv_custom/riscv32-linux-user.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 120000 default-configs/targ=
ets/rv_custom/riscv32-softmmu.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 default-configs/targ=
ets/rv_custom/riscv64-andes-linux-user.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 default-configs/targ=
ets/rv_custom/riscv64-andes-softmmu.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 120000 default-configs/targ=
ets/rv_custom/riscv64-linux-user.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 120000 default-configs/targ=
ets/rv_custom/riscv64-softmmu.mak<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 target/riscv/Kconfig=
<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; 2.32.0<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
<br>
</blockquote></div>

--000000000000fab80205cb650aa3--

