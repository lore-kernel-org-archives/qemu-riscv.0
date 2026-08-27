Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E168AC61DC7
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 11:18:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzY7D-0003so-O1; Thu, 27 Aug 2026 07:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzY7B-0003qi-3l
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:17:49 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzY77-0006x7-NY
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:17:48 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-85a50f6a7f7so20216567b3.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 04:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787829464; cv=none;
 d=google.com; s=arc-20260327;
 b=V83eHYwVTM2lpLjoid8ZlG6X0PWd+kO1jvxhPvWrx073xfeP4qkwmkv3l69TMe+CAT
 FNQr9/i0KCQjmOW67zDh/vfxijhUJozpf5p20A+GhU0smWFAqcNCPVG/OyC1WXCLu2SJ
 rUqfe3XzSwdvjwwFw3SMheOId5Lbi+Hf2clZ0ytRnR4cpzPe276GnY9jdD74B+ZS5RvR
 lTZGLW9cG5PhK2/SBB8anXURQPe/ydkYGzxM8gkbXG1g4QdP1weKrQ0+OW/rLlAYL7Dl
 9GtsL5PE7w1YUp49GyC9ejNiTJfGMeD92o7+RqsWMNTYUsljp+cm39XYAUUshkGXUBcn
 caOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IAupx9RnMDjq1cK/7Ka5dp50NQm4KtdcDaWyz2bg2Ko=;
 fh=/WKyCGIU0opP+ozn+/xa96pvlycYL/h4w0YwMZXl+us=;
 b=jpUQAky5KQS08T5OYyF/VHgFz5aUQe35gTVYD3Q5wXiwIy3RFzbIhqtzsFUJ5/PAUE
 cmKlr++ETFqr6cyGHEfaJjrXswe1KR/JX2oCOmA2LfpY7p21AuBB/KzBLET0YOvnrRvL
 8LSntdXSG9bIg1/Yhy9iBowLgdxUb2EV8v53h10hTIJWS1lx/VswgZuyidLs3hV2MFE4
 DJN3GOP6gyDF+Gb+UTeymw1AFPET4oBztwphavkRn1IsgeyFUtLGQgmYt09Pu/WlWbgH
 iH1di5K4i/nNWaH0z26eRZhRY7ML57pb6U1UPKilpsNMSWooxjascon1KjS77iftYuHT
 DOEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787829464; x=1788434264; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=IAupx9RnMDjq1cK/7Ka5dp50NQm4KtdcDaWyz2bg2Ko=;
 b=NTXkFgx3ZCNpcV9z4ZOTvlgirvJPsptVGhNauNzF4uv9Wv0tuVUTaKRBuZPcCKPdH7
 H4U03WBsbQLPa2vupa3weFANMpqpHmdbYuXP1znFFKaunKOWeA552dhIbXwr+zTz8Wh4
 022Z9zlKciV0u6WxnzCGjXwvn5ZZPUpmONSV/lywIE+HncGk+9AWNJND/qhuom2Inqx6
 IXR1r4GOAdZk57ztxsmLeZfci5H7jcCy5HPSr0+Rddvrgtl0MGrWmz2ORl4LWloc6fXF
 B5b0m4Zda3RvNPIkvV2LffyOowmAqlgpvPTHVc2Z2ft2YiwQquUx2t1N5IHWvpEEFQJw
 E8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787829464; x=1788434264;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=IAupx9RnMDjq1cK/7Ka5dp50NQm4KtdcDaWyz2bg2Ko=;
 b=ZppiG/MYdQMufchufbSI+8HU7DRxuHfIibC5qYkq5U2cfF26Mr01HOzONm9dqpuXH9
 TJ0rVwhNxMOZKv83Ds4Cg0TAVqvhad3UOA4gStBCVSaDqVR64e7FQUSTQoPQWCocTnFr
 HUU/zQtZOBQ3eucteEAmqJei6xZ9v84CcLao//r4IBbKdlsbPoYbtHel4gWfZ3nOHTeu
 S5SyAjUZ74+SJgMkw82pFAhIjoMZvVeJ2ix8A+RRS8hIsTLjkdHxiiTnbhgNYbYTdPH3
 owHGmQtR8VEe34QfntZ7YpK9c9+3LcMfkrUAsdbe5FsP7Jh5APcCZYZd6SYAqmX2/zuV
 CqhA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrLXKhTkTk1SWYPXGOULX9Hp9lhDKcQA1jneSD/fKLDT8nlospwFYRGyheX8YrrTX8mB7CC3qmDkd9l@nongnu.org
