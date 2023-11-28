Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F641C4167B
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 16:01:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r80Vu-0001Ca-3J; Tue, 28 Nov 2023 11:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r80Va-00019u-0o
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 11:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r80VU-0001Al-Dn
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 11:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701187214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzhdmniUAulYKiMWHmvNUF6uT6F1wxvW3o6/RqMDVpk=;
 b=NNd1WHg0Z08eNKD3sCHEVt+SX1Y9OlDl/V8efRC0YXFHy+caeMYsmz5ixO92+vT2Ov9VmF
 HnpmrqhO8MgKNDJUV5wVDiE4WYiiBwrj3SvmemuAw5JMhj5J5Kd1B9pxehg57pnet9e3l9
 jV05QrcYo1EiccPQY81EQJCAnbypxRM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-3edBGwhNOlOuiV2_4TFU9A-1; Tue, 28 Nov 2023 11:00:13 -0500
X-MC-Unique: 3edBGwhNOlOuiV2_4TFU9A-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a00c4043a41so448036666b.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Nov 2023 08:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701187212; x=1701792012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RzhdmniUAulYKiMWHmvNUF6uT6F1wxvW3o6/RqMDVpk=;
 b=NksoQoHWB2kvoEdK1CzbEG4HYDtXsDH44/A0ASXPIXFfReqwIDq9O9565LH89JX5qh
 TbCQruLWYyj291paJg8lXKBzcfyJEFJjxCa/86NeZ1tuQvlM0w0tDkUbteffvbATQ7iS
 h0fe0plqwn9M3lIBdGic3wR0aVP2r2Yd/m6pApsNi1EWqugSqkQWg/vY/PR1FKHokwtP
 +ex9ebT37S9SUKAzSwrY8Lh1d6xNqgfWBrKUwezMw1ZNlk7gVUQPtTofqLekrT9G+sZV
 tcUvPw7et4xjPlY+2IqJrUDJXqBrBWniGeSqm+SGy1MmZCWLNjC4ShzzEmc2qPxQRe9L
 viDQ==
X-Gm-Message-State: AOJu0Yz9sJBcmvAH1/6hxTYnFflqq1bEWIBqLLw1eog48sbddVy0VR+z
 TtsTI/b7whL1s15sHpARQCQcIaxJum8Vw5NeQz2QHbguYG7HiZv5bgrXDLFBBGPoCWs+MGnXKQl
 qfpg0Jzh52lbjuVI=
X-Received: by 2002:a17:906:3f92:b0:9e0:4910:166a with SMTP id
 b18-20020a1709063f9200b009e04910166amr9384384ejj.32.1701187211646; 
 Tue, 28 Nov 2023 08:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDbJJRtzsiMfzgvGTs1rLYtMFSHCjGQQ+JFPrfDBXIi1L1A8yW5WufI1s6kIThP+KlWkFOdQ==
X-Received: by 2002:a17:906:3f92:b0:9e0:4910:166a with SMTP id
 b18-20020a1709063f9200b009e04910166amr9384338ejj.32.1701187211208; 
 Tue, 28 Nov 2023 08:00:11 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 j10-20020a170906050a00b009fc54390966sm6997635eja.145.2023.11.28.08.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 08:00:10 -0800 (PST)
Date: Tue, 28 Nov 2023 17:00:08 +0100
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
Subject: Re: [RFC PATCH 04/22] exec/cpu: Never call cpu_reset() before
 cpu_realize()
Message-ID: <20231128170008.57ddb03e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230918160257.30127-5-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
 <20230918160257.30127-5-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 18 Sep 2023 18:02:37 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> QDev instance is expected to be in an unknown state until full
> object realization. Thus we shouldn't call DeviceReset() on an
> unrealized instance. Move the cpu_reset() call from *before*
> the parent realize() handler (effectively cpu_common_realizefn)
> to *after* it.

looking at:
=20
 --cpu_reset()  <- brings cpu to known (after reset|poweron) state
   cpu_common_realizefn()
       if (dev->hotplugged) {                                              =
        =20
           cpu_synchronize_post_init(cpu);                                 =
        =20
           cpu_resume(cpu);                                                =
        =20
       }
 ++cpu_reset()  <-- looks to be too late, we already told hypervisor to run=
 undefined CPU, didn't we?



