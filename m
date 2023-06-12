Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02133C7EE37
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Yd9-0008EJ-Cm; Sun, 11 Jun 2023 23:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Yd2-0008Dc-IS; Sun, 11 Jun 2023 23:54:04 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Yd0-0003px-Q0; Sun, 11 Jun 2023 23:54:04 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-78a03acc52aso1337601241.3; 
 Sun, 11 Jun 2023 20:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686542041; x=1689134041;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uJgjpQD+47M1BDt8Lg1JUtnfKvWZxMnAUnvA1IeoUf8=;
 b=KhRLfuU7AHAXU4Thcjkb/AhCItqOF2zq4O8FZ3j6srpMpDqgGX8S2RUASeNkIsnv3p
 FQAeBkHYrCPJ7gD2+leB+9jtDAj0cBkgPSc2SIFNVG9gjoRNbZx4YNKIQdE+aeqK0Eew
 gLFucAw8FMOfrHMTd4sjDkQVi9FlFQBgQmxTJSUCQ61P0gBOzaSUT6dhK+nw2xkUoqM+
 mvDzAN03W+tAMX+9CD388q/cNtgT5PVFRRZz8tDTsi1fWMJyNeU1+ZrZaetTInX3ucqN
 rHhhHur1DKcySSpsFilmKgwqntHxgcpUqjpf5OUWybPDgj0PTsgWqNj+xX4PyJojRFAY
 dIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686542041; x=1689134041;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJgjpQD+47M1BDt8Lg1JUtnfKvWZxMnAUnvA1IeoUf8=;
 b=B2Dtes2nTxO+mu8iDHt7nSdAqKVduV8Uz1D1sJL1GcTzDGODt+QVpE6EiZUa7g/dbF
 XTmkzGCr1E9LsXva6dHhQFLDI9OINWB13ds/pUzH7ZcELnqD3qigjqIAq7TUcr9XiqOd
 gqbKF7MeYRqMuyMRIG9nhxf9lcirmLq+/lhVCyWpZ5NaAadN6KNnEPjL9SWaJg9PJczk
 bUCi1np+P1L25puYpYzAtCtDZUTunSFFJn3ldAMuDcR1N3WFGxg42iKimLq4Ll/m1QeV
 JLGxJs0kNuYDA/v7WqYcMfpwhMbu270GHVXgY3MwalTozhnv0+KlDeegkWKywKLJn2BI
 hv6w==
X-Gm-Message-State: AC+VfDzR0pcQby7JGEcqgAeVFTl3y1pOGY3aZ6rJNBA6yKWkbrhDBoVx
 gcPbHC4MjBIE5/mKPciI5vtuuQvM/bO0MAvhCpcwSk6ZC/w=
X-Google-Smtp-Source: ACHHUZ6Hks+U03gk/OPvYwdwUDcQ/ybGcjbx8DdGsghEBBDub8RiGzBG61eObw3YblFGRUmLJAkQA3cn0cJcYRtFlWk=
X-Received: by 2002:a1f:45d1:0:b0:440:125:7e59 with SMTP id
 s200-20020a1f45d1000000b0044001257e59mr3210104vka.1.1686542041152; Sun, 11
 Jun 2023 20:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230530194623.272652-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:53:35 +1000
Message-ID: <CAKmqyKPKGAL945WYW3ua8rTA-nMs8GRtGLJneZTzyvvc0G=EcQ@mail.gmail.com>
Subject: Re: [PATCH 02/16] hw/riscv/virt.c: skip 'mmu-type' FDT if satp mode
 not set
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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

On Wed, May 31, 2023 at 5:48=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The absence of a satp mode in riscv_host_cpu_init() is causing the
> following error:
>
> $ sudo ./qemu/build/qemu-system-riscv64  -machine virt,accel=3Dkvm \
>     -m 2G -smp 1  -nographic -snapshot \
>     -kernel ./guest_imgs/Image \
>     -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
>     -append "earlycon=3Dsbi root=3D/dev/ram rw" \
>     -cpu host
> **
> ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should not be
> reached
> Bail out! ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should
> not be reached
> Aborted
>
> The error is triggered from create_fdt_socket_cpus() in hw/riscv/virt.c.
> It's trying to get satp_mode_str for a NULL cpu->cfg.satp_mode.map.
>
> For this KVM 'cpu' we would need to inherit the satp supported modes
> from the RISC-V host. At this moment this is not possible because the
> KVM driver does not support it. And even when it does we can't just let
> this broken for every other older kernel.
>
> Skip the 'mmu-type' FDT node if there's no satp_mode set.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..8aa907e81f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -243,13 +243,13 @@ static void create_fdt_socket_cpus(RISCVVirtState *=
s, int socket,
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(ms->fdt, cpu_name);
>
> -        satp_mode_max =3D satp_mode_max_from_map(
> -            s->soc[socket].harts[cpu].cfg.satp_mode.map);
> -        sv_name =3D g_strdup_printf("riscv,%s",
> -                                  satp_mode_str(satp_mode_max, is_32_bit=
));
> -        qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type", sv_name);
> -        g_free(sv_name);
> -
> +        if (cpu_ptr->cfg.satp_mode.supported !=3D 0) {
> +            satp_mode_max =3D satp_mode_max_from_map(cpu_ptr->cfg.satp_m=
ode.map);
> +            sv_name =3D g_strdup_printf("riscv,%s",
> +                                      satp_mode_str(satp_mode_max, is_32=
_bit));
> +            qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type", sv_na=
me);
> +            g_free(sv_name);
> +        }
>
>          name =3D riscv_isa_string(cpu_ptr);
>          qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
> --
> 2.40.1
>
>

