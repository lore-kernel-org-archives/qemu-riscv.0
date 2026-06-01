Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6003DCD6E4C
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 04:02:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtqx-0000ZT-TS; Mon, 01 Jun 2026 00:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtqt-0000V9-2u
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:02:11 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtqo-0004ND-F8
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:02:10 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-bec354815b9so75837766b.3
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 21:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780286519; cv=none;
 d=google.com; s=arc-20240605;
 b=kMIfx8CQWKauuUQcH2VEwYDS/xnTOQpbn12+HmNBAaqiu3mgLLIketmeDx+kbNmX5N
 AFFFm+v1Hcb2CTTfMWjW66RG97+F3/67ZUKcH3useNFgDz5PyrbACLmXEvdWawZ2tkxl
 oFT4QIu/gZWi0OgWzqR/wBxBosztt3jo96mL1CN6u3oJWyr7HMAzaH9h64rbpj44O1jG
 nMn3MeIENoV2UiP2RO3dlhwLwiul9lTywWSTo3l7WBEOzvVSre2tqNPdo2onwBFJmNJP
 HjGdeSiZelxcn+UtcoRmHx5GY/VZkiCwDwKaeIrgd47i8KK+TqjrzVADgOpa92y7snwt
 wG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DX/zhTy1G+KgOpljuyHnQpwRFt5NBV4ajXBV/26qH8E=;
 fh=D5ca/qDcesgqm+qhIO3n8oh/jv6jXNgDjRm//kt8kM8=;
 b=HKYHCpZ3Ux0dFCnTDRAZRXHnRBVvHSqFlA/XALXhs5fdlxuBKh/9V4UOqqqKAmm0Yz
 xH6DiLDCi8Lkro0h3CZ+R7Zv1VI3JAp5p4IvitorBosDRo2T04+aLxTwOsDQfNukrNUD
 9rbqsSeiEHZebmbzKnSQB9v4LcK7ebk5iPJoYeGwuUFbbScVkyKlI6vvlKgkji8HAgvs
 FpgaKFIJ5k5hLWP3mjtfRb6rHJ882FRGVRHbIJT7Yw26lLrk8OfzYXm8IjVP+tNB6W4Z
 BSWrIxqGNENR7PCqyqmG2/ttG+rGzWcasdD2tvNi3TMGXEmW5Bzw3V/cAZRtImggqN1m
 nwsg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780286519; x=1780891319; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DX/zhTy1G+KgOpljuyHnQpwRFt5NBV4ajXBV/26qH8E=;
 b=QE2ApdTY8alrPGJycoQN7fGq0AiO3oOUrBzyxOSeI8Otsbj7wTPbwS38lG4hwIyAas
 CNLc1lsCRLZa9KxyvWhJvCfUlSrmJ3QpfphPG6983q0EiA1GI9Z10VvpQA16InHBtzty
 Zx4Xa6zsp7S/8xL/WAXzbFl46BGx+W4pYbeN0iEfk+RX8CuR8JBUqK1fJ411uA80obK4
 6o7K1GMZ3cRELNyL8ntHZ+/N5TDMp/KnPzHZO28PY7MwIeUFFvjg39GzM1rmBHlg32Ct
 WYVRZA3SxJaT6OJHY2rY0tvJLf7wUQu4cuGz97WsrCo5M49r52X8UU2ADYlreIc9vi8w
 QJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780286519; x=1780891319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DX/zhTy1G+KgOpljuyHnQpwRFt5NBV4ajXBV/26qH8E=;
 b=MoJnKvklKqF3ZtMKEBmtHmKrfFjgklZ96XtQG/U5UaD9tYny+XrixSHFvJ9QSjv+h9
 cjch638J3uIWtD0OJvm0rfLd1afYy76mf0U01sML+Yisd5xKZSp6Fv0oQKCy8ULfDqNR
 wtLruc4YtgyXQqPXYyGRBvq/cSgv4Y0zMrdmYANeTXJU5RZ896lra+FX6Hdm0noHsZ+o
 Bv6R0hkqJIHzL6sQFmuVPB+xW90gcteZaQRdXWnvVGG+aNnBBdcikir4Wyf1eat+9RFt
 ja59GptaGAEk6fz5DUwSlQlCiugj0fH+YjdrSpbFepveytSEd7VgFsZqiftubttL1xYm
 ujFw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+4lE9vsdOcaT4X0ZZiUxKGSqtET/H/yTiaoJuCeEdhr/Vj+6Wde46goj2s6M4WPcQ3IEI/1ks9BuqR@nongnu.org
