Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMXNt-0000vU-93
	for mharc-qemu-riscv@gnu.org; Tue, 22 Feb 2022 10:47:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMXNf-0000md-Ie
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 10:47:13 -0500
Received: from [2607:f8b0:4864:20::b35] (port=45580
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMXHs-00081Y-Ka
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 10:41:13 -0500
Received: by mail-yb1-xb35.google.com with SMTP id g6so20599670ybe.12
 for <qemu-riscv@nongnu.org>; Tue, 22 Feb 2022 07:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YqKcUuaac5OKqv+FKIk5aXsldevQcMVVgqj6xkN41DM=;
 b=LMgdsUepFz9b7tY+/1x3oPUBMXUPYot8Ii5+Uo6kDaduq0pF5D5PRUawKKXl++vk1R
 gCzEHl+yMynsB71JXZhp4GkM3cxQzNbPsNrh8FsO2iexEEVGbnBmQ42ENEqoIwIzM/CJ
 V1z9W9AyiiMzQBg9ekL/SqSNOoiNdldEVSpsQ7+fKLo0lxd+D2ab8oA9XwlWraQFS+jZ
 mcR83YsR8FvxIa8Kf18wOCjB/EONcV92r7ji5k1/m6bFH6bIrV+7gc+b9jyZ72xKmlQl
 berwpbrPB817/l3kqULaMhUn7syGV3rYmigXOkK0vvyyUIcxrH8hDFo+jyMZE01XhuAi
 JHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YqKcUuaac5OKqv+FKIk5aXsldevQcMVVgqj6xkN41DM=;
 b=m+nbxMYYQEh17MLig1Dn9Jh9CZHn6SWm63SSbf243Gia7WkW7UYkG7STG/EA8cAegZ
 Ac69+ue7v3c4tmWPYXYEcMBgXsdeQXudm5Zr495Xe5pZAvpex3vYt2qMUNRjUgOEnw2Z
 TtCtt//lHJBTwCyqMY+A/xTpQNbF/BeioS3KUUJx89C19Gev/bI3qcqjCicwgh1Bd0JE
 gVkw33sJ/VvSn90ETIBvzMeKswMST+1vOEHhBpbUxBCuAvoGZPtzmETIVpbOzuXc0Yi+
 OXOJx8pR04bm5C8utlpOUiSHEbXqW7TwJ82MYe/3+2IvZDX0PuzkAAmVte0LGEabODz9
 mdUA==
X-Gm-Message-State: AOAM532kG5Iq6LXn66crNSBzYVe6kK8KMci+fL7gOL1ZTJA2hYWULJFy
 pzKM1s+a4aejOMZwqZK0r0fiSn0prwAySJjS2VhgWg==
X-Google-Smtp-Source: ABdhPJxJ94BC8K9AIU3O1i7+C90Wd59EPhRa7uJRVRd2is3oOb973EfYwPwuc57HTuzhYLXJ8srBOGARIXfyUvgwhRw=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr24106650ybq.479.1645544471376; Tue, 22
 Feb 2022 07:41:11 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
 <CAEUhbmVpGwjqvhLN1LCY3EokL9_a_v9okL=ZwUb_JYMZcvv3zw@mail.gmail.com>
 <CAKmqyKNLZGD-81xnFp_NMXKRuK-0EgP4FqW4AeLeKuMD+TAQEw@mail.gmail.com>
In-Reply-To: <CAKmqyKNLZGD-81xnFp_NMXKRuK-0EgP4FqW4AeLeKuMD+TAQEw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 15:41:00 +0000
Message-ID: <CAFEAcA-NBvhbK1_9N5P_+cUYnh9wJObi==yx85txbNq6jBgT=g@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] hw/riscv: virt: Set the clock-frequency
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 22 Feb 2022 15:47:21 -0000

On Tue, 21 Dec 2021 at 06:35, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Dec 20, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > >
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > As per the device tree specification let's set the clock-frequency for
> > > the virt CPUs.
> > >
> > > QEMU doesn't really have an exact clock, so let's just 1000000 as it's a
> > > nice round number and matches the sifive_u CLINT_TIMEBASE_FREQ.
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/472 (RISC-V virt)
> >
> > I tend to think this issue is not valid, as the comment in the issue
> > says the value should reflect the running frequency.
> >
> > Note the "clock-frequency" was once in the codes but was intentionally
> > removed before because it is not needed:
> >
> > See commit 7ae05377b85f (" riscv: hw: Drop "clock-frequency" property
> > of cpu nodes")
>
> Hmmm... Good point.
>
> But if the device tree spec says it's required then I think we should
> include it. Even if it isn't super relevant for us

I talked with one of the device tree spec maintainers, and he said
that the "required" note on this property in the spec is a leftover
from the spec text for PPC ePAPR, and it isn't actually required
these days. Many DTs for real-hardware Arm boards don't set the
property, and it's not marked as required in the devicetree
yaml schema for the cpu node:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/cpus.yaml#L63

thanks
-- PMM

