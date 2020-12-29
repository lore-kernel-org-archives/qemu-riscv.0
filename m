Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ku6Ln-0007lh-TE
	for mharc-qemu-riscv@gnu.org; Mon, 28 Dec 2020 23:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ku6Lm-0007lW-IO; Mon, 28 Dec 2020 23:11:10 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:46248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ku6Ll-00077a-0p; Mon, 28 Dec 2020 23:11:10 -0500
Received: by mail-yb1-xb33.google.com with SMTP id f6so11336759ybq.13;
 Mon, 28 Dec 2020 20:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ziPqZIHhiTUfFM/RX/jLc/afd9xW8lbKzjG4O2ie3Ds=;
 b=kxSfNODV7g1keVP3/5l8io4aF/znspgWKLwuTFjxC1a/Z9t6n2k8NCrO5PIR+pQocq
 /npJ2RPk3NT3V4ooPXEPJGfhDYWde64dw+ocAoqs+otq48cPVj1n59eDak69ReqPjost
 UH1wxn++R+pv7xrqcdnfpZPbzJRwwIFTpFs11fqu63HL3Hxe0mMDEnO8c1ttq6DS0Og6
 CFCyFYbxdkujU+Nfu26hZ/Mi2fArl6ilqstMa2F5c4nIiHw4aTWD8rpIt690oQ/Ru9s8
 eMm+jp29s36naMQHDuyDEG7yCU96tV2w/q9OoHHTsbyX0SI33Os/iqnbyCDnWJQroqPO
 j/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ziPqZIHhiTUfFM/RX/jLc/afd9xW8lbKzjG4O2ie3Ds=;
 b=WJBfWU8EP8CnuYpJpPe95XqaMc4szyoS3V4xyn5wKiOth7XSdjVLta7HR+Tb7kyIQq
 ObDYfpdyK5Qn2UYgfDZp5S/8btKn1CVehPe3cCe9gJTFhyGZGztOGWKxvNsvor2a9erN
 V4+LHABEBnhZEqVuqaG3TMxYwbo1KPpub1ju0LyWvP8KVLL9f3JzwnJgRICRPc30M9SQ
 elLGecSVDLBp5rtvlGR1SW3elhTn6WZDP6D57KVQG9uxKIcofQV1FuQlZkW95RkqtEID
 CB9Wf6jB9NjDHg8Ua//pKU24JG4J2T4zh8+eTlnL3hNrer9SPailxxnsY2sRSKMj1/E6
 zk0g==
X-Gm-Message-State: AOAM530El+wmemXg0Z9dZ1/NFt6Dw8SydNwc0fow5KDB9rGdAYN/rfkN
 RHhKReU+JsAIlNLcltLIfO/2rWHFZX/ARAO2LeA=
X-Google-Smtp-Source: ABdhPJzuT2qaiZ17EZ4zjDq8Ksnvv/DHeRN3nLYXbQtvUkOcr6n3PQLCB+WZDm/7nNgnCqfNy9x0BOHTJAiH409WKWA=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr69584432ybs.122.1609215067243; 
 Mon, 28 Dec 2020 20:11:07 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-DTG1yU-z4SF-+nBeEJUWdx5gctLMSNp8f1+_7FpWG4aA@mail.gmail.com>
In-Reply-To: <CAOkUe-DTG1yU-z4SF-+nBeEJUWdx5gctLMSNp8f1+_7FpWG4aA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 29 Dec 2020 12:10:56 +0800
Message-ID: <CAEUhbmV5oMNW3fS7v81vgB-j0NbAnRnMB-ehm5BT8rk4uWGdYg@mail.gmail.com>
Subject: Re: [PATCH] gdb: riscv: Add target description
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 29 Dec 2020 04:11:10 -0000

On Thu, Dec 24, 2020 at 1:09 AM Sylvain Pelissier
<sylvain.pelissier@gmail.com> wrote:
>
> Target description is not currently implemented in RISC-V architecture. Thus GDB won't set it properly when attached. The patch implements the target description response.
>
> Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> ---
>  target/riscv/cpu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 254cd83f8b..489d66038c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -556,6 +556,15 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static gchar *riscv_gdb_arch_name(CPUState *cs)
> +{
> +    #ifdef TARGET_RISCV64

Use riscv_cpu_is_32bit() instead of #ifdefs

> +        return g_strdup("riscv:rv64");
> +    #else
> +        return g_strdup("riscv:rv32");
> +    #endif
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> @@ -591,6 +600,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      /* For now, mark unmigratable: */
>      cc->vmsd = &vmstate_riscv_cpu;
>  #endif
> +    cc->gdb_arch_name = riscv_gdb_arch_name;
>  #ifdef CONFIG_TCG
>      cc->tcg_initialize = riscv_translate_init;
>      cc->tlb_fill = riscv_cpu_tlb_fill;
> --

Regards,
Bin

