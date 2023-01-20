Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIo5B-0000bE-KG
	for mharc-qemu-riscv@gnu.org; Fri, 20 Jan 2023 04:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pIo5A-0000ar-8f
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 04:53:12 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pIo58-00045q-1G
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 04:53:11 -0500
Received: by mail-ed1-x533.google.com with SMTP id g11so584657eda.12
 for <qemu-riscv@nongnu.org>; Fri, 20 Jan 2023 01:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mPkpXGaU5JZcM+1KIT2mwFscJSAj4VB4hTMUVmeS2MQ=;
 b=n5TUoCX0oWwHOZX/XskT7bczNGXpnmOCN0G3i/2NR3MQY7uBUVW8gK/9Zk0oDsM5X+
 5sElUYk4Hi5Vi9wC0qeKt4uEsge8bp6jWJ49+c9lvj/oYvi2kaR+aHMfHAfG3o6fhI61
 Ij9xDqOc3vbdr2ybibHGf6eRVsRp+kja9yPNifLASEZAlYcTY9pzi2aiGUeB3Lw/NTix
 dA5vCOBcFXNjQRtJZDs3hMhlaXLNXwHcft119iLJbT9XueMdd+BhXr0ANmY1ihOSIQDp
 bGng0uCY/OBPWeOr7HOXWcbvwTnyc67qU0csUzBOCiqpj2diY1OXRC/Y4zgxuKIsukgj
 mYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPkpXGaU5JZcM+1KIT2mwFscJSAj4VB4hTMUVmeS2MQ=;
 b=gS1Z0uHweHt+FOZEsMjGIhYMkfnED4U7gX1dH3cnyOPtPq8AlmgfnE8InshHVYLOYr
 a2PwoaMgyOdQWbq9KOL1QsAMCN34TIemzreaJI1ZskKUJmWbU1Ji6xEivy+C9WtQ0TYY
 FcVYP0BG5Htk8T0iqF16n8N2lSTSEM9bX3mwxAwQUetCmIbZsI8l2BRUGUjDOcECUsEN
 8c9Or6sU0hHi8Y/305C783ulMdhdeKh+PL6nwq2GneZpS7wgPPrcoe+tkLlB3b8z/sLl
 RhTmPzDON66975eyt/F9eT2erhszg1Rs+Oy5m1OtR99buT/ty9zKx0t/8yXLAY8vKPB2
 qI0w==
X-Gm-Message-State: AFqh2kopjNv7oRMu8JkybXYogAaQ7mgHMvy5FZwsKuZMhQaPh23lqD20
 MhQT6lwoHEVvbICwd5Te3oSnfw==
X-Google-Smtp-Source: AMrXdXuB8uIoLtj3teV6Ihk8+bQGPNRwN3OYED1ZjCfOu6Im2/6tpIXJ9Px3/DdyTRF/duSFu+yGcg==
X-Received: by 2002:a05:6402:388c:b0:49a:6a2:6f2f with SMTP id
 fd12-20020a056402388c00b0049a06a26f2fmr17283714edb.4.1674208387770; 
 Fri, 20 Jan 2023 01:53:07 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 r28-20020a056402035c00b0049ebbee7134sm340516edw.94.2023.01.20.01.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 01:53:07 -0800 (PST)
Date: Fri, 20 Jan 2023 10:53:06 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
Message-ID: <20230120095306.yyqq36dliabni3h3@orel>
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
 <20230117163138.jze47hjeeuwu2k4j@orel>
 <CAKmqyKNFX_ovg4Bp_30o0g4Jd5XJ98i9LdFgejsDmGW4iL2+OA@mail.gmail.com>
 <20230118121916.6aqj57leen72z5tz@orel>
 <CAKmqyKNcd3JOZgPb23idrzVjxHj+HHwPz6f6xPEp2oVGJEZKpg@mail.gmail.com>
 <CAHVXubiW2OaMhe3STLLMz=wDPJeY8hvPHbuBJgL7KZyw4=pRpw@mail.gmail.com>
 <CAKmqyKNNocLxKJtBtFnZkbTdCwC=TKaHpm4Sunut49nxQyw8yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKNNocLxKJtBtFnZkbTdCwC=TKaHpm4Sunut49nxQyw8yA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 20 Jan 2023 09:53:12 -0000

On Fri, Jan 20, 2023 at 09:46:05AM +1000, Alistair Francis wrote:
> On Thu, Jan 19, 2023 at 11:00 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> >
> > Hi Alistair, Andrew,
> >
> > On Thu, Jan 19, 2023 at 1:25 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Wed, Jan 18, 2023 at 10:19 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > On Wed, Jan 18, 2023 at 10:28:46AM +1000, Alistair Francis wrote:
> > > > > On Wed, Jan 18, 2023 at 2:32 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > > >
> > > > > > On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
> > > > ...
> > > > > > > +
> > > > > > > +    /* Get rid of 32-bit/64-bit incompatibility */
> > > > > > > +    for (int i = 0; i < 16; ++i) {
> > > > > > > +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > > > > >
> > > > > > If we ever define mode=1 for rv64, then 'sv32=on' will be incorrectly
> > > > > > accepted as an alias. I think we should simply not define the sv32
> > > > > > property for rv64 nor the rv64-only modes for rv32. So, down in
> > > > > > riscv_add_satp_mode_properties() we can add some
> > > > > >
> > > > > >   #if defined(TARGET_RISCV32)
> > > > > >   ...
> > > > > >   #elif defined(TARGET_RISCV64)
> > > > > >   ...
> > > > > >   #endif
> > > > >
> > > > > Do not add any #if defined(TARGET_RISCV32) to QEMU.
> > > > >
> > > > > We are aiming for the riscv64-softmmu to be able to emulate 32-bit
> > > > > CPUs and compile time macros are the wrong solution here. Instead you
> > > > > can get the xlen of the hart and use that.
> > > > >
> > > >
> > > > Does this mean we want to be able to do the following?
> > > >
> > > >   qemu-system-riscv64 -cpu rv32,sv32=on ...
> > >
> > > That's the plan
> > >
> > > >
> > > > If so, then can we move the object_property_add() for sv32 to
> > > > rv32_base_cpu_init() and the rest to rv64_base_cpu_init()?
> 
> Wait! Sorry I didn't read this carefully enough. No, that is not what
> we want to do. That then won't support the vendor CPUs.
> 
> We just want to add the properties to all CPUs. Then if an invalid
> option is set we should return an error.
> 
> Note that the 64-bit only configs can be hidden behind a #if
> defined(TARGET_RISCV64).

OK, so we want the original suggestion of putting an
'if defined(TARGET_RISCV64)' in riscv_add_satp_mode_properties(),
which is called from register_cpu_props(), for the 64-bit only
configs, but to support emulation we can't put sv32 under an
'if defined(TARGET_RISCV32)'. Instead, we need to check the xlen
supported by the cpu type. That makes sense to me, and I think
it'd be easiest to do in cpu_riscv_set_satp() with something like

  if (!strncmp(name, "rv32", 4) &&
      RISCV_CPU(obj)->env.misa_mxl != MXL_RV32) {
     ... fail with error message ...
  }

Thanks,
drew

