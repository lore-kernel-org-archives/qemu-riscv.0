Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321BFEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 12:35:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE7up-00014d-Sc; Tue, 27 Jun 2023 08:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1qE7uk-00013D-F8
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 08:35:24 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1qE7ub-00076S-VO
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 08:35:20 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so5513340e87.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 05:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687869308; x=1690461308; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nSlPFv4xsGFp7sT3StespzX3zM8bJK9dIseoY9yP/rk=;
 b=fFBunD/K1aKt1HbuQOYAu5xJcm99tu13PLZ9I7KS2e3auSVKmurNiR6x9dZuj7MtZL
 DViwTB56QLqXj9GwZtRY7aSp3eLF0+wutbXhTT1gKn/sUTJIgLYx6Zzphq1wXZEzxzgA
 Pp9+D3KcB464artJz0t09vOQ56JSNtTnzutQIHeoBH5kj1DEd8KaPkFa6pgEoCwZh4w2
 l0pld4ReDKSmK3Vi060Vv+bTZ4Cu807WBI7FlTGGZxNqA5bE4GobQilNYiDfrLtePuLT
 Pn3DHzR9operBjquAAdt6xprxicYw9LUVqUSsqagbMlt1aiyBvXn3gEYefBKiGZoYzsW
 HFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687869308; x=1690461308;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nSlPFv4xsGFp7sT3StespzX3zM8bJK9dIseoY9yP/rk=;
 b=I9ro2a6Igja82zX6qQ6DWDKtUoaEehRGniYvu6SdefkPCekIgmPSO1xon7Dh5v2AnK
 LoXjmhnlt8+N1FfmSyrHOKw1EQEI2y7/fC880a/19/a0H8umRd4ddZlP2Igt4RXQek5f
 /y5rWUgstWlH6QH0CXu8JbC4wEyfCbgds8/DkBF9v0u77QjQZBRvR+XiE4eNJ8PGq4Xg
 8HSyXPOFQL1h4TEIloye91dXRUNSrNiJgxNo6C67QKdZ0/umaeo1/eikw9Yq6Hw0rIZM
 5mGVRoE/f7iLepmr6S/ksHz9jF92LnFNLX/Ze6kDrjxn8nyMbauluVO0SFSFLhO01QcA
 nfdg==
X-Gm-Message-State: AC+VfDwE0ibHkfzqWE/uovh2TRqC9kjsUBMWr4BW0coFWSRhCfjTJ39b
 rf8+EW4kTE+fdYxp0fgSFi2npg==
X-Google-Smtp-Source: ACHHUZ7PYCXH0zb5S0rhu2dxqQPtaLTpTeP9mEHIEOleENXWd9YLJozqbcpCPzeIlIuoUlFMi3wuwA==
X-Received: by 2002:a05:6512:110a:b0:4fb:7bf8:51c8 with SMTP id
 l10-20020a056512110a00b004fb7bf851c8mr902255lfg.1.1687869307866; 
 Tue, 27 Jun 2023 05:35:07 -0700 (PDT)
Received: from [192.168.50.45] (h-155-4-92-80.A980.priv.bahnhof.se.
 [155.4.92.80]) by smtp.gmail.com with ESMTPSA id
 r1-20020a19ac41000000b004f8416892f1sm1480030lfc.87.2023.06.27.05.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 05:35:07 -0700 (PDT)
Message-ID: <0af8f346455e514eeff14f12ef3d22609225fc29.camel@rivosinc.com>
Subject: Re: [PATCH] linux-user/riscv: Add syscall riscv_hwprobe
From: Robbin Ehn <rehn@rivosinc.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, palmer@rivosinc.com, laurent@vivier.eu, 
 qemu-riscv@nongnu.org, richard.henderson@linaro.org, ajones@ventanamicro.com
Date: Tue, 27 Jun 2023 14:35:06 +0200
In-Reply-To: <CAKmqyKNpE7gCMXqWnxCp58v+aXb=hWswniOTthM7joL+E+1Q_A@mail.gmail.com>
References: <06a4543df2aa6101ca9a48f21a3198064b4f1f87.camel@rivosinc.com>
 <CAKmqyKNpE7gCMXqWnxCp58v+aXb=hWswniOTthM7joL+E+1Q_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=rehn@rivosinc.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 2023-06-23 at 12:24 +1000, Alistair Francis wrote:
