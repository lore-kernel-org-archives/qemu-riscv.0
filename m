Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJzs-0002kC-Nj
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJzq-0002gV-MG; Wed, 20 Jul 2022 20:24:54 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJzn-0002I4-0I; Wed, 20 Jul 2022 20:24:54 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c3so241164pfb.13;
 Wed, 20 Jul 2022 17:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l+68npuseiu+J/gHMdL6PFqYfUSq4lod0n2Pfqbk6Ms=;
 b=goaOkH76b/NcLlC5RFiNzh9yCFdQtRNgB+RYw4kAHvPNfjVcBd3XH5VR9PUUJsBR1u
 tt9e17VjXnzkVsfOoi9fVO0R0hqHsNTYL4ggDAGKdYpx/f/BavBlZXVaDRHHg3cOlAiG
 ozb+no+e2ke41BDx9c7PvZy8r0eyuL3qREhaX5115pPnw2qRrEgQ3XS0CWmvLAdmj65Q
 VSrbXBop33Lyyg5Tmjgx+jpx6rJTUfUjIql7tRlhBsC5vf0g866prURCY3bjL07Sw58Z
 C2Iwp/cS7Nc66qthwqdYZJs4zUjStbbMCHirnsszEOelUJ+Ax/i5OqmmFhp+PSIFkLrm
 bE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+68npuseiu+J/gHMdL6PFqYfUSq4lod0n2Pfqbk6Ms=;
 b=N5OEdkP4LkfcuwqprMGkKDXFKhmC92QAcgHgIf+kE/dD0zZUE23d75f9QPjugJSGIS
 cCFRZ2joZ9Cb8zoII1+BA3e5O03WYY/XRDZY+uYSdneRdfYtpAaO/wKnmaOKkGeTw27K
 jzytQk7Sw7irj/Ucty9klab3HKHUAXHXgaH3HBlA4MSlt2HykpvlwHGvkiOY236AvT0P
 sf8JQjXIpdNPG6aGHlkSFa9+gOETM8fKVG3jN6TK39D+ujMyyHV4b62VX1Edc6G34Fip
 N370qL7zzUHHZXcC2wSpwJOckw3xkv99JX2XGkmUY1qlPVJ6l/e7MUlsX50u3wDTecrl
 NUTQ==
X-Gm-Message-State: AJIora/1V0jX1f7v7CyaRkHVukdyzcGLcPiQoVeDqkGEWUS2MY7GUS/u
 26fXvPES8vynFBtWaGvNB+YMecWuyS4tJ+QLe5Q=
X-Google-Smtp-Source: AGRyM1u5yWQP+n2Cb1sxO8ufUQng0aNLusgeX0nnS5saJ3jdwR0Qf7dzFG2z5495SlxR2t+S4eaxsvkZc8Y8+p/MSDQ=
X-Received: by 2002:a63:1c4c:0:b0:412:6eef:f91a with SMTP id
 c12-20020a631c4c000000b004126eeff91amr35205512pgm.361.1658363089303; Wed, 20
 Jul 2022 17:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-10@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-10@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:24:23 +1000
Message-ID: <CAKmqyKNT9MdKbxAC5fpLfWPxT3F6_SY2L7F0fX+__Sz2YdYe7A@mail.gmail.com>
Subject: Re: [PATCH qemu v6 10/10] target/riscv: rvv: Add option
 'rvv_ma_all_1s' to enable optional mask agnostic behavior
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 00:24:55 -0000

On Mon, Jun 20, 2022 at 4:54 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> According to v-spec, mask agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of mask policies, QEMU should be able to simulate the mask
> agnostic behavior as "set mask elements' bits to all 1s".
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between mask policies. Setting agnostic elements to
> all 1s allows QEMU to express this.
>
> This commit adds option 'rvv_ma_all_1s' is added to enable the
> behavior, it is default as disabled.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 05e6521351..a67b1c3e84 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -955,6 +955,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
>
>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
> +    DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> --
> 2.34.2
>

