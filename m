Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCB3CAC5B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 00:21:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v31dM-0001eB-Bi; Sun, 28 Sep 2025 20:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v31dI-0001db-AY
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:20:48 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v31dE-00031N-Ri
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:20:47 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b3727611c1bso700976666b.1
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 17:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759105237; x=1759710037; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u36zxouZKT+rHwUvXLtxFiV+fOYrC+5s9xLgLQvKDNU=;
 b=BTgCrfte4GjM+0GUeqdmiobo4RS3tqZeVYJJzhgOQtxYsTAdcp0f/6+UH+LH+qx1q9
 2FtQs5nq2wpLTZKbFp5NQ5q8Cx05tSUIotptTv3uQXTkOi3JH0qhgh+SETp59Gyk9i5t
 478pZ5Zj+k+00h3lUQ339Y3DQ0K/FRKK5gTzmu51nPfXiTWSxyErFDj0tXjaAsBdvyok
 o0gm3Ktw3pZMR1nqgTLwwp3gffyrmDIFdOiv6eVSOVltqEgtSLCa0hdfaIf78fRLTiUE
 2V93lKBOtATqYoelVui6FOv3VZIkX9lhLlqFm4wPbg8lu6mviBwDj+PwAgg83U2g3FW+
 +nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759105237; x=1759710037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u36zxouZKT+rHwUvXLtxFiV+fOYrC+5s9xLgLQvKDNU=;
 b=ZfKfNc2nlOm6nsVRQ/QEno6KzWs4Zjj0sPMUjTPAgT08/I2kNDNjocXVIHUFlgsBnA
 CTpPiMs+25y3bBdvf05sdhXlYcYdwLutVRODV9ypfbn3hX7I70kn3LGHV7e3wzP+EYw4
 j5VHE4RrfRdjQp30sNl7gSdUQGn0dIMZ0k2gCnin/7TADRkSreVlrG/CM6sd8NwHdLCm
 FfVZWQreyevZFSJGJS4o/JfwKqZg+ZEN9bczQ86CY+XrLkNwyCYH3HAN87+xxq3RrTUe
 3rZVJ+LJjmHa4skAp6SqHsYHs3XHflXti8/qE9lag4w0ARWVcT5WWBL5kfWQgqb0dSZz
 8giQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3YetWmPIZKNjGfl4Fgnx7tg1WqwikWPnWQiR87yX5L/OC4CzDSNuMlTqtiUzIUi1gv4LsnUlxylj2@nongnu.org
X-Gm-Message-State: AOJu0YzTKiaZP72gufYqur0moqD143PPE+LnPal+HLI9UpXKzVUJQ8gO
 eKG87R2lqu8zduQFzs7kQlTAjVYaJcwXsf5zJA/FiZ2RwefM2WlOVyPYg0Z1jf1W3BAuu/8xeUG
 BnNArBPKmD6/oYyj2zjttry+r5uBDOOk=
X-Gm-Gg: ASbGnctxU518UcB2YEMQOIO5Ob2xknBPgrOvIsiTJVE0toom5v0B4KO4BEifa2PKEPg
 ppe22NE8LC6YY+KOh19yjmVR2UydRPCzNdM9EjK5NZmTi7E2m8TC/ka4j7P7L9cx1SUR4Mq+f1y
 KdvzdN2xeUry3gjcTcU6RDd19nT3LYNbbEc3slxdlCcJ/A6vDakgUwUcCHA13q84foGE0XQRE2I
 vdf4ImaREG2Ihvp/wNNGwQDdM2xhCHtfbwAxQ==
X-Google-Smtp-Source: AGHT+IF5JsXIRdn5q/Q95uFMvYmK5ZI2fCAM3RL8mcARwSVK8G3Xqv6a/MuzN5DOr1PaLkojvMQy6ICMcYCyaIi+am0=
X-Received: by 2002:a17:906:7304:b0:b3a:b22e:dd35 with SMTP id
 a640c23a62f3a-b3ab22ee9c8mr619460266b.2.1759105237048; Sun, 28 Sep 2025
 17:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250924164515.51782-1-philmd@linaro.org>
In-Reply-To: <20250924164515.51782-1-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:19:00 +1000
X-Gm-Features: AS18NWBmSLYCbkH9z66atXdtZyhAPWoEbevCkJpJewrJ19mE2X0lp1-JaynxcDY
Message-ID: <CAKmqyKNxjvBt=Ft5pFtNySvg5NnS1yAruExwQK=BMpvNqB4F4Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/kvm: Use riscv_cpu_is_32bit() when handling
 SBI_DBCN reg
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 25, 2025 at 2:47=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Use the existing riscv_cpu_is_32bit() helper to check for 32-bit CPU.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 5c19062c19b..187c2c9501e 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1588,7 +1588,7 @@ static void kvm_riscv_handle_sbi_dbcn(CPUState *cs,=
 struct kvm_run *run)
>           * Handle the case where a 32 bit CPU is running in a
>           * 64 bit addressing env.
>           */
> -        if (riscv_cpu_mxl(&cpu->env) =3D=3D MXL_RV32) {
> +        if (riscv_cpu_is_32bit(cpu)) {
>              addr |=3D (uint64_t)run->riscv_sbi.args[2] << 32;
>          }
>
> --
> 2.51.0
>
>