> On Mon, Jun 19, 2023 at 6:25=E2=80=AFPM Robbin Ehn <rehn@rivosinc.com> wr=
ote:
> >=20
> > This patch adds the new syscall for the
> > "RISC-V Hardware Probing Interface"
> > (https://docs.kernel.org/riscv/hwprobe.html).
> >=20
> > Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Robbin Ehn <rehn@rivosinc.com>
>=20
> Thanks for the patch!
>=20
> Do you mind re-sending this when 6.4 comes out? I would like it in a
> kernel release before we pick it up

Hi!

6.4 is out. This still applies clean, you want me to re-send it anyways?

Thanks, Robbin

>=20
> Alistair
>=20
> > ---
> > v1->v2: Moved to syscall.c
> > v2->v3: Separate function, get/put user
> > v3->patch
> > ---
> >  linux-user/riscv/syscall32_nr.h |   1 +
> >  linux-user/riscv/syscall64_nr.h |   1 +
> >  linux-user/syscall.c            | 146 ++++++++++++++++++++++++++++++++
> >  3 files changed, 148 insertions(+)
> >=20
> > diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/syscall=
32_nr.h
> > index 1327d7dffa..412e58e5b2 100644
> > --- a/linux-user/riscv/syscall32_nr.h
> > +++ b/linux-user/riscv/syscall32_nr.h
> > @@ -228,6 +228,7 @@
> >  #define TARGET_NR_accept4 242
> >  #define TARGET_NR_arch_specific_syscall 244
> >  #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall =
+ 15)
> > +#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 14)
> >  #define TARGET_NR_prlimit64 261
> >  #define TARGET_NR_fanotify_init 262
> >  #define TARGET_NR_fanotify_mark 263
> > diff --git a/linux-user/riscv/syscall64_nr.h b/linux-user/riscv/syscall=
64_nr.h
> > index 6659751933..29e1eb2075 100644
> > --- a/linux-user/riscv/syscall64_nr.h
> > +++ b/linux-user/riscv/syscall64_nr.h
> > @@ -251,6 +251,7 @@
> >  #define TARGET_NR_recvmmsg 243
> >  #define TARGET_NR_arch_specific_syscall 244
> >  #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall =
+ 15)
> > +#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 14)
> >  #define TARGET_NR_wait4 260
> >  #define TARGET_NR_prlimit64 261
> >  #define TARGET_NR_fanotify_init 262
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index f2cb101d83..55becf3666 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -8874,6 +8874,147 @@ static int do_getdents64(abi_long dirfd, abi_lo=
ng arg2, abi_long count)
> >  }
> >  #endif /* TARGET_NR_getdents64 */
> >=20
> > +#if defined(TARGET_NR_riscv_hwprobe)
> > +
> > +#define RISCV_HWPROBE_KEY_MVENDORID     0
> > +#define RISCV_HWPROBE_KEY_MARCHID       1
> > +#define RISCV_HWPROBE_KEY_MIMPID        2
> > +
> > +#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR 3
> > +#define     RISCV_HWPROBE_BASE_BEHAVIOR_IMA (1 << 0)
> > +
> > +#define RISCV_HWPROBE_KEY_IMA_EXT_0     4
> > +#define     RISCV_HWPROBE_IMA_FD       (1 << 0)
> > +#define     RISCV_HWPROBE_IMA_C        (1 << 1)
> > +
> > +#define RISCV_HWPROBE_KEY_CPUPERF_0     5
> > +#define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> > +#define     RISCV_HWPROBE_MISALIGNED_EMULATED    (1 << 0)
> > +#define     RISCV_HWPROBE_MISALIGNED_SLOW        (2 << 0)
> > +#define     RISCV_HWPROBE_MISALIGNED_FAST        (3 << 0)
> > +#define     RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
> > +#define     RISCV_HWPROBE_MISALIGNED_MASK        (7 << 0)
> > +
> > +struct riscv_hwprobe {
> > +    abi_llong  key;
> > +    abi_ullong value;
> > +};
> > +
> > +static void risc_hwprobe_fill_pairs(CPURISCVState *env,
> > +                                    struct riscv_hwprobe *pair,
> > +                                    size_t pair_count)
> > +{
> > +    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
> > +
> > +    for (; pair_count > 0; pair_count--, pair++) {
> > +        abi_llong key;
> > +        abi_ullong value;
> > +        __put_user(0, &pair->value);
> > +        __get_user(key, &pair->key);
> > +        switch (key) {
> > +        case RISCV_HWPROBE_KEY_MVENDORID:
> > +            __put_user(cfg->mvendorid, &pair->value);
> > +            break;
> > +        case RISCV_HWPROBE_KEY_MARCHID:
> > +            __put_user(cfg->marchid, &pair->value);
> > +            break;
> > +        case RISCV_HWPROBE_KEY_MIMPID:
> > +            __put_user(cfg->mimpid, &pair->value);
> > +            break;
> > +        case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> > +            value =3D riscv_has_ext(env, RVI) &&
> > +                    riscv_has_ext(env, RVM) &&
> > +                    riscv_has_ext(env, RVA) ?
> > +                    RISCV_HWPROBE_BASE_BEHAVIOR_IMA : 0;
> > +            __put_user(value, &pair->value);
> > +            break;
> > +        case RISCV_HWPROBE_KEY_IMA_EXT_0:
> > +            value =3D riscv_has_ext(env, RVF) &&
> > +                    riscv_has_ext(env, RVD) ?
> > +                    RISCV_HWPROBE_IMA_FD : 0;
> > +            value |=3D riscv_has_ext(env, RVC) ?
> > +                     RISCV_HWPROBE_IMA_C : pair->value;
> > +            __put_user(value, &pair->value);
> > +            break;
> > +        case RISCV_HWPROBE_KEY_CPUPERF_0:
> > +            __put_user(RISCV_HWPROBE_MISALIGNED_FAST, &pair->value);
> > +            break;
> > +        default:
> > +            __put_user(-1, &pair->key);
> > +            break;
> > +        }
> > +    }
> > +}
> > +
> > +static int cpu_set_valid(abi_long arg3, abi_long arg4)
> > +{
> > +    int ret, i, tmp;
> > +    size_t host_mask_size, target_mask_size;
> > +    unsigned long *host_mask;
> > +
> > +    /*
> > +     * cpu_set_t represent CPU masks as bit masks of type unsigned lon=
g *.
> > +     * arg3 contains the cpu count.
> > +     */
> > +    tmp =3D (8 * sizeof(abi_ulong));
> > +    target_mask_size =3D ((arg3 + tmp - 1) / tmp) * sizeof(abi_ulong);
> > +    host_mask_size =3D (target_mask_size + (sizeof(*host_mask) - 1)) &
> > +                     ~(sizeof(*host_mask) - 1);
> > +
> > +    host_mask =3D alloca(host_mask_size);
> > +
> > +    ret =3D target_to_host_cpu_mask(host_mask, host_mask_size,
> > +                                  arg4, target_mask_size);
> > +    if (ret !=3D 0) {
> > +        return ret;
> > +    }
> > +
> > +    for (i =3D 0 ; i < host_mask_size / sizeof(*host_mask); i++) {
> > +        if (host_mask[i] !=3D 0) {
> > +            return 0;
> > +        }
> > +    }
> > +    return -TARGET_EINVAL;
> > +}
> > +
> > +static abi_long do_riscv_hwprobe(CPUArchState *cpu_env, abi_long arg1,
> > +                                 abi_long arg2, abi_long arg3,
> > +                                 abi_long arg4, abi_long arg5)
> > +{
> > +    int ret;
> > +    struct riscv_hwprobe *host_pairs;
> > +
> > +    /* flags must be 0 */
> > +    if (arg5 !=3D 0) {
> > +        return -TARGET_EINVAL;
> > +    }
> > +
> > +    /* check cpu_set */
> > +    if (arg3 !=3D 0) {
> > +        ret =3D cpu_set_valid(arg3, arg4);
> > +        if (ret !=3D 0) {
> > +            return ret;
> > +        }
> > +    } else if (arg4 !=3D 0) {
> > +        return -TARGET_EINVAL;
> > +    }
> > +
> > +    /* no pairs */
> > +    if (arg2 =3D=3D 0) {
> > +        return 0;
> > +    }
> > +
> > +    host_pairs =3D lock_user(VERIFY_WRITE, arg1,
> > +                           sizeof(*host_pairs) * (size_t)arg2, 0);
> > +    if (host_pairs =3D=3D NULL) {
> > +        return -TARGET_EFAULT;
> > +    }
> > +    risc_hwprobe_fill_pairs(cpu_env, host_pairs, arg2);
> > +    unlock_user(host_pairs, arg1, sizeof(*host_pairs) * (size_t)arg2);
> > +    return 0;
> > +}
> > +#endif /* TARGET_NR_riscv_hwprobe */
> > +
> >  #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
> >  _syscall2(int, pivot_root, const char *, new_root, const char *, put_o=
ld)
> >  #endif
> > @@ -13571,6 +13712,11 @@ static abi_long do_syscall1(CPUArchState *cpu_=
env, int num, abi_long arg1,
> >          return ret;
> >  #endif
> >=20
> > +#if defined(TARGET_NR_riscv_hwprobe)
> > +    case TARGET_NR_riscv_hwprobe:
> > +        return do_riscv_hwprobe(cpu_env, arg1, arg2, arg3, arg4, arg5)=
;
> > +#endif
> > +
> >      default:
> >          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
> >          return -TARGET_ENOSYS;
> > --
> > 2.39.2
> >=20
> >=20


