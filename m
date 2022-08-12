Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMVV8-000827-Ep
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 10:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMVUl-0007yD-Hw
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 10:18:44 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMVUj-0004aa-Lz
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 10:18:39 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 123so1690846ybv.7
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=aZuoj+N1RHsoVrh3/zFHoD3KQhFxD2ezVPsDRIU9ByQ=;
 b=ft6t93PQFxTWd8OJbiCy9NxmdDvx3t2fVK6wPBEbLnO34t1ZKufKv8o5slSvxQw4n8
 1tHBUGDO7fVAR41bypg9Yh2uJ2COXfxsF+kebLVfFfVB5xsNml13WfX9pQ8KErXXkGg9
 Jgln2T8KeyZXhhRcfvyMn1mzfYGtyHhKpiZBKLkH72qs61EaSQpZ17SBwxk68qANUyil
 nA2VPRFF3087KnVlSYAh7+OawpmmiNMGvCmF1aj0rdJtpbhh+vUh0w3vGJOrUJ+PMkx8
 tk++ZXgtgJtCgt+JJhfTEqmQH373W+x4ipbrbaBQSGidpL99tj/g5dBQffPHiWLBIGNw
 972w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=aZuoj+N1RHsoVrh3/zFHoD3KQhFxD2ezVPsDRIU9ByQ=;
 b=tKstHt2KLqGtbRl1W0anBRrSedjydsU4ZIxgjqiasVGWbmI72q4awaHfJ+wzxw4aVh
 ut1Yr7u228SERsr5gln9Q/L3fFcLbHBzSkbgvvpbkTIPQ14kz9PLyczeBctBRoRkyFBP
 B2TJaLjKdLpT8K0A8Pm9kp9NdWVk14TDr5u/kfymiHOo5neOKYZOPCx7KImIFixlFRdz
 dfnELzn75K0c9CU9zvxQEjTcfM/ADUjOeU4w/RQvhsrTF4IZGo2InDGny7gct29jjh2z
 zNAr3EdkgcZatbhiEBiNeBX14WNBeZ/hYRArJHgc3jf55qVQyKOmDgGwcTfek39iECpQ
 ti1Q==
X-Gm-Message-State: ACgBeo225b49JJw0p/v7VfsN225KEzYOcZYAWq5pYsj/oEMKFnbWBiSz
 4CaRRve47Vet2GOSp3a2xAPLlYY9AvFBqWeVa+WTFQ==
X-Google-Smtp-Source: AA6agR6VSVyYnHQ2zjkeg/sg4J3yf+Zljs69wQRuQruS603C7Smd7eAavoBwau0ueinVrX79/sQ7JZ0vnigZ29R4idw=
X-Received: by 2002:a25:9a06:0:b0:676:4585:3df7 with SMTP id
 x6-20020a259a06000000b0067645853df7mr3796081ybn.193.1660313916623; Fri, 12
 Aug 2022 07:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
 <20220812140103.3lbh45oidiw2fhsf@kamzik>
 <CAAeLtUDbVwvQzr9u+D2KH6qBoiu4ikEbf3aVahbmK_i=6gEM7A@mail.gmail.com>
In-Reply-To: <CAAeLtUDbVwvQzr9u+D2KH6qBoiu4ikEbf3aVahbmK_i=6gEM7A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 15:18:25 +0100
Message-ID: <CAFEAcA9Br-7mxsN-y7FciW8k=jtG2vhrf4tiO80bVcFBrCdUuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: fence.i: update decode pattern
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Fri, 12 Aug 2022 14:18:44 -0000

On Fri, 12 Aug 2022 at 15:11, Philipp Tomsich <philipp.tomsich@vrull.eu> wr=
ote:
>
> On Fri, 12 Aug 2022 at 16:01, Andrew Jones <ajones@ventanamicro.com> wrot=
e:
> >
> > > Update the decode pattern to reflect the specification.
> >
> > I got hung-up on this for a bit since there isn't any "must-be-0" field=
s,
>
> Please refer to '=E2=80=9CZifencei=E2=80=9D Instruction-Fetch Fence, Vers=
ion 2.0' in
> the specification.
> The encoding diagram clearly states 0 for imm[11:0], 0 for rs1 and 0 for =
rd.
>
> However, there is an explanatory paragraph below (unfortunately, it is
> not clear whether this is normative or informative):

> > The unused fields in the FENCE.I instruction, imm[11:0], rs1, and rd, a=
re reserved for finer-grain fences in future extensions. For forward compat=
ibility, base implementations shall ignore these fields, and standard softw=
are shall zero these fields.

That's pretty clear that this patch is wrong, then -- QEMU
is an implementation, and so we must ignore these fields.
Otherwise when a future version of the spec defines a finer-grain
fence instruction in this part of the encoding space, older
QEMU will incorrectly make software that uses it crash.

If you think the spec is insufficiently clear about whether that
is normative then that would be something to raise with the
spec authors, preferably before anybody builds hardware that
enforces must-be-zeroes on these fields...

thanks
-- PMM

