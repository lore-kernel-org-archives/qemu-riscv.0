Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F265A606A32C
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 18:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.a=rsa-sha256 header.s=google header.b=RnSNt7y2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVZ7G-0007vB-Ki; Mon, 23 Nov 2026 13:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ7D-0007kB-MO
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:50:11 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1xVZ7B-0006z5-UH
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 13:50:11 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c3fae9338f0so50289766b.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 10:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459808; cv=none;
 d=google.com; s=arc-20260327;
 b=HsqkyQzDjXF9CIHaOB9mq1B4Pyenl8EgkyoJVshpG2Sxl8MjG6EcKqgwg5L5p0dLbR
 J7A7v42NOClc08wdmvWIZ+ZTzV2UyJUProk+1irb53FMD+bsP6z+Hs5/o94S1QB+t3j9
 G6pFKrynC/WdM/h8WuZAppGsMhPWtDAzL9PGSjtS6dm2r9W5exxmUdx+LgytNXA1eHZc
 jempcJ7Cx/Te5HOWPNBcxmqSvi8bncNKdKuqzSiV1fUVqvbnUmxFSKJXUKrWx8EwqOaZ
 axXcWlMSAVVx25s89/6QP8Djky3qCzgJUzzQScaMdm+pLjiranu+PbZ1CNerng4O4qhE
 grYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CFqHfnP5vbrnPd25wEc603NPjv9J8dV3iJqzuC8Npqk=;
 fh=/NZt8qN+ouD4ymCuudy23ntCseqnT6jfu/eZy1aUxk0=;
 b=pgROPGqg1SeMLN4cKW1E7dojpkF9q6ErQBrs/ofO7f3K6m2YKlW0n9HPQX4PPNtlfz
 sxsfrFC00OMdZIDWrGFyMGX2CDH06smhOYj1wT2Sc2pQgxyScjSyWV3FGcLZ0O4vwCTy
 izDAXygVHsTfk5k7cfrnMThCp1haEiaH/7y6xJqns/YJzaOJA+U1O0CRVSpfnJekltou
 KQ+Ra+3nBXghwzHuAoNBH3npN9cyLmaHkQcU29mG6EqZFXV7lYjHVjALBHbNo0WqHQNd
 VLzjgIue/f82HFPqACW0q7baeAhp8IlXPohXRfejsGFaU8gnaInWWVfxxRjYKdZieqAi
 +Qog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1795459808; x=1796064608; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=CFqHfnP5vbrnPd25wEc603NPjv9J8dV3iJqzuC8Npqk=;
 b=RnSNt7y2/Jqa6UTwlePKLXhiAI7ygcak6qgNk/01LKFZwWo5N4lMT9m58P1sgjeXbD
 5HGeVQciohfx4ydEW/MlOnbqrjUg9FVuyPlxH/XOP+wzPFPBQrlbHb0Uk+oLuml33Oe6
 AGAr3fi7dSj/uWWMO+pEIcs1e1bgwrk4Pz9cxw15vvxl/Dma0oSPlT/7g/LtHZRdjK+Z
 5bbi0YGYXnQQOLSwlm30670l8xzEppxK/4er38EN1oTOSeitTDzrnJVoFH8G0Q5D+4w4
 xDhKq48idJmqY86opTzrxnZySjfazjqPl4r6ceMIAXtOmGaO71dQb40zVqFKdxTNHGNr
 wsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795459808; x=1796064608;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=CFqHfnP5vbrnPd25wEc603NPjv9J8dV3iJqzuC8Npqk=;
 b=FbT6sUDBQ+oM2p9bI/RlDURsFF/1YIJ2g02l0TyS8yoW6zNZKsyi69/7q9W58JJzYq
 jGQe0O46DmWWVDBouM0ipC+wdd/CgWLEe63FgUAU9zCxbCK8wA9qUu1OcL5oDsldpN9T
 jd5gLc6U7rx3nFxBm8iEf8zEVr0+7ULYNiaD6J9cxtMWnAroA/oub64WQCS/hhJRlsNC
 AwKx/AD6WOO2vlkufyyGhy4mKRBQOXPcwq++ufFXQAUHqk4LAP9vdsom6SQz3TjirhsI
 MZr9MW6f9ZKOmDp6BWMp2mQHNIulxhW7zublCACggOzZiWcPj0Hu9qa7BFDJeuMkT1KF
 36UQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHUcuPo3GCrdEPk+N9tPU2rsBlfhRPb/jqWWuY/cNwjwj963kIAC4bGowPVs/dClDvNB0moNgkL+a2U@nongnu.org
