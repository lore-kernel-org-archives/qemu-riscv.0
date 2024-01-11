Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4B7C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:15:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNutk-0006yN-Px; Thu, 11 Jan 2024 08:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rNutj-0006xo-3V
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:15:03 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rNutg-0001lT-Rv
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:15:02 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50e7d6565b5so5997685e87.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 05:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704978899; x=1705583699; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zFLkFt8Wra8uQvffBO10idXOvX3AWwz7SBfO+ot6ga0=;
 b=HNtC1/Q7To0qfMA5Y68z9mjkYaX3kaf/h6pDtYRSY3iyU7qkf61zSxEmkWKwBeD8Wl
 elqicse61LyrO90kflOn2hjDjWjh0t/tO+4YuuPSU8D1c5erv4EmyF9Wm3Jv5210jLT8
 YwD534IVK7R2DMXEC+t5hg+Yl2ZPYRapRosOGnwX7RWU+Haacn9D7gfDkY6MMsQju4G2
 MeRXOsl/tleOaqpCNH3fo3VhNGCN7JQQekbr6YQank4bqg1O7K62shRwP01OxOcrgJzZ
 qyfxs5T8rZ6wEn4IYIWlOhHbajmiU/vVUYXkh9HiG7bG+Ojol3sgCrYW8UtrYuxPrNp5
 PNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704978899; x=1705583699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFLkFt8Wra8uQvffBO10idXOvX3AWwz7SBfO+ot6ga0=;
 b=XXlqc3RgXTICsO+rTCU/Wqg+859Q5UmEx8vWrbFzVVceNATmvnvui1ARjmmztIuz1O
 qOITzgaPx39Dx11EIkN/jMbHKa3pXOEtTi4qlKSEqXI0Lwbdunk5gPrF1FvkVaOObrzb
 4HDkurm/3E81VX3bhEZ86pqeDOeyQ5705Ms+WHbgyVyhM4/Zx5a1hO1ICrYPbWqfQbsm
 m976WBpER98B5Mu8+sLE4MbymceRrjHe/uih7LxpIMrCVxmAmBfPETxjzBnLpq/qCcEy
 MTHzpOCX8uhV/qoMt83RIXy9Ntvv/ayyLB54enugHybcf7h7GhKNJxLm4w0XBYMqBayv
 U01Q==
X-Gm-Message-State: AOJu0YzJORDr7Aea/mewZ0IVndjxeAtqt4FlVule84d4/yhgMoayJLUg
 SGnjTsBBpuVsUF2i9nIAOmRgEjqLRV5Jjw==
X-Google-Smtp-Source: AGHT+IFRQtn+14YX4cmPh2svHSQAVzUYZaZGSeQhC1EtZPkS8rWIFNy5H3Y8ns7hKby6wzsKQVgmNA==
X-Received: by 2002:ac2:4945:0:b0:50e:7b9e:359c with SMTP id
 o5-20020ac24945000000b0050e7b9e359cmr576673lfi.29.1704978898986; 
 Thu, 11 Jan 2024 05:14:58 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a170906084b00b00a2c32b6053dsm564860ejd.166.2024.01.11.05.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 05:14:58 -0800 (PST)
Date: Thu, 11 Jan 2024 14:14:57 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: Re: [PATCH 1/3] target/riscv: Add infrastructure for 'B' MISA
 extension
Message-ID: <20240111-df7a6acf3109b630469591a1@orel>
References: <20240109171848.32237-1-rbradford@rivosinc.com>
 <20240109171848.32237-2-rbradford@rivosinc.com>
 <20240111-585fe1291fcaa1e0432674e3@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111-585fe1291fcaa1e0432674e3@orel>
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x131.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jan 11, 2024 at 02:07:34PM +0100, Andrew Jones wrote:
> On Tue, Jan 09, 2024 at 05:07:35PM +0000, Rob Bradford wrote:
> > Add the infrastructure for the 'B' extension which is the union of the
> > Zba, Zbb and Zbs instructions.
> > 
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
> >  target/riscv/cpu.c         | 5 +++--
> >  target/riscv/cpu.h         | 1 +
> >  target/riscv/tcg/tcg-cpu.c | 1 +
> >  3 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index b07a76ef6b..22f8e527ff 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -38,9 +38,9 @@
> >  #include "tcg/tcg.h"
> >  
> >  /* RISC-V CPU definitions */
> > -static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
> > +static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
> 
> Is there a corresponding proposed change to table 29.1 of the nonpriv spec
> which states B comes after C and before P? If so, can you provide a link
> to it? Otherwise, how do we know that?

Oh, I see. The unpriv spec B chapter comes after the C chapter (and before
J, P, ...). I still wonder if we'll have a 29.1 table update with the
ratification of this extension though.

Thanks,
drew

