Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA09CDB479
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 14:39:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcOlU-0007Oe-G1; Wed, 24 Jun 2026 10:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suunj1331@gmail.com>)
 id 1wcOlS-0007OE-LH
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 10:39:42 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <suunj1331@gmail.com>)
 id 1wcOlR-0002qV-2I
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 10:39:42 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5aa61e3d3f3so1109165e87.0
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 07:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782311979; cv=none;
 d=google.com; s=arc-20240605;
 b=PwfHdh6kmiNrb9Kgg12lBSX26P/4u/o3OmmMyDtaQ83hZYUgvhRosGT2zp0/HQbuWH
 6nd2+XJQCsk3P9q1iaNUghTbQubcsegyEusnhzVZ0/sxGQxi9a8GstEeX4ZW25Q/HQVv
 B27s3ZQZtyRlJcX3r5H9rSK6QvJic/BkS3u+FBr9mEqUPLsGgcC5FxNdd9bTHCdYw9i6
 sI29cZjkTIMxkXuT6XA0M3p2ZmQPECEc1XAhVWSby1qthk7TPmCtvfMAjs4m0197Me2T
 lcd1czWoEGAEG7A+GwqIi+7PEr/ALATyAc9q3XHMLpbJThyCNpMeFV4NaKb+10W+tXlB
 0r5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ToX7vzujzwu1ZERuBXKxJH0zW2dxltUXq9k0R/akn1s=;
 fh=6I7VcyjKDN+Okt9/KvSBc86ddDyXaSWPNoQ2jFbPgnM=;
 b=hqq5fsPnbYFFlD0VkH6rl5NPuCWeKLeghxsHaCW9bNClDTVc5hpD1VS8fxEmyhRUGC
 K7/wMW85EULL2H34SN1DqRYwuAmOKfA+ENy6Wmw6RFAjPtm7IROnJCRekA9Yv1PziIIZ
 uKEfdjKckuwYBasDHM1HmpBHHGzJCDQYIwLUeJjO+Yhm+XMW0F+hbS6a6jvTL02MC0tP
 MEK2v5btuuzSLWHaad9/qlkGTII9Lcr0pSojmTBOOiBTZslR1uuIIIGAjQ+87pvLKnWL
 EnX5x0QZoL4nHDHHtp+mGP4IL8FL+yFBeF8x827SBCeutBPaOplMtmaH2bb0DN4Rc3AI
 YzYw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782311979; x=1782916779; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ToX7vzujzwu1ZERuBXKxJH0zW2dxltUXq9k0R/akn1s=;
 b=Y6DwHvj4Hi02c7dqQQOM3GCxVrCUj4UJHHJoRSkSicphG8xqun6fsJLRDb0PVJAI7C
 wFq0eugvuoGQQJlEZE27FJW/Ae1omjVkC1qAAtrDSl3QFIfj5u+2AzohQbhQQgPivowN
 +UnuBRcTuzK/O0nYi13TyRY6ZzOH2nas3/ckc/QHL03LP71jn38OCpiJWowGCFpnLQdI
 gU9RtBtZkGTTayne0rHrwH0Ld+w7+jHWnO2Ds0QlrEN1x2mpvDYp/kiKx7H4EgPJ3w/n
 Yhgz/Z8+B9XyDIJpt62qLDCuoxkq3c13e0RKsnxKRTrxWwB9aAXOCruJPZBGC4a6IjBM
 5/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782311979; x=1782916779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ToX7vzujzwu1ZERuBXKxJH0zW2dxltUXq9k0R/akn1s=;
 b=olHtf1Q4r9mqQv4dB64q4v+C0LUir44FVwLfVzxaMOhBoA2kwjTsbcfmgrYttz6+e7
 Pvto4VGQ25bHKhjWnTSR1nfMeGxVrh9fuvZh2bFBCN/o1phge+Rw/Aj4WM3/ExC6knKs
 wLCWp1i/borfJ8pPcARhN0w+QDRhWq4uGrefkjzeK0MDxymONna8moaMxQZ38YbxMyhz
 SA/pejr8oN+ZfYox+jaue56Lej7SZLurkOoLhtoo/LrUXV6AedLve/fYgrUmGbKwm29B
 vpmJcafPdia0nV2UnGxjkTEFMRxOMpzHnCMY/4oSeBh7wCBfbgujhaEJ676r9JtmrT0B
 JU7g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoLqFYl1oIu6dWbA32lpMcOk+RV6x2/0OQgs39VYe4857qeYm9PnvZgBqfszEAhpc6XySShd/JBfRY2@nongnu.org
X-Gm-Message-State: AOJu0YwghJzoE/6ocpV3YNm0G7aAhajqdOFeo/hR44Z50c+vM2Bb8TDA
 8DFauvRvrQciawyLWdBPilMXuSEphRDvNysLRPQgkTLpeR9arT6gpLOtAI5TAGNrkpvYmYX0ADs
 SRnJOn7GNYo0jwePL3FnP8ii3RNshsEY=
