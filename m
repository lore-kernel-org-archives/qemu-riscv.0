Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A991DC5DF85
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 17:10:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx6Gu-0001ac-HM; Thu, 20 Aug 2026 13:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wx6Gt-0001Xq-Me
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 13:09:43 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wx6Gr-0001it-Iz
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 13:09:43 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8201447e8cdso1493027b3.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787245780; cv=none;
 d=google.com; s=arc-20260327;
 b=dA1+nO55qhKOOQJnpHjWUjsdXXcdVphSWEl8I+jiU+GH6W9YI1amWYCui4T95KL59g
 6GVuOuvITck32UYmZAMgxhyWSLJ/O4msTh/eKc4ok73roNyiRgElwTS1kSLQLvtLFC6n
 KV2dfMKyO0aIFi7s270eKiVoENq4dtjSKXq0s6NlF1BRgae2p2C2sp55WfHe0+au4qLO
 dgrPMlZRf6252K92Ky+CgByyVLxs6U+DjZZqj9cXuQZhIwroAvMDvbg9/4YmyUcfmbHW
 NaXE+sXMGHqvxdv2Vjf/UffwwDLdn5nIyNuF44GoBzCqX+PuHI+TMZZ143ex7nXfdo1V
 3WLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wLVNGp1TrXL/BejdX3jNwBZK07UE4WlYLsz9cGAtoNc=;
 fh=+DJo+rvBN/YB8Ey8Oti7wm8HIJHCbk6vePg1JeJoZX8=;
 b=oc846Fh+k6W7ndXrMRy78hHqqtXIbi4bjVsyNGvYl99N0H06Oy+n1Oqy/OS/Kp/BqU
 qcf7HxOii8u7GO6RfvPYqxelhTG8aM7Iijrn13PB+JbnAY/B8mfAYDkE9UwSIjfXBnTL
 P/yglTAm6oh3BYolBN8nFMANWeMRb8rOYVZynZvfYKD437jgz1IyHla2l2xCL7DrEata
 Wq/cbrZBCNH7iELIg194h6L1uTdqxKYgooOOwAAH/aaQQ1CBS3jr/Dd1Yf5ckpfVLI70
 SXYvrwDoToPsp4P8Y6EU8EzHfQ2sG7NmcBtNj6BOqrQhPkGs/PomCTkrB4k2L9B5r7BZ
 VM/Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787245780; x=1787850580; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wLVNGp1TrXL/BejdX3jNwBZK07UE4WlYLsz9cGAtoNc=;
 b=bc/kJXJN9pwFPFxyFni0XE8ZCUqm4KII8nkLaiUuRutQrm+hh1tPQDVmUvx7g0oERN
 kUknfz4ZqI0e2bnzU7h96sK7bwF7+haJ2JjQ62FZaisJQSXcP/OMFnMpiGTuwEHukY8p
 MsNOhSE0OWNzMa71r++XSDxFD/bswWuRxYywS5shxooJKMROLMubQjkMg8vTtTd9ubTh
 I8talFsB4IRHpvmGJ4ICfWpBmRGGCWv8hwUs7ej9yn2hUAc81PKU0HsCi739rhzWjIKf
 YkgW2Eqg1T6ekKr1POubEHhZQh7eBgMZQUkv6ilwmjsMaLCcLzSKMtKk1x/bHiJszHpu
 DRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787245780; x=1787850580;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wLVNGp1TrXL/BejdX3jNwBZK07UE4WlYLsz9cGAtoNc=;
 b=ApoMTXlDLJOJZnvpEeAISfhrbXdVYfSS/GAdR1PJElTcLi9YBdViQxa+fwsjUNAtlk
 4KWn+wbhd/E/tgFfmthLLAKP0NGRoFMdkJ53+H0K8QT09fB4fM6VgGUegWoh5jR6Snli
 XgSr//I+ZON0WTHBjbIDcNmWjmbjFqw1lMqU7C7m/ewIZofVqWaPQCMMllknr/iJFg22
 IzCIwEQU/HtDYQutnhP89EZ4SqvUm96SBQOHCKdt6ENUtzcsm2SUGkWXAuLlk7GQ/jbr
 cj1d0xmUpsnkWY8DwLx8Spf4datZzyzfj3MC08mNYsgIxdctVc705G3mb22ARTR5RBqf
 Weog==
