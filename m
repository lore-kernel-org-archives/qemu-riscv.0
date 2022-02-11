Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nIRIZ-0004rd-V1
	for mharc-qemu-riscv@gnu.org; Fri, 11 Feb 2022 03:29:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nIRIY-0004rG-59; Fri, 11 Feb 2022 03:28:58 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=39714
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nIRIU-0008Sh-RF; Fri, 11 Feb 2022 03:28:57 -0500
Received: by mail-io1-xd2f.google.com with SMTP id c188so10457000iof.6;
 Fri, 11 Feb 2022 00:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+ReUJ8YFJ6aq1FfhMmXHkW6xr5XmPYrFrAQjDSeIeas=;
 b=oPU/0ckHmgaWwvy+PGapWUIqMgJ13N2OMpV0V1Qie2bf/Cp1edIoSqjDV7R8FmaITx
 B4Zq+Ur+StpFeA5/nKf8skts6K6Zgf33HKYCDzO2CD0YDvOmLOi8xA+RBh8zv4D3neVm
 3Gzrqycrr5kN60g8qbQXqelmO09VgVUNGKgLq7D5cpMgNQTsHXJDYB364wmbaOKjCj6w
 ykC6TmFkmhxfOK7UJEckBblqE8dsugiRA6qJm+8IObrOtkMYkKvcUbTQ1ikUTRSTI4IM
 UHhHzL3iNycUsaKI1Yiielfy2tTvEnVplzL+odU03RLsxyy8xuaomepp0GzZ/w2k+Jhs
 xJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+ReUJ8YFJ6aq1FfhMmXHkW6xr5XmPYrFrAQjDSeIeas=;
 b=zOM2BJENtvv6awLofE3yiycDn4L8Es4hxMpMWeSUj7SZ3/dpq1qaeQEimoeJuP6muP
 HiEncsL+YPZn4yOkNdW6XDmjvw5KgMibdWeLBfe5kH/PnrkFXx7xU24pYuYxm0mWDYgP
 DCLVdj3m1pxVgAE2DS03N4hqHFeKzT0ebELcgLf2+TPthqZK5xmIgTQqiGQB2x+TiGeS
 axu9NlmoIdvebpd6Ng5gxy+9lJN9dCBVXagkDedt/yPa7YiZT5zN1icCB31e5yvBYO1+
 DICWKcg/mjzsezL8RaQO1ma3Ru14UDUjqhU6/XdFC69MzFDbHSrEoEfoVALc607+Rt6A
 iaTw==
X-Gm-Message-State: AOAM531+rRFc9igUxjoX92tCBGQUR8cFynHJ3RY8n9l88xulKx+85Xju
 Lm4e+Pl/M+TBTpCRHWi2A2QjefkaW9TeJBunNyQ=
X-Google-Smtp-Source: ABdhPJyY5V4AVsHh0AhAM69n+zqFT0gpAk6+MvPU/ClLV+cweqLeCIBGptLKFhQ2HekV7Czlr4bc0Kt6xwE1/mseUfw=
X-Received: by 2002:a05:6638:2609:: with SMTP id
 m9mr207286jat.169.1644568127056; 
 Fri, 11 Feb 2022 00:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20220204174700.534953-1-anup@brainfault.org>
 <CAKmqyKO7QnMwSL1Mpa5BJU44EAQxyG2M-sOE8+yAH0SWrmVDug@mail.gmail.com>
 <CAKmqyKOjr3Dcs8_QZKsa=WkBp0BaYghcUNYMEU3RfyJJmcqJOQ@mail.gmail.com>
 <CAOnJCUJFQjk_sagCEYYTuD+Gh-9RuD6wsFkdnFhY2kHE7shZtg@mail.gmail.com>
 <CAAhSdy1Xc7k5V55Bkgv1-Z6BGtJ7BsXgLMF437p7mh7QC+H8=A@mail.gmail.com>
In-Reply-To: <CAAhSdy1Xc7k5V55Bkgv1-Z6BGtJ7BsXgLMF437p7mh7QC+H8=A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Feb 2022 18:28:19 +1000
Message-ID: <CAKmqyKM-+bDikZwQBZ2G9hq+OWTAH8mc3DxqRpW8uozoraCn7A@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] QEMU RISC-V AIA support
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bin Meng <bmeng.cn@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 11 Feb 2022 08:28:58 -0000

