Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837BBCAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 13:58:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6UgS-0002DG-6V; Wed, 08 Oct 2025 09:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v6UgP-0002Cd-HX
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 09:58:21 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v6UgK-0001aT-4H
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 09:58:21 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6395172532fso10686041a12.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Oct 2025 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759931880; x=1760536680; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JADSVj+c05yFM+Bc0BTYO3Nwo6lYEhhOGwtrovfVYiU=;
 b=eKWizcwijF6MnBp9eMiVjoM2PF9yNz6WZ5JSVM2EsNLh8TSfrw16k+e42IkB2CrTga
 5pAIXIVE14olstO/vTuBUkqx7plJjkWBqjb2spHW5Uvg6rEu5eYHRsGWB7oMAii2ER8B
 +88ezoPz+COvtVSqpp0Wm4aF125Z9zFtC5bpICgwzpPYu2iB8Ij8SX+s+jljx49R/sbR
 E9QNqS9K2VcSaL7cEhgayJXJ6KNQIG1qM6Ge1YtpZBOUc91ssH8/sM6so/UmBggNf8R2
 0MKvAZznVZMeCGF02KdR7RgzePa3HdWF8MfVMdSmLIwMk95dOvyp/CSc5ceNz11b4q49
 fQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759931880; x=1760536680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JADSVj+c05yFM+Bc0BTYO3Nwo6lYEhhOGwtrovfVYiU=;
 b=qD8UeS0fi9UjI0HY81AC2wx7GxFBUklR05DRF3hInDI8nMd59BZhUQz29CKjYJ/CdO
 RrJzqlDdZryDwETQyjgsXlHhSd+bIZPmSYpOfvyveCaFcnnIKzZA4sDIx1ilQbZ4y17b
 0DiXsV9KCQ4tzIowhS+H6Tn2VynzZoWQSz6qJzE8VCC1c1FUOLAR5dH4tU1nC/JmfAMD
 uM4MKVX+oBVvJj6L9sWKPoC+sEwKBRTqA4Xw4D9YMoobUmFhehZyuv/jxj1L/5GeqN1Y
 ttGCt0b+s6nObjOrer+vs5EFPWTGGM4hl3+BHDecrq8UmacyBnHtBJuuU/O2zD3WM/07
 4TJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5lYVBDyQmn1uGwkM1bGTihk38m+w9qzinUcO/tsXIxvskLqy9B9e0Q9bcg4wexhR46os1eUm13XVP@nongnu.org
X-Gm-Message-State: AOJu0YwIAWe2hsXg1oEvMS1uqMSysBfn6DcLEgwnGgf4+dZ08+yO7ck9
 1J3SWQg2Mv9qH5/Sqxa8pv6CBLoZTWcW+CMkKPWtOM7U+W1BqwKHvVcGyqAI8m4ZePeXrZN1QUh
 3AEKVdkCnrKc+5khigKKPuTJ7ClYMAbOmVW/BMOz3MQ==
X-Gm-Gg: ASbGnctZV2p4buEEQUaUeQG95KIljj2WAmPhJcC191NVNHyDKm+3mYtmfLAz8X3jkxs
 l6Jqt2T2m3fWBr4WTLOh4vWn1Yt5xTBRLgwceqp5wI4AIptbDAav0KOsURAGUBX32ojjwC66rBc
 TxaDlM5ki7mXkLFZA9mo2qaQenLsURh3eJ1vzBNDixBVHZLtBVkhP36mu/3mGO5aGiiqUj15iAT
 j0osIFdIc5LVCs8V0ZEYrlDaqS6ZF90
X-Google-Smtp-Source: AGHT+IGiVjo3CAeR63KX2SVqyK7ykg1Anc8yWjv2sE3Oh91d+9NbcLu3Y6bxaeDAHnN/ugURX65PftlD7Vc+N/khf+8=
X-Received: by 2002:a17:906:4550:b0:b50:b539:8be6 with SMTP id
 a640c23a62f3a-b50b539915dmr341766266b.43.1759931879628; Wed, 08 Oct 2025
 06:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251002145742.75624-1-philmd@linaro.org>
 <20251002145742.75624-6-philmd@linaro.org>
In-Reply-To: <20251002145742.75624-6-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 8 Oct 2025 16:57:33 +0300
X-Gm-Features: AS18NWDZUUaO0rEwrcvEvdXr3_TRBKTPkeZAvpq_AXmn0SnQrcbShSDZQ0WD6qg
Message-ID: <CAAjaMXZqR_EQ8+UoWjdneUh46_=EvocknhbXKQ-hOV3ePMZcBg@mail.gmail.com>
Subject: Re: [PATCH 5/6] target/xtensa: Replace legacy
 cpu_physical_memory_[un]map() calls
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, 
 Max Filippov <jcmvbkbc@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52e.google.com
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

On Thu, Oct 2, 2025 at 6:00=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Commit b7ecba0f6f6 ("docs/devel/loads-stores.rst: Document our
> various load and store APIs") mentioned cpu_physical_memory_*()
> methods are legacy, the replacement being address_space_*().
>
> Replace the *_map() / *_unmap() methods in the SIMCALL helper,
> using the vCPU default address space. No behavioral change expected.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

