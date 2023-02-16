Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSi1x-0002g4-Gc
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 12:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pSi1v-0002eP-H3
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 12:26:47 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pSi1t-0004gC-OC
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 12:26:47 -0500
Received: by mail-pj1-x1029.google.com with SMTP id k24so2577804pji.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 09:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7qphZtO2dn1oVNFvUiCTp/wDCQcDSyw6ghvrNKd9FEc=;
 b=PtOlh0RYjMMbNNa9WqdLwpNtmtbMRsz9U7xMPy2s5sD5fTovXnAkbeWdzbHO1Yl9tG
 r90lmv+pY+6oSmR3VWeZQx37xnpSXD5dv2/TigjJl6nzTNn2uO7uCjeOxY3fLVY3eoU4
 HTaqyrwAAVnY6d4gnz8yxmYY3Ropodjy4aaB7TUGMroc3OrHR8xB7SWWrjVlakye1jqA
 sNYaWbnogn+GDWlB7uXk3+TI3vAs1KKF44StCkA6EUl78S/gHQyhTw4Iq4pTeZ1+JLPq
 EOKzbo+cJ8YMq5E3PVsWkEbfoNUOxzC7RNyfREj5yW8G0szJL3jEX8sMtDV6TJYtzslW
 9VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7qphZtO2dn1oVNFvUiCTp/wDCQcDSyw6ghvrNKd9FEc=;
 b=nO0ZFOJDEGyR9MgWQXS1nfBRfl66i3XP2PkHfOAZWeE23a1FUWbtRzrkP6eGqvrVm/
 qAhZouZnh1clo+tc54ZtT4YpZUgzR4/qTXRaWgM8ciE+Tu/KEsRCrsGEhGXXCRR/1sGh
 AqE1iBI0IRk13RPxY3DcFhjz7JgiSmefq5Hm8GP8hSuNYD0z9/hv44gcfcbmB/Z/tFb+
 /NFy10q/MlOH3R4rcxa9dbGYuMFhg1wdzagN2E0g2oLgVgmhJEM2KZO4qzdmMjQ7gkLJ
 rwA6dMtWks27H/9ODIISoYgfvz6tKBQFRWRkIOnSJJEZH1mzyK2/eTCmcjQb+2boo83I
 feSw==
X-Gm-Message-State: AO0yUKUmLKqfu5rX0RtOAl4hVLi6mg8I0bPYlg+DYRuvFbtCA0/WPpKb
 ikiGNI8WUtA8/P+QjMrsJ0ltAw==
X-Google-Smtp-Source: AK7set+4KwDuQ6otkfJiTqaE+xVET6FZvYKn7mfk3BII8vFrqez/tqdAVBoB73U2azGcOMg2fDVmfQ==
X-Received: by 2002:a17:90a:6485:b0:234:8c58:c325 with SMTP id
 h5-20020a17090a648500b002348c58c325mr3430474pjj.31.1676568404126; 
 Thu, 16 Feb 2023 09:26:44 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a17090b0d8300b0023417fec520sm3476475pjb.44.2023.02.16.09.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:26:43 -0800 (PST)
Date: Thu, 16 Feb 2023 22:56:38 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: dbarboza@ventanamicro.com, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, ajones@ventanamicro.com,
 apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic
 ACPI tables
Message-ID: <Y+5nTk5uRX3ZIpPW@sunil-laptop>
References: <Y+znStpBMx35sSop@sunil-laptop>
 <mhng-53c89287-c232-4852-94bc-b060a336c60f@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-53c89287-c232-4852-94bc-b060a336c60f@palmer-ri-x1c9a>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 17:26:47 -0000

On Thu, Feb 16, 2023 at 08:26:21AM -0800, Palmer Dabbelt wrote:
> On Wed, 15 Feb 2023 06:08:10 PST (-0800), sunilvl@ventanamicro.com wrote:
> > On Tue, Feb 14, 2023 at 05:44:44AM -0300, Daniel Henrique Barboza wrote:
> > > 
> > > 
> > > On 2/14/23 00:43, Sunil V L wrote:
> > > > On Mon, Feb 13, 2023 at 03:48:04PM -0300, Daniel Henrique Barboza wrote:
> > > 
> > > Nah. Doing that now will make this series rely on acks for every other ACPI arch to
> > > push the RISC-V side.
> > > 
> > > Let's make this happen as is now to get ACPI in RISC-V working. We can think about
> > > reducing overall ACPI duplication later. IMO it's enough for now to, mention in this
> > > commit msg, which bits of the arm64 virt-acpi-build.c you changed for this RISC-V
> > > version.
> > > 
> > 
> > Okay. Thanks!. Will update the commit message and send the V3 soon.
> 
> I'm checking up on this one as I don't see a v3 on the lists.  No rush on my
> end, I'm just trying to make sure I don't drop the ball on anything from the
> backlog as I'm catching up.
> 
Thanks!, Plamer. I have sent V3 which is based on Alistair's
riscv-to-apply.next branch.

Thanks,
Sunil

