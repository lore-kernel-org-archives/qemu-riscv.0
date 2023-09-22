Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B205E7D0CD
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 06:03:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjZGK-0006y6-L8; Fri, 22 Sep 2023 02:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZGJ-0006wo-HW; Fri, 22 Sep 2023 02:03:35 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZGI-0002sQ-3l; Fri, 22 Sep 2023 02:03:35 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-45271a44cc4so795402137.2; 
 Thu, 21 Sep 2023 23:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695362612; x=1695967412; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+B5d2ijOxTqrh7YS7jQgnYSz0iUfepkY2EVyW6WJPfo=;
 b=HEb7VU79nPD87fGlgDMV/0NzrG3+sL3tAEvpmj4KMVJ1NiJcosX3TT5V4qmmmxhqsc
 gwU9RyN/g4ZIU8yrhjJUD3/cBWl83lpE1xKaW5PkmMwSWnFrpI7gDnPgQAe6ulZ7xyE8
 QdDQVPcnJALVCQqpSQdfryJt/do4KNFg4JPG7ns0Zj5WgPyxzu1gp9NJ6UEvo9lYJXf0
 BTllWSABXywDXwusAbzbfFih03d43U5NIGCC6yuLNPydBn94UFrg7Yur76ZhpC7b0h9I
 VtYR/OKZVTnsZxiwujY+u2LkT1DLtOGsRdsNPBpBe8wtX6SSDSZ9F2h3t59Mwywg9H4a
 yP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695362612; x=1695967412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+B5d2ijOxTqrh7YS7jQgnYSz0iUfepkY2EVyW6WJPfo=;
 b=xGORLqZovW/h1NOLLE08ISLWCR0a/r44e3JKcZkNUQFS7FQefWLWgRagnsxB2iNEMg
 aJ40NOZ/28cniBL/Dt3w9s9vPjEmyYkYlrRTEBh9fzITTfvmgJOn5nsoQsJi8vLq5AWB
 1SEJy6V1PwdrvBWIBDbc9uUxr8LNH9WpldkttFXe4m2IKQ9MQemXJjoYKJmeEso/ImYC
 BqTRUp5hqN8zaY0yUbUDehRQ6D6SC8v4LbuKCPIFizWnf0m01YAFEKDVtZK9S61MKF5O
 Q56lfq8BnmM4h98E2Hh4fGI+MOv2aYrwemP47XW5wydg4z1GTjGxAITUxYOJKTfOO0cy
 7lPg==
X-Gm-Message-State: AOJu0Yw3kdmO3FryxOyktZY2TZKWpv2bIiD00VPgxwwprBrtPFeXB5lM
 PJptP3HxAbiRyH+oLmV209G1cMBzw5eMHdR5CWk=
X-Google-Smtp-Source: AGHT+IFoBouslO43cFTOOVL36pEhfjORvVLFHJomhrG2NJcmIxrWHAWZJbME54aqeO6MAYwjbKUdUVIBQcattUCojrc=
X-Received: by 2002:a05:6102:11e4:b0:452:829e:ac90 with SMTP id
 e4-20020a05610211e400b00452829eac90mr6843838vsg.28.1695362612510; Thu, 21 Sep
 2023 23:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-10-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-10-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Sep 2023 16:03:05 +1000
Message-ID: <CAKmqyKM+Jxp2Xp3GgDmBS9yTjNqVX-wH0_iLcJR+6kdPA=aBDw@mail.gmail.com>
Subject: Re: [PATCH v3 09/19] target/riscv: make
 riscv_add_satp_mode_properties() public
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Wed, Sep 20, 2023 at 9:24=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This function is used for both accelerators. Make it public, and call it
> from kvm_riscv_cpu_add_kvm_properties(). This will make it easier to
> split KVM specific code for the KVM accelerator class in the next patch.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 ++---
>  target/riscv/cpu.h | 1 +
>  target/riscv/kvm.c | 1 +
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0dc9b3201d..50be127f36 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1115,7 +1115,7 @@ static void cpu_riscv_set_satp(Object *obj, Visitor=
 *v, const char *name,
>      satp_map->init |=3D 1 << satp;
>  }
>
> -static void riscv_add_satp_mode_properties(Object *obj)
> +void riscv_add_satp_mode_properties(Object *obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> @@ -1589,12 +1589,11 @@ static void riscv_cpu_add_multiext_prop_array(Obj=
ect *obj,
>  static void riscv_cpu_add_user_properties(Object *obj)
>  {
>  #ifndef CONFIG_USER_ONLY
> -    riscv_add_satp_mode_properties(obj);
> -
>      if (kvm_enabled()) {
>          kvm_riscv_cpu_add_kvm_properties(obj);
>          return;
>      }
> +    riscv_add_satp_mode_properties(obj);
>  #endif
>
>      riscv_cpu_add_misa_properties(obj);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9dc4113812..cb13464ba6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -726,6 +726,7 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_experim=
ental_exts[];
>  extern Property riscv_cpu_options[];
>
>  void riscv_cpu_add_misa_properties(Object *cpu_obj);
> +void riscv_add_satp_mode_properties(Object *obj);
>
>  /* CSR function table */
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index e682a70311..e5e957121f 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -1323,6 +1323,7 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
>      DeviceState *dev =3D DEVICE(obj);
>
>      riscv_init_user_properties(obj);
> +    riscv_add_satp_mode_properties(obj);
>      riscv_cpu_add_misa_properties(obj);
>
>      riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> --
> 2.41.0
>
>

