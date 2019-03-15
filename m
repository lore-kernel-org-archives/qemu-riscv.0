Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4pGY-0006qt-6s
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 12:01:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4pGQ-0006ea-HS
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 12:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4p7f-0005Pv-9D
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 11:51:52 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36518)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h4p7c-0005PC-3G
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 11:51:49 -0400
Received: by mail-pf1-x444.google.com with SMTP id n22so6644002pfa.3
	for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2019 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=uccqaNeddQveea5vF+TE2LQIni6ZGnMwUESMpw+CAD4=;
	b=ZC2IcwK7QU07JXWMEkliV8MxLxbB0XI9PxMeRAddUFJXTVf1Y7/yZZ1882bXlTjLU2
	g9O8CqUfXhSmXvxmUOj1oEOKpxNTScV+rMHXygXB2Tz8lKuDKd4tTxKrII96Go2gF7Y5
	qRBmJys2Q8r2OcUcmqUIeFgT7s4W1l6ICZaE8R8qcBMrckEL5+xwjWQS0atmrmL/Hyh7
	8TcGtMSW+YTnQNqlqjscaOx0BemaWXv0r9NKDS7gXhcbd9++4bOFMAqNbTuhDQDiUbXc
	tLJvMBfIkDFwnu9MZWN7v84qynaci25T/6eNZgjx/6Pw0Mxk2e0JQm7vcsbiL9+XO1Dk
	xNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=uccqaNeddQveea5vF+TE2LQIni6ZGnMwUESMpw+CAD4=;
	b=Qll5A3zg71Fpjy1N/y/bItkCMH0iNV2i9D3reIfPTsku0Yex4Dl1jfdaHz1X+oOxRK
	koVzQ9pyWpH3akC3P/ASuAbS+hEjaGJfNam8+b05IvpKHKVfYEZy4Bwn/Z5El6PVKmMN
	ZbqEeYLx3OH1FoBIjEjyim2gVXBjMCvSXBGuwtFqt42qk3JoV4xpUTcTsrDt56nXyvwv
	gfcXvn5qhZBddFN++uwc5yNOa6zjNPgv/0n3Bh1rsXFvRY8zkvCcz0cafVQYkkkZSkQD
	fBHA/rZTGYmdcUQAwNupNPhR7xyVzbcwouUYBeCHKKooqaAhs0samF4EHAgRNgkCj9se
	3T8A==
X-Gm-Message-State: APjAAAWHYuj4NRJi6QWhH3utIGTnFQuGoLZL1R1730jZ45PabB4ISCZA
	RvgMqPfgDn0pVWxJgkiQXnXORw==
X-Google-Smtp-Source: APXvYqyLCbTIKpNuz6g3QuQoUigc/BfG5yDY/q8qZxZPfAvcGG7UiSKMozwSvKh9yg/LSMvHeRGACA==
X-Received: by 2002:a17:902:ab8e:: with SMTP id
	f14mr4957553plr.84.1552665106484; 
	Fri, 15 Mar 2019 08:51:46 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	v7sm3094067pga.50.2019.03.15.08.51.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 08:51:45 -0700 (PDT)
Date: Fri, 15 Mar 2019 08:51:45 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Mar 2019 08:51:42 PDT (-0700)
In-Reply-To: <20190315135140.10507-1-kbastian@mail.uni-paderborn.de>
CC: Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-063f3d73-802f-4d51-a4a6-31cd013027ba@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [PATCH] target/riscv: Fix manually parsed 16 bit
 insn
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2019 16:00:55 -0000

On Fri, 15 Mar 2019 06:51:40 PDT (-0700), Bastian Koppelmann wrote:
> during the refactor to decodetree we removed the manual decoding that is
> necessary for c.jal/c.addiw and removed the translation of c.flw/c.ld
> and c.fsw/c.sd. This reintroduces the manual parsing and the
> omited implementation.
>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/riscv/insn_trans/trans_rvc.inc.c | 30 ++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
> index bcdf64d3b7..5819f53f90 100644
> --- a/target/riscv/insn_trans/trans_rvc.inc.c
> +++ b/target/riscv/insn_trans/trans_rvc.inc.c
> @@ -44,10 +44,19 @@ static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
>  {
>  #ifdef TARGET_RISCV32
>      /* C.FLW ( RV32FC-only ) */
> -    return false;
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    arg_c_lw tmp;
> +    decode_insn16_extract_cl_w(&tmp, ctx->opcode);
> +    arg_flw arg = { .rd = tmp.rd, .rs1 = tmp.rs1, .imm = tmp.uimm };
> +    return trans_flw(ctx, &arg);
>  #else
>      /* C.LD ( RV64C/RV128C-only ) */
> -    return false;
> +    arg_c_fld tmp;
> +    decode_insn16_extract_cl_d(&tmp, ctx->opcode);
> +    arg_ld arg = { .rd = tmp.rd, .rs1 = tmp.rs1, .imm = tmp.uimm };
> +    return trans_ld(ctx, &arg);
>  #endif
>  }
>
> @@ -67,10 +76,19 @@ static bool trans_c_fsw_sd(DisasContext *ctx, arg_c_fsw_sd *a)
>  {
>  #ifdef TARGET_RISCV32
>      /* C.FSW ( RV32FC-only ) */
> -    return false;
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    arg_c_sw tmp;
> +    decode_insn16_extract_cs_w(&tmp, ctx->opcode);
> +    arg_fsw arg = { .rs1 = tmp.rs1, .rs2 = tmp.rs2, .imm = tmp.uimm };
> +    return trans_fsw(ctx, &arg);
>  #else
>      /* C.SD ( RV64C/RV128C-only ) */
> -    return false;
> +    arg_c_fsd tmp;
> +    decode_insn16_extract_cs_d(&tmp, ctx->opcode);
> +    arg_sd arg = { .rs1 = tmp.rs1, .rs2 = tmp.rs2, .imm = tmp.uimm };
> +    return trans_sd(ctx, &arg);
>  #endif
>  }
>
> @@ -88,7 +106,9 @@ static bool trans_c_jal_addiw(DisasContext *ctx, arg_c_jal_addiw *a)
>  {
>  #ifdef TARGET_RISCV32
>      /* C.JAL */
> -    arg_jal arg = { .rd = 1, .imm = a->imm };
> +    arg_c_j tmp;
> +    decode_insn16_extract_cj(&tmp, ctx->opcode);
> +    arg_jal arg = { .rd = 1, .imm = tmp.imm };
>      return trans_jal(ctx, &arg);
>  #else
>      /* C.ADDIW */

Thanks!  This fixes my simple test case, so I'm going to pick it up for the 
next PR.  It also sounds like it's time for me to start testing rv32 Linux 
boots, so I'll go do that next...