X-Gm-Gg: AfdE7cmgl9NQSMdFsqEjDOlhE2iUl8B5ZgTdjY803a95zDiKQiq9PHhlt3UryMauwZZ
 xg/rASWe0L4vh1mV7XP8T92pHeqB2AsfQHB/yFCJUH2AFkjUFadx6UlEGqSvILT8TUHEbCWUNHE
 2YlnAwVqfZd3o3LxTpEmc4YaSSzHG2ZF53YtIbWYD5mP2oq/nnp1FRSkUNab6O1ujG3fy3O8HDR
 kiLCBvPod8dvozMeoAmDJOHNensvMpA2gN7tfzqdVIzfn+uAPdmPqwtxnT4h0KEEoXh0yzOuVOG
 azHw6M0jEg0x42nzchSXAbKrewba
X-Received: by 2002:a05:6512:ac3:b0:5ad:5079:483a with SMTP id
 2adb3069b0e04-5addb81cdc8mr2481854e87.12.1782311978267; Wed, 24 Jun 2026
 07:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260624090052.463075-1-suunj1331@gmail.com>
 <4e78cb10-dbed-4f22-b104-43f45595f86e@oss.qualcomm.com>
In-Reply-To: <4e78cb10-dbed-4f22-b104-43f45595f86e@oss.qualcomm.com>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Wed, 24 Jun 2026 23:39:25 +0900
X-Gm-Features: AVVi8Cfi9Fp5VXWps5xvboHpH-iCiLiocVwAL6y-rxjSIlQVuREeeA5h2QZ264M
Message-ID: <CAGwK=3oHc_gep8fuoC8F7uQyEMxMvnrcJ_6F4HeSNOXtiJ_ggw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix vsstatus.UXL reserved value
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=suunj1331@gmail.com; helo=mail-lf1-x12c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Thanks for the review, Daniel.

I'll add a helper function and resend as v2.

Best regards,
SeungJu

On Wed, Jun 24, 2026 at 9:34=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Hello,
>
> On 6/24/2026 6:00 AM, SeungJu Cheon wrote:
> > By the priv spec the value "3" is marked as 'Reserved' for
> > mstatus.UXL. write_mstatus() rejects this value, but
> > write_vsstatus() does not, allowing the reserved value to be
> > written and read back unchanged.
> >
> > Handle a vsstatus.UXL =3D 3 write by writing the current 'xl'
> > instead.
> >
> > Fixes: f310df58bd2 ("target/riscv: Enable uxl field write")
> > Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> > ---
> >   target/riscv/csr.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index dd9726fcf4..4c1da61824 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -5226,7 +5226,15 @@ static RISCVException write_vsstatus(CPURISCVSta=
te *env, int csrno,
> >       uint64_t mask =3D (target_ulong)-1;
> >       if ((val & VSSTATUS64_UXL) =3D=3D 0) {
> >           mask &=3D ~VSSTATUS64_UXL;
> > +    } else {
> > +        uint64_t uxl =3D (val & VSSTATUS64_UXL) >> 32;
> > +        if (uxl =3D=3D 3) {
> > +            int xl =3D riscv_cpu_mxl(env);
> > +            val =3D deposit64(val, 32, 2,
> > +                            xl =3D=3D MXL_RV128 ? MXL_RV64 : xl);
> > +        }
> >       }
>
> This is similar to what was done here:
>
> commit ddfd33f1965804fc4a718d8d46bc150525c2f9db
> Author: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Date:   Thu May 14 16:45:37 2026 -0300
>
>      target/riscv/csr.c: fix mstatus.UXL reserved value
>
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 83ca354bf0..d004a4bfb4 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2045,7 +2045,17 @@ static RISCVException write_mstatus(CPURISCVState =
*env, int csrno,
>
>       if (xl !=3D MXL_RV32 || env->debugger) {
>           if ((val & MSTATUS64_UXL) !=3D 0) {
> +            uint64_t uxl =3D val & MSTATUS64_UXL >> 32;
>               mask |=3D MSTATUS64_UXL;
> +
> +            /*
> +             * uxl =3D 3 is reserved so write the current xl instead.
> +             * In case xl =3D MXL_RV128 (3) write MXL_RV64.
> +             */
> +            if (uxl =3D=3D 3) {
> +                uxl =3D xl =3D=3D MXL_RV128 ? MXL_RV64 : xl;
> +                val =3D deposit64(val, 32, 2, uxl);
> +            }
>           }
>       }
>
>
> But that patch fixed just write_mstatus().
>
> I suggest adding a local helper riscv_write_uxl (feel free to choose anot=
her better
> name) to encapsulate this logic and then use it in both mstatus and vssta=
tus to
> write UXL:
>
>   val =3D riscv_write_uxl(val)
>
>
> Thanks,
> Daniel
>
>
>
> > +
> >       if ((env->henvcfg & HENVCFG_DTE)) {
> >           if ((val & SSTATUS_SDT) !=3D 0) {
> >               val &=3D ~SSTATUS_SIE;
>

