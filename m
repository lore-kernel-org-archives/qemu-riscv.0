Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592B6C5ACB3
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 03:49:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5HlG-0001s1-UQ; Mon, 20 Nov 2023 22:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5HlF-0001ro-QX; Mon, 20 Nov 2023 22:49:18 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5HlE-0007jS-0R; Mon, 20 Nov 2023 22:49:17 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4afe5fc8ad7so1019045e0c.3; 
 Mon, 20 Nov 2023 19:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700538554; x=1701143354; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3JbUc7sKwhLH+36q6Jam8D+XKWSaVnDMVM2CfOUvLog=;
 b=Y+KHtLtYha3rX1yBdw411CKBhYO5QEhH0lzZVIvaynNOwBCU0d48FYZaMBss+e3lsE
 Y8YYGuNyzM6IE5yZy0WRGoGYYgtjBf4ZXJa6BHCF6bML96tYNsbjv39h84AktWgumhU2
 X6lSZ6NkZc1lZOtuixiXDV3PeW6pqF4mzJzEvQ69NBkO7+jRf1tfdNlT6CoNSb77TMxB
 +W3aekViir2LZq9+qMdAjoQxZCnF5XXqgvd9GRugwMwd8aShXogqsjd0g4X7vOgWelxi
 MSEhZZCgtFNGUacADdy5c8vAqQjp9G9buylyzxfrZ19f9xZV8F21vLjAnksDI+TVDLjX
 pcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700538554; x=1701143354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3JbUc7sKwhLH+36q6Jam8D+XKWSaVnDMVM2CfOUvLog=;
 b=ERyXdAn9vHDo0ArzphMb86td8VrXA6Wy3JTvP7PANNXbzTGgYXlCTC1qIswFdq77Z3
 /Af7IVtjm0ZFuxaQrzL2xWu1ZxGPGQ+exS0+g4T/a8GwEOQugOxHd9NGmSIC9j4T44fl
 I+OXiZxQuGv+rJXnDOndw52BDosmBEODjxViKtEXq3PHzlEunjZ5/T2DOxACNqiBGZJ+
 KWLGpHhw8KXiJZWr9Qndty7SraVyNIm6pluj3P4d15rr2AyZlJeXzB5MFDoXYvgLGRMd
 //7c93coOQPHH5BuYX06l+yGxOKvvNmoikDRLzcOZRvmm4Sshn3xuyOTbJ5xnKTaf0+V
 jxPg==
X-Gm-Message-State: AOJu0YyCS2mBcsh52+Z37YvybScSCkfQOeO9lHGj+AX3zOK7Wc2qfl90
 AQaaVF7j3bzWF7QpOyMGJwESE+CeyB4oOSDUrr4=
X-Google-Smtp-Source: AGHT+IGzofmd78QN+j4mBv2km1mlU4xLcEoae1filOD9FTuOAPrDnArOewdIBHVI9pBBMTa+GS/QNuw+TmLZDK93gcs=
X-Received: by 2002:a05:6102:6a8e:b0:462:8c9e:921a with SMTP id
 is14-20020a0561026a8e00b004628c9e921amr4536099vsb.32.1700538554546; Mon, 20
 Nov 2023 19:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20231114123913.536194-1-chigot@adacore.com>
In-Reply-To: <20231114123913.536194-1-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 13:48:48 +1000
Message-ID: <CAKmqyKNm6cuqBCntpTZVhUxf=vSkR8RR-sqOi-C-qxjk6hcWDA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: don't verify ISA compatibility for
 zicntr and zihpm
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, dbarboza@ventanamicro.com, 
 alistair.francis@wdc.com, palmer@dabbelt.com, bmeng@tinylab.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
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

On Wed, Nov 15, 2023 at 12:46=E2=80=AFAM Cl=C3=A9ment Chigot <chigot@adacor=
e.com> wrote:
>
> The extensions zicntr and zihpm were officially added in the privilege
> instruction set specification 1.12. However, QEMU has been implemented
> them long before it and thus they are forced to be on during the cpu
> initialization to ensure compatibility (see riscv_cpu_init).
> riscv_cpu_disable_priv_spec_isa_exts was not updated when the above
> behavior was introduced, resulting in these extensions to be disabled
> after all.
>
> Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> Fixes: c004099330 ("target/riscv: add zicntr extension flag for TCG")
> Fixes: 0824121660 ("target/riscv: add zihpm extension flag for TCG")
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 08adad304d..8a35683a34 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -250,6 +250,15 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RIS=
CVCPU *cpu)
>      for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
>          if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
>              (env->priv_ver < edata->min_version)) {
> +            /*
> +             * These two extensions are always enabled as they were supp=
orted
> +             * by QEMU before they were added as extensions in the ISA.
> +             */
> +            if (!strcmp(edata->name, "zicntr") ||
> +                !strcmp(edata->name, "zihpm")) {
> +                continue;
> +            }
> +
>              isa_ext_update_enabled(cpu, edata->ext_enable_offset, false)=
;
>  #ifndef CONFIG_USER_ONLY
>              warn_report("disabling %s extension for hart 0x" TARGET_FMT_=
lx
> --
> 2.25.1
>
>

