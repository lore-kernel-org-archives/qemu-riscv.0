Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EDEC47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:11:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQmlX-0004iV-Lt; Fri, 19 Jan 2024 06:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rQmlV-0004iC-3E
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:10:26 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rQmlS-0001uM-Rm
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:10:24 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40ea01d55c2so2038275e9.2
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705662620; x=1706267420;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/wGIT8NXzRH5LlBb4BREsrIlcxlw4u7x6IDyg+b7lMw=;
 b=r4PJY6OIbedCEL3aIKeGU4zZCB15Fy+YlsI3U2tcQECyVucVOYStHWSD3SQcsvZZMp
 hXIpLVdnf16l+FHTsucpwDVKGuRZLOX7xq1+9Yi8PzwJQ+cvh0iKrQfgrqjXadiKQFWw
 FZCNR4LYPrYoJtLky5PTmq+EYfDWsNh3w4nYl+KnF38IdsHI3Osy0YiYP/Upp6jEQtoK
 gCKfSoPBd4NB91dn/TFiyYNG2YLXbyfk0gKOMsUI5t3w0JrbYimiI7SEhIDFxbFzfvXs
 hN6f6xyYzVRBago4YEmnACdXKXMDIbi6EDsk6zkwBkXHpEmWZDYwl8w/DVOVHIPKFDL4
 77Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705662620; x=1706267420;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/wGIT8NXzRH5LlBb4BREsrIlcxlw4u7x6IDyg+b7lMw=;
 b=s3GErwBdto5THMSIaQwcwCtS/qbMk2HXL5XHB/sw/vHB96E6+tdlda9a9y3VghhjD3
 QleDcu7BECXb5MidLjxFJjJJpKNlznJX3BUxNbu9iYw+XuRTJSgsA5yr/DuM4E+OkE+y
 XSoLqV07iudjFrk9+6hujBs1QFjB9LzLFD/jwB+6JG/n2HPinqOLcyFFhStmO3sTIVUS
 rl9XW0SXc2nBjC+YfmF8C6QdtkgBNQoWGVVAqY1ScojnTyLkw7SJpChI8GzVT6IAI45p
 ZZlG7WLykM3VW4h053AhkR7j3/ryNSqa4SeunRp7Bwojdm1pMD5MqxYwjiuPR7UGD49Z
 QlLA==
X-Gm-Message-State: AOJu0YwqUmnQP1xRh7kXxyhFStnSuk6CrBciPanzK7bdjor6NimL8p85
 NReMuQdn9B5t3fkOKZk+p5K0hrb0oQa05Ki5ureI8EZUTzHWSygBCeJrKKA1Lv8=
X-Google-Smtp-Source: AGHT+IEwm9s/vMYlC7oOy9NvMVtgLHuOG+5SdO6i2D34pJxn93Dr/LGcB+uTX0K+eL4S8INcOeurTw==
X-Received: by 2002:a05:600c:b46:b0:40e:4832:acf7 with SMTP id
 k6-20020a05600c0b4600b0040e4832acf7mr1338034wmr.150.1705662620424; 
 Fri, 19 Jan 2024 03:10:20 -0800 (PST)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c470400b0040e5945307esm28853093wmo.40.2024.01.19.03.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 03:10:19 -0800 (PST)
Message-ID: <7aeede04d908c98e4bc228247ef23d959ee2949b.camel@rivosinc.com>
Subject: Re: [PATCH 2/2] target/riscv: Check 'A' and split extensions for
 atomic instructions
From: Rob Bradford <rbradford@rivosinc.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com
Date: Fri, 19 Jan 2024 11:10:19 +0000
In-Reply-To: <1ccdf50b-ef7f-46ab-a5bf-f0302990a290@ventanamicro.com>
References: <20240115162525.63535-1-rbradford@rivosinc.com>
 <20240115162525.63535-3-rbradford@rivosinc.com>
 <1ccdf50b-ef7f-46ab-a5bf-f0302990a290@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 2024-01-18 at 16:49 -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 1/15/24 13:25, Rob Bradford wrote:
> > Following the pattern for 'M' and Zmmul check if either the 'A'
> > extension is enabled or the appropriate split extension for the
> > instruction.
> >=20
> > Also remove the assumption that only checking for 64-bit systems is
> > required for the double word variants.
>=20
> Code LGTM but I don't understand what you mean in this sentence. The
> patch
> is replacing REQUIRE_EXT(ctx, RVA) for either REQUIRE_A_OR_ZALRSC()
> or
> REQUIRE_A_OR_ZAAMO(). There's no removal or change in any 64-bit
> line,
> IIUC.
>=20
>=20

