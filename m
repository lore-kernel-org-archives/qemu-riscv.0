Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf2K4-0003IB-LP
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 11:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf2K3-0003Hk-4N; Mon, 25 Oct 2021 11:55:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf2K1-0002tX-LZ; Mon, 25 Oct 2021 11:55:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id a16so12462280wrh.12;
 Mon, 25 Oct 2021 08:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=grQpYbY8FpA8WtajKuIYBhdSAcwV06N9HikJE1gLSYQ=;
 b=CGoHJvYx/hTUwthL4wP8d7lY+gJtGEyzpi0+VNj9nNithgKYztb5FWCM4kb39YT8Dh
 QOdYsRXvdhbUiUKbaLrFmUgk/L3OXKppaM6VYJ+dNVaIUm/KC0uPUweQUIiu6QZmpgQp
 kh16jgZ6MHt44Hqg6b855NibXJabF+eu0KIZlGwFgYNzbG7+a689ShCISjmvrswMx0lk
 ENmWjULBhq0rs2eZFOjFCWl1ZEx1qlaIX90SiweIPqC3JKLwTPDIF4S3zsBNj2bYmy7g
 YkZcMVgqGIA+Ilfo/VBRRcogPxudIcrY6KouAlT1ojvLteaBtPrgUfFxrdji5IkOdZRH
 Z0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=grQpYbY8FpA8WtajKuIYBhdSAcwV06N9HikJE1gLSYQ=;
 b=bC1dZlyjPGj8i6dDVaXLjzc3vVSx2s96RHTvehSgzg9DjHKJYICYKtAAiaaQ6aPeH/
 R58CqOWO9bYkSkymc8BDBlun6jqll2/Zx3Tkmwpk+Ym2WJ5VDiErISLTyZ5HXiT+YddJ
 4I9YrqxHYFGL4SoIaiPSNB0KMKKCXNZAhogBbgxrH8VAhp+363WoX/kc5S70X54b8H9L
 hqqqIFu3T691q/Qg5ktCA6SSsuuVpYyiT7P3jbwP78UDZvBXpLqu3TemH8ktelBPtA0v
 Y5V2d0GEdueARLvd3fcTxDcvgxDYjSVDiW+LcxO3Xo7PE28Rwjj0XTwMYwAq/NBz3aLn
 X2gw==
X-Gm-Message-State: AOAM531lyT5kJHo5gYX12B/UEba3EJ88j6PbtZFOtxHZo/bqB2RHuTv3
 UNwwyY2DfK3IZY+FEzYSuFE=
X-Google-Smtp-Source: ABdhPJwQ2SR9SZu9bvI/ufyijB5JrSOwRUKMsYlzKwZ1DQQWjmloe/DgbFPcD7/WawL2mC91k5dDqw==
X-Received: by 2002:adf:eece:: with SMTP id a14mr21293292wrp.79.1635177334560; 
 Mon, 25 Oct 2021 08:55:34 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z135sm21872276wmc.45.2021.10.25.08.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 08:55:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <736b66fc-6109-0c26-7faf-3bec9d065c3a@amsat.org>
Date: Mon, 25 Oct 2021 17:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 05/17] target/riscv: array for the 64 upper bits of
 128-bit registers
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-6-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211025122818.168890-6-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
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
X-List-Received-Date: Mon, 25 Oct 2021 15:55:39 -0000

On 10/25/21 14:28, Frédéric Pétrot wrote:
> The upper 64-bit of the 128-bit registers have now a place inside
> the cpu state structure, and are created as globals for future use.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>  target/riscv/cpu.h       |  2 ++
>  target/riscv/cpu.c       |  9 +++++++++
>  target/riscv/machine.c   | 20 ++++++++++++++++++++
>  target/riscv/translate.c |  5 ++++-
>  4 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a33dc30be8..f6d7a1793d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -109,6 +109,7 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
>  
>  struct CPURISCVState {
>      target_ulong gpr[32];

#if TARGET_LONG_BITS > 32 ?

> +    target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */

Shouldn't this be uint64_t?

#endif

>  /* global register indices */
> -static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
> +static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl;

and TCGv_i64, with ifdef'ry?

>  static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
>  static TCGv load_res;
>  static TCGv load_val;
> @@ -749,10 +749,13 @@ void riscv_translate_init(void)
>       * unless you specifically block reads/writes to reg 0.
>       */
>      cpu_gpr[0] = NULL;
> +    cpu_gprh[0] = NULL;
>  
>      for (i = 1; i < 32; i++) {
>          cpu_gpr[i] = tcg_global_mem_new(cpu_env,
>              offsetof(CPURISCVState, gpr[i]), riscv_int_regnames[i]);
> +        cpu_gprh[i] = tcg_global_mem_new(cpu_env,
> +            offsetof(CPURISCVState, gprh[i]), riscv_int_regnamesh[i]);
>      }
>  
>      for (i = 0; i < 32; i++) {
> 


