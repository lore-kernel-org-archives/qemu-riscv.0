Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvVU-0003r3-Od
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvVS-0003ot-Jg; Wed, 05 Apr 2023 01:16:26 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvVQ-0003B2-Fe; Wed, 05 Apr 2023 01:16:25 -0400
Received: by mail-vs1-xe29.google.com with SMTP id h15so30483664vsh.0;
 Tue, 04 Apr 2023 22:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680671783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7hMz/LM5LOlvWVz4ib4pOnRU5W2nNXlngbsQwrP8JWY=;
 b=f78/KS4dGRQr79W/Qc009yki+FiEZxQJ4PbgCIsBm+9NumF5ab79W8Rf4wO9BjbVS5
 q90F3Y6nuSSzaL7ngqAoey1/KKweq8AyIs6zsJkv+vYyFr5ohOoTISbSx0oXc55ukBqi
 nX26QrqH9Gv74zCeTjSSv5xWQloXjriulZ+TuCYry4dmHGGJ49EH5E0hgzwjqYXunc00
 jBUjh45exz98zr3s6KxkYJAAtWBYASiua48NihMKh3Jw2AzCpQwBz9a6GwIfMsRd7fCn
 CE7ZipBoe2CZHIhS6Q5vwtodornJRX8Ua6m+yXXemXBf1RBkjpOYp0Msv1DAWqhijZS8
 djYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680671783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7hMz/LM5LOlvWVz4ib4pOnRU5W2nNXlngbsQwrP8JWY=;
 b=PRezqAha8rkYS1VqSniAYDtEyZ5+jz+r8iUmwB+pLmqj3a/dFUkfyyNjG4ErupXK1a
 Lx0bzsGuRrRn05H05sLxkknDjnfy6Wln//10DdFv0yzhBeUvhNVlNKCB/4/YD2HQouhl
 oLoOgUJUKuRWUo84PgpmSKtCbTATAmjmXLDJhG4kBnNZbKOHOty+gldLzEDnrojQgkxu
 tBiOFoafAX8OS1SHz46HdX6mjhU/i50eTUFZaPev/U1zJD1K1W4/260y6MQt05Jm286U
 Foq6t9wlKXFNxEYzJq9JOkabpOJk18ONm8L1LZNJk0IbxDhYgV2wPQQrehrjpYZ1vmqC
 08OA==
X-Gm-Message-State: AAQBX9eAT02RCgOR2zZySFrsgbBpLXaznJw1nib53AMllswB2ZCvh2df
 7MR+pTKJydyeuvn2g1IWdGGy52Pe4YyiQXtmqyA=
X-Google-Smtp-Source: AKy350Zd2t0RckPEGt2vV7+OJFtqRuoDqdEK7JtMIFAUHjG5naM294tOz11Y8OS24l8HGdXdvtu+3o2HjQYGuJsj8+s=
X-Received: by 2002:a67:c29e:0:b0:425:d39f:3882 with SMTP id
 k30-20020a67c29e000000b00425d39f3882mr4010268vsj.3.1680671782890; Tue, 04 Apr
 2023 22:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:15:56 +1000
Message-ID: <CAKmqyKMh4LhmQFSo86cWzXLEkhx4aFULsYA=+yXJRBEf8ko1Uw@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: Convert env->virt to a bool
 env->virt_enabled
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:16:27 -0000

On Sun, Mar 26, 2023 at 12:55=E2=80=AFAM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
> Currently we only use the env->virt to encode the virtual mode enabled
> status. Let's make it a bool type.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.h        | 2 +-
>  target/riscv/cpu_bits.h   | 3 ---
>  target/riscv/cpu_helper.c | 6 +++---
>  target/riscv/machine.c    | 6 +++---
>  target/riscv/translate.c  | 4 ++--
>  5 files changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..3c8041c5a4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -183,7 +183,7 @@ struct CPUArchState {
>  #ifndef CONFIG_USER_ONLY
>      target_ulong priv;
>      /* This contains QEMU specific information about the virt state. */
> -    target_ulong virt;
> +    bool virt_enabled;
>      target_ulong geilen;
>      uint64_t resetvec;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fca7ef0cef..45ddb00aa5 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -607,9 +607,6 @@ typedef enum {
>  #define PRV_H 2 /* Reserved */
>  #define PRV_M 3
>
> -/* Virtulisation Register Fields */
> -#define VIRT_ONOFF          1
> -
>  /* RV32 satp CSR field masks */
>  #define SATP32_MODE         0x80000000
>  #define SATP32_ASID         0x7fc00000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..56f4ff9ccc 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -564,7 +564,7 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env)
>          return false;
>      }
>
> -    return get_field(env->virt, VIRT_ONOFF);
> +    return env->virt_enabled;
>  }
>
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
> @@ -574,11 +574,11 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env,=
 bool enable)
>      }
>
>      /* Flush the TLB on all virt mode changes. */
> -    if (get_field(env->virt, VIRT_ONOFF) !=3D enable) {
> +    if (env->virt_enabled !=3D enable) {
>          tlb_flush(env_cpu(env));
>      }
>
> -    env->virt =3D set_field(env->virt, VIRT_ONOFF, enable);
> +    env->virt_enabled =3D enable;
>
>      if (enable) {
>          /*
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 9c455931d8..0fb3ddda06 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state=
 =3D {
>
>  const VMStateDescription vmstate_riscv_cpu =3D {
>      .name =3D "cpu",
> -    .version_id =3D 7,
> -    .minimum_version_id =3D 7,
> +    .version_id =3D 8,
> +    .minimum_version_id =3D 8,
>      .post_load =3D riscv_cpu_post_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> @@ -352,7 +352,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
>          VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
>          VMSTATE_UINTTL(env.priv, RISCVCPU),
> -        VMSTATE_UINTTL(env.virt, RISCVCPU),
> +        VMSTATE_BOOL(env.virt_enabled, RISCVCPU),
>          VMSTATE_UINT64(env.resetvec, RISCVCPU),
>          VMSTATE_UINTTL(env.mhartid, RISCVCPU),
>          VMSTATE_UINT64(env.mstatus, RISCVCPU),
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..c3adf30b54 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1255,8 +1255,8 @@ static void riscv_tr_disas_log(const DisasContextBa=
se *dcbase,
>
>      fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
>  #ifndef CONFIG_USER_ONLY
> -    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n",
> -            env->priv, env->virt);
> +    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: %d\n",
> +            env->priv, env->virt_enabled);
>  #endif
>      target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
>  }
> --
> 2.17.1
>
>

