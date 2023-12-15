Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3564C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 05:47:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE12u-0004IK-Qn; Fri, 15 Dec 2023 00:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE12t-0004Hw-Au; Fri, 15 Dec 2023 00:47:35 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE12r-00024f-PL; Fri, 15 Dec 2023 00:47:35 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4b328087918so94611e0c.0; 
 Thu, 14 Dec 2023 21:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702619252; x=1703224052; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hcq/ndHj8Ok7Gl+G7eFrNLL/sNLWqXtJLqr7wSTIMys=;
 b=ePiPDuGxHSAUgXazMRMs2sdYHLfG3vCZqaZFergVyYUKMaGzQUFquYfDrm4XTtZ4GT
 FqsF8ZDgpfKENyyh7EBTzKDxT/99ct4EvLBMUpH6xTCIZvWzAXIUNoY7Y6x1UU1Obc7P
 oWrI2t3mhBQJhKy/aal0MVvAi3P/kez2nm5KBA7cr7s0r5U12pMpGI17dQSE1GSP1eE3
 pPvvfu6AQWTjZP1rvr2PF+VVOwPHvBR7xCVqKxuEz8/UqSUulrzYleW+0shbRFKHwNNr
 4k6vPlHhtcLQf/bBK60UYvwUaFAOyAcrC1d5OKPM5u02CNJgwtEcnyb+ThhM3PQU2bJb
 5phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702619252; x=1703224052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hcq/ndHj8Ok7Gl+G7eFrNLL/sNLWqXtJLqr7wSTIMys=;
 b=OuwiATYks7OgbMh1nBBzubnLxVS+gxIjMVAU5bUwLRUpycqgOvlDwh/AcxORzVttl9
 NyPZwi13r6NhCuj1/CiN3/Sg1+Xo7VcunCK4cqrudnc3C7rvyZZGZj14jId9hMoOvKed
 XDxAo57z9yQ7R6wdvF78cV8hBQmKgrJiwVWPbIxyLvmnvzs57ROns+6o2cNKInKIRjxV
 5nrlO0Ldn1powEHmtk44cTvpItx5WEM9b86FnPWeiIoMfW/68Rr6p9kXnGmfxFkyaIfb
 mym98S3Vyd5t8pIi4LNMVH0HYBA1ij0O7K2gFPCs6JZaF8aNok5azv9U+cFlxmGJ+sue
 60Pg==
X-Gm-Message-State: AOJu0YyfLoxDu4ebC9QLhudGXEokxsAhO8ZY3LvlypF9wyjTZv2o3cp9
 0hemHtu0tblnHGLz9c0Jf+9rPoYFotOVgURZfKI=
X-Google-Smtp-Source: AGHT+IH0iJS2/jHqQLMzac0sRtALfWrqpqUNqtGuV4d2NLRAka4rpLjkcy91Qz0FLV+XxTtlYW0CN1mznLy+nmasmls=
X-Received: by 2002:a05:6122:3a05:b0:4b2:c554:d2b2 with SMTP id
 fp5-20020a0561223a0500b004b2c554d2b2mr8607356vkb.20.1702619252333; Thu, 14
 Dec 2023 21:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20231213-riscv-v7-0-a760156a337f@daynix.com>
 <20231213-riscv-v7-4-a760156a337f@daynix.com>
In-Reply-To: <20231213-riscv-v7-4-a760156a337f@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Dec 2023 15:47:06 +1000
Message-ID: <CAKmqyKNZ8pHSV1ubEBJMhSDfwqUJVSXPps8KvCM-AZQktN-78Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] target/riscv: Validate misa_mxl_max only once
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov <a.anenkov@yadro.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Wed, Dec 13, 2023 at 4:12=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> misa_mxl_max is now a class member and initialized only once for each
> class. This also moves the initialization of gdb_core_xml_file which
> will be referenced before realization in the future.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 21 +++++++++++++++++++++
>  target/riscv/tcg/tcg-cpu.c | 23 -----------------------
>  2 files changed, 21 insertions(+), 23 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2ab61df2217e..b799f1336041 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1247,6 +1247,26 @@ static const MISAExtInfo misa_ext_info_arr[] =3D {
>      MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
>  };
>
> +static void riscv_cpu_validate_misa_mxl(RISCVCPUClass *mcc)
> +{
> +    CPUClass *cc =3D CPU_CLASS(mcc);
> +
> +    /* Validate that MISA_MXL is set properly. */
> +    switch (mcc->misa_mxl_max) {
> +#ifdef TARGET_RISCV64
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> +        break;
> +#endif
> +    case MXL_RV32:
> +        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  static int riscv_validate_misa_info_idx(uint32_t bit)
>  {
>      int idx;
> @@ -1695,6 +1715,7 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
>
>      mcc->misa_mxl_max =3D (uint32_t)(uintptr_t)data;
> +    riscv_cpu_validate_misa_mxl(mcc);
>  }
>
>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 7f6712c81a49..eb243e011ca3 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -148,27 +148,6 @@ static void riscv_cpu_validate_misa_priv(CPURISCVSta=
te *env, Error **errp)
>      }
>  }
>
> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
> -{
> -    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> -    CPUClass *cc =3D CPU_CLASS(mcc);
> -
> -    /* Validate that MISA_MXL is set properly. */
> -    switch (mcc->misa_mxl_max) {
> -#ifdef TARGET_RISCV64
> -    case MXL_RV64:
> -    case MXL_RV128:
> -        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> -        break;
> -#endif
> -    case MXL_RV32:
> -        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -}
> -
>  static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -676,8 +655,6 @@ static bool tcg_cpu_realize(CPUState *cs, Error **err=
p)
>          return false;
>      }
>
> -    riscv_cpu_validate_misa_mxl(cpu);
> -
>  #ifndef CONFIG_USER_ONLY
>      CPURISCVState *env =3D &cpu->env;
>      Error *local_err =3D NULL;
>
> --
> 2.43.0
>
>

