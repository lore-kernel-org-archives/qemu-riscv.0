Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mN8SN-0004sw-2r
	for mharc-qemu-riscv@gnu.org; Mon, 06 Sep 2021 02:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mN8SC-0004qi-JT; Mon, 06 Sep 2021 02:50:05 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:14497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mN8S9-0007ju-0R; Mon, 06 Sep 2021 02:50:03 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 1866nZB2076430;
 Mon, 6 Sep 2021 14:49:35 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from ruinland-x1c (49.216.19.106) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 6 Sep 2021
 14:49:37 +0800
Date: Mon, 6 Sep 2021 14:49:36 +0800
From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
To: Alistair Francis <alistair23@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>,
 <wangjunqiang@iscas.ac.cn>, <alankao@andestech.com>,
 <dylan@andestech.com>, <guoren@linux.alibaba.com>, <ycliang@andestech.com>
Subject: Re: [RFC PATCH 0/2] riscv: Adding custom CSR related Kconfig options
Message-ID: <YTW6ADQMBcs5csXv@ruinland-x1c>
References: <20210826151332.32753-1-ruinland@andestech.com>
 <CAKmqyKPY=Q61x7gf_0S1-B66VMpZCFx1r5ENJG0J5FNX6NLz0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKmqyKPY=Q61x7gf_0S1-B66VMpZCFx1r5ENJG0J5FNX6NLz0w@mail.gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
X-Originating-IP: [49.216.19.106]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 1866nZB2076430
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
X-List-Received-Date: Mon, 06 Sep 2021 06:50:07 -0000


Hi Alistair,

Thanks for the heads up about the upcoming unification of RISC-V 32/64 targets.
Yet I have several concerns and would like to have some brainstorming regarding
such topics - -

That is, could you elaborate more about the "runtime check/switch" which you
mentioned in the previous e-mail :
https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg02154.html
I'm not quite following the context.
If we don't have a way to toggle which (vendor) cores, which will be used,
during compile time, it means that we have to build all the vendor code and
link them all together; and we might have the chance to encounter collision on
csrno between different vendors.

Secondly, I'm not quite sure about how we're going to merge decode tree files
across RV32 and RV64. Vendor-designed custom instruction would have a different
encoding scheme on bitfields for RV32 and RV64. Currently, we (Andes) are using
different decodetree sources for gen32 and gen64 in `target/riscv/meson.build`.
I'm preparing the patch to demonstrate such hiccups.

As far as I know, there's no control flow logic for decodetree to parse
decodetree files differently. (e.g. ifdef XLEN == 32 then blah, blah).

To meet in the halfway, maybe after the grand unification on RV32/64, we can
still confine vendor custom logic (i.e. instrucions and CSRs) to be toggled by
whether a certain vendor cpu model is selected ?

By the way, I'm wondering how our friends from T-Head (Guo Ren ?) regard this
issue ? AFAIK, they forked QEMU from v3.2.0 and applied their vendor features
on top of it for quite a while.

Cordially yours,
Ruinland ChuanTzu Tsai