On Thu, Feb 10, 2022 at 8:24 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Feb 10, 2022 at 1:58 PM Atish Patra <atishp@atishpatra.org> wrote=
:
> >
> > On Mon, Feb 7, 2022 at 10:51 PM Alistair Francis <alistair23@gmail.com>=
 wrote:
> > >
> > > On Tue, Feb 8, 2022 at 2:16 PM Alistair Francis <alistair23@gmail.com=
> wrote:
> > > >
> > > > On Sat, Feb 5, 2022 at 3:47 AM Anup Patel <anup@brainfault.org> wro=
te:
> > > > >
> > > > > From: Anup Patel <anup.patel@wdc.com>
> > > > >
> > > > > The advanced interrupt architecture (AIA) extends the per-HART lo=
cal
> > > > > interrupt support. Along with this, it also adds IMSIC (MSI contr=
llor)
> > > > > and Advanced PLIC (wired interrupt controller).
> > > > >
> > > > > The latest AIA draft specification can be found here:
> > > > > https://github.com/riscv/riscv-aia/releases/download/0.2-draft.28=
/riscv-interrupts-028.pdf
> > > > >
> > > > > This series adds RISC-V AIA support in QEMU which includes emulat=
ing all
> > > > > AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filter=
ing is
> > > > > not implemented because we don't have any local interrupt greater=
 than 12.
> > > > >
> > > > > To enable AIA in QEMU, use one of the following:
> > > > > 1) Only AIA local interrupt CSRs: Pass "x-aia=3Dtrue" as CPU para=
menter
> > > > >    in the QEMU command-line
> > > > > 2) Only APLIC for virt machine: Pass "aia=3Daplic" as machine par=
ameter
> > > > >    in the QEMU command-line
> > > > > 3) Both APLIC and IMSIC for virt machine: Pass "aia=3Daplic-imsic=
" as
> > > > >    machine parameter in the QEMU command-line
> > > > > 4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
> > > > >    "aia=3Daplic-imsic,aia-guests=3D2" as machine parameter in the=
 QEMU
> > > > >    command-line
> > > > >
> > > > > To test series, we require OpenSBI and Linux with AIA support whi=
ch can
> > > > > be found in:
> > > > > riscv_aia_v2 branch at https://github.com/avpatel/opensbi.git
> > > > > riscv_aia_v1 branch at https://github.com/avpatel/linux.git
> > > > >
> > > > > This series can be found riscv_aia_v9 branch at:
> > > > > https://github.com/avpatel/qemu.git
> > > > >
> > > > > Changes since v8:
> > > > >  - Use error_setg() in riscv_imsic_realize() added by PATCH20
> > > > >
> > > > > Changes since v7:
> > > > >  - Rebased on latest riscv-to-apply.next branch of Alistair's rep=
o
> > > > >  - Improved default priority assignment in PATCH9
> > > > >
> > > > > Changes since v6:
> > > > >  - Fixed priority comparison in riscv_cpu_pending_to_irq() of PAT=
CH9
> > > > >  - Fixed typos in comments added by PATCH11
> > > > >  - Added "pend =3D true;" for CSR_MSETEIPNUM case of rmw_xsetclre=
inum()
> > > > >    in PATCH15
> > > > >  - Handle ithreshold =3D=3D 0 case in riscv_aplic_idc_topi() of P=
ATCH18
> > > > >  - Allow setting pending bit for Level0 or Level1 interrupts in
> > > > >    riscv_aplic_set_pending() of PATCH18
> > > > >  - Force DOMAINCFG[31:24] bits to 0x80 in riscv_aplic_read() of P=
ATCH18
> > > > >  - For APLIC direct mode, set target.iprio to 1 when zero is writ=
tern
> > > > >    in PATCH18
> > > > >  - Handle eithreshold =3D=3D 0 case in riscv_imsic_topei() of PAT=
CH20
> > > > >
> > > > > Changes since v5:
> > > > >  - Moved VSTOPI_NUM_SRCS define to top of the file in PATCH13
> > > > >  - Fixed typo in PATCH16
> > > > >
> > > > > Changes since v4:
> > > > >  - Changed IRQ_LOCAL_MAX to 16 in PATCH2
> > > > >  - Fixed typo in PATCH10
> > > > >  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATC=
H11
> > > > >  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATC=
H14
> > > > >  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATC=
H15
> > > > >  - Replaced TARGET_LONG_BITS with xlen passed via ireg callback i=
n PATCH20
> > > > >  - Retrict maximum IMSIC guest files per-HART of virt machine to =
7 in
> > > > >    PATCH21.
> > > > >  - Added separate PATCH23 to increase maximum number of allowed C=
PUs
> > > > >    for virt machine
> > > > >
> > > > > Changes since v3:
> > > > >  - Replaced "aplic,xyz" and "imsic,xyz" DT properties with "riscv=
,xyz"
> > > > >    DT properties because "aplic" and "imsic" are not valid vendor=
 names
