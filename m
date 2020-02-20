Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4qsp-0000UZ-LI
	for mharc-qemu-riscv@gnu.org; Thu, 20 Feb 2020 13:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j4qsn-0000OH-4P
 for qemu-riscv@nongnu.org; Thu, 20 Feb 2020 13:49:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j4qsm-0004p9-49
 for qemu-riscv@nongnu.org; Thu, 20 Feb 2020 13:49:09 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:45988)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j4qsj-0004mA-Kw; Thu, 20 Feb 2020 13:49:05 -0500
Received: by mail-lj1-x244.google.com with SMTP id e18so5278409ljn.12;
 Thu, 20 Feb 2020 10:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=71TT2HpdSHLsDhX9J/G2ZIHBB+dHYvP1+1iIDro8cH4=;
 b=SM4iNG8hPNBALFGOsFKyC9r0Hq9S7V0LGNn96OVqtOt5zONcMcqECWt/GgI2bQ1q1C
 Q9t7zy74RvM7EmoSTa5lTHj8M3WcQE1431rIunJs7wb4uRE1W414GhPhHgCfxZGVmuCg
 suuNemisXcmhKFoZk6IBlRWe+KtbueKv3iRq1jFek+ttviyBO4FYRpBjYA03Fim31R9I
 SsKiJ6f1RRPak15QxGtvaynM1ZP3YW9rUnlfaiy/dXZCxpUMrwFAzuPh0YehUwwSD8qF
 XW4NISPWCJ33IjZSUe50c5uD/v0pGdotBbD6AKZEkH/9hMZ4FYN3WmQoTnbpMzXroBlB
 ZFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=71TT2HpdSHLsDhX9J/G2ZIHBB+dHYvP1+1iIDro8cH4=;
 b=nBWtvJGTSdiWjGXeHbjk0YXfhOJzxibuDi7u8VZYQ58bNSMTmlQQP0UchQnL79iScE
 T4kzSE1bDMVTVRBwiyGKBpoR+HRk+xHZR8fOxhyRJzJR44k4WFft160tbxRjihcf0cgW
 rXdLPj3ffWetU/8V7WPV3+lJCNdm5aK7/ixb/kYRsnOPtydiOxM0dBowa2OICxXg73Yz
 wUIqDz3I4jzPIXqa9v7x1EMXR5xUMjpzUQVvkQbjqauNKAd3XlQGs7qxaXnQ7KPBEh39
 7mHh+1WW5B6rz8ggaFCSEM9UdiKk+G1VReZKVfveDwiX427F9s0+UpMcqZ/Gko4kLh5i
 XLoA==
X-Gm-Message-State: APjAAAVaN4tZFjRDK6bPAZYcgFC4KFJYsU6PeYWKOoZL4oAfKDQONKh5
 HrSsfnBsZ2wrKJWnRAkEv+dn14fTTURLzzoikg4=
X-Google-Smtp-Source: APXvYqwlFnd3DphkB9k9WTNmuFgtbussvdoLKY2UTBPmDdcYa07uvu8/Z5bRIFsZ87Vx/zhkWYbWx6bYQb8kf6fWvuQ=
X-Received: by 2002:a2e:7609:: with SMTP id r9mr19668707ljc.238.1582224543639; 
 Thu, 20 Feb 2020 10:49:03 -0800 (PST)
MIME-Version: 1.0
References: <62fcfe747245cf8edcabcbe8f1f0b59be035fad6.1579584948.git.alistair.francis@wdc.com>
In-Reply-To: <62fcfe747245cf8edcabcbe8f1f0b59be035fad6.1579584948.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Feb 2020 10:41:35 -0800
Message-ID: <CAKmqyKPGJQMqW7ZbWBYRDUxH_PRRSvUW6tEwBAdW+MTE-RG5+w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv: Correctly implement TSR trap
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
X-List-Received-Date: Thu, 20 Feb 2020 18:49:10 -0000

On Mon, Jan 20, 2020 at 9:43 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> As reported in: https://bugs.launchpad.net/qemu/+bug/1851939 we weren't
> correctly handling illegal instructions based on the value of MSTATUS_TSR
> and the current privledge level.
>
> This patch fixes the issue raised in the bug by raising an illegal
> instruction if TSR is set and we are in S-Mode.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

@Palmer Dabbelt  Ping!

Alistair

> ---
>  target/riscv/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 331cc36232..eed8eea6f2 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -83,7 +83,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>      }
>
>      if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
> -        get_field(env->mstatus, MSTATUS_TSR)) {
> +        get_field(env->mstatus, MSTATUS_TSR) && !(env->priv >= PRV_M)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      }
>
> --
> 2.24.1
>

