Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKyZ-0003BN-6L
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKyW-00039Q-QZ; Wed, 20 Oct 2021 19:26:25 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:36799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKyV-0005wK-Dm; Wed, 20 Oct 2021 19:26:24 -0400
Received: by mail-il1-x12f.google.com with SMTP id h10so23922683ilq.3;
 Wed, 20 Oct 2021 16:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uz3vmqgDyVv9BLiGwjHpzAwz4xaYJrWKJhBIDjf4gac=;
 b=QzaisiKpW0Z0dRlxez2OIAuoTM3iowkf3csg6lL1gxDC/odsnhpgwmidUm+rUfQ22X
 0CG2/86Ed7OhMwwruOft5KEYbIu8DVEIQFGjAaRyW3bRSF9EfEi55nx4dfe25+XFWy5X
 24npXdzFRVt1XFbM95AT7o8iMyotaE5oG9RdvqzxTVPYbSp6Y5T0VvrKRa48UEMfPbzG
 Whhke6sLWRITu5UQ/slkN+vzOKa+Uv2b5RaKDPdUQhEUTmHO74jYH13Pubjfxx397/zN
 YJC7bCfHrmJmrernYhI7iXNxrARc7/bohQJdFcY0hFUs1v9Q/uSav/HHe51F/TQW/xff
 NR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uz3vmqgDyVv9BLiGwjHpzAwz4xaYJrWKJhBIDjf4gac=;
 b=xG4Sz2HPYCWpOBc5bFyGiGaVW7liFuWycEbuXHD/eXqdCr8Ijp+TzFozkkBgkZPwXs
 8FcLpxobMWgTZR5zHKDUFbqAwbxNXMdRN1bh3flzh4blkS3wV0kSJRX12SSakh2MM337
 sdSqaveh2YpP4XXHY9+FART9qzMZWULeyIU9zDrUovCoFa46iTf0kClEa4Mt0G+kKLIM
 zLdkN2JIqeKYz04gYMccvIjn8xgwRbZxtpvCMQoVWrwaCScrni1oSnDWqdZdAs5PDf9v
 BGkdPMdwH7ZbISSYFAiKRe0HLQ08Iwsg/LvSt9+qfsl1QduJsE0IGqDaED2kun3DYKnn
 GiaA==
X-Gm-Message-State: AOAM532JPRxMLqMrgkgZBeTcA1iU8/tOdYSFrosta8eKAO7SEe4ULTjd
 gWo7hA7k4m9Aszo5WCf8Y3IdslDWNwc13E5xEUk=
X-Google-Smtp-Source: ABdhPJyFbz+y5+9bv4dPIQvTYDoUSz6TFFW71JZPqqyBNrURnhHBMaOkyoLu6mLnqre9js2Bgm1zBXKGrAfBbtVjTUk=
X-Received: by 2002:a05:6e02:1ba8:: with SMTP id
 n8mr1269148ili.74.1634772381860; 
 Wed, 20 Oct 2021 16:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211020030653.213565-1-frank.chang@sifive.com>
 <20211020030653.213565-9-frank.chang@sifive.com>
In-Reply-To: <20211020030653.213565-9-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:25:55 +1000
Message-ID: <CAKmqyKPrKaRt=m9BBjYJyF4844kkuTKXod8FWjNkHMDCe7ukXQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] target/riscv: zfh: add Zfhmin cpu property
To: Frank Chang <frank.chang@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 23:26:26 -0000

On Wed, Oct 20, 2021 at 1:13 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8c579dc297b..4c0e6532164 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -602,6 +602,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> +    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> --
> 2.25.1
>
>

