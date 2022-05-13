Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npaI9-0002a1-M5
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 14:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npaI7-0002Z8-PB
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 14:45:31 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:41105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1npaI3-0004Ou-Lv
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 14:45:30 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ebf4b91212so99303887b3.8
 for <qemu-riscv@nongnu.org>; Fri, 13 May 2022 11:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3kftEYrgWW+erv7CZIXa+hm2ovQde53jNaKoBhELzw=;
 b=dA/FPYnyagkw3dRfwaipFN4GJ4E/JIS7sfz8eoWBpPMney311Tc1uwG1HyOa0EgvVC
 NWkSnlCLxkqOYYyi9bVPo6CI16g4CcSLDBp5WjvLGl6lUpBjbV1wg4Q1JC4gEh2j32Pg
 zSDqiOppU8jTbc/JlFDtXitIRSylgiAoYRsgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3kftEYrgWW+erv7CZIXa+hm2ovQde53jNaKoBhELzw=;
 b=kjQmNCug5+7kYt3VKhnkVwJqJksWTfUXD6yeHcuI2XrjdR9NdBiRT+zZQ7LFaTC19a
 Le60MrF0ProDG7UMhojimbj/1kulwUtveYBkZXXaedtmWaf2aEuSoPLBanhZlWtILAsT
 cYSkjGPu7cPOaXge1+DcNbxdhrGMo3vYwbd+BYRcCbYuzifv8cMCWLm3HjSONTRGN/Pl
 TyOoL1X61BjbSp3l/WB8seWNiIQQAEQWLFERfALANKTW7WxHFpTLxai+pieiUZ539YnP
 JsRT1PsOuNIerNRey7g31it72jTg+hABx2rjLx4HnH0e5WEDqHtJRuXAJ8PI0QLqCG9f
 TuYg==
X-Gm-Message-State: AOAM532p2O1UdP3wHQ1XF8qus6QYFxyVtPdPdiY84Ndy1prIQhZY9ZIz
 2fTD+T2teyXpHi588ASNPWBlTl1AIvKz+n1bu0Qv
X-Google-Smtp-Source: ABdhPJxetj0NtG9hj2pd+e1hXVzA7Hfj1qnhQm1BCtAuz0PdX8j0wAdX/IKshqyraPMLgnlEK40m65KkfTExh+f/OTw=
X-Received: by 2002:a81:9387:0:b0:2f7:eb1b:d25e with SMTP id
 k129-20020a819387000000b002f7eb1bd25emr7456105ywg.402.1652467525393; Fri, 13
 May 2022 11:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-8-apatel@ventanamicro.com>
In-Reply-To: <20220511144528.393530-8-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 13 May 2022 11:45:14 -0700
Message-ID: <CAOnJCUJpTN53fS9Z5BdBJqZvmbsazr1Gk0HZ=iM9LKrfLBcijw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] target/riscv: Force disable extensions if priv
 spec version does not match
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=atishp@atishpatra.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 13 May 2022 18:45:32 -0000

On Wed, May 11, 2022 at 7:46 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should disable extensions in riscv_cpu_realize() if minimum required
> priv spec version is not satisfied. This also ensures that machines with
> priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
> extensions.
>
> Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> device tree")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f3b61dfd63..25a4ba3e22 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -541,6 +541,40 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          set_priv_version(env, priv_version);
>      }
>
> +    /* Force disable extensions if priv spec version does not match */
> +    if (env->priv_ver < PRIV_VERSION_1_12_0) {
> +        cpu->cfg.ext_h = false;
> +        cpu->cfg.ext_v = false;
> +        cpu->cfg.ext_zfh = false;
> +        cpu->cfg.ext_zfhmin = false;
> +        cpu->cfg.ext_zfinx = false;
> +        cpu->cfg.ext_zhinx = false;
> +        cpu->cfg.ext_zhinxmin = false;
> +        cpu->cfg.ext_zdinx = false;
> +        cpu->cfg.ext_zba = false;
> +        cpu->cfg.ext_zbb = false;
> +        cpu->cfg.ext_zbc = false;
> +        cpu->cfg.ext_zbkb = false;
> +        cpu->cfg.ext_zbkc = false;
> +        cpu->cfg.ext_zbkx = false;
> +        cpu->cfg.ext_zbs = false;
> +        cpu->cfg.ext_zk = false;
> +        cpu->cfg.ext_zkn = false;
> +        cpu->cfg.ext_zknd = false;
> +        cpu->cfg.ext_zkne = false;
> +        cpu->cfg.ext_zknh = false;
> +        cpu->cfg.ext_zkr = false;
> +        cpu->cfg.ext_zks = false;
> +        cpu->cfg.ext_zksed = false;
> +        cpu->cfg.ext_zksh = false;
> +        cpu->cfg.ext_zkt = false;
> +        cpu->cfg.ext_zve32f = false;
> +        cpu->cfg.ext_zve64f = false;
> +        cpu->cfg.ext_svinval = false;
> +        cpu->cfg.ext_svnapot = false;
> +        cpu->cfg.ext_svpbmt = false;
> +    }
> +

This will not scale in future with new extensions in the next few
years. We probably need to make more intrusive changes to tie up the
min_version for extensions as well.
A brief look at the "Property" data structure and couldn't find an
easy way to do it.

For this patch,
Reviewed-by: Atish Patra <atishp@rivosinc.com>

>      if (cpu->cfg.mmu) {
>          riscv_set_feature(env, RISCV_FEATURE_MMU);
>      }
> --
> 2.34.1
>


-- 
Regards,
Atish

