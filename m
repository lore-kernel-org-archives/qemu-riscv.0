Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1C7C83F3E
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 02:16:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcz89-0003oY-A3; Sun, 03 Sep 2023 22:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcz84-0003n7-Bs; Sun, 03 Sep 2023 22:15:52 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcz7y-0003Ex-2A; Sun, 03 Sep 2023 22:15:52 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-48d0ff94bc0so168990e0c.2; 
 Sun, 03 Sep 2023 19:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693793738; x=1694398538; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYah1mBzln76Ym4KG0Irtf1slMWFci9QuKRrgUFJt1A=;
 b=MJK53hGuHIQOsCqvyInaA/AdrmY5i9S5x75o4IzRUvWW8teLXYXk4bcurig0bh8EIr
 Ya/AF61eOhA5cgSwv96VmPQzmq80iVXAi0uGzkbbAbFdsgvkVONAaK5Ei2GrkXbPjm+v
 4CjWwAfCronVVl3AzharrFY6BDQuBC++uPoLEkXP0cvIzq2omPTXsbb47DWDSGfdzQmK
 zcB7MNlIyO6quiGBwUO7/o2bStUrmWPiM788HEuOg9QbE1JbuJEja1n87MD6qRc+2K7G
 d3iGmpr2qcORVqdaPuiR9PtZrsKcymKo1kGhP9shVaVgTZlaW9ObKKpjOi3Fa0ry6eQR
 xuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793738; x=1694398538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYah1mBzln76Ym4KG0Irtf1slMWFci9QuKRrgUFJt1A=;
 b=E67ASwcS9Fm/pWlhWyVTOQeEQlDFbHvx1YKXSFu3Ywqkn+kbzLrPNuIC/iPmnV9Onx
 3LNUqpCGXKvDVHbxwucOvaO0CCgWRoDhsJZRaqyzYF5KeY37FVOc1euwtezyq268HOyG
 fRh+VN06OdbEc18wkBU6A6cYp93in1bLTzChpVjqjXTxnx8oismwAll8NGlUVA9NSOcR
 fv5ERgVBvi3Iqx36xIn0aoiDZpiErbLnIOUq1E7PrHjXjuvPv0xiKG1dS4wWQuU/aCyy
 GnKzcRML06tIq1JqQ/JT82W2LNRytcY22oJVhQ1pV0YBU//nNe4ivIrnoKRmGc9IPbVy
 gfiQ==
X-Gm-Message-State: AOJu0YwP4Zi4VeYhaLiTGkt/4jsyHE2+rO6CIBAJCg8Mf/ZIrGJaNz/z
 ZJsYtL+r+TGmCfZy7qVpm7vaGcP39G4ckDx8XA4=
X-Google-Smtp-Source: AGHT+IEWYrb36PdKBag9nv7umgVIk7G1bTldHchuOPfvROLSmBUu/NAVg8VDJpg5RlmqqjygOHylbjZp7FvBGQl3oDc=
X-Received: by 2002:a1f:df83:0:b0:487:d56f:fc82 with SMTP id
 w125-20020a1fdf83000000b00487d56ffc82mr5999148vkg.6.1693793737962; Sun, 03
 Sep 2023 19:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <20230901194627.1214811-9-dbarboza@ventanamicro.com>
In-Reply-To: <20230901194627.1214811-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Sep 2023 12:15:11 +1000
Message-ID: <CAKmqyKPmMjs5qL8Mzg1CAcjgTREvTZVOe-fa-vopsSOXpPD8Jw@mail.gmail.com>
Subject: Re: [PATCH v9 08/20] target/riscv/cpu.c: add
 riscv_cpu_add_kvm_unavail_prop_array()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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

On Sat, Sep 2, 2023 at 5:50=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Use a helper in riscv_cpu_add_kvm_properties() to eliminate some of its
> code repetition.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d484d63bcd..8cd19a9b9c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1978,6 +1978,16 @@ static void riscv_cpu_add_kvm_unavail_prop(Object =
*obj, const char *prop_name)
>                          NULL, (void *)prop_name);
>  }
>
> +static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
> +                                                 Property *array)
> +{
> +    g_assert(array);
> +
> +    for (Property *prop =3D array; prop && prop->name; prop++) {
> +        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> +    }
> +}
> +
>  static void riscv_cpu_add_kvm_properties(Object *obj)
>  {
>      Property *prop;
> @@ -1986,17 +1996,9 @@ static void riscv_cpu_add_kvm_properties(Object *o=
bj)
>      kvm_riscv_init_user_properties(obj);
>      riscv_cpu_add_misa_properties(obj);
>
> -    for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> -        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> -    }
> -
> -    for (prop =3D riscv_cpu_vendor_exts; prop && prop->name; prop++) {
> -        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> -    }
> -
> -    for (prop =3D riscv_cpu_experimental_exts; prop && prop->name; prop+=
+) {
> -        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> -    }
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_ext=
s);
>
>      for (prop =3D riscv_cpu_options; prop && prop->name; prop++) {
>          /* Check if KVM created the property already */
> --
> 2.41.0
>
>

