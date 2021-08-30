Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKozU-0001G4-7m
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 17:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKozO-0001Eo-Bq; Mon, 30 Aug 2021 17:38:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKozL-0002DI-Vh; Mon, 30 Aug 2021 17:38:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id g135so9713157wme.5;
 Mon, 30 Aug 2021 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lDSOkH5mn6DdJC1CwST/SeEofJ3zNbW76RAbtBqXn78=;
 b=nFJ1SYlkmP9+rR0xljSZ59A1zgs+2668eBuLlbw4PxoiGbX+oEdyJMQSrfZKfa0Oyx
 nze/Wv1HslQbO5Wm+zxT7/aI6qaioq7nNmWdtGjrwkoDzACIWHq/4D0co70wJFrW3ASK
 iAPh6BEFqAsHEaB08s1YQpz6wXxRylRLW/K66/N5KTyAyr2Be++y3B+S9mxsEGt6wEUO
 IrGtQ45p8wufiXU0IBt/wCUCKbhUzwW69leTc5ZhA6gCX34liHJSfIXakSRLvu4Ormcq
 efd8+8EmwVF8ymoNNqfYVFbL+2lHB9qy0tIxUjLRlbB6ftcW7tMnhJY4zWCSK9HZNbks
 DxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lDSOkH5mn6DdJC1CwST/SeEofJ3zNbW76RAbtBqXn78=;
 b=czrCQMJgW2eOKXIuhXedqtXCFWmI9ZRB0RE9v+ezathJ5z8b1t43wuaUz9S3p+dhHd
 87+vNE0D3VqFn04zi0pOf0pAXA9o6rzidsLnt0dwhTiYP8EqEeKOZHMM1G2jTc0Ce//l
 6X+rTGnYAmO4s+IMLWYNPm3UIopJmuFGSKGu4QfuiVPuMsIJg1JWDgCdwpInI0D7yz1c
 b37Oz3dtnIeHm98wxIiHMG2AMmk5APh/P9sRSGQJnWRuHedG6A7QkkWH3FIDoAx/cPAN
 R7XqSx0k2MgFr+INyqpKG8eIMMDnl6Qhe19URM4IKSgwPis5yg8klbqwnyFoMXqby7/r
 5EWw==
X-Gm-Message-State: AOAM532bdbRc6Y5fF5Y1Wr0t771CZIH6MfN615Ew6BM7pcNbzfg0ULd4
 vq1M7k7VbdJfSnnB8rvC59VuUJXCS80=
X-Google-Smtp-Source: ABdhPJxooDtis6eL8zsRCwL4TvXEXKFDiMdwET/4sBnEOAN8/ezuYz1oL6MD0F1JKEGVwyZtyTZ74Q==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr1000850wmc.14.1630359522308; 
 Mon, 30 Aug 2021 14:38:42 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p5sm18208266wrd.25.2021.08.30.14.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:38:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 4/8] target/riscv: 128-bit arithmetic and logic
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-4-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f9094de6-f36a-4da7-d5ef-9fa976ae4c18@amsat.org>
Date: Mon, 30 Aug 2021 23:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-4-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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
X-List-Received-Date: Mon, 30 Aug 2021 21:38:48 -0000

On 8/30/21 7:16 PM, Frédéric Pétrot wrote:
> Adding the support for the 128-bit arithmetic and logic instructions.
> Remember that all (i) instructions are now acting on 128-bit registers, that
> a few others are added to cope with values that are held on 64 bits within
> the 128-bit registers, and that the ones that cope with values on 32-bit
> must also be modified for proper sign extension.
> Most algorithms taken from Hackers' delight.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>  target/riscv/insn32.decode              |  13 +
>  target/riscv/insn_trans/trans_rvi.c.inc | 955 +++++++++++++++++++++++-
>  target/riscv/translate.c                |  25 +
>  3 files changed, 976 insertions(+), 17 deletions(-)

> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 772330a766..0401ba3d69 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -26,14 +26,20 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
>  
>  static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
>  {
> -     REQUIRE_64BIT(ctx);
> -     return trans_illegal(ctx, a);
> +    REQUIRE_64_OR_128BIT(ctx);
> +    return trans_illegal(ctx, a);
>  }
>  
>  static bool trans_lui(DisasContext *ctx, arg_lui *a)
>  {
>      if (a->rd != 0) {
>          tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
> +#if defined(TARGET_RISCV128)
> +        if (is_128bit(ctx)) {

Maybe this could allow the compiler eventually elide the
code and avoid superfluous #ifdef'ry:

           if (TARGET_LONG_BITS >= 128) {

> +            tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd],
> +                                 cpu_gpr[a->rd]);
> +        }
> +#endif
>      }
>      return true;
>  }

