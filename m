Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80ADC77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 14:02:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q55M9-00076o-M1; Fri, 02 Jun 2023 10:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q55M8-00076Z-PJ
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 10:02:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q55M5-0001Kq-2K
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 10:02:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30aa1eb95a0so2132526f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685714530; x=1688306530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t9Igt+M9ibuWMcRM/202KOv0++0kR0yXiTr3TdCXnS8=;
 b=ObSDzbMM3TWrskYKZtwyigndqNXTzkkpTLJYqpn63D3GjPtWnkutQnhZRPe1KPp+Re
 xfIkHmmx3/gzvQa+KaH+E1WjhAgBAOg6rrPuC5cYg7HjXNGM21cxU1HCXG6d62xUjRRs
 zctx3RBfNmLn2Oa4jH/rk8ulERdqoAHmpyGEnJKnKlN4YSqxCJwPIB+J5NJS7U0ce4xz
 Ndr60BQdeJeDwc30S/ykKpTN8Sk5Luu8N8fSZiby22ijk3g/oUTtzyVt7IPz6/iY4f2r
 E6uNuQhiwAUUS3XpiDAR8YKZsZdXO5qTfF1nHeaN31j5UzWPjWqfP02RehQLtfJspuyI
 a/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685714530; x=1688306530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9Igt+M9ibuWMcRM/202KOv0++0kR0yXiTr3TdCXnS8=;
 b=PqZcXJ09F7vFM1tpyJpawjiSCSEE9Xbmg9OLkkuU2EZD5+StijmeRad/p64vbzfJY2
 gdBPk7tTdeMgnyM5ZiYozdSt78o7a86zicwx6h2tvCqe8+VWo8VKG4u4b+cwkjEGzmAg
 n9xE1saKGY0n3oxYL7P5Y5s0osmQDV6noBNXJr1AxI4TMH1+VoRc1ory2M2/HC8o3goF
 Nm//k52jmiioMTmoFrkimBnifVaSXwsmCeCQqmvWeTKIJnOb7gonWJ1I90JCfjNvPuhz
 Fx6BK1W71/CXRpNfGHYik2VCaEU6Du6cPoANAMjv7DDWyDbEXjVJv9o59Mi4laRj3bem
 7KGQ==
X-Gm-Message-State: AC+VfDwlEUPV9+tAJEC8yH/1n4UDW5lEfEHZsgD4zJk22TLIm9kacj3V
 jNKy4Q64PHWjqwS7f8AE6u+nRw==
X-Google-Smtp-Source: ACHHUZ4JPe6FA7sQfzMIc9S07gXXBpbWXS0xgzCwDSKF2/49RiWu0fLk5DsdwqdHzOBQhD4WBhiARw==
X-Received: by 2002:a5d:4b92:0:b0:2f6:25a6:9788 with SMTP id
 b18-20020a5d4b92000000b002f625a69788mr49124wrt.35.1685714529678; 
 Fri, 02 Jun 2023 07:02:09 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a5d5386000000b00307c46f4f08sm1777566wrv.79.2023.06.02.07.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 07:02:09 -0700 (PDT)
Date: Fri, 2 Jun 2023 16:02:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Robbin Ehn <rehn@rivosinc.com>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, qemu-riscv@nongnu.org, 
 richard.henderson@linaro.org
Subject: Re: [RFC v2] linux-user/riscv: Add syscall riscv_hwprobe
Message-ID: <20230602-86a3d8d9fad1fb3464d28702@orel>
References: <f59f948fc42fdf0b250afd6dcd6f232013480d9c.camel@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f59f948fc42fdf0b250afd6dcd6f232013480d9c.camel@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Jun 02, 2023 at 11:41:11AM +0200, Robbin Ehn wrote:
> This patch adds the new syscall for the
> "RISC-V Hardware Probing Interface"
> (https://docs.kernel.org/riscv/hwprobe.html).
> 
> Signed-off-by: Robbin Ehn <rehn@rivosinc.com>
> ---
> v1->v2: Moved to syscall.c
> ---
>  linux-user/riscv/syscall32_nr.h |   1 +
>  linux-user/riscv/syscall64_nr.h |   1 +
>  linux-user/syscall.c            | 109 ++++++++++++++++++++++++++++++++
>  3 files changed, 111 insertions(+)
> 
> diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/syscall32_nr.h
> index 1327d7dffa..412e58e5b2 100644
> --- a/linux-user/riscv/syscall32_nr.h
> +++ b/linux-user/riscv/syscall32_nr.h

This file should not be modified, it should be generated, but this is an
RFC, so hacking it is OK, but the hack should be in a separate patch.

> @@ -228,6 +228,7 @@
>  #define TARGET_NR_accept4 242
>  #define TARGET_NR_arch_specific_syscall 244
>  #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall + 15)
> +#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 14)
>  #define TARGET_NR_prlimit64 261
>  #define TARGET_NR_fanotify_init 262
>  #define TARGET_NR_fanotify_mark 263
> diff --git a/linux-user/riscv/syscall64_nr.h b/linux-user/riscv/syscall64_nr.h
> index 6659751933..29e1eb2075 100644
> --- a/linux-user/riscv/syscall64_nr.h
> +++ b/linux-user/riscv/syscall64_nr.h

Same

> @@ -251,6 +251,7 @@
>  #define TARGET_NR_recvmmsg 243
>  #define TARGET_NR_arch_specific_syscall 244
>  #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall + 15)
> +#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 14)
>  #define TARGET_NR_wait4 260
>  #define TARGET_NR_prlimit64 261
>  #define TARGET_NR_fanotify_init 262
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 89b58b386b..cd394bbe26 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8772,6 +8772,74 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
>  }
>  #endif /* TARGET_NR_getdents64 */
>  
> +#if defined(TARGET_RISCV)
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
> +    int64_t  key;
> +    uint64_t value;
> +};

