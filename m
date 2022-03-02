Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPJv7-00055o-G8
	for mharc-qemu-riscv@gnu.org; Wed, 02 Mar 2022 03:01:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPJv4-00054X-KG; Wed, 02 Mar 2022 03:01:10 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=40451
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPJv1-0001F7-AL; Wed, 02 Mar 2022 03:01:09 -0500
Received: by mail-io1-xd2d.google.com with SMTP id t11so940979ioi.7;
 Wed, 02 Mar 2022 00:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8JSNjAdEPn05CrRUmNOidfDCUSrwpFB7Wy5Fn6CHJA=;
 b=iVDlOhmAmfspnMNWGHuHiJq6qX10Blo+rykqnqKtWHVkAYy5lXfyvKFnXXIIzZdSmW
 X+yKDevHLjZ9mGmY1ZAgkNhA/jv7Wbahzdg7M0mQhx2nBkM9LOysfDdkD9J5hRPmx5Tu
 9Zg8o4M+iKoUkL9yn4BPoYx3GvbYLA419HAh8KxmFIix9AzvL60liEhwZdQpqdGUgIK/
 PE6j+JrVRAMud5hPjaDPZT2ulWbpqWXiCOX+sCDweOAdq8ojCXYw04FiFKT2BGfsFp6/
 hmn7yxYaeGzg3xqtXWj2RQyxPkYPi7UuNemjQ0fgtNApNSeHTydSTRMGEK6tykLz5rV3
 SW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8JSNjAdEPn05CrRUmNOidfDCUSrwpFB7Wy5Fn6CHJA=;
 b=CxELn07/9yEv2sF3MOYfd91DaJoD6gzirFYM8XgRBhWlNcWXGVrQlbH7WbSmqeeBXr
 XuHqQsq1LoKzo33caU9A0KNyLHZwRxHrpqjRdOuKBkqGzJJReUAdrijTeyDpmQAFbKn0
 JQP0qMRP8VEcrWQEaf/ljauWW1e1mhj93S4RkF44QNzV9KMztBeHOhC3gg+JEUOApTn4
 vT65srng8T+g15qzw3A3qZkpHuKUgH5pqpOM31jKUf5v2MRES8HJ1EvA+qYOuno7XG+B
 gWz1fdkY4c7ilPx/D2O/+HEomFwS3adljaMeqb8Xb9+rk7SCBcrPPcGAnXCcfA0GPqvJ
 hBGA==
X-Gm-Message-State: AOAM533LleXdlIt98Jhu6vO3FtGMAHrkglBdjIpuAPA9TaI+H35bkh+6
 kEMqKnmYQRMzCBYORMyGGMmUs6pvZHQn1OiF/Ps=
X-Google-Smtp-Source: ABdhPJz6CdqsmJAgtCitjwRfm6fj1JVxMDwKkJ5GvBC9Z1f8rhvhOz0LEaPkNPqeLzeTERQ3ib6dpaZ5L9S5gU5cjnU=
X-Received: by 2002:a02:9529:0:b0:314:5808:5de2 with SMTP id
 y38-20020a029529000000b0031458085de2mr23570586jah.68.1646208065330; Wed, 02
 Mar 2022 00:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20220216154839.1024927-1-cmuellner@linux.com>
 <20220216154839.1024927-2-cmuellner@linux.com>
In-Reply-To: <20220216154839.1024927-2-cmuellner@linux.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Mar 2022 18:00:38 +1000
Message-ID: <CAKmqyKOCkWnOo9+bCfzRWBjPJ2-0iA6Gh1bEem9BkAoWg3AiCw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] accel/tcg: Add probe_access_range_flags interface
To: Christoph Muellner <cmuellner@linux.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 02 Mar 2022 08:01:10 -0000

