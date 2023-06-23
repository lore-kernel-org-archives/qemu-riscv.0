Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A3EB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 02:25:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCWUI-0003i1-D3; Thu, 22 Jun 2023 22:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qCWUF-0003h8-LZ; Thu, 22 Jun 2023 22:25:23 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qCWUD-0002vs-MG; Thu, 22 Jun 2023 22:25:23 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-78cbc8176c7so33679241.0; 
 Thu, 22 Jun 2023 19:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687487120; x=1690079120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZFJ6gvOhAG5QNiKDGGglRJ492mNGYez3M3ULUZ/TUu0=;
 b=RO+C9AGd5jx5EgXqvHycn1QNnpjDfMPzh8u34cvp0pvVHTJmfWjSm8P24v6e0L98KB
 sx8TJs09qI98aVMmhb43BASkA6VehmwnEP3saGEdB+XexR4hzaLfqxWueERNuL/QDxrY
 kMzvsC8rS9xRvOheX/WpjbYeYZpDhF7Ed2DNcBGkbsuXD9Qzr/ojvWNfJFu/mYjaMfQD
 vDa61NP4/lGh8GHfCJn/uhn6HLyT++H2ckItjyAnXrKFpHJCrrOJrmyxVkZt1OvUqcds
 oManEs4uuEFmMQCdjXjiGkaE1oRx8x4py1RN8mU4wI82NNILM22e5oVjUlMJ9cFr+Y0G
 uECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687487120; x=1690079120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZFJ6gvOhAG5QNiKDGGglRJ492mNGYez3M3ULUZ/TUu0=;
 b=dacABh02NNIYWjRo02UbJgnH1jXsjc4uZkjqz5EI0W360rtuiUAkc7BjPPWcQYi2zk
 5Lg5EZ9SdIuYoL/O2PLHavsfUXn91myAaDFPCoNDbOoWQoYsZmd1HaBv5c74SBExDFx8
 6GeDS8263ihEeAKs91de0hur/aqd6IVQ93N2zrc7rsd4uhX8vK3jGfCF3ll3a6xaH7dd
 wUMgqZ+8dMXrnn+zeTA4Lp1k08KcER6oRJQ0FK1UtuAigpj7NVSeXmbPMhWKEms2H/DL
 Xf5n3XS0ibl7NlGg0IdA2rmkpILN4PzvIqpqQP6Hx5A0CWNN2D75iA+Cn+6yghREFikU
 9oEw==
X-Gm-Message-State: AC+VfDzwnRTx8PmGC317lq1fgR50O+DZ7s7BFSIC17aqqnJC/4OnJ+xg
 FykkUB3+Pxx1PtkzEj3WxYwj122SmF+I4uThyIzEhu836LqB+g==
X-Google-Smtp-Source: ACHHUZ4cw7l1MoJbMmsaE90SUEgk8/dGr3UFh5xEUngt78jlQbMv63jzF0fGJibiqPjA6s7lstDCbJPVQYqTCha4OkM=
X-Received: by 2002:a1f:cf02:0:b0:471:849b:ae2d with SMTP id
 f2-20020a1fcf02000000b00471849bae2dmr8294626vkg.1.1687487120147; Thu, 22 Jun
 2023 19:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <06a4543df2aa6101ca9a48f21a3198064b4f1f87.camel@rivosinc.com>
In-Reply-To: <06a4543df2aa6101ca9a48f21a3198064b4f1f87.camel@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Jun 2023 12:24:54 +1000
Message-ID: <CAKmqyKNpE7gCMXqWnxCp58v+aXb=hWswniOTthM7joL+E+1Q_A@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: Add syscall riscv_hwprobe
To: Robbin Ehn <rehn@rivosinc.com>
Cc: qemu-devel@nongnu.org, palmer@rivosinc.com, laurent@vivier.eu, 
 qemu-riscv@nongnu.org, richard.henderson@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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

