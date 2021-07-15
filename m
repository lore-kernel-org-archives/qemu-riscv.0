Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3tcb-00086Q-Ch
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 01:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tcY-00085H-G6; Thu, 15 Jul 2021 01:09:15 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:35726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tcW-0003DT-Ju; Thu, 15 Jul 2021 01:09:13 -0400
Received: by mail-io1-xd2f.google.com with SMTP id d9so4989451ioo.2;
 Wed, 14 Jul 2021 22:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OWAXONnNX8s8BQVLZeMMayfMjQ0HyUkVjVy51UJhlJc=;
 b=BWFcv64Hew+mzWSQ0fBGcjiJKxTQ1HIEkcnYstPpJ5WU8PD2AWaMRLIRJXRTNk6SqW
 oyPZrmvbzhVZlBTQ1GM0RyIQOmj/ZniqZbOMUJG+aZi+JTsxKK+gWVh1RkRgGmo+caOe
 CpYHeM23p5ASEzZnzqdbbz71gJk/zy+GP1d4VnzxmTDNC7TktYc7M0c9Img81XS7iouj
 XzNDpvurUIFfh1pZfFQwooId2j20lISqjTzIqVvRt9b6YDQUuzfXaVQBlabwQ7xBJC+N
 bEQ4nK9zPoUqx6QB7X1OJvuz9Vk95+vYcqvefWkUaT4FXay8BdtO2hDKyXec5Q82LNwC
 PJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OWAXONnNX8s8BQVLZeMMayfMjQ0HyUkVjVy51UJhlJc=;
 b=sUSpN0+usqkTJGgyscDAxm70jUrBSbcEXcw9M6JaEZvOmsL2tuFVoFsOIiEpmhdNSZ
 9xAfARdfgeZyV6BZXJHnqkc4BHSV+fgYhMfZG1N8P/87zRUZkBgjhSp47RoNjxAY8FpE
 yqkCdRizinok+2WkGTC38CCQ2zz6I4hPt212zC2JkI2CbpbBOFJMcCwqlk7F1j/RUX7M
 n2Olg9MQIGJT2Vel2/UdbNfAVCgdzrk/UzUBT4Y63RkqXvY1VKLM6EBnRoddZqUipwwx
 e2s85KIEfZ2kZFQfpwhG71xNmfPYvpp6m1qBObpTgrHAwwqIeBc2QnOYIojLstq/QIZp
 Y4UA==
X-Gm-Message-State: AOAM5319OL2LkSrvYAqFCu+nnnANxS8fSP0T6HNjuM3jWdKGtBnG6Pwf
 C6Z6ldoOWXWNxCHkcuWubOKjYoUmp1gGQN6fPOM=
X-Google-Smtp-Source: ABdhPJzVTZVxv9rDX1bcni9oq33xwSAywdBfWtsY6qcSfSOOii+R4gK2MvBV8L3D25OkylqXiYxUxoAb7T54gUEEhoE=
X-Received: by 2002:a5e:9703:: with SMTP id w3mr1658253ioj.118.1626325750985; 
 Wed, 14 Jul 2021 22:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-18-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-18-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 15:08:42 +1000
Message-ID: <CAKmqyKOVVVKCmeZKjOjp3x4OLKhqgbZX0rpfUH_hKj7Uu0Xe7g@mail.gmail.com>
Subject: Re: [PATCH 17/17] target/riscv: Remove gen_get_gpr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 05:09:16 -0000

On Fri, Jul 9, 2021 at 2:48 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is now unused.
> The corresponding gen_set_gpr function is still in use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8ff75a5798..a6c850e9d3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -195,15 +195,6 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>  /* Wrapper for getting reg values - need to check of reg is zero since
>   * cpu_gpr[0] is not actually allocated
>   */
> -static inline void gen_get_gpr(TCGv t, int reg_num)
> -{
> -    if (reg_num == 0) {
> -        tcg_gen_movi_tl(t, 0);
> -    } else {
> -        tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
> -    }
> -}
> -
>  static TCGv gpr_src(DisasContext *ctx, int reg_num)
>  {
>      if (reg_num == 0) {
> @@ -1046,9 +1037,11 @@ void riscv_translate_init(void)
>  {
>      int i;
>
> -    /* cpu_gpr[0] is a placeholder for the zero register. Do not use it. */
> -    /* Use the gen_set_gpr and gen_get_gpr helper functions when accessing */
> -    /* registers, unless you specifically block reads/writes to reg 0 */
> +    /*
> +     * cpu_gpr[0] is a placeholder for the zero register. Do not use it.
> +     * Use the gpr_src and gpr_dst helper functions when accessing regs,
> +     * unless you specifically block reads/writes to reg 0.
> +     */
>      cpu_gpr[0] = NULL;
>
>      for (i = 1; i < 32; i++) {
> --
> 2.25.1
>
>

