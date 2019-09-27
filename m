Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDmGN-0007Ze-67
	for mharc-qemu-riscv@gnu.org; Fri, 27 Sep 2019 05:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDmGJ-0007Ue-8k
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 05:10:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDmGI-0002Ya-4m
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 05:10:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25923
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iDmGH-0002Xl-W6
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 05:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569575401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=P9psUB6/KiwaS9H3i7HotZch7N5x0EpQX8KuIQgs6HY=;
 b=fvHnvUWqVwmI3pwYQoiYN+oQG1lpQ/KOioIICQBubseZY5nVOMDpEpXmoIYsmF/PZ95fOx
 91a6VzdgSH7xzgaRLLFfZkw8ahJDj0xeZ42Rj/BrvHkJDcrz+frAoVqy19ShUGeBgbGIZK
 xOjX2ytfijEmEEX0mzcowQE6BzMBel8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-xAeSIZ5vP8GIi2XPw3WB8Q-1; Fri, 27 Sep 2019 05:09:59 -0400
Received: by mail-wm1-f70.google.com with SMTP id k184so2482981wmk.1
 for <qemu-riscv@nongnu.org>; Fri, 27 Sep 2019 02:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nlNeTP7NbLjKSuFudQImRwe8GPXTrHcfQIxAIjyT0I0=;
 b=WbnfFMhu78j6p8aAt9S2BN8jefaRZjPn5owcy+BFTazfMA9uMnTaLfuZNGnX2iqp4d
 4HRTrVgSfknydFsKVNV5EW7Tz62hFs1AN49D2eZ0jV6NvjaXqXcRKStJA7SdlTZbfvAL
 t34bo74mIne0pQ8i1NPmaMuzhgYeAdnupdQXdKQL0+gD2RVspuwhcFH5EU8G4JdYx415
 tLoqYSuZux+o2qtRfngs0JkmGB3qiYExDa2OXMuzoIudjpiy3Hh49odEII4/bgraH2mE
 Yo6sLzIbJVkRu7wbjFcd4ybP9DwhmILTvtei9jzEgcBgk/E2593Rt6iLUlj4wK+0jFMA
 UKpg==
X-Gm-Message-State: APjAAAVGDTLzVl83WHiTtqx/IHhznMkAuQomjN/tSLWbSgeWwxJsOiKE
 TKOL/ShkCurrWpgKbZkJrmwchkZr57n1G0Ytcp9DA4OUYd//LztrTGaolr3sc6ge+9YKD4yHkqX
 wT8GZOBSQuzTmGFE=
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr5816495wmh.134.1569575398623; 
 Fri, 27 Sep 2019 02:09:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxf0TOaXmlFkKoUgI2m5CkYyzKOgy48FTz49Sv3XC4NTR/F+DQOrN/vZQWUpX4ZXjXjRTmtAQ==
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr5816486wmh.134.1569575398455; 
 Fri, 27 Sep 2019 02:09:58 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id n8sm9425071wma.7.2019.09.27.02.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2019 02:09:57 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] target/riscv: Print CPU and privledge in disas
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair23@gmail.com, palmer@sifive.com
References: <ab8f108eceb973aaee565bb1fe347fcf8c788f5b.1569545120.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7ffed750-767a-40be-4ef1-d52aad93f2e5@redhat.com>
Date: Fri, 27 Sep 2019 11:09:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ab8f108eceb973aaee565bb1fe347fcf8c788f5b.1569545120.git.alistair.francis@wdc.com>
Content-Language: en-US
X-MC-Unique: xAeSIZ5vP8GIi2XPw3WB8Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 27 Sep 2019 09:10:05 -0000

On 9/27/19 2:45 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index adeddb85f6..537af0003e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -810,7 +810,14 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbas=
e, CPUState *cpu)
> =20
>  static void riscv_tr_disas_log(const DisasContextBase *dcbase, CPUState =
*cpu)
>  {
> +#ifndef CONFIG_USER_ONLY
> +    RISCVCPU *rvcpu =3D RISCV_CPU(cpu);
> +    CPURISCVState *env =3D &rvcpu->env;
> +#endif
>      qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
> +#ifndef CONFIG_USER_ONLY
> +    qemu_log("CPU: %d; priv: "TARGET_FMT_ld"\n", cpu->cpu_index, env->pr=
iv);
> +#endif

Nit: can be extracted as another function to reduce the ifdef'ry and
simply use:

       log_cpu_priv(cpu);

>      log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
>  }
> =20

With function previously defined:

static void log_cpu_priv(const CPUState *cpu)
{
#ifndef CONFIG_USER_ONLY
    RISCVCPU *rvcpu =3D RISCV_CPU(cpu);
    CPURISCVState *env =3D &rvcpu->env;

    qemu_log("CPU: %d; priv: "TARGET_FMT_ld"\n", cpu->cpu_index, env->priv)=
;
#endif
}

Anyway, fixing the typo in the patch subject:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


