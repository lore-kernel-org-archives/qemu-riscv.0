Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC96C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:54:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0Jil-0004fd-PE; Tue, 07 Nov 2023 05:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r0Jig-0004ev-JZ
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 05:54:08 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r0JiX-0002fx-0g
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 05:54:01 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso9387220a12.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 02:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699354431; x=1699959231; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bGiIUoRrj9woNH8DaQDac/Ooei8TyCT72n7X5JluGTY=;
 b=Trzr0upWgigj91b/FWbVtgpkAoZvXGjIFQqEBpIs1wZwII9XLvkoSi+P2/ziLtetje
 05XC3jR+lbI7diqdkPmiZrz/zhVM7VEu9BjVhq8X4UMQ6QaQovZW/IlGQHHzAp0FL8M5
 Wj9dhb9Ujte6t9ZrQJhX/LRU6NSwH5GhwtLlA3UUw7Bm2Yd9MHjcqXZOXHiZFTGMsMOG
 MrkS4/NE52Y3Ac+hr1KvH6KCPQEWhIke+sb68PfDN3AElCO6RMfYsWCzP2mqn7H1AMXF
 MMAoELsOicvrVna4UgJUX3TcNVjzWXbNWtyfBOCN+/HIQHLz6EG/T1pQxY0MO+90Qqaw
 wkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699354431; x=1699959231;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bGiIUoRrj9woNH8DaQDac/Ooei8TyCT72n7X5JluGTY=;
 b=EBAwcBRDKXNzIiZEYqg1GtHxXD+16+/8QWYqogzMnLnoTa3SSksSgG7xsH6tYIGljy
 37Zuuv3TGgNiIfy98AyoBKQij2O6hJGGAkiAD5v7JkBImHTpspJrgowu8MZ5W6t++egq
 l5sjcYJbTThxgPPrFmmB8XbR9Hj95Wjrf7jI7ijZw2zq8/TnW73DYVxoUawo6GEer8v+
 3sO9NDlWhHpdFfshCdjvZjX1MC6YHn2Hz79+e8bvt+5dsXHi93MHeJDdrOeGyOZknH8D
 DWM1hE1I4Pl+cJcvTDfeYmfpIpm6GcEbPs3n4eGtCkDvd6RDnrzPKVHT/jSVcC0YiYbZ
 VrlQ==
X-Gm-Message-State: AOJu0YxsWxtoHCG+o1MJHRllIrsAYGfAzOBDz0Rs2cKC7dnFMN6oaSkS
 SBePEODhBnBThoc5/sVzCLn31sJr+/6cWMdf0Drtyl/Md+h5X1f6
X-Google-Smtp-Source: AGHT+IHQlnbaanJTQ5AONzD5hwHxF/PS1eFwCwKm91FLTDq4b9/hhwsV4hhQgz0rh4fZJ5yPrRbagxcvAh/rX0CGRiI=
X-Received: by 2002:a50:875b:0:b0:540:7a88:ac7c with SMTP id
 27-20020a50875b000000b005407a88ac7cmr24354601edv.21.1699354431724; Tue, 07
 Nov 2023 02:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20231102094015.208588-1-ethan84@andestech.com>
 <20231102094015.208588-2-ethan84@andestech.com> <ZUOo3fGmqM/gVyTR@x1n>
 <CAFEAcA86B-V0gFLhE9rPK2kG=XeFw7OJ4C==8g2i_WHSLW_HYQ@mail.gmail.com>
 <ZURpIyjhraORROn5@ethan84-VirtualBox>
 <CAFEAcA-1dJnsDyZpf2Dy9XuAdp6CFWSFCzV7eceUJ6RyFLaVPA@mail.gmail.com>
 <ZUhH3Rulnj64whB4@ethan84-VirtualBox>
 <CAFEAcA_z1VCyeUFNMDSsxp-UYRLoMm-4=oo86JkJ3fmjoWdq_w@mail.gmail.com>
 <ZUmokGGG0BXyuxB7@ethan84-VirtualBox>
In-Reply-To: <ZUmokGGG0BXyuxB7@ethan84-VirtualBox>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Nov 2023 10:53:40 +0000
Message-ID: <CAFEAcA9J7euoRVCd8xm+UPVpOHNj7pBjvtqJXnGg_HtAV6f0YQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] exec/memattrs: Add iopmp source id, start address, 
 end address to MemTxAttrs
To: Ethan Chen <ethan84@andestech.com>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, 
 pbonzini@redhat.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 in.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 hiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, 7 Nov 2023 at 03:02, Ethan Chen <ethan84@andestech.com> wrote:
>
> On Mon, Nov 06, 2023 at 10:34:41AM +0000, Peter Maydell wrote:
> > What AXI bus signals? You already get address and size in the
> > actual memory transaction, they don't need to go in the MemTxAttrs.
> >
>
> A burst contains multiple continuous read or write operations. In current
> transaction, I can only get the size and address of a single operation. IOPMP
> checks not only a single operation but also the burst information. I propose
> to add those signals to MemTxAttrs.

QEMU doesn't emulate bus transactions at that level -- we have
no concept of burst transactions. You should have the IOMMU
do whatever it would do for a series of simple transactions.

thanks
-- PMM

