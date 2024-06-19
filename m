Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E3DC27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 18:06:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJzh3-0001yr-8n; Wed, 19 Jun 2024 14:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sJzh1-0001xh-Jx
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 14:05:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sJzgz-00024j-Eb
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 14:05:59 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-70631cd9e50so114001b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 11:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718820356; x=1719425156; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tJQjaW+9SUe8Jd+0O933P+PkOF2hRXJTTop7a9IQrJU=;
 b=WCAVuyKQ0nLhiLDCGjhxXWJKfwDdqLZ234TKvO/SphgsOjqWeh61O7EjWVB7r95Enr
 OicbD1qFGtq5Ig7K0wqbLpZN20pUZiUkMlOphRssF1FPuroQMSIW6E/AVuLQrzWPvUn8
 YRcJJ6z2b4oOhOZQvCQR5Fdiq43ZcBAG9OYTT9+uQAhEcFUT9Ed9OHCprszIU9hQXupj
 OMpwF1lLfdBQTZgK994sO0YeXaKgkI9TfyLb6nq9flraV0XQdk78UHXgYz6ejqb6bs9C
 NYlB/UGlO9E5hJ/Zn+tTJ0aVMTZx83HnLqX4xFSurbyXie54/dtUEOZFfkD2Rvx85u+E
 sQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718820356; x=1719425156;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJQjaW+9SUe8Jd+0O933P+PkOF2hRXJTTop7a9IQrJU=;
 b=n8luMYNvF8n1Z2z8U3H6mIMnBL0z/XFhWuHC+AhpABsjQPtN9+4OLGaz+IMccfGZPr
 GqeZpQ7Nw9K/uThAAhB+ZLhmaflrFghAXi0sntPCoOSm4Ru4zA6sNfyvbv8cfvTOM2d+
 1M+luW0ZZu+C8phqh5P6jpHIg4oX1zsr7WBjNRtHK1p9JD02DB7H6ieazJQFK7ghnb8N
 qFCzNWCICL94chtDIk3v9SSQ4k9oOyP+CzdfHrwscikI5Y8DRwv0/fch7mrXK5II0A7J
 WCubFFngebB74OQVvmDVaJZwCvdROhVNTBVzrC5At30R1fKIIaAJ1YltkRTN2ZaC1ZId
 +Reg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw6XbkfRKT5CPX3JhkEhOrGotB6xGpn0GS51djY2H85vj9TIkgtM/lv0a+ro+aUTk/e4gl+3TV8gRdushCfOETVzNdrC0=
X-Gm-Message-State: AOJu0YyUpf6PaD4Cd08L3lqg1u9Zqr4H4A/Tcd3aUWWoqq3c8iLAPLQP
 Ws/8zADG3cDA3+uCnkghZ+SoYlDE5B3SZwlW6+M+bSbVNB8/N+yWnVbPp2TLwvXcR94bO0YjZim
 1
X-Google-Smtp-Source: AGHT+IHuGZcJ8Fzq3O5NoTNwyXsDp1Ho7y8NU7KhAqDrRP2slUZ7g0PrGrWJLeb6uVOHBkS3XoEZGw==
X-Received: by 2002:a05:6a00:18aa:b0:705:ddb0:5260 with SMTP id
 d2e1a72fcca58-70629b19fb0mr3777805b3a.0.1718820355621; 
 Wed, 19 Jun 2024 11:05:55 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc91e13esm11366749b3a.11.2024.06.19.11.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:05:55 -0700 (PDT)
Date: Wed, 19 Jun 2024 23:35:45 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v2 11/12] tests/qtest/bios-tables-test.c: Enable basic
 testing for RISC-V
Message-ID: <ZnMd+WfmKGU6hRxY@sunil-laptop>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-12-sunilvl@ventanamicro.com>
 <20240619121250.38040a20@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619121250.38040a20@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jun 19, 2024 at 12:12:50PM +0200, Igor Mammedov wrote:
> On Fri, 24 May 2024 11:44:10 +0530
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> > Add basic ACPI table test case for RISC-V.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  tests/qtest/bios-tables-test.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index c73174ad00..880435a5fa 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1935,6 +1935,29 @@ static void test_acpi_microvm_acpi_erst(void)
> >  }
> >  #endif /* CONFIG_POSIX */
> >  
> > +static void test_acpi_riscv64_virt_tcg(void)
> > +{
> > +    ->cd data = {
> > +        .machine = "virt",
> > +        .arch = "riscv64",
> > +        .tcg_only = true,
> > +        .uefi_fl1 = "pc-bios/edk2-riscv-code.fd",
> > +        .uefi_fl2 = "pc-bios/edk2-riscv-vars.fd",
> > +        .ram_start = 0x80000000ULL,
> > +        .scan_len = 128ULL * 1024 * 1024,
> > +    };
> > +
> > +    /*
> > +     * RHCT will have ISA string encoded. To reduce the effort
> > +     * of updating expected AML file for any new default ISA extension,
> > +     * use the profile rva22s64.
> > +     */
> > +    test_acpi_one("-cpu rva22s64 -device virtio-blk-device,drive=hd0 "
> > +                  "-drive file=tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2,id=hd0",
> 
> Can you reuse test_data->cd, instead of specifying disk here? 
> 
Actually, currently there is an issue with RISC-V virt machine due to
which -cdrom doesn't work properly. But I have a fix for that. With that
fix in place , I can use cd here.

I will send that fix tomorrow separately.

Thanks,
Sunil

