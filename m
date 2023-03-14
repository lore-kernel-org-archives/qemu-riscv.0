Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbx9q-0000u5-Lu
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 01:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbx9o-0000pk-M6; Tue, 14 Mar 2023 01:25:08 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbx9m-0006wX-WC; Tue, 14 Mar 2023 01:25:08 -0400
Received: by mail-vs1-xe33.google.com with SMTP id o6so13018025vsq.10;
 Mon, 13 Mar 2023 22:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678771503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FoLNq+OW0v7CduXCqZvnR6oH62QnRFLtgj/AF73sd8=;
 b=QdgXIIcJypRKlgavXm5JNjO8l5ofK8mVMNTRwK+OMZP7A3r8TfFT4A8DKL9OC1qmQ5
 mACN8aMF9kGXrPjKH1eBXbTCtakJtrEw23pfrLKsN02gTBWCRqWDZhz2kb1n5HaLZfUC
 ksOZjlHnIWwt4clu9uZES5MHzVmADBxd+ilqTfDXjLc1hv5aflPE5JhJs4qDnXLM6y3p
 bUYOTJzM2qYP9VY/k7LVvn6CIBej7Ykg87kQvJ7Vgrs4JzsY9nLMIVh6MoKknONdWb4D
 P40uvt37K1GpphMgLOeoejLSsGb881a8QB0gFgui6ylk9d3pbAJ6v+BlQxk7WawqmlMD
 YkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678771503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FoLNq+OW0v7CduXCqZvnR6oH62QnRFLtgj/AF73sd8=;
 b=45lr+rXKlKN8oaKehoHulKRojBjEAH9lXa9+4aworM4H/Opeo9wACiJdBso19uj9bc
 tELoh5rwTYq5QWxp9zwHumyM9kK1LdVAxEVu4lUmLwfwnlGeEKCzXSlA1DxKGvw41BH+
 GzCNa282iIF8oW2fvOKCiqDI2+vT48Bk2YYCK3gAwlP8V/OZoyf39AUKOg2A6OjVbFLO
 N88MJxPMT1Nq/JFgvvQE9xyito97jQhGlptRd2909dKlAfN+gzM4hiX4VWQ8nnXlKprZ
 V/rQPLxziHtjNjJ8uUymuNaxvmv1B+VXQpD+JfJIrC/YbeCjjqenx+GlimPONigZZQqS
 MMug==
X-Gm-Message-State: AO0yUKV+plao/mxm4PyNYcOfk4Ip1b1W/uvIq+6c+RMFWVAMZswqI9YB
 ElGEgxasDEjyKF8UivGm+MhdppcnjuZ2KHcR5rs=
X-Google-Smtp-Source: AK7set+Z9JDr8BX/imVl+2ALH2FTv0rkXHd4xayPebH4/B7fioIOzRtNQ/mzf42lHD35tggKzCtCQQw/4fRXgF3UQPI=
X-Received: by 2002:a67:cfc6:0:b0:402:999f:51dd with SMTP id
 h6-20020a67cfc6000000b00402999f51ddmr24193698vsm.3.1678771503682; Mon, 13 Mar
 2023 22:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230309071329.45932-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Mar 2023 15:24:37 +1000
Message-ID: <CAKmqyKNzQzqMhL=00CGM1WXTduHVatQR=wrLPzubU3Kdk=JkLQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Simplify getting RISCVCPU pointer from
 env
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
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
X-List-Received-Date: Tue, 14 Mar 2023 05:25:09 -0000

On Thu, Mar 9, 2023 at 5:14=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> Use env_archcpu() to get RISCVCPU pointer from env directly.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index b8e56d2b7b..a200741083 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -223,7 +223,7 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState=
 *env,
>          return true;
>      }
>
> -    cpu =3D RISCV_CPU(env_cpu(env));
> +    cpu =3D env_archcpu(env);
>      if (!cpu->pmu_event_ctr_map) {
>          return false;
>      }
> @@ -249,7 +249,7 @@ bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,=
 uint32_t target_ctr)
>          return true;
>      }
>
> -    cpu =3D RISCV_CPU(env_cpu(env));
> +    cpu =3D env_archcpu(env);
>      if (!cpu->pmu_event_ctr_map) {
>          return false;
>      }
> @@ -289,7 +289,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, ui=
nt64_t value,
>                                 uint32_t ctr_idx)
>  {
>      uint32_t event_idx;
> -    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
> +    RISCVCPU *cpu =3D env_archcpu(env);
>
>      if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->pmu_event_ctr_ma=
p) {
>          return -1;
> @@ -390,7 +390,7 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_=
t value, uint32_t ctr_idx)
>  {
>      uint64_t overflow_delta, overflow_at;
>      int64_t overflow_ns, overflow_left =3D 0;
> -    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
> +    RISCVCPU *cpu =3D env_archcpu(env);
>      PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
>
>      if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscofpmf=
) {
> --
> 2.25.1
>
>

