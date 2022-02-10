Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nI6db-0001xh-Bd
	for mharc-qemu-riscv@gnu.org; Thu, 10 Feb 2022 05:25:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nI6dU-0001ub-GK
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 05:25:13 -0500
Received: from [2a00:1450:4864:20::435] (port=42752
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nI6dP-00014K-T8
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 05:25:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id h6so8619212wrb.9
 for <qemu-riscv@nongnu.org>; Thu, 10 Feb 2022 02:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=znHsyHjkEqwu7kVELjfsYjFqo4jsJ7jk+ioSeqZ1JNg=;
 b=n9nWgQHiHf+ok45v43IWPd/nkLSxndg62uHkPuWBCXQWOLmJtWaDr9sECiOe2rsJBS
 EabytwNfrIoRiVvJyBOiFGVPAv+/J2SpvGETvh2sG7hlerO0WTWJ/4S92nLEOTT7xPuT
 NZKG5wbOlOBy/spMLbNbDJo8tiz9yms4sfXqZc4oAO2hVF07tBorPc5mLLp+3aDmbuWe
 SnIzb3ZnIYofxF9fur1zkXEGeGAnu3AgZyy/4VZIHaXGexXs66qKqBZEuhOBohD1sgrE
 gOhMMC86M2kwpxF9/AKve+ZfktUABLTEwtP6OXEKFyrUHN7r/amN89IH2DRavHHbhfo4
 X4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=znHsyHjkEqwu7kVELjfsYjFqo4jsJ7jk+ioSeqZ1JNg=;
 b=miRcpwkV8UZfJILtN9RucqmPzdBXPEtjj0koEDMz2PJ2+/zbehF7dRoWP+5A/QnOQk
 qRXElORJV10syFnR+sdpg91SLCkujZ9S7k80YLUAAwjmu43gI6Ke5bqqYxZgtQk4cJ8G
 5DYCc65aHmCZ8LPooRYPRoMhRXtD5kijbuSqUx+nWjI9Ocutscfz+L6HnynB/BtN3Br7
 05AP31QqAx0pW0arjUiMRRacjGt/+6xrmXtrwraFtoBOoOPg6VOndgkqM50axpPPuX3o
 8RgIK2zVqrFxVZcSWUgUUSbtw2bsrd5RRbwZF1AZzhyKMYqBrfL8iFVTAT9h4xglz/xA
 2QYQ==
X-Gm-Message-State: AOAM530k6wvm6NF97BHkLNHytvJFTqEe+aBcAGX/nlqcD5hG22YQIFyn
 w72haKwfsARZjld+F8c7IJyMJsXP4Xu0InGe44ahjg==
X-Google-Smtp-Source: ABdhPJxr6yOLlqHB1kUVN/bMBjk1Jc9n6MdJvlwpkDV4AqaNQB4ij3j6lE7HiJfuakVBWzTTNybASsWp4++qzokKisI=
X-Received: by 2002:a05:6000:1e0a:: with SMTP id
 bj10mr5735021wrb.313.1644488688916; 
 Thu, 10 Feb 2022 02:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20220204174700.534953-1-anup@brainfault.org>
 <CAKmqyKO7QnMwSL1Mpa5BJU44EAQxyG2M-sOE8+yAH0SWrmVDug@mail.gmail.com>
 <CAKmqyKOjr3Dcs8_QZKsa=WkBp0BaYghcUNYMEU3RfyJJmcqJOQ@mail.gmail.com>
 <CAOnJCUJFQjk_sagCEYYTuD+Gh-9RuD6wsFkdnFhY2kHE7shZtg@mail.gmail.com>
In-Reply-To: <CAOnJCUJFQjk_sagCEYYTuD+Gh-9RuD6wsFkdnFhY2kHE7shZtg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Feb 2022 15:54:38 +0530
Message-ID: <CAAhSdy1Xc7k5V55Bkgv1-Z6BGtJ7BsXgLMF437p7mh7QC+H8=A@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] QEMU RISC-V AIA support
To: Atish Patra <atishp@atishpatra.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bin Meng <bmeng.cn@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::435;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 10 Feb 2022 10:25:13 -0000

