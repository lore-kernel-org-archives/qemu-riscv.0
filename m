Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAO9V-0007eP-Bo
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 22:30:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAO9S-0007cI-CQ; Wed, 19 Jan 2022 22:30:18 -0500
Received: from [2607:f8b0:4864:20::133] (port=37538
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAO9Q-0001TG-Oe; Wed, 19 Jan 2022 22:30:18 -0500
Received: by mail-il1-x133.google.com with SMTP id v17so3982815ilg.4;
 Wed, 19 Jan 2022 19:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ESAzrAVUZFVX05fLhCfj6+VDmQZ0QV9hNTAHvDMs/bo=;
 b=Sb6vENdbG15WEZxHLNgjyYGBUuKrB2BrgUQudX7n1xDQvRt+iVhL71cFV5KDcivqkJ
 mzoVMXSXg+7Tl71zuCeXydLR+hZANK1z9xlFDggltXagCOOxi9rUgIeu1iS5TrO+sT6u
 2Jo+mPhio3cpXiGIxWxVrMseaog7067x8fkhUJkONWRLaKXGq4mn1koL9YPw9QUKDViO
 FkG4FHwLfid74abUU3Miqh5IcO9vysZa6i3arKp3z7XoGzh2B2HJqbA3EXBeUOrecGKa
 A2wIYKSrlMYLALsL03Zx4pZEn5CvhffmP85whHplO1N6yW+0EVzX0pKiT/09edVEHCp7
 wSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ESAzrAVUZFVX05fLhCfj6+VDmQZ0QV9hNTAHvDMs/bo=;
 b=JHBy9fFReAq2M8xATC+wZSjEpRgc8W9mQ7DhG0vnZtQdoNDS+v65yfDUzU6BRWBO5r
 HB0gUF7RHEDe4CbNIxgJ1gV2Kme0kn3m7NKVbaZs+dblR8U8O2JAlyiXCTyUEz903hjk
 PEPzXoriIYTBdtvZTYyzX12HZNFcPbr2+v29bPr+JysrhfFOMwG9rEghCxHYtAoObkN5
 PqYP2ZDlU84/lKc+jY+9ZDqHEa4l+42PDF2PZC+02uaHT7vn1zpAdAcGp2+Jp5DOn5+R
 m7FIclbE2LQzFn6LP5BdCLvXAry5b0+isUWkmo8jpdfXhyEsKzd4TuXMk405s1cNbbh7
 1sMA==
X-Gm-Message-State: AOAM532PpKii4SUms1yOaJHzXfmJP0+ELTzEc1LxSsp3GOHqMbaHoR5v
 85VkCpJwEYsp4tc8MMq5aadfYJRtLi+b3bX9g+Y=
X-Google-Smtp-Source: ABdhPJwtij3eLNISLugVg0sRmv9/tOYZRvbtqtXhukP9LkN0EusT+xyIT1f38KxzDp2ojrwBZCUpAaj4KInlG9a2dg0=
X-Received: by 2002:a05:6e02:b4c:: with SMTP id
 f12mr19013316ilu.208.1642649414980; 
 Wed, 19 Jan 2022 19:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
 <20220119051824.17494-22-zhiwei_liu@c-sky.com>
 <CAKmqyKP=NNEVDDGrbSEeWLfLyX_+=Ao0yWJ9RtyazyycGHM3+w@mail.gmail.com>
 <508b3d54-0641-cab2-c153-8f2bb76c79ed@c-sky.com>
In-Reply-To: <508b3d54-0641-cab2-c153-8f2bb76c79ed@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Jan 2022 13:29:48 +1000
Message-ID: <CAKmqyKNMvkCX2=V0kRQXKV3_1B6Y61gFOWrpWJ1JPXYm_8a5uQ@mail.gmail.com>
Subject: Re: [PATCH v7 21/22] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 03:30:20 -0000

On Thu, Jan 20, 2022 at 12:12 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2022/1/20 =E4=B8=8A=E5=8D=888:35, Alistair Francis wrote:
> > On Wed, Jan 19, 2022 at 3:34 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote=
:
> >> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >>   target/riscv/csr.c | 17 ++++++++++++-----
> >>   1 file changed, 12 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index b11d92b51b..90f78eca65 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -572,6 +572,7 @@ static RISCVException write_mstatus(CPURISCVState =
*env, int csrno,
> >>   {
> >>       uint64_t mstatus =3D env->mstatus;
> >>       uint64_t mask =3D 0;
> >> +    RISCVMXL xl =3D riscv_cpu_mxl(env);
> >>
> >>       /* flush tlb on mstatus fields that affect VM */
> >>       if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
> >> @@ -583,21 +584,22 @@ static RISCVException write_mstatus(CPURISCVStat=
e *env, int csrno,
> >>           MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
> >>           MSTATUS_TW | MSTATUS_VS;
> >>
> >> -    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> >> +    if (xl !=3D MXL_RV32) {
> >>           /*
> >>            * RV32: MPV and GVA are not in mstatus. The current plan is=
 to
> >>            * add them to mstatush. For now, we just don't support it.
> >>            */
> >>           mask |=3D MSTATUS_MPV | MSTATUS_GVA;
> >> +        if ((val & MSTATUS64_UXL) !=3D 0) {
> >> +            mask |=3D MSTATUS64_UXL;
> >> +        }
> >>       }
> >>
> >>       mstatus =3D (mstatus & ~mask) | (val & mask);
> >>
> >> -    RISCVMXL xl =3D riscv_cpu_mxl(env);
> >>       if (xl > MXL_RV32) {
> >> -        /* SXL and UXL fields are for now read only */
> >> +        /* SXL field is for now read only */
> >>           mstatus =3D set_field(mstatus, MSTATUS64_SXL, xl);
> >> -        mstatus =3D set_field(mstatus, MSTATUS64_UXL, xl);
> > This change causes:
> >
> > ERROR:../target/riscv/translate.c:295:get_gpr: code should not be reach=
ed
> >
> > to assert when running an Xvisor (Hypervisor extension) guest on the
> > 64-bit virt machine.
>
> Hi Alistair,
>
> I am  almost sure that there is an UXL  field write error in Xvisor.

You are probably right, but a guest bug like that shouldn't be able to
crash QEMU

>
> I guess there is an write_sstatus instruction that  writes a 0 to
> SSTATUS64_UXL.
>
> We can fix it on Xvisor. But before that, we should also give more
> strict constraints on SSTATUS64_UXL write.
>
> +        if ((val & SSTATUS64_UXL) !=3D 0) {
> +            mask |=3D SSTATUS64_UXL;
> +        }
> -        mask |=3D SSTATUS64_UXL;
>
>
> I will send v8 patch set later for you to test later.

Thanks!

Alistair

>
>
> Thanks,
> Zhiwei
>
> > Alistair

