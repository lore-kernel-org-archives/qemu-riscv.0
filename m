Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmvh0-0001f5-Lt
	for mharc-qemu-riscv@gnu.org; Fri, 06 May 2022 07:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmvgw-0001dg-I9
 for qemu-riscv@nongnu.org; Fri, 06 May 2022 07:00:10 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmvgt-0007n3-BE
 for qemu-riscv@nongnu.org; Fri, 06 May 2022 07:00:08 -0400
Received: by mail-yb1-xb31.google.com with SMTP id m128so12189608ybm.5
 for <qemu-riscv@nongnu.org>; Fri, 06 May 2022 04:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8mrhkmLPo1uyOuWfrctHK1oB/WHDLPv10rnzK5XClBs=;
 b=Y0iPCMm1GfkEBD67QExxuIFTZ3rXf4jMWVqmly3PIVUz5tkcA3HDC+lMKxUDRweBe/
 pqR7jtn9zha60jMv5UBvZxMR+VemjH99oW0hnkNr1GfwpFw1ZY9C2nvUfhcu5q3aQ9UJ
 /9q8M1bzWkAfaKMHjougYFA0iXoTPWTGam38qcyYmmNRxUcvnrinASsu7D8Q1OdyYM32
 TCRlHilGdvUL/CwtozSzB+GqE7qiMpV/yeMGLMYUB9QBY7vN+lRtUi5Kr5libzkDgWtF
 i4GYRevrYKc7NqM3ka+pmwjzJDwkouB11P983xTmEjbBow18iH4F9kdxJb303Eqd8HAh
 Ds6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8mrhkmLPo1uyOuWfrctHK1oB/WHDLPv10rnzK5XClBs=;
 b=wuLbvbmvwNplxo+Cp74UsR/k5xzGpEvBZjRC+u7P1qNAPoy1kq7r+jfADQe/lIIdQ7
 wtzWTBqpnoPufTSK7SFend5Tt5lID9vhmrTzqaM5qey8AVJLJZNlXvx5vEXJ8t3erWg7
 0Rj4S9Us3v4ML5MvJ148u586oMp3RbUiYLYGkFucnzs4y72iMqYR9ZwAzSLee0jEH7rx
 ZhbN89Pm87TVWjvcp0iAcH7eXpalAeQTrjrEdESS9gu+OwozjDxzH/gX8XNAiR39Hqn/
 RCZh6aaxuSjIcfJUkAwW7130B6aPjQsrtY6eVpZytVUbxczr7eAEzmOckcsZhtJ7oQlP
 f6cA==
X-Gm-Message-State: AOAM533FE/GELDF8copdbt0NmIQ6EZWrkKVLOQSYaP85682xgvZoGijv
 hnt8YEYTdJsk2hpSCKChq7EmSvU/9IGfih1OKVbACA==
X-Google-Smtp-Source: ABdhPJyfQ+YniVGVHYAv5D9NGhDnovOEpM0c3jc0dK8Z2NqaCHz3SICB0UHh0DGEVhxulUWsqQ+jATjJCFBIp8fcl1g=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr1714507yba.193.1651834806101; Fri, 06
 May 2022 04:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
 <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
 <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
 <YnTZP1iG+77Cugaq@redhat.com>
In-Reply-To: <YnTZP1iG+77Cugaq@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 11:59:54 +0100
Message-ID: <CAFEAcA_MncAJWUqG3yRVGMT0mXKvnBUqJLdoHwMdd=OW8fnodQ@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Atish Patra <atishp@rivosinc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 06 May 2022 11:00:10 -0000

On Fri, 6 May 2022 at 09:18, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Fri, May 06, 2022 at 06:34:47AM +1000, Alistair Francis wrote:
> > Even if we didn't worry about backwards compatibility the current virt
> > machine would still be what most users want. It's just a small number
> > of users who don't want MMIO devices and instead want to use PCIe for
> > everything. Realistically it's only HPC users who would want this type
> > of machine, at least that's my understanding.
>
> I'm not so sure about that. Every other architecture has ended up
> standardizing on PCI for general purpose virtual machines. IIRC,
> aarch64 started off with MMIO, but switched to PCI as it matured.
>
> In terms of having VM mgmt tools "just work" for risc-v, I think
> it will be very compelling for the general 'virt' machine to be
> PCI based, otherwise all the assumptions about PCI in mgmt apps
> are going to break requiring never ending riscv fixes.

Mmm, my experience with aarch64 virt is that PCI is much nicer
as a general preference. aarch64 virt has some MMIO devices
for historical reasons and some because you can't reasonably
do the necessary things with PCI, but I'm actively trying to
push people who submit new MMIO device features for virt to
try to use a PCI-based solution instead if they possibly can.

thanks
-- PMM

