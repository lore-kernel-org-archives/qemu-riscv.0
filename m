Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A91EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:25:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgaL-0001lK-8z; Sun, 09 Jul 2023 22:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgaI-0001kC-Gx; Sun, 09 Jul 2023 22:25:06 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgaG-0007M1-Ke; Sun, 09 Jul 2023 22:25:06 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-47e4d002e0bso1348605e0c.0; 
 Sun, 09 Jul 2023 19:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688955903; x=1691547903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDHMwccPCZKNRBPhFIGFP3o5FS2ynvOCfW1uIF++t9k=;
 b=pCi4eePMkNOO4SB8p2zvPLdcxkmwz3zzoDZTIMFbezOCSA5w1MoRLlQTgAhuXYzwvQ
 vz9zezYqmgaS5wj8/CBjL4uuJpl44O+sxS/ltxZXZZhAWMb/L66/aIpVfNrzxDVcweKT
 3Kz1l8hh8W2r0x+OiuC9gxKDdfCKYWgZc3nZ+kkD0LnjNOga6VSSSEDolRbym78sLD2D
 2hLJfeM5tHq/mbPyUP71VXprELFVaEW/hmPxi88ErwAAA3RQ7ZlcdEyBLAafUFa2Fc5r
 etT9LC712rfdMIDLJilv2Fkr2bmyhtszYK+2TJONDPPutS14OvVMuu+YA6AT9uvyAmIt
 zd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688955903; x=1691547903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rDHMwccPCZKNRBPhFIGFP3o5FS2ynvOCfW1uIF++t9k=;
 b=AtKU1w5KAbgPqMiIJfWi7I53U7WGLo8BXSERjiQou3fABozNNP5JDvBOiTMHkOTPWQ
 M044+FeoY2Fbagr7nhIjEaZo6JIf+B7gfXCR3SEseUgIF688llI9zakYyNBOdsUCDhAv
 HulvocNxMAZFOZYNLQ2fKuOpwpKirnh8SHJOjtA8TnLXrb1XDLFRIeqrEvvI+wtVSZbu
 w0IXUpIUFlavRgKwtgtPlvy9dAXef5w8DHmOhPEAJaIDWfhIOBazBxJfi90C8LGQgcXg
 6ap9q81oCFSyNNhh3QLL1qQQEo0iinhs2H3u+/j/G559SoELfMvZmpoTvUp1l0FpgLGV
 ibiA==
X-Gm-Message-State: ABy/qLZSGIY0SkXR0S2Y64VAcQ4PACmruDwfpz730/ynF63yE3JxoIbP
 JedOHf7lVuP2talrocI83tBvBMtzzb2cLJhBCcE=
X-Google-Smtp-Source: APBJJlEUWgdEqw/1rvs4ehUEjyYaYtg/R8twTSg5Vgj2OwkgLL/BjzUBdvN3zeyn1AUE/jvL75Uzrh8KiXzzzIYY5KY=
X-Received: by 2002:a1f:4551:0:b0:47e:3da7:b37e with SMTP id
 s78-20020a1f4551000000b0047e3da7b37emr6069374vka.5.1688955903179; Sun, 09 Jul
 2023 19:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-17-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-17-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:24:37 +1000
Message-ID: <CAKmqyKPbKhQFyXZQKVwqM3dnekJdUWQB5fj9E0oeBw508sBHEw@mail.gmail.com>
Subject: Re: [PATCH v9 16/20] target/riscv/cpu.c: remove priv_ver check from
 riscv_isa_string_ext()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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

On Thu, Jul 6, 2023 at 8:20=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_isa_string_ext() is being used by riscv_isa_string(), which is
> then used by boards to retrieve the 'riscv,isa' string to be written in
> the FDT. All this happens after riscv_cpu_realize(), meaning that we're
> already past riscv_cpu_validate_set_extensions() and, more important,
> riscv_cpu_disable_priv_spec_isa_exts().
>
> This means that all extensions that needed to be disabled due to
> priv_spec mismatch are already disabled. Checking this again during
> riscv_isa_string_ext() is unneeded. Remove it.
>
> As a bonus, riscv_isa_string_ext() can now be used with the 'host'
> KVM-only CPU type since it doesn't have a env->priv_ver assigned and it
> would fail this check for no good reason.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index deb3c0f035..2acf77949f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2124,8 +2124,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str,
>      int i;
>
>      for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (cpu->env.priv_ver >=3D isa_edata_arr[i].min_version &&
> -            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
> +        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
>              new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>              g_free(old);
>              old =3D new;
> --
> 2.41.0
>
>

