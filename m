Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9aO5-0000fi-Bs
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:22:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aO3-0000ex-Io; Mon, 17 Jan 2022 17:22:03 -0500
Received: from [2607:f8b0:4864:20::d32] (port=35794
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aO2-0005Mt-0Q; Mon, 17 Jan 2022 17:22:03 -0500
Received: by mail-io1-xd32.google.com with SMTP id p7so23347174iod.2;
 Mon, 17 Jan 2022 14:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4CCOpjj5UNpY6MqvvKnRB1X2rgGYkj06zarT2Yr6uR4=;
 b=HOYlSxQpZBQumT71Dz6kx5RD+UTWH2g+0OR000CyjqZDPkWp2Oir000x2h/C+4529b
 fosa0Gt2coWnP/my8PpmLGdBdBthECoJsIMwZuheq0fa+ZHA9x5M1VVCLW2trArn74m3
 GKTRB+GWfJUetiRPO67HgX574jAiuvlLz57r2MBRA1C3h2jBF0IiheLIGPlHrj78AoZQ
 ZfqDsRSz6a/AUO8xo76ynDufWE/PyCogOfG8jnV+hASH4ByOHy1k3IzGn/tXcZXsRybP
 ZD0MV2sH0JwouiWX39IFGis2zxx2YdpDdoSDtjF1m49cLBEKLiHrbtSQcB7LT/xnvqdw
 THag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4CCOpjj5UNpY6MqvvKnRB1X2rgGYkj06zarT2Yr6uR4=;
 b=ZTuZko+OfTLvrZUU5QPa7fRjH2IeCPxckeu3rI3wK82uTV87GwIOFcL4FU3WG8fu/x
 xRFNXfmP4ozlbX8LzM2F2vzOArekCZOIDCfJBl0XPLdHy4LwXWG+na/kLCEdHQ+gvgSb
 O2EsXRZo0gIk0yKbZbZS8ZRuecIPSAukNEuhJ/stbwXS6pWi+OyN2QGDGMkq/c2d3JSG
 15NuEt4KaMOLMLFO6UFRMLq4hH92dd9eQMpWBjkJNV4pnowPFuG7Thi45AmdOQ/PqtJA
 oYAHSIOgCCln20pmMvjkodxeof3T5bQtHZX3FBOMTVqEypxXoWwljhLBf5LckjpS8j7G
 LUSw==
X-Gm-Message-State: AOAM531jKzyCb6xKqAPx+gwxsxUltM8PA5G9wyw4oq9H02+YxsMIX6xd
 xNbbCIa5vA670K/2/LnpgRrdAD205D8li88XXhc=
X-Google-Smtp-Source: ABdhPJyXkWPvkzZ+Dr32C3Rqv8oEjZGXvgV7VKmQruB6Wo4Wtzh0pKlgKNDtbVXbP9XIf4nJjP9eLoQM7bQCOJbe2+U=
X-Received: by 2002:a02:a403:: with SMTP id c3mr10939805jal.318.1642458120102; 
 Mon, 17 Jan 2022 14:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-3-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:21:34 +1000
Message-ID: <CAKmqyKPcN1MWxGBV3spurYBdD28nn71uDdMWFWTA5R9QdiQ9+Q@mail.gmail.com>
Subject: Re: [PATCH 02/17] target/riscv: rvv-1.0: Add Zve64f support for
 configuration insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 22:22:04 -0000

On Wed, Dec 29, 2021 at 12:36 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> All Zve* extensions support the vector configuration instructions.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 6c285c958b..5b47729a21 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -129,7 +129,8 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>  {
>      TCGv s1, dst;
>
> -    if (!require_rvv(s) || !has_ext(s, RVV)) {
> +    if (!require_rvv(s) ||
> +        !(has_ext(s, RVV) || s->ext_zve64f)) {
>          return false;
>      }
>
> @@ -164,7 +165,8 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
>  {
>      TCGv dst;
>
> -    if (!require_rvv(s) || !has_ext(s, RVV)) {
> +    if (!require_rvv(s) ||
> +        !(has_ext(s, RVV) || s->ext_zve64f)) {
>          return false;
>      }
>
> --
> 2.31.1
>
>

