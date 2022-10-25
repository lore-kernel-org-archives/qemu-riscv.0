Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onAnc-0005to-Ka
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 23:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onAna-0005jS-2N; Mon, 24 Oct 2022 23:40:18 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onAnY-0001OM-Ip; Mon, 24 Oct 2022 23:40:17 -0400
Received: by mail-pf1-x430.google.com with SMTP id 192so3564419pfx.5;
 Mon, 24 Oct 2022 20:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mWpix6oiFchR5n4B3BCuqe3+9hAamN2i1PjX+p83xfA=;
 b=drBUYNRg+YhUkQjzc+KHvBC/sblePPRG0nVwkadchK9T1dHCIp0ARYUGcdgJV+zZz7
 XGu9Fkmp6bO7UKGOnmNY2otvvOxb2/gKjFtLCDpYlAxnfdgpDFrfwwwhhJSs1a6ewkhb
 oZIEhbe35lxPT3Iqq84rGW3mrLyPy9BZo29flBksgu6p4JyqY8vMfNZg9M1BtDbQ6Hg6
 8rLjZHMFHlccRaOn3Xy6bUkomZj+NklmVk+Yd9OnSplCUHfD6uUuGrb0DKxuqlnwg44Q
 LwJXcbjvnw/7HQ48vwXDpy+sf3p62gKnhxs5rflz/B3/MtM9d1/kLEIObKMWnwuGmfjk
 4eNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mWpix6oiFchR5n4B3BCuqe3+9hAamN2i1PjX+p83xfA=;
 b=mVwL7mHsNnkyDCWeisx2hIlukd5pqsUn0dArpbrMDB8AayJb9eY+nv0+f38lZf3XVI
 UAOiIqBGuV4GqkAS+JSRrqFs3IbQCDGDsdexG40OqbzytlA2AA/6Df1Et3s5voKlxw96
 y414Di4R+tlG7cMyoS17tgJW4bh/MWbK4UdOKNYLbxceWpvVn3369xJkkqlDU4bN77ak
 xbeLfy3Etq+u24TS61gDjrepAiChzLqM1Y0Be3AKGUQ/M922rDDvsMeDm/6G49IG0W2c
 9384MENCiaM7hrPr/G9sa8c1T2W5JIoUe7rN5nEG7rRMHnq8CCif8cWhG8AxWZWbSqww
 xIfg==
X-Gm-Message-State: ACrzQf00rVaZPWGodJVaMT12TQgMMIPGjsgg/HHC5lGv1zp+FPk/4rJX
 3JiJs1bsgAFAaPiHPNxpFv4YomukjjYarJK4Id8=
X-Google-Smtp-Source: AMsMyM60zISq0CxF164p8Ge8piSc6SmgcVEVU18D1bFiiy5GzmntHrD6HIND99001Bhj7eMM+hfvNOU4hTkI15fCqjg=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr30850425pgi.406.1666669213973; Mon, 24
 Oct 2022 20:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
 <20220930012345.5248-8-liweiwei@iscas.ac.cn>
In-Reply-To: <20220930012345.5248-8-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 13:39:47 +1000
Message-ID: <CAKmqyKPHK7qKia8VayjLogUeXf3jiZpHRdk5bObmx6hbrLAuoA@mail.gmail.com>
Subject: Re: [RFC 7/8] target/riscv: expose properties for Zc* extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, 
 lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 03:40:18 -0000

On Fri, Sep 30, 2022 at 11:29 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Expose zca,zcb,zcf,zcd,zcmp,zcmt properties
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7da3de1725..e6f722278c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -80,6 +80,12 @@ static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
>      ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
>      ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
> +    ISA_EXT_DATA_ENTRY(zca, true, PRIV_VERSION_1_12_0, ext_zca),
> +    ISA_EXT_DATA_ENTRY(zcb, true, PRIV_VERSION_1_12_0, ext_zcb),
> +    ISA_EXT_DATA_ENTRY(zcf, true, PRIV_VERSION_1_12_0, ext_zcf),
> +    ISA_EXT_DATA_ENTRY(zcd, true, PRIV_VERSION_1_12_0, ext_zcd),
> +    ISA_EXT_DATA_ENTRY(zcmp, true, PRIV_VERSION_1_12_0, ext_zcmp),
> +    ISA_EXT_DATA_ENTRY(zcmt, true, PRIV_VERSION_1_12_0, ext_zcmt),
>      ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
>      ISA_EXT_DATA_ENTRY(zbb, true, PRIV_VERSION_1_12_0, ext_zbb),
>      ISA_EXT_DATA_ENTRY(zbc, true, PRIV_VERSION_1_12_0, ext_zbc),
> @@ -1070,6 +1076,13 @@ static Property riscv_cpu_extensions[] = {
>
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> +
> +    DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
> +    DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
> +    DEFINE_PROP_BOOL("x-zcd", RISCVCPU, cfg.ext_zcd, false),
> +    DEFINE_PROP_BOOL("x-zcf", RISCVCPU, cfg.ext_zcf, false),
> +    DEFINE_PROP_BOOL("x-zcmp", RISCVCPU, cfg.ext_zcmp, false),
> +    DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> --
> 2.25.1
>
>

