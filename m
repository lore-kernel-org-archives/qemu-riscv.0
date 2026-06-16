Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD991CD98D2
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:18:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKKF-0003Q4-39; Mon, 15 Jun 2026 23:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKKD-0003Pg-Ox
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:18:53 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKKC-00037J-60
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:18:53 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-68bd9fce347so7356768a12.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781579930; cv=none;
 d=google.com; s=arc-20240605;
 b=XEcwRpP00ftHdAfDI26AyIM37HqDbyFIYTv2OoHUHc3bBeDUivkSObJHUWt/seEDz0
 +WkIsT0QPxKGzClwKZXMWga96p7kNp4RrQggr+EmXrOzndIWmqW+Ivih1M6oGBCF0Toz
 Ts7G66SOb3iqtdtK5jQbxVh/uOqq3jowMiRwIZ7GANOd56Sb6rBsFzp4yU1k9hsMRfNt
 1FbVspLxyb4eJG8cYfxwgxLyX1czOGn8Z245kt6sUqzmIqUU0RYqm38+Qalxr77yPiTb
 kE4HUOnIMhagE1j9xWYq4W/7Cxti74gp3skE1R3EJfRDD0+tOXSkEwaoDOeIWR+N+Ot1
 rWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZRXDfuW1yFXa5SDPyGic4wHy3ILhCtlRK2w1jalJ0hE=;
 fh=2m5/TltoeoOsBN0DQcFlX3UA/EII8fpvlMv62kca8ek=;
 b=MID+3/zdO1tZ/eg8hCJsLm2FVnZSumGRWfEK/NEQFS1z71Qs3IjW3L+8Gew8tq0x/j
 e5LWxBILjy0CpoNMNqq3PCHmotCv7yZUQzy7MsA+lrEh23T1DGq4iGCDacbxfvIm8DGh
 rC8YxLmRKPfj1Ah53uLeaWemYrPViVsgEb7ADEY/b1HILpnqQrhx7NYO6/2bgpJ2y3GN
 sfZ7oetmJ5/Fd/MaMjGwBFMpZUz3r1x7r0g06Yhth7DJqOyY61utfC1V6wZg2j98fVlS
 Gvm+NXoA9L3gzMj82jqRsPI3uNFrENW8U2lbBjpZWYgGnX3ZFMAFnlhTWUp7i2nCUiSv
 egGQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781579930; x=1782184730; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRXDfuW1yFXa5SDPyGic4wHy3ILhCtlRK2w1jalJ0hE=;
 b=oFMuRtRK8pDM9D7l464knZcoDuboOOzt0KDB2yWRK3ut/AX2dT5ikufnm3yNLWfWcf
 VH2NFgk63qaKD5YQPrJ0HvNuXi06Bo+2YOVuKfBEjsHmm1LpWj6rMAD+EX9rg6XzFnME
 4lU2zQdqA44k48wejpzIFF8OopZPX2KiypLRn6xtFRnTDSA5DlHFfkgAA7/WL33LUEko
 PHlrbhu7tHBCBrIg8kt730ntd9eZYspi8Kqo/vLQi9dP4oIPuM1kjBv2TjJkAicPd/af
 YfacARbc6dLFLZ8l58+s/URjfvcmqoWQ5O43RoxcS/7FyWSpuzqy1QuTZ9euE5dSH1FW
 r1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781579930; x=1782184730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZRXDfuW1yFXa5SDPyGic4wHy3ILhCtlRK2w1jalJ0hE=;
 b=rrN+4hcazDyL6elu1dfOjwuQ0h0+JrGVfkjBzDBuV9o9Ezie4ozXqMbsN9xtWwxZRw
 l18THL+qQutjjRHXyP7u7PSqVlWDcyeUohPWi/M4AY+iYmFhY2dK4kbkq9UA0A+E/Eti
 DTnbwqKYp0kl2tp4mOnsU97GZsTS4r+Rl+twGoPZoggEIsrNXdMdlOCL7N25zjhlBRp/
 3wUd9VMm1TI0Bsdpe/acZGAlxnRS9RJuo48xF+fYTSWCptcVDFr6SupwOf7Pu7pFWeyc
 eg/iYzFaj8226E0ZZ+L43S6yO7PFqkQaoj5QUsOsEEfFhwA1e2VyHMHd44MSWO3Hze1e
 rbOw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XYpKm/BnJQpnRy818C+9LMMcB5cFVzZKHD+MKRdv46HqStqLeIrgJbNs+wYRwhN1pb8+t4YiwNsqk@nongnu.org
X-Gm-Message-State: AOJu0Yyo1z3UUos44CUtuM9T7W3IoibkbD5ajrnuMz3yQtAQ1DZcbFyF
 cSW1enV938/Myo5Ahzknzsno4+z4OjDkcNyWkzjgDCsjmd0GxpcwF5y/Vc38LExqpMBd6pvb7Fm
 LnroXTAlwXc/7eBDhUnvRKJcSsWhYR+E=
