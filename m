Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6ABC77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 05:02:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz9It-0006ei-Qc; Wed, 17 May 2023 01:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pz9Io-0006cN-96
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 01:02:19 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pz9Ij-0000m8-7A
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 01:02:18 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-199fd9a0e62so239265fac.1
 for <qemu-riscv@nongnu.org>; Tue, 16 May 2023 22:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684299723; x=1686891723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hYH4b03xzdV31uxlav8FLEEshDuI0DKbLF9pWn4n8z4=;
 b=cgZqrf4V6QuROeTae8VokcZpQcNzbUq8kNobIaLxEOr1QRv8TGqNau7xkdLH3f3NQz
 BvGyG8UdBh1VKBwptMSjodgy7W2xsBJ54cFjJOLyLlp5C/EtcljubrQjWmvGbo5SkJ5a
 WZ4NwhT7djnamoJxmdeikePzrg+7i2nfEIQGyL74ZFQTfrdK6+oHKLTEaYKvElJ2b+Ht
 oMaQdsXaJ3NnM7421EFpOsI+D2wIw7UilT4JB4t+oIs222P4W1I3EZq8DWFjWO5FzVu7
 Kx/JzmhbE09WsZkRhnoEXdmgVMDOfRSbcB8PFWT2egnvPg2IfoxFT8mEyhWUU0iM2r9V
 cEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684299723; x=1686891723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hYH4b03xzdV31uxlav8FLEEshDuI0DKbLF9pWn4n8z4=;
 b=UWPcx05FZxiyZcxBeXtsQ8q2FN9036nss27D2648PzQvdEBRmiwx8HXOKMxxNVyuiN
 CyKgCRkuufwLEEBvH0VxttARwOdI9G5h21bTdMfIozFlCZbzWWmzYBHOyy74QcnoWf+T
 k4ZUhR/bLnL+/x73PQTC2ZRbj4kN2AX/H/y+aHvyUfgC+dnBck419D4CjYRLbCDcmZZf
 JH+eeWnAiU0+GNyZbXH3Jcrdu7bPySLge77dlFVVxtr97FVbrfbsz/bfebUaaOLVFUf8
 RWqtv2fanMKNjzbpz3LFlqbXVvo7QH0doRWhsE9AXQZCibuO6dw8TVJIb/g10br8gqid
 ni6g==
X-Gm-Message-State: AC+VfDwBd2v2/tXeQxZGxayoNL5TISei+MXECmJVkGq+YmF3ha8BZW3Z
 8XuCGIfO2Rjk8e3RpQokb4SeTw==
X-Google-Smtp-Source: ACHHUZ7iTwfsxbkckVuZKhKIJak+svHkJHtmTthvzzWqyfyewQlNYSKV4X/tVHSpPbNGXhYoXvfXsw==
X-Received: by 2002:a05:6870:61c5:b0:19a:1571:f9dc with SMTP id
 b5-20020a05687061c500b0019a1571f9dcmr227780oah.49.1684299722074; 
 Tue, 16 May 2023 22:02:02 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242]) by smtp.gmail.com with ESMTPSA id
 u6-20020a05687036c600b001963408281asm8387907oak.9.2023.05.16.22.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 22:02:01 -0700 (PDT)
Date: Wed, 17 May 2023 10:31:54 +0530
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
Message-ID: <ZGRfwqZxxpJaYFsp@sunil-laptop>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <ZFjbwh3CdljaHEZZ@sunil-laptop>
 <CABJz62P3u0d-ggQw-B_6AYTNu8Z9-TOs+UOn2vM8NNV0mQKR+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62P3u0d-ggQw-B_6AYTNu8Z9-TOs+UOn2vM8NNV0mQKR+Q@mail.gmail.com>
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x36.google.com
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

On Mon, May 08, 2023 at 04:44:22AM -0700, Andrea Bolognani wrote:
> On Mon, May 08, 2023 at 04:53:46PM +0530, Sunil V L wrote:
> > On Mon, May 08, 2023 at 03:00:02AM -0700, Andrea Bolognani wrote:
> > > I think that it's more important to align with other architectures.
> > >
> > > The number of people currently running edk2 on RISC-V is probably
> > > vanishingly small, and in my opinion requiring them to tweak their
> > > command lines a bit is a fair price to pay to avoid having to carry a
> > > subtle difference between architectures for years to come.
> >
> > It is not just tweaking the command line. The current EDK2 will not work
> > anymore if code is moved to plfash 0 since EDK2 assumed its entry point
> > is in pflash1. I agree there may not be too many users but if we have
> > to align with other archs, there will be combinations of qemu and
> > edk2 versions which won't work.
> 
> Right.
> 
> > > With that in mind, my preference would be to go back to v1.
> >
> > Thanks!. If this is the preference,  we can request people to use proper
> > versions of EDK2 with different qemu versions.
> 
> Yeah, in the (not so) long run this will just not matter, as the
> versions of edk2 and QEMU available to people will all implement the
> new behavior. Better to optimize for the long future ahead of us
> rather than causing ongoing pain for the sake of the few users of a
> work-in-progress board.
> 
> > > Taking a step back, what is even the use case for having M-mode code
> > > in pflash0? If you want to use an M-mode firmware, can't you just use
> > > -bios instead? In other words, can we change the behavior so that
> > > pflash being present always mean loading S-mode firmware off it?
> >
> > TBH, I don't know. I am sure Alistair would know since it was added in
> > https://github.com/qemu/qemu/commit/1c20d3ff6004b600336c52cbef9f134fad3ccd94
> > I don't think opensbi can be launched from pflash. So, it may be some
> > other use case which I am now aware of.
> >
> > I will be happy if this can be avoided by using -bios.
> 
> The actual commit would be [1], from late 2019. Things might have
> changed in the intervening ~3.5 years. Let's wait to hear from
> Alistair :)
> 
> 
> [1] https://github.com/qemu/qemu/commit/2738b3b555efaf206b814677966e8e3510c64a8a
> -- 
Hi Alistair,

Could you please provide your inputs on whether we can remove this
pflash0 check completely and assume pflash will always have S-mode
payload? 

I realized you responded to similar patch from Yong at [1] which I
missed since qemu-riscv was not copied. My v2 patch is similar to Yong's
patch but the feedback from distro experts is that, it better we align
with other architectures.

Based on your feedback, I will modify the patch and send v3.

[1] - https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg04023.html

Thanks
Sunil

