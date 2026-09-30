Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7088CA5FB1
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 07:54:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBp8c-0008Ff-4U; Wed, 30 Sep 2026 03:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBp8Z-0008ER-8S
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 03:53:59 -0400
Received: from mail-ed2-x29.google.com ([2a00:1450:4864:33::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBp8X-0005Hs-8n
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 03:53:58 -0400
Received: by mail-ed2-x29.google.com with SMTP id
 4fb4d7f45d1cf-6aa0ee64afdso6050733a12.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 00:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790754836; cv=none;
 d=google.com; s=arc-20260327;
 b=ZqpaNBfs8hxCEoi/LqyIJK34hPqfdUwFexFT4KXYvRxmyJ9xTpjhiBzdrcplrnz4pd
 YyYxSW0QcUxRLAwS2R1bYeTbm9JX1yuvgOJo6Zx12p77viDbY7/q0r5e7jH3GdHLLxgV
 ykfdC8erN+pv69f5m15c2Mdl3G4kVaK29u2nTRM3xW0yKRkTHuP+PKN0Ywp7ZQxOMmGS
 v7VkRgy70MS/Ob6iDuhf9SDJ/IsHyyEbdkxboiNj8SQNqe/Epwu6jt9MC0MCx7ZD3GVF
 G5SsM2X3900aONAZ3CTwJ4OVuaqdfHkmIM/ajAeyeKg9Bqxd6dWdX+TBF3oTzvVKhJKw
 0gVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=DbIPhEl6hnumKe3veCA6SZ0VYwnMfD336BtRhx0BWmw=;
 fh=/vH8bm5usYg/thG8ARdxUmOJcE/q+pE1L+XsElub6T0=;
 b=kv9aDIusCROVsSDo4m2moYE/PWjT9pttzv3QqkDb3LWi+2aJiWYcuyL+xNtylLv2kU
 t01n+WZzjPTjFe2J9ZShF18a6XgP4L/zAD2gWhb3FFlwvur+u2XtGk1Z3+UynG5+u2aR
 WwRrs4M1NyDATwvuzEfwRY4YPOTLvBX4OhChmWVdCCO8N6Eg4OSf8uOCOUiEtAfdFVLJ
 jYic7T5lBVFZuMWqWG3qR/Mu23zdy6fWkuOJidu8Nde8Ckyeouhk0r5qui5AKADBVXKJ
 uyOBazzIP+s9aVLvgs4P7/HLmL/1eFWbiaAiW1l7pTbsM7XeqGx2VcW3MDEGcKQN6zgj
 wEiw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790754836; x=1791359636; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DbIPhEl6hnumKe3veCA6SZ0VYwnMfD336BtRhx0BWmw=;
 b=WxbBNzBb3hsysFFJstEAmbkFeUxH1FG51lUmdInhIVG3L5SoHXYfvJ3/T1l4n5xo5i
 zVT+bR+aDxHmDpH//orGBSyvMEQE8aWh/83iDxmHe459fEUlgKYr/NynqFDl3+fq4iIw
 OjlhEunvgVuVHCipVEJf2rb+VmvD3vnQ5aSxFGnK4k9dJriUbJDFdLYCv1voHLieuZLw
 XsQQpx+NteMxn6xOAu0dbPvxMid+WF8M6V8v2dTjhX+Bhae2mzDYURbb7Aqu4UGmXkZ/
 Pd8fxhK10B3Z5xShnRYwbwQ2fzdF4+uneQPzYuASUIh8f919g1bHg3hOI0OOjXWMjj0y
 vIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790754836; x=1791359636;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DbIPhEl6hnumKe3veCA6SZ0VYwnMfD336BtRhx0BWmw=;
 b=OI+lNWPhxBtBtjDLhGNNK0KHIjsA20FfX2p2jnz0E8VCSpLIpw1xV40zzpvaou/bD3
 En3D1cKaIAWNuMIpAoyjg6rZ0xR+phDrqT0J4LES+skoglT7boL60sWEU1/oI67OB8Qz
 TMaQ+DvyT12ZlKi4CWG4mG0E81WonglkzTG0VeZ2vu24dZujAp12r2OHjU9DhpKmKGdZ
 JRPXnP3UEDSvCT9+fL9uETTFEcAUrwKTwL579dVcAEEhkT20SVT36Gq5QdFSNQV4SODD
 keoSFvt8l1S0J5maM7J44opRAqMlQzGBgty3H7chUxm2StVf/KYQUQHko4yeltjCiagi
 /gOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzk7yCs438/EbbxRWFAUK0Sbf4rf3P6wK2lvP6flXbJNiITqugODa4gx8rGfRa4W3FsCSOv9mzVX8P0@nongnu.org
X-Gm-Message-State: AFq9FYLPtgzJA+K0AYCigs00RvobKh2wlHm9HKdDjYxKq5/iPWwxOKk3
 58wn1zPeTLhQ0h67YABwoa4VnDZZ2TQs0JuV8fEumdv9wUhe2eYFtEyABEGwsT4H5abHAq90QVP
 m0ng/2hdllZFKc10Qny9kuRfi8VPoJcc=
X-Gm-Gg: AYBFou2QStJBuDwxPS/VdkgSTeOONuMtslsbGee+nVXXjr/91A99Uju6+x2b2lidESr
 3qJ6zOMbQ71iOVJ7iN1Snyp8KbGXFOlzwn0D4StTVTtacCdsTlgOHU2xg13pLvZQOSlCipLi5HG
 pwWUV4qXL8kAOxo2XvGk2TRFByTjuQi0fNA1L7vVBYKDFR8aSsjrZdvXSZ64H72nmm+KAaApkmi
 bhGUD/dl5yoH6x85QRhed7wxgT24VIyekahPwBzxL1mv/4Fh1Z5SvtpsEPM6DR3yZ8mD4q+bHlo
 Iw8gLeZAxQJbRpyM8DEnOpuU8NKgG9VrKa6kMVSC1PrXej8kXQSQIB4=
X-Received: by 2002:a05:6402:324e:b0:6aa:fce2:7b30 with SMTP id
 4fb4d7f45d1cf-6ae1994611amr233447a12.18.1790754835426; Wed, 30 Sep 2026
 00:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260928052051.251-1-luoyonggang@gmail.com>
 <20260928052051.251-3-luoyonggang@gmail.com>
 <c7aadc02-6c5e-4ca1-875c-43050305f4ec@oss.qualcomm.com>
In-Reply-To: <c7aadc02-6c5e-4ca1-875c-43050305f4ec@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 30 Sep 2026 15:53:42 +0800
X-Gm-Features: AclHuK_AkJAslhEUYFEZ-FPW4v9lx98bN-SlXHVMCqGpvmbaqz9tw62QlduK1BU
Message-ID: <CAE2XoE-C15Y7MjqVCRdpqs=hBLw7+buGJWXdKei37WC7kQkkHg@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] accel/tcg: add cpu_loop_exit_excp
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Chao Liu <chao.liu@processmission.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, 
 Glenn Miles <milesg@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, 
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::29;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Sep 29, 2026 at 1:23=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 28/9/26 07:20, Yonggang Luo wrote:
> > Add cpu_loop_exit_excp next to cpu_loop_exit_restore. Set
> > cpu->exception_index, then restore and exit the current TB the same
> > way as cpu_loop_exit_restore.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >   accel/tcg/cpu-exec-common.c  |  6 ++++++
> >   include/accel/tcg/cpu-loop.h | 12 ++++++++++++
> >   2 files changed, 18 insertions(+)
> >
> > diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> > index d20cece1c5f..31fed8e497f 100644
> > --- a/accel/tcg/cpu-exec-common.c
> > +++ b/accel/tcg/cpu-exec-common.c
> > @@ -118,6 +118,12 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_=
t pc)
> >       cpu_loop_exit(cpu);
> >   }
> >
> > +void cpu_loop_exit_excp(CPUState *cpu, int exception_index, uintptr_t =
pc)
> > +{
> > +    cpu->exception_index =3D exception_index;
> > +    cpu_loop_exit_restore(cpu, pc);
> > +}
> > +
> >   void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
> >   {
> >       /* Prevent looping if already executing in a serial context. */
> > diff --git a/include/accel/tcg/cpu-loop.h b/include/accel/tcg/cpu-loop.=
h
> > index f4d38bc2bca..856091020f2 100644
> > --- a/include/accel/tcg/cpu-loop.h
> > +++ b/include/accel/tcg/cpu-loop.h
> > @@ -65,6 +65,18 @@ G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
> >   G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t host_p=
c);
> >   G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t host_pc=
);
> >
> > +/**
> > + * cpu_loop_exit_excp:
> > + * @cpu: the cpu context
> > + * @exception_index: EXCP_* or target trap number
> > + * @host_pc: the host pc within the translation
>
> I'm not comfortable this is hidding the 'restore' part,
> not even mentioning no restore is done if host_pc=3D=3D0.

After thinking, maybe it should be cpu_raise_excp and cpu_raise_excp_restor=
e
That match the accel/tcg: add raise_excp and raise_excp_restore helpers?


>
> > + *
> > + * Set cpu->exception_index and exit the current TB, restoring
> > + * guest state from @host_pc the same way as cpu_loop_exit_restore.
> > + */
> > +G_NORETURN void cpu_loop_exit_excp(CPUState *cpu, int exception_index,
> > +                                   uintptr_t host_pc);
> > +
> >   /**
> >    * cpu_loop_exit:
> >    * @cpu: the cpu context
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