The above is all uapi so Linux's arch/riscv/include/uapi/asm/hwprobe.h
should be picked up on Linux header update. You'll need to modify the
script, scripts/update-linux-headers.sh, to do that by adding a new
riscv-specific block. Hacking this by importing the header file manually
is fine for an RFC, but that should be a separate patch or part of the
syscall define hack patch. And hack patches should be clearly tagged as
"NOT FOR MERGE".

> +
> +static void risc_hwprobe_fill_pairs(CPURISCVState *env,
> +                                    struct riscv_hwprobe *pair,
> +                                    size_t pair_count)
> +{
> +    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
> +
> +    for (; pair_count > 0; pair_count--, pair++) {
> +        pair->value = 0;
> +        switch (pair->key) {
> +        case RISCV_HWPROBE_KEY_MVENDORID:
> +            pair->value = cfg->mvendorid;
> +            break;
> +        case RISCV_HWPROBE_KEY_MARCHID:
> +            pair->value = cfg->marchid;
> +            break;
> +        case RISCV_HWPROBE_KEY_MIMPID:
> +            pair->value = cfg->mimpid;
> +            break;
> +        case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> +            pair->value = riscv_has_ext(env, RVI) &&
> +                          riscv_has_ext(env, RVM) &&
> +                          riscv_has_ext(env, RVA) ?
> +                          RISCV_HWPROBE_BASE_BEHAVIOR_IMA : 0;
> +            break;
> +        case RISCV_HWPROBE_KEY_IMA_EXT_0:
> +            pair->value = riscv_has_ext(env, RVF) &&
> +                          riscv_has_ext(env, RVD) ?
> +                          RISCV_HWPROBE_IMA_FD : 0;
> +            pair->value |= riscv_has_ext(env, RVC) ?
> +                           RISCV_HWPROBE_IMA_C : pair->value;
> +            break;
> +        case RISCV_HWPROBE_KEY_CPUPERF_0:
> +            pair->value = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> +            break;
> +        default:
> +            pair->key = -1;
> +        break;
> +        }
> +    }
> +}
> +#endif
> +
>  #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
>  _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
>  #endif
> @@ -13469,6 +13537,47 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>          return ret;
>  #endif
>  
> +#if defined(TARGET_RISCV)
> +    case TARGET_NR_riscv_hwprobe:
> +        {

The { goes under the c of case, which will shift all the below four spaces
left as well.

> +            struct riscv_hwprobe *host_pairs;
> +
> +            /* flags must be 0 */
> +            if (arg5 != 0) {
> +                return -TARGET_EINVAL;
> +            }
> +
> +            /* check cpu_set */
> +            if (arg3 != 0) {
> +                int ccpu;
> +                size_t cpu_setsize = CPU_ALLOC_SIZE(arg3);
> +                cpu_set_t *host_cpus = lock_user(VERIFY_READ, arg4,
> +                                                 cpu_setsize, 0);
> +                if (!host_cpus) {
> +                    return -TARGET_EFAULT;
> +                }
> +                ccpu = CPU_COUNT_S(cpu_setsize, host_cpus);
> +                unlock_user(host_cpus, arg4, cpu_setsize);
> +                /* no selected cpu */
> +                if (ccpu == 0) {
> +                    return -TARGET_EINVAL;
> +                }
> +            } else if (arg4 != 0) {
> +                return -TARGET_EINVAL;
> +            }

I think we want

 if (arg2 == 0)
    return 0;

here.

> +
> +            host_pairs = lock_user(VERIFY_WRITE, arg1,
> +                                   sizeof(*host_pairs) * (size_t)arg2, 0);
> +            if (host_pairs == NULL) {
> +                return -TARGET_EFAULT;
> +            }
> +            risc_hwprobe_fill_pairs(cpu_env, host_pairs, arg2);
> +            unlock_user(host_pairs, arg1, sizeof(*host_pairs) * (size_t)arg2);
> +            ret = 0;
> +        }
> +        return ret;
> +#endif
> +
>      default:
>          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
>          return -TARGET_ENOSYS;
> -- 
> 2.39.2
> 
>

Otherwise this looks good to me.

Thanks,
drew

