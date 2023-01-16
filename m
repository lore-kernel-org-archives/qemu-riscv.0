Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHIWh-0007nC-FA
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 00:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHIWW-0007aB-7p; Mon, 16 Jan 2023 00:59:15 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHIWR-0004Yq-Bh; Mon, 16 Jan 2023 00:59:08 -0500
Received: by mail-pg1-x532.google.com with SMTP id f3so18944835pgc.2;
 Sun, 15 Jan 2023 21:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PZSoNavF47DlJv5tWW3a381+KKvDxpiX/lXLvUhxTV0=;
 b=Dlb1lROXKoBri2a9SMtNtbqa70brVxlW+PCeySPhTZm2e3jXlYaFC6rVAln+nWgy2x
 K3H74Mo2wnMoFmhqFY8SAHU1th0FKtLggbhcH3GdPw5z0B9pUobYCDnN64SRJ7GdWAMk
 L1uW8vug3q0Oua0R2FWRBMGXZDbJkotjLvOcqcuD7bVjuFfB0zR2D5sHrK1svqVofpGN
 ab9ecmjOWnWL2i6EXJl26DGYmWkMaMDw8AH1TmhnxlWIILoMt7gbwG40epfGhCQwhj82
 Ga6fMYLZT10oi7bYdrBVGSOCgVoocdpGLsz1MCvfyuhcQsXlQi9nBjCq9JjSgBa+izie
 B5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PZSoNavF47DlJv5tWW3a381+KKvDxpiX/lXLvUhxTV0=;
 b=iyBNWqDKS8CxEedKQJQ2eV1c1HVSkcw6UMmCi9gAn3umKZMw2d21IuJFtSZRpdulFe
 BWGsqU2fh8/5f8563YYi0QaWLYG6iQVxGSC4UgVqHvNQZAe+RgjQTzskG1Tl/54Jg1l7
 e2XRh8GPgXUkPLeCgB3Kl18367f2D4dhYwrow0K7LoSz2vBla1qrQs41Zz8IYKloel2s
 zO5CwUq7lraMJEv9tlTQmOJsLV81YaFl4pbB1h1JlVXJst4QsKD6ra9APKpwDtgxmB83
 u1grl4Ep7zo9llflM7zafKbZCmvq/BQDQRrb1bzMlkOXv24PzOs7pt9eVS9szMTy7wQh
 pPEA==
X-Gm-Message-State: AFqh2kqw3o/O+6IvKTqh31ddof2kdcHW1VIf8wXatp+w/npb3EpYAJ3R
 Zi272zjvXmjv7bw8rWOphNRtqJYPH5syBPTKTQ1gOQGZ+7/xTw==
X-Google-Smtp-Source: AMrXdXsaIBsO6AqGITE932OfiU1DBlDTxyuYRkjQFKuSOs+ST6OLkpXQKmpqk4o19XzUTIDzHpgwrCHKGrj3LNcpx1g=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr11678769vsb.10.1673846709549; Sun, 15
 Jan 2023 21:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20221215224541.1423431-1-abrestic@rivosinc.com>
 <20221215224541.1423431-2-abrestic@rivosinc.com>
In-Reply-To: <20221215224541.1423431-2-abrestic@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 15:24:43 +1000
Message-ID: <CAKmqyKOyzZNcQk5tV2rK5dsLmGtD9FQryNrRSna3f=DY6YfDTQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Trap on writes to stimecmp from VS when
 hvictl.VTI=1
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 05:59:21 -0000

On Fri, Dec 16, 2022 at 8:46 AM Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> Per the AIA specification, writes to stimecmp from VS level should
> trap when hvictl.VTI is set since the write may cause vsip.STIP to
> become unset.
>
> Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp support")
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/csr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 984548bf87..7d9035e7bb 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -935,6 +935,9 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>      RISCVCPU *cpu = env_archcpu(env);
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          return write_vstimecmp(env, csrno, val);
>      }
>
> @@ -955,6 +958,9 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>      RISCVCPU *cpu = env_archcpu(env);
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          return write_vstimecmph(env, csrno, val);
>      }
>
> --
> 2.25.1
>
>