On Thu, Sep 02, 2021 at 12:25:20PM +1000, Alistair Francis wrote:
> On Fri, Aug 27, 2021 at 1:16 AM Ruinland Chuan-Tzu Tsai
> <ruinland@andestech.com> wrote:
> >
> > From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> >
> > During my modification on my previous patch series for custom CSR support, I
> > believe this issue deserves its own discussion (or debate) because it's _not_
> > as simple as "just put those options in Kconfig".
> >
> > The obstables I've encountered and the kluges I came up is listed as follow :
> >
> > (1) Due to the design of top-level meson.build, all Kconfig options will land
> > into `*-config-devices.h` since minikconf will be only used after config_target
> > being processed. This will let to the fact that linux-users won't be able to
> > use custom CSR code properly becuase they only includes `*-config-devices.h`.
> > And that is reasonble due to the fact that changes on cpu.c and csr.c is a
> > target-related matter and linux-user mode shouldn't include device related
> > headers in most of cases.
> >
> > So, modify meson.build to parse target/riscv/Kconfig during config_target phase
> > is without doubts necessary.
> >
> > (2) Kconfig option `RISCV_CUSTOM_CSR` is introduced for RISC-V cpu models to
> > toggle it at its will. Yet due to the fact that csr.o and cpu.o are linked
> > altogether for all CPU models, the suffer will be shared without option.
> > The only reasonable way to seperate build the fire lane which seperates vendor
> > flavored cpu and spec-conformed ones, is to build them seperately with options
> > toggled diffrently, just like RV32 and RV64 shares almost the same source base,
> > yet the sources are compiled with differnt flags/definitions.
> >
> > To achieve that, miraculously, we can just put *.mak files into `target`
> > directoy, because that's how `configure` enumerates what targets are supported.
> >
> > (3) The longest days are not over yet, if we take a good look at how the minikconf
> > is invoked during config_devices and in what way *.mak presented its options
> > inside `default-configs/devices`, we can see that *.mak files there is formated
> > in `CONFIG_*` style and the minikconf is reading directly during config_device
> > phase. That's totally different from *.mak files presented in
> > `default-configs/targets`. To make the parsing logic consistent, I
> > introduce a rv_custom directory inside which contains minikconf-parsable
> > mak files.
> >
> > With this patches, ones can build a A25/AX25 linux-user platform by :
> > $ ./configure --target-list=riscv64-andes-linux-user,riscv32-andes-linux-user
> 
> Hey! Thanks for the patches
> 
> I'm not convinced that we want this though.
> 
> Right now we are trying to head towards a riscv64-softmmu binary being
> able to run all RISC-V code. That include 32-bit cpus
> (qemu-riscv64-softmmu -cpu r32...) and 64-bit CPUs. We shouldn't be
> splitting out more targets.
> 
> It also goes against the general idea of RISC-V in that everyone has a
> standard compliant implementation, they can then add extra
> functionality.
> 
> In terms of Kconfig options. It doesn't seem like a bad idea to have
> an option to fully disable custom CSRs. That way if someone really
> wants performance and doesn't want custom CSRs they can disable the
> switch. Otherwise we leave it on and all custom CSRs are available in
> the build and then controlled by the CPU selection at runtime. If that
> ends up being too difficult to implement though then we don't have to
> have it.
> 
> Thanks again for working on this.
> 
> Alistair
> 
> 
> > $ make
> >
> > P.S. The pacthes from :
> > https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00913.html
> > is needed. A clean-up and modified version will be sent out soon.
> >
> > P.P.S.
> > I know these parts won't be easy to digest, and the further iterations will be
> > needed, so I didn't ask my colleagues to sign-off for now.
> >
> > Cordially yours,
> > Ruinland ChuanTzu Tsai
> >
> > Ruinland ChuanTzu Tsai (2):
> >   Adding Kconfig options for custom CSR support and Andes CPU model
> >   Adding necessary files for Andes platforms, cores to enable custom CSR
> >     support
> >
> >  Kconfig                                       |  1 +
> >  .../devices/riscv32-andes-softmmu.mak         | 17 ++++++++++++
> >  .../devices/riscv64-andes-softmmu.mak         | 17 ++++++++++++
> >  .../targets/riscv32-andes-linux-user.mak      |  1 +
> >  .../targets/riscv32-andes-softmmu.mak         |  1 +
> >  .../targets/riscv64-andes-linux-user.mak      |  1 +
> >  .../targets/riscv64-andes-softmmu.mak         |  1 +
> >  .../targets/rv_custom/no_custom.mak           |  0
> >  .../rv_custom/riscv32-andes-linux-user.mak    |  1 +
> >  .../rv_custom/riscv32-andes-softmmu.mak       |  1 +
> >  .../targets/rv_custom/riscv32-linux-user.mak  |  1 +
> >  .../targets/rv_custom/riscv32-softmmu.mak     |  1 +
> >  .../rv_custom/riscv64-andes-linux-user.mak    |  1 +
> >  .../rv_custom/riscv64-andes-softmmu.mak       |  1 +
> >  .../targets/rv_custom/riscv64-linux-user.mak  |  1 +
> >  .../targets/rv_custom/riscv64-softmmu.mak     |  1 +
> >  meson.build                                   | 26 +++++++++++++++++++
> >  target/riscv/Kconfig                          |  6 +++++
> >  18 files changed, 79 insertions(+)
> >  create mode 100644 default-configs/devices/riscv32-andes-softmmu.mak
> >  create mode 100644 default-configs/devices/riscv64-andes-softmmu.mak
> >  create mode 120000 default-configs/targets/riscv32-andes-linux-user.mak
> >  create mode 120000 default-configs/targets/riscv32-andes-softmmu.mak
> >  create mode 120000 default-configs/targets/riscv64-andes-linux-user.mak
> >  create mode 120000 default-configs/targets/riscv64-andes-softmmu.mak
> >  create mode 100644 default-configs/targets/rv_custom/no_custom.mak
> >  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
> >  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
> >  create mode 120000 default-configs/targets/rv_custom/riscv32-linux-user.mak
> >  create mode 120000 default-configs/targets/rv_custom/riscv32-softmmu.mak
> >  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
> >  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
> >  create mode 120000 default-configs/targets/rv_custom/riscv64-linux-user.mak
> >  create mode 120000 default-configs/targets/rv_custom/riscv64-softmmu.mak
> >  create mode 100644 target/riscv/Kconfig
> >
> > --
> > 2.32.0
> >

