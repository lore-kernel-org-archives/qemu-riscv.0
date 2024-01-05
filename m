Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242F9C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:27:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcjV-0005JK-Aw; Fri, 05 Jan 2024 00:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcjT-0005Ij-U1; Fri, 05 Jan 2024 00:26:59 -0500
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcjS-0006RE-Dy; Fri, 05 Jan 2024 00:26:59 -0500
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7cbdd011627so408429241.3; 
 Thu, 04 Jan 2024 21:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704432417; x=1705037217; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=//0DpHIysVHUwO4ZYlnAywUsF3E/eJjKR1qha7ZFK08=;
 b=a88xvHM08iqgYftMZ0InOY7lFBu5EGcelFBHNoH/eruK6ZYo98a9VIph1xjW5WeVYN
 CmfOxF6cPZeML8ZM+tQu0g5TeNHDAtil0yhKu5IptFg9Wa7zmHergvvA1ZUCPW0ystzh
 einsfTnuL9Nmy5NguX51HUViqheEKZ82gnNX8ayV2E3Nr2UTTzhDtCcHRboB7Z9VSy4u
 du9vbiSBKVVJuPNCzW0/8jfHeGons1F/47d5qqKFGlEPGjdo+pWlnA3YbVHh0gVquAFS
 pJQY9ZpeDzeOhS5GQEKoD2VNg7HyKF0ghiJs6ru4oRZUTix1LdXZBT4mdhZPPI/G9wdb
 54hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704432417; x=1705037217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=//0DpHIysVHUwO4ZYlnAywUsF3E/eJjKR1qha7ZFK08=;
 b=DPe8/aeRJkMahW/UiCeDemYRFbtloUG24yM7yOCWMrjWwtEF5gnSr/b9UPpbjqZOB8
 zJ4hUf/B9zKbYeWGYaQjoNQzdUcyJTD1cvYNeAAIv57ZniTZExXo8E6vJ0Pjr2iLNHcD
 gzww5OR0RZo9c+NQzPbfLBTYJ+6rct8U9swYpTnOkjO+a+7wkpCDEDa6THQqlcC+Ns5d
 emW+MuRycjRDAGjpPJ2S31V1D2OgMvwE930c2afqWZ9nI25vN1YWC3i92WslORNGGOBx
 51HRo9Muhe5yPu2dPifCvDqSEjWzUYWmg/ZcVWA1nV9aZCIZeMOFYMA64lorhiny2fiW
 sK0A==
X-Gm-Message-State: AOJu0Yz8gz0lgzD9O8cPd1+heLJMA8hz+32gKydB5dMkqzKCtKPvtppP
 O3X/dgmpkB7YvbWHP4LmSFMflVLlDxgLehZjWcA=
X-Google-Smtp-Source: AGHT+IHs+ElU9fQUTHonucOFn8aAOIAUsxmW+MUq3jXLY4Wd6TVO2T6yuhMJ9O8JlD/Cs3A3brKIYBBiHdGlDAFesXs=
X-Received: by 2002:a05:6102:548e:b0:467:b460:750d with SMTP id
 bk14-20020a056102548e00b00467b460750dmr299148vsb.0.1704432417082; Thu, 04 Jan
 2024 21:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-5-heinrich.schuchardt@canonical.com>
In-Reply-To: <20231229120724.41383-5-heinrich.schuchardt@canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:26:31 +1000
Message-ID: <CAKmqyKPyKW_TXiDVPd_99dn+-bUvPZZrnbFS-yrFMSTxgGvNMQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] qemu-options: enable -smbios option on RISC-V
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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

On Fri, Dec 29, 2023 at 10:08=E2=80=AFPM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> With SMBIOS support added for RISC-V we also should enable the command li=
ne
> option.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2:
>         new patch
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7bdb414345..5ed82df11f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2705,7 +2705,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "                specify SMBIOS type 17 fields\n"
>      "-smbios type=3D41[,designation=3Dstr][,kind=3Dstr][,instance=3D%d][=
,pcidev=3Dstr]\n"
>      "                specify SMBIOS type 41 fields\n",
> -    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH)
> +    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH | QEMU_ARCH_RIS=
CV)
>  SRST
>  ``-smbios file=3Dbinary``
>      Load SMBIOS entry from binary file.
> --
> 2.43.0
>
>

