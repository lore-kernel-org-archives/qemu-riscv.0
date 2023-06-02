Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF422C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 14:40:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q55wD-0003zb-Vy; Fri, 02 Jun 2023 10:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1q55w9-0003zD-8a
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 10:39:32 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1q55w4-0001jP-0k
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 10:39:27 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b1b66a8fd5so2507451fa.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685716762; x=1688308762; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qTHMFeVMyDwJhV8YR2oys+dnHM1q1wfPh+lHpai0NM0=;
 b=mnnWiDAQ0so5yO+EFspmrU70LBNWjgyFudjlYbf7PwBXCS7fa/99ZJ12w3yIIwk4Gn
 vxNYurYdpSyJqXl57oiFWKHOiQ55aFKgSWuPdiEdo2DyPGvbP8ZXb0aoI8IzivGKVj6M
 ScUTWrNtVGj6Ao3z5kCtTU37/kZCCfPO7Bm8dkc4HWAmGuNi+rjV3gDd1jOJVkh83fLM
 0R92VVcNt4PHfchJn5swvpd4m2ObocOcofRaflZqqlOqjg4v8ce+jeYjD8SyH7G8zgld
 lP8vv3hEuWPB5KTlm0hrJzDdE6+AF/u7OYl23CDh7oj86wEWGDVZiFrkeZyw4Lmf/7w1
 +EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685716762; x=1688308762;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qTHMFeVMyDwJhV8YR2oys+dnHM1q1wfPh+lHpai0NM0=;
 b=ZuPbJmHl9abhrXVSPY6AU2s0e603SEiUvFmkv+Jj8UQPtNKT2AwvXNhM4POpGDQo4E
 xyycL7UewdPw6Xyhoscb2+P74pC/taBdR3fh1VePjX9IB3O84jV0f1z20mu3Ki8QLk9y
 qJMbCQXYaZQJb2eGGkgIEsyRRkqEYQdq3FhHtWQNdfl0cKU2O0moWCP5nTcOOMmup1JI
 gwFm1OSVRASV/9UVdxLRO/kbgoehgypOk/7cX8z7deF1UwJcDLrTG4xZaLSHrnA5HAsA
 EWUQ+gSfSKMoERLf8QnN37le2U3SGjAXFxHnMTDiKSwhgxzGOV+uuG5daq23Gq+tnl63
 8jow==
X-Gm-Message-State: AC+VfDwDvSs32Ey+TWJlaU0eqa9IOKUuN0Hdp50YlYZO4hkuqzhBIX7d
 9GQXPE9tczWC9BoUj3YVvAwL0g==
X-Google-Smtp-Source: ACHHUZ7oBKwwngW1vMoc9nMQbu9grnPgMAKxAEC+t8F/UNN1W0ij3zbADuKEn4WkRQlz/fmJ17qf4A==
X-Received: by 2002:a05:651c:145:b0:2a8:bd1f:a377 with SMTP id
 c5-20020a05651c014500b002a8bd1fa377mr146403ljd.20.1685716761769; 
 Fri, 02 Jun 2023 07:39:21 -0700 (PDT)
Received: from [192.168.50.45] (h-155-4-92-80.A980.priv.bahnhof.se.
 [155.4.92.80]) by smtp.gmail.com with ESMTPSA id
 n5-20020a2e86c5000000b002ac7a715585sm246974ljj.30.2023.06.02.07.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 07:39:21 -0700 (PDT)
Message-ID: <024ee92f725f4ffd2952f472861ba9b415f4cde3.camel@rivosinc.com>
Subject: Re: [RFC v2] linux-user/riscv: Add syscall riscv_hwprobe
From: Robbin Ehn <rehn@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, qemu-riscv@nongnu.org, 
 richard.henderson@linaro.org
Date: Fri, 02 Jun 2023 16:39:20 +0200
In-Reply-To: <20230602-86a3d8d9fad1fb3464d28702@orel>
References: <f59f948fc42fdf0b250afd6dcd6f232013480d9c.camel@rivosinc.com>
 <20230602-86a3d8d9fad1fb3464d28702@orel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=rehn@rivosinc.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 2023-06-02 at 16:02 +0200, Andrew Jones wrote:
> On Fri, Jun 02, 2023 at 11:41:11AM +0200, Robbin Ehn wrote:
> > This patch adds the new syscall for the
> > "RISC-V Hardware Probing Interface"
> > (https://docs.kernel.org/riscv/hwprobe.html).
> >=20
> > Signed-off-by: Robbin Ehn <rehn@rivosinc.com>
> > ---
> > v1->v2: Moved to syscall.c
> > ---
> >  linux-user/riscv/syscall32_nr.h |   1 +
> >  linux-user/riscv/syscall64_nr.h |   1 +
> >  linux-user/syscall.c            | 109 ++++++++++++++++++++++++++++++++
> >  3 files changed, 111 insertions(+)
> >=20
> > diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/syscall=
32_nr.h
> > index 1327d7dffa..412e58e5b2 100644
> > --- a/linux-user/riscv/syscall32_nr.h
> > +++ b/linux-user/riscv/syscall32_nr.h
>=20
> This file should not be modified, it should be generated, but this is an
> RFC, so hacking it is OK, but the hack should be in a separate patch.

Ok, thanks.

>=20
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
>=20
> Same

Ok, thanks.

>=20
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
> > index 89b58b386b..cd394bbe26 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -8772,6 +8772,74 @@ static int do_getdents64(abi_long dirfd, abi_lon=
g arg2, abi_long count)
> >  }
> >  #endif /* TARGET_NR_getdents64 */
> > =20
> > +#if defined(TARGET_RISCV)
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
> > +    int64_t  key;
> > +    uint64_t value;
> > +};
>=20
> The above is all uapi so Linux's arch/riscv/include/uapi/asm/hwprobe.h
> should be picked up on Linux header update. You'll need to modify the
> script, scripts/update-linux-headers.sh, to do that by adding a new
> riscv-specific block. Hacking this by importing the header file manually
> is fine for an RFC, but that should be a separate patch or part of the
> syscall define hack patch. And hack patches should be clearly tagged as
> "NOT FOR MERGE".

