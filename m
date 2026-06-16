Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA02CD98DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 02:41:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZJjl-0001Wy-CU; Mon, 15 Jun 2026 22:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZJjk-0001Wh-5J
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 22:41:12 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZJji-00011d-JX
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 22:41:11 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-68c32f3c6d6so3970229a12.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 19:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781577669; cv=none;
 d=google.com; s=arc-20240605;
 b=E4vBDR2bAf30RUArQiI7QTj2kdBQJp9+1rHg5+JvypptspiG2HkLyy88EhqPJ/E4IC
 MZ2s1KHdt3DSNddG1BBbhSrlcV/Sk3wPqQIaKX1aAErG9cmZVKT2vt3KrifgQFDdiRT3
 JFELIlXKI7o5Ck89IuS8ddF833p+jwwKhesU/2/rLH4N31dUFwPgilZf2U1i2dyGsPVr
 Bhpy7rDk4eYIOQ798v8/gbqZ2sTA+JrpcMWMJE+b8PzhJ8oxUfvaYV28UedR/S4TnYFM
 +PKEn2CDfSCXoX99u+Og12q1EsmQcy3ioOOFMSUA872wzFwiw6oeLlMHbGqbK1E5q2AY
 esEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ez7+L26DUwFYKt7C5CcuAdR1zyp//HQR6Woig/CwNNs=;
 fh=S0jJk2PLOd16KH/kO6LGtHZ1Igz+PiBFxWNsdi+UpOQ=;
 b=B5Sg1sbbTVVL0PI3wQdL2dJG9zaeZFFjiQZ98L4TMraFZj9HpH/9YVOuxofMBs5uAk
 to+9XQAmEOhgQlt1mhyP0hd9d6YIr4rMxxWIO9fKyZzT46rwj98L2OU0L61mLFez3XZo
 LGfeRABR/J0LLPrlYKwcA1zbI+zUWRZB269PJ4d0kxW8Sp5Yd0/3pjKoCLVNtRSe61RM
 EcaUXlHANUOvPBXKoS4DfmxsbQJfGDbn2AhoV1kDWLCt1GFFv/x63rOBYUWMYhj3mta+
 anzw5ImMEuWdM/cs6pJjQ1LDsQ4E1nxFDtPOr/frhX7p9P5Sg2wklwbkuO73Tc9c+sb8
 N9vg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781577669; x=1782182469; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ez7+L26DUwFYKt7C5CcuAdR1zyp//HQR6Woig/CwNNs=;
 b=mlljyWg4wlV/p/XL0bJkWFBkmosqwwPVSjjrRrWMebav3w3gUov1eSLO9b1rGwIoib
 B6s45UVtwJ+n+wQEVRSweH0NuNphfW6DIXy7fBo3HxLVnIrDk8KZJYId/8JATCxe6nIT
 ZFQt0ZuWmIIpsqIYd5bdHjNX/67dLBYZBXvgVLGfKY7p1ZNFXz9CSC6Q4eKS4Qnrb0B6
 /SB4akNXNZiUCSAnJ15P4CLrA0MRLCOua93r0szCci7R9MxtBq0nu6iNq1rIxq/j8G4A
 dehbdzbSNiFdVjiFRd0sYnKSQ9ooJApjMqPET2w5+DQTbFGFkmDKU2X74mIh9IxkuSp/
 UWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781577669; x=1782182469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ez7+L26DUwFYKt7C5CcuAdR1zyp//HQR6Woig/CwNNs=;
 b=PVh7y/N0eiFbMKUqU+AuZOltzHyHzSyPA2iwaYjdABA90CoCjgKZ7ss/RWosFVikCR
 c0hA2S8zsFECbiye7aTRQunHZcfDBEnlA3a5PVIvA/RPRxWnXj43Q3jexKnqzW9ywQ/E
 qenYh1uB/PdyakWXFOgksFNw9hPSBAjYz/fXYK0P8sd87kqUNe2B3g1B2IdZ4r3tlKW/
 AOr3fKQ6dfWkSFYuVy3HCrTctY3waqGRoMC2wbvQzpni7RYCG1EuE0FcHloWqBB4lOiZ
 /9z+D9/Jcv8oIzqYhVhu+v6c46w4/AgGQi1zQwBMzPw3K5F2DGnuQVQDTGYTfYuIrl97
 z0uA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/0TBHBN1G7vo1IkE4FfD2TeBJAbRHxw7vMlOM68XG1O6cz2BMPl+DcMEHAT/VtntcwEwWmIl10h+67@nongnu.org
X-Gm-Message-State: AOJu0YxuDMcbs25Z/1H6oAPk4M5NnPcPX+zSHntcy+mmQ+pCHqLaeOGE
 kuWfEp/vIqB9XgcK9+PPcol+yBPRb4cW+zFv4a9ouZMgXusShBkQp5GMxJt26wutNRuAkrLS0rG
 S0eQoIznevdxuaHsLPQ4vrfEhEnAeRIg=
X-Gm-Gg: Acq92OHQmo1vtQx98KuD6YE0kaO5ONCOA1GIN6523XeQ8B6ZCoigDBohJoC8HYA2OHl
 eIr/ZE7bi5fugZk8kwwPRWsGtFbhr4clT+aBzcUQku/2OStD3iPgDgEhO2Zq4E4upRKga7guWot
 zA4jkfLbRpZweCGDXq1YvAjJ8fCkPxFpFK3aN7biT9fZ20Swb1gkPbW2g1ibD9upu2BNTfdptak
 GkqI8Z3GMMfQYzh4EAglFpJUJMIwbmXZX2VXvRVbzT94YDKZczVaKmaxHDzqEZ41FcD78CwyTaB
 9EPRLbQ3KKHmlwIVWScUusvbVxnhdQt54KMVNQ==
X-Received: by 2002:a05:6402:4416:b0:683:1cc8:84ae with SMTP id
 4fb4d7f45d1cf-695086f27eemr880054a12.7.1781577668284; Mon, 15 Jun 2026
 19:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-2-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-2-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 12:40:41 +1000
X-Gm-Features: AVVi8CfTALMzDr_Lxn-Zv1hcSmF1TmdZEYi6BrqJiwxmm_H_DKj1k64cS-Jm5fE
Message-ID: <CAKmqyKNKTqK+RPbGb1D1ciGOTDN+as8W4OO0_V_0VGqjsnUvpw@mail.gmail.com>
Subject: Re: [PATCH 01/13] hw/riscv/sifive_u.c: add a FDT phandle to cpu-intc
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

On Tue, Jun 16, 2026 at 6:39=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We're assigning a 'cpu_phandle' phandle to the cpu-intc phandle field.
> Make it more in line with the other boards by assigning both a
> cpu_phandle and a intc phandle.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 6a637e3b86..3abbd6c823 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -187,8 +187,10 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>          qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
>          qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
>          qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
> +        qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
> +
>          qemu_fdt_add_subnode(fdt, intc);
> -        qemu_fdt_setprop_cell(fdt, intc, "phandle", cpu_phandle);
> +        qemu_fdt_setprop_cell(fdt, intc, "phandle", phandle++);
>          qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc=
");
>          qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
> --
> 2.43.0
>
>

