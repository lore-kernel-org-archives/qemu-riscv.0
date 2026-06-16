Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BCCCD98DE
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:16:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKHa-0001d6-6W; Mon, 15 Jun 2026 23:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKHX-0001Z1-BE
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:16:07 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKHV-0002O6-Oh
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:16:07 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-bec43ee8ff0so567570666b.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781579764; cv=none;
 d=google.com; s=arc-20240605;
 b=QcDbf8lwdxs9XUwssrlrLSmbOAJpue9VUe7Gxwv70KayQmiuLh5p9sMh/PtB2b4P7E
 GMyGkFyY0xKLlXGTl+uGU5GvhfildJkNCGFK+J1J3puojeszjtTt4Rgw390kOepowJvT
 F6X7bwxFiED6S/EHULT4TCofuHaXyChkVzmDEfL540an+kEyKQ+8VqbFREp1wvhnNxeT
 5Lx2qTdGdqZyPAjMMxJxYh5Dps1AcvuKSi0PXYxgHqiwWhND61EM4d15tsDtPkgesoqT
 s40SWXMZcWY8h1fPguoTJ4mOjC2bU5psHlKM8d2ncLiDQ70c1KGdXKw2XOtNqC7LRZCs
 lxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=X6K3/nxqWW72ckKxzv6eA0AgH3KjHYa6C6CTempCJfI=;
 fh=P2C37yEtncwa4sWzMJ379nu/r4aoml/bolrLrH6fOJg=;
 b=CAlV/SfFT4hVf9lv59dQ0uw/OjiVX85hD4NmcaDWr+Ceo5bFIGfmM77AUb3gWfAqKp
 6UoEzW7ISeJDm1At6lpkUMnzGQTAPZ75Z//LA2wv9h7xEXyOeOGh8TBKjHH26+K+o5Sw
 uUMLuui5UQp4fzDQcspOmVgSJtOs+fnbCQsSdb98lRdFYWO/USeTiC68ywrHOpyFM2Hh
 xTVSCQA+al7skbGYFRyV0hw+3E4VuXqveYLaa8eL9Trxy6ppsmo7vlyl8kOu8DeIyBi7
 sZ0lyw8Jd9AbW9X02ijo3G5+iRUwThVI/c+HHmbFFUySYnmOQGcZhdGTazdTEQCNYI5p
 mMiQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781579764; x=1782184564; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6K3/nxqWW72ckKxzv6eA0AgH3KjHYa6C6CTempCJfI=;
 b=fdTNvm+zSJ2N9kjXjZkx2MgXK5HpnVeZ9Rn9QCI6Y7PcVVZFq4Ctja6cFfW19jwLAI
 lyW0JNTQT+R+zn4p8VtTE4MerB/XxyJjQ/D+4udWc51A9yYRslZlblkVZtI2f/2BVT47
 nPCC/eOXpq2h4CbygMHoqaUvTGz/qfGc2GvA9sJzVAOKC6Tyo1wRqVQr1l+Jw/us3Cfe
 VY6n+ROeCKmU+BZVsW7AvVj+rqD29kczmwiCdoxFM5PSw243Xu5OjtH/OqUNGlKrxcBZ
 UgDguMyaqgVCzHSd15uQCz7opkDGF2hp0jkqMCVE3AQe5AzLujr44Byc4MJJJFjex88G
 KDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781579764; x=1782184564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X6K3/nxqWW72ckKxzv6eA0AgH3KjHYa6C6CTempCJfI=;
 b=EWEvLNxcFPnaPPd+pdSVdRCTd7E8jAbxoTx+14Uf/vyqX6J1uu3RIgQNaN+FiKVMAE
 roY4x185qWqsD2eGXVNhAddBGX/JUmHIrT6M4cdk8sVGqX3xH0kGcUqcP/hwDIi9Apv4
 RyKKhu8ZYuVdq1wkrClGA9WBGckQJk+b8zh7EfnnFUYEZO0xqBsUGjtV8SxZVrgZ+vGo
 HVtPCXJo80sM+DZJzMz00l6vWzhFynCpNJe+fBOuyzdGTsBCa5sR3mwO4mrxWQjKKSqy
 vQ8fOpBWU3bCp+M9Jo+qgn/SiSA0KibIcZMVCsCB2gKKgiK+JuMz8S/D+tnL0DPIKG/K
 PzoA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8bzO6C1/F9atzyebjnLZ2frTSBwVK6dUL0laLx2ni2qP28bMA3zIOYsMrAClMwMP+Lmfx9t0MN+a7e@nongnu.org
