Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA51CA0FE5
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 15:02:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qc5eC-000351-1X; Fri, 01 Sep 2023 11:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qc5eA-00034a-D5
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 11:01:18 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qc5e6-0003DE-3z
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 11:01:18 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68bed2c786eso1746424b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693580470; x=1694185270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Vh6UICktw4XyRZqdiOs4SpBiz5rdOOCs7MmAwxNtlAw=;
 b=D5OQms8/9MIjpzg/oXCo4wBEjKoQ+1FyUEMwRUxKOwnHEz6mRetgsjYRB1XMU7naou
 wJOkBgVYAfazCzay4eLRoWz1f8p9EMxJRpJqwrTnZsVoclAoPRpkAX3cQ+eHqvUDK5/5
 FW1lagoVK2e+k4Nf6JFiQDM4hfYO4tqy5Kc7Gyu595m56Ht52X7TSHIpbrv3qREGbzf8
 LAF1K8I4TnJ0i2kVlhRYNQdH23m2tRc6vfdfwzeDj9Y57Dt9Ny1bD0E956HQ+UQcco97
 UWsjZPg4zAfeF7vTl2dEFJU75SGksSN23yKr29w54mhom0qu8yCbJ6g7DXmOXNKZfFxC
 /GLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693580470; x=1694185270;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vh6UICktw4XyRZqdiOs4SpBiz5rdOOCs7MmAwxNtlAw=;
 b=YGq8+UNEKGKGlKHiieIM2pYgzvZeNKbWdpjDyRg7JTjNrU8WT24IUw4jVZFaScjjjm
 d2Y6/NTTMmeEUYGOn+v/7XN9g9Tk77gVXxmw87x5bViIGjN3bklPA54xH2OCG4hhzpdx
 KisVR9IhKZlzBausuMKqRBZUGQQ0WY6a3d/csHOqYsbN96bXbrOLN3kAm+L6MWTHsGZD
 78plIGkWSCyoVhpJPSo9jS+P5ZoHVyP+o1pp26bQhRxyqAEbez17jzsvuOkWNCYAsLXs
 OAKQYFc1ORW593o1OMTFFCER3vqwdd+D61RKvsf3+NhgphuJf4FiYgCzVUmr191+LRNF
 tdwg==
X-Gm-Message-State: AOJu0Yy87GiHtP876uXAS48g/UNKVJQ2wtzaGY/qrnahYMzp2Wb0mnWb
 L82Wq7N1iKOf8ZpVMLFbqw6+2g==
X-Google-Smtp-Source: AGHT+IE4NzUbVz10cbnc3UvFNwE81W4DmUgv82e8hyy3rw49QnGuV47AyVwt6PKdewqSLp5pNgX8ZA==
X-Received: by 2002:a05:6a20:3258:b0:148:6ebd:2834 with SMTP id
 hm24-20020a056a20325800b001486ebd2834mr2520491pzc.34.1693580470109; 
 Fri, 01 Sep 2023 08:01:10 -0700 (PDT)
Received: from ?IPv6:2401:4900:52fc:9c89:4352:c7fa:a5a4:5f35?
 ([2401:4900:52fc:9c89:4352:c7fa:a5a4:5f35])
 by smtp.gmail.com with ESMTPSA id
 c9-20020aa78c09000000b0068bff979c33sm3065924pfd.188.2023.09.01.08.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 08:01:09 -0700 (PDT)
Message-ID: <cb9207ad80c0c8dfae677853cd7b0f86ba2ab5bc.camel@ventanamicro.com>
Subject: Re: [PATCH] target/riscv/pmp.c: respect mseccfg.RLB for pmpaddrX
 changes
From: mchitale@ventanamicro.com
To: leon@is.currently.online, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair23@gmail.com>, Leon Schuermann
 <leons@opentitan.org>
Date: Fri, 01 Sep 2023 20:30:55 +0530
In-Reply-To: <20230829215046.1430463-1-leon@is.currently.online>
References: <20230829215046.1430463-1-leon@is.currently.online>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x432.google.com
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

On Tue, 2023-08-29 at 17:50 -0400, leon@is.currently.online wrote:
> From: Leon Schuermann <leons@opentitan.org>
> 
> When the rule-lock bypass (RLB) bit is set in the mseccfg CSR, the
> PMP
> configuration lock bits must not apply. While this behavior is
> implemented for the pmpcfgX CSRs, this bit is not respected for
> changes to the pmpaddrX CSRs. This patch ensures that pmpaddrX CSR
> writes work even on locked regions when the global rule-lock bypass
> is
> enabled.
> 
> Signed-off-by: Leon Schuermann <leons@opentitan.org>
> ---
>  target/riscv/pmp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 9d8db493e6..5e60c26031 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -44,6 +44,10 @@ static inline uint8_t pmp_get_a_field(uint8_t cfg)
>   */
>  static inline int pmp_is_locked(CPURISCVState *env, uint32_t
> pmp_index)
>  {
> +    /* mseccfg.RLB is set */
> +    if (MSECCFG_RLB_ISSET(env)) {
> +        return 0;
> +    }
>  
>      if (env->pmp_state.pmp[pmp_index].cfg_reg & PMP_LOCK) {
>          return 1;
> 
> base-commit: a8fc5165aab02f328ccd148aafec1e59fd1426eb

Reviewed-by: Mayuresh Chitale <mchitale@ventanamicro.com>