On Thu, Feb 10, 2022 at 1:58 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Feb 7, 2022 at 10:51 PM Alistair Francis <alistair23@gmail.com> w=
rote:
> >
> > On Tue, Feb 8, 2022 at 2:16 PM Alistair Francis <alistair23@gmail.com> =
wrote:
> > >
> > > On Sat, Feb 5, 2022 at 3:47 AM Anup Patel <anup@brainfault.org> wrote=
:
> > > >
> > > > From: Anup Patel <anup.patel@wdc.com>
> > > >
> > > > The advanced interrupt architecture (AIA) extends the per-HART loca=
l
> > > > interrupt support. Along with this, it also adds IMSIC (MSI contrll=
or)
> > > > and Advanced PLIC (wired interrupt controller).
> > > >
> > > > The latest AIA draft specification can be found here:
> > > > https://github.com/riscv/riscv-aia/releases/download/0.2-draft.28/r=
iscv-interrupts-028.pdf
> > > >
> > > > This series adds RISC-V AIA support in QEMU which includes emulatin=
g all
> > > > AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filterin=
g is
> > > > not implemented because we don't have any local interrupt greater t=
han 12.
> > > >
> > > > To enable AIA in QEMU, use one of the following:
> > > > 1) Only AIA local interrupt CSRs: Pass "x-aia=3Dtrue" as CPU parame=
nter
> > > >    in the QEMU command-line
> > > > 2) Only APLIC for virt machine: Pass "aia=3Daplic" as machine param=
eter
> > > >    in the QEMU command-line
> > > > 3) Both APLIC and IMSIC for virt machine: Pass "aia=3Daplic-imsic" =
as
> > > >    machine parameter in the QEMU command-line
> > > > 4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
> > > >    "aia=3Daplic-imsic,aia-guests=3D2" as machine parameter in the Q=
EMU
> > > >    command-line
> > > >
> > > > To test series, we require OpenSBI and Linux with AIA support which=
 can
