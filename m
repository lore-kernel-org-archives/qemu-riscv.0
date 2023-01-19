Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIIkO-0000GX-9N
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 19:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIIkM-0000GG-Ve; Wed, 18 Jan 2023 19:25:39 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIIkL-0000rs-F3; Wed, 18 Jan 2023 19:25:38 -0500
Received: by mail-vs1-xe32.google.com with SMTP id v127so509741vsb.12;
 Wed, 18 Jan 2023 16:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HEdRdCDC7Rd8VCNhGbhhnwuK4D74h4j/IilETQOk5fg=;
 b=PjmjpmAoeJGImFxUY8J7CzbEOSIToMQOlL3ZLUE8aZE5cVUrcPR8KE92bnRcJ44pzl
 SoQzqzukgjBBBqK69lWGZuRVeXAOyQeK+UFPDaSslX+EcuBitjTFFl5WKuwdXRhAXcmA
 ABvdiyDcvIbfZGoIBvNGnlQYkXlQGrNc1/nlrIuBu8Pgg4vHvKBKGpps7VB+QZW5aR2+
 6OEWbX+u0TDO+wD4f1VY6jYZxWXafxVYVQefDbQXtSYEikexB/J0+ndBgGlR+RfW8MQL
 9vrs1lDB7joUKkRA/XG5Qqv9lR6uLuoGbeyIYNFSamb2C9DP0mbMu7CfMCcQHo6MNgiI
 dx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HEdRdCDC7Rd8VCNhGbhhnwuK4D74h4j/IilETQOk5fg=;
 b=GIvwkesZ0nkBtkTaN/TVuPoUJehRv+lPX7sIKBn4BHU0O6kfgKQS/8sLM3LCc3C5Mu
 gSTVkYvZFdNnaJ3Z2WS+Ki31aX/b5q/fAsfQ0ua1aL+r+XAxNaie+7YQYifgzkzoTwqm
 lDxDfYj6mg/f/RHKa84gDwGUMILGPAex7wgl5qa7+CPoM3XCrBcJ7aMpXzw4izWiDxui
 7651/H6Bu9aQSZHtF3wBaqNltaMjJt9hwFeThwnjQOcuTuVMsIPjzWfeb6ipU2e5Dfiv
 S/U6RYgVw8ipYej5W1qSizzc9qqGW0ZmoXkSJM2/X/hISZXZgVCTv9esxoUfnRuwDloy
 FfvA==
X-Gm-Message-State: AFqh2ko/Uf6pQWKRTjyH0eynAa/6TmK1CaVVo7hqKwqe5g+QRCgWQlku
 iDhxJW4fXFEhgnAhzjIgY5gHRJpJNF1Z5R6FbQkkIYzGrjA=
X-Google-Smtp-Source: AMrXdXu7BGwSlQNPAFe8ULRlsc5F+9kJ3nkFXtQlt7uInA/F/ZInI7z0wZRsxVFlwiqkYwI28sePTe2XrOLr3A+3G1g=
X-Received: by 2002:a67:eb10:0:b0:3c9:8cc2:dd04 with SMTP id
 a16-20020a67eb10000000b003c98cc2dd04mr1325314vso.73.1674087936098; Wed, 18
 Jan 2023 16:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
 <20230117163138.jze47hjeeuwu2k4j@orel>
 <CAKmqyKNFX_ovg4Bp_30o0g4Jd5XJ98i9LdFgejsDmGW4iL2+OA@mail.gmail.com>
 <20230118121916.6aqj57leen72z5tz@orel>
In-Reply-To: <20230118121916.6aqj57leen72z5tz@orel>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 10:25:10 +1000
Message-ID: <CAKmqyKNcd3JOZgPb23idrzVjxHj+HHwPz6f6xPEp2oVGJEZKpg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 00:25:39 -0000

On Wed, Jan 18, 2023 at 10:19 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Jan 18, 2023 at 10:28:46AM +1000, Alistair Francis wrote:
> > On Wed, Jan 18, 2023 at 2:32 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
> ...
> > > > +
> > > > +    /* Get rid of 32-bit/64-bit incompatibility */
> > > > +    for (int i = 0; i < 16; ++i) {
> > > > +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > >
> > > If we ever define mode=1 for rv64, then 'sv32=on' will be incorrectly
> > > accepted as an alias. I think we should simply not define the sv32
> > > property for rv64 nor the rv64-only modes for rv32. So, down in
> > > riscv_add_satp_mode_properties() we can add some
> > >
> > >   #if defined(TARGET_RISCV32)
> > >   ...
> > >   #elif defined(TARGET_RISCV64)
> > >   ...
> > >   #endif
> >
> > Do not add any #if defined(TARGET_RISCV32) to QEMU.
> >
> > We are aiming for the riscv64-softmmu to be able to emulate 32-bit
> > CPUs and compile time macros are the wrong solution here. Instead you
> > can get the xlen of the hart and use that.
> >
>
> Does this mean we want to be able to do the following?
>
>   qemu-system-riscv64 -cpu rv32,sv32=on ...

That's the plan

>
> If so, then can we move the object_property_add() for sv32 to
> rv32_base_cpu_init() and the rest to rv64_base_cpu_init()?
> Currently, that would be doing the same thing as proposed above,
> since those functions are under TARGET_RISCV* defines, but I guess
> the object_property_add()'s would then be in more or less the right
> places for when the 32-bit emulation support work is started.

Sounds like a good idea :)

Alistair

>
> Thanks,
> drew

