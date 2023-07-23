Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36F6C001B0
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 22:40:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNhkV-0002dl-H8; Sun, 23 Jul 2023 18:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhkT-0002dD-So; Sun, 23 Jul 2023 18:40:21 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhkS-0005J6-Ce; Sun, 23 Jul 2023 18:40:21 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-765a1690003so301283685a.0; 
 Sun, 23 Jul 2023 15:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690152019; x=1690756819;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEiQW9VLMJFSkcYDze3+dKRbElfPDdLIU7uke2gDCCo=;
 b=REaUkoVBumI4FseOvyOQu8zhvzyOWppKha1Qopy2RD+JboKNIfPm0bajBUWQBGIuAY
 aca9fXIAcNOusxjOQyF89W1SUS/rb4olrSVLJ8rHgOR/X1NCEV2Bo7pik8Aq/h0JbwCS
 sDYQLKqmEuCecFZg1rPbf8jk2BDmcW+B4aVHrEc0gFMAlJ/SGjMp3IaV0iGsg9C/ZB2U
 TvqObpZfcLnscDMN3A62tsONJ8750xZ0ndcbDVpIS5Ry8KEC0M4sYyxU1GCzo+0Egzjv
 SH4zqO/vdqKZ5dDBWjr0vGoVvrRn8U2Z3yTNkbjL4OjH4UoAL034QG3ISwr+a9tJp/ej
 oLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690152019; x=1690756819;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEiQW9VLMJFSkcYDze3+dKRbElfPDdLIU7uke2gDCCo=;
 b=cF2rg/z19qvP5imDfwM8cTFhblh4BC97AFZkCkJrmWsmDT0PZ7s9CPHGx700PLQXy9
 Am5wOgB+KkLYC81PGJEBKJchdqQCyceCvC4RxtmhI9WjsTEqmQlmLk8PcdMtOTwJ2i/O
 GoQXZfPTy9u3be1ywqOOSpz6WPX2/YhG19zLB/1XqX7BvtBalXbzMt/HNSF78cHx0t3Z
 X3lUOZG5JJFYOtrxK+8XxIzh7uZ1sOQBtgWtnEPEea/mC21otofwrCJBOrL0vU4keWu6
 ZWoeEA+R8tLUBSmkNLNtfjW8FYlm2Ji94mKdHPXvnwJ8nXWa55dERgUdGNS/Gmh2gMsx
 LrBQ==
X-Gm-Message-State: ABy/qLYpgL28Cn0AmFRd6q7vCYnD4AWBbpSMk4JzRANmhiiAiHCkRHf4
 c2eH/tT3hF7m6xSo1BXjAs3B8FP9N/zcoOfkTHLhPxlyhY82ZA==
X-Google-Smtp-Source: APBJJlFl0G6n/6sMtiHlLPHlC5yeDaWskVDFI55SwUDht9qKNyeakUScpzTCgH4INhpSpuZw0fuVAwJxTt5XJcUh/Vg=
X-Received: by 2002:a05:620a:4090:b0:767:1cd5:3456 with SMTP id
 f16-20020a05620a409000b007671cd53456mr8598581qko.39.1690152018969; Sun, 23
 Jul 2023 15:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230721133411.474105-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230721133411.474105-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 08:39:53 +1000
Message-ID: <CAKmqyKPL6AkXrQsV_WCm2=B1wF_kgBpTAfH1ckaVA4gLM1sgoQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu.c: do not run 'host' CPU with TCG
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Jul 21, 2023 at 11:35=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The 'host' CPU is available in a CONFIG_KVM build and it's currently
> available for all accels, but is a KVM only CPU. This means that in a
> RISC-V KVM capable host we can do things like this:
>
> $ ./build/qemu-system-riscv64 -M virt,accel=3Dtcg -cpu host --nographic
> qemu-system-riscv64: H extension requires priv spec 1.12.0
>
> This CPU does not have a priv spec because we don't filter its extensions
> via priv spec. We shouldn't be reaching riscv_cpu_realize_tcg() at all
> with the 'host' CPU.
>
> We don't have a way to filter the 'host' CPU out of the available CPU
> options (-cpu help) if the build includes both KVM and TCG. What we can
> do is to error out during riscv_cpu_realize_tcg() if the user chooses
> the 'host' CPU with accel=3Dtcg:
>
> $ ./build/qemu-system-riscv64 -M virt,accel=3Dtcg -cpu host --nographic
> qemu-system-riscv64: 'host' CPU is not compatible with TCG acceleration
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453..08db3d613f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1395,6 +1395,11 @@ static void riscv_cpu_realize_tcg(DeviceState *dev=
, Error **errp)
>      CPURISCVState *env =3D &cpu->env;
>      Error *local_err =3D NULL;
>
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_HOST)) {
> +        error_setg(errp, "'host' CPU is not compatible with TCG accelera=
tion");
> +        return;
> +    }
> +
>      riscv_cpu_validate_misa_mxl(cpu, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> --
> 2.41.0
>
>

