Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB52CC47074
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 23:04:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLWle-0006t0-1r; Thu, 04 Jan 2024 18:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWlc-0006s8-Dx; Thu, 04 Jan 2024 18:04:48 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWla-00087l-7R; Thu, 04 Jan 2024 18:04:47 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6dc0edf014cso578924a34.2; 
 Thu, 04 Jan 2024 15:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704409484; x=1705014284; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFesNwMAxvfR46NbGNfdN0C3M0HF96HRzSRVzUGOgug=;
 b=Xnlg95uwM7AWu4iFZ/cA1+lYQrpQVUlhMmxUxtYwReqhJM+hCPyxhNR0Ex56ho4bMq
 DaN6vLeBZenVxjViaqLy6meENBa5GzpdH9QV9enSPUTTf4T3ak5bjhdD5da8g1FCFh11
 GJa2zWD5p6901wJsrLcEmVALa49P9bzkNvu4d9gxGzUvQ7g66q3whPVXgvyGBIu3Q0OD
 IdI6TRzYPWuA8AKM3n0fJfvvUTTdSqiRkltmCBYIQlywC7858PSgwndQyEr46xKx0Zdm
 E82v0m5JxcjacOSFiMFS8yPRKCFh0B4k2JWymrNVnhtmKM1gEcKcmqPO6cHxlrGVcJ5B
 qvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704409484; x=1705014284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFesNwMAxvfR46NbGNfdN0C3M0HF96HRzSRVzUGOgug=;
 b=o9OgNwVTZjDRvpEXBL4GP1W14yTOdpz0FiXTBaLPiYA76i/73wUxuLchwScY0ga9PB
 7gRNCpaPXns7FchKnfDk1b4S6kDQh9z89o6i9FQ3qdUX1oJ1ZAW818Qr7EwyJRsjRu83
 1U9J7n9s0PsnqQMTw29aca5YRJ3+KKxgB3bRa/W67Z9/BbX9keXLexyVB4I7mxjxA79n
 n2h2mqUeSwzQ/mcXwq85a5YAgepmrFNsNkw/dC6+Sj0xHEtsMKC/3sFj4HKQUHCb7byu
 F0kB5dbwi5CkWm8s0bC4qtPPlzAJdTTQocjWvuZi4OokT0j52QvUvIT6NLm9PeK1qvdM
 Jl9g==
X-Gm-Message-State: AOJu0Yx3MwJPtRozTwBg2tFSuTJh5ZHqIIKbzBV517xOkKsraCJlIEZ7
 BmtAtN1BoPkRpd+Fvgg2MFums68HEp1lRDRCP5k=
X-Google-Smtp-Source: AGHT+IFeqJmW9WMmMeAq02x832E1ePI0jgAxktahpPOAjPIP1xWmj9Xv5ihNpAvbs11gQP+qRmuMy46kWFeYq2fNGY0=
X-Received: by 2002:a05:6830:1e7a:b0:6d8:74f5:dc38 with SMTP id
 m26-20020a0568301e7a00b006d874f5dc38mr1262281otr.9.1704409484560; Thu, 04 Jan
 2024 15:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-23-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-23-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 09:04:18 +1000
Message-ID: <CAKmqyKP2J7irBvi6nRrnOPfAYzULOXyYK+CPHqOvHOPqPsDDGg@mail.gmail.com>
Subject: Re: [PATCH v13 22/26] target/riscv/cpu.c: add riscv_cpu_is_32bit()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x335.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Dec 18, 2023 at 11:01=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Next patch will need to retrieve if a given RISCVCPU is 32 or 64 bit.
> The existing helper riscv_is_32bit() (hw/riscv/boot.c) will always check
> the first CPU of a given hart array, not any given CPU.
>
> Create a helper to retrieve the info for any given CPU, not the first
> CPU of the hart array. The helper is using the same 32 bit check that
> riscv_cpu_satp_mode_finalize() was doing.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 7 ++++++-
>  target/riscv/cpu.h | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6af1148cf5..1dea5db52d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -53,6 +53,11 @@ const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RV=
F, RVD, RVV,
>  #define BYTE(x)   (x)
>  #endif
>
> +bool riscv_cpu_is_32bit(RISCVCPU *cpu)
> +{
> +    return riscv_cpu_mxl(&cpu->env) =3D=3D MXL_RV32;
> +}
> +
>  #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>      {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
>
> @@ -980,7 +985,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, dis=
assemble_info *info)
>  #ifndef CONFIG_USER_ONLY
>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>  {
> -    bool rv32 =3D riscv_cpu_mxl(&cpu->env) =3D=3D MXL_RV32;
> +    bool rv32 =3D riscv_cpu_is_32bit(cpu);
>      uint8_t satp_mode_map_max, satp_mode_supported_max;
>
>      /* The CPU wants the OS to decide which satp mode to use */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1f34eda1e4..485d2da3c2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -695,6 +695,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *=
pc,
>                            uint64_t *cs_base, uint32_t *pflags);
>
>  void riscv_cpu_update_mask(CPURISCVState *env);
> +bool riscv_cpu_is_32bit(RISCVCPU *cpu);
>
>  RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>                             target_ulong *ret_value,
> --
> 2.43.0
>
>

