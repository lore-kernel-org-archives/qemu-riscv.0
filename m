Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1530EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 17:12:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9qWN-0003t3-S8; Thu, 15 Jun 2023 13:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1q9qWM-0003sQ-C9
 for qemu-riscv@nongnu.org; Thu, 15 Jun 2023 13:12:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1q9qWK-0001l4-2r
 for qemu-riscv@nongnu.org; Thu, 15 Jun 2023 13:12:30 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1b3db8f3d07so27629855ad.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Jun 2023 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1686849145; x=1689441145; 
 h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2PmxgTbPJj8xmjge7mkG/E2j/SwAIV3tZMQEzRT84SU=;
 b=uwp8UgBmUY+3JlezQS9yGxRVwx+nsztrrm+sIYpq1Q+M+r4xq84jBscL6e5Avxxhz3
 T5yy5DE0T8Phpeo+IA3su9A5kn4eic+0Mpe0UFQwHeru2qqbzsj6SDq5WUD+jLIRtahe
 4rhWUJatZobs3LggaZ8l34Jv8rGu4oOzCp6b+ooqYhSTX0heQnTC1gtYi1v7LGaUJAyT
 /6yN8yE2v1880XOYTDN+g5WbLW8p9ohW7RMklt3LqRGRQH6FLUCNBjmOiDGnQJbivOUG
 Q0XHiyyHGYLW48dPNvoEMtpQC72mSxLGEo/LEwfQGsTOmW33CHXvYqhTWGTudJsqZXnT
 7pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686849145; x=1689441145;
 h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2PmxgTbPJj8xmjge7mkG/E2j/SwAIV3tZMQEzRT84SU=;
 b=BwxK4AyQe2YFspM11lQqljzsK5IsptFHNvyZkZssJzCAaLVPqV1t5pksrI0O6NwC4z
 y6edHHGEY9NdXREYZw5H/AZ7I913RxvAB4jRc9itFY3ZNx1e8NdOwtHhu+/hkFeiGf12
 eu7U569TM44IwuB+tdmwLCK7OcyfAiV02Nw4I68HFUbDlsXFQAIIjfWEqTm0/+Xb2FNC
 BYhLazOqmc7pfY+rljRAC4J8Z39iep6WZCQ2Cfxni5EPDr/3WxlBS0+ojXXcQYl5jp4U
 eAri+wwhv87YpBzI1YRmghMbi9A5RFg7t9i0MZQrn6wEW45nJx/R+r/QkeF6GjhtbQ2D
 VyTg==
X-Gm-Message-State: AC+VfDw16fuF8UxMeayw6dWNzgOSoMdWxCKNVU9dqt0e9ZGdJOR67JkI
 ia+Qc5a4q4ABsvQCznV1ZJWjmw==
X-Google-Smtp-Source: ACHHUZ4kU5jmn951uKTSgIZC6wbwGaYA6N7FaYru4g5Gl2RECUBUu3DpJTaOMXrxCLOe7yc9++Sp6g==
X-Received: by 2002:a17:902:ec8f:b0:1b2:450f:9cb with SMTP id
 x15-20020a170902ec8f00b001b2450f09cbmr16110765plg.51.1686849145153; 
 Thu, 15 Jun 2023 10:12:25 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 az5-20020a170902a58500b001b034faf49csm12830915plb.285.2023.06.15.10.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 10:12:24 -0700 (PDT)
Date: Thu, 15 Jun 2023 10:12:24 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Jun 2023 10:12:16 PDT (-0700)
Subject: Re: [RFC v3] linux-user/riscv: Add syscall riscv_hwprobe
In-Reply-To: <7f8d733df6e9b6151e9efb843d55441348805e70.camel@rivosinc.com>
CC: qemu-devel@nongnu.org, laurent@vivier.eu, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rehn@rivosinc.com
Message-ID: <mhng-29b8061d-5875-4cf0-a4de-a2287ed8d917@palmer-ri-x1c9>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62f.google.com
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

