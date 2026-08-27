Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B95DC61DC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 09:20:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzWHo-0007lB-9u; Thu, 27 Aug 2026 05:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzWHm-0007jz-RM
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 05:20:38 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzWHj-0007TW-Jp
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 05:20:38 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-856114a8247so24025207b3.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 02:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787822434; cv=none;
 d=google.com; s=arc-20260327;
 b=RkYGnqU2RLg4Er0Kv40JLRdkYhwzyVCKm39BMF6ue3wWXxAUKSLvD1dmSiq1gWz5Om
 h4P9ps53N8U3RfWmLlNy219I6CYKRZFIYxRNSBzl7ypA/nG7dC7P5MheOUXh/EF95wfN
 V4hfm2I+qgExiW1Q1PuhqudkgLV70F3ucK8Ybmbg3DRr6mG+X49ILeKhaDZvXrGSStdZ
 qJ391pnv8Zum5IkR2bpJRAxETqv5VBNGKsMAai3uVoRoI64gClfhPn7a2fh3/mHDvz6w
 94fkjWi1p/uvSFaqQmMKWdYdeBEs3eMiNuIOZFfFjjqcUsOPaEN5dKfr6F0nznzY3fW1
 sd0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dl8NJkMtjYytgCv/pceSiXJ9Uq3EezZoss9lloH+8C8=;
 fh=Owx7VqSITrc1cL1dzxSlGfX0pT80nlatPKn0bcjEkAE=;
 b=V83yUFQMXxO69IQTkPgKUQjewkvOp8UKyoeZEUnwtsoiCG/6xMVuoJgOBRvDCSqNle
 2GTNRciaWFlV1bYwhvgF5/WzE+hSdlevGPTevinxx1Bu0aqOhjwbPTzvaljcVH6LDRyv
 gGkMPca+F3mide0TRy04i5ICJKP69fq7cJ3sOJhvzqQhwWYxdk5XnA4du4OvakdQM8Cy
 /eKTbV0gXHbWeXHt3AIP6J0SbfQaBoQ5DRpG7zH1PReTY3mNtDs1bpl+pjFCEItUc9UH
 6rCZImdk6O5lqUHDO0rQ9CswWS5CLgKKZiRzdqdZVuvwNVCjDovbuhOIzwVGj5jGCAT7
 mD1Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787822434; x=1788427234; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=dl8NJkMtjYytgCv/pceSiXJ9Uq3EezZoss9lloH+8C8=;
 b=GahtlIEOC0BKgPepYhOQqwBKt93s0YV9HFxctTIU8ipHSA/+3+jju5Osb8rQCF2Lw+
 Dg5j3P3xlPfREF1oCMvVtOrMASem5QyZxNmV1GGhrSiJM5avW6V8NrvaQgF3CKmVZp3D
 ngrKj4nAqLQ89AbD/auQCbQX0ikO5EmMiFmRwWOKVe3xbNCCNNiH8sVZc1K4ecsyjnJX
 tctCN6QIK1sOvtueNrNV71rQbG66Ouud3CAJBIhjD8eKSP+v/WIi6CnPOayrMq3l3zir
 G7R6pPIQDPCHln6cXJqmamlyOl/oUAu6pK1hjs9RUMpLVzX4wjj49NMLdL1T/Kvc7qWm
 qVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787822434; x=1788427234;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dl8NJkMtjYytgCv/pceSiXJ9Uq3EezZoss9lloH+8C8=;
 b=BUdKpyU+hd8aT+P7R9OzXjGOqrgrFTv0ZfQ6awLKFusjV9ojGl6BQUQpXsCJQ5Goh4
 C6wMHzptQeGicrn++DH11J740YAEcRLElGK+OY/TZeUmZNMo7S0LxHtqqRLmb1U10HrW
 owknPZfyc2/dRrIXCDhVDfdLrSYn9xj/g3nSWeYfgYsafteBSRY+Ic9zZVJqhfIVb6xz
 7/Ke6Y5JgpBpybOqkncPLxGE9TZD6SuF9HyVC4NxTuZ+YUDZGV0Y+G4qAAqAjcp0WJYB
 LJxgRq70pLnTtXCPP0Jy7Sz195PeDFiBJWHrQ9Uw3kpCWQSK1SzfSVpZrsGg3YwqToNL
 x9Gw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcCFbAzAOsdKhc4SLIoKF35CNsCefAI+vad43N48YxKdvUqiPlOFAuPpBAmyA2B0SFns5mybbbtjFW@nongnu.org
