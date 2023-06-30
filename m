Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3776EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 09:58:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFAt4-00020o-40; Fri, 30 Jun 2023 05:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFAt3-0001z2-5M
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:57:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qFAt1-0005Lc-Ir
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:57:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3112f5ab0b1so1847632f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 02:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1688119073; x=1690711073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L4uwiSUewUua+vEPVN9aG5KA5Tln3IEYv5TjqCBdMZM=;
 b=dMCMzqpB1XfZy2/d8huk8ww+9bNliro+5ZvvZ0CX4GGpmEpeJO2qta7lnlq1y7FwJD
 +wHnptCmd/O0B3r3UY+kpJBuDGDjCzMFPceaAPQRRXKnJR13F9j1ZWcspTuwWb7kkEqB
 aBK7Vj/tRTBP4eg5a9m9B2UkfUAWx1/CyG6HiEGEXSpiGKvQNG0djDRGU/EeSZwyFASK
 TJjpnsjfEu1CwObaZGOBNYBjzDEey4iZ1lcr4tBA37/qZ0Q4xYP9q6W4kKZta5f4az9L
 QRSnuaWW92h1V+YG+VcbvEfdMUZimWVMs0gR8rnPOXZsStUKbFU52j5XwG1ucpMO+U+j
 0GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688119073; x=1690711073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L4uwiSUewUua+vEPVN9aG5KA5Tln3IEYv5TjqCBdMZM=;
 b=eaGFIkG61S8pAZpn2FrvpjIQlVd62reZEbPr1go+DGwlLlqPdAzgAwTmjgUBneqDkt
 hEocsV460mTxC55XzGfBgQcxIDmzR5JtYWOUMlX7FXeFnOVg57qFlfwMt9TABf9pfrWP
 TSeWp+Q5df4v/Wwh9IOZcq5j9E6X8886ozl/X9NS/t/muSQKv986zr3npheyfpp2fA37
 65gN8FN6EBj9s+9aBTpQDuU7aFZpt1PMxOsvSsX/MhBwLF+SAxgG8IuXklowR5n7ax3B
 TBdwR9MMiFTDDES1JsO95mgpTnTKgqmNzVeqKI8C7dS99q9dY9dRiRkrH0dFFUdj792U
 HCqg==
X-Gm-Message-State: ABy/qLa+2LDyL+yBbbViT0NhflFKFVZHeb92Y4nZn1/st98Idomv6dSW
 8K+5jV4y9Yd7hawDYKDHuoIexFmE0AeIkSqxOuHDuQ==
X-Google-Smtp-Source: APBJJlHjCteSUtm3jnDfnmT5ydtjY7ors6AHwN3sXFZ/18urhUDNTRlVV+aUjTap2e2b6Y7oOF8O+WnbZzBNKEulDtw=
X-Received: by 2002:adf:f786:0:b0:311:180d:cf38 with SMTP id
 q6-20020adff786000000b00311180dcf38mr1810959wrp.24.1688119073536; Fri, 30 Jun
 2023 02:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230630091303.1676486-1-christoph.muellner@vrull.eu>
 <20230630091303.1676486-2-christoph.muellner@vrull.eu>
 <1c8f3c84-60ba-abd8-f1c0-2bb85ed47399@linaro.org>
In-Reply-To: <1c8f3c84-60ba-abd8-f1c0-2bb85ed47399@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 30 Jun 2023 11:57:40 +0200
Message-ID: <CAEg0e7gfPNGL9YCf5hEY=4+8bhW1P841mn-RGarffbQGUbS34g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] riscv: Add support for the Zfa extension
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
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x432.google.com
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

On Fri, Jun 30, 2023 at 11:53=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/30/23 11:13, Christoph Muellner wrote:
> > +static bool trans_fli_h(DisasContext *ctx, arg_fli_h *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    /* Values below are NaN-boxed to avoid a gen_nanbox_h(). */
> > +    const uint64_t fli_h_table[] =3D {
>
> static const.

Sorry for missing that.

Thanks,
Christoph

>
>
> r~

