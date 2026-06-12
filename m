Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ABFCD8C9D
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 03:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXst3-0000rg-5N; Thu, 11 Jun 2026 23:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXst0-0000rM-Ob
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 23:48:50 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXssy-0007U0-37
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 23:48:49 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-68bd9fce347so951041a12.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 20:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781236126; cv=none;
 d=google.com; s=arc-20240605;
 b=Sw5QmcQ3vC8FiEGr37tGCctwglRmfuBwPGS7ZVqvqVCCvOl2xZEaS0GB/SnlqmAkDN
 5d89JZdfvPe8T7M0DmIJUxvYyAB1TF2Xq5Urr4ZifVDNyCtql61IgCen/sv9xYTNz84+
 jGx8vAPWl/B8ynb+emwjQNAJUDZX563Ybduhgso8e0XUuaAgVregTpBY8gE7Y+PLRgWb
 YCe89iHOgIVI6s0LiSptFoJpXlaD5VPln0ERYVpJe7LXqVy2RRrPpHzY41pVrnFI4WJ+
 X10hwzDrQDYbNgvGbfLOy02MILdKyioPNTQ7XEi6t6FfVcjf5qPs0NmvsuxgGWf5Nlh+
 rceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=asLThhv5rJ9q+kTKdzC8tDXN+Ex3qgtD7namDBKaYUA=;
 fh=JsT5ZyLvcRgredCq3gDydk+aSEQmqPn1/UV6Sx0D2Go=;
 b=FtgBKveBtJTM16uACGDfOimL9e3xjxoMxSr8ovtOgoEjaYDSQvjQGPljItnnltiAvV
 K4+VSS9qiBM369/baCGwvSVBQ9FueimeR4W/BowhTeCyEINWOY448eLGVqGariUnvngz
 9hMFXtzQ3dWP2cp91PGqtKkx2LEl4kcUJ3Jy2Fo5gSQSqFdZEfGnKMtBbvBgUtUdrlRI
 HKbSkaEXi+UVbSyTHiXmKnq536VbA2LCwlJNX7dDOQy331CVg20b9qy6VkwmvISq791Q
 TJ1D64Fl9cjNVKF8uIoT4RboiQovQsV4myjJJWBGc4fMkiddUTHgx/ZiJj/Ig0sV/kcp
 iLVw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781236126; x=1781840926; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asLThhv5rJ9q+kTKdzC8tDXN+Ex3qgtD7namDBKaYUA=;
 b=d5EF14/prLStaDn9A/YSYjAGtpvNHBKGPFOtdZ7HILwN+VTLhEm4l3ANt/4rUhPFoU
 UgkKz3gWcBqVgBDW9RBvNozr0yNSu4N/5BOh2CSe4P/WCu0LyBYhn5iasDQxEO803sna
 tKNaqukNVB31z4N/TkTFs79iSn+3q8g1epdGRvalmqwXpYRTXcLmk2CuVCmz7cnaiMnV
 usfyNEArFNq7tk4oiz0vpDErisoQJiVmmsIXQ209+ottxmqrt+xJuFbIzgNGWP418mf1
 fzxNxRf1RMUdioFV5zI8Tdm/rKAusQEzN+peKyUYSdiwqL9BLy+sujvpdP5yPPI3NXaN
 3m7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781236126; x=1781840926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=asLThhv5rJ9q+kTKdzC8tDXN+Ex3qgtD7namDBKaYUA=;
 b=oGV28tFIyFddi16GQQ04a+qe/3Faq+Ndp2a916bpLxaQdHyFSj8+nFUoDdShRHwjRy
 sXTX5+Gl+Q2mNET9Z8ykyYZGvd23Nnu+Pzn96YrEWQRSWzv4B8BFrUSsuOfgxnoDUfS1
 naEqEoBeKw8m1AL65RlSs4kfsSrk21V4AB8Mt0kJiRmoS6Uxuar2JwPm6v9fhErNQ8Cy
 8LjleNoV0vC02bOFlYykzb9MJWQ1rfNxyLjxC7HyNvCkDbREfjvWeIElQ7oxFr2zmyhm
 LEG/q11v+bf6D6aiSwZmAYlaC5Niri+KwecD696eilxD2OCI2SnNsoG3AaqmH6MHFQJE
 nxOg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/yvDfhYO32fbZyVXy+U0FamgY1pWRUuwL/RrEnhcQLyeuKIlbwT4OyRGJxFZzyIJXwTKEC5AOxTKKE@nongnu.org
