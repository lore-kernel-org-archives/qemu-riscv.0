Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKG2u-0002LC-7h
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 04:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKG2t-0002Kw-BM
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 04:56:51 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKG2r-00065C-8I
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 04:56:51 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so10491374wmc.1
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=As3ERYDpe1xajWwl0P5phR10L73tho+c84KJAVM3/Kk=;
 b=azvU93JJDfLLeckcdsT0H4q/VO7kqjqomxrqzagbUDpA2AYpJqMgRDRAUOUfKEwAEa
 AcSmUl4O82UPC9AyiCu9DWC8W95/Efe5UmA/SgahBDHB3rJ8eqa74GV+omKM6S3ExAlX
 DMVhv7kFsY7hUAFmA2VvoVWL5RAzZ3NNq6tzr558RgWj4VbjzoxD555Xay3uXEPiK4bb
 5vLudc2IvJCAOiyjkws7/C3TKGVb21IEvBYD3qXhDN/wwLUc2W6mZNXnNhYNsrTrZh+p
 G+MiWcIDmU2MNMGfIiv2ROH5M6QJIqs66l/xc3x5nMFBrEVzqUW3pH00mZWx9j1rmJRb
 hFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=As3ERYDpe1xajWwl0P5phR10L73tho+c84KJAVM3/Kk=;
 b=fzzmqc2tv/pzb+wf43NpiomVt59q0jFI+3cJVy6d2G9HSPgrP3F0uBXTKT1Vw/jQMI
 vINk3zg8JgjoU10VOxrJ+cTOSAKzPABC0YB1nGHqoFdh+GfAXjGHS9anr2HXz/9hNU1f
 8K/g40bjl6NgHj4QWh4E5U6WEYmgjOU2YAncDJSltZRD77llkqyLUXtENEoyfOwK1Rcj
 MDbujFC77ahRrwiHNRGOuPnLiv2nFx3VdPXH/L5017j266kF5tsSEutq3SojuW1QEZzX
 uLrOdeoeq88PVIlJiqVl+sCuDmV3+W9f9c7bWc5brwPTkJDHBawUwtKWqNPSDJ5u7iqg
 NAqg==
X-Gm-Message-State: AFqh2kq3wqGJ0IeSPsIALGLzHpf7AeyVUsvMYkGsffUdjcpzVfnaWh+B
 2oITMafF7zvfyAImRkFunTvA9rYQsxmhdvJ+utOifQ==
X-Google-Smtp-Source: AMrXdXvlUpW+fAmQ9rapa70r/uzL07EUa2hOEg7mAOoLpYYTmX+07w/E9/FSoXB62IhEpvc82OS4tmjU5MSHQwJk/oM=
X-Received: by 2002:a7b:c4d0:0:b0:3db:459:5847 with SMTP id
 g16-20020a7bc4d0000000b003db04595847mr1540405wmk.5.1674554207821; Tue, 24 Jan
 2023 01:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-4-alexghiti@rivosinc.com>
 <20230123101429.a3x6vlatbvbp7kox@orel>
In-Reply-To: <20230123101429.a3x6vlatbvbp7kox@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jan 2023 10:56:37 +0100
Message-ID: <CAHVXubiapF7RS-9vWzvkapsrV3b+eX_MF+5F7Wbg8_+X8iiV_g@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] riscv: Allow user to set the satp mode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 09:56:51 -0000

On Mon, Jan 23, 2023 at 11:14 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jan 23, 2023 at 10:03:22AM +0100, Alexandre Ghiti wrote:
> > RISC-V specifies multiple sizes for addressable memory and Linux probes for
> > the machine's support at startup via the satp CSR register (done in
> > csr.c:validate_vm).
> >
> > As per the specification, sv64 must support sv57, which in turn must
> > support sv48...etc. So we can restrict machine support by simply setting the
> > "highest" supported mode and the bare mode is always supported.
> >
> > You can set the satp mode using the new properties "sv32", "sv39", "sv48",
> > "sv57" and "sv64" as follows:
> > -cpu rv64,sv57=on  # Linux will boot using sv57 scheme
> > -cpu rv64,sv39=on  # Linux will boot using sv39 scheme
> > -cpu rv64,sv57=off # Linux will boot using sv48 scheme
> > -cpu rv64          # Linux will boot using sv57 scheme by default
> >
> > We take the highest level set by the user:
> > -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
> >
> > We make sure that invalid configurations are rejected:
> > -cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
> > -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
> >                            # enabled
> >
> > We accept "redundant" configurations:
> > -cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme
> >
> > And contradictory configurations:
> > -cpu rv64,sv48=on,sv48=off # Linux will boot using sv39 scheme
> >
> > In addition, we now correctly set the device-tree entry 'mmu-type' using
> > those new properties.
>
> This sentence no longer applies to this patch.


Sorry about that and thanks for noticing.

Alex

>
> Thanks,
> drew

