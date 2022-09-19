Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaQaA-0007Lj-VN
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 19:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQa9-0007LM-8M; Mon, 19 Sep 2022 19:53:45 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQa7-0007gq-J0; Mon, 19 Sep 2022 19:53:44 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 d64-20020a17090a6f4600b00202ce056566so9003158pjk.4; 
 Mon, 19 Sep 2022 16:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=023v+flDMWxN5iQA52EL9wQAhhagAs5eVB4gEFRAT78=;
 b=R6J9VfsySnI6dTYCCLHoZyE5IGCoA9jeS9M7+1gyYLbDXySTGRCD0kwjJmYySFZNhC
 xvdamVWzIdDCYufkWuQuGBYeqqJ3S1zOSmUGUBykfRWcM4mByUPIJVlVXn8JfZOn3WK0
 p6x2Pk1AXdLRXxw732pEtBXxVRsUrTZtlVlV9cGoMeY+AeJAdJx9KGBGUh//fe7e85cx
 J3MNl4gyaklC5T1Gz3u1CqZ3hXeLROEJDJIA7l3hlAy+ogiwmeJGs8s6x79968+fGeO0
 7BRU9cUSS7DM5ayiMqmbOycKaSnSSDaeTREOfb4GHPctlrilASR3A+0iJoqrAFi0XR0I
 4UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=023v+flDMWxN5iQA52EL9wQAhhagAs5eVB4gEFRAT78=;
 b=V8mwqWcS7InAVYyNgcbX+El/Mv0gQcXJ2Z8zPrBEupvinTC+F6WLKW+tXx5nK7SBv8
 nzWedXEMfrH5mgbfKOokjca7jN+mA5SA6PedXaW5IwXUCUOueizBwLwlgxCH52kWApZN
 oF8C16fqlhDZz+oKhNNkCQBPVFyCREVxAF41RpzsP4/CLn6ai6n6RK6PNeGbg3KBVCpt
 Eg8ii1rZlPHQDEMh5njd62orQXCwqAnkVz1+jIcEqqY0ovxtISj3yPomBetopo7AYRZ1
 6Rwopg5uP2RzfxugkdfveJv1WHhrOf3ZusORWBhW5sFn6aoMWBetp4EzYUcfdAefM5nl
 kKCg==
X-Gm-Message-State: ACrzQf2hUUwJVAbGvNub5cBaOm5CID8ehweDen6v1YEGA/xO+1IN0nxn
 H/TRgXAHTh1bNaGRmfq/JN7hl6qBcvpPmVPzzLs=
X-Google-Smtp-Source: AMsMyM6d8rjyJctMPF9JFP4K4W5f3WzOTtmxzJPxZdoPdYG2wO7t62Rj6uZ3MqJyNUVSOknO1IK6jnR8oJ8WGlw3ZpQ=
X-Received: by 2002:a17:903:32c4:b0:178:5206:b396 with SMTP id
 i4-20020a17090332c400b001785206b396mr2177261plr.99.1663631621627; Mon, 19 Sep
 2022 16:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220918083245.13028-1-frank.chang@sifive.com>
In-Reply-To: <20220918083245.13028-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Sep 2022 09:53:15 +1000
Message-ID: <CAKmqyKPafB1vMPiXAR20mHqCm0jn6Fs1_7RfGx6O2c=v8ftpFw@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Mon, 19 Sep 2022 23:53:45 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

