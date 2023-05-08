Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvxfA-0000VM-DC
	for mharc-qemu-riscv@gnu.org; Mon, 08 May 2023 06:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pvxf8-0000V2-UX
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 06:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pvxf6-0003O8-3F
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 06:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683540006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=89hOd7nzbW5/1T2/ib/M8iZxUKL0VQI9fYKEdbulXQ0=;
 b=dFxENnleCPndb/ZkMg7tv8DiPs+z5ytGv3kOhpX1p2zSJnh8nq4JZM4Wc3TEdOZNBdV2Dm
 P7VsGkjQ4tTfRdZA/dJGHOqrUfG4vHG3VDZNdZcPf37A4U6XuyXzHSyq1uBF9nebEYEp5G
 gth1PcMUYgOmTLLUWoMOXDNbuRLlk70=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-8A2NPHHsMmKGbIVGbcwW7A-1; Mon, 08 May 2023 06:00:04 -0400
X-MC-Unique: 8A2NPHHsMmKGbIVGbcwW7A-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-24e5481a79fso2277716a91.2
 for <qemu-riscv@nongnu.org>; Mon, 08 May 2023 03:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683540003; x=1686132003;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=89hOd7nzbW5/1T2/ib/M8iZxUKL0VQI9fYKEdbulXQ0=;
 b=GAxHcC1kaut6xHfwM8Y59J7yGEfKQ3l6Jsq4ejGs5jA2uy7siBJzoJCVOaMGMuuCKI
 tvrlgN0oc1wul8luu5Oo0mboLV3W1LJ7RiD8iBYlJwInIAjHtorc02oSq5kv1if0LiDu
 OJ+oYQSsQOiHT8nuNznny6IXCagNAk0hjEJ/WtIvH1QtrNGWKdSMCWUNmeUdKVmVrAk+
 jdz/6M/cLEw9/iLNHZcFdIfRupWOZ+8EXLsnv01FnHW4tIZhyRqburGh4ea0JNMppy0V
 W3jrH6trZMZ7omOvEH23oSWlS8n1WiuPfQYd+Sf1WjNl1Tpb6+BLDdoBbl14j9ENGdnM
 bthg==
X-Gm-Message-State: AC+VfDyXM7su8+CvXBBoVfzQNlXsnn0Q3g8AKDngxrX4611werlVpJlp
 cqAn94+QHcordyXJbQ2D8a7qTkOanEPFL4alzHVkLuEGjaWQL135DNZvEBAbODFyipX4RxqVI9g
 y50cFx40mK0a4fvmK4p/anLTXFtMFK0M=
X-Received: by 2002:a17:90a:2cc7:b0:24e:6a6:cd6 with SMTP id
 n65-20020a17090a2cc700b0024e06a60cd6mr10369381pjd.29.1683540003230; 
 Mon, 08 May 2023 03:00:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7VEOMrYOBHe8hEp9dOvZbTiaZry58Rin8YzdHkk+Llwf5idmv0fTMyerIBk1b/0lAwBcyn/Vh/GcFAEYEXA8U=
X-Received: by 2002:a17:90a:2cc7:b0:24e:6a6:cd6 with SMTP id
 n65-20020a17090a2cc700b0024e06a60cd6mr10369357pjd.29.1683540002918; Mon, 08
 May 2023 03:00:02 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 May 2023 03:00:02 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
MIME-Version: 1.0
In-Reply-To: <ZFiRr8d2zyAJlZJv@sunil-laptop>
Date: Mon, 8 May 2023 03:00:02 -0700
Message-ID: <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 08 May 2023 10:00:11 -0000

On Mon, May 08, 2023 at 11:37:43AM +0530, Sunil V L wrote:
> On Mon, May 08, 2023 at 07:37:23AM +0200, Heinrich Schuchardt wrote:
> > On 4/25/23 12:25, Sunil V L wrote:
> > > Currently, virt machine supports two pflash instances each with
> > > 32MB size. However, the first pflash is always assumed to
> > > contain M-mode firmware and reset vector is set to this if
> > > enabled. Hence, for S-mode payloads like EDK2, only one pflash
> > > instance is available for use. This means both code and NV variables
> > > of EDK2 will need to use the same pflash.
> > >
> > > The OS distros keep the EDK2 FW code as readonly. When non-volatile
> > > variables also need to share the same pflash, it is not possible
> > > to keep it as readonly since variables need write access.
> > >
> > > To resolve this issue, the code and NV variables need to be separated.
> > > But in that case we need an extra flash. Hence, modify the convention
> > > such that pflash0 will contain the M-mode FW only when "-bios none"
> > > option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> > > This enables both pflash instances available for EDK2 use.
> > >
> > > Example usage:
> > > 1) pflash0 containing M-mode FW
> > > qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> > > or
> > > qemu-system-riscv64 -bios none \
> > > -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
> > >
> > > 2) pflash0 containing S-mode payload like EDK2
> > > qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> -machine  virt
> > > or
> > > qemu-system-riscv64 -bios <opensbi_fw> \
> > > -pflash <smode_fw_vars> \
> > > -pflash <smode_fw_code> \
> >
> > On amd64 and arm64 unit=0 is used for code and unit=1 is used for variables.
> > Shouldn't riscv64 do the same?

Good catch, I had missed that!

> Is that a requirement from distros perspective? That was my original v1
> design.
>
> But the reason why I kept unit0 for variables, it helps in keeping current
> EDK2 usage model work. Otherwise, current EDK2 will break if we change
> the code to unit 0.

I think that it's more important to align with other architectures.

The number of people currently running edk2 on RISC-V is probably
vanishingly small, and in my opinion requiring them to tweak their
command lines a bit is a fair price to pay to avoid having to carry a
subtle difference between architectures for years to come.

With that in mind, my preference would be to go back to v1.

> Second, since unit 0 for RISC-V is currently assumed to start in M-mode fw
> which is secure, I think it makes sense to keep variables also in unit
> 0.

If you're storing variables rather than code in pflash0, does it even
make sense to talk about M-mode and S-mode?


Taking a step back, what is even the use case for having M-mode code
in pflash0? If you want to use an M-mode firmware, can't you just use
-bios instead? In other words, can we change the behavior so that
pflash being present always mean loading S-mode firmware off it?

-- 
Andrea Bolognani / Red Hat / Virtualization


