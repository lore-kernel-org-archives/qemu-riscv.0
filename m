Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ncgM0-00027q-3C
	for mharc-qemu-riscv@gnu.org; Fri, 08 Apr 2022 00:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ncgLx-00027Z-72; Fri, 08 Apr 2022 00:36:11 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:47024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ncgLv-000715-Jp; Fri, 08 Apr 2022 00:36:08 -0400
Received: by mail-io1-xd2b.google.com with SMTP id g21so9285960iom.13;
 Thu, 07 Apr 2022 21:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Op1NGI3vhbrbPpQV46Q1GLNGGvvtE7SZ/vf9A01uyo=;
 b=TUmk9K6KvdyFY+pS8HKQBD/6qNfvxVg7p88rt9hhWwIk5zItnuWVWQriDBj3CwmZ7h
 SS1tQfINEpf/huOj/uepr/jiKqY4nkcmsff7GzcR4G4ymi2w3ib6Y3zzqItLJmQTZ56N
 /1OhjdrqEV8FxLoAyIo1vwKCmr+UUWPnR2nv54v4hVFMOf4pZF+x2Bn5Yu5zEKtgQZp+
 xR+jvbCF6su7y/knDMQrfQrrQqHASJ2tcDHh3GkdkhmVCHGQ2Ef7HZ/wR2r4uT5pns6L
 1Q9hRAqY/5NfeSddNmXXZOk+qW3l3yiznoq/ArDcympXeZlt2xl8vMrIhRmcDeZLFoS3
 7dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Op1NGI3vhbrbPpQV46Q1GLNGGvvtE7SZ/vf9A01uyo=;
 b=TtpCmHBxiRIMAL/u7yoQugNwOogfUIoMT6eRuHLigGOk+l1E+5Kpy/GfZD5no9/kRt
 6keuuOVbaDDVT7k45qptP/yC0Z+/yNYFUtW6Vc/+r+x5/h2EfauDFQ/iDheoGkCsIvWr
 0UFO9otSZAPJm9yAXtTPVIiId6dByAVcuGuEypfPX0Ht5q7voA7cL3VKt+f2HHvQ/S+r
 IwTl7+sb4kbhMSzXatPz23BGfH2AKypi5fm86RjMejfkSSmBo1ujF44I/F0Oy0qth3yp
 BhYeFJJf5oX9B+m+IHNFPMi+Umcr1A7htELy6/+WG/9BO80B8J1YGMx5YujxKLF+0WuB
 SJlw==
X-Gm-Message-State: AOAM533IrtNizMoGxz4ByZ3XT8oK1yS3i8RTCFlNp9MxytmGL8AabosA
 Np5K6Az7BSmM2L0s3/+xnQJUIerbblXKn3IwaN4=
X-Google-Smtp-Source: ABdhPJyKgCIqyLfVtKw0mKE1RMVrBqApojOOdmWWSlYUOlyQZtY39cOmxgZPxP8Ymgdxb7et8cejOtrWp0SOxAg2bVA=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr7886259iov.93.1649392565758; Thu, 07
 Apr 2022 21:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220401125948.79292-1-richard.henderson@linaro.org>
 <20220401125948.79292-2-richard.henderson@linaro.org>
In-Reply-To: <20220401125948.79292-2-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Apr 2022 14:35:39 +1000
Message-ID: <CAKmqyKNar54eXe0pr=L8dBffG0FFAZnYFPAkK5X_1rnQNcoxvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Use cpu_loop_exit_restore directly from
 mmu faults
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Fri, 08 Apr 2022 04:36:11 -0000

On Fri, Apr 1, 2022 at 11:01 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The riscv_raise_exception function stores its argument into
> exception_index and then exits to the main loop.  When we
> have already set exception_index, we can just exit directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1c60fb2e80..126251d5da 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1150,7 +1150,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>      env->badaddr = addr;
>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
> -    riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
> +    cpu_loop_exit_restore(cs, retaddr);
>  }
>
>  void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> @@ -1175,7 +1175,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>      env->badaddr = addr;
>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
> -    riscv_raise_exception(env, cs->exception_index, retaddr);
> +    cpu_loop_exit_restore(cs, retaddr);
>  }
>
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> @@ -1311,7 +1311,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                              first_stage_error,
>                              riscv_cpu_virt_enabled(env) ||
>                                  riscv_cpu_two_stage_lookup(mmu_idx));
> -        riscv_raise_exception(env, cs->exception_index, retaddr);
> +        cpu_loop_exit_restore(cs, retaddr);
>      }
>
>      return true;
> --
> 2.25.1
>
>

