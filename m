Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVpD0-0002us-K4
	for mharc-qemu-riscv@gnu.org; Wed, 07 Sep 2022 03:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVpCx-0002t3-Vh
 for qemu-riscv@nongnu.org; Wed, 07 Sep 2022 03:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVpCu-00050W-HH
 for qemu-riscv@nongnu.org; Wed, 07 Sep 2022 03:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662534643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ye84sSO4TJJGNbJlw+HOZp0V+DuC21ZtM5EaaO1Apb0=;
 b=A0iK1IuHoZ1Jrul+ITFXdD3QwIdXcKoeoGx+DZAMeJAYalaXZBcZeKJuOFXFtxjYlOi7Yv
 SJpvFLidBWGmmqxEpbQUOUTykFddFZVMqJqqg5CUHW9T92uhXCNzRtaDUqj3eLkTE8D+BO
 +wczQLjFnSU8QZTJO3bfw54mfBPxKSI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-x_8PSx0POoqBkZY72XfdGA-1; Wed, 07 Sep 2022 03:10:40 -0400
X-MC-Unique: x_8PSx0POoqBkZY72XfdGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EC202999B4E;
 Wed,  7 Sep 2022 07:10:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DA7F1121314;
 Wed,  7 Sep 2022 07:10:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2FA23180039B; Wed,  7 Sep 2022 09:10:37 +0200 (CEST)
Date: Wed, 7 Sep 2022 09:10:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
Message-ID: <20220907071037.tnnewqhi5v2xmiln@sirius.home.kraxel.org>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
 <20220906123200.GA237800@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906123200.GA237800@sunil-laptop>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 07 Sep 2022 07:10:48 -0000

On Tue, Sep 06, 2022 at 06:02:00PM +0530, Sunil V L wrote:
> Hi Gerd,
> 
> On Tue, Sep 06, 2022 at 12:41:28PM +0200, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > 3)Make the EDK2 image size to match with what qemu flash expects
> > > truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd
> > 
> > Hmm, we have that kind of padding on arm too (64M for code and 64M for
> > vars) and only a fraction of the space is actually used, which isn't
> > exactly ideal.  So not sure it is a good plan to repeat that on riscv.
> 
> Yeah.. but it looks like limitation from qemu flash emulation. Do you mean
> this limitation exists for arm in general on real flash also?

Well, at least on x86 flash devices can have odd sizes.  I don't think
the qemu pflash emulation dictates anything here.

I think the underlying problem we actually have in qemu is that the
flash size indirectly dictates the memory layout.  We pack the flash
devices next to each other, on x86 downwards from 4G, on arm upwards
from zero, not sure what risc-v is dong here.

edk2 arm code expects the variable store being mapped at 64m.  So
QEMU_EFI.fd (which is actually 2M in size) gets padded to 64m, which
has the desired effect that the next flash device (the varstore) is
mapped at 64m.  But also has the side effect that we map 62m of zeros
into the guest address space ...

The vars file is padded to 64m for consistency with the code.  Not
padding the vars file should have no bad side effects I think, except
for live migration where the flash size change might cause
compatibility problems.

Not padding the code file needs some alternative way to specify the
memory layout, to make sure the vars flash continues to be mapped at
64m even when the code flash is smaller.  Cc'ed Pawel who investigates
that right now.

One possible option is to just hard-code the flash memory layout per
machine type or per architecture.  Another option would be to add
some way to configure that on the command line.

take care,
  Gerd


