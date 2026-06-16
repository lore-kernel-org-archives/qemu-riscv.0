Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382E8CD98DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:17:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKIt-00027P-2j; Mon, 15 Jun 2026 23:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKIG-00024n-VZ
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:16:54 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKIE-0002aw-Tz
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:16:52 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-68c32f3c6d6so3987532a12.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781579809; cv=none;
 d=google.com; s=arc-20240605;
 b=IQ00rz7NVALJWl9Y/erg9ruwYnl2rhWD/kweHit9Ex3eeu3TmVhJecaxr41OoJ83wg
 fq6C5SZPOVvRvpud4sSHvP9NQL5hJxKQR07WBe/BdxhTVEUHo3OxDPjb8OyN7PsatFYj
 53oRLdAOVfpjgRrlDYP05rxfYQ5VVgSX510gxRtbVWVwfX8nGSb6nYfAXt+rI7N9j3ko
 it/npwISl9ZOdEkdxMcdeEPmbFULQZqpcMY0WSO20l29UuiV2JOH7A+OM7a3t1eyI4qr
 m1RDN0UdyMTXrVv8JlaghE6pzBzXbVV4NCV5Hnw5yDAiJL/vgwQjrcVbWQleBRIohE0c
 gsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KrlnPP7f4Oib5E6NwzCUbCVlKaNNJ3puLI/sBF4dEE0=;
 fh=7apc72NQnfXwXAKencgzTX5UEgkLUTYiZjG2gSDUkI4=;
 b=doygoMuWnPXYDZZeVOCV27/ORK0QTEBa1W0Dhf4gzep2lrohtr2WQZu72UpLg3WkWM
 jhQvQOPwR33VBLYMOspzkatCLWvP03pgV2iQo8z6uNfDmAVo4ixeRfqsECHh9BLI8Oef
 EEmMgi/yzsygQbVLXvXr+OxJfi0gNhhuUdfsceFSEwbE8QAicAvt8dvv14dyrvGSiUQB
 viZZaqHSu87mnTMIdMRBmaJoJqv0cEsWmVKVJPNg7GMcvZ5AcEaAMAoh5xYOiAmnCyq7
 pdAqi/KN47XzrKo4xiKI25MGep+5miTrnS7sqxCaJGklgZPeJ3EX/qZBUdKxDfXXYTY/
 glfA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781579809; x=1782184609; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KrlnPP7f4Oib5E6NwzCUbCVlKaNNJ3puLI/sBF4dEE0=;
 b=pPN7dqISku8wZaD10KH64xnycINDvFsgZWMFI/+b9Y9fbnBN7L6RrQ0lubdOWSsSUz
 dddoqouGB7IcUaa3Je6X71OvYkHRliKXQGZp8A1opfVdta0zm2On8x6d1hGlkCwTeCps
 dET3/5jI0WYrlMw0OY+8POqRLmsBbBITZqTMlrDJAHQhe4msuemFMGO6pzxI8JwyKqVq
 E/dIYf+FKx0/Qja+PzB1MQVUxil7BzsbQRoPg7c2v0pbckfCElaM2br0NImDlnrvZhuy
 xj4HHn5Sy+XV8G/W42prrtFtkarLO1VwFigtFCPEYauBFf6/i67Y1fyzaGxllI6BYXOZ
 e4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781579809; x=1782184609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KrlnPP7f4Oib5E6NwzCUbCVlKaNNJ3puLI/sBF4dEE0=;
 b=YrDWu/ZRBleRQfEmsC43O8nnj69qf+a7ik7NtKg2IhPqrX7j4BCGbK3O/nB3nNgBRG
 cjQ+Ksf+2IQyhJliofbpjoTrp21aj1ufuZA4+CB3fBVpeyV3bluKSW1J6fD3vYa4Nmuj
 JMkfH4KBwt9uyNwaELZYJBlSicWBNhgMdSCBftWEBIBl/DSLXWUUV/PN0XKgld1hDtM0
 4ks/O5JLTfFx4wUGEvy+aHUN+pARaUW8cf+KjzV9Ccv6wXdg/UcczQRM4HE8Vgqt1/oX
 j3JwPcp6JAYLfqLIYkHsHz7w09spYRX4EoQ6fv6r260QFD/hEhIlk0ZvSOktICgucFBZ
 rPYA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/J8O029E6eFS0GeqWt9P+/vMqufeRtN1bht5sBRB5S7lB1PlHPomCDM14WqHeRIFOV8WjIVOTwB9Ra@nongnu.org
X-Gm-Message-State: AOJu0YxdqXHC37XZ71IDQDYaNMbOZ9v8+dOnhITbjuh1Q8WEq42Vfa0J
 syK0kWMHVsWRPMZJ8nIPPN5mf0F+DmKhWxNvSuKwKgkFTWwA4pwIRq8fywxyyxQkA8xTLpFoxtU
 UyIxTr0HfuWbjBGcCy3AuQp1lQM4ujHg=
