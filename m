Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntWtj-0008Ht-Mh
	for mharc-qemu-riscv@gnu.org; Tue, 24 May 2022 11:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1ntWte-0008DO-6z
 for qemu-riscv@nongnu.org; Tue, 24 May 2022 11:56:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1ntWta-000831-Co
 for qemu-riscv@nongnu.org; Tue, 24 May 2022 11:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653407788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p9z539A01CntyWszl/+scH5Wk/FHqsaRZcJWhoUeVHs=;
 b=fWf2iNoEzXS0TPRhph3IRHsI4k4I6aAiCm0kePj+BysyU7WnZO550eXI7BRlle44Wavqpj
 B/bRbk8AjnaorAxUKz3Stq04tM1i1HfoDUun93LQjsaNmOBOIVWn53e2ltXybkLWXFasPD
 +YUrTR6q/JRCcxgFwVKsHi632O/HUxk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-4_3z26BVO1KxdMrTEv3pDQ-1; Tue, 24 May 2022 11:56:27 -0400
X-MC-Unique: 4_3z26BVO1KxdMrTEv3pDQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2d7eaa730d9so156648257b3.13
 for <qemu-riscv@nongnu.org>; Tue, 24 May 2022 08:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=p9z539A01CntyWszl/+scH5Wk/FHqsaRZcJWhoUeVHs=;
 b=ObimzYrKAlaP3KMgsd42/4WYUAQknPyvHNe8oMU8sl+MnL5IxOve8pERQOLVU7MKpH
 lCZO8R/3GktEI/aCzy4eR5mZeKlpYlCwi88XMMAj/asBksdnrf5AKoMa5XBdP/7zosIw
 0Oed/cYQTJD15GXiFv51xU9BscyJ9vaMQ3/S6ZoMxBS9/luyk2h2ymkMoclcbxsx/tyv
 +r5wp6n3un0Y1mWofHsEkz8/4bO2ILyLFM0/s+vNhyDdqTYlhCStrY5ogilup9Stsjmd
 7tZ/quxKZI4/NbBdZwcoGn5jteh1v4TMe9WZRWyfb2QpQIYCdGOby2Hx+rQ+wRi2+QzD
 dnUg==
X-Gm-Message-State: AOAM531ahFuWOeWWdilTVm9SPHmMj+6s502unGkUCmsMhJJJuFizeeg9
 xTnZRrWkpgQExzDIlkNoQ6pXDKErjFX4Hu/j5q+rev4vBW7ui5hta38ob/dfBtkbHOznNFuMe3m
 BrhgToonExPVgAVGBv4Iekzu9kUrI5mU=
X-Received: by 2002:a81:2fc5:0:b0:2fe:d7d1:4315 with SMTP id
 v188-20020a812fc5000000b002fed7d14315mr29213509ywv.87.1653407786855; 
 Tue, 24 May 2022 08:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYAtSL5ly3qwTmSKsHsblvjZp8hx20KNjpC8agyFHAcPfJzLtt9w3C0q3j8n7Kdw9V1YeuT2XTh2SoClhpJHE=
X-Received: by 2002:a81:2fc5:0:b0:2fe:d7d1:4315 with SMTP id
 v188-20020a812fc5000000b002fed7d14315mr29213495ywv.87.1653407786660; Tue, 24
 May 2022 08:56:26 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 May 2022 08:56:26 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <CAKmqyKMKxb81ZSpz-ncGc3fpt8f06EcEcXvtHjEpWLABXGT+uQ@mail.gmail.com>
 <YnTZP1iG+77Cugaq@redhat.com>
 <CAFEAcA_MncAJWUqG3yRVGMT0mXKvnBUqJLdoHwMdd=OW8fnodQ@mail.gmail.com>
 <CAHBxVyH=7hX5mjWcUBODk_tNHoczefdkfS8dFcf6is=vpz=SZw@mail.gmail.com>
 <CAKmqyKPK_F7Z4-tM9k8+3yXDdSTSFagieH23vqoW+TciXpnYqA@mail.gmail.com>
 <YoNiPw/3e+CY0v7o@redhat.com>
 <CAKmqyKOC0Fgu7WUXRcAJZNmVR8GeiXHGh4K8fg+5_c+pvZR_7w@mail.gmail.com>
 <CAOnJCU+i3m5OjM-wBf+t58YP9k5Jd0VeBK_yoPSPtzoE68H2EQ@mail.gmail.com>
 <CAKmqyKO5sUspA5d57r62phQ7qpBs7A0S_3XdF+sLmUV5kKwZMg@mail.gmail.com>
 <CAOnJCU+Pos0fTWj7C7rhVEa1QV7YsJa4MyO57CFMGFfs_hHR5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCU+Pos0fTWj7C7rhVEa1QV7YsJa4MyO57CFMGFfs_hHR5A@mail.gmail.com>
Date: Tue, 24 May 2022 08:56:26 -0700
Message-ID: <CABJz62NR=6+k0AxZ4V35hXH=bUamZR4=f4wgDqcG8zm0e+KmHg@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: Atish Patra <atishp@atishpatra.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
X-List-Received-Date: Tue, 24 May 2022 15:56:35 -0000

On Mon, May 23, 2022 at 08:16:40PM -0700, Atish Patra wrote:
> On Sun, May 22, 2022 at 10:59 PM Alistair Francis <alistair23@gmail.com> wrote:
> > On Wed, May 18, 2022 at 4:38 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > 1. virt machine is not well documented and already bloated. There is
> > > no specification for virt machine as such.
> > > Putting restrictions after a certain release will lead to confusion.
> > > 2. Do we support existing MMIO devices after that specific version or not ?
> >
> > Yeah, so I guess this doesn't achieve the same outcome you want. I
> > would say we would still include some MMIO devices, like UART for
> > example.
>
> Why ? We can just rely on the pcie based uart (virtio-serial-pci or
> serial-pci) should be enough.
> The only MMIO devices that should be allowed are the ones that can't
> be behind pcie.

IIRC virtio-serial is initialized too late to catch messages produced
very early by the firmware (and possibly the kernel), which means
it's okay for regular usage but not when trying to debug an entire
class of boot issues.

Either way, it looks like you wouldn't be able to completely get rid
of MMIO even if you introduced a new virt-pcie machine type. That's
the same for the aarch64 virt machine. I agree with Dan that we
should follow the example set by that architecture - it has worked
out pretty well.

If there is a desire to reduce the complexity of the "standard"
machine type, can we just take the current virt machine type and
rename it to something else? And have your simpler code take over the
virt name? Sure, it will cause some pain in the short term, but the
RISC-V ecosystem is still young enough for it to not be a deal
breaker.

-- 
Andrea Bolognani / Red Hat / Virtualization


