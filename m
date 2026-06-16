Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95519CD98DE
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKFQ-00007m-Ma; Mon, 15 Jun 2026 23:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKFP-00006D-Ax
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:13:55 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKFN-0001js-GW
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:13:55 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-68bd9fce347so7352881a12.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781579632; cv=none;
 d=google.com; s=arc-20240605;
 b=fuf8RaqCUiedYhIKHkGpNp7JVHNI2p4wgh27aeHYQymXy6UI5KEQSYR/TJPDJYyVkV
 VdfgAUjYs/6ApRMd93JMsbutSKGDLChJur1+g2W4qOusZXF1p89xxnbaUwaCvYi4cmR4
 u3Ttk2Rlx1XJ2XGWMNfEtrjESSp/uNLBgEsw4aTUPggsOqrfXLH7O9UvhKhogzI5DGzU
 nRM7Oj1MPt9CNaKfZh1FZl+pPZ7H1h5xlRwEa5NsU2xPhX04d+vAFMZhXDC6vuHd5p3G
 2D9s+BAKw5tEl3tvO8Qtvs+N/Vykyw9Laqip7uGqiMJSNUznLUUxiUXXDwlK74pER2rq
 4lbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YkwaVw3MVlo9U754wm7BPYx6CRLOgvXkcJyPmfBFsxA=;
 fh=z8Ynapo4P+o3cJw+Na/2KKKWwj5/Qo/79ZmpEekTi7I=;
 b=SZsAMjx8Jzy5F5yw2jhqjXU1SdPckVpt2wbXyL++0XdGE4OwYOTY7clPP7y+i4hQmp
 aNw3UEfpDu/2KzMK2UcgFj3cel8+OoMHIybjWeV125B9mWYoGn2+h4E5X7HWoB/IW14l
 X2xMAp833NSlDEpf7G1zEXdtDU3aTfXL5+VwNEB7LHR227wreq4BLoLNtyrky6eA02sx
 X1jwq1djtR4gwGiyQuK+5Dj/KhnD0XbQ85jt5p42kxgibdEMqCr5kwvXvZ3JtYyI/i41
 ysCbLlD25buiGBcBVOw3dKzt8PgiH/mHQhB0lbYG2mQ+8eFyuR3h7PLdoS1mZHmImwWI
 iajA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781579632; x=1782184432; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkwaVw3MVlo9U754wm7BPYx6CRLOgvXkcJyPmfBFsxA=;
 b=pPeYJ5kE4sZ59KuT1355fMhIiFvMKnth2kNoOSHI8ayQ3gzm0Ca5GnfUbh8x/pudOI
 IJPKmbvYAdJxegQ/rE5f2MC9WByMLrzp9mRFPeH+USPjKB7IS2fDa+2T8qrwbgSilej/
 ZRCMNwyas4O4571aTyM1J1Ki0Im7X8AVE22kEIL4oknA/jwWZ5xiGGueFMKyd1eElb2b
 3boyCQ34/hphiAC1yZ79x49MyYSoGKaeRu1K8pCB4IAv++wLR8TnYJp7zVW9lygd/8UX
 wfsX//2JPeFpGy81obD6oW8ZRg8efXow13yX8F9THOEf89JpZZBdJAK1Wv0dYPpxOpyv
 JOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781579632; x=1782184432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YkwaVw3MVlo9U754wm7BPYx6CRLOgvXkcJyPmfBFsxA=;
 b=S94cgyxFmwPbzOf77MedZgi0tnExqA2qh49/i+sR4gU1vomZ/xdDOnFWt4NdmQPMwS
 aZfAB+ljfjNOcWx22o/YJej5nunsiGn62b3LcLiRzEDpK7yGPEjVZlM/riuG94HKmtzy
 uC11QQw2sU0QrIONzMvqWT38NjsVRWm3nz9IfsCbcASqHkIyjda6WhcBw75RLegrYkR0
 npZdTri9drNW0ke4lItl3BhDrCvGNAJVe857kEmB1UjQBh1xdzZeE/ZJHWDC+Fb9AKDm
 Y5lORx9triUE/jl8cszXzhwpZthHZJatSQQ9RnIb7WRSxiPW7FYBsy6gZ36jfObmykLG
 R3mQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+o9UKvQPXBexXyh+C2WHtYZOwCyCd0yoqupkhNeDas5jRu1ANeebS8j7ZzY+DQaFLLfDBrygntDjgf@nongnu.org
X-Gm-Message-State: AOJu0YxMaPyOwnMBwV4bpNMFi2mSSEKhOP5sD7Yyca3BDBdLtRYV9zTQ
 xN8FIOfTqejUhrTu7j628OfISY48Ew2qZ7Z+AH/A+py3Si/OlQlTq7COlJdZMQxOqlRA2FnOW6c
 FQOnGVE+9l1FW6sKaiBPuE9bRK74dJhU=