X-Gm-Gg: Acq92OFbMJjR+f/wS6fT+5c6cXBDDZqPWjRhVWabFFPMBJTGXsG50OXwwVWSae2Mv25
 tQiFiW5vMTUgRG8beHxCm/CC47tZdPMioYwzH8Hsp3eWOdBO6PLamO0C4+GO+6x3TF8G5x7gNL9
 vczOcBj4t2sCrxHyW+BilzA8hj5gC9+avSX1zqPZALV54x4Sh+QUK4T/DPEYMYRNkOrc8TIYZlb
 u6VFT/rPPeRtWhAjHPfFATPiOTG4H4c5lOau4e8HHU1euJhB83CUNgX5wXTsaa6stdhR5vx68GP
 2jbrfF1HHJtQiC+I3+4i7BHg6IOJbCXMogagzQ==
X-Received: by 2002:a05:6402:270e:b0:691:b5aa:5a7b with SMTP id
 4fb4d7f45d1cf-6950873ab2cmr778729a12.17.1781579930372; Mon, 15 Jun 2026
 20:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-12-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-12-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:18:24 +1000
X-Gm-Features: AVVi8Cfk8f_5X_RAXJdtdSGa6A6R4w9yJL3CBhEGwC1KMRdXTnLjoLLVPigjqMc
Message-ID: <CAKmqyKOW2wD1XuoYa8fPwYK4LRAO62BGDYabDk0PHEO9nQfmmg@mail.gmail.com>
Subject: Re: [PATCH 11/13] hw/riscv/spike.c: use create_fdt_socket_cpus()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x530.google.com
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

On Tue, Jun 16, 2026 at 6:40=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Use the new FDT helper to create FDTs for the CPU sockets.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 54 +++++++-----------------------------------------
>  1 file changed, 7 insertions(+), 47 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index ee8232f734..4e60724c14 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -56,11 +56,9 @@ static void create_fdt(SpikeState *s, const MemMapEntr=
y *memmap,
>      void *fdt;
>      int fdt_size;
>      unsigned long clint_addr;
> -    int cpu, socket;
> +    int socket;
>      MachineState *ms =3D MACHINE(s);
> -    uint32_t cpu_phandle, phandle =3D 1;
> -    char *clust_name;
> -    char *core_name, *cpu_name, *intc_name;
> +    uint32_t phandle =3D 1;
>      bool numa_enabled =3D riscv_numa_enabled(ms);
>
>      fdt =3D ms->fdt =3D create_board_device_tree("ucbbar,spike-bare,qemu=
",
> @@ -82,48 +80,11 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
>                           riscv_socket_mem_offset(ms, socket);
>          uint64_t memsize =3D  riscv_socket_mem_size(ms, socket);
>
> -        clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
> -        qemu_fdt_add_subnode(fdt, clust_name);
> -
> -        for (cpu =3D s->soc[socket].num_harts - 1; cpu >=3D 0; cpu--) {
> -            cpu_phandle =3D phandle++;
> -
> -            cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
> -                s->soc[socket].hartid_base + cpu);
> -            qemu_fdt_add_subnode(fdt, cpu_name);
> -            if (is_32_bit) {
> -                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "risc=
v,sv32");
> -            } else {
> -                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "risc=
v,sv48");
> -            }
> -            riscv_isa_write_fdt(&s->soc[socket].harts[cpu], fdt, cpu_nam=
e);
> -            qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv"=
);
> -            qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
> -            qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
> -                s->soc[socket].hartid_base + cpu);
> -            qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu")=
;
> -            riscv_socket_fdt_write_id(ms, cpu_name, socket);
> -            qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle)=
;
> -
> -            intc_phandles[cpu] =3D phandle++;
> -
> -            intc_name =3D g_strdup_printf("%s/interrupt-controller", cpu=
_name);
> -            qemu_fdt_add_subnode(fdt, intc_name);
> -            qemu_fdt_setprop_cell(fdt, intc_name, "phandle",
> -                                  intc_phandles[cpu]);
> -            qemu_fdt_setprop_string(fdt, intc_name, "compatible",
> -                "riscv,cpu-intc");
> -            qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NUL=
L, 0);
> -            qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1)=
;
> -
> -            core_name =3D g_strdup_printf("%s/core%d", clust_name, cpu);
> -            qemu_fdt_add_subnode(fdt, core_name);
> -            qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
> -
> -            g_free(core_name);
> -            g_free(intc_name);
> -            g_free(cpu_name);
> -        }
> +        create_fdt_socket_cpus(fdt, (&s->soc[socket])->harts, socket,
> +                               s->soc[socket].num_harts,
> +                               s->soc[socket].hartid_base,
> +                               &phandle, intc_phandles, numa_enabled,
> +                               is_32_bit);
>
>          create_fdt_socket_memory(fdt, memaddr, memsize, socket,
>                                   riscv_numa_enabled(ms));
> @@ -133,7 +94,6 @@ static void create_fdt(SpikeState *s, const MemMapEntr=
y *memmap,
>          create_fdt_socket_clint(fdt, clint_addr, memmap[SPIKE_CLINT].siz=
e,
>                                  socket, intc_phandles,
>                                  s->soc[socket].num_harts, numa_enabled);
> -        g_free(clust_name);
>      }
>
>      riscv_socket_fdt_write_distance_matrix(ms);
> --
> 2.43.0
>
>

