Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D66EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 02:52:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9fu-0002tI-KY; Sun, 02 Jul 2023 22:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9fs-0002st-Md; Sun, 02 Jul 2023 22:52:24 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9fq-0005yv-Hc; Sun, 02 Jul 2023 22:52:24 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-440b4b0147bso712466137.1; 
 Sun, 02 Jul 2023 19:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688352741; x=1690944741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nCHHYoqW5kxqqFa+fOUlWhNxnYySrljvgIX0B6vvQZs=;
 b=on5XznQm2KbZkRIedZT4rN8nlfRtHl339bPNyByEO2/RpLKEG4mU0puAiDLrwWo26p
 dSizavbX8wsv0xYilOANNcV02Xt6rJL2LQRyVZy80q5laI8/zX2qmOxvJFz2+qJYNNfk
 QWkeIDX7mCmPTCjsNMwxkoCnRSflm4pP+VHoXVp+XAkBFEUk7jLHx/piPzbDP50ZfSM9
 ZnFbBd9ZEmf8NtdTwWRv5+anskia49nNoYIo3wNr4LeTtoa0ZWdb5ZTJeuqPgQpd/l2b
 AV9zbB4zYyOYmAAKl6msjwkamrShCnGeVwjzDFmRCgFlPLDk6R+BnnC/vz1UJ+Mult+J
 7vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688352741; x=1690944741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nCHHYoqW5kxqqFa+fOUlWhNxnYySrljvgIX0B6vvQZs=;
 b=RslGWpGt9ckszSOIBP+VfCZhU7jhuFQvQRk/2LrCzD9lzaHNV19yXmJVwtcwCcY/zB
 /HOxmtVK/EEAFkpoUzy5tzihzUFGViSHk42YQR4GtAJhloj5+4MY+o9eYQFN47qEK8O4
 T7P9vw97b4elD02NOavwbMpPjbwsixZ/UI7TFs6MG192hb3doGjx5Ux1VNUlVe3DEKey
 OlxCWMj+rq9KOoWh1VoUg81vd6YVG6/8YSibGipaIG+6bOANJ+XqwkaWIXO+Ld1xMxMo
 Yy1wpDHP9frGB/V9FGcFisBQeZTllvNDXzHv6NuJip47SqcPaTslNJpE6/nMPsvHlcyU
 uE4w==
X-Gm-Message-State: ABy/qLaNmzzPGNAufSfFdeJsnNQZK2Jd5W8GsIM98D83aHJk3MU6zw86
 ZvcJ0Mvsjzx1j1PkRlWd5yYF6010mIYf/BUcVxqZqGSdWowbsw==
X-Google-Smtp-Source: APBJJlH0a9n+DoA9NJvyPItzpJv6skDVLAgo2ceHsdYMUaSENfA0Lbe1kaeXpZoy0SL4Mwi76xDG8tUWoXDr8tSaCdE=
X-Received: by 2002:a05:6102:e43:b0:443:72b0:6675 with SMTP id
 p3-20020a0561020e4300b0044372b06675mr2809671vst.16.1688352741131; Sun, 02 Jul
 2023 19:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <06a4543df2aa6101ca9a48f21a3198064b4f1f87.camel@rivosinc.com>
 <CAKmqyKNpE7gCMXqWnxCp58v+aXb=hWswniOTthM7joL+E+1Q_A@mail.gmail.com>
 <0af8f346455e514eeff14f12ef3d22609225fc29.camel@rivosinc.com>
In-Reply-To: <0af8f346455e514eeff14f12ef3d22609225fc29.camel@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 12:51:54 +1000
Message-ID: <CAKmqyKPJAQM=c3qd1SSnKgnWyjwJVcdkzf0sge2wAx0XzAUquA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: Add syscall riscv_hwprobe
To: Robbin Ehn <rehn@rivosinc.com>
Cc: qemu-devel@nongnu.org, palmer@rivosinc.com, laurent@vivier.eu, 
 qemu-riscv@nongnu.org, richard.henderson@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jun 27, 2023 at 10:35=E2=80=AFPM Robbin Ehn <rehn@rivosinc.com> wro=