On Thu, Feb 17, 2022 at 1:49 AM Christoph Muellner <cmuellner@linux.com> wrote:
>
> The existing probe_access* functions do not allow to specify the
> access size and a non-faulting behavior at the same time.
>
> This is resolved by adding a generalization of probe_access_flags()
> that takes an additional size parameter.
>
> The semantics is basically the same as probe_access_flags(),
> but instead of assuming an access to any byte of the addressed
> page, we can restrict to access to a specific area, like
> probe_access() allows.
>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  accel/tcg/cputlb.c      | 17 +++++++++++++----
>  accel/tcg/user-exec.c   | 15 ++++++++++++---
>  include/exec/exec-all.h | 24 ++++++++++++++++++++++++
>  3 files changed, 49 insertions(+), 7 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 5e0d0eebc3..b4f0eb20b0 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1624,13 +1624,14 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>      return flags;
>  }
>
> -int probe_access_flags(CPUArchState *env, target_ulong addr,
> -                       MMUAccessType access_type, int mmu_idx,
> -                       bool nonfault, void **phost, uintptr_t retaddr)
> +int probe_access_range_flags(CPUArchState *env, target_ulong addr,
> +                             int size, MMUAccessType access_type,
> +                             int mmu_idx, bool nonfault, void **phost,
> +                             uintptr_t retaddr)
>  {
>      int flags;
>
> -    flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
> +    flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
>                                    nonfault, phost, retaddr);
>
>      /* Handle clean RAM pages.  */
> @@ -1645,6 +1646,14 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
>      return flags;
>  }
>
> +int probe_access_flags(CPUArchState *env, target_ulong addr,
> +                       MMUAccessType access_type, int mmu_idx,
> +                       bool nonfault, void **phost, uintptr_t retaddr)
> +{
> +    return probe_access_range_flags(env, addr, 0, access_type, mmu_idx,
> +                                    nonfault, phost, retaddr);
> +}
> +
>  void *probe_access(CPUArchState *env, target_ulong addr, int size,
>                     MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
>  {
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 6f5d4933f0..0dbc345e63 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -176,9 +176,10 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>      cpu_loop_exit_sigsegv(env_cpu(env), addr, access_type, maperr, ra);
>  }
>
> -int probe_access_flags(CPUArchState *env, target_ulong addr,
> -                       MMUAccessType access_type, int mmu_idx,
> -                       bool nonfault, void **phost, uintptr_t ra)
> +int probe_access_range_flags(CPUArchState *env, target_ulong addr,
> +                             int size, MMUAccessType access_type,
> +                             int mmu_idx, bool nonfault, void **phost,
> +                             uintptr_t ra)
>  {
>      int flags;
>
> @@ -187,6 +188,14 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
>      return flags;
>  }
>
> +int probe_access_flags(CPUArchState *env, target_ulong addr,
> +                       MMUAccessType access_type, int mmu_idx,
> +                       bool nonfault, void **phost, uintptr_t ra)
> +{
> +    return probe_access_range_flags(env, addr, 0, access_type, mmu_idx,
> +                                    nonfault, phost, ra);
> +}
> +
>  void *probe_access(CPUArchState *env, target_ulong addr, int size,
>                     MMUAccessType access_type, int mmu_idx, uintptr_t ra)
>  {
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 35d8e93976..0d06b45c62 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -441,6 +441,30 @@ static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
>      return probe_access(env, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
>  }
>
> +/**
> + * probe_access_range_flags:
> + * @env: CPUArchState
> + * @addr: guest virtual address to look up
> + * @size: size of the access
> + * @access_type: read, write or execute permission
> + * @mmu_idx: MMU index to use for lookup
> + * @nonfault: suppress the fault
> + * @phost: return value for host address
> + * @retaddr: return address for unwinding
> + *
> + * Similar to probe_access, loosely returning the TLB_FLAGS_MASK for
> + * the access range, and storing the host address for RAM in @phost.
> + *
> + * If @nonfault is set, do not raise an exception but return TLB_INVALID_MASK.
> + * Do not handle watchpoints, but include TLB_WATCHPOINT in the returned flags.
> + * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
> + * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
> + */
> +int probe_access_range_flags(CPUArchState *env, target_ulong addr,
> +                             int size, MMUAccessType access_type,
> +                             int mmu_idx, bool nonfault, void **phost,
> +                             uintptr_t retaddr);
> +
>  /**
>   * probe_access_flags:
>   * @env: CPUArchState
> --
> 2.35.1
>
>

