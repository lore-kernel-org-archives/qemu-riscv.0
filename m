Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C32FCD98CC
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 03:43:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXsn4-0008GN-O8; Thu, 11 Jun 2026 23:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXsn2-0008G6-R3
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 23:42:40 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXsn0-0004lE-Vb
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 23:42:40 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-68cec9f4c6cso728368a12.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 20:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781235757; cv=none;
 d=google.com; s=arc-20240605;
 b=OSQIv4yzVkB21FbmVShoYR+fqpUD/KfQXm9IJX9yvj/t+G5PxNWIHdpgNFd/tCKXbP
 BXLlsNhG67dCso8ViwM2COgkzHfeml/kmRBybSvBmViemWWCheRwkAYDm3373eUDx/S2
 jTuZInzcnnu9NxMbzzRVhg3o2G4ysbYOf6kawECJWW/ICo3g6nvlwrAamzh0LHi+PRnJ
 lC2EzhsKOOIYRehHAblBuLbW1M/llbANP1xiCCf3lLF4nFNWOFaLJllzmzpIuJ58TFYF
 6SZ/5RcBhKS3UsE8aZdthcz+wVsfzfXwgFX28RhVLpMJKM/D6VmTYDhFiaxWIXINag4u
 F9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BKXwUyc2mOYHmyhUSoE6yPyt7YlrIeEESabXVthSip8=;
 fh=tQSlO7Rx3Qu+nsu6S87CZtP56xIzG1XUBh3EWiHBKko=;
 b=k8grcfZ5rIFy9GSFZYlrH70z07ETG4JGlwtcZR0KgX/NKd1nI1VJimW4r7MJl5xvGY
 PKRjBKiaAaEaUzoyprTUUrfVDI1Pbbb+M/y4Zw1Yqoqyyqnr3GruUzprB9MINJX9dpsS
 9YQp0xaNCFVPl9wRZYQ/C5qlMF4KkivXKpvjn8sp54BNaLO3lIOYsgRtYM9SDUjtQ9Qn
 cfxfh/uccz7by89iOu6sD4G5CLc3CyFS+8exX0YbMMoXjoN9cwRABHna7IVaGTGRMXVl
 Exrh6XJCcOLXR2Z5AgBpNReuz9QqdO7XxEtbt+ohFbRgRUBNEoRLKaLO8PO8/uPvVBiD
 IR+Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781235757; x=1781840557; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BKXwUyc2mOYHmyhUSoE6yPyt7YlrIeEESabXVthSip8=;
 b=hW1t0NjuoYhd9o9CLSEK3cHqK6yCECQWlsMGHZm6p+HWE9LMICThX3ErATmNqY81gW
 SEwmq/aqEdpsF/QBkEAyTanBNfflBV49NWXRwcY4JU6k0kt33hLToPWIy8Y10BnWkiX6
 MhHzjuOwjcvGVTcasfp/+K5HnXCcNc0EHyFTanTkLg1Bme0eeXUVyNePAmOjCK0iiUyM
 gTeD74VInHCljjUNYzcUSdfBmFQ/0E0oXuvw3OZUmY9xawoQXYoylxUlG+JD+o0V4iBT
 HcTSIGAxj9FLxPsqaPXHvTpIm0pkslML0eWlfQfLgRfwgYa62QfWDIYCR560jlGZgOIR
 KOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781235757; x=1781840557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BKXwUyc2mOYHmyhUSoE6yPyt7YlrIeEESabXVthSip8=;
 b=ZM1ZfCXRLS3wLEOaVDgig+6PBh5sFnvhw/Q3etnJePeCI/LaBMlgY0GpUCHzYYKGYm
 rmXap5aZ6y01QSdsrwpUlZxzTEFt8FmqZRfEbN0JzjQFkje7s5iYDpp+4XoSZH7xTHxQ
 xHuuouJDLPlb0yCFqMOmzWbIvCzNFemM5Fuvv/X9Ii9D1J4pBhs3DQqSYkLdPt/1iAHy
 Cvlh7pIrBCJEWeA8dUYSerkCNHnVdf51fEhI8VRrFqZ1OUMt1z5/IzgtVy9UUM4oo72k
 ZejKv0IMYFfrPLOg+F4/uLS336rVUYXFEC2yIQkl/lU2OjrZ85uP34hJwwdzSNKYWkZ8
 fjHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ87bNYKyJKDtMfkYDUiivnUsD/jmD45eYxDlHzRfcxt2CXolWJy7FZkkjsMk9eG/DmX5jjhdLLb8O6+@nongnu.org
X-Gm-Message-State: AOJu0YzVY+SUQ8owMJYu7Y3f9D3ce+LNVwb2BSgXgkB6KCWBvthiKo4f
 IBdOGgkg05bpgY+gOpXVxMopOtQFrn3rKLk7dCCPm/QWnBaxPcy/KOukehmLXQs/eEZulVW0nvT
 T03/uRMwSinHmpqORaLfjh2nEVkv5120=
X-Gm-Gg: Acq92OEQhMNTGtBli3IQGjffLs0a5HZy3u+F/AEPhYv/fw40S/jfZvw0HGr25/Nbhvt
 4POjKD98bH7P3K1i4lTXUzGiqa8psW9/gBVWHRNE/bo/lWetCE+2cTo0Fnn1adUDAK++YR8/QFA
 JN7dlqT+2UL7et7cv+3hf2SdWpznzqtNpdpFpD2zsDMWLoX9W7PAblHqDBcufPJR/ugk9yPriCa
 is8G6xJhKEH1YLBSNrIhh423EyOOu/vJ24hAy/b8rhXDAPOYgrGsVb4h1vzPtj/QKNS1ba2uGcM
 XYHclVeyQXb7y1xhVr/FI3nadfskZsxfTbe8ww==
X-Received: by 2002:a05:6402:540c:b0:66f:2ea5:c269 with SMTP id
 4fb4d7f45d1cf-69378a4d387mr337720a12.15.1781235756904; Thu, 11 Jun 2026
 20:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260606145520.34152-1-imaginos32@gmail.com>
In-Reply-To: <20260606145520.34152-1-imaginos32@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jun 2026 13:42:10 +1000
X-Gm-Features: AVVi8CfU8fhGCf-_u7nYDSpn_yuEfplfHfZs2EPv8C3uLJpm0HxIv9HaNhWD6J4
Message-ID: <CAKmqyKMA2GfZOjoyHo_7=cgbU3k8EuiCAY2DQqaLVZxY2n7YWA@mail.gmail.com>
Subject: Re: [PATCH] disas/riscv: enable `mnret` disassembly
To: imaginos <imaginos32@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
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

On Sun, Jun 7, 2026 at 1:32=E2=80=AFAM imaginos <imaginos32@gmail.com> wrot=
e:
>
> The translator has supported mnret since commit 3157a553ec6b9a
> ("target/riscv: Add Smrnmi mnret instruction"), but the
> disassembler still renders it as illegal. Add it unguarded,
> since the encoding does not overlap any other extension.
>
> Signed-off-by: imaginos <imaginos32@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

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

