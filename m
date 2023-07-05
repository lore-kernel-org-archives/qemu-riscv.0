Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111BEEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:41:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHC77-00071T-2w; Wed, 05 Jul 2023 19:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1qHC74-00070z-92
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 19:40:47 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1qHC71-0005Dg-G2
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 19:40:45 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1a1fa977667so196056fac.1
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688600441; x=1691192441; 
 h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
 :subject:references:in-reply-to:from:to:cc:subject:date:message-id
 :reply-to; bh=NLLif1KY2D3x/oQIb0fD6DgvzVEwBt9PgSDAy1D7jfw=;
 b=GUqHR3iKA3GKI3FuCSb+pdbJzC8NCKsiIcv9MeUIUvVgtc5fdWqZABfE+K9cmW/amq
 zWhMXjO2ROJtnMmSGMNvotrD3ew37U0nxfF4Jelj+YkaCXP541t0HaQyDY/WF9B5KVpv
 2vGrYoqoPpFqUJQ8w0yLdkhTnnA70PliwOjBBjpciRhQj/2X8fOhvFYpt2UY2s/fvw2n
 5s3fJOmoHlv/Mq3CXmD7kImG0SmvSfQGlGosw3lE3j9EYXQh5r9qyjR6A2KRWpV8zy+G
 ctpYQrsNTFQoR0P8QUxAml2EIsaoejiP7D8UnzHHacxXkal7+h5nkx8ow1tQJSoqc3G2
 5UZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688600441; x=1691192441;
 h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
 :subject:references:in-reply-to:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLLif1KY2D3x/oQIb0fD6DgvzVEwBt9PgSDAy1D7jfw=;
 b=GCJ3u/I/TtrXK03LiwiscBnI1zGnHSdyIW4emBltKfEq8RgLCDGmybmIPOVQZSAD27
 dMyPnD0ZWt0CJ1pP8aPWTaP6qoSMUfiTnZ3cAFjuYjGBvTZZyaonXsIECH3d9D3Jip9M
 v27OGD3JFr49VNTbLoBa2WwbQEjhNsYPdKQMNp3hAOXljPOI+dr+vIwlqT3r5omMWxyP
 OhR18U+O8nxCuPELExo63PF6uRNdinCjdolu5/Kqw0iX0WvBwTBX+ARSs3tAQ933oS03
 n4rPk7uGTWul9fBLupswmpb26FqA2vf3q3DQcI/8Knpvl4xB6YlM5MqXUKgeD1c4ixc/
 TX1Q==
X-Gm-Message-State: ABy/qLZIcgR7KaVTj+57TxhVK/U08MSXV0S9EVSGG0CW/W7w2yb20dQ/
 RMJV58977lZRj3nGupWXaUioTw==
X-Google-Smtp-Source: APBJJlGhY6ik2a9lxlF0RgXnj1DEVnZ0h08AlHINQ5Ed9RK6Pu0MrgIAW8hiIMXydNfQShpu3O117w==
X-Received: by 2002:a05:6870:79e:b0:1a7:e554:500a with SMTP id
 en30-20020a056870079e00b001a7e554500amr631818oab.49.1688600441720; 
 Wed, 05 Jul 2023 16:40:41 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 14-20020a17090a194e00b0025dc5749b4csm2047993pjh.21.2023.07.05.16.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 16:40:41 -0700 (PDT)
In-Reply-To: <20230702-eats-scorebook-c951f170d29f@spud>
References: <20230702-eats-scorebook-c951f170d29f@spud>
Subject: Re: [PATCH v5] dt-bindings: riscv: deprecate riscv,isa
Message-Id: <168860030764.22647.8715497868636301645.b4-ty@rivosinc.com>
Date: Wed, 05 Jul 2023 16:38:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
 Leo <ycliang@andestech.com>, 
 Oleksii <oleksii.kurochko@gmail.com>, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, u-boot@lists.denx.de, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=palmer@rivosinc.com; helo=mail-oa1-x34.google.com
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


On Sun, 02 Jul 2023 00:10:01 +0100, Conor Dooley wrote:
> intro
> =====
> 
> When the RISC-V dt-bindings were accepted upstream in Linux, the base
> ISA etc had yet to be ratified. By the ratification of the base ISA,
> incompatible changes had snuck into the specifications - for example the
> Zicsr and Zifencei extensions were spun out of the base ISA.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: riscv: deprecate riscv,isa
      https://git.kernel.org/palmer/c/aeb71e42caae

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


