Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBb7Q-0004Lv-JF
	for mharc-qemu-riscv@gnu.org; Sat, 21 Sep 2019 04:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iBb7L-0004Kk-RB
 for qemu-riscv@nongnu.org; Sat, 21 Sep 2019 04:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iBb7K-0007B2-HT
 for qemu-riscv@nongnu.org; Sat, 21 Sep 2019 04:51:47 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33735
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iBb7K-0007AF-EI
 for qemu-riscv@nongnu.org; Sat, 21 Sep 2019 04:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569055903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=2oHym0paq8wP1jirp7Hrewxbwo5cVbOzSMQIUtAA36Y=;
 b=BkRrS1W9/aAO38DHIAZ2WpDkclb+UttTc3LWZ5QVSyIdt4mFBbpfUucw1JqOFFB5X6EFsK
 qYfHcEC4F9JgbYmHt1Dv2vDIez9dkppjAPxonJvmykVVeScCDXX2n0phI+pnYxBwLa5Vrw
 KJpRJKrN2HlorOx33AuisjqxCgAjyFA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-CNx7H_NpPbm4uAw44_PGYQ-1; Sat, 21 Sep 2019 04:51:01 -0400
Received: by mail-wr1-f71.google.com with SMTP id q10so3225631wro.22
 for <qemu-riscv@nongnu.org>; Sat, 21 Sep 2019 01:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=skQ7lqTj2M93LArXM51p4hqq79iwLM5vlU0SZmgZKEU=;
 b=bnozVM4lrxpCOo/c7tgdgXuhxyqSn+4i1b9gDEsO6BNTGNs7zYJT/rXq0SoCux5ubx
 AsI4vqYCSxS4BS2cb1DETu3By+Qre73IFLyqoew0RGkTtsHxnn1mpU1iL6pbSRy/VYKu
 0M21auKEjn+0vO8ow9tpweYB98lBqdkVka41Ae2exVjAHTD14djse2+NLUONe/UsjCtl
 +NnTfRZQe+pzADP8u1Wori5DgrTjYam+3pCm/JVzIEWuT04F0BBaeovhYQ7EiYkLULMN
 ZWVLxRnWg1GANGgDkyl2oufIaWazvVUiT2gi77x+nfRBTIkhPyzIJyyisHnW2NEdiQ0P
 JSGg==
X-Gm-Message-State: APjAAAVX0NMCiqgMmuBFYO+U8RWG2Zc4WdErrhYwAm72Rxa7egepmTQ2
 ffmxKgwS4+xoD4V6odq0PLtwXpxxy1bFKgfQxZkU6wIz3P0BcZK/7e2hh8IX4Y0MjhA5MNzD+BW
 eeG3vlcWDc/N3/ww=
X-Received: by 2002:a05:600c:141:: with SMTP id
 w1mr6450915wmm.75.1569055860270; 
 Sat, 21 Sep 2019 01:51:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+51KAPnI0N8sCwolj8W9FMCRvhmguBm28fkYY+UGjKZWeabPcy5AqXEnU2SxNEHFSsJ3pqA==
X-Received: by 2002:a05:600c:141:: with SMTP id
 w1mr6450900wmm.75.1569055860074; 
 Sat, 21 Sep 2019 01:51:00 -0700 (PDT)
Received: from [192.168.1.40] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id w12sm6374656wrg.47.2019.09.21.01.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Sep 2019 01:50:59 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] riscv: hw: Drop "clock-frequency" property of cpu
 nodes
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <1569044491-7875-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fad9668d-14e8-40c1-2c02-9a6197e88397@redhat.com>
Date: Sat, 21 Sep 2019 10:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1569044491-7875-1-git-send-email-bmeng.cn@gmail.com>
Content-Language: en-US
X-MC-Unique: CNx7H_NpPbm4uAw44_PGYQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Sat, 21 Sep 2019 08:51:50 -0000

Hi Bin,

