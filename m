Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4102CA1014
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 13:43:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utnlo-0000WP-Q9; Wed, 03 Sep 2025 09:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1utnlm-0000KE-38
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:43:26 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1utnlj-0007Uo-PG
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:43:25 -0400
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-43832e0c40fso87348b6e.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1756907002; x=1757511802; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rtI1DNy9KozUlYQ60bsezYbhv0AWpcfWf+TP+E8/AOI=;
 b=CF24qxytURiaV0X7R+jdYYCzAba0PBJ8/kXc4odWHWY/07fN5QsjE8sEf8qV3porw9
 VcuXJ1YX7woC4bSIPJKLO0onx/Bkr3w2PIGorE9Qy8Fh+QQ2HLMZVh1nahr9JMjJ89Cf
 +v+CA/ztQHR0SJu6d/D62UFY5KfrzGns0eRW8afuJZ0Xq9dPXgCJ46DEJDuIe1zuTWr7
 6d+QHF15DFbBPfi3gPRXKOFyHXtWUhwgUb0AzyPyEz6AgvbO6/qSVoNbWGW1SfcpMUwy
 0TgbwrwcELPsCIRsruhHai6lECUVkJqsLmZqvr3ESE4XLkT6hZpg+Uu8oA92V5L59r+E
 b35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756907002; x=1757511802;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rtI1DNy9KozUlYQ60bsezYbhv0AWpcfWf+TP+E8/AOI=;
 b=JigjkgkA4FTOSd327Lv5x80y8SQXg+qZ3xeA9XcwwhxDmgWRB94yEfFfXyF2j5oGwP
 pOyr5Vk2UZOFeZ65j6TmFdmCHCmdelSuU4C07R6wQN0D+55PFMXVxEgjXu9wRwEpXXn0
 L5vOQ9DkgQCwF6up+7MGk6ehpCw6ewNyTX+W5p+JLar4x5vG0cVZkMv8GOq0xU36tndb
 MALjUajVkflfDxAwtk1zWZvghTJGzj0PozB2V8kXEbM6sZLo+H7JEg0aWPW4ht5e2rVp
 Up4NI2t+3gwJ4sttl4UZEO5vTzQdVjDgSAzAyUV649j+tdbv96Hl4cw681eom/vSK5QB
 Vqhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoLbXOdw46AfOC0Q8Uw/S7ZhwcAN17a4dquCzGPJJZ1VF5qs8TldxtqUhkZ3xOApNUFs7/1r+IGL9t@nongnu.org
X-Gm-Message-State: AOJu0YypCZAJyyMSdooOYpxwmUX+sDtfSPplnFnp2ENOnk62+iWRT3du
 MLk+B6TqbPZrQ/ea2lUZUBcXpUqRSqC9GnktxVlvJwTLEJHTue6NyQ8+ldE+JKV38kpDZH8H86X
 UK/rlufvPKAy1hUha1Y/ALdW11mHK8VMPlRYhsu2Vvw==
X-Gm-Gg: ASbGncu8/WzK/mRN4UvS05RZlrk2XFUv8St7R3Qf5xljUoWZFXd56SPXB6KsqQohKAV
 WdSaIPyVKX/gCP5CjmU8XycTgF7I6i01oJhAtglafS2oPb8KilAMnE7f/a07ic/Pm95q3fhoacQ
 lr0pLduF9tHuGgp99FrgaoU6xeddB+iV1K6CSEDC8Ss476NwkcbIvbhOMmUS2Lb9NCWP0fp6ld9
 sZcHhLtKU4BxWbpuzU=
X-Google-Smtp-Source: AGHT+IEXdW4y6xj2RKYn+WakjSMt45BFcAvxmmDYS2yH1jGwoaCay0UGZxYY5Ulu6gLkV5ufcu0a7v18g35YGy7RY3E=
X-Received: by 2002:a05:6808:199f:b0:437:e238:f50a with SMTP id
 5614622812f47-437f7d7457cmr6787329b6e.30.1756907001829; Wed, 03 Sep 2025
 06:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250903130125.1701363-1-max.chou@sifive.com>
 <20250903130125.1701363-3-max.chou@sifive.com>
 <e4ce9ca2-9be7-4486-a1b5-1c5939f26989@linaro.org>
