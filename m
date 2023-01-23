Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6Ze-0003eJ-Bc
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6Zd-0003dx-FT; Mon, 23 Jan 2023 18:50:01 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6Zb-0008JI-3D; Mon, 23 Jan 2023 18:50:00 -0500
Received: by mail-vs1-xe29.google.com with SMTP id k4so14822649vsc.4;
 Mon, 23 Jan 2023 15:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MHnKkhGfnuDqGR7Xcs4pWDgloAS9OTSgFOd3OduGmE4=;
 b=RQ85Y5i7pO5suC9oHnsqCsa3eAeJjzCRXIIwjOcSOD3YVFYoZTieLZC6aoI2dhlTDN
 kOXpBcmUX5Azm8Kxq0VSfJZwAgSoYIJzPQWpg/BNixPUlVHr7ayMRdl+QIe8SwTZhvND
 HC8NXXSxWC2qYw42sdMVAYL0kECH8K5QnLAIU2rFJbdWgBXbRPL1OgDfp6+IPXF6grkK
 GnTuGzrlASijGydi/mMNLTLFmIBzB9m8u/N4NyPqULAmC4aAnR9x11Pkfy/J3tRwdl45
 4KQgQKGLdOyUHcH7HtM8Cmu6X4IoBsgAuqeYiNs4FnDhTqS3JFVYd1aWjdJxcZvDOmbC
 LvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHnKkhGfnuDqGR7Xcs4pWDgloAS9OTSgFOd3OduGmE4=;
 b=nv4nPcEB9SzkMC1EZIbNgC6DdJ/gP/KP4hijYgmTE2+py7emirBHnLu3Rys6nRtwAU
 aGRennObWWqyrPRP2RgquVDN3GvxDVCtoplUq1mw1mOZ9UWcqjW1uUxUImbeolaQNWff
 AsDu06Zm0ntbkoQ3seLXlQzQ+mb2TN9HItKhepoKe/nNIf5vKcOPGH7kOvalZQ6V19Be
 +pxS2fuN3B3Wcy81E4v7DGoISSG6iBatlX6H80XW0j2Sk3Yi62bGJJxaN1hgJs/rsb/d
 JtZsCgBX+IghRx29JgfkxVJ9G2zG3IZ9GWIJk/cZ4xNGUnqqtM5JzVxJV6uem2InFsoM
 fBDA==
X-Gm-Message-State: AFqh2koldSgr6CAc1k+ww1tEtwr7gSbMkqaw67KN5WEWjYww19TqouZ6
 i6wI9e74XjpdvATo2LNaZ8/YE+5leoGCs3k1tcA=
X-Google-Smtp-Source: AMrXdXt7pl5WDd7uNX3I3aAtE84VHW/Uf2Okn3IZ9TcjONdyt0YkMaN8yXTLIPNDJ6qA9y3GzEDAoFUDF3Dk4kjEcDc=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr3383084vst.54.1674517797574; Mon, 23
 Jan 2023 15:49:57 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-12-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-12-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:49:31 +1000
Message-ID: <CAKmqyKPPr_nkKZH9Z6r0H2E=TZ0Jz6EPbL--w_TSfbGJ+o55yg@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] RISC-V: Adding T-Head XMAE support
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 23:50:01 -0000

On Sat, Dec 24, 2022 at 4:04 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the T-Head specific extended memory
> attributes. Similar like Svpbmt, this support does not have much effect
> as most behaviour is not modelled in QEMU.
>
> We also don't set any EDATA information, because XMAE discovery is done
> using the vendor ID in the Linux kernel.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> ---
>  target/riscv/cpu.c        | 2 ++
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_helper.c | 6 ++++--
>  3 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9c31a50e90..bb310755b1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -118,6 +118,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xthe=
admemidx),
>      ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xth=
eadmempair),
>      ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
> +    ISA_EXT_DATA_ENTRY(xtheadxmae, true, PRIV_VERSION_1_11_0, ext_xthead=
xmae),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
>  };
>
> @@ -1080,6 +1081,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
>      DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
>      DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
> +    DEFINE_PROP_BOOL("xtheadxmae", RISCVCPU, cfg.ext_xtheadxmae, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
>
>      /* These are experimental so mark with 'x-' */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c97c1c0af0..897962f107 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -475,6 +475,7 @@ struct RISCVCPUConfig {
>      bool ext_xtheadmemidx;
>      bool ext_xtheadmempair;
>      bool ext_xtheadsync;
> +    bool ext_xtheadxmae;
>      bool ext_XVentanaCondOps;
>
>      uint8_t pmu_num;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 278d163803..345bb69b79 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -938,7 +938,8 @@ restart:
>
>          if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
>              ppn =3D pte >> PTE_PPN_SHIFT;
> -        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
> +        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot ||
> +                   cpu->cfg.ext_xtheadxmae) {

I don't like this. This is some pretty core code that is now getting
vendor extensions. I know this is very simple, but I'm worried we are
opening the doors to other vendors adding their MMU changes.

Can we just set ext_svpbmt instead?

Alistair

>              ppn =3D (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>          } else {
>              ppn =3D pte >> PTE_PPN_SHIFT;
> @@ -950,7 +951,8 @@ restart:
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
> -        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
> +        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT) &&
> +                   !cpu->cfg.ext_xtheadxmae) {
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> --
> 2.38.1
>
>