X-Gm-Message-State: AFuF++nfQP2zK1stiFaZ4uaNS+Mv2tn4KY+8vB9/OXZmDcK91LUOT5fq
 GunlWUWudVaWfwv1QDUCp7SzhVAzJcrpmBGCYpXMeCtmdKCNq8AZ0CnIKjSU/qUfsosWwaGFYO8
 oZ/zfhICplfrpfLNsaPfkuTaK+fsbTKAda8RpkDmm4g==
X-Gm-Gg: AR+sD1326mcIioMD2Ew+CMiuImpzFjnD3CPVjmgUzX2khJCjOIRgDdC9YPiRBAsxMr3
 3gTbZoWDoZhco4/JP+voPscDqHI79lo99uTdqxCnZrY/RVq3tOEDFohG4hR/1hQyok1zrdoW8iB
 3KTa4KSJY3yq0+HTWPhlpTffrowVzwRyHCFVmcoODRlIe8WfBW5rjSh/Euxqtc09++nsOKJoisK
 33uoF8mcybXSKqUd7gOrqdsQnatcF0YrB2gOjbI2yawKGbvT6K6exTfaeEgspd0ColBBI0WovE/
 pG+oHe6qcyIwKh9IvJbd7JJzaMQqrLT862FgjzOFpj6lUoT4Fi3sEcbbu/hdM1sU+IlDph4A6PN
 Z5j0WOQ+XQ5tzeR2QHF7Lzws5AEwx
X-Received: by 2002:a05:690c:c3a5:b0:845:69ad:b9b1 with SMTP id
 00721157ae682-8573be1b343mr53332187b3.3.1787829464363; Thu, 27 Aug 2026
 04:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
 <CACYNXwKU_UuhrBWHNFtYYmSfzRsUd5jRFjSc1++xvQHxPk6rew@mail.gmail.com>
 <CAFEAcA-Ncv9_jMMg1i+Ox_xa9oM4D_MMLGnPpqbyGJV_5B9iMg@mail.gmail.com>
 <ac30bd54b6f1f4e4753638c9e95dbb85d8b81eca.camel@alistair23.me>
In-Reply-To: <ac30bd54b6f1f4e4753638c9e95dbb85d8b81eca.camel@alistair23.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 12:17:33 +0100
X-Gm-Features: AcwNN1VUVmzqWF2W5hkS0W2o-_zqfDDH0ebmLyctS6dkcWYA5KVyPN2vudg4X80
Message-ID: <CAFEAcA9zz60hTDMEMePnc1osis7dPjn5KmSksrWKATpSMc8SHw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
To: Alistair <alistair@alistair23.me>
Cc: Portia Stephens <stephensportia@gmail.com>, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 27 Aug 2026 at 12:03, Alistair <alistair@alistair23.me> wrote:
>
> On Thu, 2026-08-27 at 11:53 +0100, Peter Maydell wrote:
> > But isn't this just the way the SSI specification is? If we're
> > modelling a "you just have to get this right in software" bit
> > of hardware then we don't need to somehow try to add extra
> > checks in QEMU for whether the software hasn't actually done
> > things right.
>
> From my reading of things this is a bug in QEMU, not a guest issue.
>
> The fact that aspeed_smc_flash_setup() for example iterates over a
> larger value to send a single byte at a time shows that currently
> everyone *thinks* think function should send a single byte.

Doesn't that just show that the aspeed flash controller knows
it is always talking to an 8-bit SSI device ? It wouldn't
surprise me if the SPI-NOR standard in particular insisted on
8-bit transfers, though I can't find anything claiming to be
that standard.

> So it does seem broken today. Making the current function clear seems
> like a good step. Supporting different or larger transfers in the
> future is then possible.

I think the current interface already supports different or
larger transfers. We just happen to not be using that.

-- PMM

