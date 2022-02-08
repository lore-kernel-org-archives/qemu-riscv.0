Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nHL1B-00063N-8M
	for mharc-qemu-riscv@gnu.org; Tue, 08 Feb 2022 02:34:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nHL0E-0005yD-Vp
 for qemu-riscv@nongnu.org; Tue, 08 Feb 2022 02:33:39 -0500
Received: from [2a00:1450:4864:20::22f] (port=37481
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nHKzj-0003Jc-OY
 for qemu-riscv@nongnu.org; Tue, 08 Feb 2022 02:33:03 -0500
Received: by mail-lj1-x22f.google.com with SMTP id z7so23196964ljj.4
 for <qemu-riscv@nongnu.org>; Mon, 07 Feb 2022 23:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=teBn2gs/mOGngDUEriQQpdd1/dGVQQWNhYE6egkr9cE=;
 b=ky1UamkKyBx0mTqmwZQjdHqTZjAZyvATzk5i2q+s5xlTI4ZogZ6/HEFR3h3S6VENWv
 n6ndFczYTY36umWlXwQtPY0ePe9NZYHT24cZVsHW9G60JWJmXA2vo/MEMfeysZnCaMpZ
 eTQDsLi99Iyaye8dWJTp78yt4TXpc9qL8V6k0uji71/iF/bH89Hu4p2qffSFBceu9h94
 Hzi6L2WEV5WOuTbe0pRR3W6+XSsyV4KuLuI3Km08rQHklT0ow7nmup8G1WLirJw5hk3x
 8oGQTGAJd9KLSam5ECbOOhoK8uLW/zDFQKTcGqYnanweOsk9kBw+HFPzTW+6l2vqG7lg
 Qasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=teBn2gs/mOGngDUEriQQpdd1/dGVQQWNhYE6egkr9cE=;
 b=E6Qxb7xcMkz+Dgdw3HuVlzbNgRtRBiP7FA/ozl2Di4K3s/12ebmddIKGImSfJUR0EV
 Hx+UN4dt7sqPNs0AUiusvBRAuIb2XOZrspA37G1p7OsbHW6IsC3JgmX7vt0W0b8VgdFx
 98B3Pdf5/LgAvjz+JymRBtasivbYxjTXS4N6sMkUGWDHvyM6EBLdA/s3Nl+x1qje0rFE
 8lpEd1V1fDPozf9LQjreN77W9guIdKlzDxw6Af5cmfYNdCICLkUy1nEtsih6KCf5fiMv
 qS298OuvDUOWIqn7THp0A5BfxfPcgSQ2JQ8QRcvZpfT3fsrr/Qx4+xJyY2obgHJWBJOg
 2t2g==
X-Gm-Message-State: AOAM530b5q+xVQQi7AtVzGpNiuD0koIwE2QsThsRJObOTS0mY2hbJofd
 N8NfRjcpljos2U4a7grzWB4Nq2GDfMTkMnZyyh+WBA==
X-Google-Smtp-Source: ABdhPJwYzIyWG2b64y7pU0XlehVVyXkL7RhxCGAj+QAL5Vu4uMdXqmIMcxSTAC3nvGGj1cVFesHR9C4Zu54C44/MOOs=
X-Received: by 2002:a2e:bc09:: with SMTP id b9mr2034144ljf.24.1644305562930;
 Mon, 07 Feb 2022 23:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20220204174700.534953-1-anup@brainfault.org>
 <CAKmqyKO7QnMwSL1Mpa5BJU44EAQxyG2M-sOE8+yAH0SWrmVDug@mail.gmail.com>
 <CAKmqyKOjr3Dcs8_QZKsa=WkBp0BaYghcUNYMEU3RfyJJmcqJOQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOjr3Dcs8_QZKsa=WkBp0BaYghcUNYMEU3RfyJJmcqJOQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 8 Feb 2022 13:02:31 +0530
Message-ID: <CAK9=C2UPEn3qP99QyrJn4w4DxPKH+giwDWNMbBaBVC=ZraDhDQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] QEMU RISC-V AIA support
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=apatel@ventanamicro.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 08 Feb 2022 07:33:55 -0000

