Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B26EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 03:28:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGAEb-0004MS-CA; Sun, 02 Jul 2023 23:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qGAEZ-0004Ld-LV; Sun, 02 Jul 2023 23:28:15 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qGAEY-0004Zs-50; Sun, 02 Jul 2023 23:28:15 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-57045429f76so45161487b3.0; 
 Sun, 02 Jul 2023 20:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688354892; x=1690946892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEtyQFgeikR6EdsZFb3eSnHlnVo/0SMASb/2UZ2u/Tg=;
 b=n7Plru5mev4AhNs5h3hPBIHNMbJLbMkLrWb4iquJljeZgpTWafrIb0QI74fdBPqsdG
 PobctLAVPa0NqKDYZfiLlOCx+BwxwCOvt+VpVPUwXek3qiZ62lzEGD2dwTBuluarK/Jx
 dSwC5ef327gF0AbW8icRKoYUpfQ5fXvHkgICXWFR4T6bUK0VEANqMSzUQfiSxR0tkSll
 dEeAyjue3z0th2XsOHV0L2cXmcmtBqeb1G0CPtgi2DJ9SJmsZc6aXEjoo8Awb2y4NM42
 /x+wzq/nIG4cN4mGAqAOS0qFvjaRdhQhklQUhZlEqKshR5nbX5w4liYaOKfetIibOPLC
 CHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688354892; x=1690946892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEtyQFgeikR6EdsZFb3eSnHlnVo/0SMASb/2UZ2u/Tg=;
 b=DaWxj/hxOf603yDmPzLEY+KtZC3Ava5LvE0lbh1cYkExo5QFx+tVyFC0HmDCc+Q8V9
 zv1/WI8ojL8PXnevlnODtFZguac9rulcwPgtpUEwNf46SoglLftWN5nxMqyXoezjhFOo
 mpeYNKMLxVhf+x2gCuBtBx3XhOC7/U7+c4YYSe8y34ShFOKodg9LVquLF+CxD0Uh5KE1
 1O/NRCxpTISmRqt2UC3hpemvwZyf7cWX5dxz3KlSmUe0w27PjKDEN7N4+pvxLpWO1sW7
 kWd3Qu8rc/fAq8GzzGWyCNsjBSmeNOSFjdxBdnQwI7kAzkhuaG4H+xaZjnAgvJbw0xST
 sdZQ==
X-Gm-Message-State: ABy/qLaDsZwy2xVEzolV+N8xGCPoy0dOYFtfrG1LnAregRDfmdnDHENT
 Ftrm0Y51B1oym9qELabhNJvRzdH30FGZCP+BKBqH0tMAD7zHzw==
X-Google-Smtp-Source: APBJJlGhIG0ALgYPWBB6CK1WODLq1HTxQT6uWGvEc5hPk+H10YCApcxeKjLDxSsbAI3Bp2aTDD6PrdlqdGDeI6HuBLU=
X-Received: by 2002:a0d:ca46:0:b0:576:916d:96f with SMTP id
 m67-20020a0dca46000000b00576916d096fmr8791531ywd.20.1688354892238; Sun, 02
 Jul 2023 20:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230627074915.7686-1-jason.chien@sifive.com>
In-Reply-To: <20230627074915.7686-1-jason.chien@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 13:27:46 +1000
Message-ID: <CAKmqyKP7cy13=_CNVCbJzzsLGqb3dUHw1Guq4+nk9UxUwkEkRg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Set the correct exception for implict
 G-stage translation fail
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=alistair23@gmail.com; helo=mail-yw1-x1129.google.com
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

On Tue, Jun 27, 2023 at 11:32=E2=80=AFPM Jason Chien <jason.chien@sifive.co=
m> wrote:
>
> The privileged spec states:
> For a memory access made to support VS-stage address translation (such as
> to read/write a VS-level page table), permissions are checked as though
> for a load or store, not for the original access type. However, any
> exception is always reported for the original access type (instruction,
> load, or store/AMO).
>
> The current implementation converts the access type to LOAD if implicit
> G-stage translation fails which results in only reporting "Load guest-pag=
e
> fault". This commit removes the convertion of access type, so the reporte=
d
> exception conforms to the spec.
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a944f25694..ff2a1469dc 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1277,7 +1277,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>          if (ret =3D=3D TRANSLATE_G_STAGE_FAIL) {
>              first_stage_error =3D false;
>              two_stage_indirect_error =3D true;
> -            access_type =3D MMU_DATA_LOAD;
>          }
>
>          qemu_log_mask(CPU_LOG_MMU,
> --
> 2.17.1
>
>

