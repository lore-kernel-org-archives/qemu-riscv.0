Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liPxc-0007rc-D9
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 19:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPxa-0007qF-BP; Sun, 16 May 2021 19:14:10 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:33502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPxY-00044X-Nr; Sun, 16 May 2021 19:14:10 -0400
Received: by mail-il1-x132.google.com with SMTP id z1so4565361ils.0;
 Sun, 16 May 2021 16:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=06Qu2QhlOKpt4y+54X/TACr4dQ2YoHnD05n/8ibURIM=;
 b=gY01rM1vdYcHrYN9Lolzb8yULpDr03M85naODPuQisd6tnYnxV1WuVIzfdGS5t0wRQ
 f463Mgb6+nJiJ3G3vHz943SiyjCaKcuZplZP9fNVV6OI/gc9O5astylZuf2JmyoyI8p6
 zgdRIMYft6KEPnze9bvxOlfEERFBym4P5wcMpXBm7JXbWbylhSJoY3bvEB7SAwMayczr
 D76Ac3TVL3ORFguDfE+lJluF/stpbkCrPZhGipYjBaCNYMnPD0k9+OCwsoL5KGRDa4q0
 E27YgTlvoMrW7/aKo8Ev0Aqa7JX5cvrwVMlB9RatkkXDtz8YqdkMk61jc3IesEA9h9CU
 CBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06Qu2QhlOKpt4y+54X/TACr4dQ2YoHnD05n/8ibURIM=;
 b=FvZFkEdGCRHnHXGqvMyn8yI59dYs8xRUjtGdy65Ix8ALb/ese4gbCDC858xaJat6ta
 MfZcc0Qs4cW67y0k2emFn+DiqhyNHQTSDibPYi8xIcd3swTCcnucDUVHG7O0rQDq+15r
 xj1Vqnvt5MWsKJwDEkR2X6yoNGb8d9fAfm8jfJZujUYPnKxqpzqMMhQvbAKLFJvOwIzc
 JieAE0UHGzprz75b0U2NCrGiZKDX0mjvs+4B+HSx92ohDEuTldd45titoskmfgOXDia7
 UJHm4ylnHwh/4djkVLiUACgYsfNstMS1+6HDt69GN1PvVQbKQhhmyMhaDUJDY/pOqhg0
 rPPQ==
X-Gm-Message-State: AOAM531fKefMb7DY89AbztKxZpZ00HDVgydUSffN61VNeR2V52qbuZ8z
 1l5Lc6Ek+LEK18kXx8xudZFVQ8G8rx3hLhtY/Ig=
X-Google-Smtp-Source: ABdhPJxxePneyStBOFA+6DlqSW1xccheRAmVBgjNrAXCJkydYlmjMcUdvLTshlwhJCCcz4n6ELjb1urBVlwnxQM120k=
X-Received: by 2002:a92:6b05:: with SMTP id g5mr49431957ilc.40.1621206847384; 
 Sun, 16 May 2021 16:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210514052435.2203156-1-bmeng.cn@gmail.com>
In-Reply-To: <20210514052435.2203156-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 May 2021 09:13:41 +1000
Message-ID: <CAKmqyKMWVGZLGALF7GfXDk2uLvti7KxQhpqFanHb37HniXigMg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove unnecessary riscv_*_names[]
 declaration
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 16 May 2021 23:14:10 -0000

On Fri, May 14, 2021 at 3:24 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> riscv_excp_names[] and riscv_intr_names[] are only referenced by
> target/riscv/cpu.c locally.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/cpu.h | 2 --
>  target/riscv/cpu.c | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7e879fb9ca..adba2ff533 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -318,8 +318,6 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
>
>  extern const char * const riscv_int_regnames[];
>  extern const char * const riscv_fpr_regnames[];
> -extern const char * const riscv_excp_names[];
> -extern const char * const riscv_intr_names[];
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
>  void riscv_cpu_do_interrupt(CPUState *cpu);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3191fd0082..7ee31f97a3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -51,7 +51,7 @@ const char * const riscv_fpr_regnames[] = {
>    "f30/ft10", "f31/ft11"
>  };
>
> -const char * const riscv_excp_names[] = {
> +static const char * const riscv_excp_names[] = {
>      "misaligned_fetch",
>      "fault_fetch",
>      "illegal_instruction",
> @@ -78,7 +78,7 @@ const char * const riscv_excp_names[] = {
>      "guest_store_page_fault",
>  };
>
> -const char * const riscv_intr_names[] = {
> +static const char * const riscv_intr_names[] = {
>      "u_software",
>      "s_software",
>      "vs_software",
> --
> 2.25.1
>
>