Thank you Daniel, this a commit message artefact from before I posted
the patch adding RVA check to 64-bit atomic versions. In the end I
decided to split the work and forgot to update this patch message - I
will respin this series with that fixed.

Cheers,

Rob

> Thanks,
>=20
> Daniel
>=20
> >=20
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
> > =C2=A0 target/riscv/insn_trans/trans_rva.c.inc | 56 +++++++++++++++----=
-
> > -----
> > =C2=A0 1 file changed, 34 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/target/riscv/insn_trans/trans_rva.c.inc
> > b/target/riscv/insn_trans/trans_rva.c.inc
> > index f0368de3e4..267930e5bc 100644
> > --- a/target/riscv/insn_trans/trans_rva.c.inc
> > +++ b/target/riscv/insn_trans/trans_rva.c.inc
> > @@ -18,6 +18,18 @@
> > =C2=A0=C2=A0 * this program.=C2=A0 If not, see <http://www.gnu.org/lice=
nses/>.
> > =C2=A0=C2=A0 */
> > =C2=A0=20
> > +#define REQUIRE_A_OR_ZAAMO(ctx) do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 if (!ctx->cfg_ptr->ext_zaamo && !has_ext(ctx, RVA))=
 { \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +} while (0)
> > +
> > +#define REQUIRE_A_OR_ZALRSC(ctx) do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 if (!ctx->cfg_ptr->ext_zalrsc && !has_ext(ctx, RVA)=
) { \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +} while (0)
> > +
> > =C2=A0 static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TCGv src1;
> > @@ -96,143 +108,143 @@ static bool gen_amo(DisasContext *ctx,
> > arg_atomic *a,
> > =C2=A0=20
> > =C2=A0 static bool trans_lr_w(DisasContext *ctx, arg_lr_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZALRSC(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_lr(ctx, a, (MO_ALIGN | MO_TES=
L));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_sc_w(DisasContext *ctx, arg_sc_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZALRSC(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_sc(ctx, a, (MO_ALIGN | MO_TES=
L));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoswap_w(DisasContext *ctx, arg_amoswap_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_x=
chg_tl, (MO_ALIGN |
> > MO_TESL));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoadd_w(DisasContext *ctx, arg_amoadd_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_add_tl,
> > (MO_ALIGN | MO_TESL));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoxor_w(DisasContext *ctx, arg_amoxor_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_xor_tl,
> > (MO_ALIGN | MO_TESL));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoand_w(DisasContext *ctx, arg_amoand_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_and_tl,
> > (MO_ALIGN | MO_TESL));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoor_w(DisasContext *ctx, arg_amoor_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_or_tl, (MO_ALIGN
> > | MO_TESL));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amomin_w(DisasContext *ctx, arg_amomin_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_smin_tl,
> > (MO_ALIGN | MO_TESL));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amomax_w(DisasContext *ctx, arg_amomax_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_smax_tl,
> > (MO_ALIGN | MO_TESL));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amominu_w(DisasContext *ctx, arg_amominu_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_umin_tl,
> > (MO_ALIGN | MO_TESL));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_umax_tl,
> > (MO_ALIGN | MO_TESL));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZALRSC(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_lr(ctx, a, MO_ALIGN | MO_TEUQ=
);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZALRSC(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_sc(ctx, a, (MO_ALIGN | MO_TEU=
Q));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_x=
chg_tl, (MO_ALIGN |
> > MO_TEUQ));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_add_tl,
> > (MO_ALIGN | MO_TEUQ));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_xor_tl,
> > (MO_ALIGN | MO_TEUQ));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_and_tl,
> > (MO_ALIGN | MO_TEUQ));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_or_tl, (MO_ALIGN
> > | MO_TEUQ));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_smin_tl,
> > (MO_ALIGN | MO_TEUQ));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_smax_tl,
> > (MO_ALIGN | MO_TEUQ));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_umin_tl,
> > (MO_ALIGN | MO_TEUQ));
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > -=C2=A0=C2=A0=C2=A0 REQUIRE_EXT(ctx, RVA);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_A_OR_ZAAMO(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_amo(ctx, a, &tcg_gen_atomic_f=
etch_umax_tl,
> > (MO_ALIGN | MO_TEUQ));
> > =C2=A0 }