te:
>
> On Fri, 2023-06-23 at 12:24 +1000, Alistair Francis wrote:
> > On Mon, Jun 19, 2023 at 6:25=E2=80=AFPM Robbin Ehn <rehn@rivosinc.com> =
wrote:
> > >
> > > This patch adds the new syscall for the
> > > "RISC-V Hardware Probing Interface"
> > > (https://docs.kernel.org/riscv/hwprobe.html).
> > >
> > > Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > Signed-off-by: Robbin Ehn <rehn@rivosinc.com>
> >
> > Thanks for the patch!
> >
> > Do you mind re-sending this when 6.4 comes out? I would like it in a
> > kernel release before we pick it up
>
> Hi!
>
> 6.4 is out. This still applies clean, you want me to re-send it anyways?

No need!

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Thanks, Robbin
>
> >
> > Alistair
> >
> > > ---
> > > v1->v2: Moved to syscall.c
> > > v2->v3: Separate function, get/put user
> > > v3->patch
> > > ---
> > >  linux-user/riscv/syscall32_nr.h |   1 +
> > >  linux-user/riscv/syscall64_nr.h |   1 +
> > >  linux-user/syscall.c            | 146 ++++++++++++++++++++++++++++++=
++
> > >  3 files changed, 148 insertions(+)
> > >
> > > diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/sysca=
ll32_nr.h
> > > index 1327d7dffa..412e58e5b2 100644
> > > --- a/linux-user/riscv/syscall32_nr.h
> > > +++ b/linux-user/riscv/syscall32_nr.h
> > > @@ -228,6 +228,7 @@
> > >  #define TARGET_NR_accept4 242
> > >  #define TARGET_NR_arch_specific_syscall 244
> > >  #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscal=
l + 15)
> > > +#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 1=
4)
> > >  #define TARGET_NR_prlimit64 261
> > >  #define TARGET_NR_fanotify_init 262
> > >  #define TARGET_NR_fanotify_mark 263
> > > diff --git a/linux-user/riscv/syscall64_nr.h b/linux-user/riscv/sysca=
ll64_nr.h
> > > index 6659751933..29e1eb2075 100644
> > > --- a/linux-user/riscv/syscall64_nr.h
> > > +++ b/linux-user/riscv/syscall64_nr.h
> > > @@ -251,6 +251,7 @@
> > >  #define TARGET_NR_recvmmsg 243
> > >  #define TARGET_NR_arch_specific_syscall 244
> > >  #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscal=
l + 15)
> > > +#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 1=
4)
> > >  #define TARGET_NR_wait4 260
> > >  #define TARGET_NR_prlimit64 261
> > >  #define TARGET_NR_fanotify_init 262
> > > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > > index f2cb101d83..55becf3666 100644
> > > --- a/linux-user/syscall.c
> > > +++ b/linux-user/syscall.c
> > > @@ -8874,6 +8874,147 @@ static int do_getdents64(abi_long dirfd, abi_=
long arg2, abi_long count)
> > >  }
> > >  #endif /* TARGET_NR_getdents64 */
> > >
> > > +#if defined(TARGET_NR_riscv_hwprobe)
> > > +
> > > +#define RISCV_HWPROBE_KEY_MVENDORID     0
> > > +#define RISCV_HWPROBE_KEY_MARCHID       1
> > > +#define RISCV_HWPROBE_KEY_MIMPID        2
> > > +
> > > +#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR 3
> > > +#define     RISCV_HWPROBE_BASE_BEHAVIOR_IMA (1 << 0)
> > > +
> > > +#define RISCV_HWPROBE_KEY_IMA_EXT_0     4
> > > +#define     RISCV_HWPROBE_IMA_FD       (1 << 0)
> > > +#define     RISCV_HWPROBE_IMA_C        (1 << 1)
> > > +
> > > +#define RISCV_HWPROBE_KEY_CPUPERF_0     5
> > > +#define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> > > +#define     RISCV_HWPROBE_MISALIGNED_EMULATED    (1 << 0)
> > > +#define     RISCV_HWPROBE_MISALIGNED_SLOW        (2 << 0)
> > > +#define     RISCV_HWPROBE_MISALIGNED_FAST        (3 << 0)
> > > +#define     RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
> > > +#define     RISCV_HWPROBE_MISALIGNED_MASK        (7 << 0)
> > > +
> > > +struct riscv_hwprobe {
> > > +    abi_llong  key;
> > > +    abi_ullong value;
> > > +};
> > > +
> > > +static void risc_hwprobe_fill_pairs(CPURISCVState *env,
> > > +                                    struct riscv_hwprobe *pair,
> > > +                                    size_t pair_count)
> > > +{
> > > +    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
> > > +
> > > +    for (; pair_count > 0; pair_count--, pair++) {
> > > +        abi_llong key;
> > > +        abi_ullong value;
> > > +        __put_user(0, &pair->value);
> > > +        __get_user(key, &pair->key);
> > > +        switch (key) {
> > > +        case RISCV_HWPROBE_KEY_MVENDORID:
> > > +            __put_user(cfg->mvendorid, &pair->value);
> > > +            break;
> > > +        case RISCV_HWPROBE_KEY_MARCHID:
> > > +            __put_user(cfg->marchid, &pair->value);
> > > +            break;
> > > +        case RISCV_HWPROBE_KEY_MIMPID:
> > > +            __put_user(cfg->mimpid, &pair->value);
> > > +            break;
> > > +        case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> > > +            value =3D riscv_has_ext(env, RVI) &&
> > > +                    riscv_has_ext(env, RVM) &&
> > > +                    riscv_has_ext(env, RVA) ?
> > > +                    RISCV_HWPROBE_BASE_BEHAVIOR_IMA : 0;
> > > +            __put_user(value, &pair->value);
> > > +            break;
> > > +        case RISCV_HWPROBE_KEY_IMA_EXT_0:
> > > +            value =3D riscv_has_ext(env, RVF) &&
> > > +                    riscv_has_ext(env, RVD) ?
> > > +                    RISCV_HWPROBE_IMA_FD : 0;
> > > +            value |=3D riscv_has_ext(env, RVC) ?
> > > +                     RISCV_HWPROBE_IMA_C : pair->value;
> > > +            __put_user(value, &pair->value);
> > > +            break;
> > > +        case RISCV_HWPROBE_KEY_CPUPERF_0:
> > > +            __put_user(RISCV_HWPROBE_MISALIGNED_FAST, &pair->value);
> > > +            break;
> > > +        default:
> > > +            __put_user(-1, &pair->key);
> > > +            break;
> > > +        }
> > > +    }
> > > +}
> > > +
> > > +static int cpu_set_valid(abi_long arg3, abi_long arg4)
> > > +{
> > > +    int ret, i, tmp;
> > > +    size_t host_mask_size, target_mask_size;
> > > +    unsigned long *host_mask;
> > > +
> > > +    /*
> > > +     * cpu_set_t represent CPU masks as bit masks of type unsigned l=
ong *.
> > > +     * arg3 contains the cpu count.
> > > +     */
> > > +    tmp =3D (8 * sizeof(abi_ulong));
> > > +    target_mask_size =3D ((arg3 + tmp - 1) / tmp) * sizeof(abi_ulong=
);
> > > +    host_mask_size =3D (target_mask_size + (sizeof(*host_mask) - 1))=
 &
> > > +                     ~(sizeof(*host_mask) - 1);
> > > +
> > > +    host_mask =3D alloca(host_mask_size);
> > > +
> > > +    ret =3D target_to_host_cpu_mask(host_mask, host_mask_size,
> > > +                                  arg4, target_mask_size);
> > > +    if (ret !=3D 0) {
> > > +        return ret;
> > > +    }
> > > +
> > > +    for (i =3D 0 ; i < host_mask_size / sizeof(*host_mask); i++) {
> > > +        if (host_mask[i] !=3D 0) {
> > > +            return 0;
> > > +        }
> > > +    }
> > > +    return -TARGET_EINVAL;
> > > +}
> > > +
> > > +static abi_long do_riscv_hwprobe(CPUArchState *cpu_env, abi_long arg=
1,
> > > +                                 abi_long arg2, abi_long arg3,
> > > +                                 abi_long arg4, abi_long arg5)
> > > +{
> > > +    int ret;
> > > +    struct riscv_hwprobe *host_pairs;
> > > +
> > > +    /* flags must be 0 */
> > > +    if (arg5 !=3D 0) {
> > > +        return -TARGET_EINVAL;
> > > +    }
> > > +
> > > +    /* check cpu_set */
> > > +    if (arg3 !=3D 0) {
> > > +        ret =3D cpu_set_valid(arg3, arg4);
> > > +        if (ret !=3D 0) {
> > > +            return ret;
> > > +        }
> > > +    } else if (arg4 !=3D 0) {
> > > +        return -TARGET_EINVAL;
> > > +    }
> > > +
> > > +    /* no pairs */
> > > +    if (arg2 =3D=3D 0) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    host_pairs =3D lock_user(VERIFY_WRITE, arg1,
> > > +                           sizeof(*host_pairs) * (size_t)arg2, 0);
> > > +    if (host_pairs =3D=3D NULL) {
> > > +        return -TARGET_EFAULT;
> > > +    }
> > > +    risc_hwprobe_fill_pairs(cpu_env, host_pairs, arg2);
> > > +    unlock_user(host_pairs, arg1, sizeof(*host_pairs) * (size_t)arg2=
);
> > > +    return 0;
> > > +}
> > > +#endif /* TARGET_NR_riscv_hwprobe */
> > > +
> > >  #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
> > >  _syscall2(int, pivot_root, const char *, new_root, const char *, put=
_old)
> > >  #endif
> > > @@ -13571,6 +13712,11 @@ static abi_long do_syscall1(CPUArchState *cp=
u_env, int num, abi_long arg1,
> > >          return ret;
> > >  #endif
> > >
> > > +#if defined(TARGET_NR_riscv_hwprobe)
> > > +    case TARGET_NR_riscv_hwprobe:
> > > +        return do_riscv_hwprobe(cpu_env, arg1, arg2, arg3, arg4, arg=
5);
> > > +#endif
> > > +
> > >      default:
> > >          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
> > >          return -TARGET_ENOSYS;
> > > --
> > > 2.39.2
> > >
> > >
>

