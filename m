Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm5aB-00079X-VV
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 00:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5a9-00075L-SO; Tue, 11 Apr 2023 00:26:13 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5a7-0002fs-Jl; Tue, 11 Apr 2023 00:26:12 -0400
Received: by mail-vs1-xe33.google.com with SMTP id bl16so6818784vsb.4;
 Mon, 10 Apr 2023 21:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681187170; x=1683779170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yf1U4QaJIIQK+nyx5oPbQ3qzPhEbrbWz1HOTEe9714=;
 b=ARtA17RtV7mBteSPb29rcd9v/jx7PVjXgAvyVFkgqBBBGr43sctOO5EVd1dvBj8Q4+
 /S9yaunrj3ViyGsEXktTPpMoQMdiVUBAt7x58u8LUtoY1ur1RlV0ZGW9cg8s+G8Wwgvp
 wdZt/ZkW/ro1FN3d1NgJIJ5/KHAy+z2qsbqOtVfZqBjVACNaJwXYSM7EKg7fOZwMArKS
 FHMFyQ46569ZOrIcj56uQgxkSZjRfH/I5ATMBIL9CIIsVuEIYOh92kdpGgOE54nV1zhT
 KN1zOvRM7TNzAZ8+DtfJzfJ3+/HQVnc/NE4PoAyTJe6Ew69xUOutEHqDugNmum59f2Wc
 mw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681187170; x=1683779170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4yf1U4QaJIIQK+nyx5oPbQ3qzPhEbrbWz1HOTEe9714=;
 b=jAATV5wLVMs5B0uO5k6cz9ARfbwDKFWGfqZQu8gVxDdL/Zb/Di42X8EXJatnux2+q9
 m4HcCqbxp11zkLMvd8tjYX83/TBtguY+NuCcKVWZR60/rfrAn0zChytu3TNdVbb/TQ98
 ksEAEAdPmsNwOuowdjdnyzQ+YAeknIZ7+Tc0MGqS8W4WhEzhP0F9bIGGxWvxK1gsIW/G
 54TXoW5K0ealALYUTCGC0n0W/zwYTT3Oavzzp3a4tJrPvrt6InKJJnLMbRJQsw0avLun
 XlHoUwMvf20w+DGhXCcmLVCNy85yhTv+IxKJvVTqOfxZ1Q7YAUmHmdDtti53QcKrKJqV
 Eabw==
X-Gm-Message-State: AAQBX9coHW3YLSCHOrMAWjRP62vs02WjdvneizLucgRzAT/GE9aMZJrr
 nzpS4Q7pQXTgRjpPnw6N0Xad1U+I+niiEBqVZjuMIPFujOE=
X-Google-Smtp-Source: AKy350Z5ff01ExEhtlPKOzw/CyupjE76lXdfdlL3NnOeggXhXovHf18lBRPWJJI+wOwGJrMs/AZavMKiuaJXZ5otbpc=
X-Received: by 2002:a67:c289:0:b0:42c:3f5a:7561 with SMTP id
 k9-20020a67c289000000b0042c3f5a7561mr5488021vsj.3.1681187169853; Mon, 10 Apr
 2023 21:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-19-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-19-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 14:25:43 +1000
Message-ID: <CAKmqyKMXgmQ9uZe2UcP_HvyUwy=-1hy=g+ZbUfTDrrbfRDFuBg@mail.gmail.com>
Subject: Re: [PATCH v6 18/25] target/riscv: Hoist second stage mode change to
 callers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 04:26:14 -0000

On Sat, Mar 25, 2023 at 10:29=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the check from the top of get_physical_address to
> the two callers, where passing mmu_idx makes no sense.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 0017ecbf37..833ea6d3fa 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -791,12 +791,6 @@ static int get_physical_address(CPURISCVState *env, =
hwaddr *physical,
>          use_background =3D true;
>      }
>
> -    if (first_stage =3D=3D false) {
> -        /* We are in stage 2 translation, this is similar to stage 1. */
> -        /* Stage 2 is always taken as U-mode */
> -        mode =3D PRV_U;
> -    }
> -
>      if (mode =3D=3D PRV_M || !riscv_cpu_cfg(env)->mmu) {
>          *physical =3D addr;
>          *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> @@ -902,7 +896,7 @@ restart:
>              /* Do the second stage translation on the base PTE address. =
*/
>              int vbase_ret =3D get_physical_address(env, &vbase, &vbase_p=
rot,
>                                                   base, NULL, MMU_DATA_LO=
AD,
> -                                                 mmu_idx, false, true,
> +                                                 MMUIdx_U, false, true,
>                                                   is_debug);
>
>              if (vbase_ret !=3D TRANSLATE_SUCCESS) {
> @@ -1274,7 +1268,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>              im_address =3D pa;
>
>              ret =3D get_physical_address(env, &pa, &prot2, im_address, N=
ULL,
> -                                       access_type, mmu_idx, false, true=
,
> +                                       access_type, MMUIdx_U, false, tru=
e,
>                                         false);
>
>              qemu_log_mask(CPU_LOG_MMU,
> --
> 2.34.1
>
>