> > > > >    required by Linux DT schema checker.
> > > > >
> > > > > Changes since v2:
> > > > >  - Update PATCH4 to check and inject interrupt after V=3D1 when
> > > > >    transitioning from V=3D0 to V=3D1
> > > > >
> > > > > Changes since v1:
> > > > >  - Revamped whole series and created more granular patches
> > > > >  - Added HGEIE and HGEIP CSR emulation for H-extension
> > > > >  - Added APLIC emulation
> > > > >  - Added IMSIC emulation
> > > > >
> > > > > Anup Patel (23):
> > > > >   target/riscv: Fix trap cause for RV32 HS-mode CSR access from R=
V64
> > > > >     HS-mode
> > > > >   target/riscv: Implement SGEIP bit in hip and hie CSRs
> > > > >   target/riscv: Implement hgeie and hgeip CSRs
> > > > >   target/riscv: Improve delivery of guest external interrupts
> > > > >   target/riscv: Allow setting CPU feature from machine/device emu=
lation
> > > > >   target/riscv: Add AIA cpu feature
> > > > >   target/riscv: Add defines for AIA CSRs
> > > > >   target/riscv: Allow AIA device emulation to set ireg rmw callba=
ck
> > > > >   target/riscv: Implement AIA local interrupt priorities
> > > > >   target/riscv: Implement AIA CSRs for 64 local interrupts on RV3=
2
> > > > >   target/riscv: Implement AIA hvictl and hviprioX CSRs
> > > > >   target/riscv: Implement AIA interrupt filtering CSRs
> > > > >   target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
> > > > >   target/riscv: Implement AIA xiselect and xireg CSRs
> > > > >   target/riscv: Implement AIA IMSIC interface CSRs
> > > > >   hw/riscv: virt: Use AIA INTC compatible string when available
> > > > >   target/riscv: Allow users to force enable AIA CSRs in HART
> > > > >   hw/intc: Add RISC-V AIA APLIC device emulation
> > > > >   hw/riscv: virt: Add optional AIA APLIC support to virt machine
> > > > >   hw/intc: Add RISC-V AIA IMSIC device emulation
> > > > >   hw/riscv: virt: Add optional AIA IMSIC support to virt machine
> > > > >   docs/system: riscv: Document AIA options for virt machine
> > > > >   hw/riscv: virt: Increase maximum number of allowed CPUs
> > >
> > > Hey Anup,
> > >
> > > There are lots of checkpatch errors in these patches. In the future
> > > can you please make sure you run checkpatch on all patches.
> > >
> > > In this case I have manually fixed them up.
> > >
> > > Alistair
> >
> > I am also getting this error in gcc 11.1.0 on your tree "riscv-to-apply=
.next"
> >
> > ../target/riscv/csr.c: In function =E2=80=98rmw_sie=E2=80=99:
> > ../target/riscv/csr.c:1571:18: error: =E2=80=98rval=E2=80=99 may be use=
d uninitialized
> > in this function [-Werror=3Dmaybe-uninitialized]
> >  1571 |         *ret_val =3D rval;
> >       |         ~~~~~~~~~^~~~~~
> > cc1: all warnings being treated as errors
> >
> > I guess you will fix it directly in the correct patch. Let me know if
> > you want me to send a patch.
>
> I suggest you directly send a fix since you are able to reproduce
> this error.

I upgraded to GCC 11 and see this failure as well. It is an actual
bug, I have squashed in this diff:

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 387088a86c..fe2c8dd40e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1567,7 +1567,7 @@ static RISCVException rmw_sie(CPURISCVState
*env, int csrno,
    RISCVException ret;

    ret =3D rmw_sie64(env, csrno, &rval, new_val, wr_mask);
-    if (ret_val) {
+    if (ret =3D=3D RISCV_EXCP_NONE && ret_val) {
        *ret_val =3D rval;
    }

Alistair

>
> Regards,
> Anup
>
> >
> > --
> > Regards,
> > Atish

