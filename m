Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B369C3600B
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 14:02:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1txnoI-0005ve-2L; Thu, 27 Mar 2025 10:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1txnoB-0005um-Li
 for qemu-riscv@nongnu.org; Thu, 27 Mar 2025 10:02:12 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1txno7-0000dx-SW
 for qemu-riscv@nongnu.org; Thu, 27 Mar 2025 10:02:09 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-307bc125e2eso9719561fa.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Mar 2025 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1743084125; x=1743688925; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWOqSHcqRisiqKFLedCxylaiIRUqDjao++K0tkWOY6M=;
 b=f6opGXZlALviJtXjRdKXPFIqLv1kl9FUoLXD0QfmSdRm4lb7j5N+qcRygzB6Kh+inr
 sk1kH/QVTAo7YUXzoQUhsotuqLGyW1QoILDpqauW/rsn9BcwDyCiDkpLRrqGd8RVuQcG
 IPF0y4NSetSMUJuhvVNbmLKMTd5w/uLSX/w5FFrq0imJZByjLjDFt/spMUFDzUKeyv8o
 eqYt0304xBoyb1t0MvFJudjTEUiCi3Z4JeuYWPzU339oruIpIQ8G9JrMEWRMvc+A/3av
 rfwGV+ZUXtXuEg964icAE+LiSld+vyrwffPZYKsjCVyQYnsq1fs069cWWFOViEIY0bme
 7AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743084125; x=1743688925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DWOqSHcqRisiqKFLedCxylaiIRUqDjao++K0tkWOY6M=;
 b=REzF57+HCIngLxzz8lfg79kXsTxsMUAC16kM8z1W9FcwI1eaKRBpZDBpYbtkP+qIBe
 GTNVGsG4QYooXGFvonGJavgFcVm98gUwQzGdu2Iif8Wtfft/DT1lgM79KcNR5HzTsctc
 ZNcbVOPDYIk3BT4wik5LyO4RwUbqbuyLUeHDma/aFKq02zwle3OUwJz0B8NfBJPzIIf2
 Cthcp07qVzFEctmzqy9nDtyttvPkBOGwcXebwkHLoYRRmoClQuCIUBN1llZB3EnSoE8W
 e7wGsA2p2Q2wzFBjSa9c3KhuZ0zzwFDDyNvQXQ8zzUKU21GYzUJQB2nETGAhZdGHk/XW
 JYhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL3N5hia48kCQ9S4sCTpoEFUdkVdtk7sIMjMg8BvI4L0OgiEpbHl9hh0lpFzd8bvEbg7/JKnMvbF18@nongnu.org
X-Gm-Message-State: AOJu0YzhhP+fEP5LQuIjb7gqeQXUb4mO5raf62xLEuS2hRhD3q6hk4PK
 S9wvS3ju27EvLVOugkimzhWv2X7iR0cF701rRuD4THbpBZWb1IyYenlzOHSvbVupXt3MZtOr8MS
 FSq6vcAyI
X-Gm-Gg: ASbGncsZ2LktkPLNF0K3gZab9vn9sEhzRl2jHV4KkDggT+xl1iH7dp5dNPNHGA4wnk7
 p+wV8W5kjPrF+hn4PmpAuvfcYHU5yTF3Gpc6dxxUyFxaMDdB2QX4hpcoXB+aAVRPlpBjiEo4F2K
 C7iim2BMgHdwbFz/hoGbGqukI3SNK3FM79gH9vmdb8t4JchHwmbXVVzfyZnu5JHNNGfbiPeI4G2
 UGLIOd6NiN2+XERTyoLFUaxwHgkUyIgP44r4KrP6RPmDJzepe4vuMazvXM1YPJzIJFMufp8yuNE
 RUPAAXoEtelwDM1HWUSLYhFIuuteGg+gO4MrH2VMjHzIsORA56cHrMZ9rGlyZuPJ0MjAg6++pDY
 UWADtR6sRwaYRPJ32Mk22