X-Gm-Message-State: AOJu0YwRZZ7cDUA1MsopEWkh/ei4N/BDYF3iZaS4yPRf7CdybuuJJEe7
 43FHYOEiul6BKF1D7y0AyFhX/go4axfsS+dxVf4ujHQBR993ad6o1qYkMdLbSmxGlxBC33117xt
 Sj5HRsA2x87iMZeJPgFEsZD99hF6ZFpl9+Q3DEMg=
X-Gm-Gg: Acq92OGaix2HJdkv/d+RiI2HS08UiYHGraSj/5aH/ChQ58Uwpg7n0dhbO0ecMgkRP3Q
 tXMqm1VJFT22MIkDoGfk9jd3TYa3SINQmOpna07HYT4eiNi2VfgqCRwxv3jMyq/h/COAI3SOPHb
 y84bYPVYoajjE1FNV1n62q+2PFsxI2nD3IN725s6AUSyPDknp5ZmM1iMj+RtTFbA4S//ezBbA6+
 XIXs3NTybeRtpnEMLS5FXZ2hVFPUtJByLXSPfuVyuTRD32DcFAIB5wErpiAZxY+zvmXcdzH+b30
 fW9TY0DQ+D6MemtMzIHTfmKele0z/GksG2hkWjag0AeZJRDz
X-Received: by 2002:a17:907:1caa:b0:bd5:1ad4:cd73 with SMTP id
 a640c23a62f3a-c0416d02af1mr126698166b.2.1781579763798; Mon, 15 Jun 2026
 20:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-9-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-9-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:15:36 +1000
X-Gm-Features: AVVi8Cdx5vlHO0GaGm1eP3g5kFIyyx8igaBd_db5hWvCBn3FVzsgY-J86LyRGCo
Message-ID: <CAKmqyKM-7RL5-z+dyNp7RVKxvjZ-oXJAchXr3OhfAaAxzLLiUQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] hw/riscv/sifive_u.c: add cpu-map,
 cluster and core DTs
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
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

On Tue, Jun 16, 2026 at 6:40=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We want to consolidate the CPU socket FDT creation into a single helper.
> 'virt' and spike has the same code but sifive_u does not have cpu-map,
> cluster and core subnodes.
>
> These subnodes are present in other boards even in single socket configs
> without NUMA.  This is a strong indicator that their presence doesn't
> hurt a NUMA-less board like sifive_u.
>
> Add these DTs to make the FDT standardization straightforward.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 9a791b36d6..a4265fed0f 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -109,6 +109,7 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>          "sifive,plic-1.0.0", "riscv,plic0"
>      };
>      g_autofree uint32_t *intc_phandles =3D g_new0(uint32_t, ms->smp.cpus=
);
> +    g_autofree char *clust_name =3D NULL;
>
>      fdt =3D ms->fdt =3D create_board_device_tree("SiFive HiFive Unleashe=
d A00",
>          "sifive,hifive-unleashed-a00", &s->fdt_size);
> @@ -143,11 +144,17 @@ static void create_fdt(SiFiveUState *s, const MemMa=
pEntry *memmap,
>          CLINT_TIMEBASE_FREQ);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> +    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> +
> +    clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", 0);
> +    qemu_fdt_add_subnode(fdt, clust_name);
>
>      for (cpu =3D ms->smp.cpus - 1; cpu >=3D 0; cpu--) {
>          int cpu_phandle =3D phandle++;
>          nodename =3D g_strdup_printf("/cpus/cpu@%d", cpu);
>          char *intc =3D g_strdup_printf("/cpus/cpu@%d/interrupt-controlle=
r", cpu);
> +        g_autofree char *core_name =3D NULL;
> +
>          qemu_fdt_add_subnode(fdt, nodename);
>          /* cpu 0 is the management hart that does not have mmu */
>          if (cpu !=3D 0) {
> @@ -173,6 +180,11 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>          qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc=
");
>          qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
> +
> +        core_name =3D g_strdup_printf("%s/core%d", clust_name, cpu);
> +        qemu_fdt_add_subnode(fdt, core_name);
> +        qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
> +
>          g_free(intc);
>          g_free(nodename);
>      }
> --
> 2.43.0
>
>

