Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kG5KR-0007hs-MH
	for mharc-qemu-riscv@gnu.org; Wed, 09 Sep 2020 15:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kG5KQ-0007f8-Nq
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2020 15:00:22 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kG5KO-0001VH-OC
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2020 15:00:22 -0400
Received: by mail-ej1-x644.google.com with SMTP id u21so5124045eja.2
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2020 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GYKtxsm1tUAtAz6PMSmwpL2uACQIT8bZcCYu+VH2lIc=;
 b=hFuWk4t0A3aTF9sYm14hmOBFnabmcsSeVJ8PpensFExc4GSDjxvjdx/huDK5/YUf+H
 hboFFnx7ugRcpe48hQrVb8xAIOq7TdWFKigBjkYMZFBsQP+7Deb+JhZKP+mzRRvJ3fBq
 1f65yUB9SEZvGKIT/sBEVK+q59cH5JvUH4snTC0mFU8NYszndTRtOIXNF4m6O1FHkXst
 uwsfaejmTsGw1Reib9DnYynBA4aAGfHUSgcseYIgceLWg5zZlHJxAIp04Q25wSzUc2q2
 h99sIpXRU7z/BTU2Cd3DE10YBVOG/scty9sJm8NAoj00IPtA+oesFKnu06E9iPk+MEY5
 3S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GYKtxsm1tUAtAz6PMSmwpL2uACQIT8bZcCYu+VH2lIc=;
 b=E0zZpiEKPGFo/FqxEGAG7IYBm0FvsW5tiwVXpAoqk15VkXtvLJr7uIjdsFT7f/KGv6
 l4b43JK8N7Nx4DpTJS+/5UsHIBbYog3LXTjtlJB1z2QmPa4yV5KhIJ7HxvBGlYf8A8NQ
 k3hYNVJd0ckx3oTCTBRFeO0e9HdMjKjI/k918qoVpaVcO4GhIlIHpv1gevdghyrJuJFo
 OKmECTf/nJPy2Zp7jOYr9o3Kegrxqr9gJZgT8Vk+t/hkSL4yWDwbERQjDndxtJNbIFC1
 g9nTQTExUDxdCITJnmxk5j1BMkO42C//Ez5ADOYlE08iH8W1ODrusBpf4iDCqd1apfVY
 pyHw==
X-Gm-Message-State: AOAM533aUK8YUVFVyRNroJDwDtu8DaHwoaUOFEq1M5ncxIaERGk2ry7Z
 lqMUGKdDH1OtORd6yigj2pUEd+dweHzMMq3WTCrzVw==
X-Google-Smtp-Source: ABdhPJwpviQemSony77xNAOOGL1Jpjwd/Lb5urQfWp/dmPQy5RO88Zfn/2sph0vzxZ23f2EzAe1oYQ/NVJU4GY8hnCY=
X-Received: by 2002:a17:906:d936:: with SMTP id
 rn22mr5141715ejb.4.1599678018448; 
 Wed, 09 Sep 2020 12:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590704015.git.alistair.francis@wdc.com>
 <0ab3cecbe801f9e14ad1a5447d02483b9008fdbb.1590704015.git.alistair.francis@wdc.com>
 <CAFEAcA83=4=EhtQLmGJn5Z_PVZaDyo7pMwdX-9fTVUkVKe7Acw@mail.gmail.com>
 <CAKmqyKPryJP5g4RXq1uCbYKQX3C+9yzjjqEH4i88L6Vf2gW7Zg@mail.gmail.com>
In-Reply-To: <CAKmqyKPryJP5g4RXq1uCbYKQX3C+9yzjjqEH4i88L6Vf2gW7Zg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Sep 2020 20:00:07 +0100
Message-ID: <CAFEAcA9RcbWeM=hhUNH=Exdp_QT4s0GcCJdrpcvWkv2ea+o7cQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] riscv: Initial commit of OpenTitan machine
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 09 Sep 2020 19:00:23 -0000

On Wed, 9 Sep 2020 at 19:00, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Sep 8, 2020 at 7:52 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > ...shouldn't the riscv64-softmmu config have CONFIG_OPENTITAN too?
> > The usual principle is that the 64-bit executable can run the
> > 32-bit boards too.
>
> I didn't know that was the general case. I'll send a patch to enable this.

Somebody on IRC suggested that the riscv code currently
assumes that #ifdef TARGET_RISCV64 implies a 64-bit CPU,
ie that the 32-bit CPUs don't actually behave correctly
if built into the qemu-system-riscv64 process, so you might
want to check that things seem to work when you enable it...

thanks
-- pMM