On Tue, Feb 8, 2022 at 12:27 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Feb 8, 2022 at 2:16 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Sat, Feb 5, 2022 at 3:47 AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > From: Anup Patel <anup.patel@wdc.com>
> > >
> > > The advanced interrupt architecture (AIA) extends the per-HART local
> > > interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
> > > and Advanced PLIC (wired interrupt controller).
> > >
> > > The latest AIA draft specification can be found here:
> > > https://github.com/riscv/riscv-aia/releases/download/0.2-draft.28/riscv-interrupts-028.pdf
> > >
> > > This series adds RISC-V AIA support in QEMU which includes emulating all
> > > AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filtering is
> > > not implemented because we don't have any local interrupt greater than 12.
> > >
> > > To enable AIA in QEMU, use one of the following:
> > > 1) Only AIA local interrupt CSRs: Pass "x-aia=true" as CPU paramenter
> > >    in the QEMU command-line
> > > 2) Only APLIC for virt machine: Pass "aia=aplic" as machine parameter
> > >    in the QEMU command-line
> > > 3) Both APLIC and IMSIC for virt machine: Pass "aia=aplic-imsic" as
> > >    machine parameter in the QEMU command-line
> > > 4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
> > >    "aia=aplic-imsic,aia-guests=2" as machine parameter in the QEMU
> > >    command-line
> > >
> > > To test series, we require OpenSBI and Linux with AIA support which can
> > > be found in:
> > > riscv_aia_v2 branch at https://github.com/avpatel/opensbi.git
> > > riscv_aia_v1 branch at https://github.com/avpatel/linux.git
> > >
> > > This series can be found riscv_aia_v9 branch at:
> > > https://github.com/avpatel/qemu.git
> > >
> > > Changes since v8:
> > >  - Use error_setg() in riscv_imsic_realize() added by PATCH20
> > >
> > > Changes since v7:
> > >  - Rebased on latest riscv-to-apply.next branch of Alistair's repo
> > >  - Improved default priority assignment in PATCH9
> > >
> > > Changes since v6:
> > >  - Fixed priority comparison in riscv_cpu_pending_to_irq() of PATCH9
> > >  - Fixed typos in comments added by PATCH11
> > >  - Added "pend = true;" for CSR_MSETEIPNUM case of rmw_xsetclreinum()
> > >    in PATCH15
> > >  - Handle ithreshold == 0 case in riscv_aplic_idc_topi() of PATCH18
> > >  - Allow setting pending bit for Level0 or Level1 interrupts in
> > >    riscv_aplic_set_pending() of PATCH18
> > >  - Force DOMAINCFG[31:24] bits to 0x80 in riscv_aplic_read() of PATCH18
> > >  - For APLIC direct mode, set target.iprio to 1 when zero is writtern
> > >    in PATCH18
> > >  - Handle eithreshold == 0 case in riscv_imsic_topei() of PATCH20
> > >
> > > Changes since v5:
> > >  - Moved VSTOPI_NUM_SRCS define to top of the file in PATCH13
> > >  - Fixed typo in PATCH16
> > >
> > > Changes since v4:
> > >  - Changed IRQ_LOCAL_MAX to 16 in PATCH2
> > >  - Fixed typo in PATCH10
> > >  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH11
> > >  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH14
> > >  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH15
> > >  - Replaced TARGET_LONG_BITS with xlen passed via ireg callback in PATCH20
> > >  - Retrict maximum IMSIC guest files per-HART of virt machine to 7 in
> > >    PATCH21.
> > >  - Added separate PATCH23 to increase maximum number of allowed CPUs
> > >    for virt machine
> > >
> > > Changes since v3:
> > >  - Replaced "aplic,xyz" and "imsic,xyz" DT properties with "riscv,xyz"
> > >    DT properties because "aplic" and "imsic" are not valid vendor names
> > >    required by Linux DT schema checker.
> > >
> > > Changes since v2:
> > >  - Update PATCH4 to check and inject interrupt after V=1 when
> > >    transitioning from V=0 to V=1
> > >
> > > Changes since v1:
> > >  - Revamped whole series and created more granular patches
> > >  - Added HGEIE and HGEIP CSR emulation for H-extension
> > >  - Added APLIC emulation
> > >  - Added IMSIC emulation
> > >
> > > Anup Patel (23):
> > >   target/riscv: Fix trap cause for RV32 HS-mode CSR access from RV64
> > >     HS-mode
> > >   target/riscv: Implement SGEIP bit in hip and hie CSRs
> > >   target/riscv: Implement hgeie and hgeip CSRs
> > >   target/riscv: Improve delivery of guest external interrupts
> > >   target/riscv: Allow setting CPU feature from machine/device emulation
> > >   target/riscv: Add AIA cpu feature
> > >   target/riscv: Add defines for AIA CSRs
> > >   target/riscv: Allow AIA device emulation to set ireg rmw callback
> > >   target/riscv: Implement AIA local interrupt priorities
> > >   target/riscv: Implement AIA CSRs for 64 local interrupts on RV32
> > >   target/riscv: Implement AIA hvictl and hviprioX CSRs
> > >   target/riscv: Implement AIA interrupt filtering CSRs
> > >   target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
> > >   target/riscv: Implement AIA xiselect and xireg CSRs
> > >   target/riscv: Implement AIA IMSIC interface CSRs
> > >   hw/riscv: virt: Use AIA INTC compatible string when available
> > >   target/riscv: Allow users to force enable AIA CSRs in HART
> > >   hw/intc: Add RISC-V AIA APLIC device emulation
> > >   hw/riscv: virt: Add optional AIA APLIC support to virt machine
> > >   hw/intc: Add RISC-V AIA IMSIC device emulation
> > >   hw/riscv: virt: Add optional AIA IMSIC support to virt machine
> > >   docs/system: riscv: Document AIA options for virt machine
> > >   hw/riscv: virt: Increase maximum number of allowed CPUs
>
> Hey Anup,
>
> There are lots of checkpatch errors in these patches. In the future
> can you please make sure you run checkpatch on all patches.

I had run checkpatch on initial patch revisions but at some point I
stopped running checkpatch on every patch revision.

I will make sure to run checkpatch on all patch revisions going
forward.

>
> In this case I have manually fixed them up.

Thanks and my apologies for the inconvenience.

Regards,
Anup

