Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaQJQ-0007C5-6q
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 19:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQJO-00076l-GI; Mon, 19 Sep 2022 19:36:26 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQJM-0004w5-R3; Mon, 19 Sep 2022 19:36:26 -0400
Received: by mail-pg1-x531.google.com with SMTP id 3so833232pga.1;
 Mon, 19 Sep 2022 16:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=QiKzRIW8eTfYcKBbsDOwF8P6Z3t6EAph3xsqRVqXJsQ=;
 b=JEBz2uTCaaRQJcasQFbGo1eMY58xgTBiGCnHDBJDY6SxCIZcpHkB00ZiZCmlRlIUdC
 X4tDnisE3NB9U8mVeMvs4owW6CK3mlRW+eY+jbt7WYWooXBuwuPhjiTcOMNZv78vME6H
 RflfXD9W4Ljgp9fhRdBGkNKpWuMDBYbkBEapM69ig37+uxFiWaicLf5K8zLwRcyjNEv0
 t4HNo3McDacInWMjTlS4QsZnwlIifZwGu0r9xeWNDGdzo9aVwh3Ej/XVJ3xvDGCrqetr
 0jcVuaknRB7cgxxbs2N9ryQBik5k4YsjSAjHb8LlWkLDKueqwUVpxzsk0zE/vZyn18iD
 HlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=QiKzRIW8eTfYcKBbsDOwF8P6Z3t6EAph3xsqRVqXJsQ=;
 b=sVd9YB1IYFQ3aghIaEvNeZARAZ9gMMuTD2Y4h7DaaFfKSci6HoaLzutZDrU5xygqZa
 QBm9U9PtB2fuOMsFJ+uW/qBNTpW+7hcE+Z737zqgRt8AhCEW2uSWhBkng6MciQBh4Eal
 hnYw3WX5IRX3nPpP/X4NOULfkiJ7PxJGPXoxUheU1OO1aY3rVck82voP2qQnYOH3zWpn
 iTo2SAN51uSUPMEGl+T2xaajjzyjAOaaltR/3pHjkHh5uEqxVD/jnw1Umde1hXGwpXlL
 nDW5MLfUduNAMT0BdI+1vCxj9H+L6qNvuFR11+CrSijqphQua1RsYNu79NCmICl2gYzR
 8ncA==
X-Gm-Message-State: ACrzQf30xYGrJ+tXB99/pPIqlkfceb/zsDGvUkDaUMV8sfeOCzKYZvRa
 N/Yhlky4m8Es8TvhP3ceaGvdR0yaM0bRt1LlC2/DnVc06fs=
X-Google-Smtp-Source: AMsMyM5zhUmxU8iiMrPZBkXwCJN/BIrn7D7o3K47Uvy7lAdsb9qUqkenl9cWWdmb01cix9P1SYHgnGeC0x4np3RLuoQ=
X-Received: by 2002:a63:db07:0:b0:439:2e24:df01 with SMTP id
 e7-20020a63db07000000b004392e24df01mr17694235pgg.221.1663630583217; Mon, 19
 Sep 2022 16:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220918083245.13028-1-frank.chang@sifive.com>
In-Reply-To: <20220918083245.13028-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Sep 2022 09:35:56 +1000
Message-ID: <CAKmqyKPvN-PaN9j1dfaAy=QrkkjnC0Gy7vzULNoNL4QsUG3CLg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Check the correct exception cause in vector
 GDB stub
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Jim Shu <jim.shu@sifive.com>, Tommy Wu <tommy.wu@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Mon, 19 Sep 2022 23:36:27 -0000

On Sun, Sep 18, 2022 at 6:29 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> After RISCVException enum is introduced, riscv_csrrw_debug() returns
> RISCV_EXCP_NONE to indicate there's no error. RISC-V vector GDB stub
> should check the result against RISCV_EXCP_NONE instead of value 0.
> Otherwise, 'E14' packet would be incorrectly reported for vector CSRs
> when using "info reg vector" GDB command.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Tommy Wu <tommy.wu@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/gdbstub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 9ed049c29e..118bd40f10 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -211,7 +211,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
>      target_ulong val = 0;
>      int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
>
> -    if (result == 0) {
> +    if (result == RISCV_EXCP_NONE) {
>          return gdb_get_regl(buf, val);
>      }
>
> @@ -238,7 +238,7 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
>      target_ulong val = ldtul_p(mem_buf);
>      int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
>
> -    if (result == 0) {
> +    if (result == RISCV_EXCP_NONE) {
>          return sizeof(target_ulong);
>      }
>
> --
> 2.36.1
>
>

