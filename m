Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C71CF8573
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 10:24:53 +0000 (UTC)
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swHSK-0007YF-MA; Thu, 03 Oct 2024 04:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1swHRh-0007Vb-0M
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 04:44:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1swHQy-0000J7-DB
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 04:44:09 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37ce8458ae3so587489f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 03 Oct 2024 01:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1727944951; x=1728549751; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ng2RRQj1rwznDqCdctwvH9aF5s3qPDBD6pkK7AHVxsM=;
 b=Ii4p3gsIdMYs2wJ5jaqihQ+JI1Mt1Czxv9996SmOj9bFV91afMuoUEnSb8Q0dk1mp+
 LE+DaZgq2qELx/ODqvqXiVdDQqB8ntSEna1jVLr/DTeZINrluh8mw2IGMbH/Y8SW+IiG
 GKL0H5KOvJVsTH+yASOGF8HlzlrUha8i6oSxkUzzHAiCpSC88pXimBXCXJTV9+vWgGOY
 llSjABgBCYGq8llcalvIV629Km0SlOOWTau+D3KNNUgSU/WvkUbTYkUYOa8IJk+x7D2t
 1cFKHDLVBvT/B/VnwnwXTbsIiVEjmPXfN+m280ge6jBTdWjEpfhwQT6uF7FToDxNgAcH
 oTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727944951; x=1728549751;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ng2RRQj1rwznDqCdctwvH9aF5s3qPDBD6pkK7AHVxsM=;
 b=cQrLbIzVF6NhZa/vpOPQS9V6n/hY6o6qt0njOqJIpbOL6C5QXCkJqFDcb1LVlu37MZ
 yW1OAzUDmpBES1duiYvoxHs/A3syRaZ3EantY3LNRLSv/TDAEUgnBzsfJYZ8NW3Xf6e+
 iKdKFMXsgsDmUfTNRGhPwtQIhdKz/j5ERffQ+pCjfKg6vXInzcDtAmazKfXKf0Cm2yoJ
 3cLPiSKK/sdS4Qb8Qe50FoomVhn/J5EWJLob2HRpmG/V5GdGARHpDG30vBePgA1NryJM
 59DZ/02rca/es/td3Yy4WyAUtaqoMWv5+u8WiUyHNH7oPMj7aTyuR+IBioPOuONy0AbD
 B9RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2j50x+ItuvPtMjI+41QC0XC4ZnAEjEVBWP8qoYiJi/V9eCxLawXyFVF5S9tDZYUIxjNMT03gADmVg@nongnu.org
X-Gm-Message-State: AOJu0YwVFx0G8njFVqidNbaiuGgVxT0XlC3oGsMU3qBtTJEXfqZEOk2d
 8v9dB1U7+Gqnux3dv4w4peb9Ustiyl5wRazTf0WfS2+igvV+urvaoGdXeTuviIU=
X-Google-Smtp-Source: AGHT+IHBqM3EFmD6A8uGHtQcxg4zMHf/yZFY95k//nWHcIiBArkmvueC7fnCP5oYU1pfM4013UcTbw==
X-Received: by 2002:a5d:66cf:0:b0:37c:cda4:a6ca with SMTP id
 ffacd0b85a97d-37cfb8cf261mr4214890f8f.17.1727944951143; 
 Thu, 03 Oct 2024 01:42:31 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79c67c5csm39870425e9.0.2024.10.03.01.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 01:42:30 -0700 (PDT)
Date: Thu, 3 Oct 2024 10:42:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, 
 Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, frank.chang@sifive.com, 
 Sebastien Boeuf <seb@rivosinc.com>
Subject: Re: [PATCH for-9.2 v6 03/12] hw/riscv: add RISC-V IOMMU base emulation
Message-ID: <20241003-c4e8eae2c7f018797cec8b94@orel>
References: <20240801154334.1009852-1-dbarboza@ventanamicro.com>
 <20240801154334.1009852-4-dbarboza@ventanamicro.com>
 <c89c6027-ff72-4c25-af29-697da2e90888@sifive.com>
 <d1fdc3f6-fa9d-4aa4-9899-06105f88f68d@ventanamicro.com>
 <CAH2o1u7NQ+zqVSSj+xXWiCKGXbkdivj_u8XW6mchucizzmzsxg@mail.gmail.com>
 <2912ffbe-0ae6-42b7-86b0-379e4c1db5c5@ventanamicro.com>
 <CAH2o1u6vbYPubev2ZYv-W4Y0icA0y=MRHrjPF8vPtjJRNPnoSg@mail.gmail.com>
 <a11481a5-6d00-4392-9413-4c7c2c045481@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a11481a5-6d00-4392-9413-4c7c2c045481@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Oct 01, 2024 at 09:05:52PM GMT, Daniel Henrique Barboza wrote:
> 
> 
> On 10/1/24 8:28 PM, Tomasz Jeznach wrote:
> > On Tue, Sep 3, 2024 at 4:46 AM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> > > 
> > > 
> > > 
> > > On 8/26/24 11:18 PM, Tomasz Jeznach wrote:
> > > > On Fri, Aug 23, 2024 at 5:42 AM Daniel Henrique Barboza
> > > > <dbarboza@ventanamicro.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 8/20/24 12:16 PM, Jason Chien wrote:
> > > > > > Hi Daniel,
> > > > > > 
> 
> (...)
> 
> > > >            iotlb->target_as = &s->trap_as;
> > > > 
> > > > I'd suggest fixing the missing en_s check, to enable proper handling of MSIP.
> > > 
> > > The '!en_s' check was removed because it was breaking irqbypass. I'll let Drew explain
> > > more about it since he's been working in the kernel support for this use case.
> > > 
> > > 
> > 
> > Is the missing `!en_s` check still problematic?
> > Re-reading the code I'd say it's required here to catch only GPAs if S
> > stage is BARE, not untranslated IOVA.
> 
> 
> Yeah, for some reason the existence of that check  breaks irqbypass, removing
> it fixes it.
> 
> I don't think it has to do with the check per se, but perhaps with a missing
> conditional to proper handle the irqbypass case. This is one of the TODOs that
> we should look at later, in particular when the irqbypass support starts to
> get reviewed in the kernel.

Right. VFIO only uses S-stage to translate GPAs. When irqbypass support
is added, as it is here [1] (which is a series I've been waiting to post
as an RFC after the first round of IOMMU driver patches gets merged),
then this '!en_s' check breaks MSI translations.

Thanks,
drew

