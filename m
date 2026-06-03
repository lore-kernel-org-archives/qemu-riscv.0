Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F36CD6E57
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 01:04:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUa1N-0006jo-6P; Tue, 02 Jun 2026 21:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUa1L-0006jI-WF
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 21:03:48 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUa1K-0000Jm-I4
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 21:03:47 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-bec423a5265so598784266b.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 18:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780448625; cv=none;
 d=google.com; s=arc-20240605;
 b=QgrgLrXJ8nbdZ3jCVqrX2GLQzmumHLgA4sdL9XIocquBtdjr5d50TCxGkMtT4XA9bw
 G0P40bX5BHWcRqMLoTqjd+NPpRG0I+iC4nIegIiSPw8nwK0tYmpVNXXzNwqa/ZCoCGDi
 eOm0EiGhUr84lKfdNnAYrhAPOLTzdB4XRhaVRUqAZR7LjtKYj1tjNLKZgt2+oxxGDdWI
 sJ723QMkveSgdUvBvIpH4Yp3WWSy6TbqczCX/68qqHs9cLEAUWXK33bnungWvkl5OgKi
 nCk90LhiBq74SPa5HeCE07s15xn9CibVLElJhq3bQNyE+DIT8i0sftYOMuh79n3c4K+s
 pAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AGKgT1ADvc73GkcOLam8AhKgJtIO4uzN1w6zJXvZOAU=;
 fh=XlusC0So/WA2I0JhkkA8CFn0M4Pc9Y+pS+vcInGdJVQ=;
 b=N1ClUfhLVCDNLiZkjBXEf+/QzlrtvZPwOGLFHUIJAbYJqeo/jF5aOhEprJPe58tJ+n
 2ycW3xQDbT3I1k3hNZMINAmjZNRolEDfKB7iBGD5LBDRYuNakv5r0/b3+Qvuzlj+GmOt
 X5ngYCQRhMyYwqhi3A3MfAnpjGkVv7/d0CKxMCY7+NeWqtwv5U2lLDuzr5C2qIMIEn8Q
 nA8G7UfYe9zQKTLgormCnnDP+bKUXnkcwYPbd4iY+qXKObTdsDLMryCzl3wjxmKe7TSs
 mB9HyUfw6vQI+brCxO6qHL+vU8QFdwxXx4BVGYXxqRwlyA9FDyV1hEuEovc15yp+hViN
 qruA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780448625; x=1781053425; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGKgT1ADvc73GkcOLam8AhKgJtIO4uzN1w6zJXvZOAU=;
 b=HjclmfKixGUSu0q2+7h6aRClq+RvyaqOqG82NDpcx+wWDGWbT62fJS13AGtIS6Beuo
 OdXHGqAlRXi7CF+NbmVQUHUjnSeH4R0TaGcpjQgEUYQ1bvOkCKsYLtcRhtx3kiedq0W6
 K+q1ORsccHlWgFVAvpCDJOpJ516w/s3dtF5VHAvScgKTGwko4009HlKZ8xo7Vxt8NnUp
 KQbuW4UTUSarPQk0hoZ8vsvguRf5OyBl7ZI83lFN1Oq5AmOYtaTt9WW3NzU9KbqxCM1l
 QFwm5Dw520S1iKzdFkK1q65++AhZHE1OmqI+DY1SJMJX6dv24bpTUdmnWh0sweWG82ud
 Jqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780448625; x=1781053425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AGKgT1ADvc73GkcOLam8AhKgJtIO4uzN1w6zJXvZOAU=;
 b=YhP3l5R3owTp7l13e1RZZXzBuzeglTNVuiA7BkXhHxtmHqIoXSYRXrfg1ds+b6QU2i
 G9ueXuiA1ULM/UUdDu6iTTBh6IA4EGZplSSUcwS71g8XF01Net6JukzMevJNHd46pObA
 eFBlRSeOM6frdAX8wh672EIXVAZZmRiHb6D7+U/7j0NB5o4QFIggHv2mWAAFZiUjwI6F
 FE7rqYRbUUaruqb5RV9ZnkQxOKaCjswVcdCHWAWFPvPi+v4eYjxMhGGPqIbfSrBqRoP8
 gu+Lb0gFlTLzsC3XgrIqmayUxwjRTyQGTinp2ZsIu2S458drU/H0CScOTg6JplQ32KKA
 dgeA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9H7F7mjMGeVAVJg7H5Eg2H6VPR+9/a5YaQf10glBq3ajWKJbnRiKRUU6LR9aCHTX6vbWYX8WUCl5nj@nongnu.org
