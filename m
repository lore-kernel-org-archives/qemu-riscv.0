Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lXMkR-0004B9-4E
	for mharc-qemu-riscv@gnu.org; Fri, 16 Apr 2021 07:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lXMkO-000499-Vr; Fri, 16 Apr 2021 07:34:52 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lXMkN-0002uL-8w; Fri, 16 Apr 2021 07:34:52 -0400
Received: by mail-ed1-x52c.google.com with SMTP id f8so31849372edd.11;
 Fri, 16 Apr 2021 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N8klAhgCyaEwa0TiMOJwHXJKTXvCrrhpztUoJxQL32Y=;
 b=QPCWkXCLixy3iA3zTIo9nPepaGPw4nK0rO3RdWa13NxWdJzqJUUovqekGvoqyjOTdw
 O4YRzRHsozi2DCFk4LnV+A4RF8JVINYHr1gX0juppMcZw/ENRwrwjxBOEx9Ds6D/I27T
 luPQzgBos4+YlITXzVK8vDIoVDJZCLlB3yhTNknsAnRJNpAzx05tcu3Y+SXxmI2xfxFM
 vS8BjYk+OcEQGnpiM00rMgwNwKTDnQogQjQNLFIdc5oAp4KKrKafWwExKDhNaED7b3P2
 V7p9ZpRCdj4IMRLR02e/PoDRV2v51LEVCA2AZKUShMNnqfoqn/BAIFnp2heXt+rMmOn8
 we0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N8klAhgCyaEwa0TiMOJwHXJKTXvCrrhpztUoJxQL32Y=;
 b=jq+3X90tkUzT50+sEwamvohsyqlfCJPCVqipQm+XuV8gqx7mJ18REiHKDGYCDomgwe
 3aqUSOH+icWWLKcAOIupxLTb3xD/mYJtFnyS3alXpNpbm93TdAZYw9cCrqFB85N3++Ur
 HbQi42UobfTZ8CzGe1LaxqNKViRTdxp95vKNeK0b2mUn4uCntqOIF8jveyLuPJ1EI/nb
 jBaVIBpAZtzLaHvxBOTkyJdGQG1dser1V0plQ4NjelxICrmMHv4oEeSwn7QAS7sC280G
 1TRjBSO4Rdp12goKO89USHZyCWKtf4R9yegkI3XLdZ84FLQnM1pd8OoQ68WDEJ+iZ2b1
 MT6w==
X-Gm-Message-State: AOAM530FDNTX41lj+B8iNSfsV9hsiK8JTsT5fkXt/Yu1wC5hLVicu2s/
 FWThzkxajzrw8Cdkli/Nb7TwrgDhhWPOQf4kB+s=
X-Google-Smtp-Source: ABdhPJwr3zDVKkZSBmSlBcBMh36Nx/Oj0vijI7HOPPYy1ZN9oD/AIMITcDm30pOGqkygMCJZqKyrpWa8xhzXs+S02pU=
X-Received: by 2002:a05:6402:350:: with SMTP id
 r16mr1921676edw.227.1618572888636; 
 Fri, 16 Apr 2021 04:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210410194047.559189-1-josemartins90@gmail.com>
 <CAKmqyKPpjRfowvYjofny8JNwnDUZkyH4jnU6mvVxaWNJuEgsqA@mail.gmail.com>
In-Reply-To: <CAKmqyKPpjRfowvYjofny8JNwnDUZkyH4jnU6mvVxaWNJuEgsqA@mail.gmail.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Fri, 16 Apr 2021 12:34:37 +0100
Message-ID: <CAC41xo1K6_K7YXn2E6inRf0spkbOAGQNy2eA0s6TWXV7V_aYhg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix wfi exception behavior
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=josemartins90@gmail.com; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Fri, 16 Apr 2021 11:34:53 -0000

> > -    if ((env->priv =3D=3D PRV_S &&
> > -        get_field(env->mstatus, MSTATUS_TW)) ||
> > -        riscv_cpu_virt_enabled(env)) {
> > +    if ((!riscv_cpu_virt_enabled(env) && env->priv =3D=3D PRV_U) ||
>
> > +        (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_TW)=
)) {
>
> Shouldn't we check here that we aren't virtualised?
>

In section 5.4, the spec states that mstatus.tw has effect regardless
of virtualization mode: "The TW field affects execution in all modes
except M-mode.". I interpret "all modes" as being all supervisor modes
since section 3.1.6.5 states that "When S-mode is implemented, then
executing WFI in U-mode causes an illegal instruction exception" and
later chapter 5 says that a virtual instruction exception should be
generated when "in VU-mode, attempts to execute WFI (...)" regardless
of the state of any status bit. Plus, it should be an illegal
instruction exception and not a virtual instruction exception even in
VS-mode when mstatus.tw =3D 1 because the spec also states only "When
VTW=3D1 *(and assuming mstatus.TW=3D0)*, an attempt in VS-mode to execute
WFI raises a virtual instruction exception".

But just now I realized the patch is assuming S-mode is present and
not taking into account M/U only harts. If this is the case TW should
affect U-mode WFIs. I will fix this and submit a new version of the
patch.

Jos=C3=A9

