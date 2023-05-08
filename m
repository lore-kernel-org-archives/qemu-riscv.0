Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvyyF-00046e-GY
	for mharc-qemu-riscv@gnu.org; Mon, 08 May 2023 07:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pvyyD-00042k-Ux
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 07:23:57 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pvyyB-0003b1-LZ
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 07:23:57 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-643990c5319so2891567b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 08 May 2023 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683545034; x=1686137034;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+ofjdLNercVI5LMQNf+jvn8/W3gKUapjH2ZhjUVdFJY=;
 b=DpYHpFGMWweuAyTcJs07t70G6HISPsCHWU/Rbh65bey/G0by507PRnHQZt4ZQVY0Xv
 mw+u4mnpH+8ujBPNbzTFpfueO4BW8oYyLA3p0FQsE50IYXLKLDgf4unOY7BuCushhFVe
 nvttN8GLqr5byMFRiDzGuJLyUYSdlV4sKUcGfFZmGaLEzgphOYoKejI65yv8d7YrzzMC
 Qf3BsSESbmzxaew3KRw3MhEk3QybRQlvdY1nrfjKUywwP+tPbyqOGaqFQ2EUL/yGJxQD
 A+K+MjMOhg93hrCOix1WC364/e4M2ivM6CrMtaeuBVtHZKfFTj+aGAsnfW4zFYwG8+k2
 JXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683545034; x=1686137034;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ofjdLNercVI5LMQNf+jvn8/W3gKUapjH2ZhjUVdFJY=;
 b=NIn8Qo0I2ubvthhaYpqRCwRPW+hlDa4dI8gwNP9I6k8LOvIDkTu+KAYKZ4Eqff9aZI
 byAYv2p6/I+RGqPOCAkzL9ayl8Uh5AmKrv+0JobKw3ud4asez/aE4M9tY4XJNIfb6A7g
 XKgwiuJZhsS54Iot2EpFJ+jvM1jFXmP0n8xRQzvHdT1+etBFwvo3mzF1DBBal6/okryy
 xW21EnUaYEh5ZWVALatzN/4UeFQcPutVQlX+Xh2qLZzFu67MCGUGegq+SfncpRaBJ+Cq
 Gi4k0xcyq1YETZyLP0lKpJVs3fLWMp9PHIDAPJg5BU/mghVjEfi6clOzt88fESeJK+Jq
 Glsg==
X-Gm-Message-State: AC+VfDwQ8axqEktyVFkklOwRqDQ01IDJTlcTcfLVxMSunsY8V9dZEREi
 1655R3DbYjQ+uaciDBznkf3hqQ==
X-Google-Smtp-Source: ACHHUZ5A0qLBV4oNnjeaDYQf0btLhRyIyqQGusNyltyvNoSno9kGwON6eSeDn2b7Mqz80UdFswv2Gg==
X-Received: by 2002:a05:6a00:10d3:b0:63b:5496:7afa with SMTP id
 d19-20020a056a0010d300b0063b54967afamr12024661pfu.11.1683545034032; 
 Mon, 08 May 2023 04:23:54 -0700 (PDT)
Received: from sunil-laptop ([106.51.189.144])
 by smtp.gmail.com with ESMTPSA id
 10-20020aa7914a000000b0062e12f945adsm5912519pfi.135.2023.05.08.04.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 04:23:53 -0700 (PDT)
Date: Mon, 8 May 2023 16:53:46 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Message-ID: <ZFjbwh3CdljaHEZZ@sunil-laptop>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 08 May 2023 11:23:58 -0000

On Mon, May 08, 2023 at 03:00:02AM -0700, Andrea Bolognani wrote:
> On Mon, May 08, 2023 at 11:37:43AM +0530, Sunil V L wrote:
> > On Mon, May 08, 2023 at 07:37:23AM +0200, Heinrich Schuchardt wrote:
> > > On 4/25/23 12:25, Sunil V L wrote:
> > > > Currently, virt machine supports two pflash instances each with
> > > > 32MB size. However, the first pflash is always assumed to
> > > > contain M-mode firmware and reset vector is set to this if
> > > > enabled. Hence, for S-mode payloads like EDK2, only one pflash
> > > > instance is available for use. This means both code and NV variables
> > > > of EDK2 will need to use the same pflash.
> > > >
> > > > The OS distros keep the EDK2 FW code as readonly. When non-volatile
> > > > variables also need to share the same pflash, it is not possible
> > > > to keep it as readonly since variables need write access.
> > > >
> > > > To resolve this issue, the code and NV variables need to be separated.
> > > > But in that case we need an extra flash. Hence, modify the convention
> > > > such that pflash0 will contain the M-mode FW only when "-bios none"
> > > > option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> > > > This enables both pflash instances available for EDK2 use.
> > > >
> > > > Example usage:
> > > > 1) pflash0 containing M-mode FW
> > > > qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> > > > or
> > > > qemu-system-riscv64 -bios none \
> > > > -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
> > > >
> > > > 2) pflash0 containing S-mode payload like EDK2
> > > > qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> -machine  virt
> > > > or
> > > > qemu-system-riscv64 -bios <opensbi_fw> \
> > > > -pflash <smode_fw_vars> \
> > > > -pflash <smode_fw_code> \
> > >
> > > On amd64 and arm64 unit=0 is used for code and unit=1 is used for variables.
> > > Shouldn't riscv64 do the same?
> 
> Good catch, I had missed that!
> 
> > Is that a requirement from distros perspective? That was my original v1
> > design.
> >
> > But the reason why I kept unit0 for variables, it helps in keeping current
> > EDK2 usage model work. Otherwise, current EDK2 will break if we change
> > the code to unit 0.
> 
> I think that it's more important to align with other architectures.
> 
> The number of people currently running edk2 on RISC-V is probably
> vanishingly small, and in my opinion requiring them to tweak their
> command lines a bit is a fair price to pay to avoid having to carry a
> subtle difference between architectures for years to come.
> 
It is not just tweaking the command line. The current EDK2 will not work
anymore if code is moved to plfash 0 since EDK2 assumed its entry point
is in pflash1. I agree there may not be too many users but if we have
to align with other archs, there will be combinations of qemu and
edk2 versions which won't work.

> With that in mind, my preference would be to go back to v1.
> 
Thanks!. If this is the preference,  we can request people to use proper
versions of EDK2 with different qemu versions.

> > Second, since unit 0 for RISC-V is currently assumed to start in M-mode fw
> > which is secure, I think it makes sense to keep variables also in unit
> > 0.
> 
> If you're storing variables rather than code in pflash0, does it even
> make sense to talk about M-mode and S-mode?
>
> 
> Taking a step back, what is even the use case for having M-mode code
> in pflash0? If you want to use an M-mode firmware, can't you just use
> -bios instead? In other words, can we change the behavior so that
> pflash being present always mean loading S-mode firmware off it?
>
TBH, I don't know. I am sure Alistair would know since it was added in
https://github.com/qemu/qemu/commit/1c20d3ff6004b600336c52cbef9f134fad3ccd94
I don't think opensbi can be launched from pflash. So, it may be some
other use case which I am now aware of.

I will be happy if this can be avoided by using -bios.

Thanks,
Sunil