Ok, thanks.

>=20
> > +
> > +static void risc_hwprobe_fill_pairs(CPURISCVState *env,
> > +                                    struct riscv_hwprobe *pair,
> > +                                    size_t pair_count)
> > +{
> > +    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
> > +
> > +    for (; pair_count > 0; pair_count--, pair++) {
> > +        pair->value =3D 0;
> > +        switch (pair->key) {
> > +        case RISCV_HWPROBE_KEY_MVENDORID:
> > +            pair->value =3D cfg->mvendorid;
> > +            break;
> > +        case RISCV_HWPROBE_KEY_MARCHID:
> > +            pair->value =3D cfg->marchid;
> > +            break;
> > +        case RISCV_HWPROBE_KEY_MIMPID:
> > +            pair->value =3D cfg->mimpid;
> > +            break;
> > +        case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> > +            pair->value =3D riscv_has_ext(env, RVI) &&
> > +                          riscv_has_ext(env, RVM) &&
> > +                          riscv_has_ext(env, RVA) ?
> > +                          RISCV_HWPROBE_BASE_BEHAVIOR_IMA : 0;
> > +            break;
> > +        case RISCV_HWPROBE_KEY_IMA_EXT_0:
> > +            pair->value =3D riscv_has_ext(env, RVF) &&
> > +                          riscv_has_ext(env, RVD) ?
> > +                          RISCV_HWPROBE_IMA_FD : 0;
> > +            pair->value |=3D riscv_has_ext(env, RVC) ?
> > +                           RISCV_HWPROBE_IMA_C : pair->value;
> > +            break;
> > +        case RISCV_HWPROBE_KEY_CPUPERF_0:
> > +            pair->value =3D RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> > +            break;
> > +        default:
> > +            pair->key =3D -1;
> > +        break;
> > +        }
> > +    }
> > +}
> > +#endif
> > +
> >  #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
> >  _syscall2(int, pivot_root, const char *, new_root, const char *, put_o=
ld)
> >  #endif
> > @@ -13469,6 +13537,47 @@ static abi_long do_syscall1(CPUArchState *cpu_=
env, int num, abi_long arg1,
> >          return ret;
> >  #endif
> > =20
> > +#if defined(TARGET_RISCV)
> > +    case TARGET_NR_riscv_hwprobe:
> > +        {
>=20
> The { goes under the c of case, which will shift all the below four space=
s
> left as well.

This was an attempt to blend in, i.e. same style as the preceding case.
I'll change, thanks.

>=20
> > +            struct riscv_hwprobe *host_pairs;
> > +
> > +            /* flags must be 0 */
> > +            if (arg5 !=3D 0) {
> > +                return -TARGET_EINVAL;
> > +            }
> > +
> > +            /* check cpu_set */
> > +            if (arg3 !=3D 0) {
> > +                int ccpu;
> > +                size_t cpu_setsize =3D CPU_ALLOC_SIZE(arg3);
> > +                cpu_set_t *host_cpus =3D lock_user(VERIFY_READ, arg4,
> > +                                                 cpu_setsize, 0);
> > +                if (!host_cpus) {
> > +                    return -TARGET_EFAULT;
> > +                }
> > +                ccpu =3D CPU_COUNT_S(cpu_setsize, host_cpus);
> > +                unlock_user(host_cpus, arg4, cpu_setsize);
> > +                /* no selected cpu */
> > +                if (ccpu =3D=3D 0) {
> > +                    return -TARGET_EINVAL;
> > +                }
> > +            } else if (arg4 !=3D 0) {
> > +                return -TARGET_EINVAL;
> > +            }
>=20
> I think we want
>=20
>  if (arg2 =3D=3D 0)
>     return 0;
>=20
> here.

Ok, thanks.

>=20
> > +
> > +            host_pairs =3D lock_user(VERIFY_WRITE, arg1,
> > +                                   sizeof(*host_pairs) * (size_t)arg2,=
 0);
> > +            if (host_pairs =3D=3D NULL) {
> > +                return -TARGET_EFAULT;
> > +            }
> > +            risc_hwprobe_fill_pairs(cpu_env, host_pairs, arg2);
> > +            unlock_user(host_pairs, arg1, sizeof(*host_pairs) * (size_=
t)arg2);
> > +            ret =3D 0;
> > +        }
> > +        return ret;
> > +#endif
> > +
> >      default:
> >          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
> >          return -TARGET_ENOSYS;
> > --=20
> > 2.39.2
> >=20
> >=20
>=20
> Otherwise this looks good to me.

Thank you!

/Robbin

>=20
> Thanks,
> drew


