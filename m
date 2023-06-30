Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B14EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 15:12:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFFn0-0002W6-Sw; Fri, 30 Jun 2023 11:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFFmz-0002Vw-C3
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 11:12:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFFmx-0008Hl-Qf
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 11:12:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-307d20548adso2268864f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1688137917; x=1690729917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tbRcyg8cNGouviW+Ll+q5hjfS+M0jFMgKKLKhtNu9c=;
 b=RgpZsA9OaM/HumdL1S8HNdaWqbGUxox5/29oBt2SILZHU0e8m/CyIQCYJtxCGleIoM
 pB1tDrVPCwgLWdHGZxxZ/Q2VCZK11/OfC4jF9+yxLPpivOIkvwkW3Sc0sjUHboY9baY6
 vc7FQ6HS55Qu3g91vBkCFUPSvLOdqIM15kj6Xo9lFQSeWKhuUWkrjwvuyWW2P0DC71dI
 dQPPeu+q044MHjTQ1dtZCpVlRkLdtMV9BzqLpz5N3mzBHUusNtagTSVohBw4ghrVPEZS
 yYyAURRnSSHesdl6Dv3BxGbZBbMH7Hz+z22CWKdhiwDYLzWNFdGfvrAToAMH7+EeuC2B
 dzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688137917; x=1690729917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tbRcyg8cNGouviW+Ll+q5hjfS+M0jFMgKKLKhtNu9c=;
 b=Qb1PXeFhDylorsmpXBUDEZGY3x9lmMMLaqd/UWN/H8CCy7YJJtwPx+JSQ0vZhK7hfb
 ss4OKsJ++4HxKfVcMtdcwtUNScF+Mut2ZIOYDh4mfqsURxIPSYz7kLYyD9Rj8moGXE+2
 Yo6rkjFug7c8ylVw4fZOjLvl6zFUVGu+Pbw8GmBNLywCVNP+vwvlu+oh8RRrBMYCS/Nt
 DNjZq52BJfF2X0qcpViByTsxCTMA0YvyzZefQFzvxn3fPFgdFhObn6yZKf5UPd++NYU0
 cPBlmEzqv33hXQr+n9qfGw0SzmrqbS5X0qz7BFaxkcjcUOajnbQeXga95BELR7MG3aVg
 4XNw==
X-Gm-Message-State: ABy/qLai5euUT/ZAOQbIXTB0UxK2wM/LaQ12q/deGAwswaYNAzbz7e0V
 R922oGC9M+tbql+CPKLqL93mTLk2TsIbhvDPgO+5uQ==
X-Google-Smtp-Source: APBJJlGH6ZWJFx+RKZrGMyd73o+fmkBpx1gzEXYYgfz/uDrTIYUnEgxPy9crqNi0iK7XfVlRYncQ4zmBd0OhB8XsW2s=
X-Received: by 2002:adf:f049:0:b0:309:1532:8287 with SMTP id
 t9-20020adff049000000b0030915328287mr2609760wro.19.1688137917317; Fri, 30 Jun
 2023 08:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230630115239.1920012-1-christoph.muellner@vrull.eu>
 <55279432-e4fe-7309-ac6f-5e2a4b86f47c@linaro.org>
In-Reply-To: <55279432-e4fe-7309-ac6f-5e2a4b86f47c@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 30 Jun 2023 17:11:43 +0200
Message-ID: <CAEg0e7gsUNj=PmvvVDNTH+jc63sqrRBK_UiT0AEHMWGpYOjGfw@mail.gmail.com>
Subject: Re: [PATCH v5] riscv: Add support for the Zfa extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, 
 liweiwei@iscas.ac.cn, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Rob Bradford <rbradford@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jun 30, 2023 at 4:03=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/30/23 13:52, Christoph Muellner wrote:
> > +bool trans_fmvh_x_d(DisasContext *ctx, arg_fmvh_x_d *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +    REQUIRE_32BIT(ctx);
> > +
> > +    TCGv dst =3D dest_gpr(ctx, a->rd);
> > +    TCGv_i64 t1 =3D tcg_temp_new_i64();
> > +
> > +    tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
> > +    tcg_gen_trunc_i64_tl(dst, t1);
> > +    gen_set_gpr(ctx, a->rd, dst);
>
> I think you would prefer
>
>    tcg_gen_srai_tl(t1, cpu_fpr[rs1], 32);

sari_tl() will not work, because cpu_fpr[a->rs1] is a TCGv_i64.
So I need to use sari_i64() and keep the trunc_i64_tl():

    TCGv dst =3D dest_gpr(ctx, a->rd);
    TCGv_i64 t1 =3D tcg_temp_new_i64();
    tcg_gen_sari_i64(dst, cpu_fpr[a->rs1], 32);
    tcg_gen_trunc_i64_tl(dst, t1);
    gen_set_gpr(ctx, a->rd, dst);

Thanks,
Christoph

>
> so that dst is sign-extended to begin, instead of zero-extended.  You don=
't see an error
> because gen_set_gpr, for MXL_RV32, sign-extends the stored value.
>
> However, the tcg optimizer would elide the second sign-extend if it can s=
ee that the value
> is already sign-extended.  So this could reduce to 1 operation instead of=
 2.
>
>
> r~

