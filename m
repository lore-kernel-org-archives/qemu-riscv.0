Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njXVO-0007IM-O0
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 22:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njXVN-0007I6-66
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 22:34:13 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:40891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njXVL-0006eS-It
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 22:34:12 -0400
Received: by mail-lf1-x134.google.com with SMTP id t25so755149lfg.7
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 19:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UAANJFpKdsMCgb1KkFb/JQRsTLJBMTt5wIXh3sMZwwY=;
 b=vVVZAa1jHSt4IXaJKTEV/ucqrML23wpLa66pjrJX9IOzi1DW019PMNS8uohY0aj+12
 GFQZEafoRsE3aqkh2UlCxWZPph04teWJ8ujIuT98mTXHtnTs5av33/GX+ixFrVnNQwar
 eSCd3PdsmAu8zFA6y4sCkpbt2D35QZmex89bS+hnJ9sdC9EmXvnHF6SHA2pish90yDPw
 T6gr0S4wFdSnI5HVAJCuFkzjdOqLia3MaxsJk/gysbV+FTCI2Iya1kEi1XRHAx4z0KPV
 t4hdSb2kSvdFMIYuHI79dgROEwBNS+K04C/dWGlk7k6NfCdOxQUwPQ0S7ogbLDleRhad
 9Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UAANJFpKdsMCgb1KkFb/JQRsTLJBMTt5wIXh3sMZwwY=;
 b=5FOphUxi6nxcmePkTdkHnU1Mu6oFDbiIfeq7WedtOpCAnBiS5tK2o9eavLyxhv9CiD
 7sAKGNSpz1WrhsMixiDpQ35ohItSvk4euHkCz7viYKZo1KnSMyRtwzPbabvGGRiCFp+k
 ullPQ8sY6RP1go8fFJTn8Bn+SNayrvdZvJpHhrIwcZ7SpuyA4jzASR/96MPFwjMT214f
 ubIykW4kvIHCNl1+BnQ9kj3vwzsjFwgxNe6O84YFegO+tG3mTmYyWumEgqzPBLt1pKr0
 Y1HqmaJplB8F8pMzORRkeJl4siTFNOVmzyQJkFFfh/NPpg8MR2X9av2t1mfuo+oLUmZJ
 kKiQ==
X-Gm-Message-State: AOAM532qOej9liqMGWuHj9wObeaWRxgVxOcGsNcGwiVdLkHA+k96wYO2
 Bb4d+nJn2xcWK8w2atGeLaqeRoz1C1nra3hkvPchlg==
X-Google-Smtp-Source: ABdhPJyUZqeFD7Nd5F0T0M4Wd1lGKsKCJCzlbeRHzBzsqjXn194u1KSW2bKK5a1p5B4yw//aoxwGjj8bvHaC1S/AdQk=
X-Received: by 2002:a05:6512:2090:b0:472:2764:1f0c with SMTP id
 t16-20020a056512209000b0047227641f0cmr1322998lfr.482.1651026849262; Tue, 26
 Apr 2022 19:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220426230855.336292-1-atishp@rivosinc.com>
 <20220426230855.336292-2-atishp@rivosinc.com>
 <00335dce-3ca6-b037-be91-4dc3396d6cd0@linaro.org>
In-Reply-To: <00335dce-3ca6-b037-be91-4dc3396d6cd0@linaro.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 26 Apr 2022 19:33:58 -0700
Message-ID: <CAHBxVyFKkXGhyvv0RVCmGs81-Ai7vd8Ri66svLzP3D1u+1D4Nw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hw/intc: Move mtimer/mtimecmp to aclint
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Juan Quintela <quintela@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x134.google.com
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
X-List-Received-Date: Wed, 27 Apr 2022 02:34:13 -0000

On Tue, Apr 26, 2022 at 5:50 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/26/22 16:08, Atish Patra wrote:
> > @@ -334,7 +334,6 @@ const VMStateDescription vmstate_riscv_cpu = {
> >           VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> >           VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> >           VMSTATE_UINT64(env.mtohost, RISCVCPU),
> > -        VMSTATE_UINT64(env.timecmp, RISCVCPU),
> >
>
> Must bump version_id and minimum_version_id.
>

Yeah. Fixed that. Thanks.

> r~

