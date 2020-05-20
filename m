Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbXpe-0000fy-Po
	for mharc-qemu-riscv@gnu.org; Wed, 20 May 2020 19:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1jbXpd-0000fD-4X
 for qemu-riscv@nongnu.org; Wed, 20 May 2020 19:09:01 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:55563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1jbXpb-00019e-Te
 for qemu-riscv@nongnu.org; Wed, 20 May 2020 19:09:00 -0400
Received: by mail-pj1-x1044.google.com with SMTP id k7so2031193pjs.5
 for <qemu-riscv@nongnu.org>; Wed, 20 May 2020 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=wnGc4bt7aIHsiLHFRQ+JGJANNW/8Vj0o0EBAtJLTYN8=;
 b=bgIySXLeCDzFQV3EDnZn0VMwoAYuCxMH033dxUF6cJB6luss/BihUFSj+VMTnt6Pam
 rNWbNBzOBu6gaAImDrkyID/Q1p8VNKuTOPh8b8i0lko5bN64y2x+K/TTbGt9QWedzetO
 IFhFzsrBbY7aN/p1O62P57yL0BGWvP8xh4PCwuvhHBqiBgJjj9W/VmFDpsw26MhwccFM
 6tutS520bieNXPqGUwAZ+yzwx3M8i4G+N3Oz6yNnSnB+3hNHM2EBfza2TcRrzYNxb7ze
 RUg8y1T1ws3iY1PJw1ksOyBkrzZlLCc7E1XWCyeTHD8rGafe9z2CWR/8aMM9WGaOLMFo
 cmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=wnGc4bt7aIHsiLHFRQ+JGJANNW/8Vj0o0EBAtJLTYN8=;
 b=J283iWM9c6fekNFg/bY7JkiLv09k7YGzuC+QfQdzWNXR60kdKn7I92YicG8qhb6186
 Rd0pOK1mTiok20D31uECgB/G/t0ZC/CzaqVT06tgqcV3+l4nYj7hIDTFRnL+e61b5HSF
 c8XJE26aC08Ey2C/uhed4t+18CXSVBs9iMuC16ieQM8zrjaB5LO18kdM4CYXaXCcin/J
 HUdVU/WWuCxjKIYPOsT7jrxOetk6OyeHJboSDRqypQgHMhJ2FGZNTkEJ3pSP9ebkGKL+
 2JLccj2QfYRyTdc68lijG7xhdotAXrb1st5mP1yrn44xvIV0IXaEIyqeS3WVdmsOe8aX
 toFw==
X-Gm-Message-State: AOAM532znir7XY70afh7HfrrUZPnjVUlf4canA/4EMoJpCE63lCuxhhA
 a/jHgHzG42I6lhJJrjEO0ubTFA==
X-Google-Smtp-Source: ABdhPJy1ImvA9wKwwUoTL+0Km4oEm+KNZjAkVNX7vGHAtBE83pmEt2RhovgBj71dkbvv5ctczAU7Ng==
X-Received: by 2002:a17:90a:4802:: with SMTP id
 a2mr8214221pjh.66.1590016137681; 
 Wed, 20 May 2020 16:08:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 7sm2954921pfc.203.2020.05.20.16.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 16:08:56 -0700 (PDT)
Date: Wed, 20 May 2020 16:08:56 -0700 (PDT)
X-Google-Original-Date: Wed, 20 May 2020 16:04:10 PDT (-0700)
Subject: Re: [PATCH v1 1/2] riscv: sifive_e: Manually define the machine
In-Reply-To: <da77b1e0a31f2f8fb18117b20a1493ab1ec0471f.1589489213.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-ca9ba779-53fd-4eae-b04b-e6c921d8333f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 May 2020 23:09:01 -0000

On Thu, 14 May 2020 13:47:07 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_e.c         | 41 +++++++++++++++++++++++++++----------
>  include/hw/riscv/sifive_e.h |  4 ++++
>  2 files changed, 34 insertions(+), 11 deletions(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index b53109521e..472a98970b 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -79,7 +79,7 @@ static void riscv_sifive_e_init(MachineState *machine)
>  {
>      const struct MemmapEntry *memmap = sifive_e_memmap;
>
> -    SiFiveEState *s = g_new0(SiFiveEState, 1);
> +    SiFiveEState *s = RISCV_E_MACHINE(machine);
>      MemoryRegion *sys_mem = get_system_memory();
>      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      int i;
> @@ -115,6 +115,35 @@ static void riscv_sifive_e_init(MachineState *machine)
>      }
>  }
>
> +static void sifive_e_machine_instance_init(Object *obj)
> +{
> +}
> +
> +static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "RISC-V Board compatible with SiFive E SDK";
> +    mc->init = riscv_sifive_e_init;
> +    mc->max_cpus = 1;
> +    mc->default_cpu_type = SIFIVE_E_CPU;
> +}
> +
> +static const TypeInfo sifive_e_machine_typeinfo = {
> +    .name       = MACHINE_TYPE_NAME("sifive_e"),
> +    .parent     = TYPE_MACHINE,
> +    .class_init = sifive_e_machine_class_init,
> +    .instance_init = sifive_e_machine_instance_init,
> +    .instance_size = sizeof(SiFiveEState),
> +};
> +
> +static void sifive_e_machine_init_register_types(void)
> +{
> +    type_register_static(&sifive_e_machine_typeinfo);
> +}
> +
> +type_init(sifive_e_machine_init_register_types)
> +
>  static void riscv_sifive_e_soc_init(Object *obj)
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> @@ -214,16 +243,6 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>          &s->xip_mem);
>  }
>
> -static void riscv_sifive_e_machine_init(MachineClass *mc)
> -{
> -    mc->desc = "RISC-V Board compatible with SiFive E SDK";
> -    mc->init = riscv_sifive_e_init;
> -    mc->max_cpus = 1;
> -    mc->default_cpu_type = SIFIVE_E_CPU;
> -}
> -
> -DEFINE_MACHINE("sifive_e", riscv_sifive_e_machine_init)
> -
>  static void riscv_sifive_e_soc_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 25ce7aa9d5..414992119e 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -47,6 +47,10 @@ typedef struct SiFiveEState {
>      SiFiveESoCState soc;
>  } SiFiveEState;
>
> +#define TYPE_RISCV_E_MACHINE MACHINE_TYPE_NAME("sifive_e")
> +#define RISCV_E_MACHINE(obj) \
> +    OBJECT_CHECK(SiFiveEState, (obj), TYPE_RISCV_E_MACHINE)
> +
>  enum {
>      SIFIVE_E_DEBUG,
>      SIFIVE_E_MROM,

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

