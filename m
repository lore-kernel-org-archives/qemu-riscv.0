Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noMrj-0003gy-EC
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 06:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMrc-0003f0-Ve; Tue, 10 May 2022 06:13:10 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:41662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMrb-0008OY-8e; Tue, 10 May 2022 06:13:08 -0400
Received: by mail-io1-xd36.google.com with SMTP id z26so17987609iot.8;
 Tue, 10 May 2022 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uIGSIwsgHzPaNeLIC2Uz7U3aKKXgPLNod+GumiUhlJg=;
 b=p2fe75gKsSLoMvMyuZuZqf9p5UzWlFA/qVtKRKeTNOVnHdlhL6iJIGRBMCFvBoHxf7
 yAfw9OVmWIezonBIFE0eAigsPDLu3wjNhit+r6Kfg97Rje6A46vd+46cC/X8X2QWOHAD
 IG9uRQkstU9wO50OHRGLy7idik6ngWc0ze+Kj23s6NqOhBoPrRAOV+jiN3Czu0kBxVS3
 kOnM04inX3utxXR5c8EPRanuyl+//RqtNGU96Iz9NVlQ3Xtx+2rs7K0XkdaXu8aABshK
 UmzdGS8xguuaU9Z8WQy3grz0clt6XDfWC4TexFYN7rdPCAeRt4flTtbrVowhVgefQTXh
 yzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uIGSIwsgHzPaNeLIC2Uz7U3aKKXgPLNod+GumiUhlJg=;
 b=SUcSruP2pYKuo2a20UZMTcPbbA3q37DzY9iZ01YuVXE90Zl1tdQ1fTmzdVVos171qy
 wtPWBgBnt0/ksdRINv0Pd/tl9hfrb1P5X7Wnv+NlU6Wyxfl8HrnI5ofqzhfkj2tNSIMT
 swlSrenVaCa5mjiCLZ0jg2UwkDX7W2fe9ksJVPOu5JSOcWQ/2ptRPqVPP007DTUwyoyi
 JVQUTHPV2yvuUx8Gwmem2x69cignEOgTGAglXJB4fXZP7S/sFOxnQwraS6o+CXLeUh06
 UlHaG46NjgV2bsicK8JXzLGRg5y1OAR08khXzQW1q0drSBXV2TmiBmazIvDXXPKnj1pE
 gWpg==
X-Gm-Message-State: AOAM530Y923m0cGTeWctXaNC9+/pyMTF3/PcjLpvsor8yeQok0epnMEA
 0rqXBMRmZGrO+M4ZtsmEv0nqga7DFdtNj+rj9ps=
X-Google-Smtp-Source: ABdhPJzRur0Uuk6LILU4TwtdXRuxAndJcEjoSwXLZ7X6HW6Yao03vgGhOy4oCN3InfSEgXbbIPRjqoBJNjEJFh5giVQ=
X-Received: by 2002:a05:6638:dc7:b0:32b:a483:16b8 with SMTP id
 m7-20020a0566380dc700b0032ba48316b8mr9789512jaj.66.1652177585309; Tue, 10 May
 2022 03:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-15@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-15@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 12:12:39 +0200
Message-ID: <CAKmqyKMdP+w2QpL2z7Ot=rnzNXDLNtqPfMP-rVwCK_MbayMKCA@mail.gmail.com>
Subject: Re: [PATCH qemu v14 15/15] target/riscv: rvv: Add option
 'rvv_ta_all_1s' to enable optional tail agnostic behavior
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Tue, 10 May 2022 10:13:10 -0000

On Tue, May 3, 2022 at 9:55 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> According to v-spec, tail agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of tail policies, QEMU should be able to simulate the tail
> agnostic behavior as "set tail elements' bits to all 1s".
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between tail policies. Setting agnostic elements to
> all 1s allows QEMU to express this.
>
> This commit adds option 'rvv_ta_all_1s' is added to enable the
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
> index ddda4906ff..cd4cf4b41e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -810,6 +810,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> --
> 2.34.2
>