On Mon, Jun 19, 2023 at 6:25=E2=80=AFPM Robbin Ehn <rehn@rivosinc.com> wrot=
e:
>
> This patch adds the new syscall for the
> "RISC-V Hardware Probing Interface"
> (https://docs.kernel.org/riscv/hwprobe.html).
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Robbin Ehn <rehn@rivosinc.com>

Thanks for the patch!

Do you mind re-sending this when 6.4 comes out? I would like it in a
kernel release before we pick it up

Alistair

> ---
> v1->v2: Moved to syscall.c
> v2->v3: Separate function, get/put user
> v3->patch
> ---
>  linux-user/riscv/syscall32_nr.h |   1 +
>  linux-user/riscv/syscall64_nr.h |   1 +
>  linux-user/syscall.c            | 146 ++++++++++++++++++++++++++++++++
>  3 files changed, 148 insertions(+)
>
> diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/syscall32=
_nr.h
> index 1327d7dffa..412e58e5b2 100644
> --- a/linux-user/riscv/syscall32_nr.h
> +++ b/linux-user/riscv/syscall32_nr.h
> @@ -228,6 +228,7 @@
>  #define TARGET_NR_accept4 242
>  #define TARGET_NR_arch_specific_syscall 244
>  #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall + =
15)
> +#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 14)
>  #define TARGET_NR_prlimit64 261
>  #define TARGET_NR_fanotify_init 262
>  #define TARGET_NR_fanotify_mark 263
> diff --git a/linux-user/riscv/syscall64_nr.h b/linux-user/riscv/syscall64=
_nr.h
> index 6659751933..29e1eb2075 100644
> --- a/linux-user/riscv/syscall64_nr.h
> +++ b/linux-user/riscv/syscall64_nr.h
> @@ -251,6 +251,7 @@
>  #define TARGET_NR_recvmmsg 243
>  #define TARGET_NR_arch_specific_syscall 244
>  #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall + =
15)
> +#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 14)
>  #define TARGET_NR_wait4 260
>  #define TARGET_NR_prlimit64 261
>  #define TARGET_NR_fanotify_init 262
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f2cb101d83..55becf3666 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8874,6 +8874,147 @@ static int do_getdents64(abi_long dirfd, abi_long=
 arg2, abi_long count)
