Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9aTf-0005sl-SV
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:27:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aTd-0005mx-N6; Mon, 17 Jan 2022 17:27:49 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=39680
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aTc-000621-5E; Mon, 17 Jan 2022 17:27:49 -0500
Received: by mail-io1-xd2e.google.com with SMTP id v6so23320909iom.6;
 Mon, 17 Jan 2022 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHWKvGXcbd94AeluMeM/ka5JFJ+Hc9kYb5Hvhfeen30=;
 b=kw8y2T4oDNoL9d+u2HWI2bVL4kpN05JnzvVeO+8M9hLtVCYSO50lJOH9pzEXthXNWT
 IZwafcVQVEay/MVhCRCdXUmsLTKRNd00evQlfSjrcZ/KQYdV49/4e43EcT19PXqwc94+
 IXr56Nyee9ijGQWPiPU5gXWttwA341yqC06L8Pj2WcMc3C302asGle07vD11I5owsoYh
 kbruecwJcu/KgYprRBb8azJbiByY2nxqefrw6V5KD6QU5IJ/vVkeZO8nS5UA4769M6Fe
 lDNfGJTMkRYA/1oUOtaUhsKxbMv0e1ruOYC8rQhYQo98Hu+1BldQrFuURV3wkUq3cHRU
 MPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHWKvGXcbd94AeluMeM/ka5JFJ+Hc9kYb5Hvhfeen30=;
 b=7t9EIUgjQQFaAvu25LooOfE59IW/xLOSnUhyIeZdrs9drsJr6zve5B8f9U6Cz5HfkQ
 R78KN+ykpjos4u7nJSukHbbsRPtZWGm8IO4wN3oKbmH+BXRehvXhqaPexiaHL1tKXGXZ
 ZCNkphhaPHg8ktiuEIRlrjcAUIq2Ft85KUNJpySnecWksq79dmn2lssPLcuimI7QpDBt
 vfjinwODx2GiprK6ZGFU+BaLt8eF3zexy4y9/U8jwE2/0so7RRa8DkaFL9EmQJhtAGiy
 v4XF/BUG9OB7RTL8Tl2wsyE+D9kXuiTmSrbeR7HJ4QWyjd4dXtKKBVUm8IOdNrKOHKi8
 Mzqg==
X-Gm-Message-State: AOAM531AcKxeE7m0EcpKTibL9CcZKJtz8o5whXq/rizj5yvH2iJi3PBB
 pV4m15l4ymzhIJuMWKLByF+RXTrpsMzAORLtY98=
X-Google-Smtp-Source: ABdhPJxcH8Jq//8gKgcX/MSUP1XJevXmow792+GnHI6Xp1I9346fCzlMlIYnhXQsmCBpFoTaOfvOfPE6X7MxT/jHNWM=
X-Received: by 2002:a02:6954:: with SMTP id e81mr10421144jac.63.1642458466001; 
 Mon, 17 Jan 2022 14:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-4-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:27:20 +1000
Message-ID: <CAKmqyKPCCAzjkNGPe3E9etbKPzG3KS24eaqbo0nAjP7RpGaUJA@mail.gmail.com>
Subject: Re: [PATCH 03/17] target/riscv: rvv-1.0: Add Zve64f support for load
 and store insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 22:27:50 -0000

On Wed, Dec 29, 2021 at 12:34 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> All Zve* extensions support all vector load and store instructions,
> except Zve64* extensions do not support EEW=64 for index values when
> XLEN=32.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 5b47729a21..820a3387db 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -263,10 +263,19 @@ static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
>                                  uint8_t eew)
>  {
>      int8_t emul = eew - s->sew + s->lmul;
> -    return (emul >= -3 && emul <= 3) &&
> -            require_align(vs2, emul) &&
> -            require_align(vd, s->lmul) &&
> -            require_nf(vd, nf, s->lmul);
> +    bool ret = (emul >= -3 && emul <= 3) &&
> +               require_align(vs2, emul) &&
> +               require_align(vd, s->lmul) &&
> +               require_nf(vd, nf, s->lmul);
> +#ifdef TARGET_RISCV32

Don't use hardcoded macros for this, instead use get_xl()

Alistair

> +    /*
> +     * All Zve* extensions support all vector load and store instructions,
> +     * except Zve64* extensions do not support EEW=64 for index values
> +     * when XLEN=32. (Section 18.2)
> +     */
> +    ret &= (!has_ext(s, RVV) && s->ext_zve64f ? eew != MO_64 : true);
> +#endif
> +    return ret;
>  }
>
>  /*
> --
> 2.31.1
>
>