X-Google-Smtp-Source: AGHT+IEUPmc3YgsRvc6usYc3bL0B1u5oCfGCIEWBHOC8qodb2GwEne6MI2llhBFUolyITXNyXDDIWQ==
X-Received: by 2002:a2e:b98f:0:b0:30b:e3d9:37e5 with SMTP id
 38308e7fff4ca-30dc5e3164fmr12404121fa.13.1743084122468; 
 Thu, 27 Mar 2025 07:02:02 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30d7d8f4280sm24640261fa.73.2025.03.27.07.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 07:02:02 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5498d2a8b89so1116256e87.1; 
 Thu, 27 Mar 2025 07:02:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1RjEMQY9Uuqie5GgmHoXhCnvhUBFSALlpHneHikqvSwaVO5sXgxo5MgiDxoE7zmjBozc7YzMMuAxH@nongnu.org
X-Received: by 2002:a05:6512:2212:b0:549:91d3:8e66 with SMTP id
 2adb3069b0e04-54b011ce4b6mr1282152e87.8.1743084121563; Thu, 27 Mar 2025
 07:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250327130256.653357-1-dbarboza@ventanamicro.com>
In-Reply-To: <20250327130256.653357-1-dbarboza@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 27 Mar 2025 22:01:50 +0800
X-Gmail-Original-Message-ID: <CANzO1D0begQ8ZY9LeVnoGUzR-hpVFtRqgiM2z2NoLfb2sAhBhA@mail.gmail.com>
X-Gm-Features: AQ5f1JoCRdv0tcQjtm8VUPpbZBgt7Nl_z1vihSqQSEeAjzbxauHNd1lCF1usx_0
Message-ID: <CANzO1D0begQ8ZY9LeVnoGUzR-hpVFtRqgiM2z2NoLfb2sAhBhA@mail.gmail.com>
Subject: Re: [PATCH for-10.1] hw/riscv: do not mark any machine as default
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=frank.chang@sifive.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Reviewed-by: Frank Chang <frank.chang@sifive.com>

Daniel Henrique Barboza <dbarboza@ventanamicro.com> =E6=96=BC 2025=E5=B9=B4=
3=E6=9C=8827=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:04=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Commit 5b4beba124 ("RISC-V Spike Machines") added the Spike machine and
> made it default for qemu-system-riscv32/64. It was the first RISC-V
> machine added in QEMU so setting it as default was sensible.
>
> Today we have 7 risc64 and 6 riscv32 machines and having 'spike' as
> default machine is not intuitive. For example, [1] is a bug that was
> opened with the 'virt' board in mind, but given that the user didn't
> pass a '-machine' option, the user was using 'spike' without knowing.
>
> The QEMU archs that defines a default machine usually defines it as the
> most used machine, e.g. PowerPC uses 'pseries' as default. So in theory
> we could change the default to the 'virt' machine, but that would make
> existing command lines that don't specify a machine option to act
> weird: they would silently use 'virt' instead of 'spike'.
>
> Being explicit in the command line is desirable when we have a handful
> of boards available, so remove the default machine setting from RISC-V
> and make it obligatory to specify the board.
>
> After this patch we'll throw an error if no machine is specified:
>
> $ ./build/qemu-system-riscv64 --nographic qemu-system-riscv64: No
> machine specified, and there is no default Use -machine help to list
> supported machines
>
> 'spike' users that aren't specifying their machines in the command line
> will be impacted and will need to add '-M spike' in their scripts.
>
> [1] https://gitlab.com/qemu-project/qemu/-/issues/2467
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/spike.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 74a20016f1..ba88d3a07b 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -349,7 +349,6 @@ static void spike_machine_class_init(ObjectClass *oc,=
 void *data)
>      mc->desc =3D "RISC-V Spike board";
>      mc->init =3D spike_board_init;
>      mc->max_cpus =3D SPIKE_CPUS_MAX;
> -    mc->is_default =3D true;
>      mc->default_cpu_type =3D TYPE_RISCV_CPU_BASE;
>      mc->possible_cpu_arch_ids =3D riscv_numa_possible_cpu_arch_ids;
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
> --
> 2.48.1
>
>