X-Forwarded-Encrypted: i=1;
 AHgh+RowDLDVguSK27Pk74isASDpBE7XmOfuHe5jdRPvx0setX6GJoCxMlcyoyd/+nUUqJwjPwEEtZCzUYT7@nongnu.org
X-Gm-Message-State: AFuF++nlzLkPtrhg7jtcb9+7gIENwLWD6mgLtqQIehuO47JyqzL78gKx
 De8O5w7ZACNZo3dcfQ0+wel/1PDtbI53swNsTY5iwz2hV92CFLq9QQE2zYLCmnYAzZq4JA441Vz
 u0a2WW836D8mNxdI8MpWOQz28ROWrSU8=
X-Gm-Gg: AR+sD11/rqH0AExwO4uY1AcN/02hGSgjqmUEDXQtT9BxNK6mCABwxzjq1VrfYWIGoSF
 qlqrUUfadKgW8HsDrD2TfAIZE8g4JCR5YR5KhYbQ7lIQlPlDgsZ2JvWsaj37MBttid7kowSeTAm
 a9HdlvmzspR+F55+b4UwEe9Q3BXH7nwP3qPFfGhyu2qCtAw72Vw3EFGwX/sLkBgPx/YNx3bwiFx
 vCQTQt1Fr+86ixT646eGeDinir6g9SCCY+/PDzkQm/aho7GGCVPezbtxAXuWkr4mKOrZYysNkSd
 gKpr0tmI6N3McmEXDqDnPeUC345eA6sb7LBm2CbJKXX24Pvug4i7Fo2fgfeuHgCJFYQ++55Ijj+
 P
X-Received: by 2002:a05:690c:e3c2:b0:847:8ef9:fa2e with SMTP id
 00721157ae682-8478f093dc5mr27474467b3.10.1787245780046; Thu, 20 Aug 2026
 10:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-10-philmd@oss.qualcomm.com>
 <0b70e3cc-e14f-4737-b265-c7d12898169a@linaro.org>
 <854739cc-1275-4324-aaea-576f0a504172@oss.qualcomm.com>
 <fb2425af-9f89-4413-a31e-1f22fd42d869@oss.qualcomm.com>
