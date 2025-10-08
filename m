Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5988CCA472
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 14:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6Um1-0004YB-Pb; Wed, 08 Oct 2025 10:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v6Ulv-0004VW-Jw
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 10:04:04 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v6Ulg-0002QM-MU
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 10:04:01 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63163a6556bso16137055a12.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Oct 2025 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759932224; x=1760537024; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0olP/2AkIkCDMmo015JOmyflycM0in2cEbggeW9smg=;
 b=aibz1kcSNWuMqoSPtrvsErqg6MXjWG/k2G0pas2S85u6r98/ROnmn+Fk0NFTY4q3Ie
 9lIwUPXBZiHosNnzYYs6ZVsYEsxRXWn5UKXKLESymr4QizcVZHsgQdThK//1dpZodiuI
 l40T347M0fpJSmVXQvl6xfJaKNtUioVrIHvcymarVVUO96G2hRbMUQ+vqFNP6WDELw9H
 cEVUR1cNs2TmP9rzz5P/D8omirT6MQ5OPGXYVhJuG8ZLzAflsgX/qRXW1oPa/Ja8TFU2
 xyZsonp6eSqtOPpHXaWkjy0gwBhUSHMAZFfl8/GgSoiCQJOuPL2Zt62TKhP2X3w6rbz1
 jGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759932224; x=1760537024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z0olP/2AkIkCDMmo015JOmyflycM0in2cEbggeW9smg=;
 b=s7JKORInTZcApdnL/zE53DT8foiHEqK89EbUpgrFNFNhPNFeSp5uCSOiUla03/0l/w
 T9w1FUZTuFx5ANTHyI7c/hoxGQJUfpPVyVqdpMPpgiPx3ZSOuPyut0j3yLhgyohPY7Kw
 j3rSFzM6nVHMfCnUTKvf5QxSTmc1e1KeZ/VXjnqas6qHamfP6bXWC8ARdg5dq9/ihUk5
 6b7TqmA4di49Rd/f+i5E4CEpHGdKsZC6e2zgXHl+15cFKfnYV06lbUY03fStXzkl8NRA
 xIaJ3QuukSI5ICAPq2OsQ0gskf27e4XdRgoXQu0ywYeJtgi1K1XeTE5TmEi26w2axsMi
 /2kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJt0XH7tKN4E0lVLkz3Fe1ChSSlxWiil8vey0yk/aUDDrFOsWgdHiQaaGtQORefjfkFt2cPqjSshFX@nongnu.org
X-Gm-Message-State: AOJu0Yx2qbeLJ0frHEMKIxoG0ca0IVM1pjGNXVlkIPdNPm69+yYNm2Zs
 STsaOOAU49b5KgQSOD799xLi83JkBGrHfhztVm9jOpZ9aNmA3trjWEReezUowPDZFaC24eyv0Zs
 lFYR3ISV+zjN1gZXKWInB1ANo0i0oxosbSRboowTXlA==
X-Gm-Gg: ASbGncsChYpYVh4m0KqIPcyb5b6tR/Zp0aZuuEF5tPC1/5rIzjuftJfbgu3deave0K0
 2bX1tsAqGVdQNvW4GRaJBY85AjnD/Ua0zB/m7QvSVO/x5i0p3ug9E0CcyRm7L7cw1mCQxvjkeYY
 7GZtYUuTIl4VwB2+/aYXDm8PPZyazjXOIFZ/gB2v4uSbYxUIKnIIXG8tknFvWHZ6Ffac2JiyF5N
 rRWTKSBPjN2VJsF4F8iuBNtlVLmmcwG
X-Google-Smtp-Source: AGHT+IET969eLX4reQPZNvdzkK62iF3KSCeI2CYxfVPVUF046E/jybKgqgDgNh8RA5mk6xUUocjg6SVW2lo30nq5ktg=
X-Received: by 2002:a05:6402:1ed2:b0:639:d9de:3c59 with SMTP id
 4fb4d7f45d1cf-639d9de3ddamr2690009a12.5.1759932224120; Wed, 08 Oct 2025
 07:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251002145742.75624-1-philmd@linaro.org>
 <20251002145742.75624-3-philmd@linaro.org>
In-Reply-To: <20251002145742.75624-3-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 8 Oct 2025 17:03:18 +0300
X-Gm-Features: AS18NWD5b0CqjAHLEmoCaNuUxfgbmOMV-LNi6IphdCC3_xSvOrkzk5qMVdHYhfA
Message-ID: <CAAjaMXbKbAv8EuXOnOp5rWCuYpsP-jZc7UrSFFufKXTg2vA1Kg@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/i386/monitor: Replace legacy
 cpu_physical_memory_read() calls
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
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x529.google.com
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
> Replace:
>
>  - cpu_physical_memory_read(len=3D4) -> address_space_ldl()
>  - cpu_physical_memory_read(len=3D8) -> address_space_ldq()
>
> inlining the little endianness conversion via the '_le' suffix.
> As with the previous implementation, ignore whether the memory
> read succeeded or failed.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