On Thu, 08 Jun 2023 00:55:22 PDT (-0700), rehn@rivosinc.com wrote:
> This patch adds the new syscall for the
> "RISC-V Hardware Probing Interface"
> (https://docs.kernel.org/riscv/hwprobe.html).
>
> Signed-off-by: Robbin Ehn <rehn@rivosinc.com>
> ---
> v1->v2: Moved to syscall.c
> v2->v3: Separate function, get/put user
> ---
>  linux-user/riscv/syscall32_nr.h |   1 +
>  linux-user/riscv/syscall64_nr.h |   1 +
>  linux-user/syscall.c            | 146 ++++++++++++++++++++++++++++++++
>  3 files changed, 148 insertions(+)
>
> diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/syscall32_nr.h
> index 1327d7dffa..412e58e5b2 100644
> --- a/linux-user/riscv/syscall32_nr.h
> +++ b/linux-user/riscv/syscall32_nr.h
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
> @@ -251,6 +251,7 @@
>  #define TARGET_NR_recvmmsg 243
>  #define TARGET_NR_arch_specific_syscall 244
>  #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall + 15)
> +#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 14)
>  #define TARGET_NR_wait4 260
>  #define TARGET_NR_prlimit64 261
>  #define TARGET_NR_fanotify_init 262
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 83685f0aa5..e8859cd3be 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8874,6 +8874,147 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
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
> +    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
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
> +            value = riscv_has_ext(env, RVI) &&
> +                    riscv_has_ext(env, RVM) &&
> +                    riscv_has_ext(env, RVA) ?
> +                    RISCV_HWPROBE_BASE_BEHAVIOR_IMA : 0;
> +            __put_user(value, &pair->value);
> +            break;
> +        case RISCV_HWPROBE_KEY_IMA_EXT_0:
> +            value = riscv_has_ext(env, RVF) &&
> +                    riscv_has_ext(env, RVD) ?
> +                    RISCV_HWPROBE_IMA_FD : 0;
> +            value |= riscv_has_ext(env, RVC) ?
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
> +     * cpu_set_t represent CPU masks as bit masks of type unsigned long *.
> +     * arg3 contains the cpu count.
> +     */
> +    tmp = (8 * sizeof(abi_ulong));
> +    target_mask_size = ((arg3 + tmp - 1) / tmp) * sizeof(abi_ulong);
> +    host_mask_size = (target_mask_size + (sizeof(*host_mask) - 1)) &
> +                     ~(sizeof(*host_mask) - 1);
> +
> +    host_mask = alloca(host_mask_size);
> +
> +    ret = target_to_host_cpu_mask(host_mask, host_mask_size,
> +                                  arg4, target_mask_size);
> +    if (ret != 0) {
> +        return ret;
> +    }
> +
> +    for (i = 0 ; i < host_mask_size / sizeof(*host_mask); i++) {
> +        if (host_mask[i] != 0) {
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
> +    if (arg5 != 0) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    /* check cpu_set */
> +    if (arg3 != 0) {
> +        ret = cpu_set_valid(arg3, arg4);
> +        if (ret != 0) {
> +            return ret;
> +        }
> +    } else if (arg4 != 0) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    /* no pairs */
> +    if (arg2 == 0) {
> +        return 0;
> +    }
> +
> +    host_pairs = lock_user(VERIFY_WRITE, arg1,
> +                           sizeof(*host_pairs) * (size_t)arg2, 0);
> +    if (host_pairs == NULL) {
> +        return -TARGET_EFAULT;
> +    }
> +    risc_hwprobe_fill_pairs(cpu_env, host_pairs, arg2);
> +    unlock_user(host_pairs, arg1, sizeof(*host_pairs) * (size_t)arg2);
> +    return 0;
> +}
> +#endif /* TARGET_NR_riscv_hwprobe */
> +
>  #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
>  _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
>  #endif
> @@ -13571,6 +13712,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

riscv_hwprobe() hasn't been released yet, but it's in Linus' tree so 
unless something unforseen happens it should show up in 6.4 in a few 
weeks.

