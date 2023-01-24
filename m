Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKLHF-0007Sh-NQ
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 10:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pKLHE-0007SI-8G
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 10:32:00 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pKLHC-0005qT-3q
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 10:31:59 -0500
Received: by mail-ej1-x62f.google.com with SMTP id mg12so40010563ejc.5
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 07:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5ontTpgHnhGGx/x0+gbQVZARerX19A7cazWXxmOfuwE=;
 b=hB/+otqWBol4G4X00uCQK/kRO8q9ANhBV9p1tL4L2r/BS4fi2uAXRE35+kp3ihZxvs
 jhoSaV6Q8p2JUVXRfI6Nwa8/6zpLl/K8Q4apigZkiYFdEi3rgLHl9HO5E8xk4QOpJkw8
 +VR4U/fe3kyiP8nB0eA+lwZDCJcyNyUQdURATl5tS6Squd+LUJ2bBE9XJ5Y7hh9FoiSZ
 dbQ/fxB8lKi6sIRtANhM9bj55J6kH7PIDMlXXBCQqSXnCjh8HZe2nZMEnW6aerkU5w16
 GxBntCnW877fcMHsrxIE00OyASj+2pnoVOUWVGPB+k5yOToZGjNp6g5QFeBXUVHa1sVg
 8n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ontTpgHnhGGx/x0+gbQVZARerX19A7cazWXxmOfuwE=;
 b=gBwFiXbPc3d435OBaDxQzlNi9FaekeQb8RSh6RuWXkfK83xRZV56vXxOdUS6KvjFh9
 SBmkISLwfYRl/jo/BsYsYoRszLwZj6Daut1vxpdld4DnO+R7dGzchWm9oqlnIDAExeD+
 d5PwXN3G5VNSGYG659QurQQpgcXxf826qX+ZEsCs5C2pYf0x/nyuE61fIbjj4vE46HGB
 o2iFmLy4drth/LOXStDPYHod65EJv/L7V2M5z/DL92splQT+IrWpnOCwLUNJtZsApoNq
 KuDizefLW34S9XAaXZr7mRaxUKaBL3yE8gt0PAGa39b5BKUULcIQyWLuRpriHDIDXLRm
 6PWQ==
X-Gm-Message-State: AFqh2krdQyPAlRcQJiL1/Lq43VyamPnNQFO6Yjgpu1Rru7EFOVAVjCRD
 bQ2sjRCG1dUZZBTi5cR2zfF90Q==
X-Google-Smtp-Source: AMrXdXt+qcSc5sKYx2vlV0k1/3Holy755ocQIc+2zxEFsLo5Y1uxBDCCTL54OJiOxEcjQe8W3KFFFQ==
X-Received: by 2002:a17:906:a84f:b0:84d:465f:d2f9 with SMTP id
 dx15-20020a170906a84f00b0084d465fd2f9mr30748060ejb.67.1674574316224; 
 Tue, 24 Jan 2023 07:31:56 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090617c400b0081bfc79beaesm1026873eje.75.2023.01.24.07.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 07:31:55 -0800 (PST)
Date: Tue, 24 Jan 2023 16:31:54 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 5/5] riscv: Introduce satp mode hw capabilities
Message-ID: <20230124153154.rtffytklzyeidd6b@orel>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-6-alexghiti@rivosinc.com>
 <20230123105112.zidabgiswkpnzo5r@orel>
 <CAHVXubjvwF+VOqKSXOF8WZsjY+NzEEXVKyAxh+L02Shu0TKASA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVXubjvwF+VOqKSXOF8WZsjY+NzEEXVKyAxh+L02Shu0TKASA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 24 Jan 2023 15:32:00 -0000

On Tue, Jan 24, 2023 at 11:07:53AM +0100, Alexandre Ghiti wrote:
> On Mon, Jan 23, 2023 at 11:51 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Mon, Jan 23, 2023 at 10:03:24AM +0100, Alexandre Ghiti wrote:
> > > Currently, the max satp mode is set with the only constraint that it must be
> > > implemented in qemu, i.e. set in valid_vm_1_10_[32|64].
> > >
> > > But we actually need to add another level of constraint: what the hw is
> > > actually capable of, because currently, a linux booting on a sifive-u54
> > > boots in sv57 mode which is incompatible with the cpu's sv39 max
> > > capability.
> > >
> > > So add a new bitmap to RISCVSATPMap which contains this capability and
> > > initialize it in every XXX_cpu_init.
> > >
> > > Finally, we have the following chain of constraints:
> > >
> > > Qemu capability > HW capability > User choice > Software capability
> >
> >                                                   ^ What software is this?
> >                          I'd think the user's choice would always be last.
> 
> Hmm maybe that's not clear, but I meant that the last constraint was
> what the emulated software is capable of handling.

Assuming "emulated software" is the guest OS, then OK. How about rewording
as

target/riscv's general satp mode support constrains what the boards
support and the boards constrain what the user may select. The user's
selection will then constrain what's available to the guest OS.

Thanks,
drew