X-Gm-Message-State: AFuF++mO5YX5Z8Ap422gTKuWcqAXhXnA7O+hDCiBRlW3Qone69H4S4b5
 v8AbBjwUA3AcZdR1ngqpRphSWIwkXnolloauE8+YS0Ul5AL/YDs3+nUnDf7KMZmZmp8aBPjeOlo
 7hEUDm838w+HdXJxzV0nHYbZnur2pEFwk4iQ7rZ032A==
X-Gm-Gg: AR+sD13ZkIki6wgm8l5AiV92EfscFMF7sWPVlszYJbKr1JWSIO9wdjoCQgbNMWS+Xjg
 bOPh8aU8sM7osjTXIiZmwtckkKvgdBlUUws7uncj8T7Gt2F2uV6PvLcvg/atX/meXSuRjSvu39K
 EERMhQFqzhH1oo1bbG/l/HFbPCDiB+WJOxk6f6ZbGIdBEOb8fDtiQSDxlPfvNFgcZ7sW7dAi9X2
 soDnMmYH2Gvu8DH/KodV7GUEijg5mmvH/qLDS1hRIhbKSNlpuoqGobD6GZdPlLEFcj8fNfcV3+u
 moM1K4CvTGQtsQ0iJcKMXhsM1G2hiCwJ10f9kxGejqU/YZh/BMlmUQh3EVCHBWD8Hl+hjlqjQIB
 o1p6JY07OLWnGY1S9iBYju7hD2O1c
X-Received: by 2002:a05:690c:6f0d:b0:854:b29d:c670 with SMTP id
 00721157ae682-8573bb29a54mr60539917b3.5.1787822434248; Thu, 27 Aug 2026
 02:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <d88347aa69db68c498b593eabcd2377413ff4af5.camel@alistair23.me>
In-Reply-To: <d88347aa69db68c498b593eabcd2377413ff4af5.camel@alistair23.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 10:20:22 +0100
X-Gm-Features: AcwNN1VlxaXfMHY1NFt96SqOFcpbJtP9bP8Q0YYI6akMDmGfUDSYLaGv7Wn1Dn8
Message-ID: <CAFEAcA-OE2+H0Gapxqv61kSSgTzns-FWCyagAX0hzewu0Ab2xA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
To: Alistair <alistair@alistair23.me>
Cc: stephensportia@gmail.com, qemu-devel@nongnu.org, 
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Thu, 27 Aug 2026 at 06:37, Alistair <alistair@alistair23.me> wrote:
>
> On Tue, 2026-08-25 at 14:04 +1000, stephensportia@gmail.com wrote:
> > From: Portia Stephens <portias@oss.tenstorrent.com>
> >
> > The ssi_transfer function comments say that it takes a word varying
> > between 8-bits and 32-bits. ssi_transfer takes a 32-bit arg to
> > transfer
> > but there is no means to indicate the number of bits that should
> > actually be transferred. All child classes of SSI_PERIPHERAL class
> > have
> > transfer functions that, despite accepting a 32-bit tx, only transfer
> > a
> > single byte; m25p80_transfer8(), ssi_sd_transfer(),
> > ssd0323_transfer().
> >
> > The current implementation depends on the SSI model to know
> > what peripheral model will be attached and what transfer size it
> > expects which is error prone. If a SSI_PERIPHERAL model was written
> > that
> > accepted 32-bit transfers, it could not attach to any existing SSI
> > models.
> >
> > This change updates the the naming of ssi_transfer to ssi_transfer8,
> > as
> > well as changes the return value and transmit argument to be 8-bit.
> >
> > Most ssi models handle this correctly already, sending a single byte
> > at
> > a time. There are a few models that are written to support non 8-bit
> > transfers but there are no in-tree use cases that connect a
> > peripheral
> > to the SSI device. These have been updated to use 8-bit transfers.
> >
> > Portia Stephens (4):
> >   hw/ssi: Rename ssi_transfer to ssi_transfer8
> >   hw/ssi/pl022: Fix dropped upper bytes of ssi transfer
> >   hw/arm/strongarm: Fix dropped upper byte of ssi transfer
> >   hw/ssi/pnv_spi: Fix dropped upper bytes of ssi transfer
>
> Thanks!
>
> Applied to riscv-to-apply.next

Would you mind holding off on that until we figure out whether
this is a correct change and why we need it, please?

thanks
-- PMM

