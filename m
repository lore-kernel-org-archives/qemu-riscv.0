Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngdMP-0004ZV-68
	for mharc-qemu-riscv@gnu.org; Mon, 18 Apr 2022 22:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngdMN-0004YN-HM; Mon, 18 Apr 2022 22:12:55 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngdML-0006eT-Nh; Mon, 18 Apr 2022 22:12:55 -0400
Received: by mail-il1-x129.google.com with SMTP id h4so9630580ilq.8;
 Mon, 18 Apr 2022 19:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y4edJMCfgyfm9xk7faGRocyd4eC6y8lhlgia8Be5D08=;
 b=P7SnrgRWWvS3FcWL/mhwraz0wjx+YIlKQWbmvodrabNempDy5sNKsiUP1G3UIylqEo
 nRyUJ2JlZUZHD2XcY0sul9g6o2IMqdLkHMgEAfIvd0Rg4GiQzfKAX0X6vF1aIq4yGAih
 MzJlUdnHO6eWdRjUjtGIXBdRwcFCixtmeoTelxAJewXj8AVgTjvS8OtVP60ydNmg4BVC
 ZVgBjoAZEfomQqPdF+2Wl7Ody6/su9FyT9q+xl/E6GRjA5DBHOgn9U5N38jF8qT2emdq
 wwo7q0f6wv0IUZpSBxjonUQ1olEviTP23LMAbyOWL3nZCdjAlvMGUeDD5Z66Ah+2KesQ
 kklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y4edJMCfgyfm9xk7faGRocyd4eC6y8lhlgia8Be5D08=;
 b=gyF9ofIrHX3U1/ui2YmcUswEsoQsVXYLV2c3E62Stb2G81RWDP6CVlAuMZ+hxNtr8Z
 CjHrXlmKn4DKZRIGaMHs9pszjWK1CH0wnxi+nYV1LdzL/jizV8Qnu7kGKHD61EBgM5nA
 JC9Rnp09rvqbgaqG8jpsJDi73Q8EpmjqAwQguH7SUNNWj92S9zksg5akzcRdFzxe8ilk
 nT6RpSPsrTOzt144lBxerJGUo2DkuMMnygBQn2HXyXc10lhmOJTodjPM+PATt2iEACZA
 wfYayfaZ8QerALWyXZAAClFBLNWEhkvzNuqmC02RG5H5O8jA5H4yr6oQ85s5KpROeool
 Pp9w==
X-Gm-Message-State: AOAM530HmYP0AVSUMtSeuz9QBmz7TngwwEqLRxhFu8Ge2LMHUMWqaWtG
 O2tJX/gd0qm4yKQcDBwumVpJKnABfR49YsZVfow=
X-Google-Smtp-Source: ABdhPJySrCaJLPFzo8liMuvrYvCaeRt3o7CLfo7IfAk7jx4yxHzjLTDDc6StFVXSFA36e25ZtFBp1aAT7sViVaZ8gfg=
X-Received: by 2002:a92:cda4:0:b0:2cc:14ab:ceb7 with SMTP id
 g4-20020a92cda4000000b002cc14abceb7mr4850084ild.55.1650334372253; Mon, 18 Apr
 2022 19:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220414155510.1364147-1-niklas.cassel@wdc.com>
In-Reply-To: <20220414155510.1364147-1-niklas.cassel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Apr 2022 12:12:26 +1000
Message-ID: <CAKmqyKNq+1grM3L4LndO2fPUDGj89kTqQK_sqbeKQeOQKE5UTA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: fix DT property mmu-type when CPU mmu
 option is disabled
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Tue, 19 Apr 2022 02:12:55 -0000

On Fri, Apr 15, 2022 at 1:56 AM Niklas Cassel via <qemu-devel@nongnu.org> wrote:
>
> The device tree property "mmu-type" is currently exported as either
> "riscv,sv32" or "riscv,sv48".
>
> However, the riscv cpu device tree binding [1] has a specific value
> "riscv,none" for a HART without a MMU.
>
> Set the device tree property "mmu-type" to "riscv,none" when the CPU mmu
> option is disabled using rv32,mmu=off or rv64,mmu=off.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=v5.17
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..3be6be9ad3 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -230,8 +230,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> -        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -            (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> +        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> +                          RISCV_FEATURE_MMU)) {
> +            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> +                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> +        } else {
> +            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> +                                    "riscv,none");
> +        }
>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> --
> 2.35.1
>
>