In-Reply-To: <fb2425af-9f89-4413-a31e-1f22fd42d869@oss.qualcomm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 20 Aug 2026 21:09:23 +0400
X-Gm-Features: AcwNN1W9ltniWMbSgs1PGJ3frjaMCXMbmdQyqmJcJk98cxS_OW0FuKRKMguRMSE
Message-ID: <CAJ+F1CKqhB-7MPHQZ6_8NbA7Mq9eUmkDD3rn7-dgTVJErYcshg@mail.gmail.com>
Subject: Re: [RFC PATCH 09/13] cpus: Add const-qualified CPU environment
 accessors
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Aug 20, 2026 at 8:52=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 2026-08-20 18:24, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 2026-08-20 17:21, Richard Henderson wrote:
> >> On 8/20/26 03:47, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Introduce const-qualified variants of cpu_env() and
> >>> env_archcpu(), to safely access CPU architecture
> >>> state when it should not be modified.
> >>>
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> >>> ---
> >>>   include/exec/cpu-common.h | 11 +++++++++++
> >>>   include/hw/core/cpu.h     |  6 ++++++
> >>>   2 files changed, 17 insertions(+)
> >>>
> >>> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> >>> index 6594f7fa1be..f3a3799f451 100644
> >>> --- a/include/exec/cpu-common.h
> >>> +++ b/include/exec/cpu-common.h
> >>> @@ -79,6 +79,17 @@ static inline bool cpu_loop_exit_requested(const
> >>> CPUState *cpu)
> >>>   }
> >>>   #endif /* CONFIG_TCG */
> >>> +/**
> >>> + * env_archcpu_const(env)
> >>> + * @env: The architecture environment (const).
> >>> + *
> >>> + * Return the const ArchCPU associated with the environment.
> >>> + */
> >>> +static inline const ArchCPU *env_archcpu_const(const CPUArchState *e=
nv)
> >>> +{
> >>> +    return (const void *)env - sizeof(CPUState);
> >>> +}
> >>> +
> >>>   /**
> >>>    * env_archcpu(env)
> >>>    * @env: The architecture environment
> >>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> >>> index 81af7b9ee1a..59f777f3f15 100644
> >>> --- a/include/hw/core/cpu.h
> >>> +++ b/include/hw/core/cpu.h
> >>> @@ -594,6 +594,12 @@ struct CPUState {
> >>>   QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=3D
> >>>                     sizeof(CPUState) - sizeof(CPUNegativeOffsetState)=
);
> >>> +static inline const CPUArchState *cpu_env_const(const CPUState *cpu)
> >>> +{
> >>> +    /* We validate that CPUArchState follows CPUState in cpu-
> >>> target.c */
> >>> +    return (const CPUArchState *)(cpu + 1);
> >>> +}
> >>> +
> >>>   static inline CPUArchState *cpu_env(CPUState *cpu)
> >>>   {
> >>>       /* We validate that CPUArchState follows CPUState in cpu-
> >>> target.c */
> >>
> >> I wonder if we can use _Generic to make this automatic, rather than
> >> have to choose between two different function names.
> > Eh clever :) This seems to work:
> >
> >    #define env_archcpu_(p) _Generic(*(p), \
> >                                CPUArchState: (void *)p, \
> >                                const CPUArchState: (const void *)p)
>
> Actually simpler and even well readable:
>
> -- >8 --
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6594f7fa1b..d67d008236 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -85,21 +85,11 @@ static inline bool cpu_loop_exit_requested(const
> CPUState *cpu)
>    *
>    * Return the ArchCPU associated with the environment.
>    */
> -static inline ArchCPU *env_archcpu(CPUArchState *env)
> -{
> -    return (void *)env - sizeof(CPUState);
> -}
> -
> -/**
> - * env_cpu_const(env)
> - * @env: The architecture environment
> - *
> - * Return the CPUState associated with the environment.
> - */
> -static inline const CPUState *env_cpu_const(const CPUArchState *env)
> -{
> -    return (void *)env - sizeof(CPUState);
> -}
> +#define env_archcpu(env) _Generic(*(env), \
> +            CPUArchState: \
> +                (ArchCPU *)((void *)env - sizeof(CPUState)), \
> +            const CPUArchState: \
> +                (const ArchCPU *)((const void *)env - sizeof(CPUState)))
>
>   /**
>    * env_cpu(env)
> @@ -107,9 +97,10 @@ static inline const CPUState *env_cpu_const(const
> CPUArchState *env)
>    *
>    * Return the CPUState associated with the environment.
>    */
> -static inline CPUState *env_cpu(CPUArchState *env)
> -{
> -    return (CPUState *)env_cpu_const(env);
> -}
> +#define env_cpu(env) _Generic(*(env), \
> +            CPUArchState: \
> +                (CPUState *)((void *)env - sizeof(CPUState)), \
> +            const CPUArchState: \
> +                (const CPUState *)((const void *)env - sizeof(CPUState))=
)
>
>   #endif /* CPU_COMMON_H */
> ---
>

lgtm too
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



--=20
Marc-Andr=C3=A9 Lureau

