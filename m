Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pP9sk-0005nE-0o
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 17:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pP9sa-0005mh-QI; Mon, 06 Feb 2023 17:22:36 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pP9sZ-0001xM-7B; Mon, 06 Feb 2023 17:22:28 -0500
Received: by mail-vs1-xe32.google.com with SMTP id h19so14297263vsv.13;
 Mon, 06 Feb 2023 14:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fMvLw9gNyTB5YHetS0rIKUofMph/2S/gtp1Wzrzon8Q=;
 b=Nf+WsGBxi+C/StQKGN7qxVCRcOHyfimMr96M3R1adYef+cyID1zzTj49AYcjrFNtuw
 3t17LPkgisDVTtDEIVaLs6uP5a6butwGGVnLBDF6CdYFVLU502BMyFDdVYH+qW0ctuVE
 B2GjFYJJJHQAJyXYynMTAur3lqAwGt+UA6SRTDxhRPnchtVMJX7dhYp+f0/6zA8uf4vD
 4WdqKwNly5JiX9Z+VauD7YfdqpWE9li33SCriUZB5o6J7EujDr0GA462cGpz5dnmcbHO
 Rzfwp/8cio2SLtvskJasKuaAu7NGd+gLwtQBfY33fomfHaZHClv6jw1BC0oQigmhTrxq
 ZnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fMvLw9gNyTB5YHetS0rIKUofMph/2S/gtp1Wzrzon8Q=;
 b=F+aoaRnhETs/au/GjNZIn8Icgz2EVvdnqK92yB6RO1Cq2u3qT6y3RrbB3fgq3Nd7D/
 uT+Cplgn4M1Ppi9N/eJtYrwGSZnPXkFJ1uGBhZwd9wsuwKikEkDPnJbffXIpDhXmwaZI
 MCbKoWHxRCXPF1FCKiB6NZPRyV64QT7tgBZ5zMQHdxft0P5fS1ZIs5udraegcr7KLatn
 Oc2wdYeLLxSemz/RsJ3GXiVIMuge6b1MxQOW/pywN9dYeTJNhp6AL/YDxnogoEaU5WXj
 s2EP+8zikUsBDgMNYsbPj9s23XQwZCaFySjPHYLucLBdS2Xth/HOHZBC55QdgFgBllJs
 9lpg==
X-Gm-Message-State: AO0yUKU6tIpGgRrhTH8owzCnor01wIkkbw+Do3ibF2hzoaUK9V/HvqYn
 rSM9Epop+fIFOgXGBRbMRK1p5ebt/eBE53kc52D9MwsGagI=
X-Google-Smtp-Source: AK7set84G70i6Te/VrKJN5mHg2akXS4oh24ZFAKBVngUVWnD4G8lDetBKaG8yLYLptddMm4TktmBviqAPTKdfo0NXx4=
X-Received: by 2002:a67:e11e:0:b0:3f9:3f38:ca46 with SMTP id
 d30-20020a67e11e000000b003f93f38ca46mr273431vsl.73.1675722143994; Mon, 06 Feb
 2023 14:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20230206085007.3618715-1-bmeng@tinylab.org>
In-Reply-To: <20230206085007.3618715-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Feb 2023 08:21:57 +1000
Message-ID: <CAKmqyKPkPJb+HtaefnMuxfTRa7R93O0wU-83LFUmspn=A5HFNA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Simplify virt_{get,set}_aclint()
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 06 Feb 2023 22:22:37 -0000

On Mon, Feb 6, 2023 at 6:51 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> There is no need to declare an intermediate "MachineState *ms".
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/virt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a11b4b010..bdb6b93115 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1577,16 +1577,14 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
>
>  static bool virt_get_aclint(Object *obj, Error **errp)
>  {
> -    MachineState *ms = MACHINE(obj);
> -    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
>
>      return s->have_aclint;
>  }
>
>  static void virt_set_aclint(Object *obj, bool value, Error **errp)
>  {
> -    MachineState *ms = MACHINE(obj);
> -    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
>
>      s->have_aclint = value;
>  }
> --
> 2.25.1
>
>

