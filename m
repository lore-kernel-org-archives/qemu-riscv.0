Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC041EB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 01:23:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIfcb-0006Rw-Ss; Sun, 09 Jul 2023 21:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfca-0006Rk-QR; Sun, 09 Jul 2023 21:23:24 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfcZ-0007Qf-Cj; Sun, 09 Jul 2023 21:23:24 -0400
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-44357f34e2dso1023106137.3; 
 Sun, 09 Jul 2023 18:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688952202; x=1691544202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QN3K+VEmz27nfGZ1j8+zf09O0gO6jmqCqaAUp/UiHxw=;
 b=rHP2TjdDEsojZ1jGFoTMOJfmDORaO9tnjb1jNBn2iGX8EN3PcNoMChWG7k0sqZ4cIJ
 wbCRX6FyYuh8/2ASYePwYYZealRncmv7TWZlOm6hsUghqL3OL13dWY8MdCdhwvs6W1na
 2+xecEUBfFr5SQuyoxo4SMquaH0bA7XMXLERXGAoyrG/iF7XqC+Su0P4Cdh+uZVAGd+P
 UEwDjg971yEcHW+ogVAVR2yI8tEEflFxu84R/ShcTYQq2dQf1uxlHzNOqM186mRSx+fw
 KIv8aMzCJIAluI22tLjy1aAL2cM1ElUuOWg09HvcqaSS1KwlZQNkG4XYSOPQABqDlH2Y
 9u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688952202; x=1691544202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QN3K+VEmz27nfGZ1j8+zf09O0gO6jmqCqaAUp/UiHxw=;
 b=elm/T/J2jhMIy4rbDimG+AivTTWjjIJK5NB71HDvL5ej5bEWPsvpT/jZA09JZj4CP7
 A0TPd+ZocKOIQ1O/1WjYbiHwhA2FzwpN8BmP3WZl+CmmM4VvvhJx9X7H/S+NJVTKXki8
 PYrIa9T1WpkRJHlE1R3FlBeg6kKQnXyU91hKP1eWaFxDaS5iDxR1+GaSqVuaM6plg4th
 1oUnXx/DpztW+835dV8SU6KraNkEjftwW0mdqVrC4NMz/A/h1rctze/JxTV3ZeChOAhR
 6xpUNmXicvKzfBY6xIY63Ic67YQfVfPTabIMiEEzxSVnDbmIkhJp7RTyuudwCP0FWnsh
 450A==
X-Gm-Message-State: ABy/qLaFeiI8YQJmdYTIQIpwTZL9yE6UsrJjpfYQWoOWnl+qgUnGUZ4X
 AUgpBt/68sfrUidO0CmeN4Zjw33VfjZ+SGbBCEHtOmSyg4npag==
X-Google-Smtp-Source: APBJJlGzIcdIqcXn8hfiCuToEFRQb/HGCtVR6BE6y6I1csbxZ0chiw/VtBPhHE9iNIhQwhi9twjuzlCHbYdd1XM9EN8=
X-Received: by 2002:a05:6102:499:b0:443:91a7:766c with SMTP id
 n25-20020a056102049900b0044391a7766cmr4068026vsa.27.1688952202000; Sun, 09
 Jul 2023 18:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <168872495192.6334.3845988291412774261-0@git.sr.ht>
 <168872495192.6334.3845988291412774261-1@git.sr.ht>
In-Reply-To: <168872495192.6334.3845988291412774261-1@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 11:22:56 +1000
Message-ID: <CAKmqyKMOJTv89N1DK8w8Cw4y4DSQP7qLQr8idTa+QbtDr9FP=Q@mail.gmail.com>
Subject: Re: [PATCH qemu v3 1/1] fdt_load_addr is getting assigned as the
 result of riscv_compute_fdt_addr(), which is an uint64_t.
To: "~rlakshmibai" <lakshmi.bai.rajasubramanian@bodhicomputing.com>
Cc: alistair.francis@wdc.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, rathinabalan.thalaiappan@bodhicomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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

Thanks!

I tidied up the commit message a bit and applied the patch to
riscv-to-apply.next

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

