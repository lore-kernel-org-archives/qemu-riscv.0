Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E611BCD98DE
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:10:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKCB-0007eD-FR; Mon, 15 Jun 2026 23:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKC9-0007dG-4F
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:10:33 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKC7-0000Lo-HK
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:10:32 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-68c32f3c6d6so3984564a12.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781579430; cv=none;
 d=google.com; s=arc-20240605;
 b=Y5FxC65gRfbkFIvzoh5MGv/91qCSX1nnc98sCUTKAZbEmfeDKZfYgyjZyWPstqUW4m
 3YJxboVrX29xW9ZE/u361/wYOMkWGQhj7lmTTcwMmJzvC/lhgJ2BTn+R5Mm5HosgCtPN
 sivJcsjluyfWLxsAHunk4zW4vAxgaqSgdQeRViM8E9njpwlshy/dDwlYQHHUR8h5SYln
 oQBdaZdREbP4A4VDgKDxONYcCAEPlqdhnqNSEmkiQXLWVPZUQVC769EOPnPWPeqR6vG2
 jRpwyMsuqHMSpwTE6Lklm84/TVI6sER3iEuWJeSEzm8qn7wdQZTiVayNSI+7DgluUQD5
 LMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=N44fD8qAnwX80ld8/GmOLqf+sw/wbXbSFzxkLU/B1FI=;
 fh=pC6iMxRcsiVOT/sUQ8DgBFt7cEGQ9PnVguLSaF09BNU=;
 b=lWWUVF/j2dhQ3cpEYrvu6Pca0R6VI76rcISlnNCG4CmZnc/ixAKA+QA/Z7H+GHmhcW
 KAY8hXe179bxV/5v3au8CQakgiH9VCNSXNXYP0osEdpsSjcNhndA9wJpWsf7h+bYiBj/
 5Zw427cqU11RrrGQRgJ+KMJi5CUBvirKnx/jR5+w03Nf2CTPArMm2p9pyiLgW4sE5O2a
 pPQ13UeD6lx+Adjey+zWUlCbkSY5AyMiGuVsbSJEb6W9MH9my7gHUi4Gpm/8UeZwlO1n
 kGj+gSu2KF0BwWkH9JWW9z+xlEFyIst8gHnCO4/urruh03ewoVEBYEI3J2TQ5HZFXIH/
 nAFw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781579430; x=1782184230; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N44fD8qAnwX80ld8/GmOLqf+sw/wbXbSFzxkLU/B1FI=;
 b=CPVZSsa1m0zudtWCAXw+8zzXJj1zZ/aSlM2Ls/pI4X5k1pYXTIyoNRoU9QByJ7cKLb
 +ShcrA6D6/VjI3wmh69aPa1Q8k686T60Oo4EH9LxWm9PeYyHmG9vZtIXNYYQkGfXQPI4
 jI8JtnMHrc5IuOm0MJ7i2RMoTPzyoi8GUZ8FlC2ykiJtLxqZQTZJATDJPJ5uqgijHfsn
 0QiY66utyIXtru0V9F09Ic7mjwe1hlBMvd2J497TZrWH1YhYDpdDyhqnWGOZ0UNEOPNt
 gOd942wSIPvtuNxdCNugb8KAlhYVYZ6RjkqIpDZNFRH8LI159ez1lUMQCF2Q+LlPwUdQ
 edjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781579430; x=1782184230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N44fD8qAnwX80ld8/GmOLqf+sw/wbXbSFzxkLU/B1FI=;
 b=knu3ofHvS1tgm8KqQP7oAn8h/eqRxlsYVytljxWcyvnZDttNVkOlABu/Lr7aDPgi3q
 zGlmPgfYM8MEOl1LV4SOUU9XmAK4bOLo3C1nS2oGg5t20r4uAJLTymq+Yq3RF4T39Val
 F5ik2lniYXa8NFUJBksHCElwIivNMCHsErSBLXmrxJJH0gjo9LdrhuJcqyUyqH/pbpZe
 ICU2JNeAUfXT3Iqsz1+uODMJhdl3+HnW2mfZuVoirEZug24WbQkv3PymSl1dA27mhP6v
 MjHrxXsCjQZyV9Fd0PfDIS3JVuSRYGmPBd+2VAnH0Kz0KXTOn9ULuhSjErI/WZhM2HWL
 bdBQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hfOawVlVqk4cdChcvK0tPPCuNnar32zkW0f0TzmOhN7nSYLUYyIAZWZCgw/k4aByCiobpNf7JeCEB@nongnu.org
