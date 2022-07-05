Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8bGQ-0005Za-68
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 01:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o8bGP-0005ZO-8E; Tue, 05 Jul 2022 01:38:21 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o8bGM-0003yJ-6D; Tue, 05 Jul 2022 01:38:20 -0400
Received: by mail-pj1-x1033.google.com with SMTP id fz10so5014220pjb.2;
 Mon, 04 Jul 2022 22:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sXQtcfuXLTsL52tULxRixvBeWI8TAvK5rlDwwChHdQY=;
 b=Zcq86pRqbVv3dlBeJ51wWsmps+h1u+dX2tnrw5Jxp508EhQwl/zYSEbQ4nVMIxRdup
 KIGrQx7fVV8afh/zHhhnwIBqAdTzV0cMh/S3GLEQTwP0b5Tx5cBaT5UWNUb0sxEwmfdX
 oFW4hnR+LG7j41+agw64xNAGca0gyGcJnY4SYvGAHK6wpsL69wpATnCGDPXTXzufGQhM
 /741RmvIWzctoyy30qXNmMIa1uBL6r1qO5scTk0XMOdy91HPyvtk/tvgeBPTLeJ768+M
 9IAQSlpBwG+M+TxtJ9Fz2nR6nR7tORoX1dQPP4jYnVlVK1RgQeDW7Dn3T2eGA0CVrYPy
 5Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sXQtcfuXLTsL52tULxRixvBeWI8TAvK5rlDwwChHdQY=;
 b=R23p65xFh1vovs0wHS4YCHy6cIwkYDKXA+kzQIFBEyQaIB9wphZ9jSi803jNWFYq2T
 s8YjoUP5btvmur6hS54EfG0s79urmNnB8SqAsbEGDJXdHfxuPMV+zrua4FxOCWnjmYdR
 7apg72qBek7aqhsuJLpJStgzEDSNjNjYJ2VkmLuiqI3+Cr1bkYmjX34sYkpN2lUg2HZM
 3cxnirvlubYQ0Qp0tf+EBtYonqydcLtSUC6fS0ks7GNse5LcOfkjUPJai0VPC4Y4CIf5
 qPa3nv72rqtAc+gujdldFJz0XTVY7tpkZuP8OXLk3daQk+7GgG09GwsdkXinBElP/hIk
 pGyw==
X-Gm-Message-State: AJIora+ztl79lGECN41rw6ShCdpWCFVM7Ws+qbAUvyNjGS4O1A8M9bi2
 QEtWJ5L0ouRGtd4+psQDImY865pWX5u1DWzdOTk=
X-Google-Smtp-Source: AGRyM1t/W2mB2T20H2XReLymJNi1D7CtpIpei/kN9PLL6SlPl77ya0R8WILzzf3h1QUoYrXms2Y6lhIkyQ+ZIc1mP/U=
X-Received: by 2002:a17:902:b412:b0:16b:d846:77ee with SMTP id
 x18-20020a170902b41200b0016bd84677eemr13431338plr.25.1656999494855; Mon, 04
 Jul 2022 22:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220630061150.905174-1-apatel@ventanamicro.com>
 <CAAhSdy2iTPwqzUAhV8s97k1d4sK-bne1z-T6pg__p3xfsUrdHg@mail.gmail.com>
In-Reply-To: <CAAhSdy2iTPwqzUAhV8s97k1d4sK-bne1z-T6pg__p3xfsUrdHg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jul 2022 15:37:48 +1000
Message-ID: <CAKmqyKOwpLaSdNxh9OBPHUSNK54Ggws8FVgBmU4tWKu+s7rx6Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] QEMU RISC-V nested virtualization fixes
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 05 Jul 2022 05:38:21 -0000

On Thu, Jun 30, 2022 at 4:27 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Jun 30, 2022 at 11:42 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > This series does fixes and improvements to have nested virtualization
> > on QEMU RISC-V.
> >
> > These patches can also be found in riscv_nested_fixes_v9 branch at:
> > https://github.com/avpatel/qemu.git
> >
> > The RISC-V nested virtualization was tested on QEMU RISC-V using
> > Xvisor RISC-V which has required hypervisor support to run another
> > hypervisor as Guest/VM.
>
> Changes since v8:
>  - Drop first two patches because Alistair has already taken care of it.
>  - Include instruction immediate offset in "Addr. Offset" for PATCH1
>
> Regards,
> Anup
>
> >
> > Changes since v7:
> >  - Improve tinst "Addr. Offset" in PATCH3
> >
> > Changes since v6:
> >  - Droppred original PATCH1 and PATCH2 since these are already merged
> >  - Added PATCH1 to revert dummy mcountinhibit CSR
> >  - Added PATCH2 to fix minimum priv spec version for mcountinhibit CSR
> >  - Fixed checkpatch error in PATCH3
> >  - Fixed compile error in PATCH4
> >
> > Changes since v5:
> >  - Correctly set "Addr. Offset" for misaligned load/store traps in PATCH3
> >  - Use offsetof() instead of pointer in PATCH4
> >
> > Changes since v4:
> >  - Updated commit description in PATCH1, PATCH2, and PATCH4
> >  - Use "const" for local array in PATCH5
> >
> > Changes since v3:
> >  - Updated PATCH3 to set special pseudoinstructions in htinst for
> >    guest page faults which result due to VS-stage page table walks
> >  - Updated warning message in PATCH4
> >
> > Changes since v2:
> >  - Dropped the patch which are already in Alistair's next branch
> >  - Set "Addr. Offset" in the transformed instruction for PATCH3
> >  - Print warning in riscv_cpu_realize() if we are disabling an
> >    extension due to privilege spec verions mismatch for PATCH4
> >
> > Changes since v1:
> >  - Set write_gva to env->two_stage_lookup which ensures that for
> >    HS-mode to HS-mode trap write_gva is true only for HLV/HSV
> >    instructions
> >  - Included "[PATCH 0/3] QEMU RISC-V priv spec version fixes"
> >    patches in this series for easy review
> >  - Re-worked PATCH7 to force disable extensions if required
> >    priv spec version is not staisfied
> >  - Added new PATCH8 to fix "aia=aplic-imsic" mode of virt machine
> >
> > Anup Patel (2):
> >   target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
> >   target/riscv: Force disable extensions if priv spec version does not
> >     match
> >
> >  target/riscv/cpu.c        | 150 ++++++++++++++---------
> >  target/riscv/cpu.h        |   5 +
> >  target/riscv/cpu_helper.c | 252 +++++++++++++++++++++++++++++++++++++-
> >  target/riscv/instmap.h    |  45 +++++++
> >  4 files changed, 390 insertions(+), 62 deletions(-)

Thanks!

Applied to riscv-to-apply.next

Alistair

> >
> > --
> > 2.34.1
> >
>

