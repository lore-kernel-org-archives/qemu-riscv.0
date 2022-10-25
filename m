Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onAnN-000584-3Z
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 23:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onAnF-0004tg-MG; Mon, 24 Oct 2022 23:40:01 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onAnD-00019w-0h; Mon, 24 Oct 2022 23:39:56 -0400
Received: by mail-pl1-x633.google.com with SMTP id k23so38718pls.7;
 Mon, 24 Oct 2022 20:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6MfBaXYRj/yUo0jfnU1L/WIyBOfKxTAVeTphoys5qXs=;
 b=NVQnDutURozmRF07i5tFCjBucNgu19EWo+FNumPjBq6cpTjlJ7oKG7Pstqxc9cPPCs
 H/5Vk1hxU1EekoG1XZJNqfUl1feVBCCO7z/9rrZIbwnXtJXvtmqzlBJSqSEirW+amGFw
 5skVwqGyZu0R7HyaCaSX5UMpk3NRymRKwDZrg7152LYNaS0PiHB3pIJTt8Z0RfN+qbIn
 pAsh+1xwL/NSX8NZtLQ1VmrjbiHRnan7GewwbQrjXdIWThGX76Ukvf92fqJFDDPluD68
 TeSxTREcoJ5pseF78Vxztteh/F3TwFNBOEYFOTdjQDhnhEptOk5+6R/dHghbAkdePAsj
 uMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6MfBaXYRj/yUo0jfnU1L/WIyBOfKxTAVeTphoys5qXs=;
 b=V0HZ4GF+bvnPq8FDV5l2UnwUvNYPEM6/l+NcrgmlxpoEB/SvJjxWF/CK2xVK0kR/Ra
 uTsYkF7hVQUW9O/SkAPQ0ySCVVTwGYCdOsJio8rvmwFJhv9qI4yUQalYwpBwMnA8llfD
 rFp8rbIp2XjZ6RtOsmaK4L0W1xOpzV9M293u6Q95OChh8YBIdnNDMCP7kN+lx5UxXmw0
 juvl93SO8j5bLbjnUkXpoYM5hbLBTOPugQtMZU1vGd5e4O457xGoAtJEHpM4Wm/MUJ0s
 +yiu0vBGKA2MJrdsKuzjFTPHsad6T2vLxGigYGOg1sf1/UwtFxYyNBPF+Z39dUDoUJxh
 5K/A==
X-Gm-Message-State: ACrzQf1vu4q0znoJYG0BqzNbs1QepXTlxqEXGOZHtuCVBHpfGme3eAuE
 G+DA/X2ly2ka9Nqv4/S4BIb1B5YWDX8Rw4uURCo=
X-Google-Smtp-Source: AMsMyM6C3UOFyCvGEopsA5x5D7RfQQ/m1rls0jWo3qTohpZU7AtS07bQ0+gwtCNhUPLls+iNjNai8UyT/+5AXm98XAQ=
X-Received: by 2002:a17:902:8693:b0:17a:f71:98fd with SMTP id
 g19-20020a170902869300b0017a0f7198fdmr36764803plo.25.1666669191573; Mon, 24
 Oct 2022 20:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
 <20220930012345.5248-7-liweiwei@iscas.ac.cn>
In-Reply-To: <20220930012345.5248-7-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 13:39:23 +1000
Message-ID: <CAKmqyKORk8eDQz-GU0CR9Ch9wmtdB9Fc6EGmPHcgSp9Dsr7bWQ@mail.gmail.com>
Subject: Re: [RFC 6/8] target/riscv: delete redundant check for zcd
 instructions in decode_opc
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, 
 lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 03:40:03 -0000

On Fri, Sep 30, 2022 at 11:28 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> All the check for Zcd instructions have been done in their trans function
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/translate.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 347bc913eb..a55b4a7849 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1087,13 +1087,6 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>               ((opcode & 0xe003) == 0xe000) ||
>               ((opcode & 0xe003) == 0xe002))) {
>              gen_exception_illegal(ctx);
> -        } else if (!(has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zcd ||
> -                     ctx->cfg_ptr->ext_zcmp || ctx->cfg_ptr->ext_zcmt) &&
> -                   (((opcode & 0xe003) == 0x2000) ||
> -                    ((opcode & 0xe003) == 0x2002) ||
> -                    ((opcode & 0xe003) == 0xa000) ||
> -                    ((opcode & 0xe003) == 0xa002))) {
> -            gen_exception_illegal(ctx);

It's probably best to never add this in the first place.

Remember that the extension can't be enabled until the last patch, so
it's ok if we don't support it all in one go

Alistair

>          } else {
>              ctx->opcode = opcode;
>              ctx->pc_succ_insn = ctx->base.pc_next + 2;
> --
> 2.25.1
>
>

