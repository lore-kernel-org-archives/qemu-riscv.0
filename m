Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofCpt-0002Yq-R1
	for mharc-qemu-riscv@gnu.org; Mon, 03 Oct 2022 00:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCpr-0002YI-Kb
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 00:13:43 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:36661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCpn-0006OW-G8
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 00:13:42 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13207a86076so7478558fac.3
 for <qemu-riscv@nongnu.org>; Sun, 02 Oct 2022 21:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=2s5aA7H/DcyAT0yC6i5cBhTjtpvMub8e5tlko1mxwZo=;
 b=BNpG+wWoo3kE3uUnQ2djg0kLMicrjxZeufeb16Gs75DPQRpTIk97DCjeq9JkfTJPfO
 XvB4RIq0eNyENx9bu0Z0PUVtgSi4qPSiUEpcTs/UJIYXNsLdbhUYo89KWS6swdL3dLd1
 d83EDlkX4SpPdP2hl7F1tUvlEiJXYEfC+OOMxGbvAaGpy99jl0dM4r9Pv4cf5yDN+xTM
 CvNJ0wcBKIFoMkDk5mFbzxAzlICMTwF5Fm7XkW/3/pYlKkGT0p0D+ZPxxEX5G9qSZgF/
 ACDFhSaKBGTvegiYAqbZKszFX/FYkOqecIDh37ig6YfnI3KsEOKI0FtgmWb8p1dhlCMm
 dTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2s5aA7H/DcyAT0yC6i5cBhTjtpvMub8e5tlko1mxwZo=;
 b=PmTPPXToT3zosyLfZlO+6/WZwXEze5d70Yt86Z2Db7pkiD1swJC5csPK/gVD3RkU/D
 6Oe4cL09ThXP0fNwkiZbRXytCYNG/ptLTJUNcT0cjrQsq0yXgWi/Q2iuMO04uDHGOLkg
 ik6EcFJD4vlTqH2ChOgOlnUZdnEtZ5LAumvrTztUsepfCf669GFWXaCjHm0e+hnCdvil
 39aV2O7WXRLYhIPMeV7ua3uDsJLrMi8Aq2xaNIX0aF7//7r+Zj3IQiejubIwdHjTFpng
 3gUCuoYTiwBbAf1HYwPuhD3JWOGkmhfdwZDfg7k0XErer1GazjJ4t88rzairypNurI11
 6EAA==
X-Gm-Message-State: ACrzQf27Bp5JD31S6ISDC/2OBC/yF+UZsxJTtDXrpwFwSMs6GkkqW0vc
 Tks9atufhRp5fPxV60Z9lBvXvW2xFmoAcCwaJnU0og==
X-Google-Smtp-Source: AMsMyM7bcvpJ/O7Vz890v16Rmex3t6CufY3oUw+ZZ1xIOawCvB0vih1RSb1dXlOvWwZCqI216zxhaHeNxTHKb+Byy5A=
X-Received: by 2002:a05:6870:a91f:b0:131:bb72:7313 with SMTP id
 eq31-20020a056870a91f00b00131bb727313mr4432316oab.90.1664770417546; Sun, 02
 Oct 2022 21:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220930123239.15515-1-jim.shu@sifive.com>
 <20220930123239.15515-3-jim.shu@sifive.com>
 <CAJ307Ehp8Juy74EpmxyOTq6sVuPF+d-uLYD3T93ba4ZtRLxdBA@mail.gmail.com>
 <CALw707rDW8GwB8fQHyARgY87ZRjPxOV387kZLKWOzqKVZj4=8w@mail.gmail.com>
In-Reply-To: <CALw707rDW8GwB8fQHyARgY87ZRjPxOV387kZLKWOzqKVZj4=8w@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Mon, 3 Oct 2022 12:13:26 +0800
Message-ID: <CALw707qgv6T8ybYEF+zwmDLFjNLqhr5+7Wrf0GrdsGM6bbim5Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=jim.shu@sifive.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Mon, 03 Oct 2022 04:13:43 -0000

Hi Cl=C3=A9ment,

> > > @@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwad=
dr addr, uint64_t value,
> > >      if (addr_between(addr, plic->priority_base, plic->num_sources <<=
 2)) {
> > >          uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
> > >
> > > -        if (value <=3D plic->num_priorities) {
> > > +        if ((plic->num_priorities + 1) & (plic->num_priorities)) {
> >
> > That's the opposite. If n is a power of 2, n & (n-1) =3D=3D 0 (eg 8 & 7=
 =3D=3D
> >  0, 9 & 8 =3D=3D 8).
> > Note that n must be positive too. But I'm not sure it matters here.
> > I'll let you decide.
> >

num_priorities is a uint32_t variable so that n is always positive.

