Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B8DC4167B
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 16:13:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r80hi-0005U8-Ra; Tue, 28 Nov 2023 11:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r80hh-0005Tx-BK
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 11:12:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r80hf-0002s5-6e
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 11:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701187970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUZ5d/vAP/zLYKXf2NV7GCUE2HqUcuJl7SkZ9vGsMkA=;
 b=L+6ZPZdqQQDSwZi7LhnLxtrYobMlBlOQAyOJeFUKxGUnZIE97SCqTlWJd9gng019kPJn2X
 oNowcIllU5trsuavI7Ts9FuqX552MU6v66/qYlGgEi67B4IoxV+INNqf/TOm8nFJRgVWbW
 fAI97P8TiFmBzfNIBOinlOBBKmnq0jg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-u1XLuiGmNzqVQxvtNNszEA-1; Tue, 28 Nov 2023 11:12:43 -0500
X-MC-Unique: u1XLuiGmNzqVQxvtNNszEA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a01e91673ecso440198466b.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Nov 2023 08:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701187963; x=1701792763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MOl0zH5t7ejYn6sMjijRgBd85PcJCBQ/8f22rks4iWs=;
 b=HQvnfp/+8nAZ04IIGudO0mDTyxYcZu7D0eIpJB8zhuPbYqznxRa450huY7iWUL9bW1
 t7/nz2UY+JP0txwh3QWVJjAh6T1EG2e8Ia0e/RntPa0axYEPeEiDpLGCqVyEkQbvMDW+
 qdyk58blj/URmogDkUAkk/8/ZIXguJXJnX5O6px506LmF5AFfCdo3p5U5l8mDAzJsauS
 beqkiUDeFa8+Tb2W24LFQcK+BOl36Ka0u1QA7bs5vPcMYVy/NgUVwwqHr99hZQWxUDKY
 FyWRXpHDb47nPQWrUs3Gn1rwmMMONg/mrn+icWeyGcASh2K6cUwTtSMJnW2x+Rw/+mXg
 sRyg==
X-Gm-Message-State: AOJu0Ywc+Pao6BUprbiKcJDDtrNaGh6iuS05HsdaWdlwOJFhlhoSRJ8y
 zahntEIY0I31sDjhQKamLTfTU2b3MMhu7V13UPV4l2U88XtAy0UITc6jTimUkWwE9XE8BspPWlZ
 d55NLeD7qEtUgDeI=
X-Received: by 2002:a17:906:1019:b0:a10:eda7:7976 with SMTP id
 25-20020a170906101900b00a10eda77976mr4348379ejm.56.1701187962805; 
 Tue, 28 Nov 2023 08:12:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9oD7yiuiRAHRridHm0iyGUGQ3OevRM/3rjO5NBvN7KmuB9U/IqjenUZiLa88lLgCWnfgMPA==
X-Received: by 2002:a17:906:1019:b0:a10:eda7:7976 with SMTP id
 25-20020a170906101900b00a10eda77976mr4348360ejm.56.1701187962342; 
 Tue, 28 Nov 2023 08:12:42 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 l23-20020a170906231700b009ff1997ce86sm7040332eja.149.2023.11.28.08.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 08:12:41 -0800 (PST)
Date: Tue, 28 Nov 2023 17:12:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand
 <david@redhat.com>, Peter Xu <peterx@redhat.com>, Anton Johansson
 <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Marek Vasut <marex@denx.de>, David Gibson
 <david@gibson.dropbear.id.au>, Brian Cain <bcain@quicinc.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Claudio Fontana <cfontana@suse.de>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Ilya Leoshkevich <iii@linux.ibm.com>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, Alistair Francis <alistair.francis@wdc.com>, Alessandro Di
 Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Chris Wulff <crwulff@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org, Yanan Wang
 <wangyanan55@huawei.com>, Luc Michel <luc@lmichel.fr>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, Stafford Horne
 <shorne@gmail.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, "Daniel P .
 Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Bernhard Beschow <shentey@gmail.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>, Michael Rolnik
 <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Markus
 Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 05/22] exec/cpu: Call qemu_init_vcpu() once in
 cpu_common_realize()
Message-ID: <20231128171239.69b6d7b1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230918160257.30127-6-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
 <20230918160257.30127-6-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 18 Sep 2023 18:02:38 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> qemu_init_vcpu() is called in each ${target}_cpu_realize() before