X-Gm-Message-State: AOJu0YzGT0dpPEXu4pI9rS2btkUFm4AipzRF9/kntMt4PX8iLCWu6euQ
 8K288KWnh7E2pYMeaIB3coGsbm15huic3Hq4BVyYIXoW6dyko+lAcpMT3/g4FevQ9o+AVUbl7vV
 HfE8S/mXSpuN1ULu72C7Fwq3K4pCgbxiyT/2gauM=
X-Gm-Gg: Acq92OHXqRkgIem43Q4fztBubR/sBL2FYyv37nkiqMTzV+op4sy8gSqeJQR+Xkmyupl
 Mte3c9KVq7TAxANvl+GtO6FlxL1ZFAPRA+Gn7CsLwvqX+rntYI52/ofhtkS8KuKcpIBJ20THzbI
 jUHqqqESkihX2nflV3A2cXmsRHT5LFW9upGmcseJPvHhU1A1Hvqx6NSHZWof7m0RWlcvZgiVz8T
 YzN81rQjB898FaOuGnO4OWaweFIfQN6dpRu0KmYqepE9GjvRvHKROQNfkLbzFMQAYgPLZ8wDw07
 PndhbxEpZpsur6hq3hPtoSpJ8e+Qn6ewQivaCQ==
X-Received: by 2002:a05:6402:c43:b0:691:b051:41e0 with SMTP id
 4fb4d7f45d1cf-695086e1e08mr761701a12.4.1781579429700; Mon, 15 Jun 2026
 20:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-6-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-6-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:10:03 +1000
X-Gm-Features: AVVi8Cfx78ks6fN0eLf3a3NDqcbJTVHFhjRtmCkdSnNeGmt4wModOXrr3r0lXEQ
Message-ID: <CAKmqyKMg1QnHymPW8Q8aD-hcjL+gTyGmbg_kYPz2aVV9EK0hZg@mail.gmail.com>
Subject: Re: [PATCH 05/13] hw/riscv/sifive_u.c: add intc_phandles array
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
> Store the intc phandles in an 'intc_phandles' array, like the 'virt'
> board does, instead of re-creating the interrupt-controller FDT string
> and using qemu_fdt_get_phandle() to fetch it.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index a00cfd08a7..ce86989bc8 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -111,6 +111,7 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>      static const char * const plic_compat[2] =3D {
>          "sifive,plic-1.0.0", "riscv,plic0"
>      };
> +    g_autofree uint32_t *intc_phandles =3D g_new0(uint32_t, ms->smp.cpus=
);
>
>      fdt =3D ms->fdt =3D create_board_device_tree("SiFive HiFive Unleashe=
d A00",
>          "sifive,hifive-unleashed-a00", &s->fdt_size);
> @@ -168,8 +169,10 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>          qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
>          qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
>
> +        intc_phandles[cpu] =3D phandle++;
> +
>          qemu_fdt_add_subnode(fdt, intc);
> -        qemu_fdt_setprop_cell(fdt, intc, "phandle", phandle++);
> +        qemu_fdt_setprop_cell(fdt, intc, "phandle", intc_phandles[cpu]);
>          qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc=
");
>          qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
> @@ -179,14 +182,10 @@ static void create_fdt(SiFiveUState *s, const MemMa=
pEntry *memmap,
>
>      cells =3D  g_new0(uint32_t, ms->smp.cpus * 4);
>      for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> -        nodename =3D
> -            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
> -        uint32_t intc_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
> -        cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandle);
> +        cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
>          cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
> -        cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandle);
> +        cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
>          cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_M_TIMER);
> -        g_free(nodename);
>      }
>      nodename =3D g_strdup_printf("/soc/clint@%lx",
>          (long)memmap[SIFIVE_U_DEV_CLINT].base);
> --
> 2.43.0
>
>

