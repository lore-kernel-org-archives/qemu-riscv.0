Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4A6C4707B
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 23:03:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO459-0004P6-Ml; Thu, 11 Jan 2024 18:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO454-0004O5-Cz; Thu, 11 Jan 2024 18:03:22 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO452-0001lP-Np; Thu, 11 Jan 2024 18:03:22 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-dbed7c0744cso4709468276.2; 
 Thu, 11 Jan 2024 15:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705014198; x=1705618998; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZFaa1dCXKOFI3HNg6SWDiaEQGaRzOVjsloIEVfx4Sjk=;
 b=PTVuUG0ra1/q9OQqkVF9skrZYAAFyJsGb4APi75N5eN/oCVO/mc98aSgmedOrlJyLA
 wMM0Xr5fpmO/Elb+YCxudAxa6jGFSaYNdhoiRMC+S97BlpvB+VxRtPOFYjCCRUnHSVrz
 Dba2NgNU8kx+1j7uXUcPHQfQAlnKh1AjngEmi8d5t/3H86zS4w5Vm3viwxei9IqdzIkz
 qW2SxwlPc5D/hqGznaWziHJ0KUTpKHjL+3xOB2/9be1QnxPJGOF4pEgzgmNaGTsgUBFg
 9LEshqinNPjTbYIuki+U3/VS8b9U4zeIxAGm09T8yXtGbcymuSnVxSuIhJqeHhMy93af
 ajEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705014198; x=1705618998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZFaa1dCXKOFI3HNg6SWDiaEQGaRzOVjsloIEVfx4Sjk=;
 b=Cmbn3A52/459vERgwaqLzc0EEPMOmFCDAO1iUE4dum8CxthWdmqL+OUFdTg+sXm3oi
 iWuVH8qxA5Rqt2gxcKxpQpO8n5V/J23582WoFqKaxcFocFihXK3kLzi6vJ2k0UV0BHgJ
 vG3/E+P/dzMnud20Y/sTcfkU2BDuVKKX4FBlmDZX0Q3wumRtyix44KPdUvwD3j4bwSUS
 UIbpMIepZ478w01LZnDCr2aW+bQc1RTVyIUywAUtGGWF/RmQ2PeuJbg9MDqP04iIVuBa
 h1BDdrPmPeAX2IU9ku9lFwKdsjoWetq43oNxDcyuxnhTqoCPZmhW+2r6HOnI0aBgFHo7
 eqgg==
X-Gm-Message-State: AOJu0YxdFH8V3RWiQqkVMA4lYvl2UxVMz1roYzyRKn5LjiRyinuHrL+B
 +OHoDM5pmwnt/aniCfVahIwT9EH3QTIixRIfDN4=
X-Google-Smtp-Source: AGHT+IFRR8KySoZ1XaW+4/J00YzKCFkhk0XgElwF8QZBLkh2Fc9i4KW9FaT3sI5BioesqDgqdhWPhUvPa2IDZ/uZ+QQ=
X-Received: by 2002:a25:81c8:0:b0:dbd:45b5:7037 with SMTP id
 n8-20020a2581c8000000b00dbd45b57037mr333768ybm.105.1705014198326; Thu, 11 Jan
 2024 15:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20240111161644.33630-1-rbradford@rivosinc.com>
 <20240111161644.33630-2-rbradford@rivosinc.com>
In-Reply-To: <20240111161644.33630-2-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 09:02:51 +1000
Message-ID: <CAKmqyKMiq=OeazFTSbjX5sqDYFgdYc0CHA=HuBxJMc3em1nn6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: Add infrastructure for 'B' MISA
 extension
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=alistair23@gmail.com; helo=mail-yb1-xb35.google.com
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

On Fri, Jan 12, 2024 at 3:38=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> Add the infrastructure for the 'B' extension which is the union of the
> Zba, Zbb and Zbs instructions.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 5 +++--
>  target/riscv/cpu.h         | 1 +
>  target/riscv/tcg/tcg-cpu.c | 1 +
>  3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8cbfc7e781..fc01c10e24 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -38,9 +38,9 @@
>  #include "tcg/tcg.h"
>
>  /* RISC-V CPU definitions */
> -static const char riscv_single_letter_exts[] =3D "IEMAFDQCPVH";
> +static const char riscv_single_letter_exts[] =3D "IEMAFDQCBPVH";
>  const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
> -                              RVC, RVS, RVU, RVH, RVJ, RVG, 0};
> +                              RVC, RVS, RVU, RVH, RVJ, RVG, RVB, 0};
>
>  /*
>   * From vector_helper.c
> @@ -1299,6 +1299,7 @@ static const MISAExtInfo misa_ext_info_arr[] =3D {
>      MISA_EXT_INFO(RVJ, "x-j", "Dynamic translated languages"),
>      MISA_EXT_INFO(RVV, "v", "Vector operations"),
>      MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
> +    MISA_EXT_INFO(RVB, "x-b", "Bit manipulation (Zba_Zbb_Zbs)")
>  };
>
>  static int riscv_validate_misa_info_idx(uint32_t bit)
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5f3955c38d..3843d44fc9 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -69,6 +69,7 @@ typedef struct CPUArchState CPURISCVState;
>  #define RVH RV('H')
>  #define RVJ RV('J')
>  #define RVG RV('G')
> +#define RVB RV('B')
>
>  extern const uint32_t misa_bits[];
>  const char *riscv_get_misa_ext_name(uint32_t bit);
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 14133ff665..5396c6c3eb 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -1056,6 +1056,7 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>      MISA_CFG(RVJ, false),
>      MISA_CFG(RVV, false),
>      MISA_CFG(RVG, false),
> +    MISA_CFG(RVB, false),
>  };
>
>  /*
> --
> 2.43.0
>
>