X-Gm-Message-State: AOJu0YwPNMoF0sC0iA1VxjMbXGIm6YiibfuqluYsrdmrqD9O/8vhh+no
 A/fzmSDpbpb+GnFjl/4wMKl+COLJhmXSIHNPYD/dySBNFMlnmrb/07wRABtN6kljndA5equQS/H
 hH84CCIapZYZ8LSu85Slsvd4yd2PB0Us=
X-Gm-Gg: Acq92OH4wvKWonDTln+t60sbVP38z3NBnVte0XnXtuBNaaMPpb+j7xZNo/nNO8VgZwA
 +P0aQsxU7wFkaEbm54Uy588pCeuk+P9gbM8jeZAaToYzk6/igyUA8fyGbEygOUibrhdrxzuimfK
 wv4FERdIhnRunDTuQ20SQy2gs7QV5FAZs6JfsubkhiAoK2oNqhix5eI25nQP65u6uHkQOuBaGrI
 hoslJbA58kbixGsrte3TzA1VZw6tYYJp6ANivM8KuV5uF6jC1890Fc6BMh6Amq1VPMJczVkpfpl
 xh0nSa/Hl9fxO8KlqThzWBXmgnw6HGSHf8xrWHmmPonTpzgt
X-Received: by 2002:a17:907:c499:b0:bed:afd6:9e07 with SMTP id
 a640c23a62f3a-bf0a883b8e4mr39586866b.14.1780448624638; Tue, 02 Jun 2026
 18:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260528060007.717307-1-frank.chang@sifive.com>
In-Reply-To: <20260528060007.717307-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jun 2026 11:03:17 +1000
X-Gm-Features: AVHnY4Istv7XTsP9Es_L2fLY6aEnr5LBncXIUD7-12KrDuE-vZgm8LRyJcw7aRs
Message-ID: <CAKmqyKMaodduh8Ea4AM92tZFaA_h6hyJzBi6Ge1mueydN+TR+Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Reorder Smrnmi CPU fields above CPU reset
 line
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
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

On Thu, May 28, 2026 at 4:01=E2=80=AFPM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Smrnmi CPU fields introduced by commit: #5db557f should be reset when
> the CPU resets, so move these fields above the CPU reset line.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d9c1e000cb2..682c6e752cc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -491,6 +491,15 @@ struct CPUArchState {
>      uint64_t hstateen[SMSTATEEN_MAX_COUNT];
>      uint64_t sstateen[SMSTATEEN_MAX_COUNT];
>      uint64_t henvcfg;
> +
> +    /* RNMI */
> +    uint64_t mnscratch;
> +    uint64_t mnepc;
> +    uint64_t mncause; /* mncause without bit XLEN-1 set to 1 */
> +    uint64_t mnstatus;
> +    uint64_t rnmip;
> +    uint64_t rnmi_irqvec;
> +    uint64_t rnmi_excpvec;
>  #endif
>
>      /* Fields from here on are preserved across CPU reset. */
> @@ -509,15 +518,6 @@ struct CPUArchState {
>      uint64_t kvm_timer_state;
>      uint64_t kvm_timer_frequency;
>  #endif /* CONFIG_KVM */
> -
> -    /* RNMI */
> -    uint64_t mnscratch;
> -    uint64_t mnepc;
> -    uint64_t mncause; /* mncause without bit XLEN-1 set to 1 */
> -    uint64_t mnstatus;
> -    uint64_t rnmip;
> -    uint64_t rnmi_irqvec;
> -    uint64_t rnmi_excpvec;
>  };
>
>  /*
> --
> 2.43.0
>
>

