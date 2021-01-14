Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l09Jz-0008LC-Hc
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 15:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l09Jx-0008L0-CS; Thu, 14 Jan 2021 15:34:18 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:33780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l09Js-0001fb-UU; Thu, 14 Jan 2021 15:34:17 -0500
Received: by mail-io1-xd2b.google.com with SMTP id w18so13943165iot.0;
 Thu, 14 Jan 2021 12:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dEyJDRiXSIVcdeGAUyJ60yDqRGmjDa0XJrqI75TgU/E=;
 b=ccZZT6qqMpIU7lxxJtUJ2uH+cWPYY6AzehVOSg4scCI8/XrxHA9lYxbDoyHRJvQJT9
 0j62cytQbtPmfjNm0BhClRssefMANvP3tq7LK6vnTCEp2ESKGUfU8QW7Edo266Ksg7EE
 TgeoqRfrx6hqZaWa0kV+ORT8643QjYZVW5wLplGV31DNQ5uOmsE+ZxLH4Qer7pjfOrmW
 HzCXRWB9k6q6f6m1mhq0qP3llP2RBsgTdMvM3qcGO4MbKRk6miJbnrZ0UAGi0Ng91m18
 gidxwV2ltY8hWpSdx0Bt7Wa5VXQDgusDTSB3sQdUQjabBJFayoO9UcaTyqHIHdKh87QT
 EJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dEyJDRiXSIVcdeGAUyJ60yDqRGmjDa0XJrqI75TgU/E=;
 b=hyztIRPO2G+nGueRO0UMqQGMDI/v99yUDZUiY4Wmn0cqgegppUH7Np8Yb1gkToFZ6F
 J5oZ80cGpxtuAThOYxQ9DsPGsJYDeDr+nYFHleQoTbJXg/Srbhx8hUvRCz89CJ8SoBWq
 v2/j/OrHkRZRV/0/oE+eUiu9tInnEgHE0I27QfOvE43Z7WCnvKC0BAD3g5vhfgZsP4BG
 dPFqg9o1xCKXQUGWta7P3Zi6t8uxGyskSyarHptvaQhOZ/0So6v5vTkw92WkGdzvI+E1
 EktF2sHvAiyzlz/fgeDOOjeRabpUKfOjr5yhPZ449jVcq/gYvH+haL6A6Mc03cHHJIiK
 NaDw==
X-Gm-Message-State: AOAM5338sPpI14UyDxpBT4oBhwbPUWzCoefR45IsYw5kGlJXWJ4BiY2Z
 F2dewVch5JvN+DCV3RW2TXyAxy3JG4BZ9Ai3GGQ=
X-Google-Smtp-Source: ABdhPJyZK45hM5iraiUsHxcGr6VnyHZ15zLHwGCEFBt5PGxf0B640j2lpi8vtEGYurh9HhyYpRy+o6ohHAkv6Xzrc8U=
X-Received: by 2002:a92:cb44:: with SMTP id f4mr8045831ilq.131.1610656449785; 
 Thu, 14 Jan 2021 12:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20210109143637.29645-1-bmeng.cn@gmail.com>
In-Reply-To: <20210109143637.29645-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Jan 2021 12:33:43 -0800
Message-ID: <CAKmqyKO51pFpEURFRiXf62yvq92XY0Th4-4GGw1KA90gbdgFHQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_u: Use SIFIVE_U_CPU for
 mc->default_cpu_type
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Thu, 14 Jan 2021 20:34:18 -0000

On Sat, Jan 9, 2021 at 6:37 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> SIFIVE_U_CPU is conditionally set to SIFIVE_U34 or SIFIVE_U54, hence
> there is no need to use #idef to set the mc->default_cpu_type.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index f5c400dd44..e083510e0e 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -628,11 +628,7 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = sifive_u_machine_init;
>      mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
>      mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> -#if defined(TARGET_RISCV32)
> -    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U34;
> -#elif defined(TARGET_RISCV64)
> -    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U54;
> -#endif
> +    mc->default_cpu_type = SIFIVE_U_CPU;
>      mc->default_cpus = mc->min_cpus;
>
>      object_class_property_add_bool(oc, "start-in-flash",
> --
> 2.25.1
>
>

