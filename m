Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqlAO-0006qt-FS
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlAN-0006qf-0o; Mon, 16 May 2022 20:34:23 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlAL-0001NK-Cv; Mon, 16 May 2022 20:34:22 -0400
Received: by mail-io1-xd2b.google.com with SMTP id m6so17800809iob.4;
 Mon, 16 May 2022 17:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mF6mDAKFc77AYNNXA4OHnGa51omnsliyczJ7paY1mEI=;
 b=Za/1gTrCk97+tGggqjPdevz9ryPlTqwYvB9+PEw+rWAVlRbdSomICxSwvzbsHabDcV
 pejk8d9Xfufw7fMbjJEC/f1Xi5LiexEsqg1VGtjwLdbEbOLO515yRSp5gaYSpsZ1/5/P
 GrMBkv0gGqxV1JSDisDQ6L2I7f56G/ZFTAevbLmam3tSYd+Phrd2f31H336/poNFXL7V
 5hMcN+EyLi3RXLqH36V0MJ2yLbPRoMZZT3leRedIA3pUOQl1rNbdbWxittLUtSopW6vH
 oLvy8XFeKzisl8XGmsp28PviL3iWRFboY5QoUMSU0u6Act4iVJdS7Oxz1ojD20nJRekU
 ieOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mF6mDAKFc77AYNNXA4OHnGa51omnsliyczJ7paY1mEI=;
 b=h6ZTUB+sGrkWRm+kQDDODzMMEM/TukZnJdKNz3dGdnR9f4GuNGnxT8Bh1g2n7onE5M
 HWs/eE0IeatmNvOyh89/5ibC8KRnBCFAk0r7rLUcl1jamJTBFHuCqlvp316l/TzhiVAy
 Yyfuo9QYPAcTrLHVyeflKqDNqzkZFUEPedzitue1gfCtw0tuSv1vkMD7LXjKSt0gV9Zg
 l08+4rDoBKkvwrRYePjknJAx3MSRX0vHRJODfIi0CbC2Xv5mWDqHAsIFQwu/9fGep84v
 UoaZxbNkUOaByNZRR1WQAM21sU4Ka1vh1SC23fwBGRl7lTIYjgqPdK6eIFYJwACtlbFx
 Qi3Q==
X-Gm-Message-State: AOAM532YXoDoUmLoh9UhOOSkscyol3aXgbxxx7B99N7YtyCH9f4/f/A4
 YfmdSw5FclaOY+izTWEVbFstbMxl5Ul+3ovF2S8=
X-Google-Smtp-Source: ABdhPJxrx0xmFqpL6B4m1IYQyrByBn93U4ZY6777r/DIy2f67Dg/gUHdLxSLSem7alzIn6s/bw+ZniEua4fFXgA/hzI=
X-Received: by 2002:a5d:9818:0:b0:65b:ae2:863e with SMTP id
 a24-20020a5d9818000000b0065b0ae2863emr9094746iol.31.1652747659022; Mon, 16
 May 2022 17:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220516033357.12371-1-liweiwei@iscas.ac.cn>
 <20220516033357.12371-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220516033357.12371-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:33:53 +1000
Message-ID: <CAKmqyKNwjv1MwGqj7LP+jF5AKg8Cpvnwx5U8gKVASFRtCYFirQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: disable zb* extensions by default
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Tue, 17 May 2022 00:34:23 -0000

On Mon, May 16, 2022 at 1:34 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - enable zb* extensions by default will make cpu types(such as sifive-u34) implicitly support zb* extensions

Agh, this is a pain.

Can you enable these by default for the base machines then? That way
they will be enabled for the virt machine

Alistair

>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b12f69c584..a3a17323e7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -847,13 +847,13 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>
> -    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> -    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> -    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> +    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, false),
> +    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, false),
> +    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, false),
>      DEFINE_PROP_BOOL("zbkb", RISCVCPU, cfg.ext_zbkb, false),
>      DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
>      DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
> -    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> +    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, false),
>      DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
>      DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
>      DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
> --
> 2.17.1
>
>

