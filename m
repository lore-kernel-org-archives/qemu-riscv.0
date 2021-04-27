Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbGro-0003mO-95
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 02:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGrl-0003i5-Ef; Tue, 27 Apr 2021 02:06:37 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:39891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGrh-0001Ie-DD; Tue, 27 Apr 2021 02:06:37 -0400
Received: by mail-io1-xd2a.google.com with SMTP id k25so15487359iob.6;
 Mon, 26 Apr 2021 23:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLnmJnX3w5rKg+FvO/If//Pj/7BbAmGH2Xbsbzl5iCs=;
 b=BbU0TFG2xxdEt/suQvC9LydpXfq4pkRXBqqINxlDfoZXXgDUvu8qYtJfaXHOO8XAeA
 poq6tTeXib4lAl8SBpX5razjQx1kxQ9lCfFF6KobQ5tVWyX4dTNwHRykudRFJNqPnuKx
 CeTyNr3Ngip+gfuiLolHUdMIynZqtVg66giFBFd02NHjHFmSj7590ENQo3IAYajm5EG1
 WeLUxq5PqIIiMDcy1ohxbBXq38tnOV/pgRaUjM1knFJkfMEKH/iM6szQEhNnyAV96DPv
 JsjyC8kbfklYya7sRXGp0q+0x/ZS1kShXYkGkol6DTjI9FmEH5oD0fUXd4jfZ2kD2N9D
 Yang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLnmJnX3w5rKg+FvO/If//Pj/7BbAmGH2Xbsbzl5iCs=;
 b=jxlbDp1ooPBhMenDplj/zQTzX6dlIKBnGMmAHsaWSqIqNzZZPurIWejpr5HUQFCBu7
 tqoxUkhIsmGo5rtJ/wJ1xGbDMiS11d3W6GQcqPrPlOyD6s1KhQnclGanbJXVPuzv4pKE
 d7xiy8mCu2CLbTYikqQ3tvoPkABpMEut89SlBQ39988BXUH5vI3bPGNt4A5qHSHMYXhd
 ldWY2JBEAuUpwhuwOiCToQGO3XP/CdOLfliGT0lVv+Ikv6kUf/+GelL9TPVo4WaMXg8+
 XfrhK5SGm7/7SAoMLAgsp6oXK4u1rApWVY64CDk//C5rZ0CRUqRJ0/TQOOw/gLPJ4Gfh
 ToAA==
X-Gm-Message-State: AOAM532wJDAKKeW9j9x6GxuEzKjZpaJ920/G1YAczuJbL9P8C8iZccSn
 tA94paAN9+Yr7fpKrRoW31z5C4zjm+H8GyW1IyY=
X-Google-Smtp-Source: ABdhPJwBVAtV+ODDp68Ph+EzQPKv/Va6Nr7PxWbleXT77vpFFN6rwHUupeLyt8rtRJpz4hkjF6Rb6KWLdhEjRtNZ1uk=
X-Received: by 2002:a05:6638:41:: with SMTP id a1mr20582703jap.8.1619503590385; 
 Mon, 26 Apr 2021 23:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210421041400.22243-1-frank.chang@sifive.com>
 <20210421041400.22243-7-frank.chang@sifive.com>
In-Reply-To: <20210421041400.22243-7-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Apr 2021 16:06:04 +1000
Message-ID: <CAKmqyKMOw45PSJxWJCGAwoWbncXaX=r-b70L7Lrg_Z=yK9EPyQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/17] target/riscv: rvb: min/max instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Tue, 27 Apr 2021 06:06:37 -0000

On Wed, Apr 21, 2021 at 2:19 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 7f32b8c6d15..d64326fd864 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -605,3 +605,7 @@ xnor       0100000 .......... 100 ..... 0110011 @r
>  pack       0000100 .......... 100 ..... 0110011 @r
>  packu      0100100 .......... 100 ..... 0110011 @r
>  packh      0000100 .......... 111 ..... 0110011 @r
> +min        0000101 .......... 100 ..... 0110011 @r
> +minu       0000101 .......... 101 ..... 0110011 @r
> +max        0000101 .......... 110 ..... 0110011 @r
> +maxu       0000101 .......... 111 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 2d24dafac09..2aa4515fe31 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -71,6 +71,30 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
>      return gen_arith(ctx, a, gen_packh);
>  }
>
> +static bool trans_min(DisasContext *ctx, arg_min *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, tcg_gen_smin_tl);
> +}
> +
> +static bool trans_max(DisasContext *ctx, arg_max *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, tcg_gen_smax_tl);
> +}
> +
> +static bool trans_minu(DisasContext *ctx, arg_minu *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, tcg_gen_umin_tl);
> +}
> +
> +static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_arith(ctx, a, tcg_gen_umax_tl);
> +}
> +
>  /* RV64-only instructions */
>  #ifdef TARGET_RISCV64
>
> --
> 2.17.1
>
>