> the call to parent_realize(), which is cpu_common_realizefn().
> Call it once there.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/core/cpu-common.c    | 3 +++
>  target/alpha/cpu.c      | 2 --
>  target/arm/cpu.c        | 2 --
>  target/avr/cpu.c        | 1 -
>  target/cris/cpu.c       | 2 --
>  target/hexagon/cpu.c    | 1 -
>  target/hppa/cpu.c       | 1 -
>  target/i386/cpu.c       | 4 +---
>  target/loongarch/cpu.c  | 2 --
>  target/m68k/cpu.c       | 2 --
>  target/microblaze/cpu.c | 2 --
>  target/mips/cpu.c       | 2 --
>  target/nios2/cpu.c      | 1 -
>  target/openrisc/cpu.c   | 2 --
>  target/ppc/cpu_init.c   | 1 -
>  target/riscv/cpu.c      | 2 --
>  target/rx/cpu.c         | 2 --
>  target/s390x/cpu.c      | 1 -
>  target/sh4/cpu.c        | 2 --
>  target/sparc/cpu.c      | 2 --
>  target/tricore/cpu.c    | 1 -
>  target/xtensa/cpu.c     | 2 --
>  22 files changed, 4 insertions(+), 36 deletions(-)
>=20
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index ced66c2b34..a3b8de7054 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -204,6 +204,9 @@ static void cpu_common_realizefn(DeviceState *dev, Er=
ror **errp)
>          }
>      }
> =20
> +    /* Create CPU address space and vCPU thread */
> +    qemu_init_vcpu(cpu);
> +
>      if (dev->hotplugged) {
>          cpu_synchronize_post_init(cpu);
>          cpu_resume(cpu);
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 270ae787b1..eb78318bb8 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -82,8 +82,6 @@ static void alpha_cpu_realizefn(DeviceState *dev, Error=
 **errp)
>          return;
>      }
> =20
> -    qemu_init_vcpu(cs);
> -
>      acc->parent_realize(dev, errp);
>  }
> =20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 6aca036b85..fc3772025c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2277,8 +2277,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>          }
>      }
> =20
> -    qemu_init_vcpu(cs);
> -
>      acc->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 84d353f30e..d3460b3960 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -119,7 +119,6 @@ static void avr_cpu_realizefn(DeviceState *dev, Error=
 **errp)
