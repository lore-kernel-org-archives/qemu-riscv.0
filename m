Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxjns-0006Va-FC
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 00:59:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjnm-0006UR-VJ
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 00:59:40 -0500
Received: from [2a00:1450:4864:20::333] (port=38548
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjnk-0001lx-9V
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 00:59:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso904126wms.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 21:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrYb7Y57MNJ1ypAuWPYKmsktjE8dfNJSOS27DVuDDwo=;
 b=sXKpLls3yqgPgKMZB5zDmjaoPpg1ZUfxbUL3Dt2cGQWBw1o2shoUMRIlHyyZEnGu4V
 WjyW5xAaLGC5atrTetWch2KnZp3AGdYcD8tMU9D+M40p8GZLmWD8meBoLopqYFGskcrm
 8QT77Yxc/w3qlli/UcdC9sjBBGJ61R4A3s3fiTxBWk450t/5uxBi7psZtXM7RFCJn2uO
 1/M5tSRtV63A6DOvYZYoEbg4lkPrIQ22hV+glF8l6d0S3Y/d1WMMA7E26trlyGt3+qIU
 ysJsZ3p05fqVN18kEQos/xSeRt6kkc5GlLIQyw+RLU31JvuIJvFCXBwRF0pjH6+1LjDQ
 XFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrYb7Y57MNJ1ypAuWPYKmsktjE8dfNJSOS27DVuDDwo=;
 b=hscwT0b2ruDt+ONT1JyRGzUqFTUujqxOKTbiy4Q1RKGOwJjjirwpI77lX2A2mOEtCT
 gZvAZvNl3uVGAKHrAvUzi2B0feiRCH09tQl6FBxU+karIiNtKQZtU5PIVV5UoHvGk1rb
 kxDA+pW0IKRqptm07iqM/kQJ0w/5qCfis1lQYjjBZanx/lLPT8QzWl3G0Ub2pt16f6c+
 MzYyTE/e9n/orU/P2AHgZv3MLlMDs13iapNYVzhXB8NSMIKe7iXiBGJQNosUWGB/lxQA
 K+YuY38WPhRT14uUZMoBEwJzNX5V7ctfit8Wpzl+1cM/vtbxg0T8dGWvKwJX2mCFJeAc
 iSVA==
X-Gm-Message-State: AOAM531czadJWIy3f0kn7YzR7wOT1kYbg9kr/jSTDBBSqy5X4+BCYeHB
 nhcauDKMXsicoqooJ2y6VhLwi4t+lEYGcoC5vDtk9A==
X-Google-Smtp-Source: ABdhPJwJjuLKRli1inWgYXf/V6WGJco/XX7oHBTLoOXmboz1R2G3z5xHVXjUMWUaic22R98orbFAYyVD1wqO5/ZhAhE=
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr3400480wmk.59.1639634374324; 
 Wed, 15 Dec 2021 21:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-6-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-6-alistair.francis@opensource.wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Dec 2021 11:29:23 +0530
Message-ID: <CAAhSdy3OkjDtwdN8g6Ea=soCAXb=tO=je4zb7zRRXVoj-CXmxg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] target/riscv: Mark the Hypervisor extension as non
 experimental
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 16 Dec 2021 05:59:41 -0000

On Thu, Dec 16, 2021 at 10:27 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The Hypervisor spec is now frozen, so remove the experimental tag.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f812998123..1edb2771b4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -626,6 +626,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
> +    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> @@ -639,7 +640,6 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
>      DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
>      DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
> -    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> --
> 2.31.1
>
>