X-Gm-Gg: Acq92OHg6swhiXzIzOuFkJPxe2JawKl1IVCNnyPFRoC6kYhE2sMDes58MMrynIL2T1j
 g6+YB6o6qTE0EIhMFVNxfl8P2whbu0kx/OxV/3NDocNPhKq5ZoCHed/GkHZeFBMFMU9fcav9LmX
 pGtA7J8LXbnV6Xd4nxL0Bui0KIk+mMaAkElACWeCT8oEPMDcfxJThikkbZCFImNTlZhbmB/IJI+
 yRWP/7ln0t+ohg8esM5cx614UZZz2FdUoLMp4bJgHrQ2UnRG7RlXCdJSQRn5or5IWCSDlyB0MaZ
 qRqKQMCf7tcKsfglI0GeDqj/hxmWTVN9m6b+nA==
X-Received: by 2002:a05:6402:5208:b0:689:6c2e:6cdf with SMTP id
 4fb4d7f45d1cf-6950874bfdemr783191a12.22.1781579631925; Mon, 15 Jun 2026
 20:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-7-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-7-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:13:25 +1000
X-Gm-Features: AVVi8Cc5EIcGOjrqGMSaHgobiAJitL9LMRwuVwl5ItwGXiTuP31CiZB6H9Oyue4
Message-ID: <CAKmqyKOQuy74DmSMa+e03ZL-ifctu_qSmh6_kTCX8cnYnVSpkw@mail.gmail.com>
Subject: Re: [PATCH 06/13] hw/riscv/spike.c: add intc_phandles array
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
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

On Tue, Jun 16, 2026 at 6:38=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> The clint FDT generation uses a cells array (clint_cells) that are
> populated in the middle of the loop that creates the CPU socket FDT.
> This is completely fine but it differs from the other boards that
> creates the clint cells array right before creating the clint FDT.
> 'virt' and 'sifive_u' store the intc phandles in a intc_phandles array
> during FDT CPU socket creation, and this array is used to create the
> clint FDT cells.
>
> Standardize the clint FDT creation for spike doing the same here,
> allowing us to move everything to a common helper later.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 92facba29d..82005ec163 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -59,7 +59,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
>      int cpu, socket;
>      MachineState *ms =3D MACHINE(s);
>      uint32_t *clint_cells;
> -    uint32_t cpu_phandle, intc_phandle, phandle =3D 1;
> +    uint32_t cpu_phandle, phandle =3D 1;
>      char *clint_name, *clust_name;
>      char *core_name, *cpu_name, *intc_name;
>      static const char * const clint_compat[2] =3D {
> @@ -84,6 +84,8 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
>      qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
>
>      for (socket =3D (riscv_socket_count(ms) - 1); socket >=3D 0; socket-=
-) {
> +        g_autofree uint32_t *intc_phandles =3D g_new0(uint32_t,
> +                                                    s->soc[socket].num_h=
arts);
>          hwaddr memaddr =3D memmap[SPIKE_DRAM].base +
>                           riscv_socket_mem_offset(ms, socket);
>          uint64_t memsize =3D  riscv_socket_mem_size(ms, socket);
> @@ -91,8 +93,6 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
>          clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
>          qemu_fdt_add_subnode(fdt, clust_name);
>
> -        clint_cells =3D  g_new0(uint32_t, s->soc[socket].num_harts * 4);
> -
>          for (cpu =3D s->soc[socket].num_harts - 1; cpu >=3D 0; cpu--) {
>              cpu_phandle =3D phandle++;
>
> @@ -113,20 +113,17 @@ static void create_fdt(SpikeState *s, const MemMapE=
ntry *memmap,
>              riscv_socket_fdt_write_id(ms, cpu_name, socket);
>              qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle)=
;
>
> +            intc_phandles[cpu] =3D phandle++;
> +
>              intc_name =3D g_strdup_printf("%s/interrupt-controller", cpu=
_name);
>              qemu_fdt_add_subnode(fdt, intc_name);
> -            intc_phandle =3D phandle++;
> -            qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandl=
e);
> +            qemu_fdt_setprop_cell(fdt, intc_name, "phandle",
> +                                  intc_phandles[cpu]);
>              qemu_fdt_setprop_string(fdt, intc_name, "compatible",
>                  "riscv,cpu-intc");
>              qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NUL=
L, 0);
>              qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1)=
;
>
> -            clint_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandle);
> -            clint_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
> -            clint_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandle);
> -            clint_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_M_TIMER);
> -
>              core_name =3D g_strdup_printf("%s/core%d", clust_name, cpu);
>              qemu_fdt_add_subnode(fdt, core_name);
>              qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
> @@ -139,6 +136,15 @@ static void create_fdt(SpikeState *s, const MemMapEn=
try *memmap,
>          create_fdt_socket_memory(fdt, memaddr, memsize, socket,
>                                   riscv_numa_enabled(ms));
>
> +        clint_cells =3D  g_new0(uint32_t, s->soc[socket].num_harts * 4);
> +
> +        for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> +            clint_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu])=
;
> +            clint_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
> +            clint_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu])=
;
> +            clint_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_M_TIMER);
> +        }
> +
>          clint_addr =3D memmap[SPIKE_CLINT].base +
>              (memmap[SPIKE_CLINT].size * socket);
>          clint_name =3D g_strdup_printf("/soc/clint@%lx", clint_addr);
> --
> 2.43.0
>
>