>          error_propagate(errp, local_err);
>          return;
>      }
> -    qemu_init_vcpu(cs);
> =20
>      mcc->parent_realize(dev, errp);
>      cpu_reset(cs);
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 079872a5cc..671693a362 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -152,8 +152,6 @@ static void cris_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>          return;
>      }
> =20
> -    qemu_init_vcpu(cs);
> -
>      ccc->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 7edc32701f..5b9bb3fe83 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -345,7 +345,6 @@ static void hexagon_cpu_realize(DeviceState *dev, Err=
or **errp)
>                               NUM_VREGS + NUM_QREGS,
>                               "hexagon-hvx.xml", 0);
> =20
> -    qemu_init_vcpu(cs);
>      mcc->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 11022f9c99..49082bd2ba 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -131,7 +131,6 @@ static void hppa_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>          return;
>      }
> =20
> -    qemu_init_vcpu(cs);
>      acc->parent_realize(dev, errp);
> =20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 7faaa6915f..cb41d30aab 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7425,15 +7425,13 @@ static void x86_cpu_realizefn(DeviceState *dev, E=
rror **errp)
> =20
>      mce_init(cpu);
> =20
> -    qemu_init_vcpu(cs);
> -
>      /*
>       * Most Intel and certain AMD CPUs support hyperthreading. Even thou=
gh QEMU
>       * fixes this issue by adjusting CPUID_0000_0001_EBX and CPUID_8000_=
0008_ECX
>       * based on inputs (sockets,cores,threads), it is still better to gi=
ve
>       * users a warning.
>       *
> -     * NOTE: the following code has to follow qemu_init_vcpu(). Otherwis=
e
> +     * NOTE: the following code has to follow cpu_common_realize(). Othe=
rwise

Does moving qemu_init_vcpu() past check and altering comment here
makes cs->nr_threads somehow correct for following if()?

>       * cs->nr_threads hasn't be populated yet and the checking is incorr=
ect.
>       */
>      if (IS_AMD_CPU(env) &&

missing context:
       if (IS_AMD_CPU(env) &&
           !(env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_TOPOEXT) &&
           cs->nr_threads > 1 && !ht_warned) {

> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 8029e70e76..dc0ac39833 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -565,8 +565,6 @@ static void loongarch_cpu_realizefn(DeviceState *dev,=
 Error **errp)
> =20
>      loongarch_cpu_register_gdb_regs_for_features(cs);
> =20
> -    qemu_init_vcpu(cs);
> -
>      lacc->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 2bc0a62f0e..3da316bc30 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -321,8 +321,6 @@ static void m68k_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
> =20
>      m68k_cpu_init_gdb(cpu);
> =20
> -    qemu_init_vcpu(cs);
> -
>      mcc->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 03c2c4db1f..1f19a6e07d 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -221,8 +221,6 @@ static void mb_cpu_realizefn(DeviceState *dev, Error =
**errp)
>          return;
>      }
> =20
> -    qemu_init_vcpu(cs);
> -
>      version =3D cpu->cfg.version ? cpu->cfg.version : DEFAULT_CPU_VERSIO=
N;
>      for (i =3D 0; mb_cpu_lookup[i].name && version; i++) {
>          if (strcmp(mb_cpu_lookup[i].name, version) =3D=3D 0) {
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 8d6f633f72..0aea69aaf9 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -492,8 +492,6 @@ static void mips_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>      fpu_init(env, env->cpu_model);
>      mvp_init(env);
> =20
> -    qemu_init_vcpu(cs);
> -
>      mcc->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 876a6dcad2..7a92fc5f2c 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -216,7 +216,6 @@ static void nios2_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>      }
> =20
>      realize_cr_status(cs);
> -    qemu_init_vcpu(cs);
> =20
>      /* We have reserved storage for cpuid; might as well use it. */
>      cpu->env.ctrl[CR_CPUID] =3D cs->cpu_index;
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index cd25f1e9d5..e4ec95ca7f 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -141,8 +141,6 @@ static void openrisc_cpu_realizefn(DeviceState *dev, =
Error **errp)
>          return;
>      }
> =20
> -    qemu_init_vcpu(cs);
> -
>      occ->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 7ab5ee92d9..e2c06c1f32 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6833,7 +6833,6 @@ static void ppc_cpu_realize(DeviceState *dev, Error=
 **errp)
>      init_ppc_proc(cpu);
> =20
>      ppc_gdb_init(cs, pcc);
> -    qemu_init_vcpu(cs);
> =20
>      pcc->parent_realize(dev, errp);
> =20
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7566757346..4f7ae55359 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1531,8 +1531,6 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>      }
>  #endif
> =20
> -    qemu_init_vcpu(cs);
> -
>      mcc->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index c9c8443cbd..089df61790 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -137,8 +137,6 @@ static void rx_cpu_realize(DeviceState *dev, Error **=
errp)
>          return;
>      }
> =20
> -    qemu_init_vcpu(cs);
> -
>      rcc->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 0f0b11fd73..416ac6c4e0 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -252,7 +252,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>      qemu_register_reset(s390_cpu_machine_reset_cb, S390_CPU(dev));
>  #endif
>      s390_cpu_gdb_init(cs);
> -    qemu_init_vcpu(cs);
> =20
>      scc->parent_realize(dev, &err);
>      /*
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 656d71f74a..e6690daf9a 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -228,8 +228,6 @@ static void superh_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>          return;
>      }
> =20
> -    qemu_init_vcpu(cs);
> -
>      scc->parent_realize(dev, errp);
>      cpu_reset(cs);
>  }
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 130ab8f578..2fdc95eda9 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -782,8 +782,6 @@ static void sparc_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>          return;
>      }
> =20
> -    qemu_init_vcpu(cs);
> -
>      scc->parent_realize(dev, errp);
>  }
> =20
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index a3610aecca..0142cf556d 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -118,7 +118,6 @@ static void tricore_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>      if (tricore_has_feature(env, TRICORE_FEATURE_131)) {
>          set_feature(env, TRICORE_FEATURE_13);
>      }
> -    qemu_init_vcpu(cs);
> =20
>      tcc->parent_realize(dev, errp);
>      cpu_reset(cs);
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index acaf8c905f..300d19d45c 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -174,8 +174,6 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
> =20
>      cs->gdb_num_regs =3D xcc->config->gdb_regmap.num_regs;
> =20
> -    qemu_init_vcpu(cs);
> -
>      xcc->parent_realize(dev, errp);
>  }
> =20


