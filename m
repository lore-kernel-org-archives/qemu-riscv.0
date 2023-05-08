Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvzI8-0008UA-Fu
	for mharc-qemu-riscv@gnu.org; Mon, 08 May 2023 07:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pvzI7-0008To-Ha
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 07:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pvzI4-0008R2-2T
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 07:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683546266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=29ZIZ5JVCd9jLI43OYeE8K+nR3V5p1DK6qO3hiQhkzY=;
 b=gKOKwnce+J88wEK3l2I57XbuLzLI7+wLuKbZSyBAROaXk+myEDkxMz3ndZG52cT7xBcyS2
 1/7l4aU8u6Jmi7b26h3goiFrOKFqyNvws9/Gp6OXtGm6LXzibbB5ktCX1h/JOOsaKxL0sG
 +CDC0yN4Zv4x25dMp5fCFZ5u7MWgejE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-SHdQKBqnMIW70lQmGwXyng-1; Mon, 08 May 2023 07:44:25 -0400
X-MC-Unique: SHdQKBqnMIW70lQmGwXyng-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1ac6193a1e3so11375465ad.0
 for <qemu-riscv@nongnu.org>; Mon, 08 May 2023 04:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683546264; x=1686138264;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=29ZIZ5JVCd9jLI43OYeE8K+nR3V5p1DK6qO3hiQhkzY=;
 b=GdZkYg/l+chkDFACrIPjUpGn8YvCPwZl99jxLiPAc9wKaAldettQrmQ2jgTtap6iJC
 DAIWBrMwxf2PoggTIXuJzjWpEFXcpbTdYbyZG5SquucDz4/Bp576+Cg3V61yJqNxfWcY
 G9ZeXraNGpaIceNQkt3SZEC0thKl28Uu230lCDslrAbetiCANP45iuzji/Jm3Wundv2O
 8OwVUBQs9AKn58GFn++4ZABJjbWaqzc+Neo+cDauo8DrUzpyyRRTRUXmhHJ2S3UmrdB5
 oUSd1U5uWAvxhgoFaqtwh8P3RphjhdY99JgNp2UrTYoKdMs13WGSSo1kYwECVAS+0TLy
 3PVA==
X-Gm-Message-State: AC+VfDxCHfFnk1zHuOc4HFEjzEuVWELJFhGPmyQgEkKE6fqI9BSToXHC
 E8kwJZB4eafxQ/D4N7VCHe6DM62aQEn1T/pI/Z5+Xj7SdeDQJaItQeIzsXq1HUiLc6b00mfLujd
 o9EIrzstKoJK1Ex2xUCJ8DWaWTiit+eo=
X-Received: by 2002:a17:902:dac2:b0:1ac:4d3e:1bf5 with SMTP id
 q2-20020a170902dac200b001ac4d3e1bf5mr11571735plx.23.1683546263803; 
 Mon, 08 May 2023 04:44:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ41B3sVq5Xu7IdkzggbTpdVqFCbiHFDZ+9gvUuKKaBVwv/AD9WOZ+t/PM5cT5RiERD7d8gHTQ3MRjuSRqRKrbg=
X-Received: by 2002:a17:902:dac2:b0:1ac:4d3e:1bf5 with SMTP id
 q2-20020a170902dac200b001ac4d3e1bf5mr11571707plx.23.1683546263501; Mon, 08
 May 2023 04:44:23 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 May 2023 04:44:22 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <ZFjbwh3CdljaHEZZ@sunil-laptop>
MIME-Version: 1.0
In-Reply-To: <ZFjbwh3CdljaHEZZ@sunil-laptop>
Date: Mon, 8 May 2023 04:44:22 -0700
Message-ID: <CABJz62P3u0d-ggQw-B_6AYTNu8Z9-TOs+UOn2vM8NNV0mQKR+Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 08 May 2023 11:44:31 -0000

On Mon, May 08, 2023 at 04:53:46PM +0530, Sunil V L wrote:
> On Mon, May 08, 2023 at 03:00:02AM -0700, Andrea Bolognani wrote:
> > I think that it's more important to align with other architectures.
> >
> > The number of people currently running edk2 on RISC-V is probably
> > vanishingly small, and in my opinion requiring them to tweak their
> > command lines a bit is a fair price to pay to avoid having to carry a
> > subtle difference between architectures for years to come.
>
> It is not just tweaking the command line. The current EDK2 will not work
> anymore if code is moved to plfash 0 since EDK2 assumed its entry point
> is in pflash1. I agree there may not be too many users but if we have
> to align with other archs, there will be combinations of qemu and
> edk2 versions which won't work.

Right.

> > With that in mind, my preference would be to go back to v1.
>
> Thanks!. If this is the preference,  we can request people to use proper
> versions of EDK2 with different qemu versions.

Yeah, in the (not so) long run this will just not matter, as the
versions of edk2 and QEMU available to people will all implement the
new behavior. Better to optimize for the long future ahead of us
rather than causing ongoing pain for the sake of the few users of a
work-in-progress board.

> > Taking a step back, what is even the use case for having M-mode code
> > in pflash0? If you want to use an M-mode firmware, can't you just use
> > -bios instead? In other words, can we change the behavior so that
> > pflash being present always mean loading S-mode firmware off it?
>
> TBH, I don't know. I am sure Alistair would know since it was added in
> https://github.com/qemu/qemu/commit/1c20d3ff6004b600336c52cbef9f134fad3ccd94
> I don't think opensbi can be launched from pflash. So, it may be some
> other use case which I am now aware of.
>
> I will be happy if this can be avoided by using -bios.

The actual commit would be [1], from late 2019. Things might have
changed in the intervening ~3.5 years. Let's wait to hear from
Alistair :)


[1] https://github.com/qemu/qemu/commit/2738b3b555efaf206b814677966e8e3510c64a8a
-- 
Andrea Bolognani / Red Hat / Virtualization


