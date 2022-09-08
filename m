Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWFZt-00054y-Do
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 07:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oWFZr-00050t-H8
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 07:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oWFZn-0003lL-Td
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 07:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662636006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f3yVar5BHwfemzbv7AvxJbI8BMmPIogQtx9G7he5bBA=;
 b=Foa6920n6v9Z9rl+Lz/mvmmxkjuHsITwe3Fv3UzDsBWxNuyF1eA8AM4NHazmavpqmB/jzL
 QndfRJxf7z0J8/dbXP3i9rPOJUch94WPfkY0pQWWnSaoRcM/p0Vr+vao6AHdY8ZAkeHKNu
 ofwG5bnG8dpAH+hs5ZNjc0PVENd7o/o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-UdpsHN3xO0e9xQYvqYwS6w-1; Thu, 08 Sep 2022 07:20:03 -0400
X-MC-Unique: UdpsHN3xO0e9xQYvqYwS6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BF80185A794;
 Thu,  8 Sep 2022 11:20:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B67A3C15BB3;
 Thu,  8 Sep 2022 11:20:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 51F1318009BE; Thu,  8 Sep 2022 13:19:59 +0200 (CEST)
Date: Thu, 8 Sep 2022 13:19:59 +0200
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
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflashy
Message-ID: <20220908111959.e3lssz2xbqsnr57p@sirius.home.kraxel.org>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
 <20220906123200.GA237800@sunil-laptop>
 <20220907071037.tnnewqhi5v2xmiln@sirius.home.kraxel.org>
 <20220908102527.GB88864@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908102527.GB88864@sunil-laptop>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 08 Sep 2022 11:20:12 -0000

  Hi,

> Thanks Gerd. One question: Is it possible to have separate code + vars
> even when there is TF-A? My understanding is, TF-A will take one drive
> and will be hidden from the non-secure word. So, there is only one flash
> left for edk2. Is that correct?

Yes.

> In RISC-V, I think we have the this situation always since M-mode is
> mandatory. The first flash is always reserved for secure fw. So, we will
> have to increase the number of flash supported to 3 to support edk2 use
> case.

Well.  Adding one more flash is certainly the easiest approach.  Another
possible option would be to have the secure world store the efi variables.
That might be needed anyway for secure boot support.

> I have a fix RISC-V which resolves truncate issue leveraging logic from
> x86. It also creates 2 flash drives within non-secure space.
> EDK2 also needs to be modified to work with smaller code flash. But
> because the patch takes care of the actual size, it allows to have
> bigger code and smaller var images.

The size of the code flash and thereby the address of the varstore is
known at compile time too, so yes, that approach should work fine.

Note that changing the flash size can lead to compatibility problems
(for example when live migrating), so I'd suggest to be generous with
code/vars sizes.  On x64 the upstream default flash size is 2M and when
all compile-time options are enabled things don't fit any more.

So, assuming size figures are roughly the same for risc-v, I'd suggest
to go for 4M or 8M code flash and 1M vars flash.

> Same thing can be adopted to arm also since both seem to follow the same
> logic.

Yes.  The tricky part here is dealing with backward compatibility and
the transition from padded to non-padded images.  I suspect at the end
of the day keeping the vars flash mapping fixed at 64M (and have a hole
between code and vars) will be easier.

> But I think that will be a separate patch than this series. I
> will run that as a separate RFC patch. Is that fine?

No objections.

take care,
  Gerd