> > > > be found in:
> > > > riscv_aia_v2 branch at https://github.com/avpatel/opensbi.git
> > > > riscv_aia_v1 branch at https://github.com/avpatel/linux.git
> > > >
> > > > This series can be found riscv_aia_v9 branch at:
> > > > https://github.com/avpatel/qemu.git
> > > >
> > > > Changes since v8:
> > > >  - Use error_setg() in riscv_imsic_realize() added by PATCH20
> > > >
> > > > Changes since v7:
> > > >  - Rebased on latest riscv-to-apply.next branch of Alistair's repo
> > > >  - Improved default priority assignment in PATCH9
> > > >
> > > > Changes since v6:
> > > >  - Fixed priority comparison in riscv_cpu_pending_to_irq() of PATCH=
9
> > > >  - Fixed typos in comments added by PATCH11
> > > >  - Added "pend =3D true;" for CSR_MSETEIPNUM case of rmw_xsetclrein=
um()
> > > >    in PATCH15
> > > >  - Handle ithreshold =3D=3D 0 case in riscv_aplic_idc_topi() of PAT=
CH18
> > > >  - Allow setting pending bit for Level0 or Level1 interrupts in
> > > >    riscv_aplic_set_pending() of PATCH18
> > > >  - Force DOMAINCFG[31:24] bits to 0x80 in riscv_aplic_read() of PAT=
CH18
> > > >  - For APLIC direct mode, set target.iprio to 1 when zero is writte=
rn
> > > >    in PATCH18
> > > >  - Handle eithreshold =3D=3D 0 case in riscv_imsic_topei() of PATCH=
20
> > > >
> > > > Changes since v5:
> > > >  - Moved VSTOPI_NUM_SRCS define to top of the file in PATCH13
> > > >  - Fixed typo in PATCH16
> > > >
> > > > Changes since v4:
> > > >  - Changed IRQ_LOCAL_MAX to 16 in PATCH2
> > > >  - Fixed typo in PATCH10
> > > >  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH1=
1
> > > >  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH1=
4
> > > >  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH1=
5
> > > >  - Replaced TARGET_LONG_BITS with xlen passed via ireg callback in =
PATCH20
> > > >  - Retrict maximum IMSIC guest files per-HART of virt machine to 7 =
in
> > > >    PATCH21.
> > > >  - Added separate PATCH23 to increase maximum number of allowed CPU=
s
> > > >    for virt machine
> > > >
> > > > Changes since v3:
> > > >  - Replaced "aplic,xyz" and "imsic,xyz" DT properties with "riscv,x=
yz"
> > > >    DT properties because "aplic" and "imsic" are not valid vendor n=
ames
> > > >    required by Linux DT schema checker.
> > > >
> > > > Changes since v2:
> > > >  - Update PATCH4 to check and inject interrupt after V=3D1 when
> > > >    transitioning from V=3D0 to V=3D1
> > > >
> > > > Changes since v1:
> > > >  - Revamped whole series and created more granular patches
> > > >  - Added HGEIE and HGEIP CSR emulation for H-extension
> > > >  - Added APLIC emulation
> > > >  - Added IMSIC emulation
> > > >
> > > > Anup Patel (23):
> > > >   target/riscv: Fix trap cause for RV32 HS-mode CSR access from RV6=
4
> > > >     HS-mode
> > > >   target/riscv: Implement SGEIP bit in hip and hie CSRs
> > > >   target/riscv: Implement hgeie and hgeip CSRs
> > > >   target/riscv: Improve delivery of guest external interrupts
> > > >   target/riscv: Allow setting CPU feature from machine/device emula=
tion
> > > >   target/riscv: Add AIA cpu feature
> > > >   target/riscv: Add defines for AIA CSRs
> > > >   target/riscv: Allow AIA device emulation to set ireg rmw callback
> > > >   target/riscv: Implement AIA local interrupt priorities
> > > >   target/riscv: Implement AIA CSRs for 64 local interrupts on RV32
> > > >   target/riscv: Implement AIA hvictl and hviprioX CSRs
> > > >   target/riscv: Implement AIA interrupt filtering CSRs
> > > >   target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
> > > >   target/riscv: Implement AIA xiselect and xireg CSRs
> > > >   target/riscv: Implement AIA IMSIC interface CSRs
> > > >   hw/riscv: virt: Use AIA INTC compatible string when available
> > > >   target/riscv: Allow users to force enable AIA CSRs in HART
> > > >   hw/intc: Add RISC-V AIA APLIC device emulation
> > > >   hw/riscv: virt: Add optional AIA APLIC support to virt machine
> > > >   hw/intc: Add RISC-V AIA IMSIC device emulation
> > > >   hw/riscv: virt: Add optional AIA IMSIC support to virt machine
> > > >   docs/system: riscv: Document AIA options for virt machine
> > > >   hw/riscv: virt: Increase maximum number of allowed CPUs
> >
> > Hey Anup,
> >
> > There are lots of checkpatch errors in these patches. In the future
> > can you please make sure you run checkpatch on all patches.
> >
> > In this case I have manually fixed them up.
> >
> > Alistair
>
> I am also getting this error in gcc 11.1.0 on your tree "riscv-to-apply.n=
ext"
>
> ../target/riscv/csr.c: In function =E2=80=98rmw_sie=E2=80=99:
> ../target/riscv/csr.c:1571:18: error: =E2=80=98rval=E2=80=99 may be used =
uninitialized
> in this function [-Werror=3Dmaybe-uninitialized]
>  1571 |         *ret_val =3D rval;
>       |         ~~~~~~~~~^~~~~~
> cc1: all warnings being treated as errors
>
> I guess you will fix it directly in the correct patch. Let me know if
> you want me to send a patch.

I suggest you directly send a fix since you are able to reproduce
this error.

Regards,
Anup

>
> --
> Regards,
> Atish

