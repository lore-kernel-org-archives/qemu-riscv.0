Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A86FC001B0
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 22:41:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNhl9-0003JU-Bs; Sun, 23 Jul 2023 18:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhl7-0003Ia-Q3; Sun, 23 Jul 2023 18:41:01 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhl6-0005Wm-CX; Sun, 23 Jul 2023 18:41:01 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-794d1714617so1368671241.0; 
 Sun, 23 Jul 2023 15:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690152059; x=1690756859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rx6wqWY1FvtS4EqMFCMIvg7ByM2XiV+KgeuTfxVZJPo=;
 b=V05665R+Y5aWl3ZkDwVQ/xMLamn9Sh7uvaVpZhgls+hgqtyfm8O2DDvq0X6nep6Di3
 HzA+QnOQb+3+PkKy2VFRX/W1WW7Ug1hb7uyJMzsh4sAeTgJpwqkQgtex5SPUa4CcT8yq
 aT/mH9TfZ26rllTpLIIpr1LfmEhNwbPyHgdMaIqJfcOWp8gZOvRdF2K7CgdyxjV+5Zeq
 X4MWN8HNA07RGQ22Zb09ltilG1040yRcIlGUBsQHcFSxF5TpMy6NKjO9jAKgiM8D74ZN
 gYP426nV2SLLv25kb2JTVd2HO6uaWJFTmRjy0g5waOvLeH9Q0+wix1BfM8oKCaqGREVn
 0U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690152059; x=1690756859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rx6wqWY1FvtS4EqMFCMIvg7ByM2XiV+KgeuTfxVZJPo=;
 b=fmm39U7OTKDynBRZxKLucZtjWXkBguw3yzpgkaRzyzVPgs800P+knjq04lUoY4yLE+
 FTkIhrxbZhZ7Wfmln3JGl8OIggzmwGk05nwm0s1SVU6poZzD8vwSpv0F4T3kV4yieXel
 rhny7pMwSrCFxCmOV/vdUXejmVo/XMKKyppO6h54cvDOd8FMUhSNYHxgirvjtSXTbU7W
 a9Zj468WtqjIiidAB+iimVsbcFbIald8EubX9JLvnhdY14E6HmNLj/bWHw/kVuifbSip
 RTo6ZtyXv+c1vqURv33CqnNTl/2huJZXJVUru2nqZqlozVV/84EMgXLUlcp+OOveC/fA
 XyGA==
X-Gm-Message-State: ABy/qLYG039VReOadobJ2P/A1ocrNtNmWZ7ywDle/PXNJyOidRmZoHVy
 zbtcpAZDaR/BYAbYWncUTheavj6VdohfLD/kWBw=
X-Google-Smtp-Source: APBJJlFzh6LGe+sWmKLyYUunhpJax71G+FRUVXAN5JS1Lp7ghFTGz+FCpbrjyZ/LKCc7OsbXwBLh9amcuGb2KYsqTgw=
X-Received: by 2002:a1f:5f94:0:b0:481:2ff5:c9a9 with SMTP id
 t142-20020a1f5f94000000b004812ff5c9a9mr3858941vkb.13.1690152058797; Sun, 23
 Jul 2023 15:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230720132424.371132-1-dbarboza@ventanamicro.com>
 <20230720132424.371132-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230720132424.371132-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 08:40:32 +1000
Message-ID: <CAKmqyKMhcAwprz4YT2DwHqxHzztbGO0=s2xwCBJhsz_zk7+MGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv/cpu.c: add zmmul isa string
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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

On Thu, Jul 20, 2023 at 11:25=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> zmmul was promoted from experimental to ratified in commit 6d00ffad4e95.
> Add a riscv,isa string for it.
>
> Fixes: 6d00ffad4e95 ("target/riscv: move zmmul out of the experimental pr=
operties")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9339c0241d..d64ac07558 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -88,6 +88,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
> +    ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
>      ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
> --
> 2.41.0
>
>