X-Gm-Message-State: AOJu0Yy+osBM9Dt8n5ZpbA9B2OD2io9MRVTDbuZeYYnVsCkuhzclP3gt
 +Yjsef+8kIdwB/qGInDHCF9uTpzT6AbR0o7HaN92M2Ux3pHsT9tFC42j+pM8ZXc64U6JSI3Nrat
 4rSdOPHG1q/d1IrVi5P9HgZoDdTp4Poo=
X-Gm-Gg: Acq92OEkEC3aYuT++EHSzeJsBbR/KRUso1IeGxBsMMj9vbZzTA0S/lB/BgQTIod/Q8Q
 N9UBS31jgZlgWZiDmi2fhgClam3V3oUPrhLr6DinfEkmlfq/slC3gULbuaM3vuGlsFW+YdhvuE8
 9TvFt69AF6/S++m/ICAsISzPsT+M2olteMRD+IHjndhrfZHTNIJ/rzYIBHYganQEg28q1l6IrGj
 dolPSgxC6mT0aHuDIO59QJ8Lxqc5/L8ew1msc8EsxcJj7HaCPN0rX/JdiCDv9pRu4EeYsbp7mmt
 gpG0BBaWgRQzWlZo8WmRDYBt1x9scE1+gL6zjs80ZbTnx4lz
X-Received: by 2002:a05:6402:e0e:b0:693:ee1:9018 with SMTP id
 4fb4d7f45d1cf-693781919d3mr352681a12.28.1781236125468; Thu, 11 Jun 2026
 20:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260606145520.34152-1-imaginos32@gmail.com>
In-Reply-To: <20260606145520.34152-1-imaginos32@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jun 2026 13:48:17 +1000
X-Gm-Features: AVVi8CenocUhIQTh6e52GkloSrLBnOJyI5wJ-e8xWZFRwPQG_3Yf9HftiKRWLL8
Message-ID: <CAKmqyKPYAYP-npmDr1E3-+sqKU7aBSm+a=YuwUG=_Vr=9Z7Yvg@mail.gmail.com>
Subject: Re: [PATCH] disas/riscv: enable `mnret` disassembly
To: imaginos <imaginos32@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
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

On Sun, Jun 7, 2026 at 1:32=E2=80=AFAM imaginos <imaginos32@gmail.com> wrot=
e:
>
> The translator has supported mnret since commit 3157a553ec6b9a
> ("target/riscv: Add Smrnmi mnret instruction"), but the
> disassembler still renders it as illegal. Add it unguarded,
> since the encoding does not overlap any other extension.
>
> Signed-off-by: imaginos <imaginos32@gmail.com>

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next and
sending a v2

Alistair

> ---
>  disas/riscv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index d416a4d6b3..065985992b 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -985,6 +985,7 @@ typedef enum {
>      rv_op_ssamoswap_d =3D 953,
>      rv_op_c_sspush =3D 954,
>      rv_op_c_sspopchk =3D 955,
> +    rv_op_mnret =3D 956,
>  } rv_op;
>
>  /* register names */
> @@ -2255,6 +2256,7 @@ const rv_opcode_data rvi_opcode_data[] =3D {
>        rv_op_sspush, 0 },
>      { "c.sspopchk", rv_codec_cmop_ss, rv_fmt_rs1, NULL, rv_op_sspopchk,
>        rv_op_sspopchk, 0 },
> +    { "mnret", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
>  };
>
>  /* CSR names */
> @@ -4050,6 +4052,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>                      case 64: op =3D rv_op_mret; break;
>                      }
>                      break;
> +                case 1792:
> +                    switch ((inst >> 15) & 0b1111111111) {
> +                    case 64: op =3D rv_op_mnret; break;
> +                    }
> +                    break;
>                  case 1952:
>                      switch ((inst >> 15) & 0b1111111111) {
>                      case 576: op =3D rv_op_dret; break;
> --
> 2.43.0
>
>