In-Reply-To: <e4ce9ca2-9be7-4486-a1b5-1c5939f26989@linaro.org>
From: Max Chou <max.chou@sifive.com>
Date: Wed, 3 Sep 2025 22:43:10 +0900
X-Gm-Features: Ac12FXzFiIgwDAPh3s1Yd7nmbE8NU4BLDhLW2QitL_TR6-KCtLNQwZwaBSEqphM
Message-ID: <CANiaA1uXgp1o8UO2p9UArq1Bp0U9HNpwfqsJaNuYG_KOc+4xYg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] target/riscv: rvv: Add Zvqdotq support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="000000000000bf7331063de5c9cf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=max.chou@sifive.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000bf7331063de5c9cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 10:29=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/3/25 15:01, Max Chou wrote:
> > +#define OPMVX_VQDOTQ(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2)
> \
> > +static void do_##NAME(void *vd, target_long s1, void *vs2, int i)
>  \
> > +{
>  \
> > +    int idx;
> \
> > +    T1 r1;
> \
> > +    T2 r2;
> \
> > +    TX1 *r1_buf =3D (TX1 *)&s1;
>  \
> > +    TX2 *r2_buf =3D (TX2 *)vs2 + HD(i);
>  \
> > +    TD acc =3D ((TD *)vd)[HD(i)];
>  \
> > +
> \
> > +    for (idx =3D 0; idx < 4; ++idx) {
>  \
> > +        r1 =3D *((T1 *)r1_buf + HS1(idx));
> \
> > +        r2 =3D *((T2 *)r2_buf + HS2(idx));
> \
> > +        acc +=3D r1 * r2;
>  \
>
> One could argue for a missing widening cast to TD here.  You got away wit=
h
> it because the
> only uses happen to have small inputs and "int" sized outputs, so C
> arithmetic promotion
> worked for you.
>
> You can move the variable declarations into the loop.
>
Thanks for the suggestions. I overlooked this part. I=E2=80=99ll update ver=
sion 3
to include this part.

Thanks a lot,
Max

--000000000000bf7331063de5c9cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5PbiBXZWQsIFNlcCAzLCAyMDI1IGF0
IDEwOjI54oCvUE0gUmljaGFyZCBIZW5kZXJzb24gJmx0OzxhIGhyZWY9Im1haWx0bzpyaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnIj5yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPC9hPiZn
dDsgd3JvdGU6PGJyPjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIGdtYWlsX3F1
b3RlX2NvbnRhaW5lciI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1z
dHlsZTpzb2xpZDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPk9uIDkvMy8yNSAxNTowMSwgTWF4IENob3Ugd3JvdGU6PGJyPg0KJmd0OyArI2RlZmlu
ZSBPUE1WWF9WUURPVFEoTkFNRSwgVEQsIFQxLCBUMiwgVFgxLCBUWDIsIEhELCBIUzEsIEhTMinC
oCDCoCDCoCDCoCDCoCBcPGJyPg0KJmd0OyArc3RhdGljIHZvaWQgZG9fIyNOQU1FKHZvaWQgKnZk
LCB0YXJnZXRfbG9uZyBzMSwgdm9pZCAqdnMyLCBpbnQgaSnCoCDCoCDCoCDCoFw8YnI+DQomZ3Q7
ICt7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJy
Pg0KJmd0OyArwqAgwqAgaW50IGlkeDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBc
PGJyPg0KJmd0OyArwqAgwqAgVDEgcjE7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgXDxicj4NCiZndDsgK8KgIMKgIFQyIHIyO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFw8YnI+DQomZ3Q7ICvCoCDCoCBUWDEgKnIxX2J1ZiA9IChUWDEgKikmYW1wO3MxO8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgXDxicj4NCiZndDsgK8KgIMKgIFRYMiAqcjJfYnVmID0gKFRYMiAqKXZzMiArIEhEKGkp
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxi
cj4NCiZndDsgK8KgIMKgIFREIGFjYyA9ICgoVEQgKil2ZClbSEQoaSldO8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8
YnI+DQomZ3Q7ICvCoCDCoCBmb3IgKGlkeCA9IDA7IGlkeCAmbHQ7IDQ7ICsraWR4KSB7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgcjEgPSAqKChUMSAqKXIxX2J1ZiArIEhTMShpZHgpKTvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgcjIgPSAqKChUMiAqKXIyX2J1ZiArIEhTMihpZHgpKTvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
YWNjICs9IHIxICogcjI7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KPGJyPg0KT25lIGNvdWxkIGFy
Z3VlIGZvciBhIG1pc3Npbmcgd2lkZW5pbmcgY2FzdCB0byBURCBoZXJlLsKgIFlvdSBnb3QgYXdh
eSB3aXRoIGl0IGJlY2F1c2UgdGhlIDxicj4NCm9ubHkgdXNlcyBoYXBwZW4gdG8gaGF2ZSBzbWFs
bCBpbnB1dHMgYW5kICZxdW90O2ludCZxdW90OyBzaXplZCBvdXRwdXRzLCBzbyBDIGFyaXRobWV0
aWMgcHJvbW90aW9uIDxicj4NCndvcmtlZCBmb3IgeW91Ljxicj4NCjxicj4NCllvdSBjYW4gbW92
ZSB0aGUgdmFyaWFibGUgZGVjbGFyYXRpb25zIGludG8gdGhlIGxvb3AuPGJyPjwvYmxvY2txdW90
ZT48ZGl2PlRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb25zLiBJIG92ZXJsb29rZWQgdGhpcyBwYXJ0
LiBJ4oCZbGwgdXBkYXRlIHZlcnNpb24gMyB0byBpbmNsdWRlIHRoaXMgcGFydC48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyBhIGxvdCw8L2Rpdj48ZGl2Pk1heDwvZGl2PjwvZGl2Pjwv
ZGl2Pg0K
--000000000000bf7331063de5c9cf--

