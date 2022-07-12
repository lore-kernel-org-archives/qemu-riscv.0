Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB8Hk-00072p-TD
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jul 2022 01:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oB8Hh-00071K-Cv; Tue, 12 Jul 2022 01:18:09 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oB8He-0006jI-4M; Tue, 12 Jul 2022 01:18:07 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b2so6300037plx.7;
 Mon, 11 Jul 2022 22:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VdRvUvogtVrKHWxwrTowg5p+rLlqnZhKF+iSJnHzGns=;
 b=EXrTdkfu0xMbU57LlI87Bc9G+Q4Xc5Fwj+hQo0fglDoi3nSQH5yxGGTqxFkW3mvFu7
 13fQSpyXTh04Zq6vV0OAEtORO9CaI4HM97X6KaX3IyYXrPu814vZg4GdCWF0ndOQvEPQ
 z9IFFGf6KJswR2MiNuOUGbhdVm9U1tISSEUZlTK+wh3F8A+Jrq33CW2a6TiJFmATgHxr
 mp29i6qbbPY1GEBIpRqtbU+o4wfBo8K8YSW1z2cwHKb81u3/j0mGJDtnOlK4Rprs8LCe
 IHK1yKHQYwzUxEjwplYA2AvoY5qB6jWSSTRnu1EiXl39QWq4j16gd0iSl9G/tBPIiU7E
 qEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VdRvUvogtVrKHWxwrTowg5p+rLlqnZhKF+iSJnHzGns=;
 b=ilDByzeZvRIl/IULg4zv9qlUPuQYox9UDz/gAqLiQn55AB94jwErJXU1FAFAzqRxnW
 fVdU3k4Qjg7k+oDiZfo04HsJHTDMHpSq3LQ/V2ZBPQnK4pRG87/nZNwr805jbGymvOua
 to/tz/pXIrKIWZC20zpRPxKq4umcYF/2gSU8NhvnEwaYN8nWAySiWjr3rDuZsv+WPAxI
 /8LIirIr4TeBIsv3/WHvCdjwBnhFlOnu+VPy5DlgHGAAR+QQrmU7PAy5UswHFZxxP7rO
 QF2cZLQL/veQJIZrRMitwiSBjXFosa6qhDs688UNouk0MMVQoul/0PpECVQXVbVakqVg
 Gl5w==
X-Gm-Message-State: AJIora/gFOpY4Jcpr91WtOEW9CmNGoKVvGlSHoKv/UObWz3fRLYOJ3hb
 ZNBRlzBJBBQznlE4uBj82xZsCNJ+xrYH+2qBd2s=
X-Google-Smtp-Source: AGRyM1tSWOSmMS5knEZTnprhgiI0RaiRZJ4GSaJZCYt4eT5Z1nuwPDK3XcGOibhNCgXiMQ2BkBw3RivgGnaCJfQZy6I=
X-Received: by 2002:a17:902:f64b:b0:16c:6438:6999 with SMTP id
 m11-20020a170902f64b00b0016c64386999mr148419plg.25.1657603084217; Mon, 11 Jul
 2022 22:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220710101546.3907-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220710101546.3907-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Jul 2022 15:17:37 +1000
Message-ID: <CAKmqyKMrw59oEtVcFRnr1ofUV9C=qe_b1JZj=c_TriDQf2BnCQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: move zmmul out of the experimental
 properties
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 12 Jul 2022 05:18:10 -0000

On Sun, Jul 10, 2022 at 8:16 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - Zmmul is ratified and is now version 1.0
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1bb3973806..6301871fdf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -924,12 +924,13 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
>      DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>
> +    DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
> +
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
>
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> -    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> --
> 2.17.1
>
>

