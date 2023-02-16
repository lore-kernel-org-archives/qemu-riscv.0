Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSWhV-0005P7-HT
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 00:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSWhU-0005Oa-Qp
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 00:20:56 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSWhS-0004G8-6U
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 00:20:56 -0500
Received: by mail-ej1-x634.google.com with SMTP id f21so2412730ejq.8
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 21:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZOfd1irgj/WVnHrNkmoSwaV6aW0WY2eDWU89ngbsOy0=;
 b=cuktNgrWXhwV+O5UElvsEcjamMOgkiGp64QsWOqKrZqMYpewaWo+BrMDoErATtoydB
 7ucL3k8R0q3E2+bcoNAcPjc2JvWRfKQvjIT3JYDkclZ3J5AZR1ihGqxmCUu1MkUC3UCP
 oZ/hx65qv4anUEoSrC3JnUeCDH9ohPtfQWCSaVyblbU5AhytR/DHeDb5s7gsZ0g+nsc9
 b0ZigYQESNEChn5Owj5Y2JHJl1URox7k7iewnS61oFQuKHnPf4sfcx3fHzgVx6WmKHa5
 qlb7uhe4wjoYuswSDJgVS7bNyuWG3BFlPQMtvikgDPmrWuT3Li/Z9lpg7hJYefIVM6s9
 pcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZOfd1irgj/WVnHrNkmoSwaV6aW0WY2eDWU89ngbsOy0=;
 b=PR6rN04zh+SDqujnuZXwa8/q74A6T5gOfTsdaxC0zFsGREWubzp5Rzv0jPCyNJtdkD
 ZQthmIEcATH1Gy9n9B+qBDFBIj4wUIEQZ7gKLmqC7e9DhG7yIuPCqlO5HPFh6q3v+FFt
 8+fTEsnIxHNf8o2S7H4FwudYewLpBo1W2oRyuN9MIbynomDOBCF0GitoSx46cilxdher
 tmJs7BgX6gV7OroxcBwHoeLsTxasq5AOsjiLFMZ+C37VWbvkWImaKsHAYNAQlGNd0R1Y
 o1daE4xs987Od/XjHNA/1AVLxBvBlK81/Ajfk1wIdXYBRHTzaaczOfl9rtesBOgWV2Jg
 w6Jw==
X-Gm-Message-State: AO0yUKUP2iIgEa1vcXyLA5vbX7ObNnljyyYCRrh4xu5lBmx2DiuO2HqH
 D8JnUl89u3/SyVzVktmIgy9/Hzrsuj0ckIBClTFQ0w==
X-Google-Smtp-Source: AK7set9857CG/6ZyMsy0UF24+yFG7G+Vx3rV/R+IvMSz2LnIVJky6KKmVTsTIoqP8z1sc0MynTIK37Qd0HxUQ2nkZjM=
X-Received: by 2002:a17:906:af10:b0:877:747c:373e with SMTP id
 lx16-20020a170906af1000b00877747c373emr2206187ejb.6.1676524852331; Wed, 15
 Feb 2023 21:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-4-debug@rivosinc.com>
 <f68da758-a418-c528-6f7c-e6e0d0246255@linux.alibaba.com>
 <CAKC1njTbP0=H8w=izkMkEwVjq9=6m_Rw_ymgremjtbFYDGTrow@mail.gmail.com>
 <d9f692af-eb86-421d-f0cf-495f2a2e01b4@linaro.org>
 <CAKC1njR44uKkeqT52mn2wg4PzpF6cvwCEk7cGn=gCVjwjVA-6Q@mail.gmail.com>
 <3a786c14-11b1-6a12-1bb0-fc467bdd2daa@linaro.org>
In-Reply-To: <3a786c14-11b1-6a12-1bb0-fc467bdd2daa@linaro.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Feb 2023 21:20:29 -0800
Message-ID: <CAKC1njT3aafBANBjB4zQ0ysDz=5MU61AV4DQtEyPV=pWBdX+0A@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 3/9] target/riscv: implements CSRs and
 new bits in existing CSRs in zisslpcfi
To: Richard Henderson <richard.henderson@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=debug@rivosinc.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 16 Feb 2023 05:20:57 -0000

On Wed, Feb 15, 2023 at 6:44 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/15/23 15:38, Deepak Gupta wrote:
> > Question:
> > I'll basically need two bits (one for forward cfi and one for backward cfi).
>
> Are they separately enabled?  It may also be possible to use a single bit and then perform
> a runtime check.  I guess I should read the spec...

There is a master enable but there're controls to individually enable & disable.
Thus the CPU could be in a state where one is enabled and other is not.

>
> > But I need to throw away the TB if cfi enabling bits mismatch at the
> > time TB was generated and the current state of enabling bits.
> > Reason being, this needs to get translated again and zimops need to be
> > generated.
> >
> > What's the best way to throw away a single TB?
>
> You don't throw TBs away at all.
>
> The current cpu state is produced by cpu_get_tb_cpu_state.  This is included into the hash
> table lookup and will only match a TB which has been generated with the same state.  Which
> means that you can have multiple live TBs, those with CFI enabled and those without, and
> the correct one will be selected at runtime.
>

Thanks a lot. I see `tb_lookup`  & `tb_htable_lookup`.
I'll revise and add some bits in TB_FLAGS for both of them.
And probably ask some questions on the list if anything is not clear to me.

>
> r~

