Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D05FC47073
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 01:02:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLYbq-0005bE-RY; Thu, 04 Jan 2024 20:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1rLYbo-0005ay-IO
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 20:02:48 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1rLYbm-0006o3-Pz
 for qemu-riscv@nongnu.org; Thu, 04 Jan 2024 20:02:48 -0500
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7ba9f24acf8so44408539f.2
 for <qemu-riscv@nongnu.org>; Thu, 04 Jan 2024 17:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704416564; x=1705021364;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rrSjvBY4BTiZpSmOgXlqhETXs16bn4oQNqSgm8JL0+w=;
 b=cHLFdTyXtpdjsdbpkgJRIihGddZXmgH0QxuIzjeMZLKq3LzmLp8pZ341htzcbwQaTm
 5znuKUq7ErGYKmlRdZ3sULJrWUIlQDzaJHelfryWX3I0XORWbrYhBi9MRQ7gnvN3ymSR
 pwn1NB8oSJVrCFz3+ETwlEXu5ArbbnIB9sYNOmkVNgF9lhJ3j/7RJMexGZZXmyncZbPI
 XCUWG5kk4lkldaHr6Jvo2aKOGDHobVkLAJH/vz/Ai+u05tRTKTMCBog3k5If5Gv6UnH1
 YAqnp+8vlp4tHuh624g10eCQvxFq4Xc+oCBmEkpe6IKVrVFumytspJYSFcrUCzYA/DlR
 TbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704416564; x=1705021364;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrSjvBY4BTiZpSmOgXlqhETXs16bn4oQNqSgm8JL0+w=;
 b=Y9JuYqvINQzPwCgB3FvNjSP1s5jG9FAbZQDG5myA10WcArW9GkJbqya1U6BEuEzRgM
 k2IVrwH3W7zPsHxCK3iDQJG4FGfeqW6WIgFBm/Z4cReJ36Rv+53Ou3mbeU/JZcMkk7a5
 T2iOorvb85xa0haTyP//N2uUQh+I6eM1HY0xdfFDJQ9N01KDlmWu3yupvgtd0NIJY451
 Fa8yFhtOu5HHzbzUC+kXECxZLbjTAmUrKGc8qoOQjmG02sGWupxa1vWN27fKx56Uglxh
 fjzFHpcevOAigtQ44ghjsgcB2V9dECNbttOGqqfmUDhPjQM6JshLRB/v+n+uG0HYp+Ei
 LEog==
X-Gm-Message-State: AOJu0Yxk5QIf3uCWth36dSAtPu3+iti6H0iL4zCa5ll8YZTdIPKqVrFq
 L036vBEB7nzlLLkSmG40WRP2TvJqOiqcZQw2OBmLTdDA+lpOnA==
X-Google-Smtp-Source: AGHT+IGOcLgchRIm9nRG6vbO/NBaVpJvcdc3/O5fV8zlTKsmtpHSy4X7hxGJeEP4ExI7THKANHPaGh6BlViuc6Wynpo=
X-Received: by 2002:a6b:f111:0:b0:7b7:5eeb:615e with SMTP id
 e17-20020a6bf111000000b007b75eeb615emr1651884iog.6.1704416564587; Thu, 04 Jan
 2024 17:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-6-me@deliversmonkey.space>
In-Reply-To: <20240103185716.1790546-6-me@deliversmonkey.space>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 4 Jan 2024 17:02:33 -0800
Message-ID: <CAKC1njSMAWV_tPru_E04GfhstfPK3gjeF1PuBtx+VaQqws6uVA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] target/riscv: Update address modify functions to
 take into account pointer masking
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=debug@rivosinc.com; helo=mail-io1-xd35.google.com
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

> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -94,6 +94,18 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
>
>  static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
>  {
> +    RISCVPmPmm pmm = riscv_pm_get_pmm(env);
> +    if (pmm == PMM_FIELD_DISABLED)
> +        return addr;
> +    int pmlen = riscv_pm_get_pmlen(pmm);
> +    bool signext = !riscv_cpu_bare_mode(env);
> +    addr = addr << pmlen;
> +    /* sign/zero extend masked address by N-1 bit */
> +    if (signext) {
> +        addr = (target_long)addr >> pmlen;

These look like right shift operations and not sign extensions of N-1 bit

> +    } else {
> +        addr = addr >> pmlen;

Same here.

> +    }
>      return addr;
>  }
>
> --
> 2.34.1
>
>

