Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDBCEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 01:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIfYX-0005Po-UC; Sun, 09 Jul 2023 21:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfYW-0005PE-FW; Sun, 09 Jul 2023 21:19:12 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfYN-0004jG-LI; Sun, 09 Jul 2023 21:19:08 -0400
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7653bd3ff2fso445729485a.3; 
 Sun, 09 Jul 2023 18:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688951942; x=1691543942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQMlOxMczR12x2CyZiRFx0lvN/FJhHUKIinzcSdhdZs=;
 b=WytjUS55Vrwe2g3nIWCtvjmKmamwUsLFyQE5DhymrWzx1Dp1SRM/hbaSb6S08SMxwH
 3On6nCqYoS7wnVY5BXARI6RrDLULkaWBJo3k8FEBVF9GvJp0MbIqz2zdOnUuJOZ3baZw
 6V6oFkO+ElZqj+XnBalUWdkizH2jUWaBTmj/VGpVJnbN2tiI7ejC4OEmLg2upZRqgzUF
 hmzl077BY3Ppxzz2bcmHMxDQZ60ETp+Hw69gH1h41IUbwG+xgh3Ke8EmpO3zanuVFfJI
 SHeWl14qEhLzwrcB96b77ZdzcEE2OL/dsLH7UrNoik8eUBzE3HkeAMipiP/tQrP4nmOT
 JZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688951942; x=1691543942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQMlOxMczR12x2CyZiRFx0lvN/FJhHUKIinzcSdhdZs=;
 b=E1kC2IevIM6H3+rc3AZPTpwutxWr9A0mO+w5F2YIm0JxjD5FDtQ1fufoMPKxZpQq8Y
 o2417kQ/v3jvr1ocAvnd90Zfj4kjebjKoCiL+QbN2IM80gFjDP2W1g90BX1W0EMHa4m1
 XpVLLK/Q0IIxYvCw9uLEMzCjv0jdoIUBvyaYRtfqJlGmg5t8IG5Bu8BLRLZzBvPMCAZr
 eSJgyVXbBrJ64datI+mTXblWWFrIGrQsiLGbEmIwI8TaouFlz/WmQqWSZB2s4JkEesdp
 ToAMvIxNTbsC5BsYusGY5WkMOn/Z4rCofSEoXM9RFqqQL+4m7d18xM1Mm+Zc/j6w7bKR
 vIpw==
X-Gm-Message-State: ABy/qLannE0VFmYKJHhZB/CNqf+y+Zq5WYx+ZNFFc3VUKrjJKwOGvEly
 UjDj3yzKHBslnRdRyxOAlWvCDQVxtqRYYGa3IgM=
X-Google-Smtp-Source: APBJJlFumua1K/xRFTKacwSaP7yCUD9ZcI3XD++pppEv3wlu7NNA4Nfv7TowZLI4Cx9CyIS3DPC6TgmHbJZvG54vXVU=
X-Received: by 2002:a37:2c87:0:b0:75e:bf7e:e17e with SMTP id
 s129-20020a372c87000000b0075ebf7ee17emr11402454qkh.6.1688951941960; Sun, 09
 Jul 2023 18:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <168872495192.6334.3845988291412774261-0@git.sr.ht>
 <168872495192.6334.3845988291412774261-1@git.sr.ht>
In-Reply-To: <168872495192.6334.3845988291412774261-1@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 11:18:36 +1000
Message-ID: <CAKmqyKNoCKHqVM5ykFTqM=-nUYqij64YYyvrPyemgPXtE+K6KA@mail.gmail.com>
Subject: Re: [PATCH qemu v3 1/1] fdt_load_addr is getting assigned as the
 result of riscv_compute_fdt_addr(), which is an uint64_t.
To: "~rlakshmibai" <lakshmi.bai.rajasubramanian@bodhicomputing.com>
Cc: alistair.francis@wdc.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, rathinabalan.thalaiappan@bodhicomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x729.google.com
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

On Fri, Jul 7, 2023 at 8:17=E2=80=AFPM ~rlakshmibai <rlakshmibai@git.sr.ht>=
 wrote:
>
> From: Lakshmi Bai Raja Subramanian <lakshmi.bai.rajasubramanian@bodhicomp=
uting.com>
>
> fdt_load_addr is declared as uint32_t which is not matching with the
> return data type of riscv_compute_fdt_addr. Modified fdt_load_addr data t=
ype
> to uint64_t to match the riscv_compute_fdt_addr() return data type. This =
fix
> also helps in calculating the right fdt address when DRAM is mapped to hi=
gher
> 64-bit address.
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Lakshmi Bai Raja Subramanian <lakshmi.bai.rajasubramanian@=
bodhicomputing.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 95708d890e..c348529ac0 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1244,7 +1244,7 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
>      target_ulong start_addr =3D memmap[VIRT_DRAM].base;
>      target_ulong firmware_end_addr, kernel_start_addr;
>      const char *firmware_name =3D riscv_default_firmware_name(&s->soc[0]=
);
> -    uint32_t fdt_load_addr;
> +    uint64_t fdt_load_addr;
>      uint64_t kernel_entry =3D 0;
>      BlockBackend *pflash_blk0;
>
> --
> 2.38.5
>