X-Gm-Message-State: AOJu0YyR5v9CLWJJmz+DdcjccxrG/cT6aRkpncgBzpAqW6Oq9LPam4z5
 o8JgcuxUXJyWx9Edx9Em0VAg8OXWczV3ud1e7MmY47GuRiXgUXm2arGN+kmJTGXnHZbmwHGGGPk
 50qKuYThxXtjtHR2k5vqd5hvyqHicPiQ=
X-Gm-Gg: Acq92OH2GMJMMHWzffj450ar/0dsKKTffb3q7wkyV/SG2VA5ftwXQheo+Q9z1BKdgP8
 x/yBPN42SvBhjuh9J/2A8pj/YQZCv1O3cjH5gEcZVE4XfO0iZ6QbVmUV0oYCHTxK+aCbJ0zZQo/
 Fnnp5FLPV8a4FyK1hhqiaTJH17Kha6aTJjmkOuzvb/f6eN0fnLeyObSSTS2Rw14lRWNhwLH9Uji
 1WucAycKdDFSUlzoYs6WZBGea/UXbcDxPkzHSBpmP9f3g5ky29MjzjVSlHFTRDTzZGmUAfN2nTW
 Hf3XaqOhgl35/SJ/8sRR7Azmc5f69dpYfuCvima5xsttTzdZ
X-Received: by 2002:a17:907:cbc5:b0:bee:ed4:ea17 with SMTP id
 a640c23a62f3a-bee0ed4f227mr31421966b.26.1780286518453; Sun, 31 May 2026
 21:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-11-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-11-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 14:01:32 +1000
