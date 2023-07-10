Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B24EEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 01:11:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIfQq-0003a6-JR; Sun, 09 Jul 2023 21:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfQo-0003Z8-SN; Sun, 09 Jul 2023 21:11:14 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfQn-0002iG-5S; Sun, 09 Jul 2023 21:11:14 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7918b56b1e1so1370331241.2; 
 Sun, 09 Jul 2023 18:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688951471; x=1691543471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5Fo+VHe4JVTJcEFIcDLIKP999Y4yWbgILe3Ib40Pmg=;
 b=VweBS6/Yk+sR3wpyqK5Yb7ppUvICTUHnhj59Ilg5DrAiniq8x07Lv6Qe/fCCZhjH5b
 qxbw9VBYf+B9tFzOkkMB0SnF9WGOeyZRKKkDPw2w0A9r0bt2SQJwi+RGicC1Ed8BhHLd
 d+SUuG0Oim0gNDiJJZpu5qUG67XNMB5MXid9QjtcXCfo8UwEOpitrYDo+LSa2LfQZSSZ
 cZYlpSjFv6kdLYl2qsXbZGkXJEeucOENogNDPabB583hCn7sNXhy+mi1oOjYp4aRkYa1
 2eIgOJZRkSn2NX0trHi8QBBessUOWh23vsyfSdk2t6lUAKaeVf4ebEhN8/2E+t2EbuJg
 7IAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688951471; x=1691543471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S5Fo+VHe4JVTJcEFIcDLIKP999Y4yWbgILe3Ib40Pmg=;
 b=Zfg3xa8/JC7xT7Mgh6c5i+c4Ohp41X/PlJSFApwEn0uEp8yY+vQ1loJeds6pYWsBJb
 w3gUzp0TF31QOYvFaZX90UFBO+eXvVQugPgsfzGxhhGz7vpeSpq0PV5fZ3Yc7i6X+x7X
 nnzrOfI0FwvypaiIGZDISMk+I0ZWDDr4TsNHmzeMeNgVHUU4Olc2JMMuT5QrF0wOyz4B
 iexztou76oyu9GJRdtHg8LzDK7Qy4how0xGEYtvPYK4y1p+Nkn7L20F3uzu+h4+5loSL
 KPdZaWpsNXBt7CCfnLyb46zsiyPgwfiFJruZfIjERVYGMDDWJ57YqkU8C2OPkqyxVj1K
 3oiA==
X-Gm-Message-State: ABy/qLaBxGS/OSNaTpEg0OhiroqDzy5RS3BVz9cP4PC+cHL+igrnLUOP
 GLt3gUz+6PYVbJ4/pwEGBSU9N7+F+mwtmFLSXCs=
X-Google-Smtp-Source: APBJJlGdmfPuhzjQqONKluI4Qmxj1LmscX9ib3KUbGKuNBqgjDQ8pLAP5rXnrLoPi/JvSGQfP6RoMk6+j6W3D787J6k=
X-Received: by 2002:a67:ea91:0:b0:443:873a:16b8 with SMTP id
 f17-20020a67ea91000000b00443873a16b8mr5385865vso.30.1688951471490; Sun, 09
 Jul 2023 18:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230704084013.21749-1-jason.chien@sifive.com>
In-Reply-To: <20230704084013.21749-1-jason.chien@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 11:10:45 +1000
Message-ID: <CAKmqyKOGwGcswdXBmMFHjvjBSz3b0-joTAoNf5rW3RvSKFG+8Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add Zihintntl extension ISA string to DTS
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Tue, Jul 4, 2023 at 6:42=E2=80=AFPM Jason Chien <jason.chien@sifive.com>=
 wrote:
>
> RVA23 Profiles states:
> The RVA23 profiles are intended to be used for 64-bit application
> processors that will run rich OS stacks from standard binary OS
> distributions and with a substantial number of third-party binary user
> applications that will be supported over a considerable length of time
> in the field.
>
> The chapter 4 of the unprivileged spec introduces the Zihintntl extension
> and Zihintntl is a mandatory extension presented in RVA23 Profiles, whose
> purpose is to enable application and operating system portability across
> different implementations. Thus the DTS should contain the Zihintntl ISA
> string in order to pass to software.
>
> The unprivileged spec states:
> Like any HINTs, these instructions may be freely ignored. Hence, although
> they are described in terms of cache-based memory hierarchies, they do no=
t
> mandate the provision of caches.
>
> These instructions are encoded with used opcode, e.g. ADD x0, x0, x2, whi=
ch
> QEMU already supports, and QEMU does not emulate cache. Therefore these
> instructions can be considered as a no-op, and we only need to add a new
> property for the Zihintntl extension.
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>

Thanks for the patch, do you mind rebasing it on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c     | 2 ++
>  target/riscv/cpu_cfg.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..6fd21466a4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -81,6 +81,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
> +    ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
> @@ -1598,6 +1599,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("Zihintntl", RISCVCPU, cfg.ext_zihintntl, true),
>      DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true)=
,
>      DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c4a627d335..c7da2facef 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -66,6 +66,7 @@ struct RISCVCPUConfig {
>      bool ext_icbom;
>      bool ext_icboz;
>      bool ext_zicond;
> +    bool ext_zihintntl;
>      bool ext_zihintpause;
>      bool ext_smstateen;
>      bool ext_sstc;
> --
> 2.17.1
>
>

