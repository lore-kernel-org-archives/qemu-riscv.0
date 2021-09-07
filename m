Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNW6p-0001qZ-Hn
	for mharc-qemu-riscv@gnu.org; Tue, 07 Sep 2021 04:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mNW6m-0001mf-Jm; Tue, 07 Sep 2021 04:05:32 -0400
Received: from exmail.andestech.com ([60.248.187.195]:22079
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mNW6f-0006VE-6b; Tue, 07 Sep 2021 04:05:30 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 18784sG6063513;
 Tue, 7 Sep 2021 16:04:54 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from ruinland-x1c (49.216.19.106) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 7 Sep 2021
 16:04:53 +0800
Date: Tue, 7 Sep 2021 16:04:52 +0800
From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
To: Alistair Francis <alistair23@gmail.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, wangjunqiang
 <wangjunqiang@iscas.ac.cn>, "Alan Quey-Liang Kao(((((((((()"
 <alankao@andestech.com>,
 Dylan Jhong <dylan@andestech.com>, <guoren@linux.alibaba.com>,
 <ycliang@andestech.com>
Subject: Re: [RFC PATCH 0/2] riscv: Adding custom CSR related Kconfig options
Message-ID: <YTcdJBgP5PY+56wU@ruinland-x1c>
References: <20210826151332.32753-1-ruinland@andestech.com>
 <CAKmqyKPY=Q61x7gf_0S1-B66VMpZCFx1r5ENJG0J5FNX6NLz0w@mail.gmail.com>
 <YTW6ADQMBcs5csXv@ruinland-x1c>
 <CAKmqyKPu9MK0KRycXzcnb=pH_OjB1mCKzw8uhb2vSZAwxraAfg@mail.gmail.com>
 <YTXFGWBhpJ3gdxxb@ruinland-x1c>
 <CAKmqyKM2erOYCOqbT7rKmbQig5HC2Q_3hk2xHBDMbFG9ipx06A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKmqyKM2erOYCOqbT7rKmbQig5HC2Q_3hk2xHBDMbFG9ipx06A@mail.gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
X-Originating-IP: [49.216.19.106]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 18784sG6063513
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 07 Sep 2021 08:05:33 -0000

Hi Alistair,

Thanks for the comment.

On Mon, Sep 06, 2021 at 05:55:25PM +1000, Alistair Francis wrote:
> On Mon, Sep 6, 2021 at 5:37 PM Ruinland ChuanTzu Tsai
> <ruinland@andestech.com> wrote:
> >
> > Hi Alistair,
> >
> > So glad to hear from you.
> >
> > On Mon, Sep 06, 2021 at 05:05:16PM +1000, Alistair Francis wrote:
> > > On Mon, Sep 6, 2021 at 4:49 PM Ruinland ChuanTzu Tsai
> > > <ruinland@andestech.com> wrote:
> > > >
> > > >
> > > > Hi Alistair,
> > > >
> > > > Thanks for the heads up about the upcoming unification of RISC-V 32/64 targets.
> > > > Yet I have several concerns and would like to have some brainstorming regarding
> > > > such topics - -
> > >
> > > No worries, I'm happy to discuss.
> > >
> > > >
> > > > That is, could you elaborate more about the "runtime check/switch" which you
> > > > mentioned in the previous e-mail :
> > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg02154.html
> > > > I'm not quite following the context.
> > >
> > > Yep, so something along the lines of this in `riscv_csrrw()`
> > >
> > > if (cpu == "MyCustomCPU") {
> > >     my_custom_csr[csrno].read();
> > > }
> > >
> > > So we check if using the CPU then apply extra CSR accesses.
> > >
> > > > If we don't have a way to toggle which (vendor) cores, which will be used,
> > > > during compile time, it means that we have to build all the vendor code and
> > > > link them all together; and we might have the chance to encounter collision on
> > > > csrno between different vendors.
> > >
> > > I don't see how they will collide as we will only act on 1, based on
> > > the CPU we are using.
> >
> > AFAIK, we need to put CSR number into `target/riscv/cpu_bits.h`, and they are
> > exposed to the global and let others to use it. With my current design, which I
> > have sent out by RFC patch series v3, I introduced an abstraction layer,
> > `custom_cpu_bits.h`, which will toggle diffenet set of custom CSR number.
> >
> > If we teardown the Kconfig, all symbols will be exposed and then it could have
> > a high chance to collide with each other.
> 
> I guess this depends on what you are trying to do.
> 
> We could have non public CSRs. So each CPU could have it's own custom
> version of `riscv_csr_operations csr_ops[CSR_TABLE_SIZE]` which is in
> it's own C file. We then just add a switch case to CSR accesses and if
> using CPU "customcpu" then we check the `custom_cpu_csr_ops` table.
> NOTE: That we can do something smarter than a switch, but you get the
> point. We can implement a read/write function for every element in the
> array, with the default just triggering an illegal instruction.

One thing I would like to discuss here.

Firstly, I'm not quite sure how the picture of non-public CSR looks like.
Is it suggested that non-standard CSR number shall not be exposed ?

I know that we should focus on custom CSR part, yet I need to make sure
that if following logic is permitted to appear in `target/riscv/trans_insn` :

trans_vendor_A_insn_blah(...) {
    riscv_csrrw(env, CSR_VENDOR_A_CUSTOM, r, n, write_mask);
    }

As far as I know, csr number is not presented as a C++ enum, which we
can access via csr::custom::vendora::foobar, so it's a globally exposed
macro with possiblilty of collision.

IMHO, the key is that are we permitted to have a uniform interface to access
CSR, either standard or vendor designed ones, in other parts of QEMU.


> I guess that assumes that each CSR access is self contained. For
> example if changing a custom CSR changes a core part of the
> target/riscv code this won't really work.
> 
> On the other hand I'm not convinced we want vendor changes to affect
> the core target/riscv code. Ideally all vendor code can be kept in
> it's own file and it's fully self contained. That won't work for
> everything, but it should work for enough use cases. We can even have
> a custom vendor state that the vendor code can use (it can also change
> the CPU state).
> 
> Does that make sense?

In general, I agree with the point that vendor code should be self-contained.
Yet I have doubts that with the current design of CPU model, are we able to
unify the targets and in the meanwhile to keep things tight and neat ?

The execution flow will be bonded to have a shared instruction decoder/
translator and a shared handler for CSR (i.e. riscv_csrrw). It's not like we
get to choose what decoder we want to use or which CSR table we will be
using at xxx_cpu_init(). If we choose to use runtime check/diversion of all of
these parts, the overhead might be tremendous. 

Surely we should be focusing on CSR part for now, and just as you said, CSR
is not that perforamnce-centric.

Yet if we take a look at `configs/targets`, still we're having 6 MIPS32/64
linux-user targets, 4 ARM32/64 linux-user targets and 4 PPC32/64 linux-user
targets.

I guess it will be a very long journey to merge all the variants.

> 
> >
> > >
> > > >
> > > > Secondly, I'm not quite sure about how we're going to merge decode tree files
> > > > across RV32 and RV64. Vendor-designed custom instruction would have a different
> > > > encoding scheme on bitfields for RV32 and RV64. Currently, we (Andes) are using
> > > > different decodetree sources for gen32 and gen64 in `target/riscv/meson.build`.
> > >
> > > Ok, so custom instructions are a whole different problem. I think we
> > > should leave that for now and focus on CSRs.
> > >
> > > A quick look though and I suspect we could do a similar CPU check in
> > > decode_opc(). Dealing with the decodetree will be problematic though.
> > >
> > > > I'm preparing the patch to demonstrate such hiccups.
> > > >
> > > > As far as I know, there's no control flow logic for decodetree to parse
> > > > decodetree files differently. (e.g. ifdef XLEN == 32 then blah, blah).
> > > >
> > > > To meet in the halfway, maybe after the grand unification on RV32/64, we can
> > > > still confine vendor custom logic (i.e. instrucions and CSRs) to be toggled by
> > > > whether a certain vendor cpu model is selected ?
> > >wtih  the d
> > > I honestly don't see a scenario where that happens. The maintenance
> > > overhead and confusion of changing the CPUs at build time is too high.
> > >
> > > I also don't think we should need that for CSR accesses. Custom
> > > instructions are a whole different can of worms.
> >
> > IMHO, custom CSR and custom instructions are two sides of a same coin in some
> > way. Let me explain it with an example - -
> >
> > Andes has a custom instruction called `EXEC.IT`, which is a 16-bit long com-
> > pressed instruction. By executing such instrcution, an instruction table
> > reside in a particular address specified by a custom CSR called uitb will be
> > fetch, decode and execute. By doing so, the code size could be reduced.
> 
> Hmmm... This is a much more complex use case than I was expecting. I
> have been thinking more about custom CSRs to set a timer or control
> the interrupt controller.
> 
> Something like what you described is going to be a lot more work.
> 
> In your case though I think we can still focus on the CSR aspect
> first. Once that is sorted we can then look at the instruction part.

Just like the mentioned question above , I'm wondering if we can assume
riscv_csrrw() to be a general interface for accessing all the CSRs ?

Cordially yours,
Ruinland ChuanTzu Tsai

> The main aim should be that all (or almost all) vendor code lives in
> it's own file.
> 
> Alistair
> 
> >
> > The problem is that we have different address encoding on RV32 and RV64.
> >
> > And just like you mentioned, in our in-house core, we apply the same logic on
> > decode_opc() to decode custom instructions first. If such decoding/trans
> > procedure fails, the original decoder will be invoked.
> >
> > >
> > > >
> > > > By the way, I'm wondering how our friends from T-Head (Guo Ren ?) regard this
> > > > issue ? AFAIK, they forked QEMU from v3.2.0 and applied their vendor features
> > > > on top of it for quite a while.
> > >
> > > I'm not sure.
> >
> > Sorry for the confusion, I was trying to ping Guo Ren :-D
> > I CC'ed him in the previous e-mail.
> >
> > Cordially yours,
> > Ruinland ChuanTzu Tsai
> >
> > >
> > > Alistair
> > >
> > > >
> > > > Cordially yours,
> > > > Ruinland ChuanTzu Tsai
> > > >
> > > > On Thu, Sep 02, 2021 at 12:25:20PM +1000, Alistair Francis wrote:
> > > > > On Fri, Aug 27, 2021 at 1:16 AM Ruinland Chuan-Tzu Tsai
> > > > > <ruinland@andestech.com> wrote:
> > > > > >
> > > > > > From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > > > > >
> > > > > > During my modification on my previous patch series for custom CSR support, I
> > > > > > believe this issue deserves its own discussion (or debate) because it's _not_
> > > > > > as simple as "just put those options in Kconfig".
> > > > > >
> > > > > > The obstables I've encountered and the kluges I came up is listed as follow :
> > > > > >
> > > > > > (1) Due to the design of top-level meson.build, all Kconfig options will land
> > > > > > into `*-config-devices.h` since minikconf will be only used after config_target
> > > > > > being processed. This will let to the fact that linux-users won't be able to
> > > > > > use custom CSR code properly becuase they only includes `*-config-devices.h`.
> > > > > > And that is reasonble due to the fact that changes on cpu.c and csr.c is a
> > > > > > target-related matter and linux-user mode shouldn't include device related
> > > > > > headers in most of cases.
> > > > > >
> > > > > > So, modify meson.build to parse target/riscv/Kconfig during config_target phase
> > > > > > is without doubts necessary.
> > > > > >
> > > > > > (2) Kconfig option `RISCV_CUSTOM_CSR` is introduced for RISC-V cpu models to
> > > > > > toggle it at its will. Yet due to the fact that csr.o and cpu.o are linked
> > > > > > altogether for all CPU models, the suffer will be shared without option.
> > > > > > The only reasonable way to seperate build the fire lane which seperates vendor
> > > > > > flavored cpu and spec-conformed ones, is to build them seperately with options
> > > > > > toggled diffrently, just like RV32 and RV64 shares almost the same source base,
> > > > > > yet the sources are compiled with differnt flags/definitions.
> > > > > >
> > > > > > To achieve that, miraculously, we can just put *.mak files into `target`
> > > > > > directoy, because that's how `configure` enumerates what targets are supported.
> > > > > >
> > > > > > (3) The longest days are not over yet, if we take a good look at how the minikconf
> > > > > > is invoked during config_devices and in what way *.mak presented its options
> > > > > > inside `default-configs/devices`, we can see that *.mak files there is formated
> > > > > > in `CONFIG_*` style and the minikconf is reading directly during config_device
> > > > > > phase. That's totally different from *.mak files presented in
> > > > > > `default-configs/targets`. To make the parsing logic consistent, I
> > > > > > introduce a rv_custom directory inside which contains minikconf-parsable
> > > > > > mak files.
> > > > > >
> > > > > > With this patches, ones can build a A25/AX25 linux-user platform by :
> > > > > > $ ./configure --target-list=riscv64-andes-linux-user,riscv32-andes-linux-user
> > > > >
> > > > > Hey! Thanks for the patches
> > > > >
> > > > > I'm not convinced that we want this though.
> > > > >
> > > > > Right now we are trying to head towards a riscv64-softmmu binary being
> > > > > able to run all RISC-V code. That include 32-bit cpus
> > > > > (qemu-riscv64-softmmu -cpu r32...) and 64-bit CPUs. We shouldn't be
> > > > > splitting out more targets.
> > > > >
> > > > > It also goes against the general idea of RISC-V in that everyone has a
> > > > > standard compliant implementation, they can then add extra
> > > > > functionality.
> > > > >
> > > > > In terms of Kconfig options. It doesn't seem like a bad idea to have
> > > > > an option to fully disable custom CSRs. That way if someone really
> > > > > wants performance and doesn't want custom CSRs they can disable the
> > > > > switch. Otherwise we leave it on and all custom CSRs are available in
> > > > > the build and then controlled by the CPU selection at runtime. If that
> > > > > ends up being too difficult to implement though then we don't have to
> > > > > have it.
> > > > >
> > > > > Thanks again for working on this.
> > > > >
> > > > > Alistair
> > > > >
> > > > >
> > > > > > $ make
> > > > > >
> > > > > > P.S. The pacthes from :
> > > > > > https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00913.html
> > > > > > is needed. A clean-up and modified version will be sent out soon.
> > > > > >
> > > > > > P.P.S.
> > > > > > I know these parts won't be easy to digest, and the further iterations will be
> > > > > > needed, so I didn't ask my colleagues to sign-off for now.
> > > > > >
> > > > > > Cordially yours,
> > > > > > Ruinland ChuanTzu Tsai
> > > > > >
> > > > > > Ruinland ChuanTzu Tsai (2):
> > > > > >   Adding Kconfig options for custom CSR support and Andes CPU model
> > > > > >   Adding necessary files for Andes platforms, cores to enable custom CSR
> > > > > >     support
> > > > > >
> > > > > >  Kconfig                                       |  1 +
> > > > > >  .../devices/riscv32-andes-softmmu.mak         | 17 ++++++++++++
> > > > > >  .../devices/riscv64-andes-softmmu.mak         | 17 ++++++++++++
> > > > > >  .../targets/riscv32-andes-linux-user.mak      |  1 +
> > > > > >  .../targets/riscv32-andes-softmmu.mak         |  1 +
> > > > > >  .../targets/riscv64-andes-linux-user.mak      |  1 +
> > > > > >  .../targets/riscv64-andes-softmmu.mak         |  1 +
> > > > > >  .../targets/rv_custom/no_custom.mak           |  0
> > > > > >  .../rv_custom/riscv32-andes-linux-user.mak    |  1 +
> > > > > >  .../rv_custom/riscv32-andes-softmmu.mak       |  1 +
> > > > > >  .../targets/rv_custom/riscv32-linux-user.mak  |  1 +
> > > > > >  .../targets/rv_custom/riscv32-softmmu.mak     |  1 +
> > > > > >  .../rv_custom/riscv64-andes-linux-user.mak    |  1 +
> > > > > >  .../rv_custom/riscv64-andes-softmmu.mak       |  1 +
> > > > > >  .../targets/rv_custom/riscv64-linux-user.mak  |  1 +
> > > > > >  .../targets/rv_custom/riscv64-softmmu.mak     |  1 +
> > > > > >  meson.build                                   | 26 +++++++++++++++++++
> > > > > >  target/riscv/Kconfig                          |  6 +++++
> > > > > >  18 files changed, 79 insertions(+)
> > > > > >  create mode 100644 default-configs/devices/riscv32-andes-softmmu.mak
> > > > > >  create mode 100644 default-configs/devices/riscv64-andes-softmmu.mak
> > > > > >  create mode 120000 default-configs/targets/riscv32-andes-linux-user.mak
> > > > > >  create mode 120000 default-configs/targets/riscv32-andes-softmmu.mak
> > > > > >  create mode 120000 default-configs/targets/riscv64-andes-linux-user.mak
> > > > > >  create mode 120000 default-configs/targets/riscv64-andes-softmmu.mak
> > > > > >  create mode 100644 default-configs/targets/rv_custom/no_custom.mak
> > > > > >  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
> > > > > >  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
> > > > > >  create mode 120000 default-configs/targets/rv_custom/riscv32-linux-user.mak
> > > > > >  create mode 120000 default-configs/targets/rv_custom/riscv32-softmmu.mak
> > > > > >  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
> > > > > >  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
> > > > > >  create mode 120000 default-configs/targets/rv_custom/riscv64-linux-user.mak
> > > > > >  create mode 120000 default-configs/targets/rv_custom/riscv64-softmmu.mak
> > > > > >  create mode 100644 target/riscv/Kconfig
> > > > > >
> > > > > > --
> > > > > > 2.32.0
> > > > > >

