Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0XJ4-0001i1-6m
	for mharc-qemu-riscv@gnu.org; Fri, 15 Jan 2021 17:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XIv-0001f0-7Q; Fri, 15 Jan 2021 17:10:54 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:43073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XIq-0000qH-Rl; Fri, 15 Jan 2021 17:10:48 -0500
Received: by mail-io1-xd2f.google.com with SMTP id x21so2882529iog.10;
 Fri, 15 Jan 2021 14:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYZpsgnhclGWg/H3qE1wMCxFW6zBSxrXc7vaRA3rIRA=;
 b=LMPN6rbKreVwd3E/DjrveRZDBQWEZstVul3GCHtnGyDg+TvHXuuTOqSga9LGC/TmEa
 fqy8ioUO2vwxty6YG01MtzztfNz4n3n68vvjT4b5YdhtiufjYJYyR0SrtznauW6coP2R
 XQ36gHLmb/xNrjQLa0BTwXAYeCnbzyDwfH8ak48FhSSIp16VWEd5EyynKLB0wrLMWKLX
 wj5RHZp20XFa41yWk2B5wv8yma/68xo0v/Nm8kE2pW2FOW6MXsd+N1X/MDVfl14v8r4K
 waN1hpMdjrW6MWZDg8Pet4lVbAC9URepjgE25K2jJdPsvzB4D5fyclFSoUY+/yfNRUPC
 kr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYZpsgnhclGWg/H3qE1wMCxFW6zBSxrXc7vaRA3rIRA=;
 b=ssOTaGeTcU/sVCnpOaKA3zHBynFkQK9qhPV+FRKm00xzDZYfTbdLuXjUP3Q2NsbyOh
 z0a20WkJtgpusUnr7D58n99Fx+I21wCBq0APm6ZoiKhhrB5JGt/QjTIhQQrRTSJG3Bsr
 w6GysDQgu/QPmaya5jhlY4EdYZ8QtdzG3VXcaFQ+gOOvahqoQwO4R0bpApt0XOKyYqqu
 9G6ET83RfU5T/34WE6zsitGwBIJzFry7UKDx8Xbw+zzN+yWjHJkvqj1O/qNARmW5u0W/
 iILr5DB9Vo0Wz6ye3yTAx4cxtJcjdNxZ3qS/vgWofWbuqz8ImPYXCuxAz7thHARJa7lX
 clcA==
X-Gm-Message-State: AOAM531s4Z8UQTjD8muk2Ikqnb9zVwcgnZHFY3tLoTykvoI3xEymVP0j
 drd3P2eKEGyhrZpSYYKBUXFb41scOUV7WtvxiPs=
X-Google-Smtp-Source: ABdhPJwQjm/VLcraZS5gedCc+b0Ekb6Iujn5aOrgJzUWRW2eshjbZlZBDX8eaLzsxzG8mBMvasvg064iCiWCTtyjJSs=
X-Received: by 2002:a5e:850b:: with SMTP id i11mr10012671ioj.42.1610748643587; 
 Fri, 15 Jan 2021 14:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <20210110185109.29841-7-space.monkey.delivers@gmail.com>
In-Reply-To: <20210110185109.29841-7-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 14:10:17 -0800
Message-ID: <CAKmqyKPw3e376VUoxhUmm6eZK5t6iNmmKGZbUA6iGv8U6=7=KQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] [RISCV_PM] Allow experimental J-ext to be turned on
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, kupokupokupopo@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Fri, 15 Jan 2021 22:10:54 -0000

On Sun, Jan 10, 2021 at 11:00 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 19398977d3..234401c3c6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -499,6 +499,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>          if (cpu->cfg.ext_j) {
>              env->mmte |= PM_EXT_INITIAL;
> +            target_misa |= RVJ;
>          }
>          if (cpu->cfg.ext_v) {
>              target_misa |= RVV;
> @@ -571,6 +572,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      /* This is experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
> +    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> --
> 2.20.1
>
>

