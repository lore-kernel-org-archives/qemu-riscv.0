Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D132EB64DA
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 19:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCQDB-0001bO-QX; Thu, 22 Jun 2023 15:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qCQDA-0001bE-PW
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 15:43:20 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qCQD7-0008VR-V8
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 15:43:20 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3942c6584f0so4985199b6e.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687462994; x=1690054994; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=3T11uxBhIjGWzq3ibADFPBxygIm6nnj3hVsi3PNKGSA=;
 b=xo1/ZwUQaNDkC4rDA90YGndxKNvE0D28jIdXnxVPwuvLsh34JQk/FeE5HsUcSbQC3f
 3WCHDoFRWiV1D229OnTV/wcoeRyigg8efklJh0pkajVzuEcSff3qf9yWkbWcFonOBrCV
 OJM2AQ9VfHH1rVjVNO7MFICuRP1ee3yZpppZweUpiVx2ru21r3+tl0J6Lx/lHrbaeTI2
 7L+DClFsnYxO0/fD2aMargKtjMqSJV9R0hn0l/kJI4quI4qt7hW0OmmT+wcI/nReY5MJ
 22EizoFPM2b1r+jyIYyfPrkiiXo/PfQGmoLVy1oEqB3K9eT9GCMk1nPLCFA6+xn1dMxW
 gkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687462994; x=1690054994;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3T11uxBhIjGWzq3ibADFPBxygIm6nnj3hVsi3PNKGSA=;
 b=AF6Q+jr7wTsMzUxHH3qCyVuGj/lhh9KjqjERFBKVzmpw20X95FFdoDom1wx48Q9UXL
 VdxpWFR7uJS1u0xx83P5b5L1xAszl8syaHjV5TZnJqtXaae6wMTmhIl2jJ5K4IP6K0FA
 wzi1g4YnMXGkwVGCVE36rJbIs868qbeDnyG/dq765LV6nqjMAEODF999DjFcfdqh/df/
 DVsEUIqP9G6D6KGou3eF8gBq3rV5/oGP9iQ+OF126XAXmNPxr4Sf5rztyaH0fSPgS4xw
 ux8PsnA+SOPPOmNTDfkXuDReDgrkwAQbsS1/dbyJNpXR2cXRi8hgDgncsHAKKGMjwupd
 D+Mg==
X-Gm-Message-State: AC+VfDzaOwrtYui5mJsp5GZeOMEF6OhwafsVRURzT7+US9puYhgaEImn
 QqUNSg8mJ3dsBpfEiQemITi2NA==
X-Google-Smtp-Source: ACHHUZ5WaibaXi8GDeiG3MswMLiamw5o+dUTYjXfQhHtuaUX2w3ZX/M/khKv/POfy1MNBzVRFwyCaw==
X-Received: by 2002:a05:6808:20f:b0:3a0:5596:efe8 with SMTP id
 l15-20020a056808020f00b003a05596efe8mr4046410oie.54.1687462994158; 
 Thu, 22 Jun 2023 12:43:14 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 q23-20020a635057000000b0054fd1723554sm5075167pgl.21.2023.06.22.12.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 12:43:13 -0700 (PDT)
Date: Thu, 22 Jun 2023 12:43:13 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 12:42:32 PDT (-0700)
Subject: Re: [PATCH v2] dt-bindings: riscv: deprecate riscv,isa
In-Reply-To: <20230622-stipend-flashily-97917469f39b@spud>
CC: Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, ajones@ventanamicro.com,
 apatel@ventanamicro.com, atishp@atishpatra.org, 
 jrtc27@jrtc27.com, rick@andestech.com, ycliang@andestech.com,
 oleksii.kurochko@gmail.com, 
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-9e03f021-961d-44f3-81c1-9c09abd3662b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=palmer@dabbelt.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, 22 Jun 2023 11:59:32 PDT (-0700), Conor Dooley wrote:
> On Thu, Jun 22, 2023 at 11:25:35AM -0700, Palmer Dabbelt wrote:
>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> I'm not wed to any particular encoding for the properties, IMO that's more
>> of a decision for the DT folks.  IMO the important bit is to just get away
>> from ISA strings and move towards some tightly-specified properties that
>> indicate how the HW actually behaves.
>
> I'm going to resubmit with Rob's list of strings. I'll keep your tags,
> since the spirit of the patch will be the same, with enforced meanings
> for each extension.

Works for me, thanks.

>
> Cheers,
> Conor.

