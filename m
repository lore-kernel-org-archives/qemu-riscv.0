Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDJlH-0002LY-3a
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 00:25:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJkg-0002Iu-Ao; Fri, 28 Jan 2022 00:24:50 -0500
Received: from [2607:f8b0:4864:20::d29] (port=44987
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJkc-0006cd-Io; Fri, 28 Jan 2022 00:24:48 -0500
Received: by mail-io1-xd29.google.com with SMTP id p63so5567360iod.11;
 Thu, 27 Jan 2022 21:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/7Rzz7XDvG2StgENnegg9VlNHYH2oCb8vPWsmy+YA/k=;
 b=Jajctx83qqxqSAtXFDvRECJBm5dA2lgfsL2skVmzbSIgHwMzhX+ts1lcYg16r1xSqB
 7Ai5tkUUP+MUxbwgS525/x71R8vjtyxUUBMWj/0IKX5TsSaRLtASEecNMXVNnbdfTeEq
 CTCIwNsWJfc/91MFm1+uXYWzy+aYiEUCPuls1EyFX1hzssqcXRZegtektG6XR5btv/Fe
 2gggaYY3vEeqwT7DwQT5YwY0PVO7YbJsWiXFNUY6o9fb0WKzwNjKqZMyqVsSbaESOcWX
 o2w8n5w5mv3JkBfjKyoz4nqs5p3EgvxJJg64ZH5inAGBiIM3TdS31JMcPMcynmcM/n2x
 9meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/7Rzz7XDvG2StgENnegg9VlNHYH2oCb8vPWsmy+YA/k=;
 b=gkH+JxPo4AFsBsAURXRci45Kk7O/KZdRpcRrxFtqUowQ3kOnwrhIs/HK7Uud2lp+/k
 cWTX7EBH1LHAWgvx5J/c0hwnr8tu8Ifr1Kcwrvg5N+ddEpX9UruXnLybmnOB8/7Bm29P
 dSGAQm0Zh3AiS0JmZCOrdUoQzFSobC/qBsx9ffYUaDdIMDLmFaBynhffHa9LIUoRoC8X
 KHtR/mdq7qi+3pbAXXd7KshUFoY/R7fwCgdbYwIlip8wHVu0KtFJmuzJBK2W5583GiYv
 Eqy6uPEbPlZKpvfjdl8yMY01IC2p8Gx7yUTjKuG420hOn9FGl7XVvXH0zMnn1OHGNiiJ
 xu9Q==
X-Gm-Message-State: AOAM533zbKgcB63BxYomTt2J1AXR0Jr1611CfnmxZcjCSL66W9LL+2tM
 TKoYvH5E4rSuQSNRevD4ISw0gJ/iaJBEmsSMzRw=
X-Google-Smtp-Source: ABdhPJzu54z48BYLys48JKpbW59Uh3JTj2mEMhb1+xyYeJQPl1bTSKCKpo+nXhshq78AD4vO/B5QLxh+fR90FAvbk8c=
X-Received: by 2002:a02:9606:: with SMTP id c6mr3578446jai.169.1643347477913; 
 Thu, 27 Jan 2022 21:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
 <20220113014959.21429-7-liweiwei@iscas.ac.cn>
In-Reply-To: <20220113014959.21429-7-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jan 2022 15:24:11 +1000
Message-ID: <CAKmqyKOMxX8JZwnub7ohJ3iqtHq6hOu4joryTE0v_3O1OnZ7vA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] target/riscv: expose zfinx, zdinx,
 zhinx{min} properties
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, ardxwe@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 28 Jan 2022 05:24:52 -0000

On Thu, Jan 13, 2022 at 11:56 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Co-authored-by: ardxwe <ardxwe@gmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fc3ec5bca1..d5e772b2b8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -685,6 +685,11 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>
> +    DEFINE_PROP_BOOL("Zdinx", RISCVCPU, cfg.ext_zdinx, false),
> +    DEFINE_PROP_BOOL("Zfinx", RISCVCPU, cfg.ext_zfinx, false),
> +    DEFINE_PROP_BOOL("Zhinx", RISCVCPU, cfg.ext_zhinx, false),
> +    DEFINE_PROP_BOOL("Zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
> +
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
> --
> 2.17.1
>
>