On 9/21/19 7:41 AM, Bin Meng wrote:
> The "clock-frequency" property of cpu nodes isn't required. Drop it.
>=20
> This is to keep in sync with Linux kernel commit below:
> https://patchwork.kernel.org/patch/11133031/

What happens if you run a older kernel that doesn't contain the
referenced patch?

> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>=20
> ---
>=20
> Changes in v2:
> - drop the one in spike and virt machines too
>=20
>  hw/riscv/sifive_u.c         | 2 --
>  hw/riscv/spike.c            | 2 --
>  hw/riscv/virt.c             | 2 --
>  include/hw/riscv/sifive_u.h | 1 -
>  include/hw/riscv/spike.h    | 4 ----
>  include/hw/riscv/virt.h     | 4 ----
>  6 files changed, 15 deletions(-)
>=20
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 9f8e84b..02dd761 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -151,8 +151,6 @@ static void create_fdt(SiFiveUState *s, const struct =
MemmapEntry *memmap,
>          char *intc =3D g_strdup_printf("/cpus/cpu@%d/interrupt-controlle=
r", cpu);
>          char *isa;
>          qemu_fdt_add_subnode(fdt, nodename);
> -        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
> -                              SIFIVE_U_CLOCK_FREQ);
>          /* cpu 0 is the management hart that does not have mmu */
>          if (cpu !=3D 0) {
>              qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv=
48");
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index d60415d..8bbffbc 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -102,8 +102,6 @@ static void create_fdt(SpikeState *s, const struct Me=
mmapEntry *memmap,
>          char *intc =3D g_strdup_printf("/cpus/cpu@%d/interrupt-controlle=
r", cpu);
>          char *isa =3D riscv_isa_string(&s->soc.harts[cpu]);
>          qemu_fdt_add_subnode(fdt, nodename);
> -        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
> -                              SPIKE_CLOCK_FREQ);
>          qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48")=
;
>          qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
>          qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d36f562..1303061 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -161,8 +161,6 @@ static void create_fdt(RISCVVirtState *s, const struc=
t MemmapEntry *memmap,
>          char *intc =3D g_strdup_printf("/cpus/cpu@%d/interrupt-controlle=
r", cpu);
>          char *isa =3D riscv_isa_string(&s->soc.harts[cpu]);
>          qemu_fdt_add_subnode(fdt, nodename);
> -        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
> -                              VIRT_CLOCK_FREQ);
>          qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48")=
;
>          qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
>          qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index e4df298..4850805 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -75,7 +75,6 @@ enum {
>  };
> =20
>  enum {
> -    SIFIVE_U_CLOCK_FREQ =3D 1000000000,
>      SIFIVE_U_HFCLK_FREQ =3D 33333333,
>      SIFIVE_U_RTCCLK_FREQ =3D 1000000
>  };
> diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
> index 03d8703..dc77042 100644
> --- a/include/hw/riscv/spike.h
> +++ b/include/hw/riscv/spike.h
> @@ -38,10 +38,6 @@ enum {
>      SPIKE_DRAM
>  };
> =20
> -enum {
> -    SPIKE_CLOCK_FREQ =3D 1000000000
> -};
> -
>  #if defined(TARGET_RISCV32)
>  #define SPIKE_V1_09_1_CPU TYPE_RISCV_CPU_RV32GCSU_V1_09_1
>  #define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_RV32GCSU_V1_10_0
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 6e5fbe5..68978a1 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -55,10 +55,6 @@ enum {
>      VIRTIO_NDEV =3D 0x35 /* Arbitrary maximum number of interrupts */
>  };
> =20
> -enum {
> -    VIRT_CLOCK_FREQ =3D 1000000000
> -};
> -
>  #define VIRT_PLIC_HART_CONFIG "MS"
>  #define VIRT_PLIC_NUM_SOURCES 127
>  #define VIRT_PLIC_NUM_PRIORITIES 7
>=20