>  }
>  #endif /* TARGET_NR_getdents64 */
>
> +#if defined(TARGET_NR_riscv_hwprobe)
> +
> +#define RISCV_HWPROBE_KEY_MVENDORID     0
> +#define RISCV_HWPROBE_KEY_MARCHID       1
> +#define RISCV_HWPROBE_KEY_MIMPID        2
> +
> +#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR 3
> +#define     RISCV_HWPROBE_BASE_BEHAVIOR_IMA (1 << 0)
> +
> +#define RISCV_HWPROBE_KEY_IMA_EXT_0     4
> +#define     RISCV_HWPROBE_IMA_FD       (1 << 0)
> +#define     RISCV_HWPROBE_IMA_C        (1 << 1)
> +
> +#define RISCV_HWPROBE_KEY_CPUPERF_0     5
> +#define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> +#define     RISCV_HWPROBE_MISALIGNED_EMULATED    (1 << 0)
> +#define     RISCV_HWPROBE_MISALIGNED_SLOW        (2 << 0)
> +#define     RISCV_HWPROBE_MISALIGNED_FAST        (3 << 0)
> +#define     RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
> +#define     RISCV_HWPROBE_MISALIGNED_MASK        (7 << 0)
> +
> +struct riscv_hwprobe {
> +    abi_llong  key;
> +    abi_ullong value;
> +};
> +
> +static void risc_hwprobe_fill_pairs(CPURISCVState *env,
> +                                    struct riscv_hwprobe *pair,
> +                                    size_t pair_count)
> +{
> +    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
> +
> +    for (; pair_count > 0; pair_count--, pair++) {
> +        abi_llong key;
> +        abi_ullong value;
> +        __put_user(0, &pair->value);
> +        __get_user(key, &pair->key);
> +        switch (key) {
> +        case RISCV_HWPROBE_KEY_MVENDORID:
> +            __put_user(cfg->mvendorid, &pair->value);
> +            break;
> +        case RISCV_HWPROBE_KEY_MARCHID:
> +            __put_user(cfg->marchid, &pair->value);
> +            break;
> +        case RISCV_HWPROBE_KEY_MIMPID:
> +            __put_user(cfg->mimpid, &pair->value);
> +            break;
> +        case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> +            value =3D riscv_has_ext(env, RVI) &&
> +                    riscv_has_ext(env, RVM) &&
> +                    riscv_has_ext(env, RVA) ?
> +                    RISCV_HWPROBE_BASE_BEHAVIOR_IMA : 0;
> +            __put_user(value, &pair->value);
> +            break;
> +        case RISCV_HWPROBE_KEY_IMA_EXT_0:
> +            value =3D riscv_has_ext(env, RVF) &&
> +                    riscv_has_ext(env, RVD) ?
> +                    RISCV_HWPROBE_IMA_FD : 0;
> +            value |=3D riscv_has_ext(env, RVC) ?
> +                     RISCV_HWPROBE_IMA_C : pair->value;
> +            __put_user(value, &pair->value);
> +            break;
> +        case RISCV_HWPROBE_KEY_CPUPERF_0:
> +            __put_user(RISCV_HWPROBE_MISALIGNED_FAST, &pair->value);
> +            break;
> +        default:
> +            __put_user(-1, &pair->key);
> +            break;
> +        }
> +    }
> +}
> +
> +static int cpu_set_valid(abi_long arg3, abi_long arg4)
> +{
> +    int ret, i, tmp;
> +    size_t host_mask_size, target_mask_size;
> +    unsigned long *host_mask;
> +
> +    /*
> +     * cpu_set_t represent CPU masks as bit masks of type unsigned long =
*.
> +     * arg3 contains the cpu count.
> +     */
> +    tmp =3D (8 * sizeof(abi_ulong));
> +    target_mask_size =3D ((arg3 + tmp - 1) / tmp) * sizeof(abi_ulong);
> +    host_mask_size =3D (target_mask_size + (sizeof(*host_mask) - 1)) &
> +                     ~(sizeof(*host_mask) - 1);
> +
> +    host_mask =3D alloca(host_mask_size);
> +
> +    ret =3D target_to_host_cpu_mask(host_mask, host_mask_size,
> +                                  arg4, target_mask_size);
> +    if (ret !=3D 0) {
> +        return ret;
> +    }
> +
> +    for (i =3D 0 ; i < host_mask_size / sizeof(*host_mask); i++) {
> +        if (host_mask[i] !=3D 0) {
> +            return 0;
> +        }
> +    }
> +    return -TARGET_EINVAL;
> +}
> +
> +static abi_long do_riscv_hwprobe(CPUArchState *cpu_env, abi_long arg1,
> +                                 abi_long arg2, abi_long arg3,
> +                                 abi_long arg4, abi_long arg5)
> +{
> +    int ret;
> +    struct riscv_hwprobe *host_pairs;
> +
> +    /* flags must be 0 */
> +    if (arg5 !=3D 0) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    /* check cpu_set */
> +    if (arg3 !=3D 0) {
> +        ret =3D cpu_set_valid(arg3, arg4);
> +        if (ret !=3D 0) {
> +            return ret;
> +        }
> +    } else if (arg4 !=3D 0) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    /* no pairs */
> +    if (arg2 =3D=3D 0) {
> +        return 0;
> +    }
> +
> +    host_pairs =3D lock_user(VERIFY_WRITE, arg1,
> +                           sizeof(*host_pairs) * (size_t)arg2, 0);
> +    if (host_pairs =3D=3D NULL) {
> +        return -TARGET_EFAULT;
> +    }
> +    risc_hwprobe_fill_pairs(cpu_env, host_pairs, arg2);
> +    unlock_user(host_pairs, arg1, sizeof(*host_pairs) * (size_t)arg2);
> +    return 0;
> +}
> +#endif /* TARGET_NR_riscv_hwprobe */
> +
>  #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
>  _syscall2(int, pivot_root, const char *, new_root, const char *, put_old=
)
>  #endif
> @@ -13571,6 +13712,11 @@ static abi_long do_syscall1(CPUArchState *cpu_en=
v, int num, abi_long arg1,
>          return ret;
>  #endif
>
> +#if defined(TARGET_NR_riscv_hwprobe)
> +    case TARGET_NR_riscv_hwprobe:
> +        return do_riscv_hwprobe(cpu_env, arg1, arg2, arg3, arg4, arg5);
> +#endif
> +
>      default:
>          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
>          return -TARGET_ENOSYS;
> --
> 2.39.2
>
>

