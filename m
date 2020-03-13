Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCqGW-0003GC-3L
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 15:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCqGS-0003E2-R5
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 15:46:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCqGR-00008e-39
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 15:46:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32500
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCqGM-0008PM-Mj
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 15:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584128787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0R6X75U1+OlOhIDM5LzvT6OoaPX0jm2JFjycdhhaMWM=;
 b=huccODwad1VWZlBP69x88DE2kLKmo0575ydKeYAfUqFHmGNdkzm54jXs0SoyxltKFJHy1g
 WKKDm+whiT/E0ECG7CXJWB5IEkiWIwkYSoBf6QxIYyWtM5IWZEs7/el5+y1X/q879vI4Sv
 2VBZ4OwY6jJ03tWkpOZ2zqUTx67it6M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-wMar_t07P2G1G0SQJDafgA-1; Fri, 13 Mar 2020 15:46:25 -0400
X-MC-Unique: wMar_t07P2G1G0SQJDafgA-1
Received: by mail-wr1-f69.google.com with SMTP id z13so4781465wrv.7
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 12:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8a2mzdwiB2izLq1rv8l5jafNNOJtSncxdp+E2nYw2jc=;
 b=AQgO0o+kumY9yomVMVlzjtr2lEyYeQm4jomIiiZ6nyVhTzq5GjBuMb5bQpQuHKR1h1
 myhIpPUWfHOMZ5Ky9qc7KIsglKcOT3tf8N6Ww11NrFK0G7B/U91/08Ii0hz+uYVeHIKo
 20WaHeTshE0Pm1tra8ra3zeOk4ydQag554B6L0SP1nXWxiWtfxjuOar+OnRjIzxxFHNr
 my9sKxus7uc1IRNaPDMK5/ALbEIM2PREN+kXeCVm3w8HzbLyH2zFVgPQP/gX2iBCERKZ
 cmNkLf6tqFPxFl7NwQbxD+xrPuccxCcnyENM3bcFCN4hslkl3OmZqjlKBeqn0YfDoSLF
 0s4Q==
X-Gm-Message-State: ANhLgQ1VQuSrGmdfUxV6yradcC/5NA/u2J4mPgtFSNJJhHARGbrB3Ss6
 hWq30mwQRtXBETdNtiFYBYEKFOWKkzKyFeoyUVVFGyucg+cAMhf7d43R9n72ry+ai4IeFRTtXxw
 77GDgbv9zDc6gFRo=
X-Received: by 2002:a05:600c:2942:: with SMTP id
 n2mr11963698wmd.87.1584128784302; 
 Fri, 13 Mar 2020 12:46:24 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv0cwepPAp6+5lJ8zRczNb9/1ZZR74e/XUBzcO3ykmqn1iPcX4go3pqt8aoUuG4BrzHOc6dSg==
X-Received: by 2002:a05:600c:2942:: with SMTP id
 n2mr11963675wmd.87.1584128783984; 
 Fri, 13 Mar 2020 12:46:23 -0700 (PDT)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id z19sm18800884wma.41.2020.03.13.12.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 12:46:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] riscv: sifive_e: Support changing CPU type
To: Corey Wharton <coreyw7@fb.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20200313193429.8035-1-coreyw7@fb.com>
 <20200313193429.8035-2-coreyw7@fb.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <32d16db5-1482-f080-3ead-05b5fa772d01@redhat.com>
Date: Fri, 13 Mar 2020 20:46:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313193429.8035-2-coreyw7@fb.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Fri, 13 Mar 2020 19:46:39 -0000

On 3/13/20 8:34 PM, Corey Wharton wrote:
> Allows the CPU to be changed from the default via the -cpu command
> line option.
>=20
> Signed-off-by: Corey Wharton <coreyw7@fb.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/riscv/sifive_e.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index a254cad489..b0a611adb9 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -123,7 +123,7 @@ static void riscv_sifive_e_soc_init(Object *obj)
>       object_initialize_child(obj, "cpus", &s->cpus,
>                               sizeof(s->cpus), TYPE_RISCV_HART_ARRAY,
>                               &error_abort, NULL);
> -    object_property_set_str(OBJECT(&s->cpus), SIFIVE_E_CPU, "cpu-type",
> +    object_property_set_str(OBJECT(&s->cpus), ms->cpu_type, "cpu-type",
>                               &error_abort);
>       object_property_set_int(OBJECT(&s->cpus), ms->smp.cpus, "num-harts"=
,
>                               &error_abort);
> @@ -220,6 +220,7 @@ static void riscv_sifive_e_machine_init(MachineClass =
*mc)
>       mc->desc =3D "RISC-V Board compatible with SiFive E SDK";
>       mc->init =3D riscv_sifive_e_init;
>       mc->max_cpus =3D 1;
> +    mc->default_cpu_type =3D SIFIVE_E_CPU;
>   }
>  =20
>   DEFINE_MACHINE("sifive_e", riscv_sifive_e_machine_init)
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