>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> RFC:
> I haven't audited all the call sites, but plan to do it,
> amending the result to this patch description. This used
> to be a problem on some targets, but as of today's master
> this series pass make check-{qtest,avocado}.
> ---
>  target/arm/cpu.c       | 2 +-
>  target/avr/cpu.c       | 2 +-
>  target/cris/cpu.c      | 2 +-
>  target/hexagon/cpu.c   | 3 +--
>  target/i386/cpu.c      | 2 +-
>  target/loongarch/cpu.c | 2 +-
>  target/m68k/cpu.c      | 2 +-
>  target/mips/cpu.c      | 2 +-
>  target/nios2/cpu.c     | 2 +-
>  target/openrisc/cpu.c  | 2 +-
>  target/riscv/cpu.c     | 2 +-
>  target/rx/cpu.c        | 2 +-
>  target/s390x/cpu.c     | 2 +-
>  target/sh4/cpu.c       | 2 +-
>  target/tricore/cpu.c   | 2 +-
>  15 files changed, 15 insertions(+), 16 deletions(-)
>=20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b9e09a702d..6aca036b85 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2278,9 +2278,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>      }
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      acc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 8f741f258c..84d353f30e 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -120,9 +120,9 @@ static void avr_cpu_realizefn(DeviceState *dev, Error=
 **errp)
>          return;
>      }
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void avr_cpu_set_int(void *opaque, int irq, int level)
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index a6a93c2359..079872a5cc 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -152,10 +152,10 @@ static void cris_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>          return;
>      }
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      ccc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index f155936289..7edc32701f 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -346,9 +346,8 @@ static void hexagon_cpu_realize(DeviceState *dev, Err=
or **errp)
>                               "hexagon-hvx.xml", 0);
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> -
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void hexagon_cpu_init(Object *obj)
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index a23d4795e0..7faaa6915f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7455,9 +7455,9 @@ static void x86_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>          }
>      }
>  #endif /* !CONFIG_USER_ONLY */
> -    cpu_reset(cs);
> =20
>      xcc->parent_realize(dev, &local_err);
> +    cpu_reset(cs);
> =20
>  out:
>      if (local_err !=3D NULL) {
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 65f9320e34..8029e70e76 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -565,10 +565,10 @@ static void loongarch_cpu_realizefn(DeviceState *de=
v, Error **errp)
> =20
>      loongarch_cpu_register_gdb_regs_for_features(cs);
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      lacc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 70d58471dc..2bc0a62f0e 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -321,10 +321,10 @@ static void m68k_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
> =20
>      m68k_cpu_init_gdb(cpu);
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void m68k_cpu_initfn(Object *obj)
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 63da1948fd..8d6f633f72 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -492,10 +492,10 @@ static void mips_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>      fpu_init(env, env->cpu_model);
>      mvp_init(env);
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void mips_cpu_initfn(Object *obj)
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index bc5cbf81c2..876a6dcad2 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -217,12 +217,12 @@ static void nios2_cpu_realizefn(DeviceState *dev, E=
rror **errp)
> =20
>      realize_cr_status(cs);
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      /* We have reserved storage for cpuid; might as well use it. */
>      cpu->env.ctrl[CR_CPUID] =3D cs->cpu_index;
> =20
>      ncc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 61d748cfdc..cd25f1e9d5 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -142,9 +142,9 @@ static void openrisc_cpu_realizefn(DeviceState *dev, =
Error **errp)
>      }
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      occ->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void openrisc_cpu_initfn(Object *obj)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f227c7664e..7566757346 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1532,9 +1532,9 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>  #endif
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      mcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 157e57da0f..c9c8443cbd 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -138,9 +138,9 @@ static void rx_cpu_realize(DeviceState *dev, Error **=
errp)
>      }
> =20
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
> =20
>      rcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void rx_cpu_set_irq(void *opaque, int no, int request)
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index df167493c3..0f0b11fd73 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -254,6 +254,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>      s390_cpu_gdb_init(cs);
>      qemu_init_vcpu(cs);
> =20
> +    scc->parent_realize(dev, &err);
>      /*
>       * KVM requires the initial CPU reset ioctl to be executed on the ta=
rget
>       * CPU thread. CPU hotplug under single-threaded TCG will not work w=
ith
> @@ -266,7 +267,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>          cpu_reset(cs);
>      }
> =20
> -    scc->parent_realize(dev, &err);
>  out:
>      error_propagate(errp, err);
>  }
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 61769ffdfa..656d71f74a 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -228,10 +228,10 @@ static void superh_cpu_realizefn(DeviceState *dev, =
Error **errp)
>          return;
>      }
> =20
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      scc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
>  static void superh_cpu_initfn(Object *obj)
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 133a9ac70e..a3610aecca 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -118,10 +118,10 @@ static void tricore_cpu_realizefn(DeviceState *dev,=
 Error **errp)
>      if (tricore_has_feature(env, TRICORE_FEATURE_131)) {
>          set_feature(env, TRICORE_FEATURE_13);
>      }
> -    cpu_reset(cs);
>      qemu_init_vcpu(cs);
> =20
>      tcc->parent_realize(dev, errp);
> +    cpu_reset(cs);
>  }
> =20
> =20