X-Gm-Features: AVHnY4IlAKzrX2Ega-3WlFsSdHvz-ReaFtUCNe2iLy1qLA-GO010IlDh0LLjn88
Message-ID: <CAKmqyKNdsv9W0OK69nLh=xaAX-3t9fXVhNFWfrswtk=UsCcg8A@mail.gmail.com>
Subject: Re: [PATCH v11 10/12] hw/riscv/boot: Honour data endianness
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, May 28, 2026 at 6:16=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
>
> Check the hart endianness property and use it throughout the boot code:
>
> - ELF loading: pass ELFDATA2MSB or ELFDATA2LSB based on endianness
> - Firmware dynamic info
> - Reset vector: instructions (entries 0-5) remain always little-endian,
>   data words (entries 6-9) use target data endianness.
>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Co-developed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 40 ++++++++++++++++++++++++++++------------
>  1 file changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 4297949f6be..7c9cd614681 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -407,21 +407,31 @@ void riscv_rom_copy_firmware_info(MachineState *mac=
hine,
>      struct fw_dynamic_info64 dinfo64;
>      void *dinfo_ptr =3D NULL;
>      size_t dinfo_len;
> +    const bool rv32 =3D riscv_is_32bit(harts);
> +    const bool be =3D harts->harts[0].cfg.big_endian;
>
> -    if (riscv_is_32bit(harts)) {
> -        dinfo32.magic =3D cpu_to_le32(FW_DYNAMIC_INFO_MAGIC_VALUE);
> -        dinfo32.version =3D cpu_to_le32(FW_DYNAMIC_INFO_VERSION);
> -        dinfo32.next_mode =3D cpu_to_le32(FW_DYNAMIC_INFO_NEXT_MODE_S);
> -        dinfo32.next_addr =3D cpu_to_le32(kernel_entry);
> +    if (rv32) {
> +        dinfo32.magic =3D be ? cpu_to_be32(FW_DYNAMIC_INFO_MAGIC_VALUE)
> +                           : cpu_to_le32(FW_DYNAMIC_INFO_MAGIC_VALUE);
> +        dinfo32.version =3D be ? cpu_to_be32(FW_DYNAMIC_INFO_VERSION)
> +                             : cpu_to_le32(FW_DYNAMIC_INFO_VERSION);
> +        dinfo32.next_mode =3D be ? cpu_to_be32(FW_DYNAMIC_INFO_NEXT_MODE=
_S)
> +                               : cpu_to_le32(FW_DYNAMIC_INFO_NEXT_MODE_S=
);
> +        dinfo32.next_addr =3D be ? cpu_to_be32(kernel_entry)
> +                               : cpu_to_le32(kernel_entry);
>          dinfo32.options =3D 0;
>          dinfo32.boot_hart =3D 0;
>          dinfo_ptr =3D &dinfo32;
>          dinfo_len =3D sizeof(dinfo32);
>      } else {
> -        dinfo64.magic =3D cpu_to_le64(FW_DYNAMIC_INFO_MAGIC_VALUE);
> -        dinfo64.version =3D cpu_to_le64(FW_DYNAMIC_INFO_VERSION);
> -        dinfo64.next_mode =3D cpu_to_le64(FW_DYNAMIC_INFO_NEXT_MODE_S);
> -        dinfo64.next_addr =3D cpu_to_le64(kernel_entry);
> +        dinfo64.magic =3D be ? cpu_to_be64(FW_DYNAMIC_INFO_MAGIC_VALUE)
> +                           : cpu_to_le64(FW_DYNAMIC_INFO_MAGIC_VALUE);
> +        dinfo64.version =3D be ? cpu_to_be64(FW_DYNAMIC_INFO_VERSION)
> +                             : cpu_to_le64(FW_DYNAMIC_INFO_VERSION);
> +        dinfo64.next_mode =3D be ? cpu_to_be64(FW_DYNAMIC_INFO_NEXT_MODE=
_S)
> +                               : cpu_to_le64(FW_DYNAMIC_INFO_NEXT_MODE_S=
);
> +        dinfo64.next_addr =3D be ? cpu_to_be64(kernel_entry)
> +                               : cpu_to_le64(kernel_entry);
>          dinfo64.options =3D 0;
>          dinfo64.boot_hart =3D 0;
>          dinfo_ptr =3D &dinfo64;
> @@ -455,6 +465,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine,=
 RISCVHartArrayState *harts
>                                 uint64_t fdt_load_addr)
>  {
>      const bool rv32 =3D riscv_is_32bit(harts);
> +    const bool big_endian =3D harts->harts[0].cfg.big_endian;
>      uint32_t reset_vec[CODE_WORDS + DATA_WORDS];
>
>      /* .text (RISC-V instructions are always little-endian) */
> @@ -480,9 +491,14 @@ void riscv_setup_rom_reset_vec(MachineState *machine=
, RISCVHartArrayState *harts
>      }
>      reset_vec[5] =3D const_le32(0x00028067);      /*     jr     t0 */
>
> -    /* .data */
> -    stq_le_p(&reset_vec[6], start_addr);        /* start:       .dword *=
/
> -    stq_le_p(&reset_vec[8], fdt_load_addr);     /* fdt_laddr:   .dword *=
/
> +    /* .data (must match the firmware's data endianness) */
> +    if (big_endian) {
> +        stq_be_p(&reset_vec[6], start_addr);    /* start:       .dword *=
/
> +        stq_be_p(&reset_vec[8], fdt_load_addr); /* fdt_laddr:   .dword *=
/
> +    } else {
> +        stq_le_p(&reset_vec[6], start_addr);
> +        stq_le_p(&reset_vec[8], fdt_load_addr);
> +    }
>
>      rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
>                            rom_base, &address_space_memory);
> --
> 2.53.0
>
>

