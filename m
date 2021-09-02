Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLcQK-000441-KX
	for mharc-qemu-riscv@gnu.org; Wed, 01 Sep 2021 22:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcQJ-00043C-00; Wed, 01 Sep 2021 22:25:51 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:41652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcQF-0004P5-Qh; Wed, 01 Sep 2021 22:25:50 -0400
Received: by mail-io1-xd31.google.com with SMTP id j18so563008ioj.8;
 Wed, 01 Sep 2021 19:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2ym+cL+XJV8NrqsgFBTKn4LFJ3A04BIZvox/OduA50=;
 b=DUe+gojRbdiVun0iBRqRHpE0BbHJHbk06q9dpKwk0ngF0tu6vU/4tJzUz0RGNCPNlq
 dA74TAShrT2OtmUvsZIU+PAvpLR65QZ87TZ+p74VOV3mlzdQabHeygJHbn/YTCKQaU7f
 9V/eH+zxqs54j+gxBYMDa3druVgtAbVi1ztHuWApviItUSQNlS7treL0llm4FUJ/ZWmL
 syCCivfpzOH+V81CoKhzIdTuDr7lHg7c96Rvx0k3jsYNToMyAg/lsQJSZetaokufMQzH
 eyzF8kDryghg9EekBaN/Y6yNSa/vx8eKgpGuFxU46SxtBbO19R1k+Bg6aQaxVGV2POPB
 gU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2ym+cL+XJV8NrqsgFBTKn4LFJ3A04BIZvox/OduA50=;
 b=ZjJ+3ORrZ8ePnno/H8eMXGNbg2B7moR4fR+2nAZu49uQEG9gTaIWepVCEgf+MCuG4J
 Ofbq7f0UgBeZODqv0UDyaWo765EoQ9NBPNAvTw4khVPO0vAXG6vMv8IoflV7vhSLFr4v
 tVQ5Iwc5ygf52njx6K3ZONu/DGqEco0VHDq0v7Ht8T2PnLaLVzgL2CG37Q4yc5urNYKu
 bIG0UNRJjT4LiqyAoIipRR4xdTV4jpCoUNOq4d+zcJYOU8ibNbD14Ut1mt4aH5jWkLRx
 CEGvNbvF1gMsK5dYPAF6te+3bVvALFBGlYMjvrXPK/dz1U/ka5lHMt6VJ7T3L5jWydqN
 8DUQ==
X-Gm-Message-State: AOAM533ygWR+SRDVDo1ucwJUM6Kmmcs9RRQBs7lMg2rPuMylunAWawtt
 lFXxizgQAjXav0nryVtmpATYuJZPW3x/7lvh85Q=
X-Google-Smtp-Source: ABdhPJzuLN9JjXDA3C14Y/Y2Gxf0sk6u+r7Wj3LvKB9Tg/bU7ppYEqxDn+qOh+ubjh+aW9mi7cDXlve81HzRnDoznz8=
X-Received: by 2002:a6b:7212:: with SMTP id n18mr795815ioc.175.1630549545975; 
 Wed, 01 Sep 2021 19:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210826151332.32753-1-ruinland@andestech.com>
In-Reply-To: <20210826151332.32753-1-ruinland@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:25:20 +1000
Message-ID: <CAKmqyKPY=Q61x7gf_0S1-B66VMpZCFx1r5ENJG0J5FNX6NLz0w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] riscv: Adding custom CSR related Kconfig options
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 Dylan Jhong <dylan@andestech.com>, imruinland.cs00@g2.nctu.edu.tw
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 02:25:51 -0000

On Fri, Aug 27, 2021 at 1:16 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
>
> During my modification on my previous patch series for custom CSR support, I
> believe this issue deserves its own discussion (or debate) because it's _not_
> as simple as "just put those options in Kconfig".
>
> The obstables I've encountered and the kluges I came up is listed as follow :
>
> (1) Due to the design of top-level meson.build, all Kconfig options will land
> into `*-config-devices.h` since minikconf will be only used after config_target
> being processed. This will let to the fact that linux-users won't be able to
> use custom CSR code properly becuase they only includes `*-config-devices.h`.
> And that is reasonble due to the fact that changes on cpu.c and csr.c is a
> target-related matter and linux-user mode shouldn't include device related
> headers in most of cases.
>
> So, modify meson.build to parse target/riscv/Kconfig during config_target phase
> is without doubts necessary.
>
> (2) Kconfig option `RISCV_CUSTOM_CSR` is introduced for RISC-V cpu models to
> toggle it at its will. Yet due to the fact that csr.o and cpu.o are linked
> altogether for all CPU models, the suffer will be shared without option.
> The only reasonable way to seperate build the fire lane which seperates vendor
> flavored cpu and spec-conformed ones, is to build them seperately with options
> toggled diffrently, just like RV32 and RV64 shares almost the same source base,
> yet the sources are compiled with differnt flags/definitions.
>
> To achieve that, miraculously, we can just put *.mak files into `target`
> directoy, because that's how `configure` enumerates what targets are supported.
>
> (3) The longest days are not over yet, if we take a good look at how the minikconf
> is invoked during config_devices and in what way *.mak presented its options
> inside `default-configs/devices`, we can see that *.mak files there is formated
> in `CONFIG_*` style and the minikconf is reading directly during config_device
> phase. That's totally different from *.mak files presented in
> `default-configs/targets`. To make the parsing logic consistent, I
> introduce a rv_custom directory inside which contains minikconf-parsable
> mak files.
>
> With this patches, ones can build a A25/AX25 linux-user platform by :
> $ ./configure --target-list=riscv64-andes-linux-user,riscv32-andes-linux-user

