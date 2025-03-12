Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C0AC28B2E
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 09:22:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsIHd-0002x4-G1; Wed, 12 Mar 2025 05:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tsIGL-0002fo-Vx
 for qemu-riscv@nongnu.org; Wed, 12 Mar 2025 05:20:32 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tsIGB-00055Y-1w
 for qemu-riscv@nongnu.org; Wed, 12 Mar 2025 05:20:29 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so7441627a12.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Mar 2025 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741771174; x=1742375974;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4t6itwPZHn5dbAeY2359zUbJPYtovq785h9XygaE1JI=;
 b=oKSwrrfqbMoqEM6qTh5gCTc4bRLDnRNaruZcxxL3sDY6GQacbIIJ2fmGhwfKSho0gD
 QFoCxO/B/S1JP27vCOncSORqOFLUI036D1ExxTX1WM6IAe8bwR85CMKsJ5nj+vQ3JLzj
 0FMBmck4vZjXqs4Sutg7uQ5tG2h9sXbOEC8lrYXQJO7jDhBijF4EP1xApeuzJ9gC7h7Q
 s9KpxkDmaOFqFN4Om+HNxBEJvV3hBNBnu6vQokxudJ/x5IxfKO18GQOxCq2BHsccWvKV
 F/Bhfy3ReTagdahPX0iMGY+Z6lk6kNUNG0F5I4/8MU34v09y4+cyOMEaCiCyX5eFcP8B
 DkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741771174; x=1742375974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4t6itwPZHn5dbAeY2359zUbJPYtovq785h9XygaE1JI=;
 b=QZZ4kQCowekGL2FTTSVKd3YIoEMdLRa9B8r/wx7ekKm//lcSXu6j6jzowwr3ajawCI
 Yd5aX3l/wiudR/ia53ykPQQ9yWK/qPO7AwN1kLAM35AGWrhMKD/r2OAFbsBk+d8qiDLY
 ZErvkmm7Rovk6+2rSkqHFbBmBGxTKnBVllyq6hhdof8KCRuD3D0U7ML0cwWd+rvI5TBR
 Khh1uLgu5WEzxTftALjVH08ySups9SZnK6CzNgfrJcTkIIiNcqv5fFddurxinmHEFj0S
 0+pUyCC6aP/PeBYENpGG8wGvFPc/2sVJ4Buh3ehwab0cDjVyUdlzjsMf8V7rihBkwjIk
 ceOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuTVWYogWTBybR1YItgdTCbj0AOpovmJq1LaPd3SbbY77w4Elt5zKL5CcACiQ+InXdpjE6rT+F1+Er@nongnu.org
X-Gm-Message-State: AOJu0YzW7PPWFGGrXlBF6ccZ+fFuWRBFDS6Jk+6sfp+O6tIX4XXiibWO
 0FHc8PTqVi1WQnpSk74gxC4ZLGy10lpkZxXBMNRhQFDC89jzRsvz3oB1HHc+hcr+crukMnkCNoR
 3chvdLvXvLxWJfLMn30qUgkuXcxlGrcRJXMikoQ==
X-Gm-Gg: ASbGncsLcBJ904OsPGc/EqOpREKxb70+fvX4Dqg0aCHM7GKzooflTge7YAVMGhP+0uJ
 nKSudfR+TDOKSWRtzWMae52bzbjrW23qzotZx9RZkWHpP/n5SwTPgWn6ExihGr/6zGAqrstKpcH
 bdRxRuumuB2OHabp8y/d7n52y6
X-Google-Smtp-Source: AGHT+IE6J7su8iHUF8HR6SisxFj/l2MRaot9VLg9EByN6T4NcQJIdtJPVooLiDTkhonBOC2rSGNf6y+pXw3aasvuuwE=
X-Received: by 2002:a17:907:3606:b0:abf:61b7:4603 with SMTP id
 a640c23a62f3a-ac252718911mr461818466b.33.1741771173795; Wed, 12 Mar 2025
 02:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250225160052.39564-1-loic@rivosinc.com>
In-Reply-To: <20250225160052.39564-1-loic@rivosinc.com>
From: =?UTF-8?B?TG/Dr2MgTGVmb3J0?= <loic@rivosinc.com>
Date: Wed, 12 Mar 2025 10:19:22 +0100
X-Gm-Features: AQ5f1JoXxNtRDqxjx-X6PX1MG4oXdMLRRrY7cx92ZZ6L1XDFCZcf-IiKlSOciKE
Message-ID: <CAGKm2N+h2mdUTv9jCXx-S8bi3FZ7PNrQcD8uw4pnc=pa0GjRMg@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/riscv: Smepmp fixes to match specification
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="0000000000001836fd063021b417"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=loic@rivosinc.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000001836fd063021b417
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 5:00=E2=80=AFPM Lo=C3=AFc Lefort <loic@rivosinc.com=
> wrote:

> Hi,
>
> These patches fix Smepmp implementation to make it compliant with the spe=
c.
>
> First patch limits RLB to CSR changes since RLB should not affect privile=
ge
> evaluation. Patch 2 extracts some common code into a function (to be used
> in
> patch 3). Patch 3 fixes validation of pmpcfg CSR writes in order to match
> Smepmp
> specification. Patch 4 is a small optimization and last patch is just
> removing
> redundant code.
>
> Lo=C3=AFc Lefort (5):
>   target/riscv: pmp: don't allow RLB to bypass rule privileges
>   target/riscv: pmp: move Smepmp operation conversion into a function
>   target/riscv: pmp: fix checks on writes to pmpcfg in Smepmp MML mode
>   target/riscv: pmp: exit csr writes early if value was not changed
>   target/riscv: pmp: remove redundant check in pmp_is_locked
>
>  target/riscv/pmp.c | 151 +++++++++++++++++++++++++--------------------
>  1 file changed, 83 insertions(+), 68 deletions(-)
>
> --
> 2.47.2
>
> Ping?

--0000000000001836fd063021b417
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Feb 25, 2025 at 5:00=E2=80=AFPM Lo=C3=
=AFc Lefort &lt;<a href=3D"mailto:loic@rivosinc.com">loic@rivosinc.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<b=
r>
<br>
These patches fix Smepmp implementation to make it compliant with the spec.=
<br>
<br>
First patch limits RLB to CSR changes since RLB should not affect privilege=
<br>
evaluation. Patch 2 extracts some common code into a function (to be used i=
n<br>
patch 3). Patch 3 fixes validation of pmpcfg CSR writes in order to match S=
mepmp<br>
specification. Patch 4 is a small optimization and last patch is just remov=
ing<br>
redundant code.<br>
<br>
Lo=C3=AFc Lefort (5):<br>
=C2=A0 target/riscv: pmp: don&#39;t allow RLB to bypass rule privileges<br>
=C2=A0 target/riscv: pmp: move Smepmp operation conversion into a function<=
br>
=C2=A0 target/riscv: pmp: fix checks on writes to pmpcfg in Smepmp MML mode=
<br>
=C2=A0 target/riscv: pmp: exit csr writes early if value was not changed<br=
>
=C2=A0 target/riscv: pmp: remove redundant check in pmp_is_locked<br>
<br>
=C2=A0target/riscv/pmp.c | 151 +++++++++++++++++++++++++-------------------=
-<br>
=C2=A01 file changed, 83 insertions(+), 68 deletions(-)<br>
<br>
-- <br>
2.47.2<br>
<br></blockquote><div>Ping? <br></div></div></div>

--0000000000001836fd063021b417--

