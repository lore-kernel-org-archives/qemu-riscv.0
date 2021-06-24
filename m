Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwPiQ-0001el-N4
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 09:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lwPiO-0001cs-Lr; Thu, 24 Jun 2021 09:48:20 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lwPiN-00074j-5p; Thu, 24 Jun 2021 09:48:20 -0400
Received: by mail-ed1-x532.google.com with SMTP id n20so8613776edv.8;
 Thu, 24 Jun 2021 06:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g1RgUFc5ffhIk6dEHmX4W19HtURzFLqX5YlhAIjwMZ8=;
 b=WH4sUcsLJakjV2GtpXp9dl0ja6CSecXdP0qv+LTxxqI3riBl9DDi+Sa77KjbvTo6wj
 wXmWchfPCP4uZYyHhqAZa1MLK0BYodMB9UDhgl1XjUp84bGPQT9PUykTbMdWjfFlOW0a
 r2K+wJtie27fL8Ce8d+V9/3rg43+mh6oYw3Vl3fPQVzquRHDnGPKG53jq1wsBzVIFQBW
 064H/pL46DZrJc166p+U1QaXy1NECUvUp30sb3mV+QxvFX4zD3gmnjhwqE/aHkYPEpFv
 qGIn0+V9tvUT+YpKBj7JTH7j99KzqQcQ8hWmEAKPykhYVXyJUUyLaXkNNcsbvT+ROOOL
 ENWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g1RgUFc5ffhIk6dEHmX4W19HtURzFLqX5YlhAIjwMZ8=;
 b=hVluQHUbH3kAyoCd1FYbDRyrjKEUjSiNw8dH7aWX/DXyyzwPTyiZThotqr8LZJ+C1P
 nndDL2DZ7o/CJvsnNsWkugRMq5KqlwP5JRNnh3B/+XPygFdTjcavBtKkdQKTJNDg7MLA
 WMDbr0egKvWiuzTUZb4S10kjs2++3BMxBCoLz7N6hCKQWkwZIL8cd5PIwTkG9nYcNWr3
 LFTWW+ucbRXM+euYvqntBCACCOKR9PPui8N4GX9VdbRCtD03A8LS+rlNqtdo8rIqVyOc
 6QPQ6RWasH2FiE4jXyoBHDq3L1GmI6OqZksBqaIDQMliogTHcuFQFYU0mQWuVSy+haWU
 5oAQ==
X-Gm-Message-State: AOAM533w8/JIYKemV4ewVlyvVolPaGOjL/1h4z3/U2r3dO+7t1WrXZoa
 WE/ICblIjCCbCMJOvGndShHIajYEu6Sf7zMdgDY=
X-Google-Smtp-Source: ABdhPJwsaPS9eakf2uukNVbVqmYA1UfHZG3hZPlQqE/qoGg1sol+OHEzwqcK2w9ozbMHdBpHY7tAR/WXAOIlHbTGybA=
X-Received: by 2002:aa7:c04d:: with SMTP id k13mr7313676edo.122.1624542496405; 
 Thu, 24 Jun 2021 06:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210522155902.374439-1-josemartins90@gmail.com>
 <CAKmqyKMvaLn5YUPVBngDjziud-t8P717cp-LsrOBo-VG18BMiw@mail.gmail.com>
In-Reply-To: <CAKmqyKMvaLn5YUPVBngDjziud-t8P717cp-LsrOBo-VG18BMiw@mail.gmail.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Thu, 24 Jun 2021 14:48:05 +0100
Message-ID: <CAC41xo1Fuo6NiOE0quviuFuJXT_E5PdPOYfA1s=gdHN0vWjGnA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: hardwire bits in hideleg and hedeleg
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=josemartins90@gmail.com; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Thu, 24 Jun 2021 13:48:21 -0000

> > +static const target_ulong vs_delegable_excps =3D delegable_excps &
> > +    ~((1ULL << (RISCV_EXCP_S_ECALL)) |
>
> > +    (1ULL << (RISCV_EXCP_VS_ECALL)) |
> > +    (1ULL << (RISCV_EXCP_M_ECALL)) |
>
> These two are both read only 0, shouldn't they not be included in this li=
st?
>
> >  static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong v=
al)
> >  {
> > -    env->hedeleg =3D val;
> > +    env->hedeleg =3D val & vs_delegable_excps;
>
> Because we then allow a write to occur here.

Note that the list is being bitwise negated, so both of these are
actually not writable (ie read-only 0). There is still the question
regarding the VS_ECALL (exception 10) bit raised by Zhiwei, since
table 5.2 in the spec does not explicitly classify it. However, I
believe it is safe to assume that exception 10 is non-delegable.

Jos=C3=A9

