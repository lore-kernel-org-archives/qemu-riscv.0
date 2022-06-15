Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1SuZ-0001TZ-II
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 09:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1SuW-0001M0-60; Wed, 15 Jun 2022 09:18:17 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1SuU-0001Oo-Kb; Wed, 15 Jun 2022 09:18:15 -0400
Received: by mail-qt1-x82b.google.com with SMTP id k18so8094608qtm.9;
 Wed, 15 Jun 2022 06:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DgtWCckTaKkTW1HBBRs1LV9cZaBHkUUk9y26oeL7uQc=;
 b=igAQ0DfRDVDUVcsfF+x3LebX2HbdhqM2ctl+NkR52m/4wxbE6lrRaFxXo5gyl8s8aK
 BqBjB9Jg/9dEtNWT6hEWJCAaD1XqzFOcsAMyGoyZvcOFEL/4wLkRZKxNm8lbtwsbrNwh
 1zH4d6R1LOk1wUebiSKVmKlxX+FjZVKPxYZGpYTsLDWDb8CXCTTeMunfofHwOHXuFGT+
 JvIAnM3TcC6xbEWiipk3aMKY0uEbIAzQR+mh+QH7yoWdiwOb8V3rAOVJAtE1LtEkszZ6
 uASb8wpaiz6YacgPR/A/lVb4as4a2QdIm9UD/eYp9wdwmJIUF46r6S4H34H5Mj2tKZ2/
 zv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DgtWCckTaKkTW1HBBRs1LV9cZaBHkUUk9y26oeL7uQc=;
 b=URFHamF6xLb/QedajTgVY3UT3+C96SHLHl9OrvjwqnOVOwTdiumsOJH+T7l1dK/Is6
 l9Tv1m+F5EZmDfMBcfEUY6HSw4Y3gaOz46kMPOUj6VKHwmtYExLqIGbt8iz8jr6hA790
 ubZpUh82wYvYQvx+q+O2Wv8/rG1XlIh2FjjawlVHbIrdLu6W1JrWyElbBsWtJ4ptsFHR
 IXvcHtdbSerh2C9U1TULthf6lkaB2xKzw1OK8TmFRRgoCYF0tw3osETrScbicAuJLfGS
 Tjve13wkDQQBIVmxGqmpwLpIzv1gaSYQKRC03RSvZTmYKnvs2+l6mkjgXW+i+Jfwqvpf
 ZegA==
X-Gm-Message-State: AOAM533QGuOybJt/17acD/V9vtr/WtRvlxW0DtMy4Nv8newTquAVGOGz
 Q4msOmVG2/Cxs5ZSkhvBoHCZRK+0AQ07WZYfGm0=
X-Google-Smtp-Source: ABdhPJyhBflNKC1DbBIwrr+tJQtrvQgoiSGH+nFL7VOOhW0L2uzXDG2FkSHyzEySNam9LOk7GTRhXiGw7FanYVbpumQ=
X-Received: by 2002:ac8:7d55:0:b0:305:732:680b with SMTP id
 h21-20020ac87d55000000b003050732680bmr8699064qtb.391.1655299093164; Wed, 15
 Jun 2022 06:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220610051328.7078-1-frank.chang@sifive.com>
 <20220610051328.7078-10-frank.chang@sifive.com>
In-Reply-To: <20220610051328.7078-10-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 21:18:02 +0800
Message-ID: <CAEUhbmWfTjjHAHsWABx64_eJnyW+=FDn5uvyzcX_5fGnf08D8Q@mail.gmail.com>
Subject: Re: [PATCH 9/9] target/riscv: debug: Add initial support of type 6
 trigger
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Jun 2022 13:18:17 -0000

On Fri, Jun 10, 2022 at 1:25 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Type 6 trigger is similar to a type 2 trigger, but provides additional
> functionality and should be used instead of type 2 in newer
> implementations.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/debug.c | 174 ++++++++++++++++++++++++++++++++++++++++++-
>  target/riscv/debug.h |  18 +++++
>  2 files changed, 188 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