X-Gm-Message-State: APuU4Z/QjD25U0b7Du4OVYCCLTh7sIvPA6KGk8vClzYipDX+UfrrFh74
 0Hjr+MTRhBVLwXtKh8eYBbVf/G5jMtCMjXMaFqlPOaFyD6GEraW1My+xCtyENUwC676VFlGzv10
 H1jzLCPbgLNQuD8nTLYB5ZJxfQbxukMawMtxY68NhVg==
X-Gm-Gg: AZFdTZc0mRO9J6mMMI3z9fvi+tHaEyvnKXxc7pHjR0nIkwZWfsdiz/pcAvSEvDg0nOr
 oei2WEgm9xKDXTdx4jQCfdvShuNZmeAB//8X++CuVCBzUr6qDWvZfzerJiu7/Xf0BbO/njL9dRo
 RsxhwBTeYIeGrOANaxAQqN/aMGVwpN9HZ7ZxxrK6bqOHrNbBpItHR+B+OmdfsclrkLE52yiM1qk
 1+CUVEL8lamHOjLB+LPtxI3ZzR9bMdJ2FibhtQT5QuCKiDONzFF+Rz6WM2++K2XElbpYNWXMBpQ
 7qhc1rktfEYVqHA6quzaEt+nfWZXkkZR18HxQvWEVNFhIN6UAtOxWyNnABZ8fL+kISXJFhCPpJB
 jeMXylYzr+/JvsuPz4DLgkNsQYYCFV4RcECuXQCpmq+wQBvhS2sD+bLJJtwOkcxVD3YJWPoHwJn
 fuSxt9ioW0ejDf6A==
X-Received: by 2002:a17:906:811:b0:c51:356c:2657 with SMTP id
 a640c23a62f3a-c513a567c14mr999594966b.3.1795459808403; Mon, 23 Nov 2026
 10:50:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-zl-master-v1-0-129f85e0f887@linux.alibaba.com>
 <20261118-zl-master-v1-5-129f85e0f887@linux.alibaba.com>
In-Reply-To: <20261118-zl-master-v1-5-129f85e0f887@linux.alibaba.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 23 Nov 2026 19:49:57 +0100
X-Gm-Features: Aa3M54o6RqdWWvujxRHu3szrAZq_SoNDq4pXL35kWDyCrYpnmGA1dyhhe6UQAuo
Message-ID: <CAAeLtUAH9QvOG50rJE2Nfi1sFLyn2NrEQLFv_dt8h+_UkeQxSw@mail.gmail.com>
Subject: Re: [PATCH RFC 5/8] target/riscv: Limit instruction bits to the trap
 CSR width
To: TANG Tiancheng <lyndra@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 at 10:03, TANG Tiancheng <lyndra@linux.alibaba.com> wrote:
>
> The instruction bits in env->bins can be wider than the destination trap
> CSR. Keep env->bins intact and limit the reported value to MXLEN for
> mtval or SXLEN for stval.
>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>


> ---
>  target/riscv/tcg/cpu_helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 58e98e975c29106f39074283a79038dbad255fae..568af11d24ccdfaf953a4d27d1a172847a547508 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -2260,7 +2260,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              break;
>          case RISCV_EXCP_ILLEGAL_INST:
>          case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
> -            tval = env->bins;
> +            tval = mxlen == 32 ? (uint32_t)env->bins : env->bins;
>              break;
>          case RISCV_EXCP_BREAKPOINT:
>              tval = env->badaddr;
> @@ -2377,6 +2377,11 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          sxlen = 16 << riscv_cpu_sxl(env);
>          env->scause = cause | ((target_ulong)async << (sxlen - 1));
>          env->sepc = env->pc;
> +        if (!async && sxlen == 32 &&
> +            (cause == RISCV_EXCP_ILLEGAL_INST ||
> +             cause == RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) {
> +            tval = (uint32_t)tval;
> +        }
>          env->stval = tval;
>          env->htval = htval;
>          env->htinst = tinst;
>
> --
> 2.43.0
>
>