Hey! Thanks for the patches

I'm not convinced that we want this though.

Right now we are trying to head towards a riscv64-softmmu binary being
able to run all RISC-V code. That include 32-bit cpus
(qemu-riscv64-softmmu -cpu r32...) and 64-bit CPUs. We shouldn't be
splitting out more targets.

It also goes against the general idea of RISC-V in that everyone has a
standard compliant implementation, they can then add extra
functionality.

In terms of Kconfig options. It doesn't seem like a bad idea to have
an option to fully disable custom CSRs. That way if someone really
wants performance and doesn't want custom CSRs they can disable the
switch. Otherwise we leave it on and all custom CSRs are available in
the build and then controlled by the CPU selection at runtime. If that
ends up being too difficult to implement though then we don't have to
have it.

Thanks again for working on this.

Alistair


> $ make
>
> P.S. The pacthes from :
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00913.html
> is needed. A clean-up and modified version will be sent out soon.
>
> P.P.S.
> I know these parts won't be easy to digest, and the further iterations will be
> needed, so I didn't ask my colleagues to sign-off for now.
>
> Cordially yours,
> Ruinland ChuanTzu Tsai
>
> Ruinland ChuanTzu Tsai (2):
>   Adding Kconfig options for custom CSR support and Andes CPU model
>   Adding necessary files for Andes platforms, cores to enable custom CSR
>     support
>
>  Kconfig                                       |  1 +
>  .../devices/riscv32-andes-softmmu.mak         | 17 ++++++++++++
>  .../devices/riscv64-andes-softmmu.mak         | 17 ++++++++++++
>  .../targets/riscv32-andes-linux-user.mak      |  1 +
>  .../targets/riscv32-andes-softmmu.mak         |  1 +
>  .../targets/riscv64-andes-linux-user.mak      |  1 +
>  .../targets/riscv64-andes-softmmu.mak         |  1 +
>  .../targets/rv_custom/no_custom.mak           |  0
>  .../rv_custom/riscv32-andes-linux-user.mak    |  1 +
>  .../rv_custom/riscv32-andes-softmmu.mak       |  1 +
>  .../targets/rv_custom/riscv32-linux-user.mak  |  1 +
>  .../targets/rv_custom/riscv32-softmmu.mak     |  1 +
>  .../rv_custom/riscv64-andes-linux-user.mak    |  1 +
>  .../rv_custom/riscv64-andes-softmmu.mak       |  1 +
>  .../targets/rv_custom/riscv64-linux-user.mak  |  1 +
>  .../targets/rv_custom/riscv64-softmmu.mak     |  1 +
>  meson.build                                   | 26 +++++++++++++++++++
>  target/riscv/Kconfig                          |  6 +++++
>  18 files changed, 79 insertions(+)
>  create mode 100644 default-configs/devices/riscv32-andes-softmmu.mak
>  create mode 100644 default-configs/devices/riscv64-andes-softmmu.mak
>  create mode 120000 default-configs/targets/riscv32-andes-linux-user.mak
>  create mode 120000 default-configs/targets/riscv32-andes-softmmu.mak
>  create mode 120000 default-configs/targets/riscv64-andes-linux-user.mak
>  create mode 120000 default-configs/targets/riscv64-andes-softmmu.mak
>  create mode 100644 default-configs/targets/rv_custom/no_custom.mak
>  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
>  create mode 100644 default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
>  create mode 120000 default-configs/targets/rv_custom/riscv32-linux-user.mak
>  create mode 120000 default-configs/targets/rv_custom/riscv32-softmmu.mak
>  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
>  create mode 100644 default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
>  create mode 120000 default-configs/targets/rv_custom/riscv64-linux-user.mak
>  create mode 120000 default-configs/targets/rv_custom/riscv64-softmmu.mak
>  create mode 100644 target/riscv/Kconfig
>
> --
> 2.32.0
>