X-Gm-Gg: Acq92OHBUWELyxOvYpK40yVd6pbSOe0NzEm0lr09kDsL/dKzQsFLkVEJkFX58zJxnlx
 G5VkN5Mysq6RIENeuSAk69sxhDGj5ybgewsU99YHMYeDI+8S0AViZROYF7/Uu3qjRizvfzPf+Nx
 zC5+6jOZrNigfr0YndqiQcS34sHYtCAq+aYU0jWgXPxAdtvumepCsmKDbmz8K7QXJ9me7ZmPfHz
 0ntwV6fxrLCPRUjcZAKUMOxXHsBQ7Eh5TYkFig5hbSVeOr46nM9qDa2hayx3C+EJA2Dkw+daHjE
 b1yMtOLTpDRvLcCHwZb6XI0bXX4cuytSTusAr7hM5qxceUwf
X-Received: by 2002:a05:6402:428b:b0:68f:cc95:8c10 with SMTP id
 4fb4d7f45d1cf-6950876a523mr763321a12.27.1781579809061; Mon, 15 Jun 2026
 20:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-10-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-10-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:16:21 +1000
X-Gm-Features: AVVi8Cf69Og27fxbSo4gjjfLHppDxi40PtK5RWQboQDW4v_g-nUTTP7W_Rg6vwc
Message-ID: <CAKmqyKN4QSt7X9xTBTZgYFxnRk+3JJg_9NB9KnP9KVUkTWUCAQ@mail.gmail.com>
Subject: Re: [PATCH 09/13] hw/riscv: add fdt_create_cpu_socket_subnode() helper
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jun 16, 2026 at 6:41=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Consolidate the '/cpus' FDT root node creation into a single place.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/fdt-common.c         | 10 ++++++++++
>  hw/riscv/sifive_u.c           |  7 +------
>  hw/riscv/spike.c              |  7 +------
>  hw/riscv/virt.c               | 11 +++--------
>  include/hw/riscv/fdt-common.h |  1 +
>  5 files changed, 16 insertions(+), 20 deletions(-)
>
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index d2661ec389..02ac9ddcd8 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -83,3 +83,13 @@ void create_fdt_socket_clint(void *fdt, hwaddr addr, u=
int64_t size,
>          qemu_fdt_setprop_cell(fdt, clint_name, "numa-node-id", socket_id=
);
>      }
>  }
> +
> +void fdt_create_cpu_socket_subnode(void *fdt, uint64_t timebase_frequenc=
y)
> +{
> +    qemu_fdt_add_subnode(fdt, "/cpus");
> +    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> +                          timebase_frequency);
> +    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> +    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> +    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> +}
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index a4265fed0f..27c1a74d99 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -139,12 +139,7 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>      create_fdt_socket_memory(fdt, memmap[SIFIVE_U_DEV_DRAM].base,
>                               ms->ram_size, 0, false);
>
> -    qemu_fdt_add_subnode(fdt, "/cpus");
> -    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -        CLINT_TIMEBASE_FREQ);
> -    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> -    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> -    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> +    fdt_create_cpu_socket_subnode(fdt, CLINT_TIMEBASE_FREQ);
>
>      clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", 0);
>      qemu_fdt_add_subnode(fdt, clust_name);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index b15188fb07..ee8232f734 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -73,12 +73,7 @@ static void create_fdt(SpikeState *s, const MemMapEntr=
y *memmap,
>              0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
>      }
>
> -    qemu_fdt_add_subnode(fdt, "/cpus");
> -    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
> -    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> -    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> -    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> +    fdt_create_cpu_socket_subnode(fdt, RISCV_ACLINT_DEFAULT_TIMEBASE_FRE=
Q);
>
>      for (socket =3D (riscv_socket_count(ms) - 1); socket >=3D 0; socket-=
-) {
>          g_autofree uint32_t *intc_phandles =3D g_new0(uint32_t,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index b134f11266..6641b60131 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -694,14 +694,9 @@ static void create_fdt_sockets(RISCVVirtState *s,
>      int socket_count =3D riscv_socket_count(ms);
>      bool numa_enabled =3D riscv_numa_enabled(ms);
>
> -    qemu_fdt_add_subnode(ms->fdt, "/cpus");
> -    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "timebase-frequency",
> -                          kvm_enabled() ?
> -                          kvm_riscv_get_timebase_frequency(&s->soc->hart=
s[0]) :
> -                          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
> -    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#size-cells", 0x0);
> -    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", 0x1);
> -    qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> +    fdt_create_cpu_socket_subnode(ms->fdt,
> +        kvm_enabled() ? kvm_riscv_get_timebase_frequency(&s->soc->harts[=
0]) :
> +                        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
>
>      intc_phandles =3D g_new0(uint32_t, ms->smp.cpus);
>
> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.=
h
> index 6e81d6cd6c..27020e69c6 100644
> --- a/include/hw/riscv/fdt-common.h
> +++ b/include/hw/riscv/fdt-common.h
> @@ -18,4 +18,5 @@ void create_fdt_clint(void *fdt, hwaddr addr, uint64_t =
size,
>  void create_fdt_socket_clint(void *fdt, hwaddr addr, uint64_t size,
>                               int socket_id, uint32_t *intc_phandles,
>                               int num_harts, bool numa_enabled);
> +void fdt_create_cpu_socket_subnode(void *fdt, uint64_t timebase_frequenc=
y);
>  #endif
> --
> 2.43.0
>
>

