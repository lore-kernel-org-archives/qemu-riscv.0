Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1odibd-0007eF-6h
	for mharc-qemu-riscv@gnu.org; Wed, 28 Sep 2022 21:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1odibb-0007bv-Px; Wed, 28 Sep 2022 21:44:51 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1odiba-0004X3-Ah; Wed, 28 Sep 2022 21:44:51 -0400
Received: by mail-pg1-x536.google.com with SMTP id s206so161202pgs.3;
 Wed, 28 Sep 2022 18:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kME8aAei0kISdSu1IjYGtQKwn1h33Awv7dNRwc9mxu8=;
 b=iwWxmcPUDLcOqhLhYjK/kB/WaygZifYSG4M2rxWsuQYO8k5D1WhzcaV8HI7n+yWTqx
 RaFWq0Ann6LoJ+9Sl1ANIAMMoJwO/VeXvJRj06Zd99l4GLqTsje3ExfDQgzkZbGnT7qw
 pW/D5XLDyUsSUTgRMGFECvpJEyCRhpr+zvLu6gquLYE1CtP+9WcE+EDi9MAX7v2tqzS4
 p8JUsd3cpJKkH2CcnUBTumdhQ00E3Kqk9B16nH0RxggJDi9T2x1HxLHCXINFUGz07iw8
 7b5CuaGoYfSr9Xn2ngk88xVJnfut+GkOwEeGe3sgrejnHpwLNLWO2pCDX+927eIZjYwF
 3Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kME8aAei0kISdSu1IjYGtQKwn1h33Awv7dNRwc9mxu8=;
 b=fGrhzE51XCdWkeukOB4DOGU1udWthinwAYbZulJiP419aUpENgchTOO3TFs8n2isQF
 XbdUFNebuqvUisa5bCsbnOLN7SLPwWnSDg/H96G6bPKj+sQTTNqasEhu8dIgCkm+5Zpo
 yLLPbaPlsbNpH3pYHnWjcs3TkxSl6rUG0jRPU7Ux9AXTo2z1CF+2Qg2MbdY2qjV0Q87s
 6bTv2VWou5ltaM60vqaJ/pf0zwXWsvp6trfaO/XETT9NhpkimFL5QOQQa95tE94ph+x3
 +8WoDpK5OXq98SRNJqKvU6pzLCeH2Q9kmedmgC+C7cukX6PE3pBEB0Vp+u8abDDMErz8
 9mAg==
X-Gm-Message-State: ACrzQf1AFjyvAyO1QeVqanGgFe/qSrRGKiO1I/5rEtKbe/KtN++iJQNE
 trEQNF5N66J+UdBc0MEFBd2ym+Fk69FkGoCTdV4=
X-Google-Smtp-Source: AMsMyM5ROEVnQQ26Fn3mx+aPts6pcX5Z0w6Ao0ydjGniBp5jA96sNms0Dwd1lOUgA3vehMUUxVtKuY6FfKzWyyIMc8o=
X-Received: by 2002:a05:6a00:2402:b0:52c:81cf:8df8 with SMTP id
 z2-20020a056a00240200b0052c81cf8df8mr711245pfh.60.1664415888446; Wed, 28 Sep
 2022 18:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220919062908.643945-1-mchitale@ventanamicro.com>
 <20220919062908.643945-5-mchitale@ventanamicro.com>
In-Reply-To: <20220919062908.643945-5-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 29 Sep 2022 11:44:22 +1000
Message-ID: <CAKmqyKOD8kvwnQa1ruz3YqmMp0W+jehNU4fn87Vni47r7+Crfw@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] target/riscv: smstateen knobs
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Thu, 29 Sep 2022 01:44:52 -0000

On Mon, Sep 19, 2022 at 4:58 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Add knobs to allow users to enable smstateen and also export it via the
> ISA extension string.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index aee14a239a..1252ca71b3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -102,6 +102,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
>      ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(smstateen, true, PRIV_VERSION_1_12_0, ext_smstateen),
>      ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
>      ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
>      ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
> @@ -1021,6 +1022,7 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> +    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> --
> 2.25.1
>
>

