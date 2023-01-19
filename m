Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIUXB-0000hy-4S
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 08:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pIUX3-0000ft-T8
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 08:00:41 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pIUX1-0003FY-Rs
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 08:00:41 -0500
Received: by mail-wm1-x336.google.com with SMTP id l8so1457737wms.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 05:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mJ59X8qvZ0OxgCdyk0FiP0qoA8+ZAAuGaypD9TreqRA=;
 b=PVHB/13Ke6MPMyZX5sQ6psCm4D9CNCMLISYgiHV8uj/3Cj2hKJYgV2R+gUuD8wRT8f
 i38O2L5vSMlhqy+kZSxtGGUlpcRseVwMD96ZL/vpX+4g8/frKgGExrE4qG5tsI8tZ/Zw
 xKpBqHRpRKMSS+jJ+kZVKQId2DKmXgywhaVD/n+TtURx9UgsFSy6bz0BGeM+uYmSYmrE
 NXZBKWdA5cnG2Y+YlHfv7PnrfHB3eNv0O2wymY0r4ouOGN1mdPuBSEvKc120ziI4vwh2
 +m/F8fRlSQkjFO+YiaKPgjafd8MvE9a0SpKgCkz3yehZSKmGcnoDzH6ah8h0odpxPlsW
 WVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mJ59X8qvZ0OxgCdyk0FiP0qoA8+ZAAuGaypD9TreqRA=;
 b=1iy1p6qH33hLMmRiqVTL2gdBQI3ZjYo8hCN8CkavgXtKXvMPSLBk84w/ggaDzQcvd7
 iK1gWiI4Zfojrdj1ZLAB2IKuuPoNP9JI53OgQCLXQKuGb5CY6URVT4KRdl9X3HtmkjNk
 D1HLjHneECGSeJhAWql950oAevX9cT3OZj1AoB9ilZKF61YoPA8cux2PYwcjbnzY7HIi
 NnGzEuANCDDtSU/DxDe4wdwe0F/NLTcIBq6TJQkqAORc/bvQTEy/sU0svuFVVOQKPAB0
 eNCLnfeLiEbHmzLDOt5IKKza+Gxc1Ii5UWo0ldoOlj28onrPsoU2cGE3ZlVeAXha2Qkq
 /eXQ==
X-Gm-Message-State: AFqh2ko0M64wCNRJmSqOQr9+BY8Ov5KE7S4A4lARMS0QBE0cHryhVxX/
 vxm3J9wwGjwJLdGL9PgSr9VWIe4queYGCWlZrKi+3w==
X-Google-Smtp-Source: AMrXdXvhMC7doBZVizyhFSA9n12D8D11hwJXe12MONTTupjsJk8gRZMto79DwqMxQ6M1nL8cLbjgl3qr6vdlA7/fdk0=
X-Received: by 2002:a7b:c4d0:0:b0:3db:459:5847 with SMTP id
 g16-20020a7bc4d0000000b003db04595847mr601374wmk.5.1674133237958; Thu, 19 Jan
 2023 05:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
 <20230117163138.jze47hjeeuwu2k4j@orel>
 <CAKmqyKNFX_ovg4Bp_30o0g4Jd5XJ98i9LdFgejsDmGW4iL2+OA@mail.gmail.com>
 <20230118121916.6aqj57leen72z5tz@orel>
 <CAKmqyKNcd3JOZgPb23idrzVjxHj+HHwPz6f6xPEp2oVGJEZKpg@mail.gmail.com>
In-Reply-To: <CAKmqyKNcd3JOZgPb23idrzVjxHj+HHwPz6f6xPEp2oVGJEZKpg@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 19 Jan 2023 14:00:27 +0100
Message-ID: <CAHVXubiW2OaMhe3STLLMz=wDPJeY8hvPHbuBJgL7KZyw4=pRpw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
To: Alistair Francis <alistair23@gmail.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 13:00:42 -0000

Hi Alistair, Andrew,

On Thu, Jan 19, 2023 at 1:25 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jan 18, 2023 at 10:19 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Wed, Jan 18, 2023 at 10:28:46AM +1000, Alistair Francis wrote:
> > > On Wed, Jan 18, 2023 at 2:32 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
> > ...
> > > > > +
> > > > > +    /* Get rid of 32-bit/64-bit incompatibility */
> > > > > +    for (int i = 0; i < 16; ++i) {
> > > > > +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > > >
> > > > If we ever define mode=1 for rv64, then 'sv32=on' will be incorrectly
> > > > accepted as an alias. I think we should simply not define the sv32
> > > > property for rv64 nor the rv64-only modes for rv32. So, down in
> > > > riscv_add_satp_mode_properties() we can add some
> > > >
> > > >   #if defined(TARGET_RISCV32)
> > > >   ...
> > > >   #elif defined(TARGET_RISCV64)
> > > >   ...
> > > >   #endif
> > >
> > > Do not add any #if defined(TARGET_RISCV32) to QEMU.
> > >
> > > We are aiming for the riscv64-softmmu to be able to emulate 32-bit
> > > CPUs and compile time macros are the wrong solution here. Instead you
> > > can get the xlen of the hart and use that.
> > >
> >
> > Does this mean we want to be able to do the following?
> >
> >   qemu-system-riscv64 -cpu rv32,sv32=on ...
>
> That's the plan
>
> >
> > If so, then can we move the object_property_add() for sv32 to
> > rv32_base_cpu_init() and the rest to rv64_base_cpu_init()?
> > Currently, that would be doing the same thing as proposed above,
> > since those functions are under TARGET_RISCV* defines, but I guess
> > the object_property_add()'s would then be in more or less the right
> > places for when the 32-bit emulation support work is started.
>
> Sounds like a good idea :)

What about riscv_any_cpu_init and riscv_host_cpu_init?

>
> Alistair
>
> >
> > Thanks,
> > drew

