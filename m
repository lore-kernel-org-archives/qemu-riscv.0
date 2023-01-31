Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMuxj-0007PZ-Ve
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 13:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxM-0007Bm-9U
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:08 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxK-0000mC-Bu
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:08 -0500
Received: by mail-wr1-x431.google.com with SMTP id h12so15006389wrv.10
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 10:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yfM6G8FfZOMRFuqk0oCRUG07u5+/at2liHmrKytveWs=;
 b=d+P6jjk/kiArqaKOXHopQeLXjO5WYksG/qb3IIXfpdntdvuRDy2I92QlZxxl40dXBa
 PlIcD0MhtPIOY3cz7NjfxyXY6+rc3UM1jXd4r3pgOtmn2WDJ6mOQc+uNaEN/o7hHIp+g
 2b+CK8yKh8ia2xSJ3pJUPPSZtSW67qiFwZXMRN+Co/AN2/Mlj6CnlgCEAuLtAWmd83i0
 Sc6PjZlMLmIi0EbagPFEOI4xxqaT5d5tGxjDD89zyB03AluBjOUaL0MVkPRtTejUd1Ll
 tox93GfXd7Uujzv6z3IeHmo+Ay/FuXd21ScS8dS9bR7F8vXXQVMpGMaqJiPvSY7scCkX
 HsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yfM6G8FfZOMRFuqk0oCRUG07u5+/at2liHmrKytveWs=;
 b=wTAO5J2TS8SdQ1b317h6hjgX6TmqhUt0vczw1XI+R/AfA0JcSpa9Ziolk0V2V1rlZf
 /7j+qQbl7xtH7X9cf66mnddB7Dn7umauNhGst7agWN2IBON6bT1nFdnU5MQBcF6SltYu
 5rpc0WQPWKTrIohjX6HO6oA6Nai5kG7vzPgRW6NHBH9XT5tJvsyi5/gPm7qvTMJHRSPQ
 OSxCltCponFI2Sn13UkIZROOCIFyi/3JyJr06mQQANhJbekkGSvwa8DN+AUg3bpMvDwi
 2wa/ziuSt82z3ZJUzSnOSYTLfe1ovtkhCW4DfqRZ8wD+n+JZ0CcAT4LFxf5GlFluL5us
 qgPQ==
X-Gm-Message-State: AO0yUKVusuiuSY/e3rOf7Cdsjbvs1QSSkdCkm6ya4BN7iR9B9VGWxAxW
 Y+9dCz6dnq1o3EM6X5NwH+k1TzUrvgQN9qkq4e6F7Q==
X-Google-Smtp-Source: AK7set8VKt45SaRVzHdFljCY8czBkvy5T5RcvVTx8bZ0I6wUFT/zr8wklHpos5xhhC3tbyqYNaPtM9BD5W8a848cRbw=
X-Received: by 2002:a5d:6f0a:0:b0:2c2:8229:be98 with SMTP id
 ay10-20020a5d6f0a000000b002c28229be98mr80770wrb.189.1675188124897; Tue, 31
 Jan 2023 10:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-10-christoph.muellner@vrull.eu>
 <3d864ae7-5430-8db9-f91c-fd24f428b04d@linaro.org>
In-Reply-To: <3d864ae7-5430-8db9-f91c-fd24f428b04d@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Tue, 31 Jan 2023 19:01:51 +0100
Message-ID: <CAEg0e7gJeimurDiuFTWqx4OggJ19zD0-c6xBwZkL3sgFWWWeVQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] RISC-V: Adding T-Head MemIdx extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Nelson Chu <nelson@rivosinc.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Cooper Qu <cooper.qu@linux.alibaba.com>, 
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>, 
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 31 Jan 2023 18:02:16 -0000

On Tue, Jan 24, 2023 at 10:21 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/24/23 09:59, Christoph Muellner wrote:
> > +/* XTheadMemIdx */
> > +
> > +/*
> > + * Load with memop from indexed address and add (imm5 << imm2) to rs1.
> > + * If !preinc, then the load address is rs1.
> > + * If  preinc, then the load address is rs1 + (imm5) << imm2).
> > + */
> > +static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
> > +                         bool preinc)
> > +{
> > +    TCGv rd = dest_gpr(ctx, a->rd);
> > +    TCGv addr = get_address(ctx, a->rs1, preinc ? a->imm5 << a->imm2 : 0);
> > +
> > +    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
> > +    addr = get_address(ctx, a->rs1, !preinc ? a->imm5 << a->imm2 : 0);
>
> First, you're leaking the previous 'addr' temporary.

Indeed!
The real question is of course, why we call get_address() twice...
Fixed in v4.

> Second, get_address may make modifications to 'addr' which you don't want to write back.

Fixed in v4.

> Third, you are not checking for rd != rs1.

Fixed in v4.

>
> I think what you want is
>
>      int imm = a->imm5 << a->imm2;
>      TCGv addr = get_address(ctx, a->rs1, preinc ? imm : 0);
>      TCGv rd = dest_gpr(ctx, a->rd);
>      TCGv rs1 = get_gpr(ctx, a->rs1, EXT_NONE);
>
>      tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
>      tcg_gen_addi_tl(rs1, rs1, imm);
>      gen_set_gpr(ctx, a->rd, rd);
>      gen_set_gpr(ctx, a->rs1, rs1);

Yes (plus the check for rd != rs1).

Fixed in v4.

Thank you!

>
>
> r~

