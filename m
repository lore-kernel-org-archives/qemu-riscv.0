Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8314C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:21:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2M8e-0004zW-02; Thu, 25 May 2023 21:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2M8c-0004yz-B8; Thu, 25 May 2023 21:21:03 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2M8X-0003ww-E6; Thu, 25 May 2023 21:20:59 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-456fa6f1f79so57252e0c.0; 
 Thu, 25 May 2023 18:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685064053; x=1687656053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H+3Q9kSvvka7n607xHa5w6hcltpu8sRdQZL2IaSKzTw=;
 b=a4d1tI+l0yLm47Z4zCF792A4dBDy0rYgljw3RTTqcuop6o05/Pfl+FrDupxzlTZkJd
 i2KfQk6Kdv81vqeu1iE/6pTn/zOcEklz25h0wo4z+TvI1oD+FQZSAfTB2srXfEnA6FIt
 KDfSenVzpNM9+NmgotzeLiT4o3jNfn8tIeg1DRfeoGqadcj2Noua269xJWjrv6yP3cpF
 Qg/UTr7E+LvEsq8LjXDdQHMwzUaN+5Nt2ImcYunj9zicVEFzHd//hCKRIiIJE+ne5Slq
 Qrd87xXeUsmwWEn1VtR8aHTm8Vpq/H+L7oE35R4rT8cK+F67la1OYhkn+IBvGJdITFPV
 3/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685064053; x=1687656053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+3Q9kSvvka7n607xHa5w6hcltpu8sRdQZL2IaSKzTw=;
 b=VDrfbUfWDgP08QkhjN4qaEmZHAM7ybf2E6zVb12W1fLMk+pZfQdUt/fSue+5xopaN7
 STDhxaOuL4Kwn5akvKM7ZFfRfUs9nfPhAz6lfrZLN9q6z0clPxyu355qvDto6XczrLvJ
 ILZu83Ic1zZwYVjJgZw2+3b3tFT3zrDkYbNv95DiRNVoRgzS8sqIxhX5DVWwORYkOtwN
 l3DRxrxQIv9i0xCUvmBukVuo6OY92lAQMOCvpvilGhE8lPqko/qcjyzN4KHvbLNyC0r2
 FBJg/1GmX25INk9YFeLCKvsvwoEYW9Xg0VIPARQh6qHDPV97CjbX5UC8mBv7lOeGoyJu
 mFWA==
X-Gm-Message-State: AC+VfDw5+I0Gb3tK8QbI/FJFpN2NNmqdnkdnKA8va4rWwGnEbj8O60mN
 E2R7T2fa9dDtCGPM+sPQVYL/BUJ4SXk42+kZuKE=
X-Google-Smtp-Source: ACHHUZ5wByIp5qr4SDXG8195gkWHvujjORmWTHIJYITY63IR3Yn5cBkeJvbBLZeTCZNlQdj+PbTc4L1RuBxpDKXh9YM=
X-Received: by 2002:a1f:dfc5:0:b0:457:28:b2f3 with SMTP id
 w188-20020a1fdfc5000000b004570028b2f3mr68339vkg.2.1685064052886; 
 Thu, 25 May 2023 18:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
 <20230523093539.203909-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523093539.203909-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:20:26 +1000
Message-ID: <CAKmqyKN8pdAMtUvYBbOuavNxgjQJtDBrtzgRHr_mjQWYtgRNdQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] disas: Change type of disassemble_info.target_info
 to pointer
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Tue, May 23, 2023 at 7:38=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Use pointer to pass more information of target to disasembler,
> such as pass cpu.cfg related information in following commits.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/disas/dis-asm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
> index 2f6f91c2ee..2324f6b1a4 100644
> --- a/include/disas/dis-asm.h
> +++ b/include/disas/dis-asm.h
> @@ -397,7 +397,7 @@ typedef struct disassemble_info {
>    char * disassembler_options;
>
>    /* Field intended to be used by targets in any way they deem suitable.=
  */
> -  int64_t target_info;
> +  void *target_info;
>
>    /* Options for Capstone disassembly.  */
>    int cap_arch;
> --
> 2.25.1
>
>

