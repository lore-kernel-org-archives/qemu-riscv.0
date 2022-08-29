Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oSbht-0006dI-1D
	for mharc-qemu-riscv@gnu.org; Mon, 29 Aug 2022 06:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oSbhn-0006cJ-Cz; Mon, 29 Aug 2022 06:09:19 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oSbhk-0005H3-Vk; Mon, 29 Aug 2022 06:09:18 -0400
Received: by mail-pf1-x433.google.com with SMTP id z187so7676732pfb.12;
 Mon, 29 Aug 2022 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=L9wpdVxrU6BuNpPe8FLpUVcWDDtBwsSMsamdTm5Jl34=;
 b=E6DXsuZfPVI+FlKNtSFL6zE61dn3PVGR/VAh2+DwEEv4dULavAeSX1uUm+R/4HHITE
 fUdEjd4OOBFVNs2BafUedORS7pN+60mW+HItxpjLaGBxhLxm4QnMS8KEXbkjZ7AOkVd/
 vfglGHla3rDCTQjLs4HDvSUVnMIk5e8PEbmnXUyV7AIwzhs9PdzEYV2PRxfwL2pkH4Hr
 huP8Nm0WMRw13+JFFXFZjF9UdLVsun6d3no5iDoPW5QwRu5xQYTx2jJ0EcWk6SrALxup
 LzKSFDAJYoGwDa9r4/b0jp2svIfUya4R7GHNAYpAlOm+moCLQ+Dn+pA9Ema50QIfR2vg
 ZKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=L9wpdVxrU6BuNpPe8FLpUVcWDDtBwsSMsamdTm5Jl34=;
 b=NGPiWWP8pl2NXJQEBzE6sAhemarkdTie1cXJ17POw1yFr9Yh9ID937NL2olZuM+rqr
 E9P/Ba9qgoPlq5SklzEdKIISL4ggDC9PjDExIS0MSrFZS0v0BMyZlnaSSvPBLgSDKyjQ
 YHh3J+xmBk94sDzvZRgJUKjS4OnqbEsuS3mOCOUohVmO8uaO6fsSx2U1V7LwQRZzrViX
 NPfFF86ToUaAgkH1fG1ZJNz2j1tNq7AJJtjlh9YgEyTyU3bsatYdHUXoLeDPML9vYQcp
 O7wyl77c942AIah56H8se+eSHCU2gedSjAsPnczT1PfIDqocGAVtX3wXriqTH4Xyj7sb
 egfg==
X-Gm-Message-State: ACgBeo0dTSNE1WHuon45l/hHUQLd9fAukfSgXn5DqmnvbVLhVJUYvAlC
 5jBUf6QAnr8LcSgKBnNFKEaQ+pYzBRq6hHIsZzk=
X-Google-Smtp-Source: AA6agR4JcS5jvdNB4l++Dh5iLqBRoNANEomls/BvbYb8XGBSbH/ulwdFJdca4QWd8+5dOV+iWhUp+3YHSReNbirv33A=
X-Received: by 2002:a63:8542:0:b0:42b:4c9a:97cd with SMTP id
 u63-20020a638542000000b0042b4c9a97cdmr13391395pgd.221.1661767754960; Mon, 29
 Aug 2022 03:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
 <20220824130331.21315-2-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20220824130331.21315-2-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Aug 2022 12:08:48 +0200
Message-ID: <CAKmqyKNEH0G0NQuCCXBd-+PcLVG5pYd_krMnaFWV+v4ZJ=0RXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] target/riscv: Use xl instead of mxl for
 disassemble
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Mon, 29 Aug 2022 10:09:20 -0000

On Wed, Aug 24, 2022 at 5:43 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> Disassemble function(plugin_disas, target_disas, monitor_disas) will
> always call set_disas_info before disassembling instructions.
>
> plugin_disas  and target_disas will always be called under a TB, which
> has the same XLEN.
>
> We can't ensure that monitor_disas will always be called under a TB,
> but current XLEN will still be a better choice, thus we can ensure at
> least the disassemble of the nearest one TB is right.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac6f82ebd0..a5f84f211d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -507,8 +507,9 @@ static void riscv_cpu_reset(DeviceState *dev)
>  static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>  {
>      RISCVCPU *cpu = RISCV_CPU(s);
> +    CPURISCVState *env = &cpu->env;
>
> -    switch (riscv_cpu_mxl(&cpu->env)) {
> +    switch (env->xl) {
>      case MXL_RV32:
>          info->print_insn = print_insn_riscv32;
>          break;
> --
> 2.25.1
>
>

