Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pptx0-0005rM-4I
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 12:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pptwx-0005qt-GF
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 12:49:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pptwu-00043r-Om
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 12:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682095768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0XDSLl70BStCziHm8wpEMuwyVP0UPHr5F+JIHcB7XZg=;
 b=LYy+L/F/s3TYhGu8WNrd0pKYERHJqMd5oaC0UBHimQmrAk5ZPZrhgpciTP7OQ8fuifkSd/
 xJbFgey468P+Odu7CZeeluIMW0/siJMM0B8J+BJMm/axdmH2l28IgartoYGlvcyxN2eDH4
 sALWo9mbhpyps/P35jKBo4lS3TuIjbY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-XfQ8btQZNfuCPQIpiq9wtg-1; Fri, 21 Apr 2023 12:48:22 -0400
X-MC-Unique: XfQ8btQZNfuCPQIpiq9wtg-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-24708bfb463so2211987a91.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 09:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095701; x=1684687701;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0XDSLl70BStCziHm8wpEMuwyVP0UPHr5F+JIHcB7XZg=;
 b=iKc/1w3r3poNWyNhOidItGOA88QE7ibh+cf8gUGUYoILbSlfyp6FQ4HmNKhdkL9aqV
 ejNjBscfFazSbD5FUIVj4jE4OQ+RmHDX2uQj5Bx0/bRMVijxpMIDy+7CHqLCDgPTzr1f
 3fuiDZQz6UuQLnpdA27H/HIdmS57dD4kH78HIu8Swmb1yi82ZwB2Wnnn84RnLc9zqZSp
 H3FF+H7V/1HtyN2w+fZP9UxMQa/PlgnApDlOGggWX0ialh3ipD0T2e+DCV+tfmk5mbPJ
 TTDhSz1i0IB9aHrBlY/rgYxK8WAWBl2MxjqTK3XCy4PT6vhgI9jViT099zr36albdeeG
 pP8Q==
X-Gm-Message-State: AAQBX9dziMoEdRCXocN0hk2jzFIm5rk3tumkkqlt3mgeQE1M0EGOX2q2
 PFig1+8+D+dkY9hxIBhr0b/2DJ4V7APnwRn09Tn4J7raQg7Ne/MQtVKRJDmroLJ97J4I3xA4zck
 ZJfK/Or3Wjgi+HTGKbF5K1lLvISpMhPc=
X-Received: by 2002:a17:90a:d901:b0:246:fc58:d77b with SMTP id
 c1-20020a17090ad90100b00246fc58d77bmr5516249pjv.44.1682095700945; 
 Fri, 21 Apr 2023 09:48:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350YhJIjeRVpjh25JBFNkdiCDcSuY8/qsCpccfdC9kciRptCa4HLXlAlLPaVJlsFgcs6wH68OJG8BqIfFsIu8714=
X-Received: by 2002:a17:90a:d901:b0:246:fc58:d77b with SMTP id
 c1-20020a17090ad90100b00246fc58d77bmr5516221pjv.44.1682095700597; Fri, 21 Apr
 2023 09:48:20 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Apr 2023 09:48:19 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20230421043353.125701-1-sunilvl@ventanamicro.com>
 <b882e2cf-8e7f-eacc-27cf-05364a065290@gmx.de>
MIME-Version: 1.0
In-Reply-To: <b882e2cf-8e7f-eacc-27cf-05364a065290@gmx.de>
Date: Fri, 21 Apr 2023 09:48:19 -0700
Message-ID: <CABJz62ME20bT8v9TK4h+RcujHK_eY+wRF1UK9aN+Ww8Fg_=QQg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Enable booting M-mode or S-mode FW from
 pflash0
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 21 Apr 2023 16:49:32 -0000

On Fri, Apr 21, 2023 at 04:36:15PM +0200, Heinrich Schuchardt wrote:
> On 4/21/23 06:33, Sunil V L wrote:
> > Currently, virt machine supports two pflash instances each with
> > 32MB size. However, the first pflash is always assumed to
> > contain M-mode firmware and reset vector is set to this if
> > enabled. Hence, for S-mode payloads like EDK2, only one pflash
> > instance is available for use. This means both code and NV variables
> > of EDK2 will need to use the same pflash.
> >
> > The OS distros keep the EDK2 FW code as readonly. When non-volatile
> > variables also need to share the same pflash, it is not possible
> > to keep it as readonly since variables need write access.
> >
> > To resolve this issue, the code and NV variables need to be separated.
> > But in that case we need an extra flash. Hence, modify the convention
> > such that pflash0 will contain the M-mode FW only when "-bios none"
> > option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> > This enables both pflash instances available for EDK2 use.
> >
> > Example usage:
> > 1) pflash0 containing M-mode FW
> > qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> > or
> > qemu-system-riscv64 -bios none \
> > -drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt
> >
> > 2) pflash0 containing S-mode payload like EDK2
> > qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -machine  virt
> > or
> > qemu-system-riscv64 -bios <opensbi_fw> \
> > -pflash <smode_fw_code> \
> > -pflash <smode_vars> \
> > -machine  virt
> > or
> > qemu-system-riscv64 -bios <opensbi_fw> \
> > -drive file=<smode_fw_code>,if=pflash,format=raw,unit=0,readonly=on \
> > -drive file=<smode_fw_vars>,if=pflash,format=raw,unit=1 \
> > -machine virt
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>
> QEMU 7.2 (and possibly 8.0 to be released) contains the old behavior.
>
> Changed use of command line parameters should depend on the version of
> the virt machine, i.e. virt-7.2 should use the old behavior and virt as
> alias for virt-8.0 should use the new behavior. Please, have a look at
> the option handling in hw/arm/virt.c and macro DEFINE_VIRT_MACHINE().

I would normally agree with you, but note that RISC-V doesn't have
versioned machine types yet, so this kind of breakage is not
necessarily unexpected.

From libvirt's point of view, being able to detect whether the new
behavior is implemented by looking for some machine type property
would be enough to handle the transition smoothly. That would of
course not help people running QEMU directly.

For what it's worth, this change seems to go in the right direction
by making things similar to other architectures (x86, Arm) so I'd
love to see it happen.

-- 
Andrea Bolognani / Red Hat / Virtualization


