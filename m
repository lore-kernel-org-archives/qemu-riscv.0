Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75E4C98304
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 19:04:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9SGU-0004pq-HG; Wed, 23 Sep 2026 15:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9SGS-0004p9-L1
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 15:04:20 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9SGQ-000499-Ua
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 15:04:20 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d747f05ffdso6265015ad.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790190257; x=1790795057; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z4iz8g9gkDH2MeIuSZb0TKtLzIczJIHBt8h33oQcbxo=;
 b=GiAH752HYLfAdQTw9XVeIZ1OP/hbYx4nom0wXHs50cdUe8WQBnZ9BzsvEk9VoR4ANh
 mBIjsrrVZGpyp9zYxzdFXdSNc3u7k0yXbFU+ctOeACkFz2rSyPm5lxZExZ6ooUi34pMt
 +0XhOrUIZcGfvx3zWVGrpohT6+U4WuWFIUJDiJaVSnV3HjhuH0E+nkBbFgd7rEWRd9Yx
 eUgK+LKh+blEjbHfvXoHXPxZiyLdM28PLoo4ypjdBJuy6cGT9K+NFaj7AAVocz0LPi7L
 8FCAbXBcaNUyMvvxk/Ty210kmqhvTh1jY3CXUSeb+LSGXL+mElZfXyfz8ZGNj7kI5+0X
 V3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790190257; x=1790795057;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z4iz8g9gkDH2MeIuSZb0TKtLzIczJIHBt8h33oQcbxo=;
 b=LlhGTTP5Oi7PW/5L4w9ADGokEXNqukZ6FuWLNAZpsimL3tLFNFfwkQFZRB5ep/RWJz
 bQftL70otGI2f+mXxGhTTXakIBtPZqOK4we21WHTyXqooEdhC3hM4V6FxhPbVK7wVuoQ
 n14VWdcMtuNi+E18HN6nFBo/4tRCu7887NuD708K5gWvyqMr3G+f6k8Ecz2YN5TsPr2h
 FUTS+SGtaXyW3euavjACpVIQ3XvqFB7T4uekz9AIvZdEUQLxeWtmEn9RW/uA7FI7+E1p
 kEhXTPwMVA4aLefvZGWtj+I7U/bClS3iXeRrycgIfMJviHzKZs7WIOChuQyyLzYC7ela
 dMLQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxXAYKI68fBO0FM19lAh2v2C+AP2n9CV811mz+bDQsP18ljDp6TOyrWSz05J8GCfUEX5Nxb/29/OfQE@nongnu.org
X-Gm-Message-State: AFuF++mJAPxZTPhfL3FB0OPHhUpCyXrJZ19AQE4uIksb3+gfDzGvHwMF
 sYb+v/rPT+7UKt7se882IZW+yIm4cSpCea+VX78GjbDd2vESYBGdgVH6MCsYVSieRKc=
X-Gm-Gg: AYBFou0eu3GIUNHcD7WweG0tKneOioyWPu71VFZ0xeXTKsUYPVlpHKs7TT1F5+qXbnK
 5aax76+42C+sABC05h9wD/Lan92cG7zTAWsgWvkDxUFi6MhSyRFyzpcI/l/AN3ESEqrIfud/2EL
 QEAD08WtYvLJECH92DeOl3CGPQfCAu90aIdU9Z6CeXuU6LpsRzEjlfzZdBhUqppjdLIM1B740YY
 PHnhYdYryRkSGSTAjE8aNDwMrziGi5on7LH0nAYWJjP39UhGDAFW5wmRyy+XFTabhQnncItn/iQ
 sg05B7EuPsVYyyK+6hGpjefh/Xes1zj24ZF/eBR8hNuhjWxXPjZ2fgf3GWeiYcVKqGjiDpyriqX
 kA6AOgBeTmK0o7pitoeTKaiwMVUCMEjuPnoEcMN1tmHMPsUzVDVpujEl8nsm2MYZnHoi8l6xJSt
 Cuda0mdKbdCjnejbfo/fkfwa4IbfYFtzfldu2sZfDuoUpWWw/JQy6xZi7asUvBBgaJc/60dmtjs
 YXHw4ZII+oFkZ7dK9imHx+IqaV7Nt+x5qYa0fQDf7vVpVwLhTzv8T2ZGxV78A==
X-Received: by 2002:a17:903:15c8:b0:2d9:1dee:43e3 with SMTP id
 d9443c01a7336-2df7e28a7b5mr511765ad.18.1790190257292; 
 Wed, 23 Sep 2026 12:04:17 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df6a5a6d35sm15637055ad.19.2026.09.23.12.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 12:04:16 -0700 (PDT)
Message-ID: <63722207-a94d-4035-9d01-b9cdc47423c1@linaro.org>
Date: Wed, 23 Sep 2026 12:04:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/21] target/riscv: Add riscv_cpu_get_mip()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
 <20260923171116.31276-12-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260923171116.31276-12-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/23/26 10:11, Philippe Mathieu-Daudé wrote:
> @@ -554,6 +559,7 @@ void riscv_cpu_interrupt(CPURISCVState *env)
>   {
>       uint64_t gein, vsgein = 0, vstip = 0, irqf = 0;
>       CPUState *cs = env_cpu(env);
> +    uint64_t mip = riscv_cpu_get_mip(env);
>   
>       BQL_LOCK_GUARD();
>   

You don't want to move any reads outside the lock.


r~

